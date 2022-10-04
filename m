Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 935FA5F4444
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Oct 2022 15:31:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MhdrN2vZVz3bn4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Oct 2022 00:31:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=f4GVjCrb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102b; helo=mail-pj1-x102b.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=f4GVjCrb;
	dkim-atps=neutral
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MhdqP3Cp7z2xHw
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Oct 2022 00:30:07 +1100 (AEDT)
Received: by mail-pj1-x102b.google.com with SMTP id 70so12866134pjo.4
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 Oct 2022 06:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=grT08PTQiYfQ4VlqpxBTaE4YAbLJ93R7EocY8oBOtxM=;
        b=f4GVjCrbnyYje6dkbNI5w7HJejyWboUinD5pz0Mwb55bBu6upddncVx5jHlFSFyiLM
         h+NaxckHv4tD8lryB/haD/+1/78OB2/UYM1HICLsPbRM4VTYcLgwGOf1hlg5mg0+X6vY
         VsHAANeO0687TeOT6E+iCtB59IooB9/FJk02vp4w+BLK4FwPQQE563lLhTD+0Vi+ojo/
         JLsIYwwng6LO7jwwt7Z/TjuRd6RwLjRZ58kYaYayhQnMM4ocvmtjuZhPxuYZ+D4ySHdP
         Pyjza72Hm7ceY9oaHvYwGyFcyLVtV2qphVFr6utHiqsRKZqqc2h8+7ae+/YoEZX0Wr3C
         4iIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=grT08PTQiYfQ4VlqpxBTaE4YAbLJ93R7EocY8oBOtxM=;
        b=7Xco6Np+X2fI/E2r6Nd0B2vO87VO5Z46O/fVQG1Q92+OM0Ked9rB59mCrzVGYLkGnR
         jlfAvJ1+0dX33WpEq5LUwnqALlv2cmZx7X+bl184SnrllLkaXcVFHiAy4oUn08gmNtUp
         sAmGxHX2F0bYY8tnodFoTcp1o8s0fYzRPGGrrC4BF+9aQvPkC0q9Y4Ogrmi3jTKnmyiw
         2S11/xZxjUqXrgc6Sf+3iMrS4IE1ejZpDqcwou1Yih8ss+veZ00dCg/dqlxPobD0E/Jx
         04aYh7bIIsGGta1Ez3Y90tjIcCDDtRmDGUO/LTPyTTTGkM38QSrq6n6ejB0eU3o3r/yg
         GffA==
X-Gm-Message-State: ACrzQf1HBTF5vjfuXBBfA6eDuEAQ+R0xCILDBt3sCclye37km1xY/O0F
	LnMtCmhoTQe2NAhZL02Lrg5A5wnnRwo=
X-Google-Smtp-Source: AMsMyM5jjAfwED9LLArL2ljnz6KZqCXApeqdUx4mrF09UWg+D00dt8EobpcxtaVGvU0RsE7wFPYwJA==
X-Received: by 2002:a17:902:eccb:b0:178:1313:afa1 with SMTP id a11-20020a170902eccb00b001781313afa1mr27633691plh.97.1664890204299;
        Tue, 04 Oct 2022 06:30:04 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (123-243-1-173.tpgi.com.au. [123.243.1.173])
        by smtp.gmail.com with ESMTPSA id a4-20020a170902ecc400b00179f370dbe7sm8923612plh.287.2022.10.04.06.30.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Oct 2022 06:30:03 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/64s/interrupt: stack backtrace fix
Date: Tue,  4 Oct 2022 23:29:52 +1000
Message-Id: <20221004132952.984341-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The value of the stack frame regs marker that gets saved on the
stack in interrupt entry code does not match the regs marker value,
which breaks stack frame marker matching.

This stray instruction looks to have been introduced in a mismerge.

Fixes: bf75a3258a403 ("powerpc/64s/interrupt: move early boot ILE fixup into a macro")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index fed983cc7ee0..ec5dfc7b5517 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -590,7 +590,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_CFAR)
 	std	r9,_TRAP(r1)		/* set trap number		*/
 	li	r10,0
 	LOAD_REG_IMMEDIATE(r11, STACK_FRAME_REGS_MARKER)
-	rldimi	r11, r11, 32, 0
 	std	r10,RESULT(r1)		/* clear regs->result		*/
 	std	r11,STACK_FRAME_OVERHEAD-16(r1) /* mark the frame	*/
 .endm
-- 
2.37.2

