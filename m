Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4B4979AE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2019 14:42:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46D6kw6TLdzDqGN
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2019 22:42:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::443; helo=mail-pf1-x443.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="BmO8D+q0"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46D6Jv6HnMzDqpq
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2019 22:23:43 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id w26so1316847pfq.12
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2019 05:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=olh/92WI2ud9TNFRf4qFmsbO+B1GmX19vtNbzknNB9I=;
 b=BmO8D+q0w+r44Yy5qsI3QqKfAwYQF0CHzOy97Nw8RdPce2COD0IboYRf80LzIlsfbZ
 kMl+KwNQK1eWDoKUxdj1VCPkMKFyNETfFLHfmi8BrzpuSE7hozqgay7sYfLL63SBMjFP
 4vUP4t2GzkXZAPLIOlPLAwxolagM91Q97qAbuDw71oy2VVCvjje/nKni3AnFTY6psbfO
 i6Y0ZoYTSeS4+n4UMzIZSu+l55tOWcbXoXGhoviPm5ZOvxSeZUWKDA7bArvGCK+ZeRjY
 TCbwQM9sy4xkRAW2B9YGs/6VPxoqHsivV0NixzhgRekeKxRS9Ts7djNEAECxlAAO68m5
 93Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=olh/92WI2ud9TNFRf4qFmsbO+B1GmX19vtNbzknNB9I=;
 b=WCfja5j4OyiUuw+btVLEvCQfyxmUMRFm3++37cyMxZP/En9BfsGTiLRuczpi7kwDXi
 XZWHz9X9KcKxBuk9iMK10xUd1P2tDwQy1wcHLriTVU5tYggP2M+NrDhYp2PyU5kks/Fw
 k2NQyM+KCLY0MPIZYNpem1CABNoo/YKSzC1xzwOk5zIxTpmexwkbXl3OZNDRX0tS0One
 4Xu4kVOjcw70bmu8TpxBuoYkfPRdo/xt39LLzRmVpK+Ty8yh52V0aCWyzsOv48a8cI4m
 ygJckIaiod5L1B01rhJUND+17O8suDXcDjRHK7sykc2DxK1HiaUGLhWOVxnPIZM7Nndh
 pkNA==
X-Gm-Message-State: APjAAAWj66BdyKg+g3dfOLWxyzfUC7shcFtuc1edn4iMyXYdbk6bACJs
 1Jbe+jtYdw1pLcI/FX3w0aGhxlRZ
X-Google-Smtp-Source: APXvYqz6ZhgzjEvXIM6UCgpNyxfZsy4R7CzahhmEPiZihILS8FmQgY9j8b8M4M+FCr2iw6j2H+TcGg==
X-Received: by 2002:a62:d0:: with SMTP id 199mr35233959pfa.157.1566390221308; 
 Wed, 21 Aug 2019 05:23:41 -0700 (PDT)
Received: from bobo.local0.net ([193.114.104.176])
 by smtp.gmail.com with ESMTPSA id a3sm23657819pfc.70.2019.08.21.05.23.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2019 05:23:40 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 07/10] powerpc/64s/exception: trim unused arguments from
 KVMTEST macro
Date: Wed, 21 Aug 2019 22:23:12 +1000
Message-Id: <20190821122315.9535-8-npiggin@gmail.com>
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

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 14351e1b27df..a4ceb88c53c4 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -224,7 +224,7 @@ do_define_int n
 #define kvmppc_interrupt kvmppc_interrupt_pr
 #endif
 
-.macro KVMTEST name, hsrr, n
+.macro KVMTEST name
 	lbz	r10,HSTATE_IN_GUEST(r13)
 	cmpwi	r10,0
 	bne	\name\()_kvm
@@ -293,7 +293,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 .endm
 
 #else
-.macro KVMTEST name, hsrr, n
+.macro KVMTEST name
 .endm
 .macro GEN_KVM name
 .endm
@@ -440,7 +440,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_CFAR)
 DEFINE_FIXED_SYMBOL(\name\()_common_real)
 \name\()_common_real:
 	.if IKVM_REAL
-		KVMTEST \name IHSRR IVEC
+		KVMTEST \name
 	.endif
 
 	ld	r10,PACAKMSR(r13)	/* get MSR value for kernel */
@@ -455,7 +455,7 @@ DEFINE_FIXED_SYMBOL(\name\()_common_real)
 DEFINE_FIXED_SYMBOL(\name\()_common_virt)
 \name\()_common_virt:
 	.if IKVM_VIRT
-		KVMTEST \name IHSRR IVEC
+		KVMTEST \name
 	.endif
 
 	.if ISET_RI
@@ -1615,7 +1615,7 @@ INT_DEFINE_END(system_call)
 	GET_PACA(r13)
 	std	r10,PACA_EXGEN+EX_R10(r13)
 	INTERRUPT_TO_KERNEL
-	KVMTEST system_call EXC_STD 0xc00 /* uses r10, branch to system_call_kvm */
+	KVMTEST system_call /* uses r10, branch to system_call_kvm */
 	mfctr	r9
 #else
 	mr	r9,r13
-- 
2.22.0

