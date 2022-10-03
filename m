Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB62A5F2A7D
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Oct 2022 09:37:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mgt2c6dCqz3c8q
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Oct 2022 18:37:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Cukch56v;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Cukch56v;
	dkim-atps=neutral
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mgt2146ZXz2xGS
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Oct 2022 18:36:39 +1100 (AEDT)
Received: by mail-pl1-x634.google.com with SMTP id 10so5360577pli.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 Oct 2022 00:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date;
        bh=RPoqKOZgx3VYgScL9F0fUPX/Sk25fX4fu47u/Xe6Mr4=;
        b=Cukch56vacl0vnaIfszMh9uv+sjozfQs+CcnHdSoFxA/r8Zb/t9zzm5zLMbdgGFzzP
         HbCl52GJ9Tm2h07IzN8Vs/c8bRjkalJ6huId8jjCT2aQC24qfIrvMPCgdsWTca1FAMVt
         udsSb7IH83YiiGsV4nGsEyd2PA7izettn1FE4R8TTulC3P8Q0wGJw2gdbHKBgKyjkcAI
         ODnnuNr4vmjXOx8PYagP4KPANSOg5GoC3BOdA9JjJX4171U1WawX4D8xrvQDNc66mhA+
         O7HQCGZRRfswQL2Y0IvaiAc3hRVyCHohjzLqyLWyorjOIR7TCAXz7wcn0+QRvGiXGLRu
         jWqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date;
        bh=RPoqKOZgx3VYgScL9F0fUPX/Sk25fX4fu47u/Xe6Mr4=;
        b=LT2iQcVq4ieaCsKaxdIogCOY631W7qNekabWjIazFhMW6EPC0KNofbvVPGPeRkJV5v
         10UR8IifeQAsndK+V+IPOGqdqCleppW1fZcyZnjrnP8+3+UoGFuB7rgikUXq4mk1+kQc
         IWYAkGuY9nu3M4C59AdwguFvRSTVOog1wIexVf7LbUjRECNH2ecEyfG+XgkEd/NRBbJd
         /6rw934RjvUWdzSJT48EOCAkmBTqIHnVpYjHf8D9Kpz+Q5gQi3tXA273A9TRidh1ipP6
         qwW6gmR46t4e0nPUScGzuKvtof0N1VmIj/dqNi7k6Sp95xYu1IQKOU0e44r7GpNULMKv
         OrpA==
X-Gm-Message-State: ACrzQf0h5ZCd2fvOHvZJEHDOAmaywYdXywx5gcMfX+l8Eg8ZCl4NKuaw
	+O7BDX8KkOEKLVD3L2zGoi/1hkZ1edQ=
X-Google-Smtp-Source: AMsMyM7N+hfPFVW9VL03WUwv5cV08Y+R92eePUi+DrPUol6N3pU6dzfPmDOKfcSNG7VCMwI/wGn6cQ==
X-Received: by 2002:a17:90b:3889:b0:200:8255:f0e5 with SMTP id mu9-20020a17090b388900b002008255f0e5mr10999697pjb.51.1664782594699;
        Mon, 03 Oct 2022 00:36:34 -0700 (PDT)
Received: from voyager.lan ([45.124.203.18])
        by smtp.gmail.com with ESMTPSA id a26-20020aa78e9a000000b005619afb745esm348742pfr.113.2022.10.03.00.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Oct 2022 00:36:34 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc: Implement slightly better 64-bit LE non-VMX memory copy
Date: Mon,  3 Oct 2022 18:06:15 +1030
Message-Id: <20221003073615.5553-1-joel@jms.id.au>
X-Mailer: git-send-email 2.35.1
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
Cc: Jeremy Kerr <jk@codeconstruct.com.au>, Matt Johnston <matt@codeconstruct.com.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Paul Mackerras <paulus@ozlabs.org>

At present, on 64-bit little-endian machines, we have the choice of
either a dumb loop that does one byte per iteration, or an optimized
loop using VMX instructions.  On microwatt, we don't have VMX, so
we are stuck with the dumb loop, which is very slow.

This makes the dumb loop a little less dumb.  It now does 16 bytes
per iteration, using 'ld' and 'std' instructions.  If the number of
bytes to copy is not a multiple of 16, the one-byte-per-iteration
loop is used for the last 1--15 bytes.

Signed-off-by: Paul Mackerras <paulus@ozlabs.org>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/powerpc/lib/memcpy_64.S | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/lib/memcpy_64.S b/arch/powerpc/lib/memcpy_64.S
index 016c91e958d8..bed7eb327b25 100644
--- a/arch/powerpc/lib/memcpy_64.S
+++ b/arch/powerpc/lib/memcpy_64.S
@@ -18,7 +18,7 @@
 _GLOBAL_TOC_KASAN(memcpy)
 BEGIN_FTR_SECTION
 #ifdef __LITTLE_ENDIAN__
-	cmpdi	cr7,r5,0
+	clrldi	r6,r5,60
 #else
 	std	r3,-STACKFRAMESIZE+STK_REG(R31)(r1)	/* save destination pointer for return value */
 #endif
@@ -29,13 +29,24 @@ FTR_SECTION_ELSE
 ALT_FTR_SECTION_END_IFCLR(CPU_FTR_VMX_COPY)
 #ifdef __LITTLE_ENDIAN__
 	/* dumb little-endian memcpy that will get replaced at runtime */
-	addi r9,r3,-1
-	addi r4,r4,-1
-	beqlr cr7
-	mtctr r5
-1:	lbzu r10,1(r4)
-	stbu r10,1(r9)
-	bdnz 1b
+	addi	r9,r3,-8
+	addi	r4,r4,-8
+	srdi.	r0,r5,4
+	beq	2f
+	mtctr	r0
+3:	ld	r10,8(r4)
+	std	r10,8(r9)
+	ldu	r10,16(r4)
+	stdu	r10,16(r9)
+	bdnz	3b
+2:	cmpwi	r6,0
+	beqlr
+	addi	r9,r9,7
+	addi	r4,r4,7
+	mtctr	r6
+1:	lbzu	r10,1(r4)
+	stbu	r10,1(r9)
+	bdnz	1b
 	blr
 #else
 	PPC_MTOCRF(0x01,r5)
-- 
2.35.1

