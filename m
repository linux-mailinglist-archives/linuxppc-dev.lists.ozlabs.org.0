Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0CB85388F6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 May 2022 00:31:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LBqrq4lPyz3f6R
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 May 2022 08:31:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=jOfZmLul;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=jOfZmLul;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=jOfZmLul;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=jOfZmLul;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LBkbr5Dfdz2xnG
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 May 2022 04:35:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1653935700;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5JLVF2FXLrI33U0zkufAe5VPWfCsxjxEs3CfZopgvR8=;
	b=jOfZmLulr8QT6eQCGQ9TqB5J6jYuj23KORP8rfnYpUeEMwNbMnUMlm60QTla9QFjqN5op6
	u2faoJOd3rJWh4ZKWgIJHQUX9yQzwGlWrzdqf4IrZ+iLyoPTctFnWYt9d2+lUR9QoUlFWw
	XTWlDZn9pCeCA9SD5mAdnA2DBcpNe8o=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1653935700;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5JLVF2FXLrI33U0zkufAe5VPWfCsxjxEs3CfZopgvR8=;
	b=jOfZmLulr8QT6eQCGQ9TqB5J6jYuj23KORP8rfnYpUeEMwNbMnUMlm60QTla9QFjqN5op6
	u2faoJOd3rJWh4ZKWgIJHQUX9yQzwGlWrzdqf4IrZ+iLyoPTctFnWYt9d2+lUR9QoUlFWw
	XTWlDZn9pCeCA9SD5mAdnA2DBcpNe8o=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-629-vZhKvVIjO1GjU5rmXkg7wA-1; Mon, 30 May 2022 14:34:58 -0400
X-MC-Unique: vZhKvVIjO1GjU5rmXkg7wA-1
Received: by mail-io1-f69.google.com with SMTP id t1-20020a056602140100b0065393cc1dc3so5826519iov.5
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 May 2022 11:34:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5JLVF2FXLrI33U0zkufAe5VPWfCsxjxEs3CfZopgvR8=;
        b=M6U+cRNoI4AD1FEY9iUeEroB3CS3eQ6PSNDHF/seEgFgnX7sNi+Wxs0+Zk8cSkAgiB
         VYmuAf27SqlN+6t1uxV7Dw/cyKN3zkDAwMQnr9uJ2zDpOrnIl4i+m0Ey8RtvtxYwRDh1
         SZaHTdn1reSVbeM2DVSTRAzX+roB/I6MXqg1ojYvTUKiWBaJMtFVg7HwBk30kxT2J/Es
         NXXezJQmeJ+lIGJ1QlpHDB7jTnsJGBRa4PBvLdOX/XJpipRxzyXBDeQ/uVyweQCyzHaI
         WRJQTy3oxoVNJ/l+m81dmSyGPH4xS+OboG6h2SzsWjk2uuKiBO9ecj4tm3lGrwKRueBR
         Imww==
X-Gm-Message-State: AOAM532qEEK/Lt402zYsHrNJnZtOTuF7doiLcvS3aPzJOccv0a7vKEfr
	pcLXXajjpavUgRJhZst9iCrLPYixqEjVe9usZxdEnf2BQagQaycCEUXg4BJPb5H4hPtyDQ3SQgv
	O5vUixNLbWuia6St+FgOrkQLOcA==
X-Received: by 2002:a05:6e02:12c7:b0:2d1:b346:c5aa with SMTP id i7-20020a056e0212c700b002d1b346c5aamr19185860ilm.57.1653935697175;
        Mon, 30 May 2022 11:34:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwLHBonDgyNV99XNsZH3HcjwWByFP+h/A3K8V2qbJSv3z5Vc61gl+8yUzP8MKXI+RnwXftrGQ==
X-Received: by 2002:a05:6e02:12c7:b0:2d1:b346:c5aa with SMTP id i7-20020a056e0212c700b002d1b346c5aamr19185821ilm.57.1653935696770;
        Mon, 30 May 2022 11:34:56 -0700 (PDT)
