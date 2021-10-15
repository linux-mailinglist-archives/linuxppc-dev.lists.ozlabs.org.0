Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9FB42F5B7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Oct 2021 16:39:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HW86P4TKsz3cBR
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Oct 2021 01:39:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=f9C5vvm0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::433;
 helo=mail-pf1-x433.google.com; envelope-from=naveennaidu479@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=f9C5vvm0; dkim-atps=neutral
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HW85k5f4Xz3bXJ
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Oct 2021 01:38:34 +1100 (AEDT)
Received: by mail-pf1-x433.google.com with SMTP id c29so8553173pfp.2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Oct 2021 07:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=SMQahSuLkYo9QaD+Qhh/rr+IxtoKzA8Nwb2h7pqvaCk=;
 b=f9C5vvm05bjesX8SnDHArhRL/E4xsJyDuEdJdwo5gcUf4ds7/HfzOPqvl9MVE+v0M6
 EH7GnDmywUofusbnWPXVnINbgFSpnQQFZmnzb7QqVieAiT/UdCFWm0GBlTb+mCPv2pun
 OnwPmERB7qtMSDnSi2tlwoSxdk/X8844lFEUBLPCdfpvpxm9nPnCtyJmTIKtP+r2lq+e
 TUO1xQcIQKdBvW9lBgv+/nd24P/tA+7XcGHESXe8RQz3qKZIXlQZm2rppNxQi1ggqxTU
 84IXAI1DqiTvtEukEhdcxB46Cn/EXGdOEHlI1TqWy75PyBy2naikDOERIKqtUYVj5pam
 2N8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=SMQahSuLkYo9QaD+Qhh/rr+IxtoKzA8Nwb2h7pqvaCk=;
 b=HtXXZ8t0ylCG8U8hSEmn/Lh0ZgAm96goOaw75+NMfe5QC6GjZfzw0kPrb1qTJVU2ll
 EN3AZMHWuznT1EUSOsNP/bRGq++qnqgAYt6g8qJSZrJWn2szfa2afU9OFgAeSlVz54rA
 IpNmPj3oEVx1KtvTXzoBP8Oven5iOKJgSA5te90gVpl5gCUbOHYw8fY5ycVH646AtXoW
 BFqp85Roh7gJ3cqA841Lec+RBsoi2yjoUWxJ1bDToPulyYx7xr9sPJnYoyOSb7K0ZJjE
 E7XouN7MMAsYB0MPpM2DwF8GyZmDGMNsu9JDf3S1wwXD9HfXQcB6fH72rvWPfSfDXUpt
 KMnw==
X-Gm-Message-State: AOAM533n/Lm7ppr2MmxRan4LKl6k58k2KtHQcaDTKJDPOcp3aBWh2fQu
 dGEG0ZN0CNDSdStWk4VneTM=
X-Google-Smtp-Source: ABdhPJy3KchjBGO6Ql9f4dVlV9jPJcB0Yra/m1Nx/lqa6aj1Bh1ThIeCJpbVbUTEIVBjipN6SfnlEA==
X-Received: by 2002:aa7:8149:0:b0:44c:916c:1fdb with SMTP id
 d9-20020aa78149000000b0044c916c1fdbmr12465808pfn.34.1634308711265; 
 Fri, 15 Oct 2021 07:38:31 -0700 (PDT)
Received: from theprophet ([2406:7400:63:4806:9a51:7f4b:9b5c:337a])
 by smtp.gmail.com with ESMTPSA id g14sm11656625pjd.24.2021.10.15.07.38.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 07:38:30 -0700 (PDT)
Date: Fri, 15 Oct 2021 20:08:18 +0530
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com
Subject: Re: [PATCH v2 00/24] Unify PCI error response checking
Message-ID: <20211015143818.gvkcs5j6zvdino2r@theprophet>
References: <cover.1634300660.git.naveennaidu479@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1634300660.git.naveennaidu479@gmail.com>
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
Cc: Rob Herring <robh@kernel.org>, linux-hyperv@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>,
 linux-pci@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 15/10, Naveen Naidu wrote:
