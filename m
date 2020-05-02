Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D94F1C24F3
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 May 2020 13:54:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49DnbK6PGyzDqY1
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 May 2020 21:54:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=n1Xb6A1Q; dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Dmr04hvhzDr4F
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 May 2020 21:20:16 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id w65so2876460pfc.12
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 02 May 2020 04:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ngF+/VTXuSTxQr/xXhijWJSjNKdEe+slKpomc4w9zks=;
 b=n1Xb6A1QucNWxtSqDUjF2AVj3hI7cvqjG/UGnBoMTm77TndibzaB29q4ZubOVjTUTB
 m0oX2crAMhbcm3W2m8h2rWpX81+dgQim/5SODJDDXQQUN7zB/2x256l1gW9jYjt3KBDm
 Ir2Y0XXZloje7yVGuMcC07nX0IpZZzckPtyD9vfBs6MD9vEgagOOXFZgKH0ZEh6/scyD
 ZbBuUapiOqPkY661n12llkOy774etbAjpgwMlwP9Nj1qr1lyT13kapJqX47qVRlAU2C0
 mr59l0rq7bXRySlDhZkP8auy7be+sHxnjiv4k8i9Dmiy/ZUWqBOtaMIUOF91U+68n1U9
 IX3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ngF+/VTXuSTxQr/xXhijWJSjNKdEe+slKpomc4w9zks=;
 b=MX2qaJh1KpspkoRfbRj5K9R1FVtePL/19KThz8P5ngQjIoP+T15J/VsFq6zK6gNoze
 0eeSOZmrPr4ldU1qt/JlNZUsNoUBZvw6lxmmBeECkFJT4E/6FNYSL74L14HTyL0uEr+q
 qJy8QOSvYfZxS+iciNvkTk+JnmCNFKqon3dDkoA+G6i37bVpqo2t929XLsgKb24O7WPF
 YMqGFcLZrVfl5WQ23m8cCjjZOixLwb602t/8S9nrTuBiOcJFZxMBhl+IZIyZhlPdki1W
 P1c9lTSMYrbDwZTLld6medF/Dw1k5okwTmA7qu8wry4zJvBbeMn1EOUFHpfgj0xaUkTy
 hLvg==
X-Gm-Message-State: AGi0PuYV4UEUx7EmAGz0bYODck3BHk1jiYKHcWmacJ6L8y0RPxXbBacX
 HsOwv7N6jhPUnWeLrSJXNcxFuuHh
X-Google-Smtp-Source: APiQypKO+1ZgQmHC2wj2b5DuGrYsFc+pi0uGops4herWIQ5xvXEksxt0hIaf/mgJ5yrWTIil9dloqQ==
X-Received: by 2002:a62:3181:: with SMTP id x123mr8248812pfx.109.1588418413656; 
 Sat, 02 May 2020 04:20:13 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([203.220.177.17])
 by smtp.gmail.com with ESMTPSA id q15sm3862790pgj.52.2020.05.02.04.20.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 May 2020 04:20:13 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 08/10] powerpc/powernv: Set up an mm context to call OPAL
 in
Date: Sat,  2 May 2020 21:19:12 +1000
Message-Id: <20200502111914.166578-9-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200502111914.166578-1-npiggin@gmail.com>
References: <20200502111914.166578-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This creates an mm context to be used for OPAL V4 calls, which
is populated with ptes according to querying OPAL_FIND_VM_AREA.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/platforms/powernv/opal-call.c |  21 +++-
 arch/powerpc/platforms/powernv/opal.c      | 119 ++++++++++++++++++++-
 2 files changed, 137 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/opal-call.c b/arch/powerpc/platforms/powernv/opal-call.c