Received: from localhost.localdomain (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
        by smtp.gmail.com with ESMTPSA id e9-20020a92a009000000b002d11888a1acsm3921829ili.34.2022.05.30.11.34.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 30 May 2022 11:34:56 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH v5] mm: Avoid unnecessary page fault retires on shared memory types
Date: Mon, 30 May 2022 14:34:50 -0400
Message-Id: <20220530183450.42886-1-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 31 May 2022 08:25:41 +1000
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
Cc: Alistair Popple <apopple@nvidia.com>, linux-ia64@vger.kernel.org, linux-xtensa@linux-xtensa.org, Peter Zijlstra <peterz@infradead.org>, Dave Hansen <dave.hansen@linux.intel.com>, David Hildenbrand <david@redhat.com>, peterx@redhat.com, "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, Max Filippov <jcmvbkbc@gmail.com>, Rich Felker <dalias@libc.org>, Paul Mackerras <paulus@samba.org>, "H . Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, Stafford Horne <shorne@gmail.com>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, Andrea Arcangeli <aarcange@redhat.com>, linux-s390@vger.kernel.org, linux-snps-arc@lists.infradead.org, Janosch Frank <frankja@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, linux-sh@vger.kernel.org, Richard Weinberger <richard@nod.at>, Helge Deller <deller@gmx.de>, x86@kernel.org, Hugh Dickins <hughd@google.com>, Russell King <linux@armlinux.org.uk>, l
 inux-csky@vger.kernel.org, Ingo Molnar <mingo@kernel.org>, linux-alpha@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-arm-kernel@lists.infradead.org, Vineet Gupta <vgupta@kernel.org>, Matt Turner <mattst88@gmail.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Catalin Marinas <catalin.marinas@arm.com>, Jonas Bonn <jonas@southpole.se>, Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>, Chris Zankel <chris@zankel.net>, Heiko Carstens <hca@linux.ibm.com>, Johannes Weiner <hannes@cmpxchg.org>, linux-um@lists.infradead.org, Nicholas Piggin <npiggin@gmail.com>, Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>, Al Viro <viro@zeniv.linux.org.uk>, Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Andrew Morton <akpm@linux-foundation.org>, Vlastimil B
 abka <vbabka@suse.cz>, Richard Henderson <rth@twiddle

.net>, Brian Cain <bcain@quicinc.com>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Sven Schnelle <svens@linux.ibm.com>, Guo Ren <guoren@kernel.org>, linux-hexagon@vger.kernel.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Johannes Berg <johannes@sipsolutions.net>, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

I observed that for each of the shared file-backed page faults, we're very
likely to retry one more time for the 1st write fault upon no page.  It's
because we'll need to release the mmap lock for dirty rate limit purpose
with balance_dirty_pages_ratelimited() (in fault_dirty_shared_page()).

Then after that throttling we return VM_FAULT_RETRY.

We did that probably because VM_FAULT_RETRY is the only way we can return
to the fault handler at that time telling it we've released the mmap lock.

However that's not ideal because it's very likely the fault does not need
to be retried at all since the pgtable was well installed before the
throttling, so the next continuous fault (including taking mmap read lock,
walk the pgtable, etc.) could be in most cases unnecessary.

It's not only slowing down page faults for shared file-backed, but also add
more mmap lock contention which is in most cases not needed at all.

To observe this, one could try to write to some shmem page and look at
"pgfault" value in /proc/vmstat, then we should expect 2 counts for each
shmem write simply because we retried, and vm event "pgfault" will capture
that.

To make it more efficient, add a new VM_FAULT_COMPLETED return code just to
show that we've completed the whole fault and released the lock.  It's also
a hint that we should very possibly not need another fault immediately on
this page because we've just completed it.

This patch provides a ~12% perf boost on my aarch64 test VM with a simple
program sequentially dirtying 400MB shmem file being mmap()ed and these are
the time it needs:

  Before: 650.980 ms (+-1.94%)
  After:  569.396 ms (+-1.38%)

I believe it could help more than that.

We need some special care on GUP and the s390 pgfault handler (for gmap
code before returning from pgfault), the rest changes in the page fault
handlers should be relatively straightforward.

