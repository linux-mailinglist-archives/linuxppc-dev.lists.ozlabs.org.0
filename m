Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 27BCDAF4CA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2019 06:06:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46SpHY44KNzF1pP
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2019 14:06:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46SpFh0TPPzDrR4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Sep 2019 14:04:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=gibson.dropbear.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au
 header.b="SpchflrT"; dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1007)
 id 46SpFg44ZJz9sNF; Wed, 11 Sep 2019 14:04:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1568174695;
 bh=ayfI3+83K7LVh3gr6R9z9ZZTmmQBatKbBg3rQx13JJI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SpchflrTxM3DzIq+3riwfeJgRn8TQa+mUik6YCiG7pI/h3ChXWcjqWOC8wjYoQWWC
 lLLJqyIv7CwSSYB95Q1jq1yRj5YuLTwoq2AG0/xC2qdzS5I1LJdlg2DG/rZL9GDwtv
 M0gola/ncTJb8kMbdjXqxZ4IzEQ+hO/fI6B0mQu4=
Date: Wed, 11 Sep 2019 12:30:48 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH] KVM: PPC: Book3S HV: Tunable to configure maximum # of
 vCPUs per VM
Message-ID: <20190911023048.GI30740@umbus.fritz.box>
References: <156813417397.1880979.6162333671088177553.stgit@bahia.tls.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="nO3oAMapP4dBpMZi"
Content-Disposition: inline
In-Reply-To: <156813417397.1880979.6162333671088177553.stgit@bahia.tls.ibm.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
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
Cc: kvm@vger.kernel.org, kvm-ppc@vger.kernel.org,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--nO3oAMapP4dBpMZi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 10, 2019 at 06:49:34PM +0200, Greg Kurz wrote:
> Each vCPU of a VM allocates a XIVE VP in OPAL which is associated with
> 8 event queue (EQ) descriptors, one for each priority. A POWER9 socket
> can handle a maximum of 1M event queues.
>=20
> The powernv platform allocates NR_CPUS (=3D=3D 2048) VPs for the hypervis=
or,
> and each XIVE KVM device allocates KVM_MAX_VCPUS (=3D=3D 2048) VPs. This =
means
> that on a bi-socket system, we can create at most:
>=20
> (2 * 1M) / (8 * 2048) - 1 =3D=3D 127 XIVE or XICS-on-XIVE KVM devices
>=20
> ie, start at most 127 VMs benefiting from an in-kernel interrupt controll=
er.
> Subsequent VMs need to rely on much slower userspace emulated XIVE device=
 in
> QEMU.
>=20
> This is problematic as one can legitimately expect to start the same
> number of mono-CPU VMs as the number of HW threads available on the
> system (eg, 144 on Witherspoon).
>=20
> I'm not aware of any userspace supporting more that 1024 vCPUs. It thus
> seem overkill to consume that many VPs per VM. Ideally we would even
> want userspace to be able to tell KVM about the maximum number of vCPUs
> when creating the VM.
>=20
> For now, provide a module parameter to configure the maximum number of
> vCPUs per VM. While here, reduce the default value to 1024 to match the
> current limit in QEMU. This number is only used by the XIVE KVM devices,
> but some more users of KVM_MAX_VCPUS could possibly be converted.
>=20
> With this change, I could successfully run 230 mono-CPU VMs on a
> Witherspoon system using the official skiboot-6.3.
>=20
> I could even run more VMs by using upstream skiboot containing this
> fix, that allows to better spread interrupts between sockets:
>=20
> e97391ae2bb5 ("xive: fix return value of opal_xive_allocate_irq()")
>=20
> MAX VPCUS | MAX VMS
> ----------+---------
>      1024 |     255
>       512 |     511
>       256 |    1023 (*)
>=20
> (*) the system was barely usable because of the extreme load and
>     memory exhaustion but the VMs did start.

Hrm.  I don't love the idea of using a global tunable for this,
although I guess it could have some use.  It's another global system
property that admins have to worry about.

A better approach would seem to be a way for userspace to be able to
hint the maximum number of cpus for a specific VM to the kernel.

