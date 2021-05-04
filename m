Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F039372A3E
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 14:41:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FZKFn1h3fz2yxj
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 22:41:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=178.33.254.192; helo=3.mo52.mail-out.ovh.net;
 envelope-from=groug@kaod.org; receiver=<UNKNOWN>)
X-Greylist: delayed 1070 seconds by postgrey-1.36 at boromir;
 Tue, 04 May 2021 22:40:40 AEST
Received: from 3.mo52.mail-out.ovh.net (3.mo52.mail-out.ovh.net
 [178.33.254.192])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FZKFN0LV4z2yRK
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 May 2021 22:40:37 +1000 (AEST)
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.240])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id CD06B275188;
 Tue,  4 May 2021 14:22:40 +0200 (CEST)
Received: from kaod.org (37.59.142.101) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Tue, 4 May 2021
 14:22:38 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G0043eda4e7a-de7c-4853-8406-edae349cf2a7,
 233BADB9E061AA125F593C9F78707CF28220F307) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Tue, 4 May 2021 14:22:36 +0200
From: Greg Kurz <groug@kaod.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: remove the nvlink2 pci_vfio subdriver v2
Message-ID: <20210504142236.76994047@bahia.lan>
In-Reply-To: <20210326061311.1497642-1-hch@lst.de>
References: <20210326061311.1497642-1-hch@lst.de>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG5EX1.mxp5.local (172.16.2.41) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 316f1bea-914e-41ab-a4e8-46202395b6d3
X-Ovh-Tracer-Id: 4363706565853223297
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrvdefiedgheefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfhisehtjeeftdertddvnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeetgffffffggfekgeffteekhffhueelffdvhedvgfdthfeiudetvddulefgveevteenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdhpphgtsehnohhnghhnuhdrohhrgh
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
 Mackerras <paulus@samba.org>, Jason Gunthorpe <jgg@nvidia.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, qemu-ppc@nongnu.org,
 linux-api@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 26 Mar 2021 07:13:09 +0100
Christoph Hellwig <hch@lst.de> wrote:

> Hi all,
> 
> the nvlink2 vfio subdriver is a weird beast.  It supports a hardware
> feature without any open source component - what would normally be
> the normal open source userspace that we require for kernel drivers,
> although in this particular case user space could of course be a
> kernel driver in a VM.  It also happens to be a complete mess that
> does not properly bind to PCI IDs, is hacked into the vfio_pci driver
> and also pulles in over 1000 lines of code always build into powerpc
> kernels that have Power NV support enabled.  Because of all these
> issues and the lack of breaking userspace when it is removed I think
> the best idea is to simply kill.
> 
> Changes since v1:
>  - document the removed subtypes as reserved
>  - add the ACK from Greg
> 
> Diffstat:
>  arch/powerpc/platforms/powernv/npu-dma.c     |  705 ---------------------------
>  b/arch/powerpc/include/asm/opal.h            |    3 
>  b/arch/powerpc/include/asm/pci-bridge.h      |    1 
>  b/arch/powerpc/include/asm/pci.h             |    7 
>  b/arch/powerpc/platforms/powernv/Makefile    |    2 
>  b/arch/powerpc/platforms/powernv/opal-call.c |    2 
>  b/arch/powerpc/platforms/powernv/pci-ioda.c  |  185 -------
>  b/arch/powerpc/platforms/powernv/pci.c       |   11 
>  b/arch/powerpc/platforms/powernv/pci.h       |   17 
>  b/arch/powerpc/platforms/pseries/pci.c       |   23 
>  b/drivers/vfio/pci/Kconfig                   |    6 
>  b/drivers/vfio/pci/Makefile                  |    1 
>  b/drivers/vfio/pci/vfio_pci.c                |   18 
>  b/drivers/vfio/pci/vfio_pci_private.h        |   14 
>  b/include/uapi/linux/vfio.h                  |   38 -


Hi Christoph,

FYI, these uapi changes break build of QEMU.

I guess QEMU people should take some action before this percolates
to the QEMU source tree.

Cc'ing relevant QEMU lists to bring the discussion there.

Cheers,

--
Greg

>  drivers/vfio/pci/vfio_pci_nvlink2.c          |  490 ------------------
>  16 files changed, 12 insertions(+), 1511 deletions(-)

