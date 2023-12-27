Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA7B81EB93
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Dec 2023 03:42:21 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Jxll0fre;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T0GBg0THgz3cW3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Dec 2023 13:42:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Jxll0fre;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com; envelope-from=kernelfans@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T0G9t48Fgz30gs
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Dec 2023 13:41:38 +1100 (AEDT)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-6d99980b2e0so2633649b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Dec 2023 18:41:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703644896; x=1704249696; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DRAGnS9n7iZLPN3fzUPBIgeCsqk3wHeryWyE4pqZfzg=;
        b=Jxll0freK6OhSPUPku9CLV80/yhnzyX53O69aCEjsXerRbotnfIY5qdMrFPi2LzYDi
         /6CtqWqRUqExGhzrHtnAVON0FKedFZJ8llYsmBwIhhJauv+4DduQID7kzc0hXes6lztm
         5m1L/7vlCEiEirIWgNSh9KY+f61E/vOgxfcNJAQ3dJtSfz4dAd6IzvPhyH5dOK891OWj
         BzakGeHOoa7gSx2cuYbo1ozBT6te5uBDM0sPpOgIvtAURfz928CliVnjMahvJ81QD01b
         KXf/tJQpG2Q+YKfgF3pgq1QCf1H0bymZ0GciWLjVtGmlsnRhSo6hiiA4JZOKId8DHGyd
         F1+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703644896; x=1704249696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DRAGnS9n7iZLPN3fzUPBIgeCsqk3wHeryWyE4pqZfzg=;
        b=mrX0C4WsJ+hTR8eA5fInE0sCMn+yCLPuPfbjRJ949q6OhR6TQ741LOdXanH69Xa46T
         2gcQ3vwy3S/HLKFukqGlZCuFI4q9ueQm6Dex44BoxrWwdnCNLBvwIEyvxEEgXfiYPEn/
         V8k4Rg58ACr71XHa9/EwSaKqwnn98WvbRjq0PhfhqFVP7HpqRt2RgcOva/3AZetBP7d2
         CAD57e8zIb8xbyJjpBaH08VyI57bdwWo9/byUrTcjV7h+XP8UXMO4/0NsCMDx5ckIQmf
         wHjbcpqvlBgE+POFMmc3GwMxECNxTDbQNVBeFadEvZopKe3G6DiSLvPfnIwbq9WCJoAE
         jAGg==
X-Gm-Message-State: AOJu0YwFs+e622t5zoCBp5uam2CFIkvhQcA7WXwWWL0kBqOzG917fDUx
	S3P5w9wUPtQx3Ow5vKM5gJgNDo2I8Ou5
X-Google-Smtp-Source: AGHT+IHjk3AA3JcUV9M8k0oIpnUVqTmwmZDYX45WozIhC7j5KkqBhbvaKT0XP5lHWjRaKq44NwhggA==
X-Received: by 2002:a05:6a00:b20:b0:6d9:b5ce:f17e with SMTP id f32-20020a056a000b2000b006d9b5cef17emr4195836pfu.5.1703644895865;
        Tue, 26 Dec 2023 18:41:35 -0800 (PST)
Received: from piliu.users.ipa.redhat.com ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id g5-20020aa78745000000b006d9af8c25easm5449200pfo.84.2023.12.26.18.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Dec 2023 18:41:35 -0800 (PST)
From: Pingfan Liu <kernelfans@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCHv10 2/3] powerpc/kernel: Extend arrays' size to make room for a hole in cpu_possible_mask
Date: Wed, 27 Dec 2023 10:41:26 +0800
Message-Id: <20231227024126.12424-1-kernelfans@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20231227023934.12299-1-kernelfans@gmail.com>
References: <20231227023934.12299-1-kernelfans@gmail.com>
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
Cc: Baoquan He <bhe@redhat.com>, Pingfan Liu <piliu@redhat.com>, kexec@lists.infradead.org, Mahesh Salgaonkar <mahesh@linux.ibm.com>, Ming Lei <ming.lei@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, Sourabh Jain <sourabhjain@linux.ibm.com>, Hari Bathini <hbathini@linux.ibm.com>, Wen Xiong <wenxiong@us.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Pingfan Liu <piliu@redhat.com>