>=20
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
>  arch/powerpc/include/asm/kvm_host.h   |    1 +
>  arch/powerpc/kvm/book3s_hv.c          |   32 +++++++++++++++++++++++++++=
+++++
>  arch/powerpc/kvm/book3s_xive.c        |    2 +-
>  arch/powerpc/kvm/book3s_xive_native.c |    2 +-
>  4 files changed, 35 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/include/a=
sm/kvm_host.h
> index 6fb5fb4779e0..17582ce38788 100644
> --- a/arch/powerpc/include/asm/kvm_host.h
> +++ b/arch/powerpc/include/asm/kvm_host.h
> @@ -335,6 +335,7 @@ struct kvm_arch {
>  	struct kvm_nested_guest *nested_guests[KVM_MAX_NESTED_GUESTS];
>  	/* This array can grow quite large, keep it at the end */
>  	struct kvmppc_vcore *vcores[KVM_MAX_VCORES];
> +	unsigned int max_vcpus;
>  #endif
>  };
> =20
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index f8975c620f41..393d8a1ce9d8 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -125,6 +125,36 @@ static bool nested =3D true;
>  module_param(nested, bool, S_IRUGO | S_IWUSR);
>  MODULE_PARM_DESC(nested, "Enable nested virtualization (only on POWER9)"=
);
> =20
> +#define MIN(x, y) (((x) < (y)) ? (x) : (y))
> +
> +static unsigned int max_vcpus =3D MIN(KVM_MAX_VCPUS, 1024);
> +
> +static int set_max_vcpus(const char *val, const struct kernel_param *kp)
> +{
> +	unsigned int new_max_vcpus;
> +	int ret;
> +
> +	ret =3D kstrtouint(val, 0, &new_max_vcpus);
> +	if (ret)
> +		return ret;
> +
> +	if (new_max_vcpus > KVM_MAX_VCPUS)
> +		return -EINVAL;
> +
> +	max_vcpus =3D new_max_vcpus;
> +
> +	return 0;
> +}
> +
> +static struct kernel_param_ops max_vcpus_ops =3D {
> +	.set =3D set_max_vcpus,
> +	.get =3D param_get_uint,
> +};
> +
> +module_param_cb(max_vcpus, &max_vcpus_ops, &max_vcpus, S_IRUGO | S_IWUSR=
);
> +MODULE_PARM_DESC(max_vcpus, "Maximum number of vCPUS per VM (max =3D "
> +		 __stringify(KVM_MAX_VCPUS) ")");
> +
>  static inline bool nesting_enabled(struct kvm *kvm)
>  {
>  	return kvm->arch.nested_enable && kvm_is_radix(kvm);
> @@ -4918,6 +4948,8 @@ static int kvmppc_core_init_vm_hv(struct kvm *kvm)
>  	if (radix_enabled())
>  		kvmhv_radix_debugfs_init(kvm);
> =20
> +	kvm->arch.max_vcpus =3D max_vcpus;
> +
>  	return 0;
>  }
> =20
> diff --git a/arch/powerpc/kvm/book3s_xive.c b/arch/powerpc/kvm/book3s_xiv=
e.c
> index 2ef43d037a4f..0fea31b64564 100644
> --- a/arch/powerpc/kvm/book3s_xive.c
> +++ b/arch/powerpc/kvm/book3s_xive.c
> @@ -2026,7 +2026,7 @@ static int kvmppc_xive_create(struct kvm_device *de=
v, u32 type)
>  		xive->q_page_order =3D xive->q_order - PAGE_SHIFT;
> =20
>  	/* Allocate a bunch of VPs */
> -	xive->vp_base =3D xive_native_alloc_vp_block(KVM_MAX_VCPUS);
> +	xive->vp_base =3D xive_native_alloc_vp_block(kvm->arch.max_vcpus);
>  	pr_devel("VP_Base=3D%x\n", xive->vp_base);
> =20
>  	if (xive->vp_base =3D=3D XIVE_INVALID_VP)
> diff --git a/arch/powerpc/kvm/book3s_xive_native.c b/arch/powerpc/kvm/boo=
k3s_xive_native.c
> index 84a354b90f60..20314010da56 100644
> --- a/arch/powerpc/kvm/book3s_xive_native.c
> +++ b/arch/powerpc/kvm/book3s_xive_native.c
> @@ -1095,7 +1095,7 @@ static int kvmppc_xive_native_create(struct kvm_dev=
ice *dev, u32 type)
>  	 * a default. Getting the max number of CPUs the VM was
>  	 * configured with would improve our usage of the XIVE VP space.
>  	 */
> -	xive->vp_base =3D xive_native_alloc_vp_block(KVM_MAX_VCPUS);
> +	xive->vp_base =3D xive_native_alloc_vp_block(kvm->arch.max_vcpus);
>  	pr_devel("VP_Base=3D%x\n", xive->vp_base);
> =20
>  	if (xive->vp_base =3D=3D XIVE_INVALID_VP)
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--nO3oAMapP4dBpMZi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl14XFYACgkQbDjKyiDZ
s5IFsRAAgy6R1DwU7WVddFGEwpnAvkt0Pv5vHxTLWg9V0Ou/fPUI1O+T8LJsfWiG
YicahJSElFhI/LW+nPZJvRB/5ekoUDsf8Y2QeOWaJitunbUgbE225ppTTR6xH3HN
VuoeoqBC8zq3bKS3SXJjk+pE0nejxtfrPINvQD7z0Zz78rRr6P3vwTVhbKN8UzwB
ZhUnEK1cIc0CpjUK6AjSiSvBFmzyE56b7z5mFTXHaktT+k1RfeKPRPhhIN+Hptu7
2LZ4kk81SwyjlC04xiyU7iLNkH6hqLrW9Lg0RQQgMYSeCiX/Ee+tPiGn54PefnRn
4qKnsiYBdX4ceMt3l9VUs+jzwNvVu4mMeVPCQ0otYVtQM22pVR6FBj+iHm+4nkdl
VdheBG3v8e6w3LnNry4MyXTqS868mcKJXQjIdq/jD25aWobxUSEQVkCAYe6lmm6G
AR3rqdTvrWj7SLI4lVl3OqhZEJnteTW6Xoj3b/BKUiatgyILw/4gffQEEeLzbjSC
1Vcl0YMT64ChouJbuDypE3L9q+OX70sXL1Q16iDtG12rEQA7VaR74vE87ZI1XOP0
DQ3w9nCdDZjiPhehywM7oCYtuSxAte8NpsTBbfRrkK6DvBhplbCrLoTEkyRGLKjc
jWHFOr5LA8E1kmnxUANxykTWOUqPy7LU6cFWrM32wXmlCZTeJyg=
=QW/y
-----END PGP SIGNATURE-----

--nO3oAMapP4dBpMZi--
