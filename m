Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 07FED4D19AF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Mar 2022 14:54:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KCcHq6L3Bz3bsT
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Mar 2022 00:53:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=D/zB491N;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1032;
 helo=mail-pj1-x1032.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=D/zB491N; dkim-atps=neutral
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KCcDY5F3Cz3bTQ
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Mar 2022 00:51:09 +1100 (AEDT)
Received: by mail-pj1-x1032.google.com with SMTP id bx5so17222674pjb.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 08 Mar 2022 05:51:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oeN+/IsAqYf3qzpEiRXIii5XjvA70wBP422+zuLTdjg=;
 b=D/zB491Ni9Fxhj09soRh5fAEjC0qi4Mp3C2bub7hSw0bd4zcz9H/6pYWNG3mEWIgJM
 4hTiM6LgZgx79+m/yLOAxdoGkidQIDug5CPy/qbaoMqlaYZ4tAP2Cs/HTmqXbwrLN4sF
 hHzzaM1eL8r9T3Vy0lU5fyLQFqfnEvPhqV9D4MfagUOSbWmFgyJGvFYnJMDn1nNN5Zzh
 RIAjQNmrmm8VMMcTVVU0E0HPAfzvpbyzG1N6ZxLPWidPfxnjTY8Ww0GjK1d4frFjUpG8
 3y2Out0WVTlygxDPvQ2Db+6n0ojGevkJKxjRkIEgICOgsdCH1aMu2lwK5p+Z9jN2TYYT
 FGaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oeN+/IsAqYf3qzpEiRXIii5XjvA70wBP422+zuLTdjg=;
 b=qUTVu7u9c1O7UoI/nbXdSkJ4+TmBTxvUnPyqCWoz6CX2zv0hZWNWvkEWTUut7k6YdW
 LpnocvNy1pbGVE4Gqh2qs3taOZHsBM6ZtzH0gH32EuTZnbrKQo5ahdEi45VXc2PNTOJo
 HZ3ro4wCuxkJsI4pK31xE5P/Psq5orHMqWVdlLLapFu5rw9MF5eudS5/vSMWMY2yNC8f
 7LHvKwOdBVrGRaTYfvX8NKlFoKhpRNhDXj8yh1q7PlLTCkQPBfmRX/gFhuSknJ/R+92I
 hz1gJySWvUMezcxvNfXnoUqgbHJnAr0URckl8TWJE/8+xtt0n5WbV16RwxNq1L8Ylx+p
 i2Ig==
X-Gm-Message-State: AOAM533XDuic/aZKhjCiBVp5StaTYOpJQebmMsfidGDh8aA41JAqKt0E
 fhw8CUWe1wR0jbqFVKWKBlqnJFUWP9w=
X-Google-Smtp-Source: ABdhPJzGyOG73x58uJvXkg85TX6VvFbUa2j3rma0lOILQZi0nFwx9RJ1Mb/EOvtYQlaGMt1I9tgs4g==
X-Received: by 2002:a17:902:7043:b0:14f:47:a455 with SMTP id
 h3-20020a170902704300b0014f0047a455mr17499809plt.44.1646747468415; 
 Tue, 08 Mar 2022 05:51:08 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (61-68-211-196.tpgi.com.au. [61.68.211.196])
 by smtp.gmail.com with ESMTPSA id
 q14-20020a056a00150e00b004f741b5c071sm541737pfu.86.2022.03.08.05.51.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 05:51:08 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 04/14] powerpc/rtas: Call enter_rtas with MSR[EE] disabled
Date: Tue,  8 Mar 2022 23:50:37 +1000
Message-Id: <20220308135047.478297-5-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20220308135047.478297-1-npiggin@gmail.com>
References: <20220308135047.478297-1-npiggin@gmail.com>
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
Cc: Laurent Dufour <ldufour@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Disable MSR[EE] in C code rather than asm.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/rtas.c       |  4 ++++
 arch/powerpc/kernel/rtas_entry.S | 17 +----------------
 2 files changed, 5 insertions(+), 16 deletions(-)

diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index 733e6ef36758..6b5892d6a56b 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -49,6 +49,10 @@ void enter_rtas(unsigned long);
 
 static inline void do_enter_rtas(unsigned long args)
 {
+	BUG_ON(!irqs_disabled());
+
+	hard_irq_disable(); /* Ensure MSR[EE] is disabled on PPC64 */
+
 	enter_rtas(args);
 
 	srr_regs_clobbered(); /* rtas uses SRRs, invalidate */
diff --git a/arch/powerpc/kernel/rtas_entry.S b/arch/powerpc/kernel/rtas_entry.S
index 6fa10eb49a9c..45fa661c2ff6 100644
--- a/arch/powerpc/kernel/rtas_entry.S
+++ b/arch/powerpc/kernel/rtas_entry.S
@@ -24,8 +24,6 @@ _GLOBAL(enter_rtas)
 	lwz	r4,RTASBASE(r4)
 	mfmsr	r9
 	stw	r9,8(r1)
-	LOAD_REG_IMMEDIATE(r0,MSR_KERNEL)
-	mtmsr	r0	/* disable interrupts so SRR0/1 don't get trashed */
 	li	r9,MSR_KERNEL & ~(MSR_IR|MSR_DR)
 	mtlr	r6
 	stw	r1, THREAD + RTAS_SP(r2)
@@ -87,20 +85,7 @@ _GLOBAL(enter_rtas)
 	li	r0,0
 	mtcr	r0
 
-#ifdef CONFIG_BUG
-	/* There is no way it is acceptable to get here with interrupts enabled,
-	 * check it with the asm equivalent of WARN_ON
-	 */
-	lbz	r0,PACAIRQSOFTMASK(r13)
-1:	tdeqi	r0,IRQS_ENABLED
-	EMIT_WARN_ENTRY 1b,__FILE__,__LINE__,BUGFLAG_WARNING
-#endif
-
-	/* Hard-disable interrupts */
 	mfmsr	r6
-	rldicl	r7,r6,48,1
-	rotldi	r7,r7,16
-	mtmsrd	r7,1
 
 	/* Unfortunately, the stack pointer and the MSR are also clobbered,
 	 * so they are saved in the PACA which allows us to restore
@@ -124,7 +109,7 @@ _GLOBAL(enter_rtas)
 	andc	r6,r0,r9
 
 __enter_rtas:
-	sync				/* disable interrupts so SRR0/1 */
+	sync				/* disable RI so SRR0/1 */
 	mtmsrd	r0			/* don't get trashed */
 
 	LOAD_REG_ADDR(r4, rtas)
-- 
2.23.0

