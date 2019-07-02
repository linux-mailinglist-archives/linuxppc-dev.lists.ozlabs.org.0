Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 847895C8D3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2019 07:33:37 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45dCZk1yMPzDqK5
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2019 15:33:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fossix.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.b="YeDpXFu4"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45dCHP4Pq8zDqLL
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jul 2019 15:20:17 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id f25so7084754pgv.10
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 01 Jul 2019 22:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2eKySy+ofP39yUhvXO65KjBrDTXu6io+eKrLabYiJKM=;
 b=YeDpXFu4gedkfulYzdQ5LLfnlppsJe6PNZ+30EPI+ryRaQmIfE3bVkJNtUrvSlsnLE
 jSc2b/Uqi2YBCDtfNtOpi5llQHmUeFkdDKieIDjYFjgGxolDrPztwBv2tFN7W6gO6dcj
 9G0ln6bLHdqQ1mI+DD40OeSb6tDkvAXYsH3zV0J3nZkBfTQ5s6gI0VhKfurjCj/WCORn
 2A4NHnTJFe7XlHegrUvCd9lqEyYFMepMq4HYG8OF2pxeeB+ixNeuKlUiunNY12sQtNlU
 Ecwj+1K/Of0xj9cLgm3OWNG2gEaMoZ2I/YgCFi/ZIBejcibUI58f4q5kzYAQKPQzBR15
 f5Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2eKySy+ofP39yUhvXO65KjBrDTXu6io+eKrLabYiJKM=;
 b=OsW1p4wQP1tTdeUIbKSjU+GQrJG+pVnF4XCHXrNBDFOyw1uknEqBHKQ+xfV9/gGtK6
 rq+pBJLu5XCskEMedeC+XH7bCAY2dbt6+R02J5bfOOeqmyjgxBtwvYba388DMEyuhPZK
 R6gi/0qjdXEXQZLPPtrXXcNeoyBdlPuke2XfDryKYytKmks94xKMg/88hquiYUmsP4Zf
 IaWFdn1hD2eMu9SnQUwkChZ38LDm3uwJVTIojkgwWTZotp4kW3KDUWWWGKogSjzw425R
 x+RHJCHTIBukYxMPHkWNKq8dnAIJofjiC9i1+AJ+kua9Tyu7BgA4v6BeJcz0qsG9fjEs
 JgLg==
X-Gm-Message-State: APjAAAUSkpZyQ0FZy5qA4nEzEae3MjRcJ4CzdHxD+2Od/gbbqhpG8BQv
 r8v662xxo5nzi37nFYJPBr4lBMltT9c=
X-Google-Smtp-Source: APXvYqyZ4sJCBnDW6zCtn4sDgkiROnog1cNShryXOCEum41LkpwqnS/iJ8+MkzcT6hrEtIfSV/y6uQ==
X-Received: by 2002:a17:90a:2385:: with SMTP id
 g5mr3571804pje.12.1562044815682; 
 Mon, 01 Jul 2019 22:20:15 -0700 (PDT)
Received: from santosiv.in.ibm.com ([129.41.84.67])
 by smtp.gmail.com with ESMTPSA id t9sm1106898pji.18.2019.07.01.22.20.12
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 01 Jul 2019 22:20:15 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: [v2 10/12] powerpc/memcpy_mcsafe: return remaining bytes
Date: Tue,  2 Jul 2019 10:49:30 +0530
Message-Id: <20190702051932.511-11-santosh@fossix.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190702051932.511-1-santosh@fossix.org>
References: <20190702051932.511-1-santosh@fossix.org>
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
 arch/powerpc/lib/memcpy_mcsafe_64.S | 129 +++++++++++++++-------------
 1 file changed, 70 insertions(+), 59 deletions(-)

diff --git a/arch/powerpc/lib/memcpy_mcsafe_64.S b/arch/powerpc/lib/memcpy_mcsafe_64.S
index 50f865db0338..566c664aa640 100644
--- a/arch/powerpc/lib/memcpy_mcsafe_64.S
+++ b/arch/powerpc/lib/memcpy_mcsafe_64.S
@@ -30,11 +30,12 @@
 	ld	r14,STK_REG(R14)(r1)
 	addi	r1,r1,STACKFRAMESIZE
 .Ldo_err1:
-	li	r3,-EFAULT
+	mr	r3,r7
 	blr
 
 
 _GLOBAL(memcpy_mcsafe)
+	mr	r7,r5
 	cmpldi	r5,16
 	blt	.Lshort_copy
 
@@ -49,18 +50,21 @@ err1;	lbz	r0,0(r4)
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
@@ -87,43 +91,69 @@ err1;	stw	r0,0(r3)
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
@@ -134,42 +164,19 @@ err2;	std	r21,120(r3)
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
@@ -179,6 +186,7 @@ err1;	ld	r6,8(r4)
 err1;	std	r0,0(r3)
 err1;	std	r6,8(r3)
 	addi	r3,r3,16
+	subi	r7,r7,16
 
 9:	clrldi	r5,r5,(64-4)
 
@@ -192,18 +200,21 @@ err1;	lwz	r6,4(r4)
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

