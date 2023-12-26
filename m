Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9632181EA31
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Dec 2023 22:47:06 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=rsr6mVB8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T07dz3LWCz3cGJ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Dec 2023 08:47:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=rsr6mVB8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3pkmlzqykdjklnk7g49hh9e7.5hfebgnqii5-67oeblml.hse34l.hk9@flex--surenb.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T07d620J2z2xTP
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Dec 2023 08:46:16 +1100 (AEDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-5e9074bb7c5so59869347b3.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Dec 2023 13:46:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1703627174; x=1704231974; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mMjOi6FiRyRmKbg6dFlezaHitoPpTFUdgOKhuK4Mldc=;
        b=rsr6mVB8GgADnSe89WmnQH66I2XBkuIvM8lNLP4FqDaSTpgUlZupGFaGxl0RzdBO7w
         kGmQf1DrUxFRJq9qPuaOrWipmGAbvrHAssVuW7VsAnIYktU2wdpuEpeEjfxISLj9YOxs
         SwPilrYjuFa5K15SF8+C6B3UWQfxBtFl6efH64mdjeEnJm/gLDCUzpoKv3KbCEuRQt+3
         9hyfi0+hppxPVSzpJcH2b63fEkE1MPTOoRtLaBPtPvDwi6JHBRY78ZpfFHy+fBgfDsgf
         JA02W0Recgn7yPPryntevgrdplfZht6iLFw4McZlH9aaZg2whxU6I3pEKBasWdYdD+2K
         P20g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703627174; x=1704231974;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mMjOi6FiRyRmKbg6dFlezaHitoPpTFUdgOKhuK4Mldc=;
        b=rs78mzZ0oIWC1IEBdSkgHVXfOGnjzEkBekD4m8Z6XWt1u06O+i6FGm8vJczTWbArjE
         lk7IxjKQPerRWImDasfKFq82wr+Gnk7eXbRY9vRHH8WysCRa5PrpC2rdf8GPbb4U5wxo
         Yob+t1eXD98DUwVsCHrSQvmOoxHZIFCpm7LjeXjtEHhEIC8o7nifF59ZpIXIjRyG8sTD
         gqnwsf78qqv29bbz5xqARVh1QFx0dTFGBmk7MEcwGLrVyALDjFFqp3PMNv71gTg3gjw1
         gRY+h1BXgcNv5daNTqFlEPJwZ4MGf/TqBBFf+ZDTXe0GOTfiTm9btlmK5K3s5Hkll3V1
         xHYA==
X-Gm-Message-State: AOJu0Yz29P0q1A4nUeXXubylaYByZJeJzObNqKpLCWm+sz/Lp5SC+YaK
	u4O+CgPOQraq6B01ndEqheCdVGhkpkJR8Qch/g==
X-Google-Smtp-Source: AGHT+IEwN5ZopzHJIGGQGpit5mUuOLFU32rRNfgvV8zD7G1zJhrTDdVwgrA0i89ppBRhVWOedmhks73ZIg4=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:201:158e:a76f:5745:9194])
 (user=surenb job=sendgmr) by 2002:a05:690c:d1e:b0:5e7:12cc:a60f with SMTP id
 cn30-20020a05690c0d1e00b005e712cca60fmr3151383ywb.6.1703627174107; Tue, 26
 Dec 2023 13:46:14 -0800 (PST)
Date: Tue, 26 Dec 2023 13:46:10 -0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
Message-ID: <20231226214610.109282-1-surenb@google.com>
Subject: [PATCH 1/1] arch/mm/fault: fix major fault accounting when retrying
 under per-VMA lock
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-s390@vger.kernel.org, x86@kernel.org, peterz@infradead.org, catalin.marinas@arm.com, dave.hansen@linux.intel.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, surenb@google.com, linux-riscv@lists.infradead.org, palmer@dabbelt.com, willy@infradead.org, luto@kernel.org, agordeev@linux.ibm.com, will@kernel.org, gerald.schaefer@linux.ibm.com, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

