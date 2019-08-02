Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE227F6DD
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 14:32:31 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 460RPm02YWzDr09
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 22:32:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::644; helo=mail-pl1-x644.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="U6U+ztr1"; 
 dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 460PNR1Y9DzDqy1
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Aug 2019 21:01:11 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id b7so33557590pls.6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Aug 2019 04:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Bk+EwNUcnDqg2kQZg8E4IeIONKkTr7KSA6Yn+suj9WE=;
 b=U6U+ztr1+Sk+W0BqTY8BqywQLNH2l/PDsa+4fu24SI0fXNLbRCYI2H2/4xIlG+gld0
 wg6k7oQWWt2I9heiTyKvhLKN0Isfvd6LuWygYBUtRcz16kuVR9x18h2lC3f9vn9EYCXn
 43U+w18415oFgnRPlmlS7w33mTfEpy4A32cJDCi7X5E6DD4lgQF4wBiJfdV0LbH8rYWe
 ui70nAoTywGVoLCRQxqa4sINFzGt+UT+WPjbWILam8IO4RaoU/iB4JoCrfjfz9LRGgt9
 SK3qA6z81zK50AL8iKYonoSziT7LH/q5ZqwwHw/vaLz81yxDAuPJj/pJ0zY1uiD0Oo4w
 m9iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Bk+EwNUcnDqg2kQZg8E4IeIONKkTr7KSA6Yn+suj9WE=;
 b=JlQOYqmz/k9TVHVycjPmF0rvsvVIwgwWa315/fS3W1rIOktytLk81/Q6aRFv7HWo/N
 fPULYWjtlGClyMuxGPvsYmeLYfmYdKvny5GBWAZwlF893JrGQUgLoSBCeU+navx7EdNj
 ztDY27/Kkp+QaW3saG6hiox2DOBSrlIFUlspyVkqT4XoPf1eUfBn/TW0fZl/VhCg8Q9S
 1JDvsE3rHZGOrQ2bqwbaZu+RiuhqyPIAUq5J67OIk4XSt3OPXvoDElZLb+OHGtInmBTn
 BhDN4EiWXGUJBXhFE3J6UjnG/8VjPoGuvVmlZF1e2Dh4aS4NqGPcV+YFbrb6C8LNNSlc
 MG9A==
X-Gm-Message-State: APjAAAVsUaMkt+s61A5pelDfL1qp2MZTdwXsZcpefA1uzPIkyDQ4BNGG
 bnY9vMLAA5UY2ZMrX2wkGlL/gCKy/Yw=
X-Google-Smtp-Source: APXvYqwWLq6yZUkNrPNApDMAQb0PRzfntujTdXpIvKJ854qTAOTquXpxd1zT5wGHdRHFTRCCp6LpBw==
X-Received: by 2002:a17:902:9897:: with SMTP id
 s23mr129787021plp.47.1564743669298; 
 Fri, 02 Aug 2019 04:01:09 -0700 (PDT)
Received: from bobo.local0.net (193-116-68-11.tpgi.com.au. [193.116.68.11])
 by smtp.gmail.com with ESMTPSA id t96sm7377118pjb.1.2019.08.02.04.01.07
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 02 Aug 2019 04:01:08 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 38/44] powerpc/64s/exception: Add GEN_COMMON macro that
 uses INT_DEFINE parameters
Date: Fri,  2 Aug 2019 20:57:03 +1000
Message-Id: <20190802105709.27696-39-npiggin@gmail.com>
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

No generated code change.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 27 ++++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 10d706f67a53..9d52ba7800e9 100644
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
@@ -674,6 +686,10 @@ END_FTR_SECTION_NESTED(CPU_FTR_CFAR, CPU_FTR_CFAR, 66)
 	.endif
 .endm
 
+.macro GEN_COMMON name
+	INT_COMMON IVEC, IAREA, ISTACK, IKUAP, IRECONCILE, IDAR, IDSISR
+.endm
+
 /*
  * Restore all registers including H/SRR0/1 saved in a stack frame of a
  * standard exception.
@@ -1221,6 +1237,9 @@ INT_DEFINE_BEGIN(data_access)
 	IMASK=0
 	IKVM_REAL=1
 	IKVM_VIRT=0
+	IKUAP=1
+	IRECONCILE=1
+	ISTACK=1
 INT_DEFINE_END(data_access)
 
 EXC_REAL_BEGIN(data_access, 0x300, 0x80)
@@ -1231,13 +1250,7 @@ EXC_VIRT_BEGIN(data_access, 0x4300, 0x80)
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
2.22.0

