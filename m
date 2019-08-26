Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 557859D17F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2019 16:18:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46HDct5cK6zDqKb
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 00:18:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (mailfrom)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+64c9f4a429f346f2dac5+5846+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.b="fMe7aSwV"; dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46HCSx4HN5zDqSB
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Aug 2019 23:26:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
 :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=B1hiIfQ+IMMoK0UwnaPA+7E8zI516MBjiIdUjTMmRXQ=; b=fMe7aSwVdVuFHzkDJPu42O11Zj
 TBtavI5OasUn5QBVUMb/kxVtMA/fmVJ0XUXCosf6ZhZBvj9PLbh+knag2U84iwvNjKO7zSSmKh25Q
 9DJ9sB+wbdfzSJQslXxnxmtv5GBMgpHMskVXsYV0SD9r5oVagLXN1bRpY82B66HbPrOWY3bw1q6Fi
 ahkWOi9xKrGYlpi4WiJfOPgiP0qnRIeJTE7tvjbbon20xoE0TPB7iq4flXYOFsu8o+j3x47eOuc6d
 5JCNtNJBohtl83en+5OEK9KPqmnI314j42yxDaBvRji6FH/um/PtUNU0CvcUCXcmdIVtVF9XceAra
 cz66i6fA==;
Received: from clnet-p19-102.ikbnet.co.at ([83.175.77.102] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1i2F0e-0007xw-57; Mon, 26 Aug 2019 13:26:12 +0000
From: Christoph Hellwig <hch@lst.de>
To: iommu@lists.linux-foundation.org
Subject: [PATCH 5/6] arm64: document the choice of page attributes for
 pgprot_dmacoherent
Date: Mon, 26 Aug 2019 15:25:52 +0200
Message-Id: <20190826132553.4116-6-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190826132553.4116-1-hch@lst.de>
References: <20190826132553.4116-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: Mark Rutland <mark.rutland@arm.com>, Shawn Anastasio <shawn@anastas.io>,
 Will Deacon <will@kernel.org>, linux-m68k@lists.linux-m68k.org,
 Guan Xuetao <gxt@pku.edu.cn>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
 linux-mips@vger.kernel.org, Paul Burton <paul.burton@mips.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Catalin Marinas <catalin.marinas@arm.com>, James Hogan <jhogan@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Based on an email from Will Deacon.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Acked-by: Will Deacon <will@kernel.org>
Acked-by: Mark Rutland <mark.rutland@arm.com>
---
 arch/arm64/include/asm/pgtable.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 6700371227d1..fd40fb05eb51 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -435,6 +435,14 @@ static inline pmd_t pmd_mkdevmap(pmd_t pmd)
 	__pgprot_modify(prot, PTE_ATTRINDX_MASK, PTE_ATTRINDX(MT_NORMAL_NC) | PTE_PXN | PTE_UXN)
 #define pgprot_device(prot) \
 	__pgprot_modify(prot, PTE_ATTRINDX_MASK, PTE_ATTRINDX(MT_DEVICE_nGnRE) | PTE_PXN | PTE_UXN)
+/*
+ * DMA allocations for non-coherent devices use what the Arm architecture calls
+ * "Normal non-cacheable" memory, which permits speculation, unaligned accesses
+ * and merging of writes.  This is different from "Device-nGnR[nE]" memory which
+ * is intended for MMIO and thus forbids speculation, preserves access size,
+ * requires strict alignment and can also force write responses to come from the
+ * endpoint.
+ */
 #define pgprot_dmacoherent(prot) \
 	__pgprot_modify(prot, PTE_ATTRINDX_MASK, \
 			PTE_ATTRINDX(MT_NORMAL_NC) | PTE_PXN | PTE_UXN)
-- 
2.20.1

