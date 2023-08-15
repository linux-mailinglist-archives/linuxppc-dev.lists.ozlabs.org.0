Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D4FAD77D0E5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Aug 2023 19:23:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RQJ5g61zwz3cY5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Aug 2023 03:23:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RQJ5C5fJXz3c4b
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Aug 2023 03:23:24 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4RQJ5541slz9sdD;
	Tue, 15 Aug 2023 19:23:21 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jG5OCgqrrUj6; Tue, 15 Aug 2023 19:23:21 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4RQJ553FQwz9sdC;
	Tue, 15 Aug 2023 19:23:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 6C35B8B76C;
	Tue, 15 Aug 2023 19:23:21 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id FHx2X9-N_VoV; Tue, 15 Aug 2023 19:23:21 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.233.223])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 346548B763;
	Tue, 15 Aug 2023 19:23:21 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 37FHNB08128544
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 15 Aug 2023 19:23:11 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 37FHNAct128540;
	Tue, 15 Aug 2023 19:23:10 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Erhard Furtner <erhard_f@mailbox.org>
Subject: [PATCH] Add pr_info() traces for investigation
Date: Tue, 15 Aug 2023 19:21:52 +0200
Message-ID: <a5b08a61ec518df8cbe629c38e435e1033f968d8.1692119967.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230814192748.56525c82@yea>
References: <20230814192748.56525c82@yea>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1692120111; l=4607; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=YHUX9bf5LWvXzivYbgWcOeBwH9KlkJXawKhfAYTG3kI=; b=Wy6oQu9MbgPhIGoazRxHaIdJGSiPVmf6RxCIT4QvxA0xGu+WuuMZJQ9ZKKq0UuT6Dfjh0ncCP weUU72gX2UtCoe3AMJxKMLcMoQ2m4tprKbYSNtFAaxlxthXwJZeQS90
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/btext.c     | 2 ++
 arch/powerpc/mm/book3s32/kuap.c | 5 +++++
 arch/powerpc/mm/book3s32/mmu.c  | 3 +++
 arch/powerpc/mm/kasan/init_32.c | 3 +++
 arch/powerpc/mm/pgtable_32.c    | 4 ++++
 5 files changed, 17 insertions(+)

