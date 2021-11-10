Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 53ED944B9B4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Nov 2021 01:41:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HpmHf20D5z301g
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Nov 2021 11:41:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=SIG2w+Vx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102a;
 helo=mail-pj1-x102a.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=SIG2w+Vx; dkim-atps=neutral
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HpmCN1Y2Jz2yph
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Nov 2021 11:37:36 +1100 (AEDT)
Received: by mail-pj1-x102a.google.com with SMTP id
 o6-20020a17090a0a0600b001a64b9a11aeso113029pjo.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Nov 2021 16:37:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PJnjdi2x7mkLhV9OOe/in7fWckZtp/pUjD1KaPWSj3M=;
 b=SIG2w+VxvgXELvXWmR7WaKGBg0orec5sWesIsjCdJ2F2YP6atY1k5iIjOnoZvAW33I
 l51roYxQbgdlNiFYGxvBsH64w1CJaB94qcdqpG4I7chAiG/IRhNkSL0FnsV2hlLe9Wqe
 sDsir1P+57FRwjqm83tX10gtzDmdptz+fQS+S9sM8JUifEKgm5JU9BcHYuXP1azAaZsx
 Gg5kH99qoAIeZos0NKAJlC/Cd2Ki7KZIDaulO/1LWBMM7aLVRNGLKXI2O0lDBwY60qSM
 BkVWylUkKkhsOHT6XJY6EyacMqICTyFP8lBeMbtxpdCatQ81Vj1i5K+pNuHFzcsxz08M
 2MQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PJnjdi2x7mkLhV9OOe/in7fWckZtp/pUjD1KaPWSj3M=;
 b=TI6IcdL8Zwyk9n1zG+D+Q0jPK5QVdJ5L32EalH509HviMoslbZOBBoaYLTq4vi3c53
 71zxszBqik8cZQFxiIZpzJjKXdhx23880yVr6XUtzfbQCQdktxkIlCIDqjUDDFuP+t/L
 vtpB8byfR78mcaAmmKGjW4QFZBux0Tgkk5NqfPXhasTmXVt3kjjnyBoHZhs0lUPDrcCL
 bPlzEjpZPRuC7G8mJmB8xXuLI9nLQj/yQ8rwXdEJrmZj2FfXvtlkArGO7AP9pz4xSugi
 h1TuPlkkv384XI7zz2KopORwslPTnhMD/+5OlM9oIP9vsD9zd1QCU7uOD4iYzWkWKOqy
 nJBQ==
X-Gm-Message-State: AOAM532UnNXgaHlkWKu2D9iIzc/2MCf4I9AIgffR7b5fXTYoxb5cHwXF
 dYI6o2xyfGONHXvC2N1WNPpqTvSGtlE+8w==
X-Google-Smtp-Source: ABdhPJzTi97Uuj3wqB645/qf49/wzYbyPnRlDXVlTcz2cTk/M/KPP4TgDlRY2LcTlA205FAGzRsMHg==
X-Received: by 2002:a17:902:8e85:b0:142:7621:e3b3 with SMTP id
 bg5-20020a1709028e8500b001427621e3b3mr11150044plb.84.1636504653686; 
 Tue, 09 Nov 2021 16:37:33 -0800 (PST)
Received: from tee480.ozlabs.ibm.com
 (159-196-117-139.9fc475.syd.nbn.aussiebb.net. [159.196.117.139])
 by smtp.gmail.com with ESMTPSA id t21sm15854074pgo.12.2021.11.09.16.37.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Nov 2021 16:37:33 -0800 (PST)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v7 5/5] powerpc/64s: Initialize and use a temporary mm for
 patching on Radix
Date: Wed, 10 Nov 2021 11:37:17 +1100
Message-Id: <20211110003717.1150965-6-jniethe5@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211110003717.1150965-1-jniethe5@gmail.com>
References: <20211110003717.1150965-1-jniethe5@gmail.com>
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
Cc: Jordan Niethe <jniethe5@gmail.com>, cmr@bluescreens.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Christopher M. Riedl" <cmr@bluescreens.de>

