Return-Path: <linuxppc-dev+bounces-2499-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7020F9ABDFB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Oct 2024 07:37:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XYHqC5K6Yz2yfm;
	Wed, 23 Oct 2024 16:36:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:7c80:54:3::133"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729661815;
	cv=none; b=ZRf4U1beFjInPpPkoiR0t3Txwasul2y21stOuQgU/76A8u2vOpWibrBZprLmQg6I97BGWz7eDd1wztV0GBJ7RF7UlhNQpkCVpnVF27IuGqiTlFYl2l3mSvOhQml9cRLBwdMRKiF0ARX53+fEtKYHLj717f6lKsOyBOJSoZa2YEpMs7RnJivJucf7Wbt3QpzPt8csecswTwemHZIamJTOAry1E2OV7P0L1JPiXa9/fqqg+klBICQWkPREFlIrtMihl3uWGBmisKOEsp3QptQj2etPISweoz0vuWvBzN7/kvjNZMk6RdVqn8JE53skgDVWRJcVQKo2dAd1H7pl5GM64w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729661815; c=relaxed/relaxed;
	bh=pMVglSrzfw659uFTl63Kmjtp2oxz/obCT3ExoMvUsd0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MbRDifzJ5p5VdHs1S/L7XPnqjohyHZwvdqJXAu2LD6w4pF/iHSlkEX8xSZeJPgnINfcpB8kTrWD6a335iXDSjvzivu3yqLBevhjU3R1vzNIrzX6+3X7NtwURnNsCbwxwAjhKG/2O3P0CfEG3mU++0ebw4PMkarH6TiJ1btrc0LxVsW6zCtS31FIwFJIybVrSiysLRYe7Qsde49YvgQ4PiKR5AU7m+KkOeFBOeflbx5OUkGlb/4AfhirPmp4D6I2gTNNkCnVkyAA9H114h/BJ4jgEFbSNGN99p92cpPLDgOu/mxMqI5wXnaS7b+tmYy3fiujm6Nxf/OXuBwcXm+CZLg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=lst.de; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=h3p8AkRX; dkim-atps=neutral; spf=none (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+16051c3a8dabb1c72812+7731+infradead.org+hch@bombadil.srs.infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=h3p8AkRX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+16051c3a8dabb1c72812+7731+infradead.org+hch@bombadil.srs.infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XYHqC0YPWz2xpx
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Oct 2024 16:36:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=pMVglSrzfw659uFTl63Kmjtp2oxz/obCT3ExoMvUsd0=; b=h3p8AkRXGihxrDLi0oq5AhmjrT
	sTISKsZ7wx8jV9O21Ahj8jdqo90qdhmRBhAZz6XhMrq1rXwehioiPD6gl5siWuIOERts7rl0d6BoC
	3RXx6Ufopbo8/Ijiz2CMgtPiWHqU9iDJBhboPe53eyEGZezeZeQr+LrYePax3DOdL5SmXQOPwk7tK
	4JCXJSs0b2T4XEPEy9UvFFL59NVLAw9aBC9j8arBo/tX4fX+Qev54AaYCEE2jWENLGxtGguKSu9Cd
	uqSZBqpqJY7atLAmszcql9T2iUE9VUXqWmY35nWH5Ppdmsc8z7fVK9ofvS2xayhi0AEqU/zp51pos
	/x8WzO4A==;
Received: from 2a02-8389-2341-5b80-8c6c-e123-fc47-94a5.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:8c6c:e123:fc47:94a5] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1t3U3A-0000000D4L4-25Zx;
	Wed, 23 Oct 2024 05:36:53 +0000
From: Christoph Hellwig <hch@lst.de>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-um@lists.infradead.org,
	linux-arch@vger.kernel.org
Subject: [PATCH 2/2] asm-generic: add an optional pfn_valid check to page_to_phys
Date: Wed, 23 Oct 2024 07:36:37 +0200
Message-ID: <20241023053644.311692-3-hch@lst.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241023053644.311692-1-hch@lst.de>
References: <20241023053644.311692-1-hch@lst.de>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lists.ozlabs.org/pipermail/linuxppc-dev/>,
  <https://lore.kernel.org/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	SUSPICIOUS_RECIPS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

page_to_pfn is usually implemented by pointer arithmetics on the memory
map, which means that bogus input can lead to even more bogus output.

Powerpc had a pfn_valid check on the intermediate pfn in the page_to_phys
implementation when CONFIG_DEBUG_VIRTUAL is defined, which seems
generally useful, so add that to the generic version.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/asm-generic/memory_model.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/asm-generic/memory_model.h b/include/asm-generic/memory_model.h
index a73a140cbecd..6d1fb6162ac1 100644
--- a/include/asm-generic/memory_model.h
+++ b/include/asm-generic/memory_model.h
@@ -64,7 +64,17 @@ static inline int pfn_valid(unsigned long pfn)
 #define page_to_pfn __page_to_pfn
 #define pfn_to_page __pfn_to_page
 
+#ifdef CONFIG_DEBUG_VIRTUAL
+#define page_to_phys(page)						\
+({									\
+	unsigned long __pfn = page_to_pfn(page);			\
+									\
+	WARN_ON_ONCE(!pfn_valid(__pfn));				\
+	PFN_PHYS(__pfn);						\
+})
+#else
 #define page_to_phys(page)	PFN_PHYS(page_to_pfn(page))
+#endif /* CONFIG_DEBUG_VIRTUAL */
 #define phys_to_page(phys)	pfn_to_page(PHYS_PFN(phys))
 
 #endif /* __ASSEMBLY__ */
-- 
2.45.2


