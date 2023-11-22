Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B94287F3C18
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Nov 2023 03:59:17 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=HRvFlRsn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SZmDM4t1vz3cbl
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Nov 2023 13:59:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=HRvFlRsn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52f; helo=mail-pg1-x52f.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SZmCS6Kmpz3cS3
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Nov 2023 13:58:27 +1100 (AEDT)
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-5b9a456798eso3837738a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Nov 2023 18:58:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700621899; x=1701226699; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IYM0Oaw3kRxzOyoQ/EbAwwAuiWC84244ywU20mM17lo=;
        b=HRvFlRsnnAXcs4dC6wXlAMQOH4H0JAaCxPua7F+Qm9xPaUjKGaaoTpdQYbz+1SpaT8
         lN5OPakH7MnxUoqCAAfEUV7pz9dU0Gzw8IgeU0ZPZnZtdy6H9mqzJ5bTaidF/bw0IwhC
         x+Ht0wDbhV1Kha23GAhn1TB/fTy2kMfSgvmd+EUGJydCATGHBxFV2qqFF63N0uU7bg5f
         xV7D/h6RsHJtrcIhjGd/rTsgMwYzxWCmpRwl/OEsIDbv3Lf9k8/0wusDp0mO33AMMHe8
         SGsjlsz71xOzA93xYy0CufuAA0eHpsGCoD08DC7gLDUWnQFOz+J4husRz6aBFJFJjco9
         WsaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700621899; x=1701226699;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IYM0Oaw3kRxzOyoQ/EbAwwAuiWC84244ywU20mM17lo=;
        b=QVbLLX1EQqE0p0L4wDqhd0bXaAiw91AjmaYzFf+gfe2KOflgLK0h3hiejj+4Cs8fQy
         MHJP+9rIn6vMrOc7gXlvhbRJs4bJYb/aJQjqqlqQ5oZWqSD+M/PKGoS0oGj6XRujfsVy
         ianS74Uy2ab1ifx012+nrA0VagWyXqUGCnTgKrl4cH2vQM0rZRsyvmLr1/D3hSeJ1BT7
         /mNfe09Go2Lc5M0g3akvj84ejJL49mcMxaWy25O0qHRU5+o3kMBi31ypGwPZAcoEdM2b
         ptX5Qrmj6jxeSW+6LwkRKoQX82ttRIjhmRmjKVky6ivK6t5eQwxoJxxKuwhlmaPGsaMy
         8Igg==
X-Gm-Message-State: AOJu0YzdyvRv8/HvxJUPKs6+wbqE1jqeAuSkGEzihKWVyCnegPpFDRaA
	L+uqDIawTT2kU2Bamr42p9/VvHtuN6g=
X-Google-Smtp-Source: AGHT+IEcqc/s2w/ZBALwv0dgeVaxc4fKN+qst8zGiW5r33dir6akhkAdzmg5zMkUt2NBkLwD3Bv2xA==
X-Received: by 2002:a05:6a21:788f:b0:187:ae36:74c with SMTP id bf15-20020a056a21788f00b00187ae36074cmr1021859pzc.62.1700621899252;
        Tue, 21 Nov 2023 18:58:19 -0800 (PST)
Received: from wheely.local0.net (60-240-124-93.tpgi.com.au. [60.240.124.93])
        by smtp.gmail.com with ESMTPSA id c5-20020a170903234500b001cf5ceade80sm4805533plh.1.2023.11.21.18.58.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 18:58:18 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] KVM: PPC: Book3S HV: Fix KVM_RUN clobbering FP/VEC user registers
Date: Wed, 22 Nov 2023 12:58:11 +1000
Message-ID: <20231122025811.2973-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.42.0
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
Cc: Timothy Pearson <tpearson@raptorengineering.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Before running a guest, the host process (e.g., QEMU) FP/VEC registers
are saved if they were being used, similarly to when the kernel uses FP
registers. The guest values are then be loaded into regs, and the host
process registers will be restored lazily when it uses FP/VEC.

KVM HV has a bug here: the host process registers do get saved, but the
user MSR bits remain enabled, which indicates the registers are valid
for the process. After they are clobbered by running the guest, this
valid indication causes the host process to take on the FP/VEC regiter
values of the guest.

Fixes: de2a20aa7237b ("powerpc: Prepare for splitting giveup_{fpu, altivec, vsx} in two")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/process.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 392404688cec..9452a54d356c 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -1198,11 +1198,11 @@ void kvmppc_save_user_regs(void)
 
 	usermsr = current->thread.regs->msr;
 
+	/* Caller has enabled FP/VEC/VSX/TM in MSR */
 	if (usermsr & MSR_FP)
-		save_fpu(current);
-
+		__giveup_fpu(current);
 	if (usermsr & MSR_VEC)
-		save_altivec(current);
+		__giveup_altivec(current);
 
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 	if (usermsr & MSR_TM) {
-- 
2.42.0