Another thing to mention is that mm_account_fault() does take this new
fault as a generic fault to be accounted, unlike VM_FAULT_RETRY.

I explicitly didn't touch hmm_vma_fault() and break_ksm() because they do
not handle VM_FAULT_RETRY even with existing code, so I'm literally keeping
them as-is.

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Acked-by: Johannes Weiner <hannes@cmpxchg.org>
Acked-by: Vineet Gupta <vgupta@kernel.org>
Acked-by: Guo Ren <guoren@kernel.org>
Acked-by: Max Filippov <jcmvbkbc@gmail.com>
Acked-by: Christian Borntraeger <borntraeger@linux.ibm.com>
Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)
Acked-by: Catalin Marinas <catalin.marinas@arm.com>
Reviewed-by: Alistair Popple <apopple@nvidia.com>
Reviewed-by: Ingo Molnar <mingo@kernel.org>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
v5:
- Picked up a few more a-bs
- For s390, further optimize gmap==NULL case [Heiko]
---
 arch/alpha/mm/fault.c         |  4 ++++
 arch/arc/mm/fault.c           |  4 ++++
 arch/arm/mm/fault.c           |  4 ++++
 arch/arm64/mm/fault.c         |  4 ++++
 arch/csky/mm/fault.c          |  4 ++++
 arch/hexagon/mm/vm_fault.c    |  4 ++++
 arch/ia64/mm/fault.c          |  4 ++++
 arch/m68k/mm/fault.c          |  4 ++++
 arch/microblaze/mm/fault.c    |  4 ++++
 arch/mips/mm/fault.c          |  4 ++++
 arch/nios2/mm/fault.c         |  4 ++++
 arch/openrisc/mm/fault.c      |  4 ++++
 arch/parisc/mm/fault.c        |  4 ++++
 arch/powerpc/mm/copro_fault.c |  5 +++++
 arch/powerpc/mm/fault.c       |  5 +++++
 arch/riscv/mm/fault.c         |  4 ++++
 arch/s390/mm/fault.c          | 12 ++++++++++++
 arch/sh/mm/fault.c            |  4 ++++
 arch/sparc/mm/fault_32.c      |  4 ++++
 arch/sparc/mm/fault_64.c      |  5 +++++
 arch/um/kernel/trap.c         |  4 ++++
 arch/x86/mm/fault.c           |  4 ++++
 arch/xtensa/mm/fault.c        |  4 ++++
 include/linux/mm_types.h      |  2 ++
 mm/gup.c                      | 34 +++++++++++++++++++++++++++++++++-
 mm/memory.c                   |  2 +-
 26 files changed, 139 insertions(+), 2 deletions(-)

diff --git a/arch/alpha/mm/fault.c b/arch/alpha/mm/fault.c
index ec20c1004abf..ef427a6bdd1a 100644
--- a/arch/alpha/mm/fault.c
+++ b/arch/alpha/mm/fault.c
@@ -155,6 +155,10 @@ do_page_fault(unsigned long address, unsigned long mmcsr,
 	if (fault_signal_pending(fault, regs))
 		return;
 
+	/* The fault is fully completed (including releasing mmap lock) */
+	if (fault & VM_FAULT_COMPLETED)
+		return;
+
 	if (unlikely(fault & VM_FAULT_ERROR)) {
 		if (fault & VM_FAULT_OOM)
 			goto out_of_memory;
diff --git a/arch/arc/mm/fault.c b/arch/arc/mm/fault.c
index dad27e4d69ff..5ca59a482632 100644
--- a/arch/arc/mm/fault.c
+++ b/arch/arc/mm/fault.c
@@ -146,6 +146,10 @@ void do_page_fault(unsigned long address, struct pt_regs *regs)
 		return;
 	}
 
+	/* The fault is fully completed (including releasing mmap lock) */
+	if (fault & VM_FAULT_COMPLETED)
+		return;
+
 	/*
 	 * Fault retry nuances, mmap_lock already relinquished by core mm
 	 */
diff --git a/arch/arm/mm/fault.c b/arch/arm/mm/fault.c
index a062e07516dd..46cccd6bf705 100644
--- a/arch/arm/mm/fault.c
+++ b/arch/arm/mm/fault.c
@@ -322,6 +322,10 @@ do_page_fault(unsigned long addr, unsigned int fsr, struct pt_regs *regs)
 		return 0;
 	}
 
