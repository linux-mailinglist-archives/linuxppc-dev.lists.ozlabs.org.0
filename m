Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB675DFB7
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2019 10:25:15 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45dvLJ3zRlzDqFs
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2019 18:25:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="mFi9tm3K"; 
 dkim-atps=neutral
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45dtj05V6zzDqNZ
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jul 2019 17:56:20 +1000 (AEST)
Received: by mail-pl1-x62f.google.com with SMTP id b7so776878pls.6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Jul 2019 00:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YxVJ7sF+ALWIc2kdonCGyXBG5JYvZnmgV3XMGIhMBS8=;
 b=mFi9tm3KTIUsrrG5umzvpXdLl/mMPIg/PabLjjrln2YZjPco/UcmpqX7/X0jo33HLy
 086tI5Nn2dNQxyNhKRrb/vKymRg/+cRdkJnxUzxmPgdPMgg5wg8KfOGfZ2UN8o8OrnV0
 P6NV0ZmsZQUVmfjBGfVjdtdeFNyu2bOvhWJVVxiWdrXXDLDHwmJ1Ld2TAH+lLafjWGlt
 sc1EA/IYTNeT97TENO0iODQxs1vUt3PnqP7ZogyI2zIIIRR53vg1OsyaRgZSAONHPW0K
 zZcLx40WetyHiK/SyJUwizp/K8qXEaUpzbP/rcyca9zeqnZCNVWauaAiCRwiaqCzpwNo
 C2aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YxVJ7sF+ALWIc2kdonCGyXBG5JYvZnmgV3XMGIhMBS8=;
 b=HNnVH4NbX5PW9HnZ+xgvNhcybYjF1imHZaKGOR+7dxT5N+SWqcDyOAioIsf654FjzW
 JyomsfN+NKmH/7hzONhuQKZP5i3D/3jMkA/PrgvxEM7tLTNzmMz2npA6rg6Zuqx3tLah
 MzXfwd190r72SGvH/ljgJYst4338z5RDObCzW5KxLZJJyBXu2aCfDB0G9BxYEb2V4UWo
 kdyEVUxDPApjDpc9FbiZIT/AlgI4VmEV9AV7b3SkdataR3re9VvDJfmELi3jrG6WD7jS
 yd77SGnHgOC7oKqTEPAFwBAv7balVjxttl7lMQUGwzpK7xUrtqEz9mxmqa9j/GceIxBa
 utsA==
X-Gm-Message-State: APjAAAU8I5ITtqBVQYxDg/lFJGhDVN/e2pBnh1nD9nRkKWYWN4mXnr/2
 yME99/qlLCE3kXcJr76T1giSyBi7
X-Google-Smtp-Source: APXvYqzKoHv4eEetDqpyhKa5Qgs4V4H23Z9N78wnGxELHwr51Eky0c9DN2O/bLtxLDnrF1etRrFxGQ==
X-Received: by 2002:a17:902:704c:: with SMTP id
 h12mr41132984plt.214.1562140578245; 
 Wed, 03 Jul 2019 00:56:18 -0700 (PDT)
Received: from bobo.local0.net (193-116-88-34.tpgi.com.au. [193.116.88.34])
 by smtp.gmail.com with ESMTPSA id p68sm2955849pfb.80.2019.07.03.00.56.15
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 03 Jul 2019 00:56:17 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 14/14] powerpc/64s/exception: machine check improve labels and
 comments
Date: Wed,  3 Jul 2019 17:54:44 +1000
Message-Id: <20190703075444.19005-15-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190703075444.19005-1-npiggin@gmail.com>
References: <20190703075444.19005-1-npiggin@gmail.com>
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
Cc: Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Short forward and backward branches can be given number labels,
but larger significant divergences in code path a more readable
if they're given descriptive names.

Also adjusts a comment to account for guest delivery.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 8e16578cf932..0676a0f4c2d5 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1052,7 +1052,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_HVMODE | CPU_FTR_ARCH_206)
 	 */
 	lbz	r11,HSTATE_IN_GUEST(r13)
 	cmpwi	r11,0			/* Check if coming from guest */
-	bne	9f			/* continue if we are. */
+	bne	mce_deliver		/* continue if we are. */
 #endif
 
 	/*
@@ -1060,7 +1060,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_HVMODE | CPU_FTR_ARCH_206)
 	 * exception handler which will deliver the MC event to this kernel.
 	 */
 	andi.	r11,r12,MSR_PR		/* See if coming from user. */
-	bne	9f			/* continue in V mode if we are. */
+	bne	mce_deliver		/* continue in V mode if we are. */
 
 	/*
 	 * At this point we are coming from kernel context.
@@ -1088,8 +1088,14 @@ END_FTR_SECTION_IFSET(CPU_FTR_HVMODE | CPU_FTR_ARCH_206)
 	MACHINE_CHECK_HANDLER_WINDUP
 	RFI_TO_KERNEL
 
-9:
-	/* Deliver the machine check to host kernel in V mode. */
+mce_deliver:
+	/*
+	 * This is a host user or guest MCE. Restore all registers, then
+	 * run the "late" handler. For host user, this will run the
+	 * machine_check_exception handler in virtual mode like a normal
+	 * interrupt handler. For guest, this will trigger the KVM test
+	 * and branch to the KVM interrupt similarly to other interrupts.
+	 */
 BEGIN_FTR_SECTION
 	ld	r10,ORIG_GPR3(r1)
 	mtspr	SPRN_CFAR,r10
-- 
2.20.1