A test [1] in Android test suite started failing after [2] was merged.
It turns out that after handling a major fault under per-VMA lock, the
process major fault counter does not register that fault as major.
Before [2] read faults would be done under mmap_lock, in which case
FAULT_FLAG_TRIED flag is set before retrying. That in turn causes
mm_account_fault() to account the fault as major once retry completes.
With per-VMA locks we often retry because a fault can't be handled
without locking the whole mm using mmap_lock. Therefore such retries
do not set FAULT_FLAG_TRIED flag. This logic does not work after [2]
because we can now handle read major faults under per-VMA lock and
upon retry the fact there was a major fault gets lost. Fix this by
setting FAULT_FLAG_TRIED after retrying under per-VMA lock if
VM_FAULT_MAJOR was returned. Ideally we would use an additional
VM_FAULT bit to indicate the reason for the retry (could not handle
under per-VMA lock vs other reason) but this simpler solution seems
to work, so keeping it simple.

[1] https://cs.android.com/android/platform/superproject/+/master:test/vts-testcase/kernel/api/drop_caches_prop/drop_caches_test.cpp
[2] https://lore.kernel.org/all/20231006195318.4087158-6-willy@infradead.org/

Fixes: 12214eba1992 ("mm: handle read faults under the VMA lock")
Cc: Matthew Wilcox <willy@infradead.org>
Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 arch/arm64/mm/fault.c   | 2 ++
 arch/powerpc/mm/fault.c | 2 ++
 arch/riscv/mm/fault.c   | 2 ++
 arch/s390/mm/fault.c    | 3 +++
 arch/x86/mm/fault.c     | 2 ++
 5 files changed, 11 insertions(+)

diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
index 460d799e1296..55f6455a8284 100644
--- a/arch/arm64/mm/fault.c
+++ b/arch/arm64/mm/fault.c
@@ -607,6 +607,8 @@ static int __kprobes do_page_fault(unsigned long far, unsigned long esr,
 		goto done;
 	}
 	count_vm_vma_lock_event(VMA_LOCK_RETRY);
+	if (fault & VM_FAULT_MAJOR)
+		mm_flags |= FAULT_FLAG_TRIED;
 
 	/* Quick path to respond to signals */
 	if (fault_signal_pending(fault, regs)) {
diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
index 9e49ede2bc1c..53335ae21a40 100644
--- a/arch/powerpc/mm/fault.c
+++ b/arch/powerpc/mm/fault.c
@@ -497,6 +497,8 @@ static int ___do_page_fault(struct pt_regs *regs, unsigned long address,
 		goto done;
 	}
 	count_vm_vma_lock_event(VMA_LOCK_RETRY);
+	if (fault & VM_FAULT_MAJOR)
+		flags |= FAULT_FLAG_TRIED;
 
 	if (fault_signal_pending(fault, regs))
 		return user_mode(regs) ? 0 : SIGBUS;
diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
index 90d4ba36d1d0..081339ddf47e 100644
--- a/arch/riscv/mm/fault.c
+++ b/arch/riscv/mm/fault.c
@@ -304,6 +304,8 @@ void handle_page_fault(struct pt_regs *regs)
 		goto done;
 	}
 	count_vm_vma_lock_event(VMA_LOCK_RETRY);
+	if (fault & VM_FAULT_MAJOR)
+		flags |= FAULT_FLAG_TRIED;
 
 	if (fault_signal_pending(fault, regs)) {
 		if (!user_mode(regs))
diff --git a/arch/s390/mm/fault.c b/arch/s390/mm/fault.c
index 249aefcf7c4e..ab4098886e56 100644
--- a/arch/s390/mm/fault.c
+++ b/arch/s390/mm/fault.c
@@ -337,6 +337,9 @@ static void do_exception(struct pt_regs *regs, int access)
 		return;
 	}
 	count_vm_vma_lock_event(VMA_LOCK_RETRY);
+	if (fault & VM_FAULT_MAJOR)
+		flags |= FAULT_FLAG_TRIED;
+
 	/* Quick path to respond to signals */
 	if (fault_signal_pending(fault, regs)) {
 		if (!user_mode(regs))
diff --git a/arch/x86/mm/fault.c b/arch/x86/mm/fault.c
index ab778eac1952..679b09cfe241 100644
--- a/arch/x86/mm/fault.c
+++ b/arch/x86/mm/fault.c
@@ -1370,6 +1370,8 @@ void do_user_addr_fault(struct pt_regs *regs,
 		goto done;
 	}
 	count_vm_vma_lock_event(VMA_LOCK_RETRY);
+	if (fault & VM_FAULT_MAJOR)
+		flags |= FAULT_FLAG_TRIED;
 
 	/* Quick path to respond to signals */
 	if (fault_signal_pending(fault, regs)) {
-- 
2.43.0.472.g3155946c3a-goog

