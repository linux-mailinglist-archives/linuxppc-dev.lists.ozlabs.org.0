Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3351436E611
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Apr 2021 09:34:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FW6h01q8rz3dBs
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Apr 2021 17:34:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bluescreens.de (client-ip=2001:67c:2050:1::465:111;
 helo=mout-y-111.mailbox.org; envelope-from=cmr@bluescreens.de;
 receiver=<UNKNOWN>)
Received: from mout-y-111.mailbox.org (mout-y-111.mailbox.org
 [IPv6:2001:67c:2050:1::465:111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FW6cg75KFz303J
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Apr 2021 17:31:15 +1000 (AEST)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [80.241.60.241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-y-111.mailbox.org (Postfix) with ESMTPS id 4FW6PY4fMlzQjvt;
 Thu, 29 Apr 2021 09:21:37 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
 by spamfilter01.heinlein-hosting.de (spamfilter01.heinlein-hosting.de
 [80.241.56.115]) (amavisd-new, port 10030)
 with ESMTP id ku7miv09OT2r; Thu, 29 Apr 2021 09:21:34 +0200 (CEST)
From: "Christopher M. Riedl" <cmr@bluescreens.de>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 07/11] powerpc/64s: Make slb_allocate_user() non-static
Date: Thu, 29 Apr 2021 02:20:53 -0500
Message-Id: <20210429072057.8870-8-cmr@bluescreens.de>
In-Reply-To: <20210429072057.8870-1-cmr@bluescreens.de>
References: <20210429072057.8870-1-cmr@bluescreens.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-SPAM-Probability: *
X-Rspamd-Score: 0.90 / 15.00 / 15.00
X-Rspamd-Queue-Id: B056D17DF
X-Rspamd-UID: 3ff631
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
Cc: tglx@linutronix.de, x86@kernel.org, linux-hardening@vger.kernel.org,
 keescook@chromium.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

With Book3s64 Hash translation, manually inserting a PTE requires
updating the Linux PTE, inserting a SLB entry, and inserting the hashed
page. The first is handled via the usual kernel abstractions, the second
requires slb_allocate_user() which is currently 'static', and the third
is available via hash_page_mm() already.

Make slb_allocate_user() non-static and add a prototype so the next
patch can use it during code-patching.

Signed-off-by: Christopher M. Riedl <cmr@bluescreens.de>

---

v4:  * New to series.
---
 arch/powerpc/include/asm/book3s/64/mmu-hash.h | 1 +
 arch/powerpc/mm/book3s64/slb.c                | 4 +---
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/mmu-hash.h b/arch/powerpc/include/asm/book3s/64/mmu-hash.h
index 3004f3323144d..189854eebba77 100644
--- a/arch/powerpc/include/asm/book3s/64/mmu-hash.h
+++ b/arch/powerpc/include/asm/book3s/64/mmu-hash.h
@@ -525,6 +525,7 @@ void slb_dump_contents(struct slb_entry *slb_ptr);
 extern void slb_vmalloc_update(void);
 extern void slb_set_size(u16 size);
 void preload_new_slb_context(unsigned long start, unsigned long sp);
+long slb_allocate_user(struct mm_struct *mm, unsigned long ea);
 #endif /* __ASSEMBLY__ */
 
 /*
diff --git a/arch/powerpc/mm/book3s64/slb.c b/arch/powerpc/mm/book3s64/slb.c
index da0836cb855af..532eb51bc5211 100644
--- a/arch/powerpc/mm/book3s64/slb.c
+++ b/arch/powerpc/mm/book3s64/slb.c
@@ -29,8 +29,6 @@
 #include "internal.h"
 
 
-static long slb_allocate_user(struct mm_struct *mm, unsigned long ea);
-
 bool stress_slb_enabled __initdata;
 
 static int __init parse_stress_slb(char *p)
@@ -791,7 +789,7 @@ static long slb_allocate_kernel(unsigned long ea, unsigned long id)
 	return slb_insert_entry(ea, context, flags, ssize, true);
 }
 
-static long slb_allocate_user(struct mm_struct *mm, unsigned long ea)
+long slb_allocate_user(struct mm_struct *mm, unsigned long ea)
 {
 	unsigned long context;
 	unsigned long flags;
-- 
2.26.1

