Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7BAA82A5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2019 14:40:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Nk1R337FzDqLh
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2019 22:40:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::443; helo=mail-pf1-x443.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="HnMVX9by"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Nj3L6HddzDqZ1
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2019 21:56:46 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id q10so8039145pfl.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Sep 2019 04:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jvdH9+Dz+yK8JSHjkgm6YETnaX0skppJOQ/0P7cJsxE=;
 b=HnMVX9by9ynquwJJunO7mKRlRcVdgdXkHgFj9bFJMC1mo0uM8wH/hBYZQbKzxQkBuB
 XI47iLSsA6cUjoU1EAVyJClrdg3emg16+u729m8w9QItBesCYdbSce6YC8E3Jvg1RYqd
 haNy6e8GQZ3Zw7d/y8R3tbGH9Dp/jYbdJ6ouSMgpUpjxUrV2/wkaioRuKObWZQjtMCCy
 vXaZBnWRT4YKXpWltOxvLrKWBAh2AQ0lZkDAMfZODblPsOuv+u8Weps+g35yHqJ3ymJY
 89yMDRLqF9ErzfzUq9t4YIoNVDF1gnAJXZHfhEDVrZZUO7kCIoVltX0j3uB3/RglO+Rh
 rj2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jvdH9+Dz+yK8JSHjkgm6YETnaX0skppJOQ/0P7cJsxE=;
 b=kxbqjhdmdkSEo8VixVJd9Nib3HdlsHk4TMui+GoOq+t+gD3z5z8yXd1ojylk5xxhxx
 BzhJ0nZTqUtWbA3UsDF8nfGZLKmzjujxX2oYUfWWm2jpVV5ESBfJBlgW6W6y0BO5ZtpS
 aPn/b8xhvoWPS+3GTnFCKAxBWxC9GZrZOH7rY9peKpnVe7bAvxqYAZQw8xgdsK6nBWAE
 VHRrKJbwoc5yn5xqR3NUMicqzh+T/wsjmC+b+HUtLPgceS6/9OptHSQn7+VTdngM9QYl
 ry5PfXoO2oldVpXVKXtLDYtfpj5cJEjN4v8FZr4sL0EtFNFyhLK17y4Kjnc6BCAMQhvI
 85+Q==
X-Gm-Message-State: APjAAAUbIV8OZSREb0g2+BlqJXr+ZXEigAwkhLCOfEG5rA4vJ49a3JIc
 LiTptSTfWpzIArDMroy1TY3U5ud1
X-Google-Smtp-Source: APXvYqw5BqD++xhCPkac/PMfnjYvzeaujIY0ea2KqYlPzmTfIIxw4fXDIhLpkQkhf4UfBqI6dpbbjw==
X-Received: by 2002:a62:2d3:: with SMTP id 202mr32940427pfc.141.1567598204986; 
 Wed, 04 Sep 2019 04:56:44 -0700 (PDT)
Received: from bobo.local0.net ([203.63.189.78])
 by smtp.gmail.com with ESMTPSA id g18sm19554789pgm.9.2019.09.04.04.56.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2019 04:56:44 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 15/20] powerpc/64s/exception: trim unused arguments from
 KVMTEST macro
Date: Wed,  4 Sep 2019 21:55:30 +1000
Message-Id: <20190904115535.18559-16-npiggin@gmail.com>
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

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 2705fd84accd..1bca009cd495 100644
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
@@ -452,7 +452,7 @@ DEFINE_FIXED_SYMBOL(\name\()_common_real)
 DEFINE_FIXED_SYMBOL(\name\()_common_virt)
 \name\()_common_virt:
 	.if IKVM_VIRT
-		KVMTEST \name IHSRR IVEC
+		KVMTEST \name
 	.endif
 
 	.if ISET_RI
@@ -1587,7 +1587,7 @@ INT_DEFINE_END(system_call)
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

