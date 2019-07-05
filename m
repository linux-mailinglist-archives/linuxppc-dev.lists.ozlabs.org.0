Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 51AE360D34
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jul 2019 23:39:10 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45gSsR45KmzDqKX
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Jul 2019 07:39:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::644; helo=mail-pl1-x644.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fossix.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.b="UDxdIdcy"; 
 dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45gSbk0rgnzDqfj
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Jul 2019 07:27:14 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id w24so5119530plp.2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Jul 2019 14:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IB2HUAfpx1iAfqKw5lIS9SkzschlvidLGpboYbmttS8=;
 b=UDxdIdcy6/vLM4luZasqQ5GUsA9usf/gzDKHbFXO7KnLFHyPLoBylzgazJGrQywn0S
 GBcKEMVQxcukhGOGW5TxD1G5j82Gdgrgrr+9ZtiRszeA16VhIOBEPq2zb+QGn3cVbEYV
 mdIJJSY7NNzVTS2bBx7U1TJ4oTyVbDgMmbQXrKXCDeSw9Aeh6MsdX4NzP4dpQ59Lr3O6
 bqtfXP+DzbN4Xo7cXK7Y2JdivmHz5mqdPQ8KBcPtxGF72QCiXgIXB3lih6EOzeflCuny
 QK+FPt4JM7raQ69VQ/tguWHWXPe+RvzbuH0tohuf6yyuKOf7ehCjtncHjfzBXqVrP7p1
 TZbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IB2HUAfpx1iAfqKw5lIS9SkzschlvidLGpboYbmttS8=;
 b=NKTaUV4I/zyoSJuA6LsvWMAOgULpUrZmHtc5ZAb/fF4/3l+c1ImcbDEyQAudiRijWf
 L/SbwLsN+/Y+E2Md8s5SRkEMFRk8UvfF7hyJ2tbRWCmeqEnUzqiko+SPCFW0LWfvumTS
 Ezl156HrXr26ayt9w31+12pIeDH7raEz8lSn7yLP0ypmRnapvYRUFeAQ8fO3inqlGiqf
 DvsrosWzDT9d3oFuiFBbvYZ8cBK1ygpr0fPnkFutAH//bCcC2mjlSTSxZZdpvsxkgNvv
 V8uSG81PUAtiOInw/hs6629ouXxh211+lnMR0R2pnPH6Ii7jP0+IuxkDHocrXFDFzFZt
 C8Ag==
X-Gm-Message-State: APjAAAXeISmf4Syb9oYQ12L+B8VXKovZ/ZM3wggeHVdyotmzavX/QhJJ
 +JUrBIlTk95F2uJGoaEh5qrhIrVGOQaXaw==
X-Google-Smtp-Source: APXvYqz0sErFIYZ45A0XtXV9/BIWS0wXiq8KBXqUSK0QBGsfXKw279SjCb9jlWm6Tm461yVy/UvSNQ==
X-Received: by 2002:a17:902:744c:: with SMTP id
 e12mr7854219plt.287.1562362031225; 
 Fri, 05 Jul 2019 14:27:11 -0700 (PDT)
Received: from santosiv.in.ibm.com ([49.205.217.222])
 by smtp.gmail.com with ESMTPSA id o13sm9321389pje.28.2019.07.05.14.27.08
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 05 Jul 2019 14:27:10 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: [v3 5/7] powerpc/memcpy_mcsafe: return remaining bytes
Date: Sat,  6 Jul 2019 02:56:45 +0530
Message-Id: <20190705212647.21750-6-santosh@fossix.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190705212647.21750-1-santosh@fossix.org>
References: <20190705212647.21750-1-santosh@fossix.org>
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>,
 Chandan Rajendra <chandan@linux.vnet.ibm.com>,
 Reza Arbab <arbab@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

memcpy_mcsafe currently return -EFAULT on a machine check exception, change
it to return the remaining bytes that needs to be copied, so that machine
check safe copy_to_user can maintain the same behavior as copy_to_user.

Signed-off-by: Santosh Sivaraj <santosh@fossix.org>
---
 arch/powerpc/lib/memcpy_mcsafe_64.S | 142 ++++++++++++++++------------
 1 file changed, 83 insertions(+), 59 deletions(-)