diff --git a/arch/powerpc/kernel/btext.c b/arch/powerpc/kernel/btext.c
index 19e46fd623b0..ec989e1011f0 100644
--- a/arch/powerpc/kernel/btext.c
+++ b/arch/powerpc/kernel/btext.c
@@ -126,7 +126,9 @@ void __init btext_setup_display(int width, int height, int depth, int pitch,
 
 void __init btext_unmap(void)
 {
+	pr_info("%s:%d\n", __func__, __LINE__);
 	boot_text_mapped = 0;
+	pr_info("%s:%d\n", __func__, __LINE__);
 }
 
 /* Here's a small text engine to use during early boot
diff --git a/arch/powerpc/mm/book3s32/kuap.c b/arch/powerpc/mm/book3s32/kuap.c
index 28676cabb005..856d18c135bf 100644
--- a/arch/powerpc/mm/book3s32/kuap.c
+++ b/arch/powerpc/mm/book3s32/kuap.c
@@ -20,17 +20,22 @@ EXPORT_SYMBOL(kuap_unlock_all_ool);
 
 void setup_kuap(bool disabled)
 {
+	pr_info("%s:%d\n", __func__, __LINE__);
 	if (!disabled) {
+		pr_info("%s:%d\n", __func__, __LINE__);
 		kuap_lock_all_ool();
 		init_mm.context.sr0 |= SR_KS;
 		current->thread.sr0 |= SR_KS;
 	}
+	pr_info("%s:%d\n", __func__, __LINE__);
 
 	if (smp_processor_id() != boot_cpuid)
 		return;
 
+	pr_info("%s:%d\n", __func__, __LINE__);
 	if (disabled)
 		static_branch_enable(&disable_kuap_key);
 	else
 		pr_info("Activating Kernel Userspace Access Protection\n");
+	pr_info("%s:%d\n", __func__, __LINE__);
 }
diff --git a/arch/powerpc/mm/book3s32/mmu.c b/arch/powerpc/mm/book3s32/mmu.c
index 850783cfa9c7..ab0c19acd3f3 100644
--- a/arch/powerpc/mm/book3s32/mmu.c
+++ b/arch/powerpc/mm/book3s32/mmu.c
@@ -143,6 +143,7 @@ static unsigned long __init __mmu_mapin_ram(unsigned long base, unsigned long to
 {
 	int idx;
 
+	pr_info("%s:%d %lx %lx\n", __func__, __LINE__, base, top);
 	while ((idx = find_free_bat()) != -1 && base != top) {
 		unsigned int size = bat_block_size(base, top);
 
@@ -151,6 +152,7 @@ static unsigned long __init __mmu_mapin_ram(unsigned long base, unsigned long to
 		setbat(idx, PAGE_OFFSET + base, base, size, PAGE_KERNEL_X);
 		base += size;
 	}
+	pr_info("%s:%d %lx\n", __func__, __LINE__, base);
 
 	return base;
 }
@@ -164,6 +166,7 @@ unsigned long __init mmu_mapin_ram(unsigned long base, unsigned long top)
 	size = roundup_pow_of_two((unsigned long)_einittext - PAGE_OFFSET);
 	setibat(0, PAGE_OFFSET, 0, size, PAGE_KERNEL_X);
 
+	pr_info("%s:%d %lx %lx %lx %lx\n", __func__, __LINE__, base, top, border, size);
 	if (debug_pagealloc_enabled_or_kfence()) {
 		pr_debug_once("Read-Write memory mapped without BATs\n");
 		if (base >= border)
diff --git a/arch/powerpc/mm/kasan/init_32.c b/arch/powerpc/mm/kasan/init_32.c
index a70828a6d935..a0f82d9a1fa6 100644
--- a/arch/powerpc/mm/kasan/init_32.c
+++ b/arch/powerpc/mm/kasan/init_32.c
@@ -126,12 +126,15 @@ void __init kasan_mmu_init(void)
 {
 	int ret;
 
+	pr_info("%s:%d\n", __func__, __LINE__);
 	if (early_mmu_has_feature(MMU_FTR_HPTE_TABLE)) {
 		ret = kasan_init_shadow_page_tables(KASAN_SHADOW_START, KASAN_SHADOW_END);
+		pr_info("%s:%d %d\n", __func__, __LINE__, ret);
 
 		if (ret)
 			panic("kasan: kasan_init_shadow_page_tables() failed");
 	}
+	pr_info("%s:%d\n", __func__, __LINE__);
 }
 
 void __init kasan_init(void)
diff --git a/arch/powerpc/mm/pgtable_32.c b/arch/powerpc/mm/pgtable_32.c
index 5c02fd08d61e..d75084f67d9b 100644
--- a/arch/powerpc/mm/pgtable_32.c
+++ b/arch/powerpc/mm/pgtable_32.c
@@ -104,6 +104,7 @@ static void __init __mapin_ram_chunk(unsigned long offset, unsigned long top)
 	phys_addr_t p;
 	bool ktext;
 
+	pr_info("%s:%d %lx %lx\n", __func__, __LINE__, offset, top);
 	s = offset;
 	v = PAGE_OFFSET + s;
 	p = memstart_addr + s;
@@ -113,6 +114,7 @@ static void __init __mapin_ram_chunk(unsigned long offset, unsigned long top)
 		v += PAGE_SIZE;
 		p += PAGE_SIZE;
 	}
+	pr_info("%s:%d\n", __func__, __LINE__);
 }
 
 void __init mapin_ram(void)
@@ -120,6 +122,7 @@ void __init mapin_ram(void)
 	phys_addr_t base, end;
 	u64 i;
 
+	pr_info("%s:%d\n", __func__, __LINE__);
 	for_each_mem_range(i, &base, &end) {
 		phys_addr_t top = min(end, total_lowmem);
 
@@ -128,6 +131,7 @@ void __init mapin_ram(void)
 		base = mmu_mapin_ram(base, top);
 		__mapin_ram_chunk(base, top);
 	}
+	pr_info("%s:%d\n", __func__, __LINE__);
 }
 
 void mark_initmem_nx(void)
-- 
2.41.0

