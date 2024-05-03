Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D1BD8BAB0D
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2024 12:53:23 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=UUg9zGqV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VW72863RPz3fCg
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2024 20:53:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=UUg9zGqV;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VW71R5lBpz3cX6
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 May 2024 20:52:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1714733563;
	bh=ZfARJMAeGDHwnZr6jfrWnf7G0nl1Vx+4p8TBupYAP6o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=UUg9zGqV+ytbffMvCVS4hkNJIluh/NOrs7h6CuV+eD39RrpcbOvTBd0cEIn5iCcDX
	 WIqe/qqYuTfVkwcNpQXWCBMIJAUePcYyav0Rr33fookbEY5QGOldaDvU/XsE8OdLEr
	 rOzEQAjbsSqvBdNalODkfDIRLukSNmUA3ghhqyYLzVnU6FnSEiCO08246ZFLvAB02H
	 J0eLhXUIl9rC+IftNynU9RufML6sGvzAAdZoXE0muQy5xQwkS9APiIu1UkymfIqmfN
	 96kt6hHTHGD98QtQbu+4GfAhJDWKOds0QU9OLwE5UVrNjqaCcduZPoZFx+XwhmZoLe
	 KBuxApvwjnGJA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VW71R4qZBz4x0C;
	Fri,  3 May 2024 20:52:43 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] Fix the address of the linuxppc-dev mailing list
In-Reply-To: <20240503121012.3ba5000b@canb.auug.org.au>
References: <20240503121012.3ba5000b@canb.auug.org.au>
Date: Fri, 03 May 2024 20:52:43 +1000
Message-ID: <87ikzvupz8.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Linux for PowerPC mailing list <linuxppc-dev@lists.ozlabs.org>, Linux kernel mailing list <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Stephen Rothwell <sfr@canb.auug.org.au> writes:
> This list was moved many years ago.
>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  Documentation/ABI/testing/sysfs-devices-system-cpu | 14 +++++++-------
>  .../ABI/testing/sysfs-firmware-opal-powercap       |  4 ++--
>  Documentation/ABI/testing/sysfs-firmware-opal-psr  |  4 ++--
>  .../ABI/testing/sysfs-firmware-opal-sensor-groups  |  4 ++--
>  .../testing/sysfs-firmware-papr-energy-scale-info  | 10 +++++-----
>  5 files changed, 18 insertions(+), 18 deletions(-)

These are mostly powerpc specific files so I can take this.

cheers

