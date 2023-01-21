Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8B0676585
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Jan 2023 10:55:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NzWtq5g2Lz3fKq
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Jan 2023 20:54:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=SmlwSL33;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=SmlwSL33;
	dkim-atps=neutral
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NzWsr4NXgz3c9S
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Jan 2023 20:54:07 +1100 (AEDT)
Received: by mail-pf1-x42d.google.com with SMTP id 207so5662773pfv.5
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Jan 2023 01:54:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FF0xuZw9hYkiIaKsOLGlxDYKx39FM75OtS2f72NRsgI=;
        b=SmlwSL33zLTYRGUOdZdumnDlAKP26wpqyDhZ+oBndy+N7bpoSJ+u+hcBovmgIHKCa0
         HnlvkSW841KPrfhmw2HiXVgte8U/XCP6LLFuCDtapOYaXus60cys469gSxtoKLZtHteW
         xwfR5Nz4jyuGhzNIE8FstqbtF0Hc7cQq/ytlVw/fg+evmlhz4aGfGT9lYbfNN0mxabUy
         8juBc7dviZeJT7u6Ot4ds1Sp+j1SnDD+sAYWVfX9xbwM3vgqHX4qKtnsdA01RIOxQQIS
         Hsi0JOK2txWIslNyujoeRTjMjgKPlMB8sk38PFAzAg/K7yY8AbS1vPVAOnNY6YQ+4G2J
         otgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FF0xuZw9hYkiIaKsOLGlxDYKx39FM75OtS2f72NRsgI=;
        b=BtZOfoKIcnBMER0IpQwVpdXbnkSw6WH9xdeeuDeF34ooGo5zt10bh56xTxBEfik1q+
         8HZfKDR0a8AcFXpZdN9jtZn3Ji4GkSCkSpS8LgpFZteX2GL0mx7nvEZpNZvqVadOQQnu
         IJBczN+mptuQVx5k0IT87afV3InfikDwwCSafDgXTqwHUA4H0DmpGXJesFC8NyU11CVK
         yOyNXQSlSMnwtJlTxapa87fvQGIPDApEFLImwRj9Ctczklyb4w9jDpehT6uz7D/v6wGf
         g7yaVU4zgjMOM/5RzmGYLMaO5jffIFzo6FBIzDdhLLJk+74Mzaa41Lk7MpJhP4A0V7Iy
         Iztw==
X-Gm-Message-State: AFqh2kq2vwIr3pDXbgssjQelfzHrJwAFUmIi4JNWKzdjdCpXu7sq0+H5
	nFaHfshhjzOv8qikSQW9Xle99avUrL0=
X-Google-Smtp-Source: AMrXdXurERoiB09VuRm9vuuebfyt7Vp7IUwZ/E59t42xb8+ac3Vxn5FSSmK4sbXNc0faUbyqjYsxDA==
X-Received: by 2002:aa7:8eda:0:b0:58b:7db6:da48 with SMTP id b26-20020aa78eda000000b0058b7db6da48mr39214167pfr.20.1674294842967;
        Sat, 21 Jan 2023 01:54:02 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (193-116-102-45.tpgi.com.au. [193.116.102.45])
        by smtp.gmail.com with ESMTPSA id d2-20020aa797a2000000b005895f9657ebsm22685303pfq.70.2023.01.21.01.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jan 2023 01:54:02 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/64s: Fix local irq disable when PMIs are disabled
