Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 755EF4C76B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 08:21:28 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45TsCT3XDhzDr2h
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 16:21:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::544; helo=mail-pg1-x544.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="kQNtoi0K"; 
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Tqm7720mzDqwF
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2019 15:16:07 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id n2so910034pgp.11
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 22:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=t03VEl204PFNpttCp6vT/1z39lIzW+zNGEa58HI4nqE=;
 b=kQNtoi0KrAf6AN+tUPrMKPBx2C8Z2YEAnCLG4WpoB1EBs0YsrdGE8VZ3DWgCeTDc6R
 vc1oV1qF2xlvjQy3V5rJaABMF1tt+eb4hopTEGGfFwr35Wu2IWiRln6NOuKNTDEmiJnA
 fOnobSlh8EqwPSsIKqgS3s1r92u29I/SBFn9feB26Sd93vrHhdd1GoN8COCx3jc2TIJ+
 t7g/z5gNdo6qfF8Y0JjDB8O+9pDEMDDORutj4NL9F7Ayc9MI7MdSIW8blfKpSljOtxWH
 ECJjMYO79IAoBYvkVMPYxyvHAJW6L4g7HOc9bi0zjKh/a9vQIT1C811bb+01Lkf6M8eO
 2CkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=t03VEl204PFNpttCp6vT/1z39lIzW+zNGEa58HI4nqE=;
 b=bBEo1v/yOnZIm88KacgjxjKcgJ3LjKrKMEa0zzzwCgkl0nGYsr1G4VVer417jaKsSz
 SodeNpfxhHIiPdk3beKn7zKQslKj16ULcGJOdQ6BYGTl0zZPbMr2H9pzBrfSwHd1VRUS
 txpIlEYpDEl+wc/IhqjxaHg2tp4ulsWzRLQLOMzDKaQG+0lZKsy9/37DeLqDPe+pIie0
 IHScduj4SX66DkfCSFqe4DIMM7OND2V5pNPtLG6OaCgF2goBWGYmhvntaG59wr++WUxx
 r7ixqtV/pvUqz+TVh+3kjw8IN31xAtODTUiMOOsYL0u7/PW1ymjJxtJCvpYi/s4nOUzd
 YwgQ==
X-Gm-Message-State: APjAAAXbwY3nHoNlJN1QluZBd5wIy2BlYGa6Tw7q7gdWvKWr/gAh7xZo
 WSsfB1EDI1Ay29MmJ8xpGpepI2Fk
X-Google-Smtp-Source: APXvYqx2TESYJnT/6TSVq4wdJgGsOVP3XZ609js8nbqfpUVXsmEQUDvOorEAPhNefUdtZAG7l5LQQQ==
X-Received: by 2002:aa7:92d2:: with SMTP id k18mr29658614pfa.153.1561007765886; 
 Wed, 19 Jun 2019 22:16:05 -0700 (PDT)
Received: from bobo.local0.net (193-116-72-140.tpgi.com.au. [193.116.72.140])
 by smtp.gmail.com with ESMTPSA id
 h12sm8235847pje.12.2019.06.19.22.16.04
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 19 Jun 2019 22:16:05 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 31/52] powerpc/64s/exception: mtmsrd L=1 cleanup
Date: Thu, 20 Jun 2019 15:14:38 +1000
Message-Id: <20190620051459.29573-32-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190620051459.29573-1-npiggin@gmail.com>
References: <20190620051459.29573-1-npiggin@gmail.com>
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

All supported 64s CPUs support mtmsrd L=1 instruction, so a cleanup
can be made in sreset and mce handlers.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index f582ae30f3f7..539bb1b83d90 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -887,11 +887,8 @@ EXC_COMMON_BEGIN(system_reset_common)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	system_reset_exception
 
-	/* This (and MCE) can be simplified with mtmsrd L=1 */
 	/* Clear MSR_RI before setting SRR0 and SRR1. */
-	li	r0,MSR_RI
-	mfmsr	r9
-	andc	r9,r9,r0
+	li	r9,0
 	mtmsrd	r9,1
 
 	/*
@@ -1073,9 +1070,7 @@ EXC_COMMON_BEGIN(machine_check_common)
 
 #define MACHINE_CHECK_HANDLER_WINDUP			\
 	/* Clear MSR_RI before setting SRR0 and SRR1. */\
-	li	r0,MSR_RI;				\
-	mfmsr	r9;		/* get MSR value */	\
-	andc	r9,r9,r0;				\
+	li	r9,0;					\
 	mtmsrd	r9,1;		/* Clear MSR_RI */	\
 	/* Move original SRR0 and SRR1 into the respective regs */	\
 	ld	r9,_MSR(r1);				\
-- 
2.20.1