> An MMIO read from a PCI device that doesn't exist or doesn't respond
> causes a PCI error.  There's no real data to return to satisfy the 
> CPU read, so most hardware fabricates ~0 data.
> 
> This patch series adds PCI_ERROR_RESPONSE definition and other helper
> definition SET_PCI_ERROR_RESPONSE and RESPONSE_IS_PCI_ERROR and uses it
> where appropriate to make these checks consistent and easier to find.
> 
> This helps unify PCI error response checking and make error check
> consistent and easier to find.
> 
> This series also ensures that the error response fabrication now happens
> in the PCI_OP_READ and PCI_USER_READ_CONFIG. This removes the
> responsibility from controller drivers to do the error response setting. 
> 
> Patch 1:
>     - Adds the PCI_ERROR_RESPONSE and other related defintions
>     - All other patches are dependent on this patch. This patch needs to
>       be applied first, before the others
> 
> Patch 2:
>     - Error fabrication happens in PCI_OP_READ and PCI_USER_READ_CONFIG
>       whenever the data read via the controller driver fails.
>     - This patch needs to be applied before, Patch 4/24 to Patch 15/24 are
>       applied.
> 
> Patch 3:
>     - Uses SET_PCI_ERROR_RESPONSE() when device is not found and
>       RESPONSE_IS_PCI_ERROR() to check hardware read from the hardware.
> 
> Patch 4 - 15:
>     - Removes redundant error fabrication that happens in controller 
>       drivers when the read from a PCI device fails.
>     - These patches are dependent on Patch 2/24 of the series.
>     - These can be applied in any order.
> 
> Patch 16 - 22:
>     - Uses RESPONSE_IS_PCI_ERROR() to check the reads from hardware
>     - Patches can be applied in any order.
> 
> Patch 23 - 24:
>     - Edits the comments to include PCI_ERROR_RESPONSE alsong with
>       0xFFFFFFFF, so that it becomes easier to grep for faulty 
>       hardware reads.
> 
> Changelog
> =========
> 
> v2:
>     - Instead of using SET_PCI_ERROR_RESPONSE in all controller drivers
>       to fabricate error response, only use them in PCI_OP_READ and
>       PCI_USER_READ_CONFIG
> 
> Naveen Naidu (24):
>  [PATCH 1/24] PCI: Add PCI_ERROR_RESPONSE and it's related definitions
>  [PATCH 2/24] PCI: Set error response in config access defines when ops->read() fails
>  [PATCH 3/24] PCI: Unify PCI error response checking
>  [PATCH 4/24] PCI: Remove redundant error fabrication when device read fails
>  [PATCH 5/24] PCI: thunder: Remove redundant error fabrication when device read fails
>  [PATCH 6/24] PCI: iproc: Remove redundant error fabrication when device read fails
>  [PATCH 7/24] PCI: mediatek: Remove redundant error fabrication when device read fails
>  [PATCH 8/24] PCI: exynos: Remove redundant error fabrication when device read fails
>  [PATCH 9/24] PCI: histb: Remove redundant error fabrication when device read fails
>  [PATCH 10/24] PCI: kirin: Remove redundant error fabrication when device read fails
>  [PATCH 11/24] PCI: aardvark: Remove redundant error fabrication when device read fails
>  [PATCH 12/24] PCI: mvebu: Remove redundant error fabrication when device read fails
>  [PATCH 13/24] PCI: altera: Remove redundant error fabrication when device read fails
>  [PATCH 14/24] PCI: rcar: Remove redundant error fabrication when device read fails
>  [PATCH 15/24] PCI: rockchip: Remove redundant error fabrication when device read fails
>  [PATCH 16/24] PCI/ERR: Use RESPONSE_IS_PCI_ERROR() to check read from hardware
>  [PATCH 17/24] PCI: vmd: Use RESPONSE_IS_PCI_ERROR() to check read from hardware
>  [PATCH 18/24] PCI: pciehp: Use RESPONSE_IS_PCI_ERROR() to check read from hardware
>  [PATCH 19/24] PCI/DPC: Use RESPONSE_IS_PCI_ERROR() to check read from hardware
>  [PATCH 20/24] PCI/PME: Use RESPONSE_IS_PCI_ERROR() to check read from hardware
>  [PATCH 21/24] PCI: cpqphp: Use RESPONSE_IS_PCI_ERROR() to check read from hardware
>  [PATCH 22/24] PCI: keystone: Use PCI_ERROR_RESPONSE to specify hardware error
>  [PATCH 23/24] PCI: hv: Use PCI_ERROR_RESPONSE to specify hardware read error
>  [PATCH 24/24] PCI: xgene: Use PCI_ERROR_RESPONSE to specify hardware error
> 
>  drivers/pci/access.c                        | 36 ++++++++--------
>  drivers/pci/controller/dwc/pci-exynos.c     |  4 +-
>  drivers/pci/controller/dwc/pci-keystone.c   |  4 +-
>  drivers/pci/controller/dwc/pcie-histb.c     |  4 +-
>  drivers/pci/controller/dwc/pcie-kirin.c     |  4 +-
>  drivers/pci/controller/pci-aardvark.c       | 10 +----
>  drivers/pci/controller/pci-hyperv.c         |  2 +-
>  drivers/pci/controller/pci-mvebu.c          |  8 +---
>  drivers/pci/controller/pci-thunder-ecam.c   | 46 +++++++--------------
>  drivers/pci/controller/pci-thunder-pem.c    |  4 +-
>  drivers/pci/controller/pci-xgene.c          |  8 ++--
>  drivers/pci/controller/pcie-altera.c        |  4 +-
>  drivers/pci/controller/pcie-iproc.c         |  4 +-
>  drivers/pci/controller/pcie-mediatek.c      | 11 +----
>  drivers/pci/controller/pcie-rcar-host.c     |  4 +-
>  drivers/pci/controller/pcie-rockchip-host.c |  4 +-
>  drivers/pci/controller/vmd.c                |  2 +-
>  drivers/pci/hotplug/cpqphp_ctrl.c           |  4 +-
>  drivers/pci/hotplug/pciehp_hpc.c            | 10 ++---
>  drivers/pci/pci.c                           | 10 ++---
>  drivers/pci/pcie/dpc.c                      |  4 +-
>  drivers/pci/pcie/pme.c                      |  4 +-
>  drivers/pci/probe.c                         | 10 ++---
>  include/linux/pci.h                         |  9 ++++
>  24 files changed, 87 insertions(+), 123 deletions(-)
> 
> -- 
> 2.25.1
>

Please ignore this stray cover letter. I had a wrong message ID written
for it. Apologies for the inconvenience caused.