Date: Sat, 21 Jan 2023 19:53:52 +1000
Message-Id: <20230121095352.2823517-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
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
Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When PMI interrupts are soft-masked, local_irq_save() will clear the PMI
mask bit, allowing PMIs in and causing a race condition. This causes a
deadlock in native_hpte_insert via hash_preload, which depends on PMIs
being disabled since commit 8b91cee5eadd ("powerpc/64s/hash: Make hash
faults work in NMI context"). native_hpte_insert calls local_irq_save().
It's possible the lpar hash code is also affected when tracing is
enabled because __trace_hcall_entry() calls local_irq_save().

Fix this by making arch_local_irq_save() _or_ the IRQS_DISABLED bit
into the mask. Add a warning in arch_local_irq_disable() to make sure
it isn't called with PMIs disabled.

This was found with the stress_hpt option with a kbuild workload
running together with `perf record -g`.

Fixes: f442d004806e ("powerpc/64s: Add support to mask perf interrupts and replay them")
Fixes: 8b91cee5eadd ("powerpc/64s/hash: Make hash faults work in NMI context")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
Lockup looks like this, note IRQMASK=1 in native_hpte_insert when we
expect it should be 3.

 watchdog: CPU 16 Hard LOCKUP
 watchdog: CPU 16 TB:6084087529753, last heartbeat TB:6075895318740 (16000ms ago)
 CPU: 16 PID: 9319 Comm: check-local-exp
 NIP:  c00000000008b040 LR: c00000000037cd64 CTR: c000000000342160
 REGS: c000003fffa3fd60 TRAP: 0100   Not tainted
 MSR:  9000000000081033 <SF,HV,ME,IR,DR,RI,LE>  CR: 88484808  XER: 20040078
 CFAR: c00000000000dc3c IRQMASK: 3
 GPR00: c0000000000e5b10 c000000088e17090 c0000000010c0100 c000000088e170f0
 GPR04: 00007fffffffc690 0000000000000008 c0000000024f0100 fffffffffffffe00
 GPR08: c000000012ac4cc0 bcffffffffffffff a8aaaaaaaaaaaaaa 0000000000004000
 GPR12: c000000000342160 c000003fffff2880 0000000000000000 0000000000000000
 GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
 GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
 GPR24: 0000000000000001 fffffffffffffe00 c00000002c16d000 000ffffffffffff8
 GPR28: 00007fffffffffdf 0000000000000000 00007fffffffc690 c000000088e171b0
 NIP [c00000000008b040] __copy_tofrom_user_power7+0x20c/0x7ac
 LR [c00000000037cd64] copy_from_user_nofault+0xa4/0x190
 Call Trace:
 [c000000088e17090] [c000003feb802030] 0xc000003feb802030 (unreliable)
 [c000000088e170c0] [c0000000000e5b10] perf_callchain_user_64+0x170/0x4f0
 [c000000088e17160] [c0000000000e5980] perf_callchain_user+0x20/0x40
 [c000000088e17180] [c00000000035f054] get_perf_callchain+0x184/0x250
 [c000000088e17210] [c000000000357874] perf_callchain+0x94/0xd0
 [c000000088e17230] [c00000000035819c] perf_prepare_sample+0x6ac/0x8f0
 [c000000088e17290] [c000000000358428] perf_event_output_forward+0x48/0xc0
 [c000000088e17310] [c00000000034d6cc] __perf_event_overflow+0x12c/0x270
 [c000000088e17360] [c0000000000e8b80] record_and_restart+0x340/0x830
 [c000000088e17580] [c0000000000e9318] perf_event_interrupt+0x2a8/0x4a0
 [c000000088e17620] [c000000000028b64] performance_monitor_exception_nmi+0x64/0xb0
 [c000000088e17670] [c00000000000baac] performance_monitor_common_virt+0x2ac/0x390
 --- interrupt: f00 at native_hpte_insert+0x174/0x210
 NIP:  c00000000007be84 LR: c00000000007bdd4 CTR: c00000000007bd10
 REGS: c000000088e176a0 TRAP: 0f00   Not tainted  (6.2.0-rc4-00077-gd368967cb103-dirty)
 MSR:  9000000000009033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 44484802  XER: 00000078
 CFAR: 0000000000000000 IRQMASK: 1
 GPR00: c00000000007d2b8 c000000088e17940 c0000000010c0100 c000203fc2347b80
 GPR04: 00b3b9708ffffff0 0000000000000010 04000000d5791196 0000000000001000
 GPR08: 000b3b9708ffff85 c000203fc2347b88 000b3b9708ffff84 c000000002457fd0
 GPR12: c00000000007bd10 c000003fffff2880 c000000002457e70 ffffffd1e43b9708
 GPR16: 00b3b9708ffffff0 c000000002457e18 0000000000000001 0000000000000196
 GPR20: c0000000024576b8 0800000000000000 0000000000000002 0000000000000002
 GPR24: 00000000d5790000 0000000000000196 0000000000000003 000b3b9708ffff80
 GPR28: 0000000000000000 0000000000000001 0000000000000000 c000203fc2347b80
 NIP [c00000000007be84] native_hpte_insert+0x174/0x210
 LR [c00000000007bdd4] native_hpte_insert+0xc4/0x210
 --- interrupt: f00
 [c000000088e17940] [c000000088e179c0] 0xc000000088e179c0 (unreliable)
 [c000000088e179c0] [c00000000007d2b8] __hash_page_64K+0x218/0x4f0
 [c000000088e17a70] [c0000000000761fc] __update_mmu_cache+0x30c/0x3b0
 [c000000088e17b10] [c0000000003d00a0] do_wp_page+0xa50/0x1640
 [c000000088e17bf0] [c0000000003d3ca4] __handle_mm_fault+0xb94/0x1b90
 [c000000088e17d00] [c0000000003d4dc0] handle_mm_fault+0x120/0x300
 [c000000088e17d50] [c00000000006cbc4] ___do_page_fault+0x2d4/0xac0
 [c000000088e17df0] [c00000000006d460] hash__do_page_fault+0x30/0xc0
 [c000000088e17e20] [c000000000075d88] do_hash_fault+0x258/0x340

Thanks,
Nick
---
 arch/powerpc/include/asm/hw_irq.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/hw_irq.h b/arch/powerpc/include/asm/hw_irq.h
index 77fa88c2aed0..5156fe21284c 100644
--- a/arch/powerpc/include/asm/hw_irq.h
+++ b/arch/powerpc/include/asm/hw_irq.h
@@ -180,6 +180,9 @@ static inline unsigned long arch_local_save_flags(void)
 
 static inline void arch_local_irq_disable(void)
 {
+	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
+		WARN_ON_ONCE((irq_soft_mask_return() != IRQS_ENABLED) &&
+			     (irq_soft_mask_return() != IRQS_DISABLED));
 	irq_soft_mask_set(IRQS_DISABLED);
 }
 
@@ -192,7 +195,7 @@ static inline void arch_local_irq_enable(void)
 
 static inline unsigned long arch_local_irq_save(void)
 {
-	return irq_soft_mask_set_return(IRQS_DISABLED);
+	return irq_soft_mask_or_return(IRQS_DISABLED);
 }
 
 static inline bool arch_irqs_disabled_flags(unsigned long flags)
-- 
2.37.2

