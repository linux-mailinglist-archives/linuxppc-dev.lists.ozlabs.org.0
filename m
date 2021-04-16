Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95392361878
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 05:59:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FM2X333YGz3byd
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 13:59:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=201602 header.b=Z1c6C46e;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=dgibson@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au
 header.a=rsa-sha256 header.s=201602 header.b=Z1c6C46e; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FM2Wd2fq7z2yRK
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Apr 2021 13:58:53 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FM2WW5l0wz9sW4; Fri, 16 Apr 2021 13:58:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1618545527;
 bh=9BjlqH5r6weJwuCUXGxiH9uLf3jEAU4a8RvmtNKkjcM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Z1c6C46e7WHByMXLXbu8Wfek2AkkZjsEHT27fdMAzHfCfWgFxelOGPgE9JrvXexw/
 VohTQTKych58VMNSJoWtuBdyZX8IYJiGPL8oBobsiAGtBdaJEFXIOPEJ9MybtDu6Vy
 pxAzxUG3JBQb77RD2xT+pJmuPaxR2pIAkb0ReOqA=
Date: Fri, 16 Apr 2021 13:21:34 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH 1/3] powerpc/smp: Reintroduce cpu_core_mask
Message-ID: <YHkCvuNfZLQRxjU8@yekko.fritz.box>
References: <20210415120934.232271-1-srikar@linux.vnet.ibm.com>
 <20210415120934.232271-2-srikar@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="rQ4uZrbDJBqhLe/p"