index e62a74dfb3d0..4bdad3d2fa18 100644
--- a/arch/powerpc/platforms/powernv/opal-call.c
+++ b/arch/powerpc/platforms/powernv/opal-call.c
@@ -104,6 +104,9 @@ typedef int64_t (*opal_v4_le_entry_fn)(uint64_t r3, uint64_t r4, uint64_t r5,
                                uint64_t r6, uint64_t r7, uint64_t r8,
                                uint64_t r9, uint64_t r10);
 
+extern struct mm_struct *opal_mm;
+extern bool opal_mm_enabled;
+
 static int64_t opal_call(int64_t a0, int64_t a1, int64_t a2, int64_t a3,
 	     int64_t a4, int64_t a5, int64_t a6, int64_t a7, int64_t opcode)
 {
@@ -117,6 +120,8 @@ static int64_t opal_call(int64_t a0, int64_t a1, int64_t a2, int64_t a3,
 		fn = (opal_v4_le_entry_fn)(opal.v4_le_entry);
 
 	if (fn) {
+		struct mm_struct *old_mm = current->active_mm;
+
 		if (!mmu) {
 			BUG_ON(msr & MSR_EE);
 			ret = fn(opcode, a0, a1, a2, a3, a4, a5, a6);
@@ -126,11 +131,23 @@ static int64_t opal_call(int64_t a0, int64_t a1, int64_t a2, int64_t a3,
 		local_irq_save(flags);
 		hard_irq_disable(); /* XXX r13 */
 		msr &= ~MSR_EE;
-		mtmsr(msr & ~(MSR_IR|MSR_DR));
+		if (!opal_mm_enabled)
+			mtmsr(msr & ~(MSR_IR|MSR_DR));
+
+		if (opal_mm_enabled && old_mm != opal_mm) {
+			current->active_mm = opal_mm;
+			switch_mm_irqs_off(NULL, opal_mm, current);
+		}
 
 		ret = fn(opcode, a0, a1, a2, a3, a4, a5, a6);
 
-		mtmsr(msr);
+		if (opal_mm_enabled && old_mm != opal_mm) {
+			current->active_mm = old_mm;
+			switch_mm_irqs_off(NULL, old_mm, current);
+		}
+
+		if (!opal_mm_enabled)
+			mtmsr(msr);
 		local_irq_restore(flags);
 
 		return ret;
diff --git a/arch/powerpc/platforms/powernv/opal.c b/arch/powerpc/platforms/powernv/opal.c
index d00772d40680..98d6d7fc5411 100644
--- a/arch/powerpc/platforms/powernv/opal.c
+++ b/arch/powerpc/platforms/powernv/opal.c
@@ -45,6 +45,10 @@ struct opal_msg_node {
 static DEFINE_SPINLOCK(msg_list_lock);
 static LIST_HEAD(msg_list);
 
+struct mm_struct *opal_mm __read_mostly;
+bool opal_v4_present __read_mostly;
+bool opal_mm_enabled __read_mostly;
+
 /* /sys/firmware/opal */
 struct kobject *opal_kobj __read_mostly;
 
@@ -172,7 +176,12 @@ int __init early_init_dt_scan_opal(unsigned long node,
 
 	if (of_flat_dt_is_compatible(node, "ibm,opal-v3")) {
 		powerpc_firmware_features |= FW_FEATURE_OPAL;
-		pr_debug("OPAL detected !\n");
+		if (of_flat_dt_is_compatible(node, "ibm,opal-v4")) {
+			opal_v4_present = true;
+			pr_debug("OPAL v4 runtime firmware\n");
+		} else {
+			pr_debug("OPAL detected !\n");
+		}
 	} else {
 		panic("OPAL v3 compatible firmware not detected, can not continue.\n");
 	}
@@ -187,6 +196,9 @@ int __init early_init_dt_scan_opal(unsigned long node,
 
 		pr_debug("OPAL v4 Entry = 0x%llx (v4_le_entryp=%p v4_le_entrysz=%d)\n",
 			 opal.v4_le_entry, v4_le_entryp, v4_le_entrysz);
+	} else {
+		/* Can't use v4 entry */
+		opal_v4_present = false;
 	}
 
 	return 1;
@@ -1033,6 +1045,111 @@ static void opal_init_heartbeat(void)
 		kopald_tsk = kthread_run(kopald, NULL, "kopald");
 }
 
+static pgprot_t opal_vm_flags_to_prot(uint64_t flags)
+{
+	pgprot_t prot;
+
+	BUG_ON(!flags);
+	if (flags & OS_VM_FLAG_EXECUTE) {
+		if (flags & OS_VM_FLAG_CI)
+			BUG();
+		if (flags & OS_VM_FLAG_WRITE)
+			prot = PAGE_KERNEL_X;
+		else
+			prot = PAGE_KERNEL_X /* XXX!? PAGE_KERNEL_ROX */;
+	} else {
+		if (flags & OS_VM_FLAG_WRITE)
+			prot = PAGE_KERNEL;
+		else if (flags & OS_VM_FLAG_READ)
+			prot = PAGE_KERNEL_RO;
+		else
+			BUG();
+		if (flags & OS_VM_FLAG_CI)
+			prot = pgprot_noncached(prot);
+	}
+	return prot;
+}
+
+static int __init opal_init_mm(void)
+{
+	struct mm_struct *mm;
+	unsigned long addr;
+	struct opal_vm_area vm_area;
+
+	mm = copy_init_mm();
+	if (!mm)
+		return -ENOMEM;
+
+	/* Set up initial mappings for OPAL. */
+	addr = 0;
+	while (opal_find_vm_area(addr, &vm_area) == OPAL_SUCCESS) {
+		unsigned long length;
+		unsigned long pa;
+		unsigned long flags;
+		unsigned long end;
+		pgprot_t prot;
+
+		addr = be64_to_cpu(vm_area.address);
+		length = be64_to_cpu(vm_area.length);
+		pa = be64_to_cpu(vm_area.pa);
+		flags = be64_to_cpu(vm_area.vm_flags);
+
+		if (flags == 0) {
+			/* flags == 0 is a special case */
+			BUG_ON(pa != 0);
+		} else {
+			/* Don't support non-linear (yet?) */
+			BUG_ON(addr != pa);
+			prot = opal_vm_flags_to_prot(flags);
+		}
+
+		/* Align to PAGE_SIZE */
+		end = (addr + length + PAGE_SIZE - 1) & ~(PAGE_SIZE - 1);
+		addr &= ~(PAGE_SIZE - 1);
+
+		while (addr < end) {
+			spinlock_t *ptl;
+			pte_t pte, *ptep;
+
+			ptep = get_locked_pte(mm, addr, &ptl);
+			if (flags) {
+				pte = pfn_pte(addr >> PAGE_SHIFT, prot);
+				set_pte_at(mm, addr, ptep, pte);
+			} else {
+				pte_clear(mm, addr, ptep);
+			}
+			pte_unmap_unlock(ptep, ptl);
+
+			addr += PAGE_SIZE;
+		}
+	}
+
+	printk("OPAL Virtual Memory Runtime Enabled, using PID=0x%04x\n", (unsigned int)mm->context.id);
+
+	opal_mm = mm;
+	opal_mm_enabled = true;
+
+	return 0;
+}
+
+static int __init opal_init_early(void)
+{
+	int rc;
+
+	if (opal_v4_present) {
+		if (radix_enabled()) {
+			/* Hash can't resolve SLB faults to the switched mm */
+			rc = opal_init_mm();
+			if (rc) {
+				pr_warn("OPAL virtual memory init failed, firmware will run in real-mode.\n");
+			}
+		}
+	}
+
+	return 0;
+}
+machine_early_initcall(powernv, opal_init_early);
+
 static int __init opal_init(void)
 {
 	struct device_node *np, *consoles, *leds;
-- 
2.23.0

