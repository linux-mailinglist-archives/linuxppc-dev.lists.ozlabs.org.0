Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DBDAB2D8F
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Sep 2019 03:34:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46WBjk58YWzF5w8
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Sep 2019 11:34:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="rYdORvoJ"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46WBbP4rCyzF5pT
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 15 Sep 2019 11:28:33 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id m29so993985pgc.3
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Sep 2019 18:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=z0oUk02qbs5xDQCZ4aN0Lu50uX+8pdjMfY1RvYU/OnU=;
 b=rYdORvoJRPtVYfA53cU5uFulGCG2tcDdr9wEQlEdUyju8Jx0Mv/HjX8irXgWvLjYgM
 qS2oCrJy+TjE9NQYt7+FR0Ouf/9ud2rKRM47kNDg7BYm7hfRAsJAe2GDebMQPIwRPT0j
 L8/tPX+1xdztYE/XZZyDU94V06kWoKWr5oDKApbmWxmUoRW7IeImtZmMilG/pUQuwp5q
 dmisySQ76tDTVOBBtarYwwc6rUzUeo1ce+uXQAegAcAqwHW+R6GK3M7K0CWzG/AyMe9v
 eIF2oFVjlYtyjgIgiy4nW9p3qMOOU2FGfsZ6sCDsslbos/kBBtCwJ61Kt1vqWqXjU/aW
 bG+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z0oUk02qbs5xDQCZ4aN0Lu50uX+8pdjMfY1RvYU/OnU=;
 b=qcjEaMTnaXr7/PUwO9o2fJgcj4NB7pc+jJ1IeiTE2hNqBy7sus+M51tSxEbZ/WqUFu
 6uy9uruN7ZRj/Qs2GqkPNygW0zQ20Mi+mOFdKgFpnYnLwJA7iDlgq8TZ9wtQeMwt2yjc
 P7elyGO653hp3sdRZuLi3w9MJ9S3SMEL2exOmiLr1z5JTaRa8qVl83/6d3E3dIQFf9iz
 rMKbF6Efpt4ocOQ3KzjVTvnmfg9L9qYGflotAOvMgEjdi72M2D9qybqXnVoEpcpcG03P
 GuCLeNHHubsq8adBOA1rm9C/S8lNnkO9pDsRZT7wbWqcNvWelif274RB3wnR8WQzuiEx
 8XMA==
X-Gm-Message-State: APjAAAXG63p/kPLA6Yw0lxz7w2YSIok3aqszz8SGFmgtdPUk+Ikqr3t9
 QUFxa7Pm2g3k/fEai9k0/F5/FuN5
X-Google-Smtp-Source: APXvYqxvCXJ+mu1B9M2ZalPNcqWA/WCLOIXl8O0O0cdRGyF4P9oFLWGzFqPLvLfTF1S/2FfiX9+Wmg==
X-Received: by 2002:a63:6193:: with SMTP id
 v141mr51232565pgb.263.1568510911818; 
 Sat, 14 Sep 2019 18:28:31 -0700 (PDT)
Received: from bobo.local0.net ([203.63.189.78])
 by smtp.gmail.com with ESMTPSA id bt1sm6267043pjb.17.2019.09.14.18.28.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Sep 2019 18:28:31 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 02/27] powerpc/64s/exception: Add GEN_COMMON macro that
 uses INT_DEFINE parameters
Date: Sun, 15 Sep 2019 11:27:48 +1000
Message-Id: <20190915012813.29317-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190915012813.29317-1-npiggin@gmail.com>
References: <20190915012813.29317-1-npiggin@gmail.com>
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
Cc: Tulio Magno Quites Machado Filho <tuliom@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

No generated code change.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index e6ad6e6cf65e..591ae2a73e18 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -206,6 +206,9 @@ END_FTR_SECTION_NESTED(ftr,ftr,943)
 #define IMASK		.L_IMASK_\name\()
 #define IKVM_REAL	.L_IKVM_REAL_\name\()
 #define IKVM_VIRT	.L_IKVM_VIRT_\name\()
+#define ISTACK		.L_ISTACK_\name\()
+#define IRECONCILE	.L_IRECONCILE_\name\()
+#define IKUAP		.L_IKUAP_\name\()
 
 #define INT_DEFINE_BEGIN(n)						\
 .macro int_define_ ## n name
@@ -246,6 +249,15 @@ do_define_int n
 	.ifndef IKVM_VIRT
 		IKVM_VIRT=0
 	.endif
+	.ifndef ISTACK
+		ISTACK=1
+	.endif
+	.ifndef IRECONCILE
+		IRECONCILE=1
+	.endif
+	.ifndef IKUAP
+		IKUAP=1
+	.endif
 .endm
 
 .macro INT_KVM_HANDLER name, vec, hsrr, area, skip
@@ -670,6 +682,10 @@ END_FTR_SECTION_NESTED(CPU_FTR_CFAR, CPU_FTR_CFAR, 66)
 	.endif
 .endm
 
+.macro GEN_COMMON name
+	INT_COMMON IVEC, IAREA, ISTACK, IKUAP, IRECONCILE, IDAR, IDSISR
+.endm
+
 /*
  * Restore all registers including H/SRR0/1 saved in a stack frame of a
  * standard exception.
@@ -1221,13 +1237,7 @@ EXC_VIRT_BEGIN(data_access, 0x4300, 0x80)
 EXC_VIRT_END(data_access, 0x4300, 0x80)
 INT_KVM_HANDLER data_access, 0x300, EXC_STD, PACA_EXGEN, 1
 EXC_COMMON_BEGIN(data_access_common)
-	/*
-	 * Here r13 points to the paca, r9 contains the saved CR,
-	 * SRR0 and SRR1 are saved in r11 and r12,
-	 * r9 - r13 are saved in paca->exgen.
-	 * EX_DAR and EX_DSISR have saved DAR/DSISR
-	 */
-	INT_COMMON 0x300, PACA_EXGEN, 1, 1, 1, 1, 1
+	GEN_COMMON data_access
 	ld	r4,_DAR(r1)
 	ld	r5,_DSISR(r1)
 BEGIN_MMU_FTR_SECTION
-- 
2.23.0

