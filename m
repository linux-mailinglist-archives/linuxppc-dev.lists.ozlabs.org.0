Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93056372B0C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 15:31:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FZLMZ3zrNz3bmX
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 23:31:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=178.33.254.192; helo=3.mo52.mail-out.ovh.net;
 envelope-from=groug@kaod.org; receiver=<UNKNOWN>)
Received: from 3.mo52.mail-out.ovh.net (3.mo52.mail-out.ovh.net
 [178.33.254.192])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FZLM54LLnz302W
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 May 2021 23:30:40 +1000 (AEST)
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.44])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id D5D53271E7E;
 Tue,  4 May 2021 15:20:36 +0200 (CEST)
Received: from kaod.org (37.59.142.95) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Tue, 4 May 2021
 15:20:35 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G001561d069d-41f7-46fe-a360-76441386f8a7,
 233BADB9E061AA125F593C9F78707CF28220F307) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Tue, 4 May 2021 15:20:34 +0200
From: Greg Kurz <groug@kaod.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: remove the nvlink2 pci_vfio subdriver v2
Message-ID: <20210504152034.18e41ec3@bahia.lan>
In-Reply-To: <YJFFG1tSP0dUCxcX@kroah.com>
References: <20210326061311.1497642-1-hch@lst.de>
 <20210504142236.76994047@bahia.lan> <YJFFG1tSP0dUCxcX@kroah.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 5cc3bb94-3971-431f-b7fb-ec3b378d2bfe
X-Ovh-Tracer-Id: 5342395058935667073
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrvdefiedgieehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfhisehtjeertdertddvnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeefuddtieejjeevheekieeltefgleetkeetheettdeifeffvefhffelffdtfeeljeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdqphhptgesnhhonhhgnhhurdhorhhg
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
Cc: Daniel Vetter <daniel@ffwll.ch>, kvm@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, qemu-devel@nongnu.org,
 Alex Williamson <alex.williamson@redhat.com>, Paul
 Mackerras <paulus@samba.org>, Jason Gunthorpe <jgg@nvidia.com>,
 linux-api@vger.kernel.org, qemu-ppc@nongnu.org, linuxppc-dev@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 4 May 2021 14:59:07 +0200
Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:

> On Tue, May 04, 2021 at 02:22:36PM +0200, Greg Kurz wrote:
> > On Fri, 26 Mar 2021 07:13:09 +0100
> > Christoph Hellwig <hch@lst.de> wrote:
> > 
> > > Hi all,
> > > 
> > > the nvlink2 vfio subdriver is a weird beast.  It supports a hardware
> > > feature without any open source component - what would normally be
> > > the normal open source userspace that we require for kernel drivers,
> > > although in this particular case user space could of course be a
> > > kernel driver in a VM.  It also happens to be a complete mess that
> > > does not properly bind to PCI IDs, is hacked into the vfio_pci driver
> > > and also pulles in over 1000 lines of code always build into powerpc
> > > kernels that have Power NV support enabled.  Because of all these
> > > issues and the lack of breaking userspace when it is removed I think
> > > the best idea is to simply kill.
> > > 
> > > Changes since v1:
> > >  - document the removed subtypes as reserved
> > >  - add the ACK from Greg
> > > 
> > > Diffstat:
> > >  arch/powerpc/platforms/powernv/npu-dma.c     |  705 ---------------------------
> > >  b/arch/powerpc/include/asm/opal.h            |    3 
> > >  b/arch/powerpc/include/asm/pci-bridge.h      |    1 
> > >  b/arch/powerpc/include/asm/pci.h             |    7 
> > >  b/arch/powerpc/platforms/powernv/Makefile    |    2 
> > >  b/arch/powerpc/platforms/powernv/opal-call.c |    2 
> > >  b/arch/powerpc/platforms/powernv/pci-ioda.c  |  185 -------
> > >  b/arch/powerpc/platforms/powernv/pci.c       |   11 
> > >  b/arch/powerpc/platforms/powernv/pci.h       |   17 
> > >  b/arch/powerpc/platforms/pseries/pci.c       |   23 
> > >  b/drivers/vfio/pci/Kconfig                   |    6 
> > >  b/drivers/vfio/pci/Makefile                  |    1 
> > >  b/drivers/vfio/pci/vfio_pci.c                |   18 
> > >  b/drivers/vfio/pci/vfio_pci_private.h        |   14 
> > >  b/include/uapi/linux/vfio.h                  |   38 -
> > 
> > 
> > Hi Christoph,
> > 
> > FYI, these uapi changes break build of QEMU.
> 
> What uapi changes?
> 

All macros and structure definitions that are being removed
from include/uapi/linux/vfio.h by patch 1.

> What exactly breaks?
> 

These macros and types are used by the current QEMU code base.
Next time the QEMU source tree updates its copy of the kernel
headers, the compilation of affected code will fail.

> Why does QEMU require kernel driver stuff?
> 

Not sure to understand the question... is there a problem
with QEMU using an already published uapi ?

> thanks,
> 
> greg k-h

