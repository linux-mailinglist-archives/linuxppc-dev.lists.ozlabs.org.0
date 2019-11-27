Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CB62210AC5F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Nov 2019 10:02:45 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47NFCl1jTdzDqBg
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Nov 2019 20:02:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=87.98.165.38; helo=6.mo2.mail-out.ovh.net;
 envelope-from=groug@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 1806 seconds by postgrey-1.36 at bilbo;
 Wed, 27 Nov 2019 20:00:44 AEDT
Received: from 6.mo2.mail-out.ovh.net (6.mo2.mail-out.ovh.net [87.98.165.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47NF9S45SbzDqbf
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Nov 2019 20:00:41 +1100 (AEDT)
Received: from player759.ha.ovh.net (unknown [10.108.57.188])
 by mo2.mail-out.ovh.net (Postfix) with ESMTP id 872141B6D2E
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Nov 2019 09:24:18 +0100 (CET)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player759.ha.ovh.net (Postfix) with ESMTPSA id EBFBBC9F0105;
 Wed, 27 Nov 2019 08:24:10 +0000 (UTC)
Date: Wed, 27 Nov 2019 09:24:08 +0100
From: Greg Kurz <groug@kaod.org>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [Very RFC 40/46] powernv/npu: Don't drop refcount when looking
 up GPU pci_devs
Message-ID: <20191127092408.5a996f41@bahia.w3ibm.bluemix.net>
In-Reply-To: <6bb90911-54fa-9f26-ec4d-7538f3303475@ozlabs.ru>
References: <20191120012859.23300-1-oohall@gmail.com>
 <20191120012859.23300-41-oohall@gmail.com>
 <6bb90911-54fa-9f26-ec4d-7538f3303475@ozlabs.ru>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 3652700775916607989
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudeigedguddulecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjqdffgfeufgfipdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgfgsehtjeertdertddvnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucffohhmrghinhepohiilhgrsghsrdhorhhgnecukfhppedtrddtrddtrddtpdekvddrvdehfedrvddtkedrvdegkeenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeehledrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehlihhnuhigphhptgdquggvvheslhhishhtshdrohiilhgrsghsrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
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
Cc: Frederic Barrat <fbarrat@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Oliver O'Halloran <oohall@gmail.com>, s.miroshnichenko@yadro.com,
 alistair@popple.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 27 Nov 2019 18:09:40 +1100
Alexey Kardashevskiy <aik@ozlabs.ru> wrote:

> 
> 
> On 20/11/2019 12:28, Oliver O'Halloran wrote:
> > The comment here implies that we don't need to take a ref to the pci_dev
> > because the ioda_pe will always have one. This implies that the current
> > expection is that the pci_dev for an NPU device will *never* be torn
> > down since the ioda_pe having a ref to the device will prevent the
> > release function from being called.
> > 
> > In other words, the desired behaviour here appears to be leaking a ref.
> > 
> > Nice!
> 
> 
> There is a history: https://patchwork.ozlabs.org/patch/1088078/
> 
> We did not fix anything in particular then, we do not seem to be fixing
> anything now (in other words - we cannot test it in a normal natural
> way). I'd drop this one.
> 

Yeah, I didn't fix anything at the time. Just reverted to the ref
count behavior we had before:

https://patchwork.ozlabs.org/patch/829172/

Frederic recently posted his take on the same topic from the OpenCAPI
point of view:

http://patchwork.ozlabs.org/patch/1198947/

He seems to indicate the NPU devices as the real culprit because
nobody ever cared for them to be removable. Fixing that seems be
a chore nobody really wants to address obviously... :-\

> 
> 
> > 
> > Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
> > ---
> >  arch/powerpc/platforms/powernv/npu-dma.c | 11 +++--------
> >  1 file changed, 3 insertions(+), 8 deletions(-)
> > 
> > diff --git a/arch/powerpc/platforms/powernv/npu-dma.c b/arch/powerpc/platforms/powernv/npu-dma.c
> > index 72d3749da02c..2eb6e6d45a98 100644
> > --- a/arch/powerpc/platforms/powernv/npu-dma.c
> > +++ b/arch/powerpc/platforms/powernv/npu-dma.c
> > @@ -28,15 +28,10 @@ static struct pci_dev *get_pci_dev(struct device_node *dn)
> >  			break;
> >  
> >  	/*
> > -	 * pci_get_domain_bus_and_slot() increased the reference count of
> > -	 * the PCI device, but callers don't need that actually as the PE
> > -	 * already holds a reference to the device. Since callers aren't
> > -	 * aware of the reference count change, call pci_dev_put() now to
> > -	 * avoid leaks.
> > +	 * NB: for_each_pci_dev() elevates the pci_dev refcount.
> > +	 * Caller is responsible for dropping the ref when it's
> > +	 * finished with it.
> >  	 */
> > -	if (pdev)
> > -		pci_dev_put(pdev);
> > -
> >  	return pdev;
> >  }
> >  
> > 
> 

