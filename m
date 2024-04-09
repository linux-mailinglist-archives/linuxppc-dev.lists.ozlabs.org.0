Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C03989D271
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Apr 2024 08:29:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256 header.s=default header.b=SUexIQz8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VDGK815zbz3vcl
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Apr 2024 16:29:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256 header.s=default header.b=SUexIQz8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=tkos.co.il (client-ip=84.110.109.230; helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=lists.ozlabs.org)
Received: from mail.tkos.co.il (mail.tkos.co.il [84.110.109.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VDGDT2sNfz3bZ3
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Apr 2024 16:25:45 +1000 (AEST)
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.tkos.co.il (Postfix) with ESMTPS id 48858440459;
	Tue,  9 Apr 2024 09:17:45 +0300 (IDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
	s=default; t=1712643465;
	bh=R7K6bnEO9GvrFuZ5cBFijMFOruRQKScFkxZi8ojrTRc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SUexIQz8PPD4zBDvys8qW4vICsMoWwrv/Gnfl1XbfryJUgAXmhmvGF4hBnq0rrs9u
	 dJkOWwvsTTJp49f/96CsJAOe7SVxyJYmn5IBK2tBlDDM4FQfyhOmfOsb7RCYJ7mGFQ
	 Z4pxD5uzbWSNMoTrZSEaMPdDEDESwEICV6BGapb1jO3WPznEXPBWQu8Uyy1eK7bhgh
	 VJ2vFMvDL4Ab8KkyRmwnBkXCZkJWEUa948eREug5DCra0Vd7D1+U+jx3rFF10m0DVj
	 SXe8/7ivvfBvgkUsoa+sOWN7M+3AT9z4tW1kFS6QMaNP60x6miJmpnTgoukgFTIE6O
	 pV1sS2D6zWaJw==
From: Baruch Siach <baruch@tkos.co.il>
To: Christoph Hellwig <hch@lst.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH RFC v2 5/5] arm64: mm: take DMA zone offset into account
Date: Tue,  9 Apr 2024 09:17:58 +0300
Message-ID: <2fa9d7954a99b018a32314b9baab25ba18504f15.1712642324.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1712642324.git.baruch@tkos.co.il>
References: <cover.1712642324.git.baruch@tkos.co.il>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, Baruch Siach <baruch@tkos.co.il>, Ramon Fried <ramon@neureality.ai>, linux-s390@vger.kernel.org, =?UTF-8?q?Petr=20Tesa=C5=99=C3=ADk?= <petr@tesarici.cz>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, iommu@lists.linux.dev, Elad Nachman <enachman@marvell.com>, Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit 791ab8b2e3db ("arm64: Ignore any DMA offsets in the
max_zone_phys() calculation") made DMA/DMA32 zones span the entire RAM
when RAM starts above 32-bits. This breaks hardware with DMA area that
start above 32-bits. But the commit log says that "we haven't noticed
any such hardware". It turns out that such hardware does exist.

One such platform has RAM starting at 32GB with an internal bus that has
the following DMA limits:

  #address-cells = <2>;
  #size-cells = <2>;
  dma-ranges = <0x00 0xc0000000 0x08 0x00000000 0x00 0x40000000>;

Devices under this bus can see 1GB of DMA range between 3GB-4GB in each
device address space. This range is mapped to CPU memory at 32GB-33GB.
With current code DMA allocations for devices under this bus are not
limited to DMA area, leading to run-time allocation failure.

Modify 'zone_dma_bits' calculation (via dt_zone_dma_bits) to only cover
the actual DMA area starting at 'zone_dma_off'. Use the newly introduced
'min' parameter of of_dma_get_cpu_limits() to set 'zone_dma_off'.

DMA32 zone is useless in this configuration, so make its limit the same
as the DMA zone when the lower DMA limit is higher than 32-bits.

The result is DMA zone that properly reflects the hardware constraints
as follows:

[    0.000000] Zone ranges:
[    0.000000]   DMA      [mem 0x0000000800000000-0x000000083fffffff]
[    0.000000]   DMA32    empty
[    0.000000]   Normal   [mem 0x0000000840000000-0x0000000bffffffff]

Suggested-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 arch/arm64/mm/init.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
index 77e942ca578b..cd283ae0178d 100644
--- a/arch/arm64/mm/init.c
+++ b/arch/arm64/mm/init.c
@@ -128,9 +128,11 @@ static void __init zone_sizes_init(void)
 
 #ifdef CONFIG_ZONE_DMA
 	acpi_zone_dma_limit = acpi_iort_dma_get_max_cpu_address();
-	of_dma_get_cpu_limits(NULL, &dt_zone_dma_limit, NULL);
+	of_dma_get_cpu_limits(NULL, &dt_zone_dma_limit, &zone_dma_base);
 	zone_dma_limit = min(dt_zone_dma_limit, acpi_zone_dma_limit);
 	arm64_dma_phys_limit = max_zone_phys(zone_dma_limit);
+	if (zone_dma_base > U32_MAX)
+		dma32_phys_limit = arm64_dma_phys_limit;
 	max_zone_pfns[ZONE_DMA] = PFN_DOWN(arm64_dma_phys_limit);
 #endif
 #ifdef CONFIG_ZONE_DMA32
-- 
2.43.0

