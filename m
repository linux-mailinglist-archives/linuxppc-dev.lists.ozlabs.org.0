Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D6DF90CE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Nov 2019 14:38:51 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47C83C5CS6zDqcM
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2019 00:38:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=87.98.179.66; helo=19.mo4.mail-out.ovh.net;
 envelope-from=groug@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 4500 seconds by postgrey-1.36 at bilbo;
 Wed, 13 Nov 2019 00:36:17 AEDT
Received: from 19.mo4.mail-out.ovh.net (19.mo4.mail-out.ovh.net [87.98.179.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47C80K5qnhzF4hy
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2019 00:36:13 +1100 (AEDT)
Received: from player157.ha.ovh.net (unknown [10.108.57.18])
 by mo4.mail-out.ovh.net (Postfix) with ESMTP id 0B8C820CFF2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Nov 2019 13:01:24 +0100 (CET)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player157.ha.ovh.net (Postfix) with ESMTPSA id 406A9BF07148;
 Tue, 12 Nov 2019 12:01:11 +0000 (UTC)
Date: Tue, 12 Nov 2019 13:01:09 +0100
From: Greg Kurz <groug@kaod.org>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH] KVM: PPC: Book3S HV: XIVE: Free previous EQ page when
 setting up a new one
Message-ID: <20191112130109.4d7bcf05@bahia.lan>
In-Reply-To: <3373a85a-09bb-3345-ef27-68177c360786@kaod.org>
References: <157346576671.818016.10401178701091199969.stgit@bahia.lan>
 <3373a85a-09bb-3345-ef27-68177c360786@kaod.org>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Ovh-Tracer-Id: 11462505477939566987
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedruddvledgfeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdqfffguegfifdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfesthhqredtredtjeenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdekvddrvdehfedrvddtkedrvdegkeenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrudehjedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehlihhnuhigphhptgdquggvvheslhhishhtshdrohiilhgrsghsrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
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
Cc: linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org,
 Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>, stable@vger.kernel.org,
 Lijun Pan <ljp@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 11 Nov 2019 12:26:25 +0100
C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> On 11/11/2019 10:49, Greg Kurz wrote:
> > The EQ page is allocated by the guest and then passed to the hypervisor
> > with the H_INT_SET_QUEUE_CONFIG hcall. A reference is taken on the page
> > before handing it over to the HW. This reference is dropped either when
> > the guest issues the H_INT_RESET hcall or when the KVM device is releas=
ed.
> > But, the guest can legitimately call H_INT_SET_QUEUE_CONFIG several tim=
es
> > to reset the EQ (vCPU hot unplug) or set a new EQ (guest reboot). In bo=
th
> > cases the EQ page reference is leaked. This is especially visible when
> > the guest memory is backed with huge pages: start a VM up to the guest
> > userspace, either reboot it or unplug a vCPU, quit QEMU. The leak is
> > observed by comparing the value of HugePages_Free in /proc/meminfo befo=
re
> > and after the VM is run.
> >=20
> > Note that the EQ reset path seems to be calling put_page() but this is
> > done after xive_native_configure_queue() which clears the qpage field
> > in the XIVE queue structure, ie. the put_page() block is a nop and the
> > previous page pointer was just overwritten anyway. In the other case of
> > configuring a new EQ page, nothing seems to be done to release the old
> > one.
>=20
> Yes. Nice catch. I think we should try to fix the problem differently.=20
>=20
> The routine xive_native_configure_queue() is only suited for XIVE=20
> drivers doing their own EQ page allocation: Linux PowerNV and the=20
> KVM XICS-over-XIVE device. The KVM XIVE device acts as a proxy for=20
> the guest OS doing the allocation and it has different needs.
>=20

Well xive_native_configure_queue() is at least partially suited for all thr=
ee
drivers since they use it to configure the EQ. But it doesn't address the p=
age
allocation/de-allocation which is indeed different.

> Having a specific xive_native_configure_queue() for the KVM XIVE=20
> device seems overkill. May be, we could introduce a helper routine=20
> in KVM XIVE device calling xive_native_configure_queue() and handling=20
> the page reference how it should be ? That is to drop the previous
> page reference in case of a change on q->qpage.
>=20

Yes, that seems better. I'll post a v2 with the helper you've mailed
me.

>=20
> Also, we should try to preserve the previous setting until the whole=20
> configuration is in place. That seems possible up to the call to=20
> xive_native_configure_queue(). If kvmppc_xive_attach_escalation()
> fails I think it is too late, as the HW has been configured by=20
> xive_native_configure_queue(), and we should just cleanup everything.=20
>=20
> Thanks,
>=20
> C.=20
>=20
>=20
> > Fix both cases by always calling put_page() on the existing EQ page in
> > kvmppc_xive_native_set_queue_config(). This is a seemless change for the
> > EQ reset case. However this causes xive_native_configure_queue() to be
> > called twice for the new EQ page case: one time to reset the EQ and ano=
ther
> > time to configure the new page. This is needed because we cannot release
> > the EQ page before calling xive_native_configure_queue() since it may s=
till
> > be used by the HW. We cannot modify xive_native_configure_queue() to dr=
op
> > the reference either because this function is also used by the XICS-on-=
XIVE
> > device which requires free_pages() instead of put_page(). This isn't a =
big
> > deal anyway since H_INT_SET_QUEUE_CONFIG isn't a hot path.
> >=20
> > Reported-by: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>
> > Cc: stable@vger.kernel.org # v5.2
> > Fixes: 13ce3297c576 ("KVM: PPC: Book3S HV: XIVE: Add controls for the E=
Q configuration")
> > Signed-off-by: Greg Kurz <groug@kaod.org>
> > ---
> >  arch/powerpc/kvm/book3s_xive_native.c |   21 ++++++++++++---------
> >  1 file changed, 12 insertions(+), 9 deletions(-)
> >=20
> > diff --git a/arch/powerpc/kvm/book3s_xive_native.c b/arch/powerpc/kvm/b=
ook3s_xive_native.c
> > index 34bd123fa024..8ab908d23dc2 100644
> > --- a/arch/powerpc/kvm/book3s_xive_native.c
> > +++ b/arch/powerpc/kvm/book3s_xive_native.c
> > @@ -570,10 +570,12 @@ static int kvmppc_xive_native_set_queue_config(st=
ruct kvmppc_xive *xive,
> >  		 __func__, server, priority, kvm_eq.flags,
> >  		 kvm_eq.qshift, kvm_eq.qaddr, kvm_eq.qtoggle, kvm_eq.qindex);
> > =20
> > -	/* reset queue and disable queueing */
> > -	if (!kvm_eq.qshift) {
> > -		q->guest_qaddr  =3D 0;
> > -		q->guest_qshift =3D 0;
> > +	/*
> > +	 * Reset queue and disable queueing. It will be re-enabled
> > +	 * later on if the guest is configuring a new EQ page.
> > +	 */
> > +	if (q->guest_qshift) {
> > +		page =3D virt_to_page(q->qpage);
> > =20
> >  		rc =3D xive_native_configure_queue(xc->vp_id, q, priority,
> >  						 NULL, 0, true);
> > @@ -583,12 +585,13 @@ static int kvmppc_xive_native_set_queue_config(st=
ruct kvmppc_xive *xive,
> >  			return rc;
> >  		}
> > =20
> > -		if (q->qpage) {
> > -			put_page(virt_to_page(q->qpage));
> > -			q->qpage =3D NULL;
> > -		}
> > +		put_page(page);
> > =20
> > -		return 0;
> > +		if (!kvm_eq.qshift) {
> > +			q->guest_qaddr  =3D 0;
> > +			q->guest_qshift =3D 0;
> > +			return 0;
> > +		}
> >  	}
> > =20
> >  	/*
> >=20
>=20

