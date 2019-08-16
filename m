Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7198FC47
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2019 09:29:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 468w1p51V3zDr6L
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2019 17:29:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (mailfrom)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+66fbed4ec5b4f711ea06+5836+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.b="cYrzgGco"; dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 468vv05pVyzDr5j
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Aug 2019 17:23:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
 :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=V5Zw49kQPZrMPdAV7XGYxZ4KnGSn0pXrZQuwIbjovPc=; b=cYrzgGcooFyvmagoHDTahcizcr
 ulAhAjBwfwJ77g7fjQVCrejwUPdW3+451tmr4XYxlVX8GxKY6cn3W8XzSqaVepJUUvLLtSTSTGMS2
 D6pUyCdbRYLrAnYboEv/JXnpSBpVixFIvWgyIfF5md8ZZXHK3JZ1uZkdsSR/CUj+a7OAuiX/QKZ4f
 IxilPeoBwYRLMyeTi9CQjAPYTO5lWlcHXkdKE5px7Tm0Z5Uv09MdQjAqWuzskLMQWZVz71rZHpeY5
 mK5d/REaLrxG8p8FjuCzLwlM5I1DLEWp0Hs1N6GdEsdYKhkTSq8vu8t5mK7Hc4pyUMSFWtRpfVilP
 iCSS6GWw==;
Received: from 089144199030.atnat0008.highway.a1.net ([89.144.199.30]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hyWa8-0003qQ-O9; Fri, 16 Aug 2019 07:23:29 +0000
From: Christoph Hellwig <hch@lst.de>
To: iommu@lists.linux-foundation.org
Subject: [PATCH 6/6] arm64: document the choice of page attributes for
 pgprot_dmacoherent
Date: Fri, 16 Aug 2019 09:07:54 +0200
Message-Id: <20190816070754.15653-7-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190816070754.15653-1-hch@lst.de>
References: <20190816070754.15653-1-hch@lst.de>
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
Cc: Shawn Anastasio <shawn@anastas.io>, Will Deacon <will@kernel.org>,
 linux-m68k@lists.linux-m68k.org, Guan Xuetao <gxt@pku.edu.cn>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, linux-mips@vger.kernel.org,
 Paul Burton <paul.burton@mips.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Catalin Marinas <catalin.marinas@arm.com>, James Hogan <jhogan@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Based on an email from Will Deacon.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/arm64/include/asm/pgtable.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 6700371227d1..6ff221d9a631 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -435,6 +435,14 @@ static inline pmd_t pmd_mkdevmap(pmd_t pmd)
 	__pgprot_modify(prot, PTE_ATTRINDX_MASK, PTE_ATTRINDX(MT_NORMAL_NC) | PTE_PXN | PTE_UXN)
 #define pgprot_device(prot) \
 	__pgprot_modify(prot, PTE_ATTRINDX_MASK, PTE_ATTRINDX(MT_DEVICE_nGnRE) | PTE_PXN | PTE_UXN)
+/*
+ * DMA allocations for non-coherent devices use what the Arm architecture calls
+ * "Normal non-cacheable" memory, which permits speculation, unaligned accesses
+ * and merging of writes.  This is different from "Strongly Ordered" memory
+ * which is intended for MMIO and thus forbids speculation, preserves access
+ * size, requires strict alignment and also forces write responses to come from
+ * the endpoint.
+ */
 #define pgprot_dmacoherent(prot) \
 	__pgprot_modify(prot, PTE_ATTRINDX_MASK, \
 			PTE_ATTRINDX(MT_NORMAL_NC) | PTE_PXN | PTE_UXN)
-- 
2.20.1

