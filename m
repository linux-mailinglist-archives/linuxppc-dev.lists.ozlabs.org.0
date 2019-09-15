Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B16B2DB3
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Sep 2019 03:58:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46WCG65Wb5zF68m
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Sep 2019 11:58:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::444; helo=mail-pf1-x444.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="esbUrONI"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46WBc709GkzF5tg
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 15 Sep 2019 11:29:10 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id x127so20272925pfb.7
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Sep 2019 18:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FO3hyqMb5s7Gt7jb1c92jUZqi3W/33D2EhGDQrY/cII=;
 b=esbUrONI1r6coP1CrCf1ZGGxNccgtpUZiNwJ67LWP5Dvq+C0/FrZw8cMjU44IR0bhf
 ej9BBkjmPpuVWsf+onjmMq2vQVC/IwHGIXsxVyzpJINKEI0fjU97Y1HgCzLjKqR7Q/xP
 rZ4lLbmQZA9QAjinmrZbgY4esxoLxf/tb0wCWFfs3HENq4Ql2R3a89yC6jy/50N1VnP9
 BJ7X8VPfvqLLt/zEOfzuw4pltKxG19CORz1WknkxQLinCwx/V30wGes6p+H2zMZoWFg3
 4G5vXLzpo801thuV2rmu8x3B+KmuITea8MfiI34MZ1w9CCuTPgCQYnV0DNuIE6ddsfcm
 F9sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FO3hyqMb5s7Gt7jb1c92jUZqi3W/33D2EhGDQrY/cII=;
 b=kb9/vSyM7e5CIlnii5aozFf9EBiyREq6wKRMktSgIJxoqwgX75QZJiu9FzIcAeE4H9
 7JwKONGHqi/caBchPZxzpjofynFalJdqAxuhqxVthJ1m31x6EKHBYmc65bxZbMnbe/s6
 cblnj21UVGQhRQrwTWX1rKjs+g3HPnnvWmdOJmIsH4WTv0yFBQW0Jy66lCRP7UbWrodW
 CnJo5+2FpUub7Y/ovn7EFJW68nNx6gATBvCOtcf2VtcAbKJXlOmPzrKWmrYSud85jBtm
 j6zDMX/i2GGNTTWQnU3dezeFiHfjXXaLNeYMWTLctqnpfGJJpWzDUL7Xqtk/oc5QbFO+
 Lghg==
X-Gm-Message-State: APjAAAWDe778t/o/KX5UJH8zO1LlVSlM+K5s4EoVmmtSlCdITETs6LSG
 /jz2N8Vv58UFFBGiz5j3r7Y23kSn
X-Google-Smtp-Source: APXvYqwcJAaqwrQSalIlZAF/MsQxUrgD04Vvn3btHrvghzoAvM4x3rOzLntWVFE0WBBFchkDqX8OLQ==
X-Received: by 2002:a17:90a:a4c3:: with SMTP id
 l3mr13622565pjw.46.1568510948440; 
 Sat, 14 Sep 2019 18:29:08 -0700 (PDT)
Received: from bobo.local0.net ([203.63.189.78])
 by smtp.gmail.com with ESMTPSA id bt1sm6267043pjb.17.2019.09.14.18.29.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Sep 2019 18:29:08 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 15/27] powerpc/64s/exception: trim unused arguments from
 KVMTEST macro
Date: Sun, 15 Sep 2019 11:28:01 +1000
Message-Id: <20190915012813.29317-16-npiggin@gmail.com>
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

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index abf26db36427..9fa71d51ecf4 100644
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
@@ -437,7 +437,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_CFAR)
 DEFINE_FIXED_SYMBOL(\name\()_common_real)
 \name\()_common_real:
 	.if IKVM_REAL
-		KVMTEST \name IHSRR IVEC
+		KVMTEST \name
 	.endif
 
 	ld	r10,PACAKMSR(r13)	/* get MSR value for kernel */
@@ -460,7 +460,7 @@ DEFINE_FIXED_SYMBOL(\name\()_common_real)
 DEFINE_FIXED_SYMBOL(\name\()_common_virt)
 \name\()_common_virt:
 	.if IKVM_VIRT
-		KVMTEST \name IHSRR IVEC
+		KVMTEST \name
 1:
 	.endif
 	.endif /* IVIRT */
@@ -1595,7 +1595,7 @@ INT_DEFINE_END(system_call)
 	GET_PACA(r13)
 	std	r10,PACA_EXGEN+EX_R10(r13)
 	INTERRUPT_TO_KERNEL
-	KVMTEST system_call EXC_STD 0xc00 /* uses r10, branch to system_call_kvm */
+	KVMTEST system_call /* uses r10, branch to system_call_kvm */
 	mfctr	r9
 #else
 	mr	r9,r13
-- 
2.23.0

