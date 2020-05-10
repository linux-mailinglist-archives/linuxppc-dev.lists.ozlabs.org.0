Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4C21CC94E
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 May 2020 10:14:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49KcLS0nH5zDqvW
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 May 2020 18:14:56 +1000 (AEST)
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
 header.a=rsa-sha256 header.s=bombadil.20170209 header.b=Sg0UDw1w; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Kbwc6cDRzDqbx
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 May 2020 17:56:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=INn4CtVqYhB5mCs8+6rhyM+JLlbdj/x9vTgOvRuFchU=; b=Sg0UDw1w5Rayw8JxN+k3lD3azg
 F3LeJA2/NA5rszW6L3bzCrDJXtE6EYULe7GCZftRW+QajvPEaOnjbzGVwfOBNuqPACprzdRviAmaz
 S+sHnwIfQVWKsYOX5X9bFoG3LRFun2LeegZtne7Zn0gjo40GSq0VynMuje/ns9TcGFevaXQCehbqC
 46/TtfsAa3m3mTbp2v2h/j9RjHXcoUHFNAqvM5y854a74KoqPzQGYg8Ujm4SDbizp9Vw47R04MTUf
 YK7yk0frjTctX3aWY011R8+bXrWx4QW+UhAD/NEPVGv+ow8wIUHtdIaqv0zmgcQ1o75L3D0sfJt+T
 VFLY3xcw==;
Received: from [2001:4bb8:180:9d3f:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jXgoD-00089Q-95; Sun, 10 May 2020 07:55:38 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>,
 Roman Zippel <zippel@linux-m68k.org>
Subject: [PATCH 08/31] asm-generic: don't include <linux/mm.h> in cacheflush.h
Date: Sun, 10 May 2020 09:54:47 +0200
Message-Id: <20200510075510.987823-9-hch@lst.de>
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

This seems to lead to some crazy include loops when using
asm-generic/cacheflush.h on more architectures, so leave it
to the arch header for now.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/um/include/asm/tlb.h         | 2 ++
 arch/x86/include/asm/cacheflush.h | 2 ++
 include/asm-generic/cacheflush.h  | 3 ---
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/um/include/asm/tlb.h b/arch/um/include/asm/tlb.h
index 70ee603839006..ff9c62828962c 100644
--- a/arch/um/include/asm/tlb.h
+++ b/arch/um/include/asm/tlb.h
@@ -2,6 +2,8 @@
 #ifndef __UM_TLB_H
 #define __UM_TLB_H
 
+#include <linux/mm.h>
+
 #include <asm/tlbflush.h>
 #include <asm-generic/cacheflush.h>
 #include <asm-generic/tlb.h>
diff --git a/arch/x86/include/asm/cacheflush.h b/arch/x86/include/asm/cacheflush.h
index 63feaf2a5f93d..b192d917a6d0b 100644
--- a/arch/x86/include/asm/cacheflush.h
+++ b/arch/x86/include/asm/cacheflush.h
@@ -2,6 +2,8 @@
 #ifndef _ASM_X86_CACHEFLUSH_H
 #define _ASM_X86_CACHEFLUSH_H
 
+#include <linux/mm.h>
+
 /* Caches aren't brain-dead on the intel. */
 #include <asm-generic/cacheflush.h>
 #include <asm/special_insns.h>
diff --git a/include/asm-generic/cacheflush.h b/include/asm-generic/cacheflush.h
index 906277492ec59..bf9bb83e9fc8d 100644
--- a/include/asm-generic/cacheflush.h
+++ b/include/asm-generic/cacheflush.h
@@ -2,9 +2,6 @@
 #ifndef _ASM_GENERIC_CACHEFLUSH_H
 #define _ASM_GENERIC_CACHEFLUSH_H
 
-/* Keep includes the same across arches.  */
-#include <linux/mm.h>
-
 #define ARCH_IMPLEMENTS_FLUSH_DCACHE_PAGE 0
 
 /*
-- 
2.26.2

