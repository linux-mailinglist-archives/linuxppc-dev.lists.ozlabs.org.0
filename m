Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 167661CC99E
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 May 2020 10:56:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49KdGM4yw0zDqLN
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 May 2020 18:56:27 +1000 (AEST)
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
 header.a=rsa-sha256 header.s=bombadil.20170209 header.b=Jeef/M6w; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Kbxs2JHLzDqbD
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 May 2020 17:57:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=gbS3mnDejF/vbSIU5cFMJ7gbJPhVms+ouuUae9XApr4=; b=Jeef/M6wRiQsyUU6ARprddeFuW
 Ih3QL7O0SFvbRRu8d9DBgFL0JfqU6LDoAq0ftGNMQ+HpMiy87MHTfwgYDMrMHa1QK6oTbqTUmomeS
 4Xci1co32+BUzy12zKd4SHNSBbsG5vmZ/syewkkPZgcwUxVKWSK7oro2yZKpxtN3HkNt+4dKT5Xw3
 31qRqq9wSzv6I5a23Wt/9IX/GozigKBBtCvioHR8DpuHVpWbCyIPgWxsqtXtv82dBjJVCJkvjPaBY
 b8KPnCXNq8XtRWDr8/HSFCirxUDoAJl2NAcgiGp3HJ00NuMrZfS+7sRc/linPe+sVj5kQYB/rO2WU
 2zABr8zA==;
Received: from [2001:4bb8:180:9d3f:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jXgpO-0001Pa-9R; Sun, 10 May 2020 07:56:50 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>,
 Roman Zippel <zippel@linux-m68k.org>
Subject: [PATCH 31/31] module: move the set_fs hack for flush_icache_range to
 m68k
Date: Sun, 10 May 2020 09:55:10 +0200
Message-Id: <20200510075510.987823-32-hch@lst.de>
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

flush_icache_range generally operates on kernel addresses, but for some
reason m68k needed a set_fs override.  Move that into the m68k code
insted of keeping it in the module loader.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/m68k/mm/cache.c | 4 ++++
 kernel/module.c      | 8 --------
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/arch/m68k/mm/cache.c b/arch/m68k/mm/cache.c
index 7915be3a09712..5ecb3310e8745 100644
--- a/arch/m68k/mm/cache.c
+++ b/arch/m68k/mm/cache.c
@@ -107,7 +107,11 @@ void flush_icache_user_range(unsigned long address, unsigned long endaddr)
 
 void flush_icache_range(unsigned long address, unsigned long endaddr)
 {
+	mm_segment_t old_fs = get_fs();
+
+	set_fs(KERNEL_DS);
 	flush_icache_user_range(address, endaddr);
+	set_fs(old_fs);
 }
 EXPORT_SYMBOL(flush_icache_range);
 
diff --git a/kernel/module.c b/kernel/module.c
index 646f1e2330d2b..b1673ed49594f 100644
--- a/kernel/module.c
+++ b/kernel/module.c
@@ -3312,12 +3312,6 @@ static int check_module_license_and_versions(struct module *mod)
 
 static void flush_module_icache(const struct module *mod)
 {
-	mm_segment_t old_fs;
-
-	/* flush the icache in correct context */
-	old_fs = get_fs();
-	set_fs(KERNEL_DS);
-
 	/*
 	 * Flush the instruction cache, since we've played with text.
 	 * Do it before processing of module parameters, so the module
@@ -3329,8 +3323,6 @@ static void flush_module_icache(const struct module *mod)
 				   + mod->init_layout.size);
 	flush_icache_range((unsigned long)mod->core_layout.base,
 			   (unsigned long)mod->core_layout.base + mod->core_layout.size);
-
-	set_fs(old_fs);
 }
 
 int __weak module_frob_arch_sections(Elf_Ehdr *hdr,
-- 
2.26.2

