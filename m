Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF29AFAB9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2019 12:46:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Sz8v09KRzF31Y
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2019 20:46:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=87.98.172.75; helo=4.mo2.mail-out.ovh.net;
 envelope-from=groug@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 596 seconds by postgrey-1.36 at bilbo;
 Wed, 11 Sep 2019 20:44:18 AEST
Received: from 4.mo2.mail-out.ovh.net (4.mo2.mail-out.ovh.net [87.98.172.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Sz6V5lMnzDrN1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Sep 2019 20:44:17 +1000 (AEST)
Received: from player159.ha.ovh.net (unknown [10.109.143.201])
 by mo2.mail-out.ovh.net (Postfix) with ESMTP id 57F941AC499
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Sep 2019 12:25:34 +0200 (CEST)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player159.ha.ovh.net (Postfix) with ESMTPSA id 6E9FA9989941;
 Wed, 11 Sep 2019 10:25:26 +0000 (UTC)
Date: Wed, 11 Sep 2019 12:25:24 +0200
From: Greg Kurz <groug@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH] KVM: PPC: Book3S HV: Tunable to configure maximum # of
 vCPUs per VM
Message-ID: <20190911122524.008d03d5@bahia.lan>
In-Reply-To: <20190911023048.GI30740@umbus.fritz.box>
References: <156813417397.1880979.6162333671088177553.stgit@bahia.tls.ibm.com>
 <20190911023048.GI30740@umbus.fritz.box>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/lnbvmABaUkvZBmQnfvgnyTi"; protocol="application/pgp-signature"
X-Ovh-Tracer-Id: 14672164636565019110
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrtdefgddtvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
 =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/lnbvmABaUkvZBmQnfvgnyTi
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 11 Sep 2019 12:30:48 +1000
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Tue, Sep 10, 2019 at 06:49:34PM +0200, Greg Kurz wrote:
> > Each vCPU of a VM allocates a XIVE VP in OPAL which is associated with
> > 8 event queue (EQ) descriptors, one for each priority. A POWER9 socket
> > can handle a maximum of 1M event queues.
> >=20
> > The powernv platform allocates NR_CPUS (=3D=3D 2048) VPs for the hyperv=
isor,
> > and each XIVE KVM device allocates KVM_MAX_VCPUS (=3D=3D 2048) VPs. Thi=
s means
> > that on a bi-socket system, we can create at most:
> >=20
> > (2 * 1M) / (8 * 2048) - 1 =3D=3D 127 XIVE or XICS-on-XIVE KVM devices
> >=20
> > ie, start at most 127 VMs benefiting from an in-kernel interrupt contro=
ller.
> > Subsequent VMs need to rely on much slower userspace emulated XIVE devi=
ce in
> > QEMU.
> >=20
> > This is problematic as one can legitimately expect to start the same
> > number of mono-CPU VMs as the number of HW threads available on the
> > system (eg, 144 on Witherspoon).
> >=20
> > I'm not aware of any userspace supporting more that 1024 vCPUs. It thus
> > seem overkill to consume that many VPs per VM. Ideally we would even
> > want userspace to be able to tell KVM about the maximum number of vCPUs
> > when creating the VM.
> >=20
> > For now, provide a module parameter to configure the maximum number of
> > vCPUs per VM. While here, reduce the default value to 1024 to match the
> > current limit in QEMU. This number is only used by the XIVE KVM devices,
> > but some more users of KVM_MAX_VCPUS could possibly be converted.
> >=20
> > With this change, I could successfully run 230 mono-CPU VMs on a
> > Witherspoon system using the official skiboot-6.3.
> >=20
> > I could even run more VMs by using upstream skiboot containing this
> > fix, that allows to better spread interrupts between sockets:
> >=20
> > e97391ae2bb5 ("xive: fix return value of opal_xive_allocate_irq()")
> >=20
> > MAX VPCUS | MAX VMS
> > ----------+---------
> >      1024 |     255
> >       512 |     511
> >       256 |    1023 (*)
> >=20
> > (*) the system was barely usable because of the extreme load and
> >     memory exhaustion but the VMs did start.
>=20
> Hrm.  I don't love the idea of using a global tunable for this,
> although I guess it could have some use.  It's another global system
> property that admins have to worry about.
>=20

Well, they have to worry only if they're unhappy with the new
1024 default FWIW.

> A better approach would seem to be a way for userspace to be able to
> hint the maximum number of cpus for a specific VM to the kernel.
>=20

Yes and it's mentioned in the changelog. Since this requires to add
a new API in KVM and the corresponding changes in QEMU, I was thinking
that having a way to change the limit in KVM would be an acceptable
solution for the short term.

Anyway, I'll start looking into the better approach.

> >=20
> > Signed-off-by: Greg Kurz <groug@kaod.org>
> > ---
> >  arch/powerpc/include/asm/kvm_host.h   |    1 +
> >  arch/powerpc/kvm/book3s_hv.c          |   32 +++++++++++++++++++++++++=
+++++++
> >  arch/powerpc/kvm/book3s_xive.c        |    2 +-
> >  arch/powerpc/kvm/book3s_xive_native.c |    2 +-
> >  4 files changed, 35 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/include=
/asm/kvm_host.h
> > index 6fb5fb4779e0..17582ce38788 100644
> > --- a/arch/powerpc/include/asm/kvm_host.h
> > +++ b/arch/powerpc/include/asm/kvm_host.h
> > @@ -335,6 +335,7 @@ struct kvm_arch {
> >  	struct kvm_nested_guest *nested_guests[KVM_MAX_NESTED_GUESTS];
> >  	/* This array can grow quite large, keep it at the end */
> >  	struct kvmppc_vcore *vcores[KVM_MAX_VCORES];
> > +	unsigned int max_vcpus;
> >  #endif
> >  };
> > =20
> > diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> > index f8975c620f41..393d8a1ce9d8 100644
> > --- a/arch/powerpc/kvm/book3s_hv.c
> > +++ b/arch/powerpc/kvm/book3s_hv.c
> > @@ -125,6 +125,36 @@ static bool nested =3D true;
> >  module_param(nested, bool, S_IRUGO | S_IWUSR);
> >  MODULE_PARM_DESC(nested, "Enable nested virtualization (only on POWER9=
)");
> > =20
> > +#define MIN(x, y) (((x) < (y)) ? (x) : (y))
> > +
> > +static unsigned int max_vcpus =3D MIN(KVM_MAX_VCPUS, 1024);
> > +
> > +static int set_max_vcpus(const char *val, const struct kernel_param *k=
p)
> > +{
> > +	unsigned int new_max_vcpus;
> > +	int ret;
> > +
> > +	ret =3D kstrtouint(val, 0, &new_max_vcpus);
> > +	if (ret)
> > +		return ret;
> > +
> > +	if (new_max_vcpus > KVM_MAX_VCPUS)
> > +		return -EINVAL;
> > +
> > +	max_vcpus =3D new_max_vcpus;
> > +
> > +	return 0;
> > +}
> > +
> > +static struct kernel_param_ops max_vcpus_ops =3D {
> > +	.set =3D set_max_vcpus,
> > +	.get =3D param_get_uint,
> > +};
> > +
> > +module_param_cb(max_vcpus, &max_vcpus_ops, &max_vcpus, S_IRUGO | S_IWU=
SR);
> > +MODULE_PARM_DESC(max_vcpus, "Maximum number of vCPUS per VM (max =3D "
> > +		 __stringify(KVM_MAX_VCPUS) ")");
> > +
> >  static inline bool nesting_enabled(struct kvm *kvm)
> >  {
> >  	return kvm->arch.nested_enable && kvm_is_radix(kvm);
> > @@ -4918,6 +4948,8 @@ static int kvmppc_core_init_vm_hv(struct kvm *kvm)
> >  	if (radix_enabled())
> >  		kvmhv_radix_debugfs_init(kvm);
> > =20
> > +	kvm->arch.max_vcpus =3D max_vcpus;
> > +
> >  	return 0;
> >  }
> > =20
> > diff --git a/arch/powerpc/kvm/book3s_xive.c b/arch/powerpc/kvm/book3s_x=
ive.c
> > index 2ef43d037a4f..0fea31b64564 100644
> > --- a/arch/powerpc/kvm/book3s_xive.c
> > +++ b/arch/powerpc/kvm/book3s_xive.c
> > @@ -2026,7 +2026,7 @@ static int kvmppc_xive_create(struct kvm_device *=
dev, u32 type)
> >  		xive->q_page_order =3D xive->q_order - PAGE_SHIFT;
> > =20
> >  	/* Allocate a bunch of VPs */
> > -	xive->vp_base =3D xive_native_alloc_vp_block(KVM_MAX_VCPUS);
> > +	xive->vp_base =3D xive_native_alloc_vp_block(kvm->arch.max_vcpus);
> >  	pr_devel("VP_Base=3D%x\n", xive->vp_base);
> > =20
> >  	if (xive->vp_base =3D=3D XIVE_INVALID_VP)
> > diff --git a/arch/powerpc/kvm/book3s_xive_native.c b/arch/powerpc/kvm/b=
ook3s_xive_native.c
> > index 84a354b90f60..20314010da56 100644
> > --- a/arch/powerpc/kvm/book3s_xive_native.c
> > +++ b/arch/powerpc/kvm/book3s_xive_native.c
> > @@ -1095,7 +1095,7 @@ static int kvmppc_xive_native_create(struct kvm_d=
evice *dev, u32 type)
> >  	 * a default. Getting the max number of CPUs the VM was
> >  	 * configured with would improve our usage of the XIVE VP space.
> >  	 */
> > -	xive->vp_base =3D xive_native_alloc_vp_block(KVM_MAX_VCPUS);
> > +	xive->vp_base =3D xive_native_alloc_vp_block(kvm->arch.max_vcpus);
> >  	pr_devel("VP_Base=3D%x\n", xive->vp_base);
> > =20
> >  	if (xive->vp_base =3D=3D XIVE_INVALID_VP)
> >=20
>=20


--Sig_/lnbvmABaUkvZBmQnfvgnyTi
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEtIKLr5QxQM7yo0kQcdTV5YIvc9YFAl14y5QACgkQcdTV5YIv
c9bjLhAAsvFlsZZet3Jsq5C2JQq/Y3ideStBFdFP9P71GSJEA1j5XSGDiSqGtYWR
AZTRxm5XIab4YRQ/Fujuj9lPxb7rTiqZI9OMLIAC4bgzTdLW7L91sxGUS1im5Ayz
wnCS5yN15mtAz8+zwBMisr8/oI+yzMndl1JumlnXjmFos3ylpxNTdP7RV2yrzb9+
bVGac7u0sqdEgh0kjl2AOfn+IXf72z/0FKz2tEnk4mWcy0yGy6QBr3Lfj1o/ucBF
FOcwbejfyzfVilDG1i/U2biiWAy7rwsYQTXRuuquENaBLcKt+BsSyavAAJ68Wy41
LH0pGoVWBxvfFvbKZnxff36poWhmKtqp5YlMVDxx0iT3wEmSsXi6ZQpHaEbuHVrx
/CQUGfFZxoLLIyGDDZoP3KqZiTtYiiUvoEVUQn8Mrz5iLAABFdqlhx5jVIJaKop9
474NODpfEO7rLWfiqStUBDwWa+tEg+jlZ7pPL7OwdaZqqT5/aTjdO3/4buNm9Ho1
ZTRnskXg6qq6lmKacPiHBb0m82WhqRFiyzT6Mnu72mF+a0cZ8FdKZHpSyc6Jfu12
hFPkgytGfw/OY1Wxy+P82P1CEgAagDF1QqpRUVXcijAZ5SZZMqE+G6yVZMQU9EFL
Y0QDisfzAo3+lCPAAYQliQnV+xPyiauYTybQ6hx9aCgRfD8im0I=
=F1qe
-----END PGP SIGNATURE-----

--Sig_/lnbvmABaUkvZBmQnfvgnyTi--