This patch aims to mark all the arrays which size is decided by
nr_cpu_ids or num_possible_cpus().  Later if a hole is allowed in
cpu_possible_mask, the corresponding array should extend to hold the
last bit number in cpu_possible_mask.

Signed-off-by: Pingfan Liu <piliu@redhat.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Cc: Wen Xiong <wenxiong@us.ibm.com>
Cc: Baoquan He <bhe@redhat.com>
Cc: Ming Lei <ming.lei@redhat.com>
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>
Cc: Hari Bathini <hbathini@linux.ibm.com>
Cc: kexec@lists.infradead.org
To: linuxppc-dev@lists.ozlabs.org
---
 arch/powerpc/include/asm/paca.h    | 2 ++
 arch/powerpc/kernel/paca.c         | 8 ++++----
 arch/powerpc/kernel/setup-common.c | 2 +-
 arch/powerpc/kernel/smp.c          | 3 ++-
 4 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/include/asm/paca.h b/arch/powerpc/include/asm/paca.h
index e667d455ecb4..a577d98dd0d8 100644
--- a/arch/powerpc/include/asm/paca.h
+++ b/arch/powerpc/include/asm/paca.h
@@ -299,5 +299,7 @@ static inline void free_unused_pacas(void) { }
 
 #endif /* CONFIG_PPC64 */
 
+extern int paca_last_cpu_num;
+
 #endif /* __KERNEL__ */
 #endif /* _ASM_POWERPC_PACA_H */
diff --git a/arch/powerpc/kernel/paca.c b/arch/powerpc/kernel/paca.c
index 760f371cf096..840c74dd17d6 100644
--- a/arch/powerpc/kernel/paca.c
+++ b/arch/powerpc/kernel/paca.c
@@ -236,15 +236,15 @@ void setup_paca(struct paca_struct *new_paca)
 
 }
 
-static int __initdata paca_nr_cpu_ids;
+int __initdata paca_last_cpu_num;
 static int __initdata paca_ptrs_size;
 static int __initdata paca_struct_size;
 
 void __init allocate_paca_ptrs(void)
 {
-	paca_nr_cpu_ids = nr_cpu_ids;
+	paca_last_cpu_num = nr_cpu_ids;
 
-	paca_ptrs_size = sizeof(struct paca_struct *) * nr_cpu_ids;
+	paca_ptrs_size = sizeof(struct paca_struct *) * paca_last_cpu_num;
 	paca_ptrs = memblock_alloc_raw(paca_ptrs_size, SMP_CACHE_BYTES);
 	if (!paca_ptrs)
 		panic("Failed to allocate %d bytes for paca pointers\n",
@@ -258,7 +258,7 @@ void __init allocate_paca(int cpu)
 	u64 limit;
 	struct paca_struct *paca;
 
-	BUG_ON(cpu >= paca_nr_cpu_ids);
+	BUG_ON(cpu >= paca_last_cpu_num);
 
 #ifdef CONFIG_PPC_BOOK3S_64
 	/*
diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
index 2f1026fba00d..f9f5f313abf0 100644
--- a/arch/powerpc/kernel/setup-common.c
+++ b/arch/powerpc/kernel/setup-common.c
@@ -453,7 +453,7 @@ void __init smp_setup_cpu_maps(void)
 
 	DBG("smp_setup_cpu_maps()\n");
 
-	cpu_to_phys_id = memblock_alloc(nr_cpu_ids * sizeof(u32),
+	cpu_to_phys_id = memblock_alloc(paca_last_cpu_num * sizeof(u32),
 					__alignof__(u32));
 	if (!cpu_to_phys_id)
 		panic("%s: Failed to allocate %zu bytes align=0x%zx\n",
diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index 5826f5108a12..6fefe22fd118 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -1140,7 +1140,8 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
 	}
 
 	if (cpu_to_chip_id(boot_cpuid) != -1) {
-		int idx = DIV_ROUND_UP(num_possible_cpus(), threads_per_core);
+		int idx = DIV_ROUND_UP(cpumask_last(cpu_possible_mask),
+				threads_per_core);
 
 		/*
 		 * All threads of a core will all belong to the same core,
-- 
2.31.1

