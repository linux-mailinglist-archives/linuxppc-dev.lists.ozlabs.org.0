Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0C819A330
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 03:14:45 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48sSsX5BZMzDqth
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 12:14:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Gz8S5XeX; dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48sSqV3bGDzDqm6
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Apr 2020 12:12:54 +1100 (AEDT)
Received: by mail-pf1-x443.google.com with SMTP id 23so11258133pfj.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Mar 2020 18:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=js6KYa8GJ9z4dFyKIxxvrEcXzx3DfAaEnFIkZZrOM3Q=;
 b=Gz8S5XeXYii2QcUgkq//XyVbO8aS4hohOum9Wa5nEZPaiAki/nG56shMrihJFsS9Fx
 U7ZG7xk5KVl1IS+OKCkR0wAnakNJgsm3JqjJNNjGpF8ZFhoB7Ns36l53kvU08D1VgIeS
 3gx+FXXY8iW/NuF/JXuYGMv2InhZN/VNiP8t0fcS+xKTg/jixK5qAj4Gwb/O1CL3hW5/
 wzsbv4L11zQkXDiD56YthWkGEYCBh7W3r7X5QPVMEng4BXnDyiafs0Jpwmxqkw8NifMC
 86aLk6lVezEMqOwV6D30FJBMJdS+QsRRWe3dLqC2Hcthh2cI9uEbq+ZPPRQ6OK3u8Upw
 nWAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=js6KYa8GJ9z4dFyKIxxvrEcXzx3DfAaEnFIkZZrOM3Q=;
 b=Q7Z/OTBse+kzN67HMSr4xbcAifBk0aJB3BgtLsUompBpvwbpWvK+fPEOBjln9V/YwR
 lObLawGBLVo5HXZqEA1zbtK08RY1SUnMcInjF7Wt2xj706VvLi71HGX/8vmFUmqbkXFU
 85J3tJ9PqZ8bkHUdl7WfjNn/Rn3980hVjrRH88LCTmVM7cmdVs/jwU0iHSo2J8HHl9BL
 58yIDVGCk6SUJZxjnoBzHmGXd2SSjWjTL9bUpBEBsceGAzCWo+Lvtir2FYhYAuqqJp6i
 OZCVYysJtDveNCdnbbIIM9JESjaszDOGbb0SyiltzXd9Gts+9GqeWXAghKW/eAF89ROu
 US1Q==
X-Gm-Message-State: ANhLgQ0cG2pT5dakHx6P6pShXaBZHWgDCgKGIj/JcgeRKKhsn4PJ28/v
 rDBWEu2zAX4S+fH6Imwz4Dxt/3Vj
X-Google-Smtp-Source: ADFU+vu3+fFritMhZpGONbukmcvBzFAgKJMnTFH9wxnjbnqgHZeKjH++LNDzWmqDmdff0ZSMIBT9Lw==
X-Received: by 2002:a62:15d3:: with SMTP id 202mr22014437pfv.231.1585703571046; 
 Tue, 31 Mar 2020 18:12:51 -0700 (PDT)
Received: from bobo.ibm.com (14-203-139-135.static.tpgi.com.au.
 [14.203.139.135])
 by smtp.gmail.com with ESMTPSA id w24sm262337pjn.14.2020.03.31.18.12.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Mar 2020 18:12:50 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] Fix "[v3,
 12/32] powerpc/64s/exception: move KVM test to common code"
Date: Wed,  1 Apr 2020 11:12:41 +1000
Message-Id: <20200401011241.991141-1-npiggin@gmail.com>
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

Moving KVM test to the common entry code missed the case of HMI and MCE,
which do not do __GEN_COMMON_ENTRY (because they don't want to switch
to virt mode).

This means a MCE or HMI exception that is taken while KVM is running a
guest context will not be switched out of that context, and KVM won't
be notified. Found by running sigfuz in guest with patched host on
POWER9 DD2.3, which causes some TM related HMI interrupts (which are
expected and supposed to be handled by KVM).

This fix adds a __GEN_REALMODE_COMMON_ENTRY for those handlers to add
the KVM test. This makes them look a little more like other handlers
that all use __GEN_COMMON_ENTRY.

Conflicts with later patches in series:
- powerpc/64s/exception: remove confusing IEARLY option
  Fix: Remove mfspr (H)SRR, keep __GEN_REALMODE_COMMON_ENTRY

- powerpc/64s/exception: trim unused arguments from KVMTEST macro
  Fix: Trim IHSRR IVEC args from the KVMTEST in __GEN_REALMODE_COMMON_ENTRY

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 74809f1b521d..1bc73acceb9a 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -451,7 +451,9 @@ END_FTR_SECTION_NESTED(CPU_FTR_HAS_PPR,CPU_FTR_HAS_PPR,948)
 
 /*
  * __GEN_COMMON_ENTRY is required to receive the branch from interrupt
- * entry, except in the case of the IEARLY handlers.
+ * entry, except in the case of the real-mode handlers which require
+ * __GEN_REALMODE_COMMON_ENTRY.
+ *
  * This switches to virtual mode and sets MSR[RI].
  */
 .macro __GEN_COMMON_ENTRY name
@@ -487,6 +489,18 @@ DEFINE_FIXED_SYMBOL(\name\()_common_virt)
 	.endif /* IVIRT */
 .endm
 
+/*
+ * Don't switch to virt mode. Used for early MCE and HMI handlers that
+ * want to run in real mode.
+ */
+.macro __GEN_REALMODE_COMMON_ENTRY name
+DEFINE_FIXED_SYMBOL(\name\()_common_real)
+\name\()_common_real:
+	.if IKVM_REAL
+		KVMTEST \name IHSRR IVEC
+	.endif
+.endm
+
 .macro __GEN_COMMON_BODY name
 	.if IMASK
 		lbz	r10,PACAIRQSOFTMASK(r13)
@@ -976,6 +990,8 @@ EXC_COMMON_BEGIN(machine_check_early_common)
 	mfspr	r11,SPRN_SRR0
 	mfspr	r12,SPRN_SRR1
 
+	__GEN_REALMODE_COMMON_ENTRY machine_check_early
+
 	/*
 	 * Switch to mc_emergency stack and handle re-entrancy (we limit
 	 * the nested MCE upto level 4 to avoid stack overflow).
@@ -1831,6 +1847,9 @@ EXC_VIRT_NONE(0x4e60, 0x20)
 EXC_COMMON_BEGIN(hmi_exception_early_common)
 	mfspr	r11,SPRN_HSRR0		/* Save HSRR0 */
 	mfspr	r12,SPRN_HSRR1		/* Save HSRR1 */
+
+	__GEN_REALMODE_COMMON_ENTRY hmi_exception_early
+
 	mr	r10,r1			/* Save r1 */
 	ld	r1,PACAEMERGSP(r13)	/* Use emergency stack for realmode */
 	subi	r1,r1,INT_FRAME_SIZE	/* alloc stack frame		*/
-- 
2.23.0

