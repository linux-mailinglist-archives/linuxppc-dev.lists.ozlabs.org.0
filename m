Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9325DF4E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2019 10:08:23 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45dtyr2Q1fzDqTR
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2019 18:08:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="oTY04i6I"; 
 dkim-atps=neutral
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45dthb23H8zDqQQ
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jul 2019 17:55:59 +1000 (AEST)
Received: by mail-pf1-x436.google.com with SMTP id y15so830063pfn.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Jul 2019 00:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q5nzEZzoD8r4bBmmvSx3fN5G38mG8QhyHILVVojissE=;
 b=oTY04i6ItiXYlzkQsyT+mPp/DaCiDiU7HfnXHY5AQRk+nVIQ2d3EpBq8KRsNN+fDma
 rbcXXB75VFM6D7Zzih70hacFAQvNJ9BvPfZXCz79yqdzFI9qxWNj48oKXfx87C0hysQN
 Eo8IfNxpk6HDFWFgpiHZsIBChjtPQP9x+tDUZ5KuYm5l1+5UZvZ5MYWMabGp7a5GTMJC
 yGpRZQRUSN68ZIDaTykI6vfZl0stbNY8g0f5p3BgxUDqSXkhF3W7zkoOfrGjAfviha4j
 sxKEbZRTPnv5FifBG1ImbEU01ettgCcbzU02hJl9Bb+8IOwctnoXQmZSKeVdwetdIbC5
 PEhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q5nzEZzoD8r4bBmmvSx3fN5G38mG8QhyHILVVojissE=;
 b=beGP3dBjpNQadfePtDEiMRZrBru3hYLbZ0arCg8M1/yluqCTyEhq0GnX3DP7EJQFlj
 1gzGbr+4EOiCnIhx9NwyjMnUVkssM3oVkj05fbMmItI8EUHhcuxpkG1O0J//xOV8Jcdf
 OYfU3VPdDJPFJr06nzdfoi73ZhVV68EfDxt/4K2GEvvuZZyRkb9iQ1aAVw9ibfxAXbGX
 cmsOeECEQ/Q2AU9s068vr2t/J58k89HgR96k8/6s2n2Dbjwr86wzHATFGSex9I4b0pbu
 cjjpKYxYTrC4nz2nXLPRmZe2Fw+fig0ByQeBX6/NwxqGUOr6H0Tqrl17KVp1iV5ixUWr
 UECA==
X-Gm-Message-State: APjAAAUwOvIvKE3BGKeKioHIy/zSZbUOdMSE+F35w3aKDBwjSHgyCKnM
 YgVFvEmECXmyJt5baV44sBE+IqeN
X-Google-Smtp-Source: APXvYqxJFAOJlR55il4Itt1GDshtFCSEr57MGBBEvlMHi6Hdr8eNK5b12YVqc3kwGpuemTm8dV734g==
X-Received: by 2002:a65:538d:: with SMTP id x13mr35825390pgq.190.1562140556152; 
 Wed, 03 Jul 2019 00:55:56 -0700 (PDT)
Received: from bobo.local0.net (193-116-88-34.tpgi.com.au. [193.116.88.34])
 by smtp.gmail.com with ESMTPSA id p68sm2955849pfb.80.2019.07.03.00.55.53
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 03 Jul 2019 00:55:55 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 06/14] powerpc/64s/exception: machine check remove
 machine_check_pSeries_0 branch
Date: Wed,  3 Jul 2019 17:54:36 +1000
Message-Id: <20190703075444.19005-7-npiggin@gmail.com>
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

This label has only one caller, so unwind the branch and move it
inline. The location of the comment is adjusted to match similar
one in system reset.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index a69ceb28cf4c..54ca2b189d43 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1014,20 +1014,11 @@ END_FTR_SECTION_IFSET(CPU_FTR_HVMODE)
 	b	1b
 	b	.	/* prevent speculative execution */
 
-TRAMP_REAL_BEGIN(machine_check_pSeries)
-	.globl machine_check_fwnmi
-machine_check_fwnmi:
+#ifdef CONFIG_PPC_PSERIES
+TRAMP_REAL_BEGIN(machine_check_fwnmi)
 	EXCEPTION_PROLOG_0 PACA_EXMC
 	b	machine_check_common_early
-
-machine_check_pSeries_0:
-	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXMC, 1, 0x200, 1, 1, 0
-	/*
-	 * MSR_RI is not enabled, because PACA_EXMC is being used, so a
-	 * nested machine check corrupts it. machine_check_common enables
-	 * MSR_RI.
-	 */
-	EXCEPTION_PROLOG_2_REAL machine_check_common, EXC_STD, 0
+#endif
 
 TRAMP_KVM_SKIP(PACA_EXMC, 0x200)
 
@@ -1197,7 +1188,13 @@ ALT_FTR_SECTION_END_IFSET(CPU_FTR_HVMODE)
 	/* Deliver the machine check to host kernel in V mode. */
 	MACHINE_CHECK_HANDLER_WINDUP
 	EXCEPTION_PROLOG_0 PACA_EXMC
-	b	machine_check_pSeries_0
+	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXMC, 1, 0x200, 1, 1, 0
+	EXCEPTION_PROLOG_2_REAL machine_check_common, EXC_STD, 0
+	/*
+	 * MSR_RI is not enabled, because PACA_EXMC is being used, so a
+	 * nested machine check corrupts it. machine_check_common enables
+	 * MSR_RI.
+	 */
 
 EXC_COMMON_BEGIN(unrecover_mce)
 	/* Invoke machine_check_exception to print MCE event and panic. */
-- 
2.20.1

