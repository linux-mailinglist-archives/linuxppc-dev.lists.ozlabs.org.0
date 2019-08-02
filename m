Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 698F77F6F5
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 14:35:56 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 460RTj1cYgzDqpK
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 22:35:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::643; helo=mail-pl1-x643.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="BKwt69zI"; 
 dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 460PNV59TXzDqxt
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Aug 2019 21:01:14 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id t14so33492570plr.11
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Aug 2019 04:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qcN4U/ylGuAtP2jSZROj6Z2gPYPM2pn3yGssof93kR4=;
 b=BKwt69zIEWGg/G5frQmKoyWtYn5RPuWxUOOfeU6iC95sQ/Al6TzOGPGa6kK6MbOzXZ
 3u+eEjC+dJFj+vn71XZJo1gcXYP7Q63EDS8AVXtiqcSG927cJj6UO4o08k+aIEKYmAR7
 +GtRR2txNOlC/Je4KZS3ZWsCvMtI5w+r4RBpmqaoe0CszrMEZVkVipccI42jAlVTwKOR
 fDuZtp/a7Kds3lZX5e8fVz7eeuX1nwsWR3uC+a/mEN10v3xV+cXwinnIHwe3+Hm2GkQ4
 frdPbwjFNd2vQStnjo5DwBopZXeJxcMzIixetiuFQC1HOFwwrUcL8RJD0kooKo2uH6uW
 5q3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qcN4U/ylGuAtP2jSZROj6Z2gPYPM2pn3yGssof93kR4=;
 b=nxsMvtZHsCR1FGCAMHcpxGXUblU15dNJ6htscUChKANEeXcRiaJSdlSWUxJTAKDFid
 Zk6rDG3PNutM1bG4BbhHjtUBbD3mmkeB1iT2GG3vs52zTaSXZujZjn4/kl8aRMEWUOAE
 22F/WaYEwLeoAg/oST1aUcDMDAzcHKdfWo2lSJOpqKDhXJF0aWvWMrPw4Rzc7nBHJZLq
 uJEI82o6Ia2MjYpgLLC9YmWLzWfmic31SEkEETyRjQfOmq2TdKaZxTzZ3MWUVWBD0SC9
 QAph7vvvxLTYdVEiSxLWjJpHbhPEWTJssLljx31avD5QLbVRMybBPg+Xdei8rXzV/u2q
 9iWQ==
X-Gm-Message-State: APjAAAU9TDjfbuvGt5KD5FBE3rsWcn4+FYi3nli1OHXP2wL7e16Gdg+P
 s+zCLUvOPcOd3ZeQSaGUaahf9w0hvfs=
X-Google-Smtp-Source: APXvYqykLwFbZDwB0IzTJ9cJGVPpww9SMfGkc8bHSf8N3JTb51b/fdDGIQw2SlTTkuYrO7M3pxNOhw==
X-Received: by 2002:a17:902:d81:: with SMTP id
 1mr136013950plv.323.1564743671425; 
 Fri, 02 Aug 2019 04:01:11 -0700 (PDT)
Received: from bobo.local0.net (193-116-68-11.tpgi.com.au. [193.116.68.11])
 by smtp.gmail.com with ESMTPSA id t96sm7377118pjb.1.2019.08.02.04.01.09
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 02 Aug 2019 04:01:11 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 39/44] powerpc/64s/exception: Add GEN_KVM macro that uses
 INT_DEFINE parameters
Date: Fri,  2 Aug 2019 20:57:04 +1000
Message-Id: <20190802105709.27696-40-npiggin@gmail.com>
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
 arch/powerpc/kernel/exceptions-64s.S | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 9d52ba7800e9..4e475e33b14a 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -204,6 +204,7 @@ END_FTR_SECTION_NESTED(ftr,ftr,943)
 #define ISET_RI		.L_ISET_RI_\name\()
 #define IEARLY		.L_IEARLY_\name\()
 #define IMASK		.L_IMASK_\name\()
+#define IKVM_SKIP	.L_IKVM_SKIP_\name\()
 #define IKVM_REAL	.L_IKVM_REAL_\name\()
 #define IKVM_VIRT	.L_IKVM_VIRT_\name\()
 #define ISTACK		.L_ISTACK_\name\()
@@ -243,6 +244,9 @@ do_define_int n
 	.ifndef IMASK
 		IMASK=0
 	.endif
+	.ifndef IKVM_SKIP
+		IKVM_SKIP=0
+	.endif
 	.ifndef IKVM_REAL
 		IKVM_REAL=0
 	.endif
@@ -265,6 +269,10 @@ do_define_int n
 	KVM_HANDLER \vec, \hsrr, \area, \skip
 .endm
 
+.macro GEN_KVM name
+	KVM_HANDLER IVEC, IHSRR, IAREA, IKVM_SKIP
+.endm
+
 #ifdef CONFIG_KVM_BOOK3S_64_HANDLER
 #ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
 /*
@@ -1235,6 +1243,7 @@ INT_DEFINE_BEGIN(data_access)
 	ISET_RI=1
 	IEARLY=0
 	IMASK=0
+	IKVM_SKIP=1
 	IKVM_REAL=1
 	IKVM_VIRT=0
 	IKUAP=1
@@ -1248,7 +1257,8 @@ EXC_REAL_END(data_access, 0x300, 0x80)
 EXC_VIRT_BEGIN(data_access, 0x4300, 0x80)
 	GEN_INT_ENTRY data_access, GEN_VIRT
 EXC_VIRT_END(data_access, 0x4300, 0x80)
-INT_KVM_HANDLER data_access, 0x300, EXC_STD, PACA_EXGEN, 1
+TRAMP_KVM_BEGIN(data_access_kvm)
+	GEN_KVM data_access
 EXC_COMMON_BEGIN(data_access_common)
 	GEN_COMMON data_access
 	ld	r4,_DAR(r1)
-- 
2.22.0

