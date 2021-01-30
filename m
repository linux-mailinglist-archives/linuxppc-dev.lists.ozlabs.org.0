Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C04A03095EE
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Jan 2021 15:31:03 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DSc831BxZzDsW7
	for <lists+linuxppc-dev@lfdr.de>; Sun, 31 Jan 2021 01:30:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102e;
 helo=mail-pj1-x102e.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Wu8YKSuG; dkim-atps=neutral
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DSZMW11QZzDrTg
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 31 Jan 2021 00:10:47 +1100 (AEDT)
Received: by mail-pj1-x102e.google.com with SMTP id md11so7231876pjb.0
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Jan 2021 05:10:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I0+Jeoro44ptIvnoBfCIHAnIA9LHbVq1hIUshW9qjh8=;
 b=Wu8YKSuGmWqFkkU1nLmrU2wgL+5t3Vu/zZR2KwA0L1xEdh39xutuz39rMBwsTug2Dd
 zUXletCBi3L2fuki8IHqr0/Ga9QONCmOhIPEBqJ4y3sYGL0EAkm1nfiaBV1Q5pWl95Ee
 S88W0IF/HRXj4btMyDUQVmKPeodP40D0z+XFfyT/nYAXXHN7rKsF3oE0EvWAjcC1IGK+
 NS5JwiOKfMXRyJOlef0hSw7VDqyHwN5FmK5qXg2SE57K/JqsaFbX3KbcFPVQQVMAp/f/
 yNmVX8FY/85SOeew7ZhMnRwEHHW+HRpXAyga93bdzmSlZ2hGgPGCbsvTeg6pr/+a3Yu1
 f82Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I0+Jeoro44ptIvnoBfCIHAnIA9LHbVq1hIUshW9qjh8=;
 b=HQjJhaE0988fw6fqUKFFjbaAXFEMWJfpubabH7MI4WBXCK2ig2ux24Wd7GeAVWgSMC
 oLJ3W/5e0WLIfasRAMmZrlHZPHqet2Xe4c5rRtXM+tyGcDv1t5bGkkCkYnNsv0tQD7QQ
 3SpuzrwNFQRIzUxb2w2eQi7TdAZk9nqpjp023kDzCeHsjFPLrQbLeJfyR4lQh0kCGiQ/
 Wy2lEQY7JY3Eo7JftSWCy6x3dd0Hgdea8v7qJf8slZR/85jn/pCpwOI1vMQ8gVP6E+3k
 tD+6rvgkI70OqLJMyRHZ/eQiWp5GAfErDF/kkZY3wV34s+jzaNDks4YaYVOMy6fnTXWc
 3pgw==
X-Gm-Message-State: AOAM531CWORUjReReSfbZyp6BbzrnBf35N3P+l0Q9PWv6TC5kPitJQxO
 4pvl0s+ye0/YE6Lgh9IHQWX5NglLf60=
X-Google-Smtp-Source: ABdhPJwL9VAcy9jfEv2O3wGkhLEJH/savpbMiA07ahIB9MPa/rzUZTjrrQvBo/1mLOOVhmN9+ddoxA==
X-Received: by 2002:a17:902:47:b029:de:c58e:8257 with SMTP id
 65-20020a1709020047b02900dec58e8257mr9738647pla.61.1612012244361; 
 Sat, 30 Jan 2021 05:10:44 -0800 (PST)
Received: from bobo.ozlabs.ibm.com
 (192.156.221.203.dial.dynamic.acc50-nort-cbr.comindico.com.au.
 [203.221.156.192])
 by smtp.gmail.com with ESMTPSA id y16sm12102240pgg.20.2021.01.30.05.10.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Jan 2021 05:10:43 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v7 31/42] powerpc/64s/hash: improve context tracking of hash
 faults
Date: Sat, 30 Jan 2021 23:08:41 +1000
Message-Id: <20210130130852.2952424-32-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210130130852.2952424-1-npiggin@gmail.com>
References: <20210130130852.2952424-1-npiggin@gmail.com>
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
Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This moves the 64s/hash context tracking from hash_page_mm() to
__do_hash_fault(), so it's no longer called by OCXL / SPU
accelerators, which was certainly the wrong thing to be doing,
because those callers are not low level interrupt handlers, so
should have entered a kernel context tracking already.

Then remain in kernel context for the duration of the fault,
rather than enter/exit for the hash fault then enter/exit for
the page fault, which is pointless.

Even still, calling exception_enter/exit in __do_hash_fault seems
questionable because that's touching per-cpu variables, tracing,
etc., which might have been interrupted by this hash fault or
themselves cause hash faults. But maybe I miss something because
hash_page_mm very deliberately calls trace_hash_fault too, for
example. So for now go with it, it's no worse than before, in this
regard.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/bug.h        |  1 +
 arch/powerpc/mm/book3s64/hash_utils.c |  7 ++---
 arch/powerpc/mm/fault.c               | 39 +++++++++++++++++++--------
 3 files changed, 33 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/include/asm/bug.h b/arch/powerpc/include/asm/bug.h
