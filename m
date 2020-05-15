Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA421D55FF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 May 2020 18:27:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Nv2G5fj8zDqJK
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 May 2020 02:27:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+e5f7f93d3739a79b60a3+6109+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=bombadil.20170209 header.b=mtp2SQYq; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Nrcg418MzDqrV
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 May 2020 00:38:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=XpvCeNn0rBV1Tz4g/advg3nbVNkYMm0bwJy/BOtFfCE=; b=mtp2SQYqjnEmMsyJlzBFS9n1tO
 6Bl1A5NTaayU0SwfeVu7fiCn92pQRa2E+OLCPhCkR7c5UWIzpZFiBa/dSxGInoZExvSnyGthPcZBO
 4JmER5OOqQAEca1lNYqFdhQKnYAq52Oa3T/ybKmBuXma9oE3cv8ISqIgbHoeO0JFW7AxZruDDmnEx
 PsNPpIvdhjc8ZYElf/hwKhfqzMUjILcxmjAe1lWljjV6CRjNEZRCfEjWwF1P4xSWOyvp1uPqh9qFT
 ozrQp+DdkT23TxKpXfqKlVPXUZtc7dHO5N14Ysz4RNkBdl9wU1JUDcc5eYOoIfKyan459Q4GR6E7w
 uWqmDTlg==;
Received: from [2001:4bb8:188:1506:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZbTN-000582-8B; Fri, 15 May 2020 14:38:01 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>,
 Roman Zippel <zippel@linux-m68k.org>
Subject: [PATCH 24/29] m68k: implement flush_icache_user_range
Date: Fri, 15 May 2020 16:36:41 +0200
Message-Id: <20200515143646.3857579-25-hch@lst.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200515143646.3857579-1-hch@lst.de>
References: <20200515143646.3857579-1-hch@lst.de>
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mm@kvack.org, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
 linux-c6x-dev@linux-c6x.org, linux-hexagon@vger.kernel.org, x86@kernel.org,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-xtensa@linux-xtensa.org,
 linux-alpha@vger.kernel.org, linux-um@lists.infradead.org,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 linux-arm-kernel@lists.infradead.org, Michal Simek <monstr@monstr.eu>,
 linux-kernel@vger.kernel.org, Jessica Yu <jeyu@kernel.org>,
 linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Rename the current flush_icache_range to flush_icache_user_range as
per commit ae92ef8a4424 ("PATCH] flush icache in correct context") there
seems to be an assumption that it operates on user addresses.  Add a
flush_icache_range around it that for now is a no-op.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/include/asm/cacheflush_mm.h | 2 ++
 arch/m68k/mm/cache.c                  | 7 ++++++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/m68k/include/asm/cacheflush_mm.h b/arch/m68k/include/asm/cacheflush_mm.h
index 95376bf84faa5..1ac55e7b47f01 100644
--- a/arch/m68k/include/asm/cacheflush_mm.h
+++ b/arch/m68k/include/asm/cacheflush_mm.h
@@ -257,6 +257,8 @@ static inline void __flush_page_to_ram(void *vaddr)
 extern void flush_icache_user_page(struct vm_area_struct *vma, struct page *page,
 				    unsigned long addr, int len);
 extern void flush_icache_range(unsigned long address, unsigned long endaddr);
+extern void flush_icache_user_range(unsigned long address,
+		unsigned long endaddr);
 
 static inline void copy_to_user_page(struct vm_area_struct *vma,
 				     struct page *page, unsigned long vaddr,
diff --git a/arch/m68k/mm/cache.c b/arch/m68k/mm/cache.c
index 99057cd5ff7f1..7915be3a09712 100644
--- a/arch/m68k/mm/cache.c
+++ b/arch/m68k/mm/cache.c
@@ -73,7 +73,7 @@ static unsigned long virt_to_phys_slow(unsigned long vaddr)
 
 /* Push n pages at kernel virtual address and clear the icache */
 /* RZ: use cpush %bc instead of cpush %dc, cinv %ic */
-void flush_icache_range(unsigned long address, unsigned long endaddr)
+void flush_icache_user_range(unsigned long address, unsigned long endaddr)
 {
 	if (CPU_IS_COLDFIRE) {
 		unsigned long start, end;
@@ -104,6 +104,11 @@ void flush_icache_range(unsigned long address, unsigned long endaddr)
 			      : "di" (FLUSH_I));
 	}
 }
+
+void flush_icache_range(unsigned long address, unsigned long endaddr)
+{
+	flush_icache_user_range(address, endaddr);
+}
 EXPORT_SYMBOL(flush_icache_range);
 
 void flush_icache_user_page(struct vm_area_struct *vma, struct page *page,
-- 
2.26.2