Content-Disposition: inline
In-Reply-To: <20210415120934.232271-2-srikar@linux.vnet.ibm.com>
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 Gautham R Shenoy <ego@linux.vnet.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Valentin Schneider <valentin.schneider@arm.com>, qemu-ppc@nongnu.org,
 Cedric Le Goater <clg@kaod.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--rQ4uZrbDJBqhLe/p
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 15, 2021 at 05:39:32PM +0530, Srikar Dronamraju wrote:
> Daniel reported that with Commit 4ca234a9cbd7 ("powerpc/smp: Stop
> updating cpu_core_mask") QEMU was unable to set single NUMA node SMP
> topologies such as:
>  -smp 8,maxcpus=3D8,cores=3D2,threads=3D2,sockets=3D2
>  i.e he expected 2 sockets in one NUMA node.

Well, strictly speaking, you can still set that toplogy in qemu but a
PAPR guest with that commit will show as having 1 socket in lscpu and
similar things.

Basically, this is because PAPR has no meaningful distinction between
cores and sockets.  So it's kind of a cosmetic problem, but it is a
user-unexpected behaviour that it would be nice to avoid if it's not
excessively difficult.

> The above commit helped to reduce boot time on Large Systems for
> example 4096 vCPU single socket QEMU instance. PAPR is silent on
> having more than one socket within a NUMA node.
>=20
> cpu_core_mask and cpu_cpu_mask for any CPU would be same unless the
> number of sockets is different from the number of NUMA nodes.

Number of sockets being different from number of NUMA nodes is routine
in qemu, and I don't think it's something we should enforce.

> One option is to reintroduce cpu_core_mask but use a slightly
> different method to arrive at the cpu_core_mask. Previously each CPU's
> chip-id would be compared with all other CPU's chip-id to verify if
> both the CPUs were related at the chip level. Now if a CPU 'A' is
> found related / (unrelated) to another CPU 'B', all the thread
> siblings of 'A' and thread siblings of 'B' are automatically marked as
> related / (unrelated).
>=20
> Also if a platform doesn't support ibm,chip-id property, i.e its
> cpu_to_chip_id returns -1, cpu_core_map holds a copy of
> cpu_cpu_mask().

Yeah, the other weirdness here is that ibm,chip-id isn't a PAPR
property at all - it was added for powernv.  We then added it to qemu
for PAPR guests because that was the way at the time to get the guest
to advertise the expected number of sockets.  It therefore basically
*only* exists on PAPR/qemu for that purpose, so if it's not serving it
we need to come up with something else.

>=20
> Fixes: 4ca234a9cbd7 ("powerpc/smp: Stop updating cpu_core_mask")
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: qemu-ppc@nongnu.org
> Cc: Cedric Le Goater <clg@kaod.org>
> Cc: David Gibson <david@gibson.dropbear.id.au>
> Cc: Nathan Lynch <nathanl@linux.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Ingo Molnar <mingo@kernel.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Valentin Schneider <valentin.schneider@arm.com>
> Cc: Gautham R Shenoy <ego@linux.vnet.ibm.com>
> Reported-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
> ---
>  arch/powerpc/include/asm/smp.h |  5 +++++
>  arch/powerpc/kernel/smp.c      | 39 ++++++++++++++++++++++++++++------
>  2 files changed, 37 insertions(+), 7 deletions(-)
>=20
> diff --git a/arch/powerpc/include/asm/smp.h b/arch/powerpc/include/asm/sm=
p.h
> index 7a13bc20f0a0..47081a9e13ca 100644
> --- a/arch/powerpc/include/asm/smp.h
> +++ b/arch/powerpc/include/asm/smp.h
> @@ -121,6 +121,11 @@ static inline struct cpumask *cpu_sibling_mask(int c=
pu)
>  	return per_cpu(cpu_sibling_map, cpu);
>  }
> =20
> +static inline struct cpumask *cpu_core_mask(int cpu)
> +{
> +	return per_cpu(cpu_core_map, cpu);
> +}
> +
>  static inline struct cpumask *cpu_l2_cache_mask(int cpu)
>  {
>  	return per_cpu(cpu_l2_cache_map, cpu);
> diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
> index 5a4d59a1070d..5c7ce1d50631 100644
> --- a/arch/powerpc/kernel/smp.c
> +++ b/arch/powerpc/kernel/smp.c
> @@ -1057,17 +1057,12 @@ void __init smp_prepare_cpus(unsigned int max_cpu=
s)
>  				local_memory_node(numa_cpu_lookup_table[cpu]));
>  		}
>  #endif
> -		/*
> -		 * cpu_core_map is now more updated and exists only since
> -		 * its been exported for long. It only will have a snapshot
> -		 * of cpu_cpu_mask.
> -		 */
> -		cpumask_copy(per_cpu(cpu_core_map, cpu), cpu_cpu_mask(cpu));
>  	}
> =20
>  	/* Init the cpumasks so the boot CPU is related to itself */
>  	cpumask_set_cpu(boot_cpuid, cpu_sibling_mask(boot_cpuid));
>  	cpumask_set_cpu(boot_cpuid, cpu_l2_cache_mask(boot_cpuid));
> +	cpumask_set_cpu(boot_cpuid, cpu_core_mask(boot_cpuid));
> =20
>  	if (has_coregroup_support())
>  		cpumask_set_cpu(boot_cpuid, cpu_coregroup_mask(boot_cpuid));
> @@ -1408,6 +1403,9 @@ static void remove_cpu_from_masks(int cpu)
>  			set_cpus_unrelated(cpu, i, cpu_smallcore_mask);
>  	}
> =20
> +	for_each_cpu(i, cpu_core_mask(cpu))
> +		set_cpus_unrelated(cpu, i, cpu_core_mask);
> +
>  	if (has_coregroup_support()) {
>  		for_each_cpu(i, cpu_coregroup_mask(cpu))
>  			set_cpus_unrelated(cpu, i, cpu_coregroup_mask);
> @@ -1468,8 +1466,11 @@ static void update_coregroup_mask(int cpu, cpumask=
_var_t *mask)
> =20
>  static void add_cpu_to_masks(int cpu)
>  {
> +	struct cpumask *(*submask_fn)(int) =3D cpu_sibling_mask;
>  	int first_thread =3D cpu_first_thread_sibling(cpu);
> +	int chip_id =3D cpu_to_chip_id(cpu);
>  	cpumask_var_t mask;
> +	bool ret;
>  	int i;
> =20
>  	/*
> @@ -1485,12 +1486,36 @@ static void add_cpu_to_masks(int cpu)
>  	add_cpu_to_smallcore_masks(cpu);
> =20
>  	/* In CPU-hotplug path, hence use GFP_ATOMIC */
> -	alloc_cpumask_var_node(&mask, GFP_ATOMIC, cpu_to_node(cpu));
> +	ret =3D alloc_cpumask_var_node(&mask, GFP_ATOMIC, cpu_to_node(cpu));
>  	update_mask_by_l2(cpu, &mask);
> =20
>  	if (has_coregroup_support())
>  		update_coregroup_mask(cpu, &mask);
> =20
> +	if (chip_id =3D=3D -1 || !ret) {
> +		cpumask_copy(per_cpu(cpu_core_map, cpu), cpu_cpu_mask(cpu));
> +		goto out;
> +	}
> +
> +	if (shared_caches)
> +		submask_fn =3D cpu_l2_cache_mask;
> +
> +	/* Update core_mask with all the CPUs that are part of submask */
> +	or_cpumasks_related(cpu, cpu, submask_fn, cpu_core_mask);
> +
> +	/* Skip all CPUs already part of current CPU core mask */
> +	cpumask_andnot(mask, cpu_online_mask, cpu_core_mask(cpu));
> +
> +	for_each_cpu(i, mask) {
> +		if (chip_id =3D=3D cpu_to_chip_id(i)) {
> +			or_cpumasks_related(cpu, i, submask_fn, cpu_core_mask);
> +			cpumask_andnot(mask, mask, submask_fn(i));
> +		} else {
> +			cpumask_andnot(mask, mask, cpu_core_mask(i));
> +		}
> +	}
> +
> +out:
>  	free_cpumask_var(mask);
>  }
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--rQ4uZrbDJBqhLe/p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmB5ArwACgkQbDjKyiDZ
s5INsw/9HPEYbCv++x2h8Ofp8MqOfenTx8DmqR6/G2Qmgk8mxu6NMgD4S80o7CfV
bh43AHmL7SiASf91yngA6+vLfCxZOGim/l2CP1i/hSc0EjEvEzYVOl+uVykkpBS+
oMWaXYWkuWmj4kBb3z1NHHIbppxZ90GwkvaD1SI7y80tTscIW9KJ5udUW+nFURxX
drQ+7LZl6TSYWGiRPoK9j/N4z4UHxZ/gvnxexEwGGj45LxU5LxMux0O8cX9UxMB2
CylOOqDrX+YlLl3YVjMZb8JuME+r+Zh2yoWAZiQzxBnE82qE9eMozVIq+9NgNxgN
S9SaTrb2B2yLCSIX6KndZi8vaU7QIW3/dbHjtBV0KCNN/ZFlPnaK6E7rM+gXxzG1
H1+k0rEEYocStfhX6Sp5uNIE15KwYXCgRU5CFfGOYa2K256YBV5h4Vn+AXPjD8EG
bFt8s7jxKi4q+3Li7ap+T/PAY153yXGJxqp9D3VTByxOj0VN/fp0V2/Tp3VrqITE
oxwhenMqEKHEWvaJOSQdayk0JZW6AsGSOZ+ShUuy884jKFRrnDrMvt26HVil9WYg
dDzG0HVWG9ENuexj3kb16FOxhT3mh49SV/C39EDHEyEjiQmAz2reiaiJOzHB2eEb
3rgyJpL0uAlVxjr6mKYQ1rz3YHyIRnJy1QKzFs0i5bfgjiUidx8=
=usdS
-----END PGP SIGNATURE-----

--rQ4uZrbDJBqhLe/p--