> diff --git a/Documentation/ABI/testing/sysfs-devices-system-cpu b/Documentation/ABI/testing/sysfs-devices-system-cpu
> index 710d47be11e0..e7e160954e79 100644
> --- a/Documentation/ABI/testing/sysfs-devices-system-cpu
> +++ b/Documentation/ABI/testing/sysfs-devices-system-cpu
> @@ -423,7 +423,7 @@ What:		/sys/devices/system/cpu/cpuX/cpufreq/throttle_stats
>  		/sys/devices/system/cpu/cpuX/cpufreq/throttle_stats/occ_reset
>  Date:		March 2016
>  Contact:	Linux kernel mailing list <linux-kernel@vger.kernel.org>
> -		Linux for PowerPC mailing list <linuxppc-dev@ozlabs.org>
> +		Linux for PowerPC mailing list <linuxppc-dev@lists.ozlabs.org>
>  Description:	POWERNV CPUFreq driver's frequency throttle stats directory and
>  		attributes
>  
> @@ -473,7 +473,7 @@ What:		/sys/devices/system/cpu/cpufreq/policyX/throttle_stats
>  		/sys/devices/system/cpu/cpufreq/policyX/throttle_stats/occ_reset
>  Date:		March 2016
>  Contact:	Linux kernel mailing list <linux-kernel@vger.kernel.org>
> -		Linux for PowerPC mailing list <linuxppc-dev@ozlabs.org>
> +		Linux for PowerPC mailing list <linuxppc-dev@lists.ozlabs.org>
>  Description:	POWERNV CPUFreq driver's frequency throttle stats directory and
>  		attributes
>  
> @@ -608,7 +608,7 @@ Description:	Umwait control
>  What:		/sys/devices/system/cpu/svm
>  Date:		August 2019
>  Contact:	Linux kernel mailing list <linux-kernel@vger.kernel.org>
> -		Linux for PowerPC mailing list <linuxppc-dev@ozlabs.org>
> +		Linux for PowerPC mailing list <linuxppc-dev@lists.ozlabs.org>
>  Description:	Secure Virtual Machine
>  
>  		If 1, it means the system is using the Protected Execution
> @@ -617,7 +617,7 @@ Description:	Secure Virtual Machine
>  
>  What:		/sys/devices/system/cpu/cpuX/purr
>  Date:		Apr 2005
> -Contact:	Linux for PowerPC mailing list <linuxppc-dev@ozlabs.org>
> +Contact:	Linux for PowerPC mailing list <linuxppc-dev@lists.ozlabs.org>
>  Description:	PURR ticks for this CPU since the system boot.
>  
>  		The Processor Utilization Resources Register (PURR) is
> @@ -628,7 +628,7 @@ Description:	PURR ticks for this CPU since the system boot.
>  
>  What: 		/sys/devices/system/cpu/cpuX/spurr
>  Date:		Dec 2006
> -Contact:	Linux for PowerPC mailing list <linuxppc-dev@ozlabs.org>
> +Contact:	Linux for PowerPC mailing list <linuxppc-dev@lists.ozlabs.org>
>  Description:	SPURR ticks for this CPU since the system boot.
>  
>  		The Scaled Processor Utilization Resources Register
> @@ -640,7 +640,7 @@ Description:	SPURR ticks for this CPU since the system boot.
>  
>  What: 		/sys/devices/system/cpu/cpuX/idle_purr
>  Date:		Apr 2020
> -Contact:	Linux for PowerPC mailing list <linuxppc-dev@ozlabs.org>
> +Contact:	Linux for PowerPC mailing list <linuxppc-dev@lists.ozlabs.org>
>  Description:	PURR ticks for cpuX when it was idle.
>  
>  		This sysfs interface exposes the number of PURR ticks
> @@ -648,7 +648,7 @@ Description:	PURR ticks for cpuX when it was idle.
>  
>  What: 		/sys/devices/system/cpu/cpuX/idle_spurr
>  Date:		Apr 2020
> -Contact:	Linux for PowerPC mailing list <linuxppc-dev@ozlabs.org>
> +Contact:	Linux for PowerPC mailing list <linuxppc-dev@lists.ozlabs.org>
>  Description:	SPURR ticks for cpuX when it was idle.
>  
>  		This sysfs interface exposes the number of SPURR ticks
> diff --git a/Documentation/ABI/testing/sysfs-firmware-opal-powercap b/Documentation/ABI/testing/sysfs-firmware-opal-powercap
> index c9b66ec4f165..d2d12ee89288 100644
> --- a/Documentation/ABI/testing/sysfs-firmware-opal-powercap
> +++ b/Documentation/ABI/testing/sysfs-firmware-opal-powercap
> @@ -1,6 +1,6 @@
>  What:		/sys/firmware/opal/powercap
>  Date:		August 2017
> -Contact:	Linux for PowerPC mailing list <linuxppc-dev@ozlabs.org>
> +Contact:	Linux for PowerPC mailing list <linuxppc-dev@lists.ozlabs.org>
>  Description:	Powercap directory for Powernv (P8, P9) servers
>  
>  		Each folder in this directory contains a
> @@ -11,7 +11,7 @@ What:		/sys/firmware/opal/powercap/system-powercap
>  		/sys/firmware/opal/powercap/system-powercap/powercap-max
>  		/sys/firmware/opal/powercap/system-powercap/powercap-current
>  Date:		August 2017
> -Contact:	Linux for PowerPC mailing list <linuxppc-dev@ozlabs.org>
> +Contact:	Linux for PowerPC mailing list <linuxppc-dev@lists.ozlabs.org>
>  Description:	System powercap directory and attributes applicable for
>  		Powernv (P8, P9) servers
>  
> diff --git a/Documentation/ABI/testing/sysfs-firmware-opal-psr b/Documentation/ABI/testing/sysfs-firmware-opal-psr
> index cc2ece70e365..1e55b56a0f89 100644
> --- a/Documentation/ABI/testing/sysfs-firmware-opal-psr
> +++ b/Documentation/ABI/testing/sysfs-firmware-opal-psr
> @@ -1,6 +1,6 @@
>  What:		/sys/firmware/opal/psr
>  Date:		August 2017
> -Contact:	Linux for PowerPC mailing list <linuxppc-dev@ozlabs.org>
> +Contact:	Linux for PowerPC mailing list <linuxppc-dev@lists.ozlabs.org>
>  Description:	Power-Shift-Ratio directory for Powernv P9 servers
>  
>  		Power-Shift-Ratio allows to provide hints the firmware
> @@ -10,7 +10,7 @@ Description:	Power-Shift-Ratio directory for Powernv P9 servers
>  
>  What:		/sys/firmware/opal/psr/cpu_to_gpu_X
>  Date:		August 2017
> -Contact:	Linux for PowerPC mailing list <linuxppc-dev@ozlabs.org>
> +Contact:	Linux for PowerPC mailing list <linuxppc-dev@lists.ozlabs.org>
>  Description:	PSR sysfs attributes for Powernv P9 servers
>  
>  		Power-Shift-Ratio between CPU and GPU for a given chip
> diff --git a/Documentation/ABI/testing/sysfs-firmware-opal-sensor-groups b/Documentation/ABI/testing/sysfs-firmware-opal-sensor-groups
> index 3a2dfe542e8c..fcb1fb4795b6 100644
> --- a/Documentation/ABI/testing/sysfs-firmware-opal-sensor-groups
> +++ b/Documentation/ABI/testing/sysfs-firmware-opal-sensor-groups
> @@ -1,6 +1,6 @@
>  What:		/sys/firmware/opal/sensor_groups
>  Date:		August 2017
> -Contact:	Linux for PowerPC mailing list <linuxppc-dev@ozlabs.org>
> +Contact:	Linux for PowerPC mailing list <linuxppc-dev@lists.ozlabs.org>
>  Description:	Sensor groups directory for POWER9 powernv servers
>  
>  		Each folder in this directory contains a sensor group
> @@ -11,7 +11,7 @@ Description:	Sensor groups directory for POWER9 powernv servers
>  
>  What:		/sys/firmware/opal/sensor_groups/<sensor_group_name>/clear
>  Date:		August 2017
> -Contact:	Linux for PowerPC mailing list <linuxppc-dev@ozlabs.org>
> +Contact:	Linux for PowerPC mailing list <linuxppc-dev@lists.ozlabs.org>
>  Description:	Sysfs file to clear the min-max of all the sensors
>  		belonging to the group.
>  
> diff --git a/Documentation/ABI/testing/sysfs-firmware-papr-energy-scale-info b/Documentation/ABI/testing/sysfs-firmware-papr-energy-scale-info
> index 141a6b371469..f5cefb81ac9d 100644
> --- a/Documentation/ABI/testing/sysfs-firmware-papr-energy-scale-info
> +++ b/Documentation/ABI/testing/sysfs-firmware-papr-energy-scale-info
> @@ -1,6 +1,6 @@
>  What:		/sys/firmware/papr/energy_scale_info
>  Date:		February 2022
> -Contact:	Linux for PowerPC mailing list <linuxppc-dev@ozlabs.org>
> +Contact:	Linux for PowerPC mailing list <linuxppc-dev@lists.ozlabs.org>
>  Description:	Directory hosting a set of platform attributes like
>  		energy/frequency on Linux running as a PAPR guest.
>  
> @@ -10,20 +10,20 @@ Description:	Directory hosting a set of platform attributes like
>  
>  What:		/sys/firmware/papr/energy_scale_info/<id>
>  Date:		February 2022
> -Contact:	Linux for PowerPC mailing list <linuxppc-dev@ozlabs.org>
> +Contact:	Linux for PowerPC mailing list <linuxppc-dev@lists.ozlabs.org>
>  Description:	Energy, frequency attributes directory for POWERVM servers
>  
>  What:		/sys/firmware/papr/energy_scale_info/<id>/desc
>  Date:		February 2022
> -Contact:	Linux for PowerPC mailing list <linuxppc-dev@ozlabs.org>
> +Contact:	Linux for PowerPC mailing list <linuxppc-dev@lists.ozlabs.org>
>  Description:	String description of the energy attribute of <id>
>  
>  What:		/sys/firmware/papr/energy_scale_info/<id>/value
>  Date:		February 2022
> -Contact:	Linux for PowerPC mailing list <linuxppc-dev@ozlabs.org>
> +Contact:	Linux for PowerPC mailing list <linuxppc-dev@lists.ozlabs.org>
>  Description:	Numeric value of the energy attribute of <id>
>  
>  What:		/sys/firmware/papr/energy_scale_info/<id>/value_desc
>  Date:		February 2022
> -Contact:	Linux for PowerPC mailing list <linuxppc-dev@ozlabs.org>
> +Contact:	Linux for PowerPC mailing list <linuxppc-dev@lists.ozlabs.org>
>  Description:	String value of the energy attribute of <id>
> -- 
> 2.43.0
>
> -- 
> Cheers,
> Stephen Rothwell
