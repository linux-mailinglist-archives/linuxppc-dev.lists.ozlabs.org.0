Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D8EC2182
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Sep 2019 15:11:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46hjTQ4dVyzDqMG
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Sep 2019 23:11:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=46.105.73.133; helo=10.mo177.mail-out.ovh.net;
 envelope-from=groug@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 1794 seconds by postgrey-1.36 at bilbo;
 Mon, 30 Sep 2019 23:09:06 AEST
Received: from 10.mo177.mail-out.ovh.net (10.mo177.mail-out.ovh.net
 [46.105.73.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46hjQp06cgzDqKD
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Sep 2019 23:09:02 +1000 (AEST)
Received: from player794.ha.ovh.net (unknown [10.108.35.159])
 by mo177.mail-out.ovh.net (Postfix) with ESMTP id C8CD010C03C
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Sep 2019 14:29:35 +0200 (CEST)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player794.ha.ovh.net (Postfix) with ESMTPSA id 67737A5A57C6;
 Mon, 30 Sep 2019 12:29:22 +0000 (UTC)
Date: Mon, 30 Sep 2019 14:29:21 +0200
From: Greg Kurz <groug@kaod.org>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH v2 4/6] KVM: PPC: Book3S HV: XIVE: Compute the VP id in
 a common helper
Message-ID: <20190930142921.380e4e1b@bahia.w3ibm.bluemix.net>
In-Reply-To: <fb6accd0-f3fa-d441-5892-516ed4118d3b@kaod.org>
References: <156958521220.1503771.2119482814236775333.stgit@bahia.lan>
 <156958523534.1503771.7854438316257986828.stgit@bahia.lan>
 <fb6accd0-f3fa-d441-5892-516ed4118d3b@kaod.org>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Ovh-Tracer-Id: 17667339865624058251
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrgedvgdegkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
Cc: kvm@vger.kernel.org, Radim =?UTF-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>,
 kvm-ppc@vger.kernel.org, stable@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 30 Sep 2019 14:01:56 +0200
C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> On 27/09/2019 13:53, Greg Kurz wrote:
> > Reduce code duplication by consolidating the checking of vCPU ids and VP
> > ids to a common helper used by both legacy and native XIVE KVM devices.
> > And explain the magic with a comment.
> >=20
> > Signed-off-by: Greg Kurz <groug@kaod.org>
>=20
> Looks fine. One question below,
>=20
> > ---
> >  arch/powerpc/kvm/book3s_xive.c        |   42 +++++++++++++++++++++++++=
+-------
> >  arch/powerpc/kvm/book3s_xive.h        |    1 +
> >  arch/powerpc/kvm/book3s_xive_native.c |   11 ++-------
> >  3 files changed, 36 insertions(+), 18 deletions(-)
> >=20
> > diff --git a/arch/powerpc/kvm/book3s_xive.c b/arch/powerpc/kvm/book3s_x=
ive.c
> > index 0b7859e40f66..d84da9f6ee88 100644
> > --- a/arch/powerpc/kvm/book3s_xive.c
> > +++ b/arch/powerpc/kvm/book3s_xive.c
> > @@ -1211,6 +1211,37 @@ void kvmppc_xive_cleanup_vcpu(struct kvm_vcpu *v=
cpu)
> >  	vcpu->arch.xive_vcpu =3D NULL;
> >  }
> > =20
> > +static bool kvmppc_xive_vcpu_id_valid(struct kvmppc_xive *xive, u32 cp=
u)
> > +{
> > +	/* We have a block of KVM_MAX_VCPUS VPs. We just need to check
> > +	 * raw vCPU ids are below the expected limit for this guest's
> > +	 * core stride ; kvmppc_pack_vcpu_id() will pack them down to an
> > +	 * index that can be safely used to compute a VP id that belongs
> > +	 * to the VP block.
> > +	 */
> > +	return cpu < KVM_MAX_VCPUS * xive->kvm->arch.emul_smt_mode;
> > +}
> > +
> > +int kvmppc_xive_compute_vp_id(struct kvmppc_xive *xive, u32 cpu, u32 *=
vp)
> > +{
> > +	u32 vp_id;
> > +
> > +	if (!kvmppc_xive_vcpu_id_valid(xive, cpu)) {
> > +		pr_devel("Out of bounds !\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	vp_id =3D kvmppc_xive_vp(xive, cpu);
> > +	if (kvmppc_xive_vp_in_use(xive->kvm, vp_id)) {
> > +		pr_devel("Duplicate !\n");
> > +		return -EEXIST;
> > +	}
> > +
> > +	*vp =3D vp_id;
> > +
> > +	return 0;
>=20
> why not return vp_id ? and test for a negative value in callers.
>=20

Simpler code in the callers IMHO.

>=20
> C.
>=20
> > +}
> > +
> >  int kvmppc_xive_connect_vcpu(struct kvm_device *dev,
> >  			     struct kvm_vcpu *vcpu, u32 cpu)
> >  {
> > @@ -1229,20 +1260,13 @@ int kvmppc_xive_connect_vcpu(struct kvm_device =
*dev,
> >  		return -EPERM;
> >  	if (vcpu->arch.irq_type !=3D KVMPPC_IRQ_DEFAULT)
> >  		return -EBUSY;
> > -	if (cpu >=3D (KVM_MAX_VCPUS * vcpu->kvm->arch.emul_smt_mode)) {
> > -		pr_devel("Out of bounds !\n");
> > -		return -EINVAL;
> > -	}
> > =20
> >  	/* We need to synchronize with queue provisioning */
> >  	mutex_lock(&xive->lock);
> > =20
> > -	vp_id =3D kvmppc_xive_vp(xive, cpu);
> > -	if (kvmppc_xive_vp_in_use(xive->kvm, vp_id)) {
> > -		pr_devel("Duplicate !\n");
> > -		r =3D -EEXIST;
> > +	r =3D kvmppc_xive_compute_vp_id(xive, cpu, &vp_id);
> > +	if (r)
> >  		goto bail;
> > -	}
> > =20
> >  	xc =3D kzalloc(sizeof(*xc), GFP_KERNEL);
> >  	if (!xc) {
> > diff --git a/arch/powerpc/kvm/book3s_xive.h b/arch/powerpc/kvm/book3s_x=
ive.h
> > index fe3ed50e0818..90cf6ec35a68 100644
> > --- a/arch/powerpc/kvm/book3s_xive.h
> > +++ b/arch/powerpc/kvm/book3s_xive.h
> > @@ -296,6 +296,7 @@ int kvmppc_xive_attach_escalation(struct kvm_vcpu *=
vcpu, u8 prio,
> >  struct kvmppc_xive *kvmppc_xive_get_device(struct kvm *kvm, u32 type);
> >  void xive_cleanup_single_escalation(struct kvm_vcpu *vcpu,
> >  				    struct kvmppc_xive_vcpu *xc, int irq);
> > +int kvmppc_xive_compute_vp_id(struct kvmppc_xive *xive, u32 cpu, u32 *=
vp);
> > =20
> >  #endif /* CONFIG_KVM_XICS */
> >  #endif /* _KVM_PPC_BOOK3S_XICS_H */
> > diff --git a/arch/powerpc/kvm/book3s_xive_native.c b/arch/powerpc/kvm/b=
ook3s_xive_native.c
> > index 43a86858390a..5bb480b2aafd 100644
> > --- a/arch/powerpc/kvm/book3s_xive_native.c
> > +++ b/arch/powerpc/kvm/book3s_xive_native.c
> > @@ -118,19 +118,12 @@ int kvmppc_xive_native_connect_vcpu(struct kvm_de=
vice *dev,
> >  		return -EPERM;
> >  	if (vcpu->arch.irq_type !=3D KVMPPC_IRQ_DEFAULT)
> >  		return -EBUSY;
> > -	if (server_num >=3D (KVM_MAX_VCPUS * vcpu->kvm->arch.emul_smt_mode)) {
> > -		pr_devel("Out of bounds !\n");
> > -		return -EINVAL;
> > -	}
> > =20
> >  	mutex_lock(&xive->lock);
> > =20
> > -	vp_id =3D kvmppc_xive_vp(xive, server_num);
> > -	if (kvmppc_xive_vp_in_use(xive->kvm, vp_id)) {
> > -		pr_devel("Duplicate !\n");
> > -		rc =3D -EEXIST;
> > +	rc =3D kvmppc_xive_compute_vp_id(xive, server_num, &vp_id);
> > +	if (rc)
> >  		goto bail;
> > -	}
> > =20
> >  	xc =3D kzalloc(sizeof(*xc), GFP_KERNEL);
> >  	if (!xc) {
> >=20
>=20