diff --git a/arch/powerpc/lib/memcpy_mcsafe_64.S b/arch/powerpc/lib/memcpy_mcsafe_64.S
index 50f865db0338..4d8a3d315992 100644
--- a/arch/powerpc/lib/memcpy_mcsafe_64.S
+++ b/arch/powerpc/lib/memcpy_mcsafe_64.S
@@ -30,11 +30,25 @@
 	ld	r14,STK_REG(R14)(r1)
 	addi	r1,r1,STACKFRAMESIZE
 .Ldo_err1:
-	li	r3,-EFAULT
+	/* Do a byte by byte copy to get the exact remaining size */
+	mtctr	r7
+100:	EX_TABLE(100b, .Ldone)
+46:
+err1;	lbz	r0,0(r4)
+	addi	r4,r4,1
+err1;	stb	r0,0(r3)
+	addi	r3,r3,1
+	bdnz	46b
+	li	r3,0
+	blr
+
+.Ldone:
+	mfctr	r3
 	blr
 
 
 _GLOBAL(memcpy_mcsafe)
+	mr	r7,r5
 	cmpldi	r5,16
 	blt	.Lshort_copy
 
@@ -49,18 +63,21 @@ err1;	lbz	r0,0(r4)
 	addi	r4,r4,1
 err1;	stb	r0,0(r3)
 	addi	r3,r3,1
+	subi	r7,r7,1
 
 1:	bf	cr7*4+2,2f
 err1;	lhz	r0,0(r4)
 	addi	r4,r4,2
 err1;	sth	r0,0(r3)
 	addi	r3,r3,2
+	subi	r7,r7,2
 
 2:	bf	cr7*4+1,3f
 err1;	lwz	r0,0(r4)
 	addi	r4,r4,4
 err1;	stw	r0,0(r3)
 	addi	r3,r3,4
+	subi	r7,r7,4
 
 3:	sub	r5,r5,r6
 	cmpldi	r5,128
@@ -87,43 +104,69 @@ err1;	stw	r0,0(r3)
 4:
 err2;	ld	r0,0(r4)
 err2;	ld	r6,8(r4)
-err2;	ld	r7,16(r4)
-err2;	ld	r8,24(r4)
-err2;	ld	r9,32(r4)
-err2;	ld	r10,40(r4)
-err2;	ld	r11,48(r4)
-err2;	ld	r12,56(r4)
-err2;	ld	r14,64(r4)
-err2;	ld	r15,72(r4)
-err2;	ld	r16,80(r4)
-err2;	ld	r17,88(r4)
-err2;	ld	r18,96(r4)
-err2;	ld	r19,104(r4)
-err2;	ld	r20,112(r4)
-err2;	ld	r21,120(r4)
+err2;	ld	r8,16(r4)
+err2;	ld	r9,24(r4)
+err2;	ld	r10,32(r4)
+err2;	ld	r11,40(r4)
+err2;	ld	r12,48(r4)
+err2;	ld	r14,56(r4)
+err2;	ld	r15,64(r4)
+err2;	ld	r16,72(r4)
+err2;	ld	r17,80(r4)
+err2;	ld	r18,88(r4)
+err2;	ld	r19,96(r4)
+err2;	ld	r20,104(r4)
+err2;	ld	r21,112(r4)
+err2;	ld	r22,120(r4)
 	addi	r4,r4,128
 err2;	std	r0,0(r3)
 err2;	std	r6,8(r3)
-err2;	std	r7,16(r3)
-err2;	std	r8,24(r3)
-err2;	std	r9,32(r3)
-err2;	std	r10,40(r3)
-err2;	std	r11,48(r3)
-err2;	std	r12,56(r3)
-err2;	std	r14,64(r3)
-err2;	std	r15,72(r3)
-err2;	std	r16,80(r3)
-err2;	std	r17,88(r3)
-err2;	std	r18,96(r3)
-err2;	std	r19,104(r3)
-err2;	std	r20,112(r3)
-err2;	std	r21,120(r3)
+err2;	std	r8,16(r3)
+err2;	std	r9,24(r3)
+err2;	std	r10,32(r3)
+err2;	std	r11,40(r3)
+err2;	std	r12,48(r3)
+err2;	std	r14,56(r3)
+err2;	std	r15,64(r3)
+err2;	std	r16,72(r3)
+err2;	std	r17,80(r3)
+err2;	std	r18,88(r3)
+err2;	std	r19,96(r3)
+err2;	std	r20,104(r3)
+err2;	std	r21,112(r3)
+err2;	std	r22,120(r3)
 	addi	r3,r3,128
