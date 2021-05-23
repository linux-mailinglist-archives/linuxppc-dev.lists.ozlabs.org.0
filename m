Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7EA238DB29
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 May 2021 14:21:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fnzwd43LBz3btR
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 May 2021 22:21:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Yseywgl2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::433;
 helo=mail-pf1-x433.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Yseywgl2; dkim-atps=neutral
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fnzw93qvhz2yXn
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 May 2021 22:21:12 +1000 (AEST)
Received: by mail-pf1-x433.google.com with SMTP id x188so18550386pfd.7
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 May 2021 05:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0LoUOrEkcp1WK5rmcxwsPUplBY6Kp7GqBB43eiXJMlg=;
 b=Yseywgl2rlML6LAYrKrgqhT9SYnPIoMW1d7YuNcjDhvBYkzHW1KtkKFBIk66nOj3oP
 bR2Jc1uetBvjBzzkG6a6Q4hn0U1mJnVU31m4zsiVL++r+9ZTNs1A+5Y82ThbRnkfJOKO
 ElkhoJoemCrgxpfZl34hTdg1U96n/MrkF7zIGdmnD4NlfP5V1CE2OmFibWo6e5OU5z3L
 ybDLDldN0kqlutqLrbmFVZqClM6moTbf4kFKpdF2l6wp56eHXvRPdaveRMNQtm/Udrru
 sj8Lc2bXlyWB8Y6DUBDIKF31kbUrk0jS4anzuMlqcGi7cabHNif+E5ZcSh/rw+jUXfMl
 lboA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0LoUOrEkcp1WK5rmcxwsPUplBY6Kp7GqBB43eiXJMlg=;
 b=q6Z/ETvIK9Gpf+EcJ0iJIyR4Gu+WMUFlkud6jg+IVIDir8/Zs/22h+eoeJqhV/aiSf
 8qfGKFm3jo5sHjkZrZl4MOu/q4TKHH34F7xotaHNTbcPVS8mGB4asrwfIygJ5mRv1jKR
 15p/VPe6yUgWgL7tQCAcRAEaXXhyIuLnST/QOTFybkh3H3yg05KcAcbTMmgYLVgpp0AF
 zgtb05jCTN2LI/e5R0yQN1XklfC5vZETucMlxtlYvD9eZsYJS9E40hTW8SQxxaQhb7WB
 /JO8pPJ3LDAc0q0CD+Qy6cjVZaOyMAEt/pHYdAJPrjmNcgK7sW+9VnPTQgEDtIGbCPly
 V5Hw==
X-Gm-Message-State: AOAM5306A6/ndTvD3aPCJ1NTfqC9STOfaQuvDKQ0tuH6uGws0d54PubD
 FehMp4zm1Dt44W3IOnSuGas=
X-Google-Smtp-Source: ABdhPJwbP3GQmJLVnH783Xild7/zhg9XT1WRhcUQnpxJi1rzfzFZ5YXkDZY5jf57utEj+xukplv5Yg==
X-Received: by 2002:a63:5d18:: with SMTP id r24mr8583820pgb.94.1621772468237; 
 Sun, 23 May 2021 05:21:08 -0700 (PDT)
Received: from bobo.ibm.com ([210.185.78.224])
 by smtp.gmail.com with ESMTPSA id j3sm8834663pfe.98.2021.05.23.05.21.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 May 2021 05:21:07 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: 
Subject: [PATCH] KVM: PPC: Book3S HV: Save host FSCR in the P7/8 path
Date: Sun, 23 May 2021 22:21:01 +1000
Message-Id: <20210523122101.3247232-1-npiggin@gmail.com>
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
Cc: Michael Neuling <mikey@neuling.org>, linuxppc-dev@lists.ozlabs.org,
 kvm-ppc@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Similar to commit 25edcc50d76c ("KVM: PPC: Book3S HV: Save and restore
FSCR in the P9 path"), ensure the P7/8 path saves and restores the host
FSCR. The logic explained in that patch actually applies there to the
old path well: a context switch can be made before kvmppc_vcpu_run_hv
restores the host FSCR and returns.

Fixes: b005255e12a3 ("KVM: PPC: Book3S HV: Context-switch new POWER8 SPRs")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv_rmhandlers.S | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
index 5e634db4809b..2b98e710c7a1 100644
--- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
+++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
@@ -44,7 +44,7 @@ END_FTR_SECTION_IFCLR(CPU_FTR_ARCH_300)
 #define NAPPING_UNSPLIT	3
 
 /* Stack frame offsets for kvmppc_hv_entry */
-#define SFS			208
+#define SFS			216
 #define STACK_SLOT_TRAP		(SFS-4)
 #define STACK_SLOT_SHORT_PATH	(SFS-8)
 #define STACK_SLOT_TID		(SFS-16)
@@ -59,8 +59,9 @@ END_FTR_SECTION_IFCLR(CPU_FTR_ARCH_300)
 #define STACK_SLOT_UAMOR	(SFS-88)
 #define STACK_SLOT_DAWR1	(SFS-96)
 #define STACK_SLOT_DAWRX1	(SFS-104)
+#define STACK_SLOT_FSCR		(SFS-112)
 /* the following is used by the P9 short path */
-#define STACK_SLOT_NVGPRS	(SFS-152)	/* 18 gprs */
+#define STACK_SLOT_NVGPRS	(SFS-160)	/* 18 gprs */
 
 /*
  * Call kvmppc_hv_entry in real mode.
@@ -686,6 +687,8 @@ BEGIN_FTR_SECTION
 	std	r6, STACK_SLOT_DAWR0(r1)
 	std	r7, STACK_SLOT_DAWRX0(r1)
 	std	r8, STACK_SLOT_IAMR(r1)
+	mfspr	r5, SPRN_FSCR
+	std	r5, STACK_SLOT_FSCR(r1)
 END_FTR_SECTION_IFSET(CPU_FTR_ARCH_207S)
 BEGIN_FTR_SECTION
 	mfspr	r6, SPRN_DAWR1
@@ -1663,6 +1666,10 @@ FTR_SECTION_ELSE
 	ld	r7, STACK_SLOT_HFSCR(r1)
 	mtspr	SPRN_HFSCR, r7
 ALT_FTR_SECTION_END_IFCLR(CPU_FTR_ARCH_300)
+BEGIN_FTR_SECTION
+	ld	r5, STACK_SLOT_FSCR(r1)
+	mtspr	SPRN_FSCR, r5
+END_FTR_SECTION_IFSET(CPU_FTR_ARCH_207S)
 	/*
 	 * Restore various registers to 0, where non-zero values
 	 * set by the guest could disrupt the host.
-- 
2.23.0

