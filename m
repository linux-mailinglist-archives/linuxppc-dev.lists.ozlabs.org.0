Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A44820F3E0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jun 2020 13:54:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49x2nt413dzDqkZ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jun 2020 21:54:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::344;
 helo=mail-wm1-x344.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=H2Sz3Clp; dkim-atps=neutral
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49x2k84vTzzDqTm
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jun 2020 21:50:56 +1000 (AEST)
Received: by mail-wm1-x344.google.com with SMTP id l17so18536724wmj.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jun 2020 04:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=V4SU3OF/zJe1fJ6egxvJOApF/dMKKTgsz1S+z/74N+c=;
 b=H2Sz3ClpDISYRlki9h23iR9TnzE7RgM52S3Q1vNAaD5IWvwRci2G48OsUcMRrEUqee
 suhkYHoPCWHRUAsyppDFRV06QgPphnStvEgubMdnKrVgvvPYbnmo0UNx2jU494FZskpf
 xIWI0Uq9U85cf1khmo7HSTgUKPzaG8uYRT0gWdN93UtqAuwkPhwCggxUE1i+x5IRe5Ut
 tXpvc24Nib+WcH6YtoAnNFN2AZcv4jvv90pv/bqy4u7T8uxR7ZK2j2lHl0XzPeiFnTE6
 6OSTPAj9h+1hIC51RvB5AFaTeDZhhAODcXOgvfOuLvrut+Z4xWwGmjP2tSFlpn0I+kJt
 yzYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=V4SU3OF/zJe1fJ6egxvJOApF/dMKKTgsz1S+z/74N+c=;
 b=MFMrfhcOtx414EBdlM34J7nJAMcIoFU31K3GBKFK/TKcLAu8/+bRJgcp4S46XyJtT2
 CnjY/qJgirfAlATHkFQIsbprH+Ew9VCU+o48d4L8rgFIIDKsked+4Q/kybqKvEyobdby
 c8D2Qe5ptR8jczz5cyJ/svz76MLHA1ubOYA8RWs/NYvkiyap7ET27ppGI8rJQ9SJeDDZ
 ygEpOtcVKgB5Ax/muU0zd3+lPxYf1TR2kyMXg9WT12pHtmwwkw54VmgnHERijYF/YeD/
 pAxrXeHSqpzcjtJmGjZBl2BF8680NfPLkTsrNncR82DM8cEsSCUyvF4ERV/omEFe72Wb
 8FDA==
X-Gm-Message-State: AOAM531LSawwBN9Cj8P43MJNd5hV9+rPkEwMgIvMnKP2w5NWg1pFccfl
 UoO8bhCjIPdYTnqz8BsHH1C/1Fal
X-Google-Smtp-Source: ABdhPJyMoS0lRy5/48s00HBSycE/0Z4AK9VHlJ2fU7LI/SS3pY39ovn7E7KelfFiKMET0/Qzqw4FFA==
X-Received: by 2002:a7b:c8c2:: with SMTP id f2mr20203918wml.57.1593517853476; 
 Tue, 30 Jun 2020 04:50:53 -0700 (PDT)
Received: from bobo.ibm.com (61-68-186-125.tpgi.com.au. [61.68.186.125])
 by smtp.gmail.com with ESMTPSA id c25sm3133673wml.46.2020.06.30.04.50.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2020 04:50:52 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 1/3] powerpc: inline doorbell sending functions
Date: Tue, 30 Jun 2020 21:50:31 +1000
Message-Id: <20200630115034.137050-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200630115034.137050-1-npiggin@gmail.com>
References: <20200630115034.137050-1-npiggin@gmail.com>
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
Cc: kvm-ppc@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 Paul Mackerras <paulus@samba.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Anton Blanchard <anton@linux.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

These are only called in one place for a given platform, so inline them
for performance.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/dbell.h | 63 ++++++++++++++++++++++++++++++--
 arch/powerpc/kernel/dbell.c      | 55 ----------------------------
 2 files changed, 60 insertions(+), 58 deletions(-)

diff --git a/arch/powerpc/include/asm/dbell.h b/arch/powerpc/include/asm/dbell.h
index 4ce6808deed3..f19d2282e3f8 100644
--- a/arch/powerpc/include/asm/dbell.h
+++ b/arch/powerpc/include/asm/dbell.h
@@ -13,6 +13,7 @@
 
 #include <asm/ppc-opcode.h>
 #include <asm/feature-fixups.h>
+#include <asm/kvm_ppc.h>
 
 #define PPC_DBELL_MSG_BRDCAST	(0x04000000)
 #define PPC_DBELL_TYPE(x)	(((x) & 0xf) << (63-36))
@@ -87,9 +88,6 @@ static inline void ppc_msgsync(void)
 
 #endif /* CONFIG_PPC_BOOK3S */
 
