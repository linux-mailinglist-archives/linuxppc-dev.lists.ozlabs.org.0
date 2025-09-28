Return-Path: <linuxppc-dev+bounces-12595-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B84BA6F65
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Sep 2025 12:54:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cZLmZ53dlz3cYx;
	Sun, 28 Sep 2025 20:54:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759056862;
	cv=none; b=Uo6LFVOYBv60mjfs+4Nn32vxgkQlJj5xeGk9IUo7fCjiFEqfDwZZ7Gf370LLlNMdUfe03d3C1bF0l4h/+uMPfaCu82G1vQvCtOg7w2ZUFDSX3bd3k1AMvhzkQKloAf/kUTi98vB8sjF+7tXwVZOfKGrQP1Dt8iGhLRdvvIlrRyZBqIEHYxQmIOHuPoS74gKih+x4eYhknzUN3NtrOpjA+wCpT8cUTc34cwm22TQs6ZQxtOfM5fGZHqA21uRoPV5GjM/bf95fxsxx4XyvBmYpadzPE522tceHKWuKE/ShTxVDGYu0Gfpir4um01g2i20PqPrlgGjcrxseRkk9zKORWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759056862; c=relaxed/relaxed;
	bh=WmY8tCYwhjm9lm2j1J7/ROkw8nuiytB3XhCprSFzZKo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zu/f9vQrq304Iz0MpS6cPmibI7Dhi07rE3Z2o7ERmD5pW2EICwugvuvbtyF4A2qM3moy9Z/2BxHWLu0bN0kQwnEMktpVwQHrACnuw+kmOcEX+JQj9n1KYVNGreRwLQjlAwGXLrq4Ig7GXHOtgFQhdqN1MgSrhvYIHOjjvaB4rO9D7Zip/yN8L7zojPMMUQpuXAWG957ITFa24J4vJ2mSfQsTDmXF59TFMOB0igc7WYMGtwvR3QW7eXVV53Yz6r8ROvKvMt3W3Uzor+q9y4+5/TcRcsDwS3YIjtAoCJlhlo06wn1VdfFzruBjw4Rb2c8hTfjjXt0CbLSvDToZ7vp+Xw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Mi76TWNG; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Mi76TWNG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cZLmY1qFKz302l
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Sep 2025 20:54:21 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8337662154;
	Sun, 28 Sep 2025 10:54:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88B2DC4CEF7;
	Sun, 28 Sep 2025 10:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759056858;
	bh=P7S8PfmMkN3lCLtx7ABMG78NQs7Q7Zq/Vrda3oeN91k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mi76TWNG7HtOxJ1wO470x2VvF26PVkc0OUNi1F1RmLvGmfrX5GsbtT4ztSWcWdTni
	 FwYt6EmiA9itKcukLOannrDDB26moF9wBf8RU6TCGr/7cNnSu/FGTcUkvY+esiPpjV
	 oDLLLJl0fuYyVanNuHzmOc5s+1VKasRLE9HsLmVxXaiXt6vgjBky/N71dJAy5Uepir
	 CU4p5RSWXOVizbnnPH00WVYjvJCU/KyNrn5gikLy+JzpNEoKRAxowD/z3vbxg6zA5c
	 Ln0RqRBJAFveWdcmsx7QgSb7xt9/rHKWmyrxxdJkXonjrmbRxHKqYef4JoF7gHahEg
	 9RAEVJXjqdX3A==
Date: Sun, 28 Sep 2025 13:54:13 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Magnus Lindholm <linmag7@gmail.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"David S. Miller" <davem@davemloft.net>,
	Geoff Levand <geoff@infradead.org>, Helge Deller <deller@gmx.de>,
	Ingo Molnar <mingo@redhat.com>, iommu@lists.linux.dev,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Jason Wang <jasowang@redhat.com>, Juergen Gross <jgross@suse.com>,
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Matt Turner <mattst88@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	sparclinux@vger.kernel.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	virtualization@lists.linux.dev, x86@kernel.org,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 1/9] alpha: Convert mapping routine to rely on physical
 address
Message-ID: <20250928105413.GE12165@unreal>
References: <cover.1758219786.git.leon@kernel.org>
 <0c64474985af55b1aa934b857808068a0e609c6e.1758219787.git.leon@kernel.org>
 <CA+=Fv5Q8dVUFVBh82mAe=fy3mV6mWtQT_0pBPLQwLNBt3f8E1g@mail.gmail.com>
 <20250923171819.GM10800@unreal>
 <CA+=Fv5SJcQ5C4UeX2+deV9mPAe5QxrocMG8EJ2eVcYjbLE5U+A@mail.gmail.com>
 <20250923235318.GD2617119@nvidia.com>
 <CA+=Fv5Tg7sQACpeG8aMZF6_E6dbRnN5ifg0aiHityXadxiHoPA@mail.gmail.com>
 <CA+=Fv5Sze_BNmHqzypmCh8p2JO6gytXH4E6hXv3gZdfoSJsMUQ@mail.gmail.com>
 <CA+=Fv5TF+RTPEkQEmVd0_=B9xbqKycLz3ck3UwcPDqacezYfFQ@mail.gmail.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+=Fv5TF+RTPEkQEmVd0_=B9xbqKycLz3ck3UwcPDqacezYfFQ@mail.gmail.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sun, Sep 28, 2025 at 12:23:48PM +0200, Magnus Lindholm wrote:
> > After reverting the above commits, I'm able to build a working kernel,
> > that is, no filesystem corruption occurs. I'll take a closer look at this
> > after the weekend.
> >
> 
> Short update,  It is enough to revert the following commits, in order to
> have a working kernel on alpha:
> 
> e78a9d72517a88faa6f16dab4d1c6f966ed378ae
> (dma-mapping: remove unused map_page callback)
> 
> d459e3b80ad1c81bf596d63d2e3347cf8c7bb0d9
> (alpha: Convert mapping routine to rely on physical address)

Thanks for the effort.

Can you please check the following change instead of reverting the patches?

diff --git a/arch/alpha/kernel/pci_iommu.c b/arch/alpha/kernel/pci_iommu.c
index b62d9937d1d3a..3e4f631a1f27d 100644
--- a/arch/alpha/kernel/pci_iommu.c
+++ b/arch/alpha/kernel/pci_iommu.c
@@ -229,6 +229,7 @@ pci_map_single_1(struct pci_dev *pdev, phys_addr_t paddr, size_t size,
 {
        struct pci_controller *hose = pdev ? pdev->sysdata : pci_isa_hose;
        dma_addr_t max_dma = pdev ? pdev->dma_mask : ISA_DMA_MASK;
+       unsigned long offset = offset_in_page(paddr);
        struct pci_iommu_arena *arena;
        long npages, dma_ofs, i;
        dma_addr_t ret;
@@ -287,7 +288,7 @@ pci_map_single_1(struct pci_dev *pdev, phys_addr_t paddr, size_t size,
                arena->ptes[i + dma_ofs] = mk_iommu_pte(paddr);

        ret = arena->dma_base + dma_ofs * PAGE_SIZE;
-       ret += offset_in_page(paddr);
+       ret += offset;

        DBGA2("pci_map_single: [%pa,%zx] np %ld -> sg %llx from %ps\n",
              &paddr, size, npages, ret, __builtin_return_address(0));
~


> 
> 
> /Magnus

