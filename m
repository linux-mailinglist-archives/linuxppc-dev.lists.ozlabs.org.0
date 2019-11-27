Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D1310AFFA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Nov 2019 14:13:58 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47NLnZ5kPbzDqwL
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Nov 2019 00:13:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=46.105.75.45; helo=9.mo178.mail-out.ovh.net;
 envelope-from=groug@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from 9.mo178.mail-out.ovh.net (9.mo178.mail-out.ovh.net
 [46.105.75.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47NLj72DCZzDqts
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Nov 2019 00:09:59 +1100 (AEDT)
Received: from player692.ha.ovh.net (unknown [10.109.146.163])
 by mo178.mail-out.ovh.net (Postfix) with ESMTP id E479883EB8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Nov 2019 10:34:02 +0100 (CET)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player692.ha.ovh.net (Postfix) with ESMTPSA id 61949C796169;
 Wed, 27 Nov 2019 09:33:56 +0000 (UTC)
Date: Wed, 27 Nov 2019 10:33:54 +0100
From: Greg Kurz <groug@kaod.org>
To: Frederic Barrat <fbarrat@linux.ibm.com>
Subject: Re: [Very RFC 40/46] powernv/npu: Don't drop refcount when looking
 up GPU pci_devs
Message-ID: <20191127103354.0758b079@bahia.w3ibm.bluemix.net>
In-Reply-To: <851d7f28-8698-ec0b-7732-423c0926ce94@linux.ibm.com>
References: <20191120012859.23300-1-oohall@gmail.com>
 <20191120012859.23300-41-oohall@gmail.com>
 <6bb90911-54fa-9f26-ec4d-7538f3303475@ozlabs.ru>
 <20191127092408.5a996f41@bahia.w3ibm.bluemix.net>
 <851d7f28-8698-ec0b-7732-423c0926ce94@linux.ibm.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Ovh-Tracer-Id: 4830673552944699749
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudeihedgtdegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdqfffguegfifdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfesthhqredtredtjeenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuffhomhgrihhnpehoiihlrggsshdrohhrghenucfkpheptddrtddrtddrtddpkedvrddvheefrddvtdekrddvgeeknecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrheiledvrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtoheplhhinhhugihpphgtqdguvghvsehlihhsthhsrdhoiihlrggsshdrohhrghenucevlhhushhtvghrufhiiigvpedt
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org,
 Oliver O'Halloran <oohall@gmail.com>, s.miroshnichenko@yadro.com,
 alistair@popple.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 27 Nov 2019 10:10:13 +0100
Frederic Barrat <fbarrat@linux.ibm.com> wrote:

>=20
>=20
> Le 27/11/2019 =C3=A0 09:24, Greg Kurz a =C3=A9crit=C2=A0:
> > On Wed, 27 Nov 2019 18:09:40 +1100
> > Alexey Kardashevskiy <aik@ozlabs.ru> wrote:
> >=20
> >>
> >>
> >> On 20/11/2019 12:28, Oliver O'Halloran wrote:
> >>> The comment here implies that we don't need to take a ref to the pci_=
dev
> >>> because the ioda_pe will always have one. This implies that the curre=
nt
> >>> expection is that the pci_dev for an NPU device will *never* be torn
> >>> down since the ioda_pe having a ref to the device will prevent the
> >>> release function from being called.
> >>>
> >>> In other words, the desired behaviour here appears to be leaking a re=
f.
> >>>
> >>> Nice!
> >>
> >>
> >> There is a history: https://patchwork.ozlabs.org/patch/1088078/
> >>
> >> We did not fix anything in particular then, we do not seem to be fixing
> >> anything now (in other words - we cannot test it in a normal natural
> >> way). I'd drop this one.
> >>
> >=20
> > Yeah, I didn't fix anything at the time. Just reverted to the ref
> > count behavior we had before:
> >=20
> > https://patchwork.ozlabs.org/patch/829172/
> >=20
> > Frederic recently posted his take on the same topic from the OpenCAPI
> > point of view:
> >=20
> > http://patchwork.ozlabs.org/patch/1198947/
> >=20
> > He seems to indicate the NPU devices as the real culprit because
> > nobody ever cared for them to be removable. Fixing that seems be
> > a chore nobody really wants to address obviously... :-\
>=20
>=20
> I had taken a stab at not leaking a ref for the nvlink devices and do=20
> the proper thing regarding ref counting (i.e. fixing all the callers of=20
> get_pci_dev() to drop the reference when they were done). With that, I=20
> could see that the ref count of the nvlink devices could drop to 0=20
> (calling remove for the device in /sys) and that the devices could go awa=
y.
>=20
> But then, I realized it's not necessarily desirable at this point. There=
=20
> are several comments in the code saying the npu devices (for nvlink)=20
> don't go away, there's no device release callback defined when it seems=20
> there should be, at least to handle releasing PEs.... All in all, it=20
> seems that some work would be needed. And if it hasn't been required by=20
> now...
>=20

If everyone is ok with leaking a reference in the NPU case, I guess
this isn't a problem. But if we move forward with Oliver's patch, a
pci_dev_put() would be needed for OpenCAPI, correct ?

>    Fred
>=20
>=20
> >>
> >>
> >>>
> >>> Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
> >>> ---
> >>>   arch/powerpc/platforms/powernv/npu-dma.c | 11 +++--------
> >>>   1 file changed, 3 insertions(+), 8 deletions(-)
> >>>
> >>> diff --git a/arch/powerpc/platforms/powernv/npu-dma.c b/arch/powerpc/=
platforms/powernv/npu-dma.c
> >>> index 72d3749da02c..2eb6e6d45a98 100644
> >>> --- a/arch/powerpc/platforms/powernv/npu-dma.c
> >>> +++ b/arch/powerpc/platforms/powernv/npu-dma.c
> >>> @@ -28,15 +28,10 @@ static struct pci_dev *get_pci_dev(struct device_=
node *dn)
> >>>   			break;
> >>>  =20
> >>>   	/*
> >>> -	 * pci_get_domain_bus_and_slot() increased the reference count of
> >>> -	 * the PCI device, but callers don't need that actually as the PE
> >>> -	 * already holds a reference to the device. Since callers aren't
> >>> -	 * aware of the reference count change, call pci_dev_put() now to
> >>> -	 * avoid leaks.
> >>> +	 * NB: for_each_pci_dev() elevates the pci_dev refcount.
> >>> +	 * Caller is responsible for dropping the ref when it's
> >>> +	 * finished with it.
> >>>   	 */
> >>> -	if (pdev)
> >>> -		pci_dev_put(pdev);
> >>> -
> >>>   	return pdev;
> >>>   }
> >>>  =20
> >>>
> >>
> >=20
>=20

