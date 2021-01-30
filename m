Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BC275309568
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Jan 2021 14:35:42 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DSZwC1Q8yzDrbn
	for <lists+linuxppc-dev@lfdr.de>; Sun, 31 Jan 2021 00:35:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1031;
 helo=mail-pj1-x1031.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=OkjQcuMr; dkim-atps=neutral
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DSZL63fGZzDrVB
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 31 Jan 2021 00:09:34 +1100 (AEDT)
Received: by mail-pj1-x1031.google.com with SMTP id a20so7228677pjs.1
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Jan 2021 05:09:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eciXHuwRxTIZo8Y6m6F/I6ThRCq2EhHQj8zaBWQT614=;
 b=OkjQcuMrdvDYbVtt4QwtDe2YC8miVMjWwRXySyF6+a3ZYAf4Mo47+Htu024VkeK1Y5
 fpNcfh3mY4sFq5SLmeKSW4zBi3d6hEykDB7n5hvU4jxnqZKo5lU2QZ8TbKEE332xZ2pj
 7NFEqE092md1TjfGE8st1icSCmjwUsQkZecVAqIPrKiNABZzWdZRM8GZqrwTWjrHBedA
 0g7ruXpTddHsDP+lNp/y7R+a4qH+HDuSM4G/SMKO/M0JR2gPuN0P44y1Gd0Mef89Gsca
 gFsOyTPRiX3LH1DyDKA/C5kpmkIdzTiX/ZiIuC7YsTgya1YAUFDiNhPJrrKXEWcaVVnQ
 BV4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eciXHuwRxTIZo8Y6m6F/I6ThRCq2EhHQj8zaBWQT614=;
 b=Zc735709H3ao0+zeXdjThi/33MT2qQNlaBwnRptoKvqZ+lKcyRv+h8XyY19hIKG8VU
 uT6GTbugd22to+AMkvLviTGzyzq/sOjEVQ+nlIDo84FxOi7rQGkm14PWirNo/nlLFddy
 3KDCsucn4V1iHWleGv8s92Zzct+2GTwXpl1Ig86HtkjTSylF7GeqJfPSwqX3yPl6+3zW
 XPg3Ak047TepgXoBD+I7Ogd6KhcQ9W/BPhPwN5ARXFgH/EL1ZxQhnRcaWHfiUtlq7icU
 UaYsy7keP6dUnLRs4qRozuqUBXeUXXp+vhOigqz1+czaY4oTsJAwoa2LqUVd7pcsWphZ
 8B3g==
X-Gm-Message-State: AOAM531WQdscHRRMnu0/jqxQQCqKsGirksK7d0jLualbf11Y/fPB1h0J
 UBK85xXMF4Jo1HzDaz78iiG6xXCHTcM=
X-Google-Smtp-Source: ABdhPJwWWvtSYtpifyeHANXOgzkA4gfXITnCgoUROBq5+bZTozqUmE2QEOOnLnHmWqIVIbisO0b/OQ==
X-Received: by 2002:a17:902:8542:b029:df:ef68:38c with SMTP id
 d2-20020a1709028542b02900dfef68038cmr9632462plo.27.1612012171613; 
 Sat, 30 Jan 2021 05:09:31 -0800 (PST)
Received: from bobo.ozlabs.ibm.com
 (192.156.221.203.dial.dynamic.acc50-nort-cbr.comindico.com.au.
 [203.221.156.192])
 by smtp.gmail.com with ESMTPSA id y16sm12102240pgg.20.2021.01.30.05.09.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Jan 2021 05:09:31 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v7 07/42] powerpc/fsl_booke/32: CacheLockingException remove
 args
Date: Sat, 30 Jan 2021 23:08:17 +1000
Message-Id: <20210130130852.2952424-8-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210130130852.2952424-1-npiggin@gmail.com>
References: <20210130130852.2952424-1-npiggin@gmail.com>
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
Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>
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
index 3ec7b443fe6b..1c77b1a8f7c9 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -2062,9 +2062,10 @@ void altivec_assist_exception(struct pt_regs *regs)
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

