Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D617797930
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2019 14:25:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46D6MK3ncvzDr3T
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2019 22:25:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::541; helo=mail-pg1-x541.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="PnbHj43g"; 
 dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46D6Jd5MNvzDqlX
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2019 22:23:29 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id o13so1212611pgp.12
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2019 05:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mjKYU0FU95zyHX4snJZf7Om3P7Mg1Dv3wch3ZCb4KA0=;
 b=PnbHj43ghu4UUCxwP6gXlJRILPzr+GrmdYKuhuaUGSTM6caDQ/Q3H/Dqo5MyNMX3my
 9hSITf2l3jrsh6IeV6jg99gOpKX+LAM7eqcj+B7LCtfzUwu4ywOTKZBOMmI01G0rs/qo
 xetE04D0UPpiinvERs4z5GRvESqZlvokKE3TTUAxxK/QQMdC0EVsRaQbkMz67o6Wv+lr
 4xuKNvh2CpYjSrfIVEbNRbMHAO/HG1odsAG3e024mmva5vcRhLw9R7I5rXjK8a2y2zqP
 BZmcXmtwznk+ugP7bvSWu1tVt3meEyF2n9RFKnTVUe3s+mT/42kUr02ruZDOxpzPWux5
 zk7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mjKYU0FU95zyHX4snJZf7Om3P7Mg1Dv3wch3ZCb4KA0=;
 b=ZnDTEopuc9Ik90WzVBFu28/aW1+TRPMbUJ5hxpssc4uBItvxEApZtf2oYb7AGQH3vj
 y68mdvCw2TFi9d4Oyl3zfW0L5wshAI8f1pJzqgxZwyecQeuoWOAnkfW5/HfFe6y1nIe3
 eAKhYc/Me4qWDt4PwfMLAaMYAVduZmFVWvvTy1vRVRn9TF1SY1gR0g9MOkkT8bJnlmsx
 4MIrTkuElPcII+cbMBVhnMmf+3d5OdIeHyxatEal8CS8XZD1RGgVhIYpzjowB+pKLoCo
 +aWu/iKW2qSg8a/OdncGYnLfOr3almsAHlVH7Y1V+R6iKgQ+MQ2UHJ3MGRuETzKIehjY
 2M4g==
X-Gm-Message-State: APjAAAWMij9uTy1oFkz/y4Js+GAr2K8O+AAhtB6iY0bGOHAjiFA8bEML
 kyqg8A/mT3Uus76CyZP7vi/k9Vz7
X-Google-Smtp-Source: APXvYqyXUgKfy/m5aWnIOHVrEMWYZWpHR2l71ZVTA8HArJlQMrpUAVQ+r9erNd9G9BoVNe3/p/JtnA==
X-Received: by 2002:a65:514c:: with SMTP id g12mr28942991pgq.76.1566390206892; 
 Wed, 21 Aug 2019 05:23:26 -0700 (PDT)
Received: from bobo.local0.net ([193.114.104.176])
 by smtp.gmail.com with ESMTPSA id a3sm23657819pfc.70.2019.08.21.05.23.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2019 05:23:26 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 01/10] powerpc/64s/exception: Add ISIDE option
Date: Wed, 21 Aug 2019 22:23:06 +1000
Message-Id: <20190821122315.9535-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190821122315.9535-1-npiggin@gmail.com>
References: <20190821122315.9535-1-npiggin@gmail.com>
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

Rather than using DAR=2 to select the i-side registers, add an
explicit option.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 5d9fdf9dce55..2d2c6f19eec1 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -199,6 +199,7 @@ END_FTR_SECTION_NESTED(ftr,ftr,943)
 #define IVEC		.L_IVEC_\name\()
 #define IHSRR		.L_IHSRR_\name\()
 #define IAREA		.L_IAREA_\name\()
+#define IISIDE		.L_IISIDE_\name\()
 #define IDAR		.L_IDAR_\name\()
 #define IDSISR		.L_IDSISR_\name\()
 #define ISET_RI		.L_ISET_RI_\name\()
@@ -231,6 +232,9 @@ do_define_int n
 	.ifndef IAREA
 		.error "IAREA not defined"
 	.endif
+	.ifndef IISIDE
+		IISIDE=0
+	.endif
 	.ifndef IDAR
 		IDAR=0
 	.endif
@@ -546,7 +550,7 @@ END_FTR_SECTION_NESTED(CPU_FTR_HAS_PPR,CPU_FTR_HAS_PPR,948)
 	 */
 	GET_SCRATCH0(r10)
 	std	r10,IAREA+EX_R13(r13)
-	.if IDAR == 1
+	.if IDAR && !IISIDE
 	.if IHSRR
 	mfspr	r10,SPRN_HDAR
 	.else
@@ -554,7 +558,7 @@ END_FTR_SECTION_NESTED(CPU_FTR_HAS_PPR,CPU_FTR_HAS_PPR,948)
 	.endif
 	std	r10,IAREA+EX_DAR(r13)
 	.endif
-	.if IDSISR == 1
+	.if IDSISR && !IISIDE
 	.if IHSRR
 	mfspr	r10,SPRN_HDSISR
 	.else
@@ -629,16 +633,18 @@ END_FTR_SECTION_NESTED(CPU_FTR_HAS_PPR,CPU_FTR_HAS_PPR,948)
 	std	r9,GPR11(r1)
 	std	r10,GPR12(r1)
 	std	r11,GPR13(r1)
+
 	.if IDAR
-	.if IDAR == 2
+	.if IISIDE
 	ld	r10,_NIP(r1)
 	.else
 	ld	r10,IAREA+EX_DAR(r13)
 	.endif
 	std	r10,_DAR(r1)
 	.endif
+
 	.if IDSISR
-	.if IDSISR == 2
+	.if IISIDE
 	ld	r10,_MSR(r1)
 	lis	r11,DSISR_SRR1_MATCH_64S@h
 	and	r10,r10,r11
@@ -647,6 +653,7 @@ END_FTR_SECTION_NESTED(CPU_FTR_HAS_PPR,CPU_FTR_HAS_PPR,948)
 	.endif
 	std	r10,_DSISR(r1)
 	.endif
+
 BEGIN_FTR_SECTION_NESTED(66)
 	ld	r10,IAREA+EX_CFAR(r13)
 	std	r10,ORIG_GPR3(r1)
@@ -1324,8 +1331,9 @@ INT_DEFINE_BEGIN(instruction_access)
 	IVEC=0x400
 	IHSRR=EXC_STD
 	IAREA=PACA_EXGEN
-	IDAR=2
-	IDSISR=2
+	IISIDE=1
+	IDAR=1
+	IDSISR=1
 	IKVM_REAL=1
 INT_DEFINE_END(instruction_access)
 
@@ -1355,7 +1363,8 @@ INT_DEFINE_BEGIN(instruction_access_slb)
 	IHSRR=EXC_STD
 	IAREA=PACA_EXSLB
 	IRECONCILE=0
-	IDAR=2
+	IISIDE=1
+	IDAR=1
 	IKVM_REAL=1
 INT_DEFINE_END(instruction_access_slb)
 
-- 
2.22.0