+	/* The fault is fully completed (including releasing mmap lock) */
+	if (fault & VM_FAULT_COMPLETED)
+		return 0;
+
 	if (!(fault & VM_FAULT_ERROR)) {
 		if (fault & VM_FAULT_RETRY) {
 			flags |= FAULT_FLAG_TRIED;
diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
index 77341b160aca..e401d416bbd6 100644
--- a/arch/arm64/mm/fault.c
+++ b/arch/arm64/mm/fault.c
@@ -607,6 +607,10 @@ static int __kprobes do_page_fault(unsigned long far, unsigned int esr,
 		return 0;
 	}
 
+	/* The fault is fully completed (including releasing mmap lock) */
+	if (fault & VM_FAULT_COMPLETED)
+		return 0;
+
 	if (fault & VM_FAULT_RETRY) {
 		mm_flags |= FAULT_FLAG_TRIED;
 		goto retry;
diff --git a/arch/csky/mm/fault.c b/arch/csky/mm/fault.c
index 7215a46b6b8e..e15f736cca4b 100644
--- a/arch/csky/mm/fault.c
+++ b/arch/csky/mm/fault.c
@@ -285,6 +285,10 @@ asmlinkage void do_page_fault(struct pt_regs *regs)
 		return;
 	}
 
+	/* The fault is fully completed (including releasing mmap lock) */
+	if (fault & VM_FAULT_COMPLETED)
+		return;
+
 	if (unlikely((fault & VM_FAULT_RETRY) && (flags & FAULT_FLAG_ALLOW_RETRY))) {
 		flags |= FAULT_FLAG_TRIED;
 
diff --git a/arch/hexagon/mm/vm_fault.c b/arch/hexagon/mm/vm_fault.c
index 4fac4b9eb316..f73c7cbfe326 100644
--- a/arch/hexagon/mm/vm_fault.c
+++ b/arch/hexagon/mm/vm_fault.c
@@ -96,6 +96,10 @@ void do_page_fault(unsigned long address, long cause, struct pt_regs *regs)
 	if (fault_signal_pending(fault, regs))
 		return;
 
+	/* The fault is fully completed (including releasing mmap lock) */
+	if (fault & VM_FAULT_COMPLETED)
+		return;
+
 	/* The most common case -- we are done. */
 	if (likely(!(fault & VM_FAULT_ERROR))) {
 		if (fault & VM_FAULT_RETRY) {
diff --git a/arch/ia64/mm/fault.c b/arch/ia64/mm/fault.c
index 07379d1a227f..ef78c2d66cdd 100644
--- a/arch/ia64/mm/fault.c
+++ b/arch/ia64/mm/fault.c
@@ -139,6 +139,10 @@ ia64_do_page_fault (unsigned long address, unsigned long isr, struct pt_regs *re
 	if (fault_signal_pending(fault, regs))
 		return;
 
+	/* The fault is fully completed (including releasing mmap lock) */
+	if (fault & VM_FAULT_COMPLETED)
+		return;
+
 	if (unlikely(fault & VM_FAULT_ERROR)) {
 		/*
 		 * We ran out of memory, or some other thing happened
diff --git a/arch/m68k/mm/fault.c b/arch/m68k/mm/fault.c
index 71aa9f6315dc..4d2837eb3e2a 100644
--- a/arch/m68k/mm/fault.c
+++ b/arch/m68k/mm/fault.c
@@ -141,6 +141,10 @@ int do_page_fault(struct pt_regs *regs, unsigned long address,
 	if (fault_signal_pending(fault, regs))
 		return 0;
 
+	/* The fault is fully completed (including releasing mmap lock) */
+	if (fault & VM_FAULT_COMPLETED)
+		return 0;
+
 	if (unlikely(fault & VM_FAULT_ERROR)) {
 		if (fault & VM_FAULT_OOM)
 			goto out_of_memory;
diff --git a/arch/microblaze/mm/fault.c b/arch/microblaze/mm/fault.c
index a9626e6a68af..5c40c3ebe52f 100644
--- a/arch/microblaze/mm/fault.c
+++ b/arch/microblaze/mm/fault.c
@@ -222,6 +222,10 @@ void do_page_fault(struct pt_regs *regs, unsigned long address,
 	if (fault_signal_pending(fault, regs))
 		return;
 
+	/* The fault is fully completed (including releasing mmap lock) */
+	if (fault & VM_FAULT_COMPLETED)
+		return;
+
 	if (unlikely(fault & VM_FAULT_ERROR)) {
 		if (fault & VM_FAULT_OOM)
 			goto out_of_memory;
diff --git a/arch/mips/mm/fault.c b/arch/mips/mm/fault.c
index 44f98100e84e..6f72bac39bf2 100644
--- a/arch/mips/mm/fault.c
+++ b/arch/mips/mm/fault.c
@@ -162,6 +162,10 @@ static void __kprobes __do_page_fault(struct pt_regs *regs, unsigned long write,
 		return;
 	}
 
+	/* The fault is fully completed (including releasing mmap lock) */
+	if (fault & VM_FAULT_COMPLETED)
+		return;
+
 	if (unlikely(fault & VM_FAULT_ERROR)) {
 		if (fault & VM_FAULT_OOM)
 			goto out_of_memory;
diff --git a/arch/nios2/mm/fault.c b/arch/nios2/mm/fault.c
index a32f14cd72f2..edaca0a6c1c1 100644
--- a/arch/nios2/mm/fault.c
+++ b/arch/nios2/mm/fault.c
@@ -139,6 +139,10 @@ asmlinkage void do_page_fault(struct pt_regs *regs, unsigned long cause,
 	if (fault_signal_pending(fault, regs))
 		return;
 
+	/* The fault is fully completed (including releasing mmap lock) */
+	if (fault & VM_FAULT_COMPLETED)
+		return;
+
 	if (unlikely(fault & VM_FAULT_ERROR)) {
 		if (fault & VM_FAULT_OOM)
 			goto out_of_memory;
diff --git a/arch/openrisc/mm/fault.c b/arch/openrisc/mm/fault.c
index 80bb66ad42f6..c18f7abd64df 100644
--- a/arch/openrisc/mm/fault.c
+++ b/arch/openrisc/mm/fault.c
@@ -167,6 +167,10 @@ asmlinkage void do_page_fault(struct pt_regs *regs, unsigned long address,
 	if (fault_signal_pending(fault, regs))
 		return;
 
+	/* The fault is fully completed (including releasing mmap lock) */
+	if (fault & VM_FAULT_COMPLETED)
+		return;
+
 	if (unlikely(fault & VM_FAULT_ERROR)) {
 		if (fault & VM_FAULT_OOM)
 			goto out_of_memory;
diff --git a/arch/parisc/mm/fault.c b/arch/parisc/mm/fault.c
index f114e102aaf2..fe57175a7792 100644
--- a/arch/parisc/mm/fault.c
+++ b/arch/parisc/mm/fault.c
@@ -309,6 +309,10 @@ void do_page_fault(struct pt_regs *regs, unsigned long code,
 	if (fault_signal_pending(fault, regs))
 		return;
 
+	/* The fault is fully completed (including releasing mmap lock) */
+	if (fault & VM_FAULT_COMPLETED)
+		return;
+
 	if (unlikely(fault & VM_FAULT_ERROR)) {
 		/*
 		 * We hit a shared mapping outside of the file, or some
diff --git a/arch/powerpc/mm/copro_fault.c b/arch/powerpc/mm/copro_fault.c
index c1cb21a00884..7c507fb48182 100644
--- a/arch/powerpc/mm/copro_fault.c
+++ b/arch/powerpc/mm/copro_fault.c
@@ -65,6 +65,11 @@ int copro_handle_mm_fault(struct mm_struct *mm, unsigned long ea,
 
 	ret = 0;
 	*flt = handle_mm_fault(vma, ea, is_write ? FAULT_FLAG_WRITE : 0, NULL);
+
+	/* The fault is fully completed (including releasing mmap lock) */
+	if (*flt & VM_FAULT_COMPLETED)
+		return 0;
+
 	if (unlikely(*flt & VM_FAULT_ERROR)) {
 		if (*flt & VM_FAULT_OOM) {
 			ret = -ENOMEM;
diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
index d53fed4eccbd..014005428687 100644
--- a/arch/powerpc/mm/fault.c
+++ b/arch/powerpc/mm/fault.c
@@ -511,6 +511,10 @@ static int ___do_page_fault(struct pt_regs *regs, unsigned long address,
 	if (fault_signal_pending(fault, regs))
 		return user_mode(regs) ? 0 : SIGBUS;
 
+	/* The fault is fully completed (including releasing mmap lock) */
+	if (fault & VM_FAULT_COMPLETED)
+		goto out;
+
 	/*
 	 * Handle the retry right now, the mmap_lock has been released in that
 	 * case.
@@ -525,6 +529,7 @@ static int ___do_page_fault(struct pt_regs *regs, unsigned long address,
 	if (unlikely(fault & VM_FAULT_ERROR))
 		return mm_fault_error(regs, address, fault);
 
+out:
 	/*
 	 * Major/minor page fault accounting.
 	 */
diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
index 4e9efbe46d5f..d6a87f4137ca 100644
--- a/arch/riscv/mm/fault.c
+++ b/arch/riscv/mm/fault.c
@@ -330,6 +330,10 @@ asmlinkage void do_page_fault(struct pt_regs *regs)
 	if (fault_signal_pending(fault, regs))
 		return;
 
+	/* The fault is fully completed (including releasing mmap lock) */
+	if (fault & VM_FAULT_COMPLETED)
+		return;
+
 	if (unlikely(fault & VM_FAULT_RETRY)) {
 		flags |= FAULT_FLAG_TRIED;
 
diff --git a/arch/s390/mm/fault.c b/arch/s390/mm/fault.c
index e173b6187ad5..973dcd05c293 100644
--- a/arch/s390/mm/fault.c
+++ b/arch/s390/mm/fault.c
@@ -433,6 +433,17 @@ static inline vm_fault_t do_exception(struct pt_regs *regs, int access)
 			goto out_up;
 		goto out;
 	}
+
+	/* The fault is fully completed (including releasing mmap lock) */
+	if (fault & VM_FAULT_COMPLETED) {
+		if (gmap) {
+			mmap_read_lock(mm);
+			goto out_gmap;
+		}
+		fault = 0;
+		goto out;
+	}
+
 	if (unlikely(fault & VM_FAULT_ERROR))
 		goto out_up;
 
@@ -452,6 +463,7 @@ static inline vm_fault_t do_exception(struct pt_regs *regs, int access)
 		mmap_read_lock(mm);
 		goto retry;
 	}
+out_gmap:
 	if (IS_ENABLED(CONFIG_PGSTE) && gmap) {
 		address =  __gmap_link(gmap, current->thread.gmap_addr,
 				       address);
diff --git a/arch/sh/mm/fault.c b/arch/sh/mm/fault.c
index e175667b1363..acd2f5e50bfc 100644
--- a/arch/sh/mm/fault.c
+++ b/arch/sh/mm/fault.c
@@ -485,6 +485,10 @@ asmlinkage void __kprobes do_page_fault(struct pt_regs *regs,
 		if (mm_fault_error(regs, error_code, address, fault))
 			return;
 
+	/* The fault is fully completed (including releasing mmap lock) */
+	if (fault & VM_FAULT_COMPLETED)
+		return;
+
 	if (fault & VM_FAULT_RETRY) {
 		flags |= FAULT_FLAG_TRIED;
 
diff --git a/arch/sparc/mm/fault_32.c b/arch/sparc/mm/fault_32.c
index ad569d9bd124..91259f291c54 100644
--- a/arch/sparc/mm/fault_32.c
+++ b/arch/sparc/mm/fault_32.c
@@ -190,6 +190,10 @@ asmlinkage void do_sparc_fault(struct pt_regs *regs, int text_fault, int write,
 	if (fault_signal_pending(fault, regs))
 		return;
 
+	/* The fault is fully completed (including releasing mmap lock) */
+	if (fault & VM_FAULT_COMPLETED)
+		return;
+
 	if (unlikely(fault & VM_FAULT_ERROR)) {
 		if (fault & VM_FAULT_OOM)
 			goto out_of_memory;
diff --git a/arch/sparc/mm/fault_64.c b/arch/sparc/mm/fault_64.c
index 253e07043298..4acc12eafbf5 100644
--- a/arch/sparc/mm/fault_64.c
+++ b/arch/sparc/mm/fault_64.c
@@ -427,6 +427,10 @@ asmlinkage void __kprobes do_sparc64_fault(struct pt_regs *regs)
 	if (fault_signal_pending(fault, regs))
 		goto exit_exception;
 
+	/* The fault is fully completed (including releasing mmap lock) */
+	if (fault & VM_FAULT_COMPLETED)
+		goto lock_released;
+
 	if (unlikely(fault & VM_FAULT_ERROR)) {
 		if (fault & VM_FAULT_OOM)
 			goto out_of_memory;
@@ -449,6 +453,7 @@ asmlinkage void __kprobes do_sparc64_fault(struct pt_regs *regs)
 	}
 	mmap_read_unlock(mm);
 
+lock_released:
 	mm_rss = get_mm_rss(mm);
 #if defined(CONFIG_TRANSPARENT_HUGEPAGE)
 	mm_rss -= (mm->context.thp_pte_count * (HPAGE_SIZE / PAGE_SIZE));
diff --git a/arch/um/kernel/trap.c b/arch/um/kernel/trap.c
index d1d5d0be0308..d3ce21c4ca32 100644
--- a/arch/um/kernel/trap.c
+++ b/arch/um/kernel/trap.c
@@ -76,6 +76,10 @@ int handle_page_fault(unsigned long address, unsigned long ip,
 		if ((fault & VM_FAULT_RETRY) && fatal_signal_pending(current))
 			goto out_nosemaphore;
 
+		/* The fault is fully completed (including releasing mmap lock) */
+		if (fault & VM_FAULT_COMPLETED)
+			return 0;
+
 		if (unlikely(fault & VM_FAULT_ERROR)) {
 			if (fault & VM_FAULT_OOM) {
 				goto out_of_memory;
diff --git a/arch/x86/mm/fault.c b/arch/x86/mm/fault.c
index d0074c6ed31a..12ed70b432d6 100644
--- a/arch/x86/mm/fault.c
+++ b/arch/x86/mm/fault.c
@@ -1408,6 +1408,10 @@ void do_user_addr_fault(struct pt_regs *regs,
 		return;
 	}
 
+	/* The fault is fully completed (including releasing mmap lock) */
+	if (fault & VM_FAULT_COMPLETED)
+		return;
+
 	/*
 	 * If we need to retry the mmap_lock has already been released,
 	 * and if there is a fatal signal pending there is no guarantee
diff --git a/arch/xtensa/mm/fault.c b/arch/xtensa/mm/fault.c
index 06d0973a0d74..5f64305ba8d7 100644
--- a/arch/xtensa/mm/fault.c
+++ b/arch/xtensa/mm/fault.c
@@ -118,6 +118,10 @@ void do_page_fault(struct pt_regs *regs)
 		return;
 	}
 
+	/* The fault is fully completed (including releasing mmap lock) */
+	if (fault & VM_FAULT_COMPLETED)
+		return;
+
 	if (unlikely(fault & VM_FAULT_ERROR)) {
 		if (fault & VM_FAULT_OOM)
 			goto out_of_memory;
diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index c09b7f0555b8..decc275db3c9 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -729,6 +729,7 @@ typedef __bitwise unsigned int vm_fault_t;
  * @VM_FAULT_NEEDDSYNC:		->fault did not modify page tables and needs
  *				fsync() to complete (for synchronous page faults
  *				in DAX)
+ * @VM_FAULT_COMPLETED:		->fault completed, meanwhile mmap lock released
  * @VM_FAULT_HINDEX_MASK:	mask HINDEX value
  *
  */
@@ -746,6 +747,7 @@ enum vm_fault_reason {
 	VM_FAULT_FALLBACK       = (__force vm_fault_t)0x000800,
 	VM_FAULT_DONE_COW       = (__force vm_fault_t)0x001000,
 	VM_FAULT_NEEDDSYNC      = (__force vm_fault_t)0x002000,
+	VM_FAULT_COMPLETED      = (__force vm_fault_t)0x004000,
 	VM_FAULT_HINDEX_MASK    = (__force vm_fault_t)0x0f0000,
 };
 
diff --git a/mm/gup.c b/mm/gup.c
index 2e07cff3b31b..a63d330b9d43 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -951,6 +951,25 @@ static int faultin_page(struct vm_area_struct *vma,
 	}
 
 	ret = handle_mm_fault(vma, address, fault_flags, NULL);
+
+	if (ret & VM_FAULT_COMPLETED) {
+		/*
+		 * With FAULT_FLAG_RETRY_NOWAIT we'll never release the
+		 * mmap lock in the page fault handler. Sanity check this.
+		 */
+		WARN_ON_ONCE(fault_flags & FAULT_FLAG_RETRY_NOWAIT);
+		if (locked)
+			*locked = 0;
+		/*
+		 * We should do the same as VM_FAULT_RETRY, but let's not
+		 * return -EBUSY since that's not reflecting the reality of
+		 * what has happened - we've just fully completed a page
+		 * fault, with the mmap lock released.  Use -EAGAIN to show
+		 * that we want to take the mmap lock _again_.
+		 */
+		return -EAGAIN;
+	}
+
 	if (ret & VM_FAULT_ERROR) {
 		int err = vm_fault_to_errno(ret, *flags);
 
@@ -1177,6 +1196,7 @@ static long __get_user_pages(struct mm_struct *mm,
 			case 0:
 				goto retry;
 			case -EBUSY:
+			case -EAGAIN:
 				ret = 0;
 				fallthrough;
 			case -EFAULT:
@@ -1303,6 +1323,18 @@ int fixup_user_fault(struct mm_struct *mm,
 		return -EINTR;
 
 	ret = handle_mm_fault(vma, address, fault_flags, NULL);
+
+	if (ret & VM_FAULT_COMPLETED) {
+		/*
+		 * NOTE: it's a pity that we need to retake the lock here
+		 * to pair with the unlock() in the callers. Ideally we
+		 * could tell the callers so they do not need to unlock.
+		 */
+		mmap_read_lock(mm);
+		*unlocked = true;
+		return 0;
+	}
+
 	if (ret & VM_FAULT_ERROR) {
 		int err = vm_fault_to_errno(ret, 0);
 
@@ -1368,7 +1400,7 @@ static __always_inline long __get_user_pages_locked(struct mm_struct *mm,
 			/* VM_FAULT_RETRY couldn't trigger, bypass */
 			return ret;
 
-		/* VM_FAULT_RETRY cannot return errors */
+		/* VM_FAULT_RETRY or VM_FAULT_COMPLETED cannot return errors */
 		if (!*locked) {
 			BUG_ON(ret < 0);
 			BUG_ON(ret >= nr_pages);
diff --git a/mm/memory.c b/mm/memory.c
index 54d106e0c999..a8be2d7a8718 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -3020,7 +3020,7 @@ static vm_fault_t fault_dirty_shared_page(struct vm_fault *vmf)
 		balance_dirty_pages_ratelimited(mapping);
 		if (fpin) {
 			fput(fpin);
-			return VM_FAULT_RETRY;
+			return VM_FAULT_COMPLETED;
 		}
 	}
 
-- 
2.32.0