When code patching a STRICT_KERNEL_RWX kernel the page containing the
address to be patched is temporarily mapped as writeable. Currently, a
per-cpu vmalloc patch area is used for this purpose. While the patch
area is per-cpu, the temporary page mapping is inserted into the kernel
page tables for the duration of patching. The mapping is exposed to CPUs
other than the patching CPU - this is undesirable from a hardening
perspective. Use a temporary mm instead which keeps the mapping local to
the CPU doing the patching.

Use the `poking_init` init hook to prepare a temporary mm and patching
address. Initialize the temporary mm by copying the init mm. Choose a
randomized patching address inside the temporary mm userspace address
space. The patching address is randomized between PAGE_SIZE and
DEFAULT_MAP_WINDOW-PAGE_SIZE.

Bits of entropy with 64K page size on BOOK3S_64:

        bits of entropy = log2(DEFAULT_MAP_WINDOW_USER64 / PAGE_SIZE)

        PAGE_SIZE=64K, DEFAULT_MAP_WINDOW_USER64=128TB
        bits of entropy = log2(128TB / 64K)
	bits of entropy = 31

The upper limit is DEFAULT_MAP_WINDOW due to how the Book3s64 Hash MMU
operates - by default the space above DEFAULT_MAP_WINDOW is not
available. Currently the Hash MMU does not use a temporary mm so
technically this upper limit isn't necessary; however, a larger
randomization range does not further "harden" this overall approach and
future work may introduce patching with a temporary mm on Hash as well.

Randomization occurs only once during initialization at boot for each
possible CPU in the system.

Introduce a new function, patch_instruction_mm(), to perform the
patching with a temporary mapping with write permissions at
patching_addr. Map the page with PAGE_KERNEL to set EAA[0] for the PTE
which ignores the AMR (so no need to unlock/lock KUAP) according to
PowerISA v3.0b Figure 35 on Radix.

Based on x86 implementation:

commit 4fc19708b165
("x86/alternatives: Initialize temporary mm for patching")

and:

commit b3fd8e83ada0
("x86/alternatives: Use temporary mm for text poking")

Signed-off-by: Christopher M. Riedl <cmr@bluescreens.de>
Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
v7: - Change to patch_instruction_mm() instead of map_patch_mm() and
       unmap_patch_mm()
    - include ptesync
---
 arch/powerpc/lib/code-patching.c | 106 +++++++++++++++++++++++++++++--
 1 file changed, 101 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index aa466e4930ec..7722dec4a914 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -11,6 +11,7 @@
 #include <linux/cpuhotplug.h>
 #include <linux/slab.h>
 #include <linux/uaccess.h>
+#include <linux/random.h>
 
 #include <asm/tlbflush.h>
 #include <asm/page.h>
@@ -76,6 +77,7 @@ static inline void stop_using_temp_mm(struct temp_mm_state prev_state)
 
 static DEFINE_PER_CPU(struct vm_struct *, text_poke_area);
 static DEFINE_PER_CPU(unsigned long, cpu_patching_addr);
+static DEFINE_PER_CPU(struct mm_struct *, cpu_patching_mm);
 
 static int text_area_cpu_up(unsigned int cpu)
 {
@@ -99,8 +101,48 @@ static int text_area_cpu_down(unsigned int cpu)
 	return 0;
 }
 
