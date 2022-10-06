Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EE18F5F6A07
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Oct 2022 16:49:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MjvTn6SDdz3cfv
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Oct 2022 01:49:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=P+Aq2TDw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034; helo=mail-pj1-x1034.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=P+Aq2TDw;
	dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MjvSq0wmsz30Ky
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Oct 2022 01:48:26 +1100 (AEDT)
Received: by mail-pj1-x1034.google.com with SMTP id p3-20020a17090a284300b0020a85fa3ffcso4551755pjf.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Oct 2022 07:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=H7g93P51gLFReUDLvvKDV+cpVqsbfdxPQvK7SAtbME8=;
        b=P+Aq2TDwrLMQzy1TdWCcEItEJcb2E7wpqQDXVOO5bR8OFg5Wluisl8Beey3QBCP7VP
         LxtItL6SbGSaX/LMHXuGgcy1D01Aw++35PjBmnF2/XP3lkAxeSY4AmijeTvRGpTD5VXl
         l1Ws+O1jeJxn7P34rpaNTxJdwNZr3kIa9LplIhPQjwTQeQZ2qRyseL1qy7kARsJPUkqY
         GFBZxcVyNSFIdVxjaUBK7uvWu7Z0YHdsYnokNsnmnqNvW5vIfK2PJnwRw0LyQt1+QOBz
         a/62YLd2B6LP1Zx1WlVpAyCh+hGITh998KT2fR2N9/V6BFC731oJ024+RcrYoUxPSnzb
         POZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=H7g93P51gLFReUDLvvKDV+cpVqsbfdxPQvK7SAtbME8=;
        b=hGY3dghcNs0eCZcQr0h8ae6xBHyewU8do6nsB+8VVX6FT5GvoPZdrVWR1dx+7C+iwb
         tqVMOaq1xOjt1exUwtNnciFJNHkjG5xYW7HCatKzxJAloLDEdeAfdJzIvJNu+U5h0rxQ
         UXxrsZqGhfsTZ3UlBs7L0GGUtuuW+ELvgnrcebdvOIT7H4Fq+DG5BWOLx2u4yjpuBBGt
         3p2lp7QJUTYrtzFFQO94YOaIwrJz7KNx+1H+Z9RjXZT5zzvR8G/ZT3uPdibuApfOiavU
         Q76KUiILnSc7VIzh/z7p8v8gTRLOlzJt8D9Wf7Sl6lR+zB7TvHnkZgndYZYvhoRUtjk/
         GHVQ==
X-Gm-Message-State: ACrzQf1b8wmLN/ooFwoAEeaJAT+nb34ULnHnUGdId4IBQvnrkvvQC0Cc
	ahEMnBAZQfDN7mpaaJt8djaJrtb16sQ=
X-Google-Smtp-Source: AMsMyM6jMlfVSkJielYIg5a5nArVESoevCqGgLlY1fHygLlXHGniWM+DVSAO7wO6RnaARuB1roRbWQ==
X-Received: by 2002:a17:902:ce86:b0:17d:c466:3e4f with SMTP id f6-20020a170902ce8600b0017dc4663e4fmr280592plg.146.1665067703771;
        Thu, 06 Oct 2022 07:48:23 -0700 (PDT)
Received: from bobo.ibm.com ([118.208.156.99])
        by smtp.gmail.com with ESMTPSA id z63-20020a626542000000b0056126b79072sm8756001pfb.21.2022.10.06.07.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 07:48:22 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/64: poison __per_cpu_offset to catch use-before-init
Date: Fri,  7 Oct 2022 00:48:16 +1000
Message-Id: <20221006144816.162702-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

If the boot CPU tries to access per-cpu data of other CPUs before
per cpu areas are set up, it will unexpectedly use offset 0.

Try to catch such accesses by poisoning the __per_cpu_offset array.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
With the early boot machine check handler added to 64s, this might be
worth another try. We did have a bug in mce_init() that was using
cpu_to_node() too early that would be caught by this.

Thanks,
Nick

 arch/powerpc/include/asm/percpu.h | 1 +
 arch/powerpc/kernel/paca.c        | 2 +-
 arch/powerpc/kernel/setup_64.c    | 3 ++-
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/percpu.h b/arch/powerpc/include/asm/percpu.h
index 8e5b7d0b851c..6ca1a9fc5725 100644
--- a/arch/powerpc/include/asm/percpu.h
+++ b/arch/powerpc/include/asm/percpu.h
@@ -7,6 +7,7 @@
  * Same as asm-generic/percpu.h, except that we store the per cpu offset
  * in the paca. Based on the x86-64 implementation.
  */
+#define PER_CPU_OFFSET_POISON 0xfeeeeeeeeeeeeeeeULL
 
 #ifdef CONFIG_SMP
 
diff --git a/arch/powerpc/kernel/paca.c b/arch/powerpc/kernel/paca.c
index be8db402e963..c33de70596e7 100644
--- a/arch/powerpc/kernel/paca.c
+++ b/arch/powerpc/kernel/paca.c
@@ -198,7 +198,7 @@ void __init initialise_paca(struct paca_struct *new_paca, int cpu)
 	new_paca->hw_cpu_id = 0xffff;
 	new_paca->kexec_state = KEXEC_STATE_NONE;
 	new_paca->__current = &init_task;
-	new_paca->data_offset = 0xfeeeeeeeeeeeeeeeULL;
+	new_paca->data_offset = PER_CPU_OFFSET_POISON;
 #ifdef CONFIG_PPC_64S_HASH_MMU
 	new_paca->slb_shadow_ptr = NULL;
 #endif
diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
index a0dee7354fe6..039a4eac03c3 100644
--- a/arch/powerpc/kernel/setup_64.c
+++ b/arch/powerpc/kernel/setup_64.c
@@ -362,6 +362,7 @@ void __init early_setup(unsigned long dt_ptr)
 	 * So set up a temporary paca. It will be replaced below once we know
 	 * what CPU we are on.
 	 */
+	__per_cpu_offset[0] = 0;
 	initialise_paca(&boot_paca, 0);
 	fixup_boot_paca(&boot_paca);
 	WARN_ON(local_paca != 0);
@@ -828,7 +829,7 @@ static __init int pcpu_cpu_to_node(int cpu)
 	return early_cpu_to_node(cpu);
 }
 
-unsigned long __per_cpu_offset[NR_CPUS] __read_mostly;
+unsigned long __per_cpu_offset[NR_CPUS] __read_mostly = { [0 ... NR_CPUS-1 ] = PER_CPU_OFFSET_POISON };
 EXPORT_SYMBOL(__per_cpu_offset);
 
 void __init setup_per_cpu_areas(void)
-- 
2.37.2

