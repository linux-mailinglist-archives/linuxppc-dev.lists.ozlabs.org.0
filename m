Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C393C5B9A8E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Sep 2022 14:14:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MSx2Z06jSz3cf5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Sep 2022 22:14:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=dCPzgOnE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029; helo=mail-pj1-x1029.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=dCPzgOnE;
	dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MSwzQ0gWhz3blY
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Sep 2022 22:11:29 +1000 (AEST)
Received: by mail-pj1-x1029.google.com with SMTP id s14-20020a17090a6e4e00b0020057c70943so22174195pjm.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Sep 2022 05:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=Bn0T7dQKNFXGgG78X/o6CPzfYUz1SqFWsqHr1/u9ZNw=;
        b=dCPzgOnEkOD5R0hEstwZ/ptyU93RI/BtzdkPEi1dfMiUuzXlyoEebb+YexTlrh3uql
         PVGe5z2Uc+z76BmB1MMq1B0WYm2xvgpN4g/RmN3+w+n854OMUNvqDXpjmsRuWYhhmuZ2
         Akqd4gpCPwi8VR7Yd4e9prpUafkIh2Jx6d5nMA54SYcB+nIKeC8Gl3btTlXpiZHEMHuL
         IKGjzcl2cvWAP4zA68//NeLGU3zdSUWQwt8s2COBIOLV6q4fOQTEYeTfzxlcw1VpVPG6
         hRamBrA/r0IUZgQ+J1yVPzTEY9UHND1rbQdwdFuDwRh3NXv3m9EbjYlm84JYVd8T4uDR
         0LWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=Bn0T7dQKNFXGgG78X/o6CPzfYUz1SqFWsqHr1/u9ZNw=;
        b=rc8b8qlRinLKnbTIbUQoyMJF2KaJGktTS28P2lKBq3R+IE4QAlCUmfdlYb7Qix4yzd
         tbHXfbVBfGSVJQleW/UaGU+zyJVeKDHvx1ccBXGPlcoQNs5HAMK9aBMOc14Aj90DFLJT
         aYIX875rbyB04Ti2UHvYwcwsoMNIbO5v/ZL1DqaW9dRnQvzXwJYo324AIumiKHTVKPqn
         1kVv4RYREvFGHJIWlSWB8S5R6XPxHkFieZWQD/TAIGDODt5vey4fIfgOnBMFrYnq8R3Y
         aoqjcpkQ4v2kuuOLjADhwfsK5b8EtwU1hOMmB/KEGDTecFnY3ePwO+Hp/9xtdQvWmnhB
         eouQ==
X-Gm-Message-State: ACrzQf0iuKjTr/kFNDfIDfeTESsj+jy0wKJg3L2nxJ0TYepL0lLpEN8/
	JNH3E45PZ76EksZbseXLZK6koG/rkao=
X-Google-Smtp-Source: AMsMyM79ZWO467nLLkMT1RzjilED250EBoPp5Jq93D+mfjPB7Gcg6b0WuFH10eRiWT6f1FORNeSwvw==
X-Received: by 2002:a17:902:db06:b0:178:24e7:639 with SMTP id m6-20020a170902db0600b0017824e70639mr4149649plx.46.1663243886982;
        Thu, 15 Sep 2022 05:11:26 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([118.210.107.131])
        by smtp.gmail.com with ESMTPSA id b6-20020a170902650600b00172a567d910sm12569420plk.289.2022.09.15.05.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Sep 2022 05:11:26 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 4/6] powerpc/64: avoid using r13 in relocate
Date: Thu, 15 Sep 2022 22:10:56 +1000
Message-Id: <20220915121058.2288916-5-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220915121058.2288916-1-npiggin@gmail.com>
References: <20220915121058.2288916-1-npiggin@gmail.com>
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

relocate() uses r13 in early boot before it is used for the paca. Use
a different register for this so r13 is kept unchanged until it is
set to the paca pointer.

Avoid r14 as well while we're here, there's no reason not to use the
volatile registers which is a bit less surprising, and r14 could be used
as another fixed reg one day.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/reloc_64.S | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/kernel/reloc_64.S b/arch/powerpc/kernel/reloc_64.S
index 232e4549defe..efd52f2e7033 100644
--- a/arch/powerpc/kernel/reloc_64.S
+++ b/arch/powerpc/kernel/reloc_64.S
@@ -27,8 +27,8 @@ _GLOBAL(relocate)
 	add	r9,r9,r12	/* r9 has runtime addr of .rela.dyn section */
 	ld	r10,(p_st - 0b)(r12)
 	add	r10,r10,r12	/* r10 has runtime addr of _stext */
-	ld	r13,(p_sym - 0b)(r12)
-	add	r13,r13,r12	/* r13 has runtime addr of .dynsym */
+	ld	r4,(p_sym - 0b)(r12)
+	add	r4,r4,r12	/* r4 has runtime addr of .dynsym */
 
 	/*
 	 * Scan the dynamic section for the RELA, RELASZ and RELAENT entries.
@@ -84,16 +84,16 @@ _GLOBAL(relocate)
 	ld	r0,16(r9)	/* reloc->r_addend */
 	b	.Lstore
 .Luaddr64:
-	srdi	r14,r0,32	/* ELF64_R_SYM(reloc->r_info) */
+	srdi	r5,r0,32	/* ELF64_R_SYM(reloc->r_info) */
 	clrldi	r0,r0,32
 	cmpdi	r0,R_PPC64_UADDR64
 	bne	.Lnext
 	ld	r6,0(r9)
 	ld	r0,16(r9)
-	mulli	r14,r14,24	/* 24 == sizeof(elf64_sym) */
-	add	r14,r14,r13	/* elf64_sym[ELF64_R_SYM] */
-	ld	r14,8(r14)
-	add	r0,r0,r14
+	mulli	r5,r5,24	/* 24 == sizeof(elf64_sym) */
+	add	r5,r5,r4	/* elf64_sym[ELF64_R_SYM] */
+	ld	r5,8(r5)
+	add	r0,r0,r5
 .Lstore:
 	add	r0,r0,r3
 	stdx	r0,r7,r6
-- 
2.37.2

