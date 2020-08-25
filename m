Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D3E2513B5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Aug 2020 09:58:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BbLw05ScCzDqHG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Aug 2020 17:58:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=WzLcj8Uv; dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BbLrz3WcvzDqTY
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Aug 2020 17:55:47 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id m34so6246039pgl.11
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Aug 2020 00:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xWZCcKXp7dQkLY1ua1N7VSvKv+b8YJkHyth4+PNi84E=;
 b=WzLcj8UvBir/fg2DWzThgI9VWnwFAbE0SDTvc/ZiOVRoPJX+Q67bzfhP/0T7lC5gAm
 z/97UrVQ/iJ/1pTiPD72shcvMX4G2r867cPp5Ezib3VX074fiQxFPZShBQSO78gGk0oC
 uOHa0PdRQ/5m3aMxkZSsNHwSQHL1pwh0/x1QBAfvslMHkMfDKTXUhEHEyptmC6Q0gNWR
 mcVQiXl4lqaSVo/ltgbeGPrFVNUk2KFciSAozFNnAX0sczVHFWd2GJEcNYTB8mRIZqiq
 YPIuPqDIGR2lnF5TrtQ04qgpRrbIb1Lz4QSpGsBNGlvd4douwRt/Sk9AEjtr2WLurFVW
 SfFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xWZCcKXp7dQkLY1ua1N7VSvKv+b8YJkHyth4+PNi84E=;
 b=o+gUhxH9vzhdRVhNX7n4rdjqpSec9ipXoiBI4lU9c+rI5H8P598bem+r8iupYEVPx8
 2eGcSyzmW1gl4f6lqVFrJsI+xyy9yo53AbCc8LWns2FMWGztNNxuBAP++IyCrbHXW5Zp
 Df/7fG8jLgjNzphTtiClqEQBItcA3p1emPlbJ8zIdxivz85pcHqOBBK93nYtlnfgyv9J
 0qNLNgVqZvjO9T1zlZtajG2wzncXqjbfoeftA0AUrvEHsxbL+RcAAc93PK2zUKPpTnM6
 pGrWa4an3QuCfvT33va29LJQ+EYYkdo84dLfm+d2cBnRm5jGRmxPwRvgmsldTBCi0s9C
 4mrA==
X-Gm-Message-State: AOAM5315DuXRic3UMQQ7/sgm9Ks93BTf/fo1WQ3NkjA2IzJ9jEYW9utK
 gd7K8S9DHxjIlKEDk2e2pU0hQbxzuAY=
X-Google-Smtp-Source: ABdhPJzf+BaXZmZz+oBdRtibxl2pb0ox4A4t3T7MMCXGbbK+TiqjEgQT0VCLsFW65M/6iBDdvL8CGw==
X-Received: by 2002:a63:ef47:: with SMTP id c7mr5778379pgk.249.1598342144450; 
 Tue, 25 Aug 2020 00:55:44 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (61-68-212-105.tpgi.com.au. [61.68.212.105])
 by smtp.gmail.com with ESMTPSA id z1sm1802577pjn.34.2020.08.25.00.55.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2020 00:55:44 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org,
	kvm-ppc@vger.kernel.org
Subject: [PATCH] powerpc/64s: handle ISA v3.1 local copy-paste context switches
Date: Tue, 25 Aug 2020 17:55:35 +1000
Message-Id: <20200825075535.224536-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
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

The ISA v3.1 the copy-paste facility has a new memory move functionality
which allows the copy buffer to be pasted to domestic memory (RAM) as
opposed to foreign memory (accelerator).

This means the POWER9 trick of avoiding the cp_abort on context switch if
the process had not mapped foreign memory does not work on POWER10. Do the
cp_abort unconditionally there.

KVM must also cp_abort on guest exit to prevent copy buffer state leaking
between contexts.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/process.c           | 16 +++++++++-------
 arch/powerpc/kvm/book3s_hv.c            |  7 +++++++
 arch/powerpc/kvm/book3s_hv_rmhandlers.S |  8 ++++++++
 3 files changed, 24 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 016bd831908e..1a572c811ca5 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -1250,15 +1250,17 @@ struct task_struct *__switch_to(struct task_struct *prev,
 		restore_math(current->thread.regs);
 
 		/*
-		 * The copy-paste buffer can only store into foreign real
-		 * addresses, so unprivileged processes can not see the
-		 * data or use it in any way unless they have foreign real
-		 * mappings. If the new process has the foreign real address
-		 * mappings, we must issue a cp_abort to clear any state and
-		 * prevent snooping, corruption or a covert channel.
+		 * On POWER9 the copy-paste buffer can only paste into
+		 * foreign real addresses, so unprivileged processes can not
+		 * see the data or use it in any way unless they have
+		 * foreign real mappings. If the new process has the foreign
+		 * real address mappings, we must issue a cp_abort to clear
+		 * any state and prevent snooping, corruption or a covert
+		 * channel. ISA v3.1 supports paste into local memory.
 		 */
 		if (current->mm &&
-			atomic_read(&current->mm->context.vas_windows))
+			(cpu_has_feature(CPU_FTR_ARCH_31) ||
+			atomic_read(&current->mm->context.vas_windows)))
 			asm volatile(PPC_CP_ABORT);
 	}
 #endif /* CONFIG_PPC_BOOK3S_64 */
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 4ba06a2a306c..3bd3118c7633 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -3530,6 +3530,13 @@ static int kvmhv_load_hv_regs_and_go(struct kvm_vcpu *vcpu, u64 time_limit,
 	 */
 	asm volatile("eieio; tlbsync; ptesync");
 
+	/*
+	 * cp_abort is required if the processor supports local copy-paste
+	 * to clear the copy buffer that was under control of the guest.
+	 */
+	if (cpu_has_feature(CPU_FTR_ARCH_31))
+		asm volatile(PPC_CP_ABORT);
+
 	mtspr(SPRN_LPID, vcpu->kvm->arch.host_lpid);	/* restore host LPID */
 	isync();
 
diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
index 799d6d0f4ead..cd9995ee8441 100644
--- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
+++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
@@ -1830,6 +1830,14 @@ END_FTR_SECTION_IFSET(CPU_FTR_P9_RADIX_PREFETCH_BUG)
 2:
 #endif /* CONFIG_PPC_RADIX_MMU */
 
+	/*
+	 * cp_abort is required if the processor supports local copy-paste
+	 * to clear the copy buffer that was under control of the guest.
+	 */
+BEGIN_FTR_SECTION
+	PPC_CP_ABORT
+END_FTR_SECTION_IFSET(CPU_FTR_ARCH_31)
+
 	/*
 	 * POWER7/POWER8 guest -> host partition switch code.
 	 * We don't have to lock against tlbies but we do
-- 
2.23.0

