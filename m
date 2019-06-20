Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1144C774
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 08:25:38 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45TsJG74R4zDqPS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 16:25:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::442; helo=mail-pf1-x442.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="YKNY7cNE"; 
 dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45TqmF6MPBzDqtp
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2019 15:16:13 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id j2so965470pfe.6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 22:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ELQkMwu1MKnG+V/ntb+ekgxa5Bge59WPDOZ619XHxvs=;
 b=YKNY7cNE/E+kwhqgrPO4NpAkyQ2QjPN+vdmckOCT2v9vIUfAl7hEJz6OWoWqkXKV4f
 f/yQqMTxGVOTWlN4X6C+kQ2D9vLCnXyt061GKNUK1gSSQgD9PGC2ynotSfA/yD/DhL7v
 IIS42XlXQ/sdMsuWmx/uOl0DDBnTXEolf/G8qyYUfXRJIjQioJsYJqFkLzJLMTVquGPV
 jFQ8dw5LlwenJ0QWcrR6/Wn+FiZR89KXjkjZk8+dn2glrlJ3FQGkVDlSd8vZYOGkSkAG
 tYQbCJJNFuMhS+Mtbx1J2pNrnMQgK1wdSWJstGL0RccvUoDVw1YarIKrDQq6p8vUBD6/
 ygJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ELQkMwu1MKnG+V/ntb+ekgxa5Bge59WPDOZ619XHxvs=;
 b=GSKWwWGEDqdxE0Qy0SNfNUPEpPyzhjgPjWmQ97V1v98cp6i4v/0sqVt+CDGz5JS+dl
 dnMF4kx+Glu0mri3Cw8ICv9DToE6AcKPXdXCMaSV1qVa9ZayiNWFwvex1ntGsHCZxsJJ
 7l9/8yz+ykKpMPPd3RtmZR+7UnKjTVY4ogLPzH4PaOb4go2C4lMRg0SxSo3mByCcRcDH
 Uv46Zee72rb2cZtW8eXsKmOjQ8OgbsLu/sHg3EAQANRAlZWlKw1pxFemYB63dAL6so0T
 o0S2SlHvu8Byg0GHhq3LeErILvSYZumrMLhDt+IBJ8xUPjT2yXQMF4lPqNEWbr+eSIZC
 9nVg==
X-Gm-Message-State: APjAAAVi2bbpGpwjJkIiA78UVkygQhp7OEtAFBhniv9Dnx5231Sd+1N2
 +QSXGZ7brYgHWfjpRHK6j35LyI9I
X-Google-Smtp-Source: APXvYqyvn1SjA6C5frZYH0kDFRhDi7OlXWxSjz7bNiZ2JPqeeDJ27mC5s7/gGaSV9vaMCLh+82Ep+A==
X-Received: by 2002:a63:8d4a:: with SMTP id z71mr681421pgd.346.1561007770256; 
 Wed, 19 Jun 2019 22:16:10 -0700 (PDT)
Received: from bobo.local0.net (193-116-72-140.tpgi.com.au. [193.116.72.140])
 by smtp.gmail.com with ESMTPSA id
 h12sm8235847pje.12.2019.06.19.22.16.08
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 19 Jun 2019 22:16:09 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 33/52] powerpc/64s/exception: move machine check windup
 in_mce handling
Date: Thu, 20 Jun 2019 15:14:40 +1000
Message-Id: <20190620051459.29573-34-npiggin@gmail.com>
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

Move in_mce decrement earlier before registers are restored (but
still after RI=0). This helps with later consolidation.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 804438669454..cf89d728720a 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1072,6 +1072,10 @@ EXC_COMMON_BEGIN(machine_check_common)
 	/* Clear MSR_RI before setting SRR0 and SRR1. */\
 	li	r9,0;					\
 	mtmsrd	r9,1;		/* Clear MSR_RI */	\
+	/* Decrement paca->in_mce now RI is clear. */	\
+	lhz	r12,PACA_IN_MCE(r13);			\
+	subi	r12,r12,1;				\
+	sth	r12,PACA_IN_MCE(r13);			\
 	/* Move original SRR0 and SRR1 into the respective regs */	\
 	ld	r9,_MSR(r1);				\
 	mtspr	SPRN_SRR1,r9;				\
@@ -1088,10 +1092,6 @@ EXC_COMMON_BEGIN(machine_check_common)
 	REST_GPR(10, r1);				\
 	ld	r11,_CCR(r1);				\
 	mtcr	r11;					\
-	/* Decrement paca->in_mce. */			\
-	lhz	r12,PACA_IN_MCE(r13);			\
-	subi	r12,r12,1;				\
-	sth	r12,PACA_IN_MCE(r13);			\
 	REST_GPR(11, r1);				\
 	REST_2GPRS(12, r1);				\
 	/* restore original r1. */			\
-- 
2.20.1