-extern void doorbell_global_ipi(int cpu);
-extern void doorbell_core_ipi(int cpu);
-extern int doorbell_try_core_ipi(int cpu);
 extern void doorbell_exception(struct pt_regs *regs);
 
 static inline void ppc_msgsnd(enum ppc_dbell type, u32 flags, u32 tag)
@@ -100,4 +98,63 @@ static inline void ppc_msgsnd(enum ppc_dbell type, u32 flags, u32 tag)
 	_ppc_msgsnd(msg);
 }
 
+#ifdef CONFIG_SMP
+
+/*
+ * Doorbells must only be used if CPU_FTR_DBELL is available.
+ * msgsnd is used in HV, and msgsndp is used in !HV.
+ *
+ * These should be used by platform code that is aware of restrictions.
+ * Other arch code should use ->cause_ipi.
+ *
+ * doorbell_global_ipi() sends a dbell to any target CPU.
+ * Must be used only by architectures that address msgsnd target
+ * by PIR/get_hard_smp_processor_id.
+ */
+static inline void doorbell_global_ipi(int cpu)
+{
+	u32 tag = get_hard_smp_processor_id(cpu);
+
+	kvmppc_set_host_ipi(cpu);
+	/* Order previous accesses vs. msgsnd, which is treated as a store */
+	ppc_msgsnd_sync();
+	ppc_msgsnd(PPC_DBELL_MSGTYPE, 0, tag);
+}
+
+/*
+ * doorbell_core_ipi() sends a dbell to a target CPU in the same core.
+ * Must be used only by architectures that address msgsnd target
+ * by TIR/cpu_thread_in_core.
+ */
+static inline void doorbell_core_ipi(int cpu)
+{
+	u32 tag = cpu_thread_in_core(cpu);
+
+	kvmppc_set_host_ipi(cpu);
+	/* Order previous accesses vs. msgsnd, which is treated as a store */
+	ppc_msgsnd_sync();
+	ppc_msgsnd(PPC_DBELL_MSGTYPE, 0, tag);
+}
+
+/*
+ * Attempt to cause a core doorbell if destination is on the same core.
+ * Returns 1 on success, 0 on failure.
+ */
+static inline int doorbell_try_core_ipi(int cpu)
+{
+	int this_cpu = get_cpu();
+	int ret = 0;
+
+	if (cpumask_test_cpu(cpu, cpu_sibling_mask(this_cpu))) {
+		doorbell_core_ipi(cpu);
+		ret = 1;
+	}
+
+	put_cpu();
+
+	return ret;
+}
+
+#endif /* CONFIG_SMP */
+
 #endif /* _ASM_POWERPC_DBELL_H */
diff --git a/arch/powerpc/kernel/dbell.c b/arch/powerpc/kernel/dbell.c
index f17ff1200eaa..52680cf07c9d 100644
--- a/arch/powerpc/kernel/dbell.c
+++ b/arch/powerpc/kernel/dbell.c
@@ -18,61 +18,6 @@
 
 #ifdef CONFIG_SMP
 
-/*
- * Doorbells must only be used if CPU_FTR_DBELL is available.
- * msgsnd is used in HV, and msgsndp is used in !HV.
- *
- * These should be used by platform code that is aware of restrictions.
- * Other arch code should use ->cause_ipi.
- *
- * doorbell_global_ipi() sends a dbell to any target CPU.
- * Must be used only by architectures that address msgsnd target
- * by PIR/get_hard_smp_processor_id.
- */
-void doorbell_global_ipi(int cpu)
-{
-	u32 tag = get_hard_smp_processor_id(cpu);
-
-	kvmppc_set_host_ipi(cpu);
-	/* Order previous accesses vs. msgsnd, which is treated as a store */
-	ppc_msgsnd_sync();
-	ppc_msgsnd(PPC_DBELL_MSGTYPE, 0, tag);
-}
-
-/*
- * doorbell_core_ipi() sends a dbell to a target CPU in the same core.
- * Must be used only by architectures that address msgsnd target
- * by TIR/cpu_thread_in_core.
- */
-void doorbell_core_ipi(int cpu)
-{
-	u32 tag = cpu_thread_in_core(cpu);
-
-	kvmppc_set_host_ipi(cpu);
-	/* Order previous accesses vs. msgsnd, which is treated as a store */
-	ppc_msgsnd_sync();
-	ppc_msgsnd(PPC_DBELL_MSGTYPE, 0, tag);
-}
-
-/*
- * Attempt to cause a core doorbell if destination is on the same core.
- * Returns 1 on success, 0 on failure.
- */
-int doorbell_try_core_ipi(int cpu)
-{
-	int this_cpu = get_cpu();
-	int ret = 0;
-
-	if (cpumask_test_cpu(cpu, cpu_sibling_mask(this_cpu))) {
-		doorbell_core_ipi(cpu);
-		ret = 1;
-	}
-
-	put_cpu();
-
-	return ret;
-}
-
 void doorbell_exception(struct pt_regs *regs)
 {
 	struct pt_regs *old_regs = set_irq_regs(regs);
-- 
2.23.0

