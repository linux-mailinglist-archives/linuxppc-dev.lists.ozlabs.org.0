Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 219BC10E4CF
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Dec 2019 04:09:45 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47R9854D16zDqJ1
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Dec 2019 14:09:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="t5g7oyFi"; 
 dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47R96G4QBKzDqHf
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Dec 2019 14:08:05 +1100 (AEDT)
Received: by mail-pg1-x541.google.com with SMTP id x7so915444pgl.11
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 01 Dec 2019 19:08:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=T/3Jk2G7QYOuw7L/bhLrZNQCJHwcPGj/jaH8bLpv9Sg=;
 b=t5g7oyFi45mOfl7610T8xPu0YKW0EjTrz7A43Jcw2PvTbPZ4KOvJben3A2sm7Ikqaf
 tin1Qzhxe7MNlTTYgpIC+mkJGyFwFTIb2xcfy6guMTxetZGG7JC8UMOZ0pg76NT5wJbS
 p/FlCcH4pUsC+tZbaUvYhPadFb0NX0LI22R6Y7VUOxJBwsI1NveKD8aCeFzuec+0RpFP
 6eH1Cjl45PbZeT9203MEy4Lq9W3OJZ22vwndq+3sAFaPJxkDpRuoJSJvvPibLp/Iv4ia
 zbmx7rJurnPo9LOqTYiLnDRSTyzTjcC7XXulrP1Wx+8mOam8KhZ5b04RTT60o3PTG5ez
 d7FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=T/3Jk2G7QYOuw7L/bhLrZNQCJHwcPGj/jaH8bLpv9Sg=;
 b=hc93QB0YlGPEz17kDV3UmBk+xwSufkE8CP8o5ypnFdInoe/tn/THlwHb+qwtPA0aV9
 U3tTJkknPzDeqAo+MgcBNyYb45hMZ2FR5J4dAigLX0biK6pfhhiJbo7DRctXDPqBKekU
 OrD6x9G1Pp4O+3jeB5kGYPyaEj28SOg2YBEJUW6g4tKqkhRUlp9RalT/uW93gmX7XQ/q
 wNGGG7Ksav64sQyjDc3/YwWk2bF8w21Y/Vy8LsAz2WtfCVNLf1LCXHJvCFW2NSIjtFd+
 S2nONs32AIuBvq1vjaX/M3VkLYrV1/EFRsbGsRWX6R1Zb7j3kYVCYTNhdHz73D1UZpm/
 f5rw==
X-Gm-Message-State: APjAAAVjGAUfi2XwBHHe805rzc14O71c1mQEWluvUw+0gCWeHJUucQuE
 lpNSjAdrM3tOPQicdnkas9+NAlMl
X-Google-Smtp-Source: APXvYqyKSf6ORPRMm2zRCo3rITLZXzQ1wIzuEv9/axQXHeX4TAm0mFrSVDdWfKQnsRcmMTk1owmUzw==
X-Received: by 2002:aa7:870c:: with SMTP id b12mr10097760pfo.82.1575256082192; 
 Sun, 01 Dec 2019 19:08:02 -0800 (PST)
Received: from sol.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id q41sm21743646pja.20.2019.12.01.19.08.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Dec 2019 19:08:01 -0800 (PST)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/mm: Remove kvm radix prefetch workaround for Power9
 DD2.2