+	subi	r7,r7,128
 	bdnz	4b
 
 	clrldi	r5,r5,(64-7)
 
-	ld	r14,STK_REG(R14)(r1)
+	/* Up to 127B to go */
+5:	srdi	r6,r5,4
+	mtocrf	0x01,r6
+
+6:	bf	cr7*4+1,7f
+err2;	ld	r0,0(r4)
+err2;	ld	r6,8(r4)
+err2;	ld	r8,16(r4)
+err2;	ld	r9,24(r4)
+err2;	ld	r10,32(r4)
+err2;	ld	r11,40(r4)
+err2;	ld	r12,48(r4)
+err2;	ld	r14,56(r4)
+	addi	r4,r4,64
+err2;	std	r0,0(r3)
+err2;	std	r6,8(r3)
+err2;	std	r8,16(r3)
+err2;	std	r9,24(r3)
+err2;	std	r10,32(r3)
+err2;	std	r11,40(r3)
+err2;	std	r12,48(r3)
+err2;	std	r14,56(r3)
+	addi	r3,r3,64
+	subi	r7,r7,64
+
+7:	ld	r14,STK_REG(R14)(r1)
 	ld	r15,STK_REG(R15)(r1)
 	ld	r16,STK_REG(R16)(r1)
 	ld	r17,STK_REG(R17)(r1)
@@ -134,42 +177,19 @@ err2;	std	r21,120(r3)
 	ld	r22,STK_REG(R22)(r1)
 	addi	r1,r1,STACKFRAMESIZE
 
-	/* Up to 127B to go */
-5:	srdi	r6,r5,4
-	mtocrf	0x01,r6
-
-6:	bf	cr7*4+1,7f
-err1;	ld	r0,0(r4)
-err1;	ld	r6,8(r4)
-err1;	ld	r7,16(r4)
-err1;	ld	r8,24(r4)
-err1;	ld	r9,32(r4)
-err1;	ld	r10,40(r4)
-err1;	ld	r11,48(r4)
-err1;	ld	r12,56(r4)
-	addi	r4,r4,64
-err1;	std	r0,0(r3)
-err1;	std	r6,8(r3)
-err1;	std	r7,16(r3)
-err1;	std	r8,24(r3)
-err1;	std	r9,32(r3)
-err1;	std	r10,40(r3)
-err1;	std	r11,48(r3)
-err1;	std	r12,56(r3)
-	addi	r3,r3,64
-
 	/* Up to 63B to go */
-7:	bf	cr7*4+2,8f
+	bf	cr7*4+2,8f
 err1;	ld	r0,0(r4)
 err1;	ld	r6,8(r4)
-err1;	ld	r7,16(r4)
-err1;	ld	r8,24(r4)
+err1;	ld	r8,16(r4)
+err1;	ld	r9,24(r4)
 	addi	r4,r4,32
 err1;	std	r0,0(r3)
 err1;	std	r6,8(r3)
-err1;	std	r7,16(r3)
-err1;	std	r8,24(r3)
+err1;	std	r8,16(r3)
+err1;	std	r9,24(r3)
 	addi	r3,r3,32
+	subi	r7,r7,32
 
 	/* Up to 31B to go */
 8:	bf	cr7*4+3,9f
@@ -179,6 +199,7 @@ err1;	ld	r6,8(r4)
 err1;	std	r0,0(r3)
 err1;	std	r6,8(r3)
 	addi	r3,r3,16
+	subi	r7,r7,16
 
 9:	clrldi	r5,r5,(64-4)
 
@@ -192,18 +213,21 @@ err1;	lwz	r6,4(r4)
 err1;	stw	r0,0(r3)
 err1;	stw	r6,4(r3)
 	addi	r3,r3,8
+	subi	r7,r7,8
 
 12:	bf	cr7*4+1,13f
 err1;	lwz	r0,0(r4)
 	addi	r4,r4,4
 err1;	stw	r0,0(r3)
 	addi	r3,r3,4
+	subi	r7,r7,4
 
 13:	bf	cr7*4+2,14f
 err1;	lhz	r0,0(r4)
 	addi	r4,r4,2
 err1;	sth	r0,0(r3)
 	addi	r3,r3,2
+	subi	r7,r7,2
 
 14:	bf	cr7*4+3,15f
 err1;	lbz	r0,0(r4)
-- 
2.20.1

