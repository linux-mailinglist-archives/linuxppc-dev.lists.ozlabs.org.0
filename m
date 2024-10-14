Return-Path: <linuxppc-dev+bounces-2228-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D22A99CE9A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2024 16:45:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XS0QC4rJdz3bxL;
	Tue, 15 Oct 2024 01:45:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:7c80:54:3::133"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728917123;
	cv=none; b=T8enRJFzVgyugCxAzJlsVcOvVKEzx0g85eqYLuJEfSGiUCaMAiUsly0YCog8x4xWe39RJWVaiA9u00svOEWh8N3nJPEE96hFwDp4aATMcPVNj6lw5qQOTZPo8Pj3bP06WZHbl54K/dLApfq6pWPwGLvCY/ilkuaOsRQaQCsUDs0CQe1+9sn53/Nw/Sq1Kmz4x/GFg7obykWsViQgz8Gae4KotkkUQ0ImsnMlHhU9RZIoUlf7Y+an49HW0rsrJAUwjzQCQyQUnleOmhQl+zzVyeAALLAclCfTFc4CPqXAASkpDaetVGaiY/isUZSB45STBkdRnicY2u6aaI7jnpUhzg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728917123; c=relaxed/relaxed;
	bh=CBx8oOZP7muTRFWdnTWIX1ck/8Je7EEbolhZOJL2Cgo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h2Af9u91EFxEQ+pTOqEJAP2AluTN/FQh6vm2gZWIDHx8HEC8xiJWT8vPu7vyCxgOFSIib8fPtqvscYQnVhK7gjgfgqF+p1G4CEeaGnMwPC4mX7X9VJLjFaYRSeytDXRFBJ3n/MRErIKylaRnJcrTLrpibL1GSD6dW107OsbpFSWhdXX7OrlHEwK5f6wV5wM4zBzG5kRz/wknxLpUhGfg2Wff3LFQMldODgR4BqcgnFaY/nn+1kXicAydqwqT3eCMU+M1ElzFb2mWFh+xsE2sQ0Iej+Ib83bHcKKHPChtGMOFQNfsPXSSsETHYgIl49yRjuqqrYKlEvpD6G68QlatcQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=lst.de; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zmmr+87Y; dkim-atps=neutral; spf=none (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+f913630adc52fe272e7a+7722+infradead.org+hch@bombadil.srs.infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zmmr+87Y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+f913630adc52fe272e7a+7722+infradead.org+hch@bombadil.srs.infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XS0QB6Wf0z2yZ4
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Oct 2024 01:45:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=CBx8oOZP7muTRFWdnTWIX1ck/8Je7EEbolhZOJL2Cgo=; b=zmmr+87Y9fBB2htyIn2LwLkL5/
	hsChFqRyxCtK8dSibrcQ8PEvXM7QOaRtaKrym2h6jMMzO77s3lS2hn7Ds42Hha1klRD3lM+Hh+Ouy
	6aq3QvpikKtFJ2F/rq0qXxEEGv112EOwBW14QmpkYktJfsn/t/8gKm0+NOK8hkF/781sbpX7DAr9e
	Wy9jviDzgvwT73cOdJu8yjmFDmQnePjJFT32ESCWmE2e+osAYE3e1CM3IpLuxXfIkRN1+7xy2ntbq
	J2YK67lQQmwotM1BaSYABBbzL+B1EFNJ+UJM7BuNOq5VinAEx1k3YZ+nFmu6LbSobVuhQIjj3RpVT
	JuhE5rtw==;
Received: from 2a02-8389-2341-5b80-350d-7b06-b28a-173d.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:350d:7b06:b28a:173d] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1t0MJz-00000005Wzd-3wyi;
	Mon, 14 Oct 2024 14:45:20 +0000
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
Subject: [PATCH 2/2] asm-generic: add an optional pfn_valid check to pfn_valid
Date: Mon, 14 Oct 2024 16:44:59 +0200
Message-ID: <20241014144506.51754-3-hch@lst.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241014144506.51754-1-hch@lst.de>
References: <20241014144506.51754-1-hch@lst.de>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
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

Powerpc had a pfn_valid check on the regult to it's page_to_phys
implementation when CONFIG_DEBUG_VIRTUAL is defined, which seems
generally useful, so add that to the generic version.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/asm-generic/memory_model.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/asm-generic/memory_model.h b/include/asm-generic/memory_model.h
index a73a140cbecdd7..6d1fb6162ac1a6 100644
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