Date: Mon,  2 Dec 2019 14:07:31 +1100
Message-Id: <20191202030731.26714-1-jniethe5@gmail.com>
X-Mailer: git-send-email 2.20.1
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
Cc: Jordan Niethe <jniethe5@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit a25bd72badfa ("powerpc/mm/radix: Workaround prefetch issue with
KVM") introduced a number of workarounds as coming out of a guest with
the mmu enabled would make the cpu would start running in hypervisor
state with the PID value from the guest. The cpu will then start
prefetching for the hypervisor with that PID value.

In Power9 DD2.2 the cpu behaviour was modified to fix this. When
accessing Quadrant 0 in hypervisor mode with LPID != 0 prefetching will
not be performed. This means that we can get rid of the workarounds for
Power9 DD2.2 and later revisions.

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
 arch/powerpc/kvm/book3s_hv_rmhandlers.S  |  9 +++++++++
 arch/powerpc/mm/book3s64/radix_pgtable.c | 18 ++++++++++++------
 arch/powerpc/mm/book3s64/radix_tlb.c     |  5 +++++
 3 files changed, 26 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
index faebcbb8c4db..6bbc5fbc7ea9 100644
--- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
+++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
@@ -1793,6 +1793,15 @@ END_FTR_SECTION_IFSET(CPU_FTR_ARCH_300)
 	tlbsync
 	ptesync
 
+	/* We do not need this work around from POWER9 DD2.2 and onwards */
+	mfspr	r3, SPRN_PVR
+	srwi	r6, r3, 16
+	cmpwi	cr0, r6, PVR_POWER9
+	bne	cr0, 2f
+	andi.	r3, r3, 0xfff
+	cmpwi	cr0, r3, 0x202
+	bge	cr0, 2f
+
 	/* Radix: Handle the case where the guest used an illegal PID */
 	LOAD_REG_ADDR(r4, mmu_base_pid)
 	lwz	r3, VCPU_GUEST_PID(r9)
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index 6ee17d09649c..1f280124994e 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -312,6 +312,7 @@ static void __init radix_init_pgtable(void)
 {
 	unsigned long rts_field;
 	struct memblock_region *reg;
+	unsigned int pvr;
 
 	/* We don't support slb for radix */
 	mmu_slb_size = 0;
@@ -336,24 +337,29 @@ static void __init radix_init_pgtable(void)
 	}
 
 	/* Find out how many PID bits are supported */
+	pvr = mfspr(SPRN_PVR);
 	if (cpu_has_feature(CPU_FTR_HVMODE)) {
 		if (!mmu_pid_bits)
 			mmu_pid_bits = 20;
 #ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
 		/*
-		 * When KVM is possible, we only use the top half of the
-		 * PID space to avoid collisions between host and guest PIDs
-		 * which can cause problems due to prefetch when exiting the
-		 * guest with AIL=3
+		 * Before Power9 DD2.2, when KVM is possible, we only use the
+		 * top half of the PID space to avoid collisions between host
+		 * and guest PIDs which can cause problems due to prefetch when
+		 * exiting the guest with AIL=3
 		 */
-		mmu_base_pid = 1 << (mmu_pid_bits - 1);
+		if (PVR_VER(pvr) == PVR_POWER9 && ((0xfff & pvr) < 0x202))
+			mmu_base_pid = 1;
+		else
+			mmu_base_pid = 1 << (mmu_pid_bits - 1);
 #else
 		mmu_base_pid = 1;
 #endif
 	} else {
 		/* The guest uses the bottom half of the PID space */
 		if (!mmu_pid_bits)
-			mmu_pid_bits = 19;
+			mmu_pid_bits = (PVR_VER(pvr) == PVR_POWER9 &&
+					((0xfff & pvr) < 0x202)) ? 19 : 20;
 		mmu_base_pid = 1;
 	}
 
diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3s64/radix_tlb.c
index 67af871190c6..cc86d8a88b86 100644
--- a/arch/powerpc/mm/book3s64/radix_tlb.c
+++ b/arch/powerpc/mm/book3s64/radix_tlb.c
@@ -1217,10 +1217,15 @@ void radix__flush_tlb_all(void)
 extern void radix_kvm_prefetch_workaround(struct mm_struct *mm)
 {
 	unsigned long pid = mm->context.id;
+	unsigned int pvr;
 
 	if (unlikely(pid == MMU_NO_CONTEXT))
 		return;
 
+	pvr = mfspr(SPRN_PVR);
+	if (PVR_VER(pvr) != PVR_POWER9 || ((0xfff & pvr) >= 0x202))
+		return;
+
 	/*
 	 * If this context hasn't run on that CPU before and KVM is
 	 * around, there's a slim chance that the guest on another
-- 
2.20.1

