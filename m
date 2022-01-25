Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE4849BC17
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jan 2022 20:29:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jjxjk6bnHz3cQq
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jan 2022 06:28:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.214.177;
 helo=mail-pl1-f177.google.com; envelope-from=moritz.fischer.private@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JjxjC503gz2yQK
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jan 2022 06:28:29 +1100 (AEDT)
Received: by mail-pl1-f177.google.com with SMTP id j16so9779062plx.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jan 2022 11:28:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Rkz5i91jrZJto37j3RGSd05f/eRfvo2BCm796nin8Vs=;
 b=t9V9F+CQ91qU6oyNijHYhnOa5U4lMCAh9GGhLudUj0LVr2wI5lFlXOTM+p08fJIGr1
 5CfCp6taEyBlo4E7213ZBhJCL1tysQ6LjHkQkjEyR9RzlzlJg1gPWkPBUSDZUd8Yo+VE
 fZcRL4zOvwUgnSQtCyHfBtVBtMQpWd4zipc0wSCSVZtqs27m2Dt+scvi7TbZBdvY4GFL
 VhS07ue8wiurKtm8zmPjwlkFyQt+rlfYmfZ2F+aoQZHNjMg75Z4cuvTsdIjhqlGsOcF+
 daSSToeNgzIFKGWLTwiyTWTOHqTgK8a647fpBR9LGjb5FBaG42KNNIvu/tBEtY033rrg
 x15w==
X-Gm-Message-State: AOAM530c9O+n84Zt/0ZGN4/22tZwkEWY8tEPOYJxeQttwP+8h6dMXNah
 dgRWjhMdR5eDclBq7TUghSI=
X-Google-Smtp-Source: ABdhPJyeNd/r+jQn3mMtMf9He8DTH104dq3dEwAvQtFQxWx1zXikeSDUCeamDKcdFDb0ku5F8bxZDQ==
X-Received: by 2002:a17:902:6bc9:b0:149:fdf1:f031 with SMTP id
 m9-20020a1709026bc900b00149fdf1f031mr19734916plt.58.1643138906187; 
 Tue, 25 Jan 2022 11:28:26 -0800 (PST)
Received: from localhost ([2601:647:5b00:ece0:aab:34ff:52ca:a7a5])
 by smtp.gmail.com with ESMTPSA id qe15sm1162214pjb.47.2022.01.25.11.28.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jan 2022 11:28:25 -0800 (PST)
Date: Tue, 25 Jan 2022 11:28:24 -0800
From: Moritz Fischer <mdf@kernel.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH 00/16] Remove usage of the deprecated "pci-dma-compat.h"
 API
Message-ID: <YfBPWB9m5TWcZuFY@epycbox.lan>
References: <cover.1641500561.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1641500561.git.christophe.jaillet@wanadoo.fr>
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
Cc: airlied@linux.ie, trix@redhat.com, linux-fpga@vger.kernel.org,
 linux-pci@vger.kernel.org, paulus@samba.org, sparclinux@vger.kernel.org,
 kernel-janitors@vger.kernel.org, linux-scsi@vger.kernel.org,
 sathya.prakash@broadcom.com, hch@infradead.org,
 MPT-FusionLinux.pdl@broadcom.com, hao.wu@intel.com, arnd@arndb.de,
 suganath-prabu.subramani@broadcom.com, sreekanth.reddy@broadcom.com,
 ink@jurassic.park.msu.ru, bhelgaas@google.com, mchehab@kernel.org,
 mattst88@gmail.com, rth@twiddle.net, awalls@md.metrocast.net,
 linux-kernel@vger.kernel.org, davem@davemloft.net, alex.bou9@gmail.com,
 vkoul@kernel.org, linux-alpha@vger.kernel.org, dmaengine@vger.kernel.org,
 mdf@kernel.org, akpm@linux-foundation.org, linux-media@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, yilun.xu@intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 06, 2022 at 10:45:13PM +0100, Christophe JAILLET wrote:
> This serie axes all the remaining usages of the deprecated "pci-dma-compat.h"
> API.
> 
> All these patches have already been posted.
> 
> They have been generated with a coccinelle script.
> The tricky parts are patches that use dma_alloc_coherent() because the correct
> GFP flag has to be used in place of the previous embedded GFP_ATOMIC.
> 
> Patches 1-3 are already Reviewed. References to the corresponding mail is
> given below the ---
> 
> Patch 1-2,4-10 are just generated from the coccinelle script. Only too long
> lines have been hand modified. dma_alloc_coherent() modification are NOT part
> of these patches.
> 
> Patch 3 also includes some 'dma_set_mask_and_coherent()' instead of
> 'pci_set_dma_mask()/pci_set_consistent_dma_mask()'.
> I've left this additional modification because it was reviewed with it.
> 
> Patch 10-15 are the tricky parts. Explanation of which GFP flag is the right one
> is given in each patch. It has been divided in several patches to ease review.
> 
> Patch 15 is the only one I'm slighly unsure with. The old code was using a
> GFP_USER flag in the function. I'm not familiar with it.
> I *guess*  that GFP_KERNEL is fine, but maybe it should also be GFP_USER or left
> as GFP_ATOMIC so that nothing is changed.
> 
> Patch 16 is the last step that remove "pci-dma-compat.h" and its only usage.
> 
> 
> All patches, exept 1-2,6 that are architecture specific, have been compile tested.
> 
> 
> After all that, a few rst files, 1 or 2 strings in error messages and some
> error branching labels should still need some attention. 
> This is some minor issues.
> 
> 
> Only the cover letter is sent to every one. Each patch is sent to the
> corresponding maintainer(s) + Andrew Morton, Christoph Hellwig and Arnd Bergmann.
> 
> 
> Best regards.
> 
> 
> Christophe JAILLET (16):
>   alpha: Remove usage of the deprecated "pci-dma-compat.h" API
>   floppy: Remove usage of the deprecated "pci-dma-compat.h" API
>   fpga: dfl: pci: Remove usage of the deprecated "pci-dma-compat.h" API
>   media: Remove usage of the deprecated "pci-dma-compat.h" API
>   agp/intel: Remove usage of the deprecated "pci-dma-compat.h" API
>   sparc: Remove usage of the deprecated "pci-dma-compat.h" API
>   dmaengine: pch_dma: Remove usage of the deprecated "pci-dma-compat.h"
>     API
>   rapidio/tsi721: Remove usage of the deprecated "pci-dma-compat.h" API
>   media: v4l2-pci-skeleton: Remove usage of the deprecated
>     "pci-dma-compat.h" API
>   scsi: message: fusion: Remove usage of the deprecated
>     "pci-dma-compat.h" API
>   scsi: mptbase: Use dma_alloc_coherent() in 'mpt_alloc_fw_memory()'
>   scsi: mptbase: Use dma_alloc_coherent()
>   scsi: mptsas: Use dma_alloc_coherent() in
>     mptsas_exp_repmanufacture_info()
>   scsi: mptsas: Use dma_alloc_coherent()
>   scsi: mptctl: Use dma_alloc_coherent()
>   PCI: Remove usage of the deprecated "pci-dma-compat.h" API
> 
>  arch/alpha/include/asm/floppy.h     |   7 +-
>  arch/alpha/kernel/pci_iommu.c       |  12 +--
>  arch/powerpc/include/asm/floppy.h   |   8 +-
>  arch/sparc/kernel/ioport.c          |   2 +-
>  drivers/char/agp/intel-gtt.c        |  26 ++---
>  drivers/dma/pch_dma.c               |   2 +-
>  drivers/fpga/dfl-pci.c              |  14 +--
>  drivers/media/pci/cx18/cx18-queue.h |   6 +-
>  drivers/media/pci/ivtv/ivtv-queue.h |  25 +++--
>  drivers/media/pci/ivtv/ivtv-udma.h  |   8 +-
>  drivers/message/fusion/mptbase.c    | 149 ++++++++++++++++------------
>  drivers/message/fusion/mptctl.c     |  82 +++++++++------
>  drivers/message/fusion/mptlan.c     |  90 +++++++++--------
>  drivers/message/fusion/mptsas.c     |  94 +++++++++---------
>  drivers/rapidio/devices/tsi721.c    |   8 +-
>  include/linux/pci-dma-compat.h      | 129 ------------------------
>  include/linux/pci.h                 |   3 -
>  samples/v4l/v4l2-pci-skeleton.c     |   2 +-
>  18 files changed, 289 insertions(+), 378 deletions(-)
>  delete mode 100644 include/linux/pci-dma-compat.h
> 
> -- 
> 2.32.0
> 
Applied [03/16] to linux-fpga for-next.

Thanks,
Moritz
