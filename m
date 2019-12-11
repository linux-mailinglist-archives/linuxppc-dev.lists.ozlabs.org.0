Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B5611A178
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Dec 2019 03:40:32 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Xh4G0Lk5zDqf3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Dec 2019 13:40:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::644;
 helo=mail-pl1-x644.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="vdVOjo0M"; 
 dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Xh0W49tYzDqfV
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Dec 2019 13:37:15 +1100 (AEDT)
Received: by mail-pl1-x644.google.com with SMTP id s10so787275plp.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Dec 2019 18:37:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=4UCktv3Ab9rfNBo0nzD74VBS2H5W9SDg1tuO380qqYk=;
 b=vdVOjo0M6V5IGx0bEDje0aLfDmnKfEgMsms4fYKNJ4t3DQTlCzTM6XFkbS+9pxhFgR
 V++9DsLNgdX/HSJ864j+rXTFgmK5ej5ivUY4Jwd3Z7SqcjnC49jA3kR9JDvvkDEQuV2a
 0gN/8QbwAxsrBj7k0mnEMPo6AsWdDZ83gI74ZvGeCmOpVAaemJfP1j+ManO5jF7B2oz8
 LfxYHWIAN4Ms0o+bWT5kdPams1I87h6AXN/6bKwNdryAfJHmsH2Q1QuxX9P0JxxwSv2Q
 mMju03R8tPiOE1BSMLJzimVQBPWN027mPxBxP1aE4uamWLPao8d2H8fCvbPFfuaZe/Pa
 WQpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=4UCktv3Ab9rfNBo0nzD74VBS2H5W9SDg1tuO380qqYk=;
 b=LU/Z+6iyEQUWYPA1kOBhXR5OlbteQR6afFvwwo4MOxOdMosDGZRI6SeQnR0PNjB8cV
 vWZizsT5M1LAp6bc99dULFsfmPx5ACAHf1qK3Z5rgzOYeck5gEATR3Dh5zbDO3lJVfFr
 ojbmcCtqrTLpJIqTrUgp/rj+ZH6fGfAQC1PjVUtmt85NXprPRUu2yzHrLik4f6EO3jOo
 eWZaA79oPEy+oijAfOtH0CGQxxZmq/Ts1LjasI7lM/ktpK49ds7eFmE5PdfDA3Hr7DEX
 zwQbH8O2ZG1L4ZWr51WYVGI3Kat8r07JQ36dkxo5xJfcZDzt2CeI2D4+o2JfjUmttzMa
 oabg==
X-Gm-Message-State: APjAAAUFswKlPSyv/L04QGThBPWic4hVYR4Fc6sYUBCrcP1483i8JYeh
 96ackVfbVIjvOZbwYGnZ00ADerKk
X-Google-Smtp-Source: APXvYqzcEKMmxDECbinxRA0rQuUdwjDdnpeSoGykGeyngpSIsbpkWld2zzzaH49PgBdTbOxzE392Rg==
X-Received: by 2002:a17:90a:db0b:: with SMTP id
 g11mr790277pjv.140.1576031832935; 
 Tue, 10 Dec 2019 18:37:12 -0800 (PST)
Received: from tee480.au.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id j1sm396459pff.107.2019.12.10.18.37.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2019 18:37:12 -0800 (PST)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/2] powerpc/64s/exception: Remove unused parameters from
 KVMTEST macro
Date: Wed, 11 Dec 2019 13:37:02 +1100
Message-Id: <20191211023703.16837-1-jniethe5@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: Jordan Niethe <jniethe5@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The hsrr and n parameters are never used by the KVMTEST macro so remove
them.

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index d0018dd17e0a..8bcf562242a2 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -210,7 +210,7 @@ END_FTR_SECTION_NESTED(ftr,ftr,943)
 #define kvmppc_interrupt kvmppc_interrupt_pr
 #endif
 
-.macro KVMTEST name, hsrr, n
+.macro KVMTEST name
 	lbz	r10,HSTATE_IN_GUEST(r13)
 	cmpwi	r10,0
 	bne	\name\()_kvm
@@ -284,7 +284,7 @@ END_FTR_SECTION_NESTED(CPU_FTR_HAS_PPR,CPU_FTR_HAS_PPR,948)
 .endm
 
 #else
-.macro KVMTEST name, hsrr, n
+.macro KVMTEST name
 .endm
 .macro KVM_HANDLER name, vec, hsrr, area, skip
 .endm
@@ -431,7 +431,7 @@ END_FTR_SECTION_NESTED(CPU_FTR_HAS_PPR,CPU_FTR_HAS_PPR,948)
 	SAVE_CTR(r10, \area\())
 	mfcr	r9
 	.if \kvm
-		KVMTEST \name \hsrr \vec
+		KVMTEST \name
 	.endif
 	.if \bitmask
 		lbz	r10,PACAIRQSOFTMASK(r13)
@@ -1444,7 +1444,7 @@ EXC_VIRT_NONE(0x4b00, 0x100)
 	GET_PACA(r13)
 	std	r10,PACA_EXGEN+EX_R10(r13)
 	INTERRUPT_TO_KERNEL
-	KVMTEST system_call EXC_STD 0xc00 /* uses r10, branch to system_call_kvm */
+	KVMTEST system_call /* uses r10, branch to system_call_kvm */
 	mfctr	r9
 #else
 	mr	r9,r13
@@ -1811,7 +1811,7 @@ EXC_REAL_BEGIN(denorm_exception_hv, 0x1500, 0x100)
 	andis.	r10,r10,(HSRR1_DENORM)@h /* denorm? */
 	bne+	denorm_assist
 #endif
-	KVMTEST denorm_exception_hv, EXC_HV 0x1500
+	KVMTEST denorm_exception_hv
 	INT_SAVE_SRR_AND_JUMP denorm_common, EXC_HV, 1
 EXC_REAL_END(denorm_exception_hv, 0x1500, 0x100)
 
-- 
2.17.1

