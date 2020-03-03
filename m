Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D8765178692
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Mar 2020 00:43:18 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48XD8z5Bm5zDqVB
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Mar 2020 10:43:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=46.105.40.108; helo=3.mo5.mail-out.ovh.net;
 envelope-from=groug@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 20397 seconds by postgrey-1.36 at bilbo;
 Wed, 04 Mar 2020 10:41:52 AEDT
Received: from 3.mo5.mail-out.ovh.net (3.mo5.mail-out.ovh.net [46.105.40.108])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48XD7N6WqSzDqTV
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Mar 2020 10:41:48 +1100 (AEDT)
Received: from player695.ha.ovh.net (unknown [10.110.115.3])
 by mo5.mail-out.ovh.net (Postfix) with ESMTP id 341EE270702
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Mar 2020 18:45:45 +0100 (CET)
Received: from kaod.org (unknown [129.41.47.1])
 (Authenticated sender: groug@kaod.org)
 by player695.ha.ovh.net (Postfix) with ESMTPSA id 82630FE6A0C6;
 Tue,  3 Mar 2020 17:45:27 +0000 (UTC)
Date: Tue, 3 Mar 2020 18:45:20 +0100
From: Greg Kurz <groug@kaod.org>
To: Ram Pai <linuxram@us.ibm.com>
Subject: Re: [RFC PATCH v1] powerpc/prom_init: disable XIVE in Secure VM.
Message-ID: <20200303184520.632be270@bahia.home>
In-Reply-To: <20200303170205.GA5416@oc0525413822.ibm.com>
References: <1582962844-26333-1-git-send-email-linuxram@us.ibm.com>
 <20200302233240.GB35885@umbus.fritz.box>
 <8f0c3d41-d1f9-7e6d-276b-b95238715979@fr.ibm.com>
 <20200303170205.GA5416@oc0525413822.ibm.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Ovh-Tracer-Id: 10937273172029577675
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedruddtiedguddtjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgfgsehtqhertdertdejnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpuddvledrgedurdegjedrudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrheileehrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtoheplhhinhhugihpphgtqdguvghvsehlihhsthhsrdhoiihlrggsshdrohhrgh
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

On Tue, 3 Mar 2020 09:02:05 -0800
Ram Pai <linuxram@us.ibm.com> wrote:

> On Tue, Mar 03, 2020 at 07:50:08AM +0100, C=C3=A9dric Le Goater wrote:
> > On 3/3/20 12:32 AM, David Gibson wrote:
> > > On Fri, Feb 28, 2020 at 11:54:04PM -0800, Ram Pai wrote:
> > >> XIVE is not correctly enabled for Secure VM in the KVM Hypervisor ye=
t.
> > >>
> > >> Hence Secure VM, must always default to XICS interrupt controller.
> > >>
> > >> If XIVE is requested through kernel command line option "xive=3Don",
> > >> override and turn it off.
> > >>
> > >> If XIVE is the only supported platform interrupt controller; specifi=
ed
> > >> through qemu option "ic-mode=3Dxive", simply abort. Otherwise defaul=
t to
> > >> XICS.
> > >=20
> > > Uh... the discussion thread here seems to have gotten oddly off
> > > track. =20
> >=20
> > There seem to be multiple issues. It is difficult to have a clear statu=
s.
> >=20
> > > So, to try to clean up some misunderstandings on both sides:
> > >=20
> > >   1) The guest is the main thing that knows that it will be in secure
> > >      mode, so it's reasonable for it to conditionally use XIVE based
> > >      on that
> >=20
> > FW support is required AFAIUI.
> > >   2) The mechanism by which we do it here isn't quite right.  Here the
> > >      guest is checking itself that the host only allows XIVE, but we
> > >      can't do XIVE and is panic()ing.  Instead, in the SVM case we
> > >      should force support->xive to false, and send that in the CAS
> > >      request to the host.  We expect the host to just terminate
> > >      us because of the mismatch, but this will interact better with
> > >      host side options setting policy for panic states and the like.
> > >      Essentially an SVM kernel should behave like an old kernel with
> > >      no XIVE support at all, at least w.r.t. the CAS irq mode flags.
> >=20
> > Yes. XIVE shouldn't be requested by the guest.
>=20
> 	Ok.
>=20
> > This is the last option=20
> > I proposed but I thought there was some negotiation with the hypervisor
> > which is not the case.=20
> >=20
> > >   3) Although there are means by which the hypervisor can kind of know
> > >      a guest is in secure mode, there's not really an "svm=3Don" opti=
on
> > >      on the host side.  For the most part secure mode is based on
> > >      discussion directly between the guest and the ultravisor with
> > >      almost no hypervisor intervention.
> >=20
> > Is there a negotiation with the ultravisor ?=20
>=20
> 	The VM has no negotiation with the ultravisor w.r.t CAS.
>=20
> >=20
> > >   4) I'm guessing the problem with XIVE in SVM mode is that XIVE needs
> > >      to write to event queues in guest memory, which would have to be
> > >      explicitly shared for secure mode.  That's true whether it's KVM
> > >      or qemu accessing the guest memory, so kernel_irqchip=3Don/off is
> > >      entirely irrelevant.
> >=20
> > This problem should be already fixed.
> > The XIVE event queues are shared=20
>  =09
> Yes i have a patch for the guest kernel that shares the event=20
> queue page with the hypervisor. This is done using the
> UV_SHARE_PAGE ultracall. This patch is not sent out to any any mailing
> lists yet.

Why ?

> However the patch by itself does not solve the xive problem
> for secure VM.
>=20

This patch would allow at least to answer Cedric's question about
kernel_irqchip=3Doff, since this looks like the only thing needed
to make it work.

> > and the remaining problem with XIVE is the KVM page fault handler=20
> > populating the TIMA and ESB pages. Ultravisor doesn't seem to support
> > this feature and this breaks interrupt management in the guest.=20
>=20
> Yes. This is the bigger issue that needs to be fixed. When the secure gue=
st
> accesses the page associated with the xive memslot, a page fault is
> generated, which the ultravisor reflects to the hypervisor. Hypervisor
> seems to be mapping Hardware-page to that GPA. Unforatunately it is not
> informing the ultravisor of that map.  I am trying to understand the
> root cause. But since I am not sure what more issues I might run into
> after chasing down that issue, I figured its better to disable xive
> support in SVM in the interim.
>=20
> **** BTW: I figured, I dont need this intermin patch to disable xive for
> secure VM.  Just doing "svm=3Don xive=3Doff" on the kernel command line is
> sufficient for now. *****
>=20

No it is not. If the hypervisor doesn't propose XIVE (ie. ic-mode=3Dxive
on the QEMU command line), the kernel simply ignores "xive=3Doff".

>=20
> >=20
> > But, kernel_irqchip=3Doff should work out of the box. It seems it doesn=
't.=20
> > Something to investigate.
>=20
> Dont know why.=20
>=20
> Does this option, disable the chip from interrupting the
> guest directly; instead mediates the interrupt through the hypervisor?
>=20
> >=20
> > >=20
> > >   5) All the above said, having to use XICS is pretty crappy.  You
> > >      should really get working on XIVE support for secure VMs.
> >=20
> > Yes.=20
>=20
> and yes too.
>=20
>=20
> Summary:  I am dropping this patch for now.
>=20
> >=20
> > Thanks,
> >=20
> > C.
>=20

