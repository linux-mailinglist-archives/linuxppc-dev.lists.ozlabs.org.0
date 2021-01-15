Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D732F829B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jan 2021 18:35:32 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DHSxs1yVGzDsp8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Jan 2021 04:35:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::529;
 helo=mail-pg1-x529.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=pJUUiTqF; dkim-atps=neutral
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DHRzB49jKzDshL
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Jan 2021 03:51:33 +1100 (AEDT)
Received: by mail-pg1-x529.google.com with SMTP id i5so6379144pgo.1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Jan 2021 08:51:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XbNDmneEk64eVDNlPMWe13nYw9NjlqQEq3JXigsQzLc=;
 b=pJUUiTqFWjrOMkTqDq8tYmTPD6SJ9jko/ytTkxrrlp9Cnn71xoDdoVAF3SNH38Fg2F
 hLZomWzPAfEM11uZSZ0ql/76Yrvx5VHbV9HOOcFyldUObSDP+XrBLxxLe3TU29SKR0cj
 H3j+Pvam3i1CkrU/kC2RAOKCfdyLbi4KO6Cm+6AfOGtAdLDrXWIhZq0/ibs5IwmoeMhb
 P5o+Mz7YIpW7SxULuBIe0K3RvykFFezuwDsKpog924aPUgNMQRgronE3aNE9hQyJhOSk
 OZbQQsRf+S44twL8+1rd8SDvh4sAetgOg8ggmGD938Du52RiUA2puJdas+dSLcHlvErO
 je9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XbNDmneEk64eVDNlPMWe13nYw9NjlqQEq3JXigsQzLc=;
 b=nly5L/GzrXlxiAbLXXjVNrCZpm4tlFjX+UAlC/ki7aY4f86Xehgcm8xSxTPes+Ydtm
 Z0ngHL9qcGW2TkGkEINj6XyvfqB64+Xo1q4jk2ngd80gauuk3ENE9cyB3V2jpOhR6k0q
 +oed3O4FuTXBMhNqfh5DtcTsSIVtNkg4vmlJGkuqzndge/0C25hUik3H3E2SkEf1IMjB
 hB60UjDK3cmzndXILAcmFQxI5W61RNGSgw0xgRemovACN1tnAq6Mv6MPokof/XZ149yC
 OwB8Qnvfpjarl5y6RGHBScDmumthwksIVAO626HCCyF2U8UyjQjM+remZ9gRmSLTPmBK
 DtuQ==
X-Gm-Message-State: AOAM532X8FdgyeJ43AO5QN3uE6k9XuV5scu6pdT63AodMc+FZ/uIACR3
 9uyVrxS9bV+M288NuZq+sOhuDC0OGLA=
X-Google-Smtp-Source: ABdhPJw28X0hVOtCMLkiqkxV+oQ7WQ/u1+j/qD2fucr5CT6DXkNRw00TstHBc4j3yMR0iEze/7LHTg==
X-Received: by 2002:a65:4105:: with SMTP id w5mr13593975pgp.52.1610729488299; 
 Fri, 15 Jan 2021 08:51:28 -0800 (PST)
Received: from bobo.ibm.com ([124.170.13.62])
 by smtp.gmail.com with ESMTPSA id u1sm8455477pjr.51.2021.01.15.08.51.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 08:51:27 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 17/39] powerpc/fsl_booke/32: CacheLockingException remove
 args
Date: Sat, 16 Jan 2021 02:49:50 +1000
Message-Id: <20210115165012.1260253-18-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210115165012.1260253-1-npiggin@gmail.com>
References: <20210115165012.1260253-1-npiggin@gmail.com>
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

Like other interrupt handler conversions, switch to getting registers
from the pt_regs argument.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/head_fsl_booke.S | 6 +++---
 arch/powerpc/kernel/traps.c          | 5 +++--
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/kernel/head_fsl_booke.S b/arch/powerpc/kernel/head_fsl_booke.S
index fdd4d274c245..0d4d9a6fcca1 100644
--- a/arch/powerpc/kernel/head_fsl_booke.S
+++ b/arch/powerpc/kernel/head_fsl_booke.S
@@ -364,12 +364,12 @@ interrupt_base:
 	/* Data Storage Interrupt */
 	START_EXCEPTION(DataStorage)
 	NORMAL_EXCEPTION_PROLOG(DATA_STORAGE)
-	mfspr	r5,SPRN_ESR		/* Grab the ESR, save it, pass arg3 */
+	mfspr	r5,SPRN_ESR		/* Grab the ESR, save it3 */
 	stw	r5,_ESR(r11)
-	mfspr	r4,SPRN_DEAR		/* Grab the DEAR, save it, pass arg2 */
+	mfspr	r4,SPRN_DEAR		/* Grab the DEAR, save it */
+	stw	r4, _DEAR(r11)
 	andis.	r10,r5,(ESR_ILK|ESR_DLK)@h
 	bne	1f
-	stw	r4, _DEAR(r11)
 	EXC_XFER_LITE(0x0300, handle_page_fault)
 1:
 	addi	r3,r1,STACK_FRAME_OVERHEAD
diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index 639bcafbad5e..1af52a4bce1f 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -2105,9 +2105,10 @@ void altivec_assist_exception(struct pt_regs *regs)
 #endif /* CONFIG_ALTIVEC */
 
 #ifdef CONFIG_FSL_BOOKE
-void CacheLockingException(struct pt_regs *regs, unsigned long address,
-			   unsigned long error_code)
+void CacheLockingException(struct pt_regs *regs)
 {
+	unsigned long error_code = regs->dsisr;
+
 	/* We treat cache locking instructions from the user
 	 * as priv ops, in the future we could try to do
 	 * something smarter
-- 
2.23.0

