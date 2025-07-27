Return-Path: <linuxppc-dev+bounces-10413-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8AF5B12DEB
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Jul 2025 08:30:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bqWvK25cMz2y2B;
	Sun, 27 Jul 2025 16:30:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753597837;
	cv=none; b=cXezqTrptNnUIFgF4vj9HjKtc6ivV4rbIK1QeeBaKp/g5zU5wolfr5a+OcfTgOLIU4DXvGQ01eRZKBQ+ZxXhA7OjqG414H/ak3Vil5T1z1ZC4KAxMclVKCd9mqI+xxIJGn3cv74MQWRKjcBJHhXZqnuRZGGVA8ziy2VGEI7zH+UdWXb1oVGVnUJVxlleVz3qgbmuJkEkkFlTxlINqpxS1TXpp//vm9T7Ob2xx8gEsDib5D9y+PpHrdhkxgTLeS92CYXM5FPgS5ng6QRYzTqhe6C7KB4TRX3Ck8G0/vlcj7/f/298Y6UsxVXSb2uCksNXyEwUd7mdwJnIQR5IIBnmBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753597837; c=relaxed/relaxed;
	bh=jjfcCyoAyA6p4trAoq7FoBBrNSgnRiG/tjvLuL/5Dpk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aPVLLBPxDd2zPv7eP8xKJKBpPDTJRsW7O1cMyj1FbkdbyvpUhD2GA+SuRDNapCCgBhalCz4sH86NnO1YmngohJ+QdtIKeVhA237XEdPgF+ehLVf4wuCFGoGusTrVZ7pE+w3JcxOP9SN+5yBl5caBmjq2ulzBEZ5d9WAD5Kav6MmmHzThOLh1TzZpLoWv5HxSCFB5qxeiZULELyEZf1S7PPF4bYKTS8bwmiTB4crKwPTMCbeq1HOGI/JZuUB7b6TaT5ExHrHQmNskvCUrjvLaF0iXhpwoxfEu7dbtWTdEGySPGE20phhl0TvB0TXlMirUsL/naqlytJZjGsQgpVuVkg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=O08zmCcV; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=O08zmCcV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bqWvJ0rR0z2xjP
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Jul 2025 16:30:36 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id F2F99A53E7D;
	Sun, 27 Jul 2025 06:30:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D8F2C4CEEB;
	Sun, 27 Jul 2025 06:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753597832;
	bh=JJ+HLI2Xg1lbocAOdaQhvUAP42x5alyGCI2q27jF8yc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O08zmCcVnVLnA+ZHOWb+eSajAvE6pm7DaQ8NMn+fNKRDLa2pRo5BX8aW+a83tPDqU
	 GgXaGRHEjqMTQaTSEwiTq+LZsr8fgXvxAZupxxQHihlRCEGeKRTYN9ZBvXGeZH5v6l
	 cNbEkyR0f0fisjYOpU+PgL5jY4ZNEON7FnZKH71NVsw/KoC5dN6YmBpvTPLR3GvZbC
	 q9K5qaRFyq+a0yKXV5afTeXYdwYrJheYw2Wafv+rq71uOtdWWY/B2IP14x5XV0q/f0
	 7brS93dUX/SVOI+l3RFg45/NhN//8bCTqZoEMGjszephsi3GB/4IZrVBAlBjvQt1f+
	 qDDzVvsJtuDAA==
Date: Sun, 27 Jul 2025 09:30:28 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Christoph Hellwig <hch@lst.de>, Jonathan Corbet <corbet@lwn.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Alexander Potapenko <glider@google.com>,
	Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	=?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, iommu@lists.linux.dev,
	virtualization@lists.linux.dev, kasan-dev@googlegroups.com,
	linux-trace-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH 6/8] dma-mapping: fail early if physical address is
 mapped through platform callback
Message-ID: <20250727063028.GX402218@unreal>
References: <cover.1750854543.git.leon@kernel.org>
 <5fc1f0ca52a85834b3e978c5d6a3171d7dd3c194.1750854543.git.leon@kernel.org>
 <02240cf7-c4d4-4296-9b1e-87b4231874a1@arm.com>
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
In-Reply-To: <02240cf7-c4d4-4296-9b1e-87b4231874a1@arm.com>
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Jul 25, 2025 at 09:04:50PM +0100, Robin Murphy wrote:
> On 2025-06-25 2:19 pm, Leon Romanovsky wrote:
> > From: Leon Romanovsky <leonro@nvidia.com>
> > 
> > All platforms which implement map_page interface don't support physical
> > addresses without real struct page. Add condition to check it.
> 
> As-is, the condition also needs to cover iommu-dma, because that also still
> doesn't support non-page-backed addresses. You can't just do a simple
> s/page/phys/ rename and hope it's OK because you happen to get away with it
> for coherent, 64-bit, trusted devices.

It needs to be follow up patch. Is this what you envision? 

diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
index e1586eb52ab34..31214fde88124 100644
--- a/kernel/dma/mapping.c
+++ b/kernel/dma/mapping.c
@@ -167,6 +167,12 @@ dma_addr_t dma_map_phys(struct device *dev, phys_addr_t phys, size_t size,
            arch_dma_map_phys_direct(dev, phys + size))
                addr = dma_direct_map_phys(dev, phys, size, dir, attrs);
        else if (use_dma_iommu(dev))
+               if (IS_ENABLED(CONFIG_DMA_API_DEBUG) &&
+                   !(attrs & DMA_ATTR_SKIP_CPU_SYNC))
+                       is_pfn_valid = pfn_valid(PHYS_PFN(phys));
+
+               if (unlikely(!is_pfn_valid))
+                       return DMA_MAPPING_ERROR;
                addr = iommu_dma_map_phys(dev, phys, size, dir, attrs);
        else {
                struct page *page = phys_to_page(phys);
~
~
~

Thanks

