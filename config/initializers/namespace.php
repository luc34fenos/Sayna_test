namespace MTC


class VehiculeFactory{

	public static function getCar ($type){
		$class = __NAMESPACE__. '\\'. ucfirst($type);
		$object = new $class();
		$object- paint('red');

		return $object;
	}
}