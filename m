Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 23FD47F65A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 14:01:48 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 460QkK4d9jzDr63
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 22:01:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::544; helo=mail-pg1-x544.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="OGQ6fJG1"; 
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 460PMz1kWvzDqX1
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Aug 2019 21:00:47 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id n4so622840pgv.2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Aug 2019 04:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QTtVJlFFD6sDeYJwufrSiZe/9ev66CXc9Xk6LJUAV48=;
 b=OGQ6fJG1x8/bnmh+L61qAYqxC1ZKFTXZ4GXYcKW1oAZD03iB+iDIPxQwcPjX2hKU86
 Aks7LjBIL7nTOLxJ2A+2HB385p0iRFjP7CfvPLq4EJ4I2t1guaIgNCZIThmxUusHJdzW
 0jpAwy3YwWvoUYBCaofpKFmuVCk+rWwMpBzwD6DapH3NcZP2Rs7z+HHRsvo6T8fpDDtI
 Azn/8jkgr2mpe/vFopkxZJ0FNXGV6b97WwWqHqZvnddt8Si7NQ/N+jXcIRQKEYXi+NWz
 2hGFnJywz2LMlu+yf/XjHpyIm5HSYziijSE0/9KXW25H2qFgwtSV3nTEidyMQLpwGQHe
 xZHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QTtVJlFFD6sDeYJwufrSiZe/9ev66CXc9Xk6LJUAV48=;
 b=c4G2KyPsrVsU8Rh+6+eduZ+zgkQmVlu5ZiSLweaa38tqVUIA+cUmYYiWToOBT05B05
 oOfUBVIr+68qMNdBczDbc0sYWiqb1am2Hh48i1vi0CZIy64kq1MufdD5aqJCNUiOhYaw
 rwtlq6bplmW4BQVWpLU2DG4k92DHnpjwBdQ/JQCXeypKCVJ4Pt9XtErlWoiHpjyGolSp
 L/KzMYSCrr/EciH8+ziWrtmJYQw3xZTHu5zySpihswgcDPFOtzzLQTxjw3Hp3sSdoztT
 4JxmIizWUnjoCnya30VD9KTgLeXetZoTfwQnAqdYEjxPW1s2XiERAQYBA4LLrHgTiF/c
 FtcA==
X-Gm-Message-State: APjAAAX3DTr7m43gfV0XL+ppbdn69Ucfp2MZxUB11FybDZXZykxK1xlM
 OwUcdrCmd3kFSEq/IbyBDZOxz7HBMlA=
X-Google-Smtp-Source: APXvYqwS8IuFklYuMDYJuFk91P2sdTP9xDrL4RZTFabCSN9mdo9ucOPt4VcRU7jXzxfkCixbsV0Mbg==
X-Received: by 2002:a65:5043:: with SMTP id k3mr67194715pgo.406.1564743644475; 
 Fri, 02 Aug 2019 04:00:44 -0700 (PDT)
Received: from bobo.local0.net (193-116-68-11.tpgi.com.au. [193.116.68.11])
 by smtp.gmail.com with ESMTPSA id t96sm7377118pjb.1.2019.08.02.04.00.42
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 02 Aug 2019 04:00:43 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 27/44] powerpc/64s/exception: KVM_HANDLER reorder arguments
 to match other macros
Date: Fri,  2 Aug 2019 20:56:52 +1000
Message-Id: <20190802105709.27696-28-npiggin@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190802105709.27696-1-npiggin@gmail.com>
References: <20190802105709.27696-1-npiggin@gmail.com>
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
index 52d4cfe4093e..c36c6a029ee9 100644
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

