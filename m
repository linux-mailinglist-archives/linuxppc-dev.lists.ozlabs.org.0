Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D58178F65
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Mar 2020 12:11:42 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48XWRH0GTSzDqPK
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Mar 2020 22:11:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=46.105.43.93; helo=6.mo173.mail-out.ovh.net;
 envelope-from=groug@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 135450 seconds by postgrey-1.36 at bilbo;
 Wed, 04 Mar 2020 22:09:56 AEDT
Received: from 6.mo173.mail-out.ovh.net (6.mo173.mail-out.ovh.net
 [46.105.43.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48XWPJ4JDdzDq6y
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Mar 2020 22:09:53 +1100 (AEDT)
Received: from player791.ha.ovh.net (unknown [10.108.54.87])
 by mo173.mail-out.ovh.net (Postfix) with ESMTP id 56AE312F2FC
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Mar 2020 12:00:11 +0100 (CET)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player791.ha.ovh.net (Postfix) with ESMTPSA id 61277FFD323D;
 Wed,  4 Mar 2020 10:59:54 +0000 (UTC)
Date: Wed, 4 Mar 2020 11:59:48 +0100
From: Greg Kurz <groug@kaod.org>
To: Ram Pai <linuxram@us.ibm.com>
Subject: Re: [RFC PATCH v1] powerpc/prom_init: disable XIVE in Secure VM.
Message-ID: <20200304115948.7b2dfe10@bahia.home>
In-Reply-To: <20200303185645.GB5416@oc0525413822.ibm.com>
References: <1582962844-26333-1-git-send-email-linuxram@us.ibm.com>
 <20200302233240.GB35885@umbus.fritz.box>
 <8f0c3d41-d1f9-7e6d-276b-b95238715979@fr.ibm.com>
 <20200303170205.GA5416@oc0525413822.ibm.com>
 <20200303184520.632be270@bahia.home>
 <20200303185645.GB5416@oc0525413822.ibm.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Ovh-Tracer-Id: 9960555004736149963
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedruddtkedgvddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfesthhqredtredtjeenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdekvddrvdehfedrvddtkedrvdegkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejledurdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtoheplhhinhhugihpphgtqdguvghvsehlihhsthhsrdhoiihlrggsshdrohhrgh
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
Cc: aik@ozlabs.ru, andmike@linux.ibm.com, kvm-ppc@vger.kernel.org,
 =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@fr.ibm.com>,
 sukadev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 bauerman@linux.ibm.com, David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 3 Mar 2020 10:56:45 -0800
Ram Pai <linuxram@us.ibm.com> wrote:

> On Tue, Mar 03, 2020 at 06:45:20PM +0100, Greg Kurz wrote:
> > On Tue, 3 Mar 2020 09:02:05 -0800
> > Ram Pai <linuxram@us.ibm.com> wrote:
> >=20
> > > On Tue, Mar 03, 2020 at 07:50:08AM +0100, C=C3=A9dric Le Goater wrote:
> > > > On 3/3/20 12:32 AM, David Gibson wrote:
> > > > > On Fri, Feb 28, 2020 at 11:54:04PM -0800, Ram Pai wrote:
> > > > >> XIVE is not correctly enabled for Secure VM in the KVM Hyperviso=
r yet.
> > > > >>
> > > > >> Hence Secure VM, must always default to XICS interrupt controlle=
r.
> > > > >>
> > > > >> If XIVE is requested through kernel command line option "xive=3D=
on",
> > > > >> override and turn it off.
> > > > >>
> > > > >> If XIVE is the only supported platform interrupt controller; spe=
cified
> > > > >> through qemu option "ic-mode=3Dxive", simply abort. Otherwise de=
fault to
> > > > >> XICS.
> > > > >=20
> > > > > Uh... the discussion thread here seems to have gotten oddly off
> > > > > track. =20
> > > >=20
> > > > There seem to be multiple issues. It is difficult to have a clear s=
tatus.
> > > >=20
> > > > > So, to try to clean up some misunderstandings on both sides:
> > > > >=20
> > > > >   1) The guest is the main thing that knows that it will be in se=
cure
> > > > >      mode, so it's reasonable for it to conditionally use XIVE ba=
sed
> > > > >      on that
> > > >=20
> > > > FW support is required AFAIUI.
> > > > >   2) The mechanism by which we do it here isn't quite right.  Her=
e the
> > > > >      guest is checking itself that the host only allows XIVE, but=
 we
> > > > >      can't do XIVE and is panic()ing.  Instead, in the SVM case we
> > > > >      should force support->xive to false, and send that in the CAS
> > > > >      request to the host.  We expect the host to just terminate
> > > > >      us because of the mismatch, but this will interact better wi=
th
> > > > >      host side options setting policy for panic states and the li=
ke.
> > > > >      Essentially an SVM kernel should behave like an old kernel w=
ith
> > > > >      no XIVE support at all, at least w.r.t. the CAS irq mode fla=
gs.
> > > >=20
> > > > Yes. XIVE shouldn't be requested by the guest.
> > >=20
> > > 	Ok.
> > >=20
> > > > This is the last option=20
> > > > I proposed but I thought there was some negotiation with the hyperv=
isor
> > > > which is not the case.=20
> > > >=20
> > > > >   3) Although there are means by which the hypervisor can kind of=
 know
> > > > >      a guest is in secure mode, there's not really an "svm=3Don" =
option
> > > > >      on the host side.  For the most part secure mode is based on
> > > > >      discussion directly between the guest and the ultravisor with
> > > > >      almost no hypervisor intervention.
> > > >=20
> > > > Is there a negotiation with the ultravisor ?=20
> > >=20
> > > 	The VM has no negotiation with the ultravisor w.r.t CAS.
> > >=20
> > > >=20
> > > > >   4) I'm guessing the problem with XIVE in SVM mode is that XIVE =
needs
> > > > >      to write to event queues in guest memory, which would have t=
o be
> > > > >      explicitly shared for secure mode.  That's true whether it's=
 KVM
> > > > >      or qemu accessing the guest memory, so kernel_irqchip=3Don/o=
ff is
> > > > >      entirely irrelevant.
> > > >=20
> > > > This problem should be already fixed.
> > > > The XIVE event queues are shared=20
> > >  =09
> > > Yes i have a patch for the guest kernel that shares the event=20
> > > queue page with the hypervisor. This is done using the
> > > UV_SHARE_PAGE ultracall. This patch is not sent out to any any mailing
> > > lists yet.
> >=20
> > Why ?
>=20
> At this point I am not sure if this is the only change, I need to the
> guest kernel.

Maybe but we're already sure that this change is needed. I don't really see
the point in holding this any longer.

>  I also need changes to KVM and to the ultravisor. Its bit
> premature to send the patch without having figured out everything
> to get xive working on a Secure VM.
>=20

I'm a bit confused... why did you send this workaround patch in
the first place then ? I mean, this raises a concern and we're
just trying to move forward.

> >=20
> > > However the patch by itself does not solve the xive problem
> > > for secure VM.
> > >=20
> >=20
> > This patch would allow at least to answer Cedric's question about
> > kernel_irqchip=3Doff, since this looks like the only thing needed
> > to make it work.
>=20
> hmm.. I am not sure. Are you saying
> (a) patch the guest kernel to share the event queue page
> (b) run the qemu with "kernel_irqchip=3Doff"
> (c) and the guest kernel with "svm=3Don"
>=20
> and it should all work?
>=20

Yes.

> RP
>=20