+static __always_inline void __poking_init_temp_mm(void)
+{
+	int cpu;
+	spinlock_t *ptl;
+	pte_t *ptep;
+	struct mm_struct *patching_mm;
+	unsigned long patching_addr;
+
+	for_each_possible_cpu(cpu) {
+		patching_mm = copy_init_mm();
+		WARN_ON(!patching_mm);
+		per_cpu(cpu_patching_mm, cpu) = patching_mm;
+
+		/*
+		 * Choose a randomized, page-aligned address from the range:
+		 * [PAGE_SIZE, DEFAULT_MAP_WINDOW - PAGE_SIZE] The lower
+		 * address bound is PAGE_SIZE to avoid the zero-page.  The
+		 * upper address bound is DEFAULT_MAP_WINDOW - PAGE_SIZE to
+		 * stay under DEFAULT_MAP_WINDOW with the Book3s64 Hash MMU.
+		 */
+		patching_addr = PAGE_SIZE + ((get_random_long() & PAGE_MASK) %
+					     (DEFAULT_MAP_WINDOW - 2 * PAGE_SIZE));
+		per_cpu(cpu_patching_addr, cpu) = patching_addr;
+
+		/*
+		 * PTE allocation uses GFP_KERNEL which means we need to
+		 * pre-allocate the PTE here because we cannot do the
+		 * allocation during patching when IRQs are disabled.
+		 */
+		ptep = get_locked_pte(patching_mm, patching_addr, &ptl);
+		WARN_ON(!ptep);
+		pte_unmap_unlock(ptep, ptl);
+	}
+}
+
 void __init poking_init(void)
 {
+	if (radix_enabled()) {
+		__poking_init_temp_mm();
+		return;
+	}
+
 	WARN_ON(cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
 		"powerpc/text_poke:online", text_area_cpu_up,
 		text_area_cpu_down) < 0);
@@ -167,6 +209,57 @@ static inline int unmap_patch_area(unsigned long addr)
 	return 0;
 }
 
+/*
+ * This can be called for kernel text or a module.
+ */
+static int patch_instruction_mm(u32 *addr, struct ppc_inst instr)
+{
+	struct mm_struct *patching_mm = __this_cpu_read(cpu_patching_mm);
+	unsigned long text_poke_addr;
+	u32 *patch_addr = NULL;
+	struct temp_mm_state prev;
+	unsigned long flags;
+	struct page *page;
+	spinlock_t *ptl;
+	int rc;
+	pte_t *ptep;
+
+	text_poke_addr = __this_cpu_read(cpu_patching_addr);
+
+	local_irq_save(flags);
+
+	if (is_vmalloc_or_module_addr(addr))
+		page = vmalloc_to_page(addr);
+	else
+		page = virt_to_page(addr);
+
+	ptep = get_locked_pte(patching_mm, text_poke_addr, &ptl);
+	if (unlikely(!ptep)) {
+		pr_warn("map patch: failed to allocate pte for patching\n");
+		return -1;
+	}
+
+	set_pte_at(patching_mm, text_poke_addr, ptep, pte_mkdirty(mk_pte(page, PAGE_KERNEL)));
+	asm volatile("ptesync": : :"memory");
+
+	prev = start_using_temp_mm(patching_mm);
+
+	patch_addr = (u32 *)(text_poke_addr | offset_in_page(addr));
+	rc = __patch_instruction(addr, instr, patch_addr);
+
+	pte_clear(patching_mm, text_poke_addr, ptep);
+
+	local_flush_tlb_mm(patching_mm);
+
+	stop_using_temp_mm(prev);
+	pte_unmap_unlock(ptep, ptl);
+
+	local_irq_restore(flags);
+	WARN_ON(!ppc_inst_equal(ppc_inst_read(addr), instr));
+
+	return rc;
+}
+
 static int do_patch_instruction(u32 *addr, struct ppc_inst instr)
 {
 	int err, rc = 0;
@@ -175,16 +268,19 @@ static int do_patch_instruction(u32 *addr, struct ppc_inst instr)
 	unsigned long text_poke_addr;
 
 	/*
-	 * During early early boot patch_instruction is called
-	 * when text_poke_area is not ready, but we still need
-	 * to allow patching. We just do the plain old patching
+	 * During early boot patch_instruction is called when the
+	 * patching_mm/text_poke_area is not ready, but we still need to allow
+	 * patching. We just do the plain old patching.
 	 */
-	if (!this_cpu_read(text_poke_area))
+	text_poke_addr = __this_cpu_read(cpu_patching_addr);
+	if (!text_poke_addr)
 		return raw_patch_instruction(addr, instr);
 
+	if (radix_enabled())
+		return patch_instruction_mm(addr, instr);
+
 	local_irq_save(flags);
 
-	text_poke_addr = __this_cpu_read(cpu_patching_addr);
 	err = map_patch_area(addr, text_poke_addr);
 	if (err)
 		goto out;
-- 
2.25.1