index c10ae0a9bbaf..d1635ffbb179 100644
--- a/arch/powerpc/include/asm/bug.h
+++ b/arch/powerpc/include/asm/bug.h
@@ -112,6 +112,7 @@
 
 struct pt_regs;
 long do_page_fault(struct pt_regs *);
+long hash__do_page_fault(struct pt_regs *);
 void bad_page_fault(struct pt_regs *, int);
 void __bad_page_fault(struct pt_regs *regs, int sig);
 void do_bad_page_fault_segv(struct pt_regs *regs);
diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index cf167f6d825d..d681dc5a7b1c 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -1289,7 +1289,6 @@ int hash_page_mm(struct mm_struct *mm, unsigned long ea,
 		 unsigned long flags)
 {
 	bool is_thp;
-	enum ctx_state prev_state = exception_enter();
 	pgd_t *pgdir;
 	unsigned long vsid;
 	pte_t *ptep;
@@ -1491,7 +1490,6 @@ int hash_page_mm(struct mm_struct *mm, unsigned long ea,
 	DBG_LOW(" -> rc=%d\n", rc);
 
 bail:
-	exception_exit(prev_state);
 	return rc;
 }
 EXPORT_SYMBOL_GPL(hash_page_mm);
@@ -1516,6 +1514,7 @@ EXPORT_SYMBOL_GPL(hash_page);
 DECLARE_INTERRUPT_HANDLER_RET(__do_hash_fault);
 DEFINE_INTERRUPT_HANDLER_RET(__do_hash_fault)
 {
+	enum ctx_state prev_state = exception_enter();
 	unsigned long ea = regs->dar;
 	unsigned long dsisr = regs->dsisr;
 	unsigned long access = _PAGE_PRESENT | _PAGE_READ;
@@ -1564,6 +1563,8 @@ DEFINE_INTERRUPT_HANDLER_RET(__do_hash_fault)
 		err = 0;
 	}
 
+	exception_exit(prev_state);
+
 	return err;
 }
 
@@ -1600,7 +1601,7 @@ DEFINE_INTERRUPT_HANDLER_RAW(do_hash_fault)
 	err = __do_hash_fault(regs);
 	if (err) {
 page_fault:
-		err = do_page_fault(regs);
+		err = hash__do_page_fault(regs);
 	}
 
 	return err;
diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
index 8552ab6c008b..9c4220efc20f 100644
--- a/arch/powerpc/mm/fault.c
+++ b/arch/powerpc/mm/fault.c
@@ -387,7 +387,7 @@ static void sanity_check_fault(bool is_write, bool is_user,
  * The return value is 0 if the fault was handled, or the signal
  * number if this is a kernel fault that can't be handled here.
  */
-static int __do_page_fault(struct pt_regs *regs, unsigned long address,
+static int ___do_page_fault(struct pt_regs *regs, unsigned long address,
 			   unsigned long error_code)
 {
 	struct vm_area_struct * vma;
@@ -537,36 +537,53 @@ static int __do_page_fault(struct pt_regs *regs, unsigned long address,
 
 	return 0;
 }
-NOKPROBE_SYMBOL(__do_page_fault);
+NOKPROBE_SYMBOL(___do_page_fault);
 
-DEFINE_INTERRUPT_HANDLER_RET(do_page_fault)
+static long __do_page_fault(struct pt_regs *regs)
 {
 	const struct exception_table_entry *entry;
-	enum ctx_state prev_state;
 	long err;
 
-	prev_state = exception_enter();
-	err = __do_page_fault(regs, regs->dar, regs->dsisr);
+	err = ___do_page_fault(regs, regs->dar, regs->dsisr);
 	if (likely(!err))
-		goto out;
+		return err;
 
 	entry = search_exception_tables(regs->nip);
 	if (likely(entry)) {
 		instruction_pointer_set(regs, extable_fixup(entry));
-		err = 0;
+		return 0;
 	} else if (IS_ENABLED(CONFIG_PPC_BOOK3S_64)) {
-		/* 32 and 64e handle this in asm */
 		__bad_page_fault(regs, err);
-		err = 0;
+		return 0;
+	} else {
+		/* 32 and 64e handle the bad page fault in asm */
+		return err;
 	}
+}
+NOKPROBE_SYMBOL(__do_page_fault);
+
+DEFINE_INTERRUPT_HANDLER_RET(do_page_fault)
+{
+	enum ctx_state prev_state = exception_enter();
+	long err;
+
+	err = __do_page_fault(regs);
 
-out:
 	exception_exit(prev_state);
 
 	return err;
 }
 NOKPROBE_SYMBOL(do_page_fault);
 
+#ifdef CONFIG_PPC_BOOK3S_64
+/* Same as do_page_fault but interrupt entry has already run in do_hash_fault */
+long hash__do_page_fault(struct pt_regs *regs)
+{
+	return __do_page_fault(regs);
+}
+NOKPROBE_SYMBOL(hash__do_page_fault);
+#endif
+
 /*
  * bad_page_fault is called when we have a bad access from the kernel.
  * It is called from the DSI and ISI handlers in head.S and from some
-- 
2.23.0

