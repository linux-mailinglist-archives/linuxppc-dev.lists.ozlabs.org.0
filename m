Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7888FC02
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2019 09:21:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 468vrg5NqLzDrN1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2019 17:21:39 +1000 (AEST)
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
 header.b="Cwd5nn8m"; dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 468vlK2K8zzDrSC
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Aug 2019 17:17:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
 :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5slocbe6PQWQPCbfPHRmFcXbh8p3/1KOX8/V8eA6Q9A=; b=Cwd5nn8mGMcw08OzE0p/GngGiO
 XNDinPVA9h0z8gOXLwNvPC5+xGzUuqzVJ7bzHX6VrHtT2KWxhDwEh2w+4DScwazticFb/jTlov9+O
 ZsglZG/XJJ9o4ddV713LiunQaBw97yejihx2A6H9mBNjCWNm+CrvkGqbWkjZfSnppVn5Tc9zGVhYg
 c1T64d90DXi99E4doAqi5iXtVW1wIlubAneZwAcO699CTmXKuJCmMx70YR0/75mKUVOSCEwsALe9m
 J+CmrJ+zilbuREvyDod92BUSEGW1TzmHxcwBUEfT9HK4UT3AcOxXIQjmy7HHd4iFg+VVXFKVVOCIv
 h1CBNIwg==;
Received: from 089144199030.atnat0008.highway.a1.net ([89.144.199.30]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hyWTh-0000Zn-6C; Fri, 16 Aug 2019 07:16:50 +0000
From: Christoph Hellwig <hch@lst.de>
To: iommu@lists.linux-foundation.org
Subject: [PATCH 3/6] arm-nommu: remove the unused pgprot_dmacoherent define
Date: Fri, 16 Aug 2019 09:07:51 +0200
Message-Id: <20190816070754.15653-4-hch@lst.de>
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

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/arm/include/asm/pgtable-nommu.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/include/asm/pgtable-nommu.h b/arch/arm/include/asm/pgtable-nommu.h
index 0b1f6799a32e..d0de24f06724 100644
--- a/arch/arm/include/asm/pgtable-nommu.h
+++ b/arch/arm/include/asm/pgtable-nommu.h
@@ -62,7 +62,6 @@ typedef pte_t *pte_addr_t;
  */
 #define pgprot_noncached(prot)	(prot)
 #define pgprot_writecombine(prot) (prot)
-#define pgprot_dmacoherent(prot) (prot)
 #define pgprot_device(prot)	(prot)
 
 
-- 
2.20.1

