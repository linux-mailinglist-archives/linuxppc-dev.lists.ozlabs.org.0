Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C287978E86
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2019 16:58:21 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45y2qt4JcCzDqHZ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2019 00:58:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::541; helo=mail-pg1-x541.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="cRwBoxY/"; 
 dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45y1rg33qvzDqF6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2019 00:13:55 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id i70so17595673pgd.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jul 2019 07:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WrqmFX2pp/nU09lt1JX7JFWF6xXB5AImFS9DuaX2NYE=;
 b=cRwBoxY/vfIKecyMj1TZH6hVokPiobPvodMiydePVJhg0HJzZxBvrXhlu7JI7DxgTh
 5ulMTwYxjsEO6Qq0pO0wJzPMpZxkw6V9U0wDZY+cS0f8pHY3FjJiWW9DE1w9bkDwd0an
 dru6PYwmV2emYFKXgtQZoL7BbDa1n2Q4/MwYzwN5hwud7FoPeFs+YfJoo3Bq/Q5SiPsz
 KFSob2qyPduqX2lTnR2M4r3C4x+GCg00WXaSkIipOH3zNXh6EDzerLPPSLoUOdDi3Di7
 wyUbgUQ2pnhMgk6SAwRWsNWnLT5bjkA3MQVgDhhZ62BdiWJq3I+HOwLsQmo82lU1OYUf
 W61Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WrqmFX2pp/nU09lt1JX7JFWF6xXB5AImFS9DuaX2NYE=;
 b=NmOUvmAQIud2c0YYkcx5L1XBrxFtFOq8NGacQ8lUJEtexY43IAjKA0XqsLn6YDW833
 xhmikPqAA8hyanao7ItfL6hGeTWnwfiqZjxLrNyLeCBpZoLy7aevw4UeIGztWjCyi1Ax
 kDL3wWSD3IKBwmcoPV9Lbzg6jUSMhns7bK1T6jDAb101fkh8iMJEQfyFB0OO8DJChI2q
 yfkP7oWTAqxdzUwTnJRgN7BTFN1jygj97hlupey6ewQCisTFJJg8K7xfBoVRwvOaF/ho
 VOyUh8/ArCvajRMK9EbIq9mE708j9ijGbdsT7lr+f2tSh/LBobE+B2MTPaw2uxRmRt2l
 L09g==
X-Gm-Message-State: APjAAAWIcRpChqThp2OZRJ7li6C9jJVsdcCpeHqr4BFmmoejU27/1oQ/
 SSXvIJkijxlr7MZYD/nM4Ngi2je2EQI=
X-Google-Smtp-Source: APXvYqzwm/1WzSN3gsZC21neb0Z27lkl9EPF9S9O93UUSZGA/+obhDukn8LLTL+r5eQzLPX0RRSdQQ==
X-Received: by 2002:a17:90a:2627:: with SMTP id
 l36mr115104198pje.71.1564409633283; 
 Mon, 29 Jul 2019 07:13:53 -0700 (PDT)
Received: from bobo.local0.net (61-68-184-39.tpgi.com.au. [61.68.184.39])
 by smtp.gmail.com with ESMTPSA id u7sm53960083pfm.96.2019.07.29.07.13.51
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 29 Jul 2019 07:13:52 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 11/18] powerpc/64s/exception: KVM_HANDLER reorder arguments to
 match other macros
Date: Tue, 30 Jul 2019 00:12:40 +1000
Message-Id: <20190729141247.26762-12-npiggin@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190729141247.26762-1-npiggin@gmail.com>
References: <20190729141247.26762-1-npiggin@gmail.com>
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

Also change argument name (n -> vec) to match others.

No generated code change.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 4b2d4c8f8831..e46d27be06fe 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -316,7 +316,7 @@ END_FTR_SECTION_NESTED(ftr,ftr,943)
 	.endif
 .endm
 
-.macro KVM_HANDLER area, hsrr, n, skip
+.macro KVM_HANDLER vec, hsrr, area, skip
 	.if \skip
 	cmpwi	r10,KVM_GUEST_MODE_SKIP
 	beq	89f
@@ -337,14 +337,14 @@ END_FTR_SECTION_NESTED(CPU_FTR_HAS_PPR,CPU_FTR_HAS_PPR,948)
 	/* HSRR variants have the 0x2 bit added to their trap number */
 	.if \hsrr == EXC_HV_OR_STD
 	BEGIN_FTR_SECTION
-	ori	r12,r12,(\n + 0x2)
+	ori	r12,r12,(\vec + 0x2)
 	FTR_SECTION_ELSE
-	ori	r12,r12,(\n)
+	ori	r12,r12,(\vec)
 	ALT_FTR_SECTION_END_IFSET(CPU_FTR_HVMODE | CPU_FTR_ARCH_206)
 	.elseif \hsrr
-	ori	r12,r12,(\n + 0x2)
+	ori	r12,r12,(\vec + 0x2)
 	.else
-	ori	r12,r12,(\n)
+	ori	r12,r12,(\vec)
 	.endif
 
 #ifdef CONFIG_RELOCATABLE
@@ -386,7 +386,7 @@ END_FTR_SECTION_NESTED(CPU_FTR_HAS_PPR,CPU_FTR_HAS_PPR,948)
 #else
 .macro KVMTEST hsrr, n
 .endm
-.macro KVM_HANDLER area, hsrr, n, skip
+.macro KVM_HANDLER vec, hsrr, area, skip
 .endm
 #endif
 
@@ -657,7 +657,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_CAN_NAP)
 	.else
 	TRAMP_KVM_BEGIN(do_kvm_\vec\())
 	.endif
-	KVM_HANDLER \area, \hsrr, \vec, \skip
+	KVM_HANDLER \vec, \hsrr, \area, \skip
 .endm
 
 #define EXC_COMMON(name, realvec, hdlr)					\
@@ -1539,7 +1539,7 @@ TRAMP_KVM_BEGIN(do_kvm_0xc00)
 	SET_SCRATCH0(r10)
 	std	r9,PACA_EXGEN+EX_R9(r13)
 	mfcr	r9
-	KVM_HANDLER PACA_EXGEN, EXC_STD, 0xc00, 0
+	KVM_HANDLER 0xc00, EXC_STD, PACA_EXGEN, 0
 #endif
 
 
-- 
2.22.0

