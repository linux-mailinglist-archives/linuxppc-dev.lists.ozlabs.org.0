Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2B116EDF9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Feb 2020 19:27:59 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48RnVM2WzBzDqXN
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 05:27:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62a;
 helo=mail-pl1-x62a.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=fJkmZLi7; dkim-atps=neutral
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48RmRg5kwjzDqNG
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2020 04:40:31 +1100 (AEDT)
Received: by mail-pl1-x62a.google.com with SMTP id p11so66973plq.10
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2020 09:40:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UQSRz/xZEyVRRRT9iOBoFQ1SQ8mL0i+EMXA1vCumoUc=;
 b=fJkmZLi7ZueqOkpwq4T77wePvmqQ3vu4pUkBowAS3re+bpcRU7rqFqVR8GeWW7EcdL
 MPlmLiRYODmiQ89vPteFDZo5yT/tCJAJbmW3JrnXUeRvukrkCz8DiK45wDfPNjXZ/f5G
 UxDPxOYKfBknIwYJtLpqsNOlb3MScsGU12jlMfbtsIbBNv4Q47SRPWDufpdUsek2qdu7
 w2lXAmYZTlElyP6CejqqONZ1NLGlIrsB0NdrCVQvnhkTdAz03VJ3OD+g1M6XyNRJ5mRM
 tBMzzWyVaNfXoiV1DQaPjAoSOTGMMarXn1qxTrYJMrE8l+dmRj9jP29NQX6JCAsUXTM4
 xFzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UQSRz/xZEyVRRRT9iOBoFQ1SQ8mL0i+EMXA1vCumoUc=;
 b=FirtaJd9LI7N6f3qx245Z8fwnhwQ5I6+mq6ukncgmYu4fmpvA5gDMjdzvfaJUGtvim
 GaQxEg+MwG12dJph7ZzQzJFGksQt4b2Q5CJr2/w2pWaTEicBA3C6LHSkGs3ppQ+CZ2kH
 9b0yeSqsx5FXrXMyWEdb9CKqCTv2yNSakqbHKiqaDubTlhOTwJlwuTdQmNACQCRKC85K
 Yplt0sRpKMtK01RJVni5y9HBEmxQB479zw8eH12eRIzT/3tVUWXKFNqetXI1aXidoKlS
 yc9Ebh5KHxkTDVE6oHbie/cPEY0+iRIArUM+G6BgMi5LF86Pf+FtLdAwZVxykpr5a9WS
 hUYw==
X-Gm-Message-State: APjAAAWT5S5eunCZtiveZICHXOtyANlAxx0KeixobtucwzdSAidjZeBQ
 ad3GyIu/GMq9UrnwZh/mtsOudP9h
X-Google-Smtp-Source: APXvYqwdy8SHwClLVUX1RO0LBMTFmHA8cPNFVv2zLuVH2i7RxeMyhDpEiAVVRNxnhoxTsU8Cs2p9Og==
X-Received: by 2002:a17:90a:c24c:: with SMTP id
 d12mr50467pjx.113.1582652427242; 
 Tue, 25 Feb 2020 09:40:27 -0800 (PST)
Received: from bobo.ibm.com ([61.68.187.74])
 by smtp.gmail.com with ESMTPSA id z63sm14791480pgd.12.2020.02.25.09.40.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2020 09:40:26 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 15/32] powerpc/64s/exception: trim unused arguments from
 KVMTEST macro
Date: Wed, 26 Feb 2020 03:35:24 +1000
Message-Id: <20200225173541.1549955-16-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200225173541.1549955-1-npiggin@gmail.com>
References: <20200225173541.1549955-1-npiggin@gmail.com>
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
Cc: Michal Suchanek <msuchanek@suse.de>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index feb563416abd..7e056488d42a 100644
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
@@ -1582,7 +1582,7 @@ INT_DEFINE_END(system_call)
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

