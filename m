Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 136871CC953
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 May 2020 10:17:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49KcP03C84zDr1b
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 May 2020 18:17:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+effa4c2fe12dfa74dce9+6104+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=bombadil.20170209 header.b=TpZbr36s; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Kbwl5bjNzDqVT
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 May 2020 17:56:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=nX/OxofzDc3fd8yYsXOf0skifLYVUPlkWiksPKDCM7I=; b=TpZbr36sANtLkJvaxuIu9aM1KW
 oFrz3VJ8TKCFIfHGzIiUCULvUWWsc1FxymJvvH8drRJ/X1w1aXjvV6yzLqwB4Z0DZUKMIJKi+lI6U
 nyI+awV3bFWK24fHQ4FBnkZMIJzGo//5yhrw6Tvopim9t0SDjG2NOfxtBOGSgX7Z05ij05ckfhQkC
 ZLJV75ZK4xlfHir11InzLMsareiwxBndphxx0tHFSOyPvjU80XFlwKqGbd4QrnmfdrnnhSsTfWF7e
 S7hPZVHtB3AM5Chq3D53XXM0bUivy48c760lElDacqcTAFpdLnl59s2i7QPtXQ/HQnlw2Bz2JA/Yr
 rvU3E8zQ==;
Received: from [2001:4bb8:180:9d3f:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jXgoG-0008Cg-VB; Sun, 10 May 2020 07:55:41 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>,
 Roman Zippel <zippel@linux-m68k.org>
Subject: [PATCH 09/31] asm-generic: improve the flush_dcache_page stub
Date: Sun, 10 May 2020 09:54:48 +0200
Message-Id: <20200510075510.987823-10-hch@lst.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200510075510.987823-1-hch@lst.de>
References: <20200510075510.987823-1-hch@lst.de>
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
Cc: linux-arch@vger.kernel.org, linux-xtensa@linux-xtensa.org,
 Michal Simek <monstr@monstr.eu>, Jessica Yu <jeyu@kernel.org>,
 linux-ia64@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
 linux-sh@vger.kernel.org, linux-hexagon@vger.kernel.org, x86@kernel.org,
 linux-um@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mm@kvack.org,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 linux-alpha@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There is a magic ARCH_IMPLEMENTS_FLUSH_DCACHE_PAGE cpp symbol that
guards non-stub availability of flush_dcache_pagge.  Use that to
check if flush_dcache_pagg is implemented.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/asm-generic/cacheflush.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/asm-generic/cacheflush.h b/include/asm-generic/cacheflush.h
index bf9bb83e9fc8d..bbbb4d4ef6516 100644
--- a/include/asm-generic/cacheflush.h
+++ b/include/asm-generic/cacheflush.h
@@ -2,8 +2,6 @@
 #ifndef _ASM_GENERIC_CACHEFLUSH_H
 #define _ASM_GENERIC_CACHEFLUSH_H
 
-#define ARCH_IMPLEMENTS_FLUSH_DCACHE_PAGE 0
-
 /*
  * The cache doesn't need to be flushed when TLB entries change when
  * the cache is mapped to physical memory, not virtual memory
@@ -42,12 +40,14 @@ static inline void flush_cache_page(struct vm_area_struct *vma,
 }
 #endif
 
-#ifndef flush_dcache_page
+#ifndef ARCH_IMPLEMENTS_FLUSH_DCACHE_PAGE
 static inline void flush_dcache_page(struct page *page)
 {
 }
+#define ARCH_IMPLEMENTS_FLUSH_DCACHE_PAGE 0
 #endif
 
+
 #ifndef flush_dcache_mmap_lock
 static inline void flush_dcache_mmap_lock(struct address_space *mapping)
 {
-- 
2.26.2

