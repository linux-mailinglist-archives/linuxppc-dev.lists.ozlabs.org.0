Return-Path: <linuxppc-dev+bounces-1520-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 276C297E19D
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Sep 2024 14:46:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XBQqV5zN2z2yPj;
	Sun, 22 Sep 2024 22:46:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727009206;
	cv=none; b=Veo+GZgTKskQn5QMSAzqteHJnkHRgCbHnM1N4RG/ilTG+o1z6CVoCpSs2l4INNinklZA5hYDJ7ofQrewWNL/Oaze8wwe/zgH2BnVMnlSDHTycF6hvvnryE49nqCyvrfbHWstkjnlEHS5MJyAnzDKMTwgNWhYkGZqJ97KhA/6sEeXh/qZBtMtdhkVpULerRXjISPUTuOrENx4kLDOLqCwCsDa1ljZr2fKgV3dnEAO5EMqLslvWEbcXBVkdSgroyqK142duV5KdVzGt5eY/C3ut1RFlyQ8yKdZF0pPHE4j8wSgCHCBngOi3RULE4pFdMJc87y1A9QsVpH3TU5/Dnkzpg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727009206; c=relaxed/relaxed;
	bh=9FTwL6+9o13ypVh56/VhhZXYdy2Ls+PjrT2/i5xc+EE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gPU9o6wpyFdczMedHxdDHCSp9/YTR3j7vlWfHjTUkUfvvdI19MyJV+CIIsnRT/79fqQEij9rTX6fxxO4hMSXaxDWYdMndgcj10jwhdK8hw1rQtnGO9oSR4L/uIsb7jLO2KJoRQOLWxBCJRKQC/9nlFt5VogFhkDL2JSqZOOwAvCBfURMNYwUPLvzIMpr8v8ymcn/ImaMzPI/IwSmfXYiZsp5Vcbxi+OlOCYHC53BIk0wa0rQqrWAHXAqPPSUiH0hNcmIH5IHko5Ng08ozyM7hN1GTK5nheGcQ02p/PBnI+feVFtVAGphCSdVDl/HzJCjkYTrrvG+CGpADeTATFH2gw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=i3iqE3zy; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=i3iqE3zy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XBQqV3k1Yz2xfT
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Sep 2024 22:46:46 +1000 (AEST)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-208e0a021cfso11981375ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Sep 2024 05:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727009203; x=1727614003; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9FTwL6+9o13ypVh56/VhhZXYdy2Ls+PjrT2/i5xc+EE=;
        b=i3iqE3zyFdZE4REUQcoc26566ZMySwkNtId9reEpo53uDGW4s3rm8iZCyWPpStBtLI
         Y/sqlJHlAEm1AwsbT/Jk/R/yooLKGafbHovJE9HPXO/jPSfCMG3JmQDwBzTDSfZruHqN
         hArWQ9q8deK6Zm4aJjhgJwHRq9q0KFSTFBEcdzTvLsmHget7qADys/u9SNMFia84Z0Y7
         O0ztK/JVEm6OiVNH8TSVW56S7fduc4Xd2YXxGJ8P/+f/RmdgdX3oTHf27NSnLUR89Vzj
         4wWWOXRQxTKsljiYe/JfbSvLS/vIeTWljAGDMihz9lFfRdh9WT8XnOzsPkjqAsAeYlHD
         Yr5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727009203; x=1727614003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9FTwL6+9o13ypVh56/VhhZXYdy2Ls+PjrT2/i5xc+EE=;
        b=u9C0Hpjd6TKc4ojjtI8V8tbsDncsCE7wyUvpWNIWQH8wPgEU6EBP87aCctH1zYkSH+
         aGS0BxjH+Yb4hl2QjVTbeWJq8EclL2Gr4XGvHj5T2McOzydn5yuUMYApS2M3kRXfElGU
         9MID4UQnCrFApC2nU3Z1b+N0v/oaITHme2TqnW7k93N+ZV2pFh2N/gqQTpXS46b8LQAf
         C4fPzJqiMxXkO+DrcdOv9RBkYwIUc2OAG14IziIgkXUqrDf4wBfO5UaXjsr1mO+xlbnj
         1UJ8kjDuW+T/kwzyO2fFQme8H9BX0iMBDJ9MlAWdvefAS/WsEYqDEB72uFwoqfiU556w
         49vA==
X-Gm-Message-State: AOJu0YyJ1SXJ8QgKlPRd/ZrRgZp/aPhlLjTchFBr00M9Od7XCBykhaOW
	LFQ+5hwEr/+AughARVwwtY3k/FiweFGEiCv4hX6fnY3pTwomucTcHSRSCw==
X-Google-Smtp-Source: AGHT+IEk1HF1yfwHvH3U4VgVuiMqv2Jw5XGtTnEzdU9HnMvAVoMYKCqf2ajoA2E7c7OpBZqgCqBz2w==
X-Received: by 2002:a17:902:c941:b0:206:93e7:5837 with SMTP id d9443c01a7336-208d83f0519mr130599345ad.39.1727009202707;
        Sun, 22 Sep 2024 05:46:42 -0700 (PDT)
