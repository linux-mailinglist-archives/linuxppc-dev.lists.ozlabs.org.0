Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA39A81B9
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2019 14:05:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46NjFG4xFrzDqbg
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2019 22:05:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::642; helo=mail-pl1-x642.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Kqk7C1LP"; 
 dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Nj2p440BzDqm9
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2019 21:56:18 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id 4so9470114pld.10
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Sep 2019 04:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eWccq/T6rB0GT1+ByER+1MfXJNZIyW0dWp1/35C+S0Q=;
 b=Kqk7C1LPVFXRd0DBt6SWxM2IO3rLQ59Ka2/RbpbW5fPfv+YSIlvSeWzgYmqf+nE4NE
 K/oB7FcF7jToRZy60LUJvq5wyw408YMhBT+nj35OWmih81ZYtzbIzcpNydrvVUpw5s6x
 86lt8Vj5FfqjYzLzYT3kgfeAIPcTmW9gvJtjjvHFmve9Un5q0HCWaP9ZZEEjM5UHnunc
 KquQQsS34ehbvadV/AZRVKEjXd89ojtQRefUc1XpqKMt+yTJqTQV/k4Yg4eZadIgSaGN
 QPD1eZnJ+2TqLoUhvrdbculM3nFQ3jaAqc5ikePmleheCN7IpLVXx9w5VwvDMm4L62Eh
 zk+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eWccq/T6rB0GT1+ByER+1MfXJNZIyW0dWp1/35C+S0Q=;
 b=UjVryEiGSUT1wX6fFIaOpQsgf+dNvirMj40p7st4VSIFJ+9djg+H7wFIswfW0yarm2
 tL0+weIG8ZuvhRK5o6ry/Q8Y8xIeiOWRzwpfoV0wlRbghqd9NME0FprelpoXhpxdQXza
 KZw/0uycjiRxy9nTzy7ZIrF9iz+PjIS49TNu7Xqy5QMeuXT0ftXKGoRpjIRMbax031uI
 w8JDzMxtx99bmTC5/PlpD56LR06yXr4cNg+If7FwlF8xUdRwvz3eTDjKLLZ68rqPpWR+
 w94OSXA0jnyB5IxnZftUIESTJKf4tDisdgeqt/FhCwK5w0sv4Jf7fw3RP1YpxgXHl2yw
 ZdJw==
X-Gm-Message-State: APjAAAVY9slhfgjYcL5O3pvj+EvSXuaC2/zDUDHolgRtyfmNJCIwZLYL
 PYES1F1+v457KOgsN6g+sbtdZYHW
X-Google-Smtp-Source: APXvYqxbLoD80SJBSS6U8TB8erE6td+/Y457ZiNTP3XuztKLIV/t6h/eEfCxpxIPcJKDkVdiidk7lg==
X-Received: by 2002:a17:902:461:: with SMTP id
 88mr38256862ple.296.1567598175590; 
 Wed, 04 Sep 2019 04:56:15 -0700 (PDT)
Received: from bobo.local0.net ([203.63.189.78])
 by smtp.gmail.com with ESMTPSA id g18sm19554789pgm.9.2019.09.04.04.56.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2019 04:56:15 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 03/20] powerpc/64s/exception: Add GEN_KVM macro that uses
 INT_DEFINE parameters
Date: Wed,  4 Sep 2019 21:55:18 +1000
Message-Id: <20190904115535.18559-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190904115535.18559-1-npiggin@gmail.com>
References: <20190904115535.18559-1-npiggin@gmail.com>
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
index 591ae2a73e18..0e39e98ef719 100644
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
@@ -1226,6 +1234,7 @@ INT_DEFINE_BEGIN(data_access)
 	IVEC=0x300
 	IDAR=1
 	IDSISR=1
+	IKVM_SKIP=1
 	IKVM_REAL=1
 INT_DEFINE_END(data_access)
 
@@ -1235,7 +1244,8 @@ EXC_REAL_END(data_access, 0x300, 0x80)
 EXC_VIRT_BEGIN(data_access, 0x4300, 0x80)
 	GEN_INT_ENTRY data_access, virt=1
 EXC_VIRT_END(data_access, 0x4300, 0x80)
-INT_KVM_HANDLER data_access, 0x300, EXC_STD, PACA_EXGEN, 1
+TRAMP_KVM_BEGIN(data_access_kvm)
+	GEN_KVM data_access
 EXC_COMMON_BEGIN(data_access_common)
 	GEN_COMMON data_access
 	ld	r4,_DAR(r1)
-- 
2.22.0

