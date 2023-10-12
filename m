Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9B87C777C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Oct 2023 21:56:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=rIqwWkkv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S60lS3dlvz3vcW
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Oct 2023 06:56:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=rIqwWkkv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=willy@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S60hg3czkz3cPK
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Oct 2023 06:54:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=CSyPT7b+OGrcLFhMzi1tWe4i8irwCIBA39LooloVVJI=; b=rIqwWkkvXo/CE5Euy2SwaFBxhU
	801Ba4eMfLWmgrn1MXv3PKag+tTKsavJbeMJwqNtD7uF35YP3EMCYSXQa1m0wxcVCHRb6ywGJLmWj
	ACsJomCKgV8Jo1WvXVKZtCZIpMF22aqC+M463aa/CpAWBzHZnTGL4e+GnIKf6/8zxbymD43OzHTB1
	Bs/9qFG/TYzl5CppW9Sk912lGrLi7vgfS03lrrxcZNFCHu5l6Q51Fsn9DTibGNc2twZ6IDBCl2f/T
	99WhlqG3f9laCDRDDWz/PkZdMUVCnhUQrt1HfF7AqBk2qVjJyt0bvw5ag39BTRCjlIf9znJLL6vyZ
	bu3cqdzQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qr1lA-001BSa-Fn; Thu, 12 Oct 2023 19:54:16 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] sparc: Allow nesting of lazy MMU mode
Date: Thu, 12 Oct 2023 20:54:15 +0100
Message-Id: <20231012195415.282357-3-willy@infradead.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20231012195415.282357-1-willy@infradead.org>
References: <20231012195415.282357-1-willy@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Juergen Gross <jgross@suse.com>, Erhard Furtner <erhard_f@mailbox.org>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, linux-sparc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, David Woodhouse <dwmw2@infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

As noted in commit 49147beb0ccb ("x86/xen: allow nesting of same lazy
mode"), we can now nest calls to arch_enter_lazy_mmu_mode().  Use ->active
as a counter instead of a flag and only drain the batch when the counter
hits 0.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Fixes: bcc6cc832573 ("mm: add default definition of set_ptes()")
---
 arch/sparc/mm/tlb.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/sparc/mm/tlb.c b/arch/sparc/mm/tlb.c
index b44d79d778c7..a82c7c32e47d 100644
--- a/arch/sparc/mm/tlb.c
+++ b/arch/sparc/mm/tlb.c
@@ -54,16 +54,15 @@ void arch_enter_lazy_mmu_mode(void)
 {
 	struct tlb_batch *tb = this_cpu_ptr(&tlb_batch);
 
-	tb->active = 1;
+	tb->active++;
 }
 
 void arch_leave_lazy_mmu_mode(void)
 {
 	struct tlb_batch *tb = this_cpu_ptr(&tlb_batch);
 
-	if (tb->tlb_nr)
+	if ((--tb->active == 0) && tb->tlb_nr)
 		flush_tlb_pending();
-	tb->active = 0;
 }
 
 static void tlb_batch_add_one(struct mm_struct *mm, unsigned long vaddr,
-- 
2.40.1

