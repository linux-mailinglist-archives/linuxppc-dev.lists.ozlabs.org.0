Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4321D5635
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 May 2020 18:37:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49NvFx2Xw6zDqs2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 May 2020 02:37:25 +1000 (AEST)
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
 header.a=rsa-sha256 header.s=bombadil.20170209 header.b=l4tX9YFz; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Nrcl6hxLzDqTh
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 May 2020 00:38:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=4ek5EujzgHPIbdEvHkQJFfygtnYVEDi+YXEorFGRVI0=; b=l4tX9YFz1biQcqnXAemRnxp5lx
 7vqRgeqRIM/XatP0wlI3r53NWkSatcw1JkXrkTawHRnmaQBlT8KuOTt+J4BcCTkdGkQu3rT7bWyke
 NX9OoUXznrAXIJQctXHyRhx9Y2p3y64yEKDoJRhsu0CyLBLe+T587LSnThHwB4WLxmPrd/Rkr3c50
 Z+g03UXrGqenMeETgm8UGInxZ7ETcQM2A1HTnzRQvjDcKBE1QA76OmzUAkN+IRiyrbC/4Smuc9tEg
 J4Dd1AmjTzPqWdEyWEo9O7WTJXIJhU65h5gjraEBoNCOLQqqryFgdSjtY44x78yOGMWmDj7qUiYHo
 qWAE+Z9Q==;
Received: from [2001:4bb8:188:1506:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZbTY-0005IX-Ha; Fri, 15 May 2020 14:38:13 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>,
 Roman Zippel <zippel@linux-m68k.org>
Subject: [PATCH 28/29] nommu: use flush_icache_user_range in brk and mmap
Date: Fri, 15 May 2020 16:36:45 +0200
Message-Id: <20200515143646.3857579-29-hch@lst.de>
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

These obviously operate on user addresses.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 mm/nommu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/nommu.c b/mm/nommu.c
index 318df4e236c99..aed7acaed2383 100644
--- a/mm/nommu.c
+++ b/mm/nommu.c
@@ -443,7 +443,7 @@ SYSCALL_DEFINE1(brk, unsigned long, brk)
 	/*
 	 * Ok, looks good - let it rip.
 	 */
-	flush_icache_range(mm->brk, brk);
+	flush_icache_user_range(mm->brk, brk);
 	return mm->brk = brk;
 }
 
@@ -1287,7 +1287,7 @@ unsigned long do_mmap(struct file *file,
 	/* we flush the region from the icache only when the first executable
 	 * mapping of it is made  */
 	if (vma->vm_flags & VM_EXEC && !region->vm_icache_flushed) {
-		flush_icache_range(region->vm_start, region->vm_end);
+		flush_icache_user_range(region->vm_start, region->vm_end);
 		region->vm_icache_flushed = true;
 	}
 
-- 
2.26.2