Received: from dw-tp.. ([171.76.87.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-207946d19aasm119420975ad.127.2024.09.22.05.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Sep 2024 05:46:42 -0700 (PDT)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Michael Ellerman <mpe@ellerman.id.au>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [RFC / PoC v1 1/1] powerpc: Add support for batched unmap TLB flush
Date: Sun, 22 Sep 2024 18:16:24 +0530
Message-ID: <589d5262da605ae6d84a02bac477009f4655b705.1727001426.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1727001426.git.ritesh.list@gmail.com>
References: <cover.1727001426.git.ritesh.list@gmail.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

=== NOT FOR MERGE YET ===

This adds the support for ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH.
More details are added to the cover letter.

---
 arch/powerpc/Kconfig                          |  1 +
 arch/powerpc/include/asm/book3s/64/tlbflush.h |  5 +++
 arch/powerpc/include/asm/tlbbatch.h           | 14 ++++++++
 arch/powerpc/mm/book3s64/radix_tlb.c          | 32 +++++++++++++++++++
 4 files changed, 52 insertions(+)
 create mode 100644 arch/powerpc/include/asm/tlbbatch.h

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 0b8b2e3a6381..c3a23c1894dd 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -171,6 +171,7 @@ config PPC
 	select ARCH_USE_CMPXCHG_LOCKREF		if PPC64
 	select ARCH_USE_MEMTEST
 	select ARCH_USE_QUEUED_RWLOCKS		if PPC_QUEUED_SPINLOCKS
+	select ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH if PPC64 && PPC_BOOK3S_64
 	select ARCH_WANT_DEFAULT_BPF_JIT
 	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT
 	select ARCH_WANT_IPC_PARSE_VERSION
diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush.h b/arch/powerpc/include/asm/book3s/64/tlbflush.h
index fd642b729775..f872537715e7 100644
--- a/arch/powerpc/include/asm/book3s/64/tlbflush.h
+++ b/arch/powerpc/include/asm/book3s/64/tlbflush.h
@@ -222,4 +222,9 @@ static inline bool cputlb_use_tlbie(void)
 	return tlbie_enabled;
 }

+bool arch_tlbbatch_should_defer(struct mm_struct *mm);
+void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *batch,
+			       struct mm_struct *mm, unsigned long uaddr);
+void arch_flush_tlb_batched_pending(struct mm_struct *mm);
+void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch);
 #endif /*  _ASM_POWERPC_BOOK3S_64_TLBFLUSH_H */
diff --git a/arch/powerpc/include/asm/tlbbatch.h b/arch/powerpc/include/asm/tlbbatch.h
new file mode 100644
index 000000000000..fa738462a242
--- /dev/null
+++ b/arch/powerpc/include/asm/tlbbatch.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2024 IBM Corporation.
+ */
+#ifndef _ASM_POWERPC_TLBBATCH_H
+#define _ASM_POWERPC_TLBBATCH_H
+
+#include <linux/cpumask.h>
+
+struct arch_tlbflush_unmap_batch {
+	struct cpumask cpumask;
+};
+
+#endif /* _ASM_POWERPC_TLBBATCH_H */
diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3s64/radix_tlb.c
index 9e1f6558d026..2b1b2f7429fc 100644
--- a/arch/powerpc/mm/book3s64/radix_tlb.c
+++ b/arch/powerpc/mm/book3s64/radix_tlb.c
@@ -11,6 +11,7 @@
 #include <linux/mmu_context.h>
 #include <linux/sched/mm.h>
 #include <linux/debugfs.h>
+#include <linux/smp.h>

 #include <asm/ppc-opcode.h>
 #include <asm/tlb.h>
@@ -1585,3 +1586,34 @@ static int __init create_tlb_single_page_flush_ceiling(void)
 }
 late_initcall(create_tlb_single_page_flush_ceiling);

+#ifdef CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH
+bool arch_tlbbatch_should_defer(struct mm_struct *mm)
+{
+	if (!radix_enabled())
+		return false;
+	return true;
+}
+
+void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *batch,
+			       struct mm_struct *mm,
+			       unsigned long uaddr)
+{
+	cpumask_or(&batch->cpumask, &batch->cpumask, mm_cpumask(mm));
+}
+
+void arch_flush_tlb_batched_pending(struct mm_struct *mm)
+{
+	flush_tlb_mm(mm);
+}
+
+static inline void tlbiel_flush_all_lpid(void *arg)
+{
+	tlbiel_all_lpid(true);
+}
+
+void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch)
+{
+	on_each_cpu_mask(&batch->cpumask, tlbiel_flush_all_lpid, NULL, 1);
+	cpumask_clear(&batch->cpumask);
+}
+#endif
--
2.46.0


