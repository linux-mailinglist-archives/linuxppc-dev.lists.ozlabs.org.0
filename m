Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A332A4C78A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 08:36:11 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45TsXT0qTWzDr7H
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 16:36:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="k8Hw6Czh"; 
 dkim-atps=neutral
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45TqmR6H4tzDqvD
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2019 15:16:23 +1000 (AEST)
Received: by mail-pf1-x432.google.com with SMTP id r7so975525pfl.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 22:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8vfsNck3gMgNVOZqT+gmdKF6bekSqTZXQKANCTCCt4A=;
 b=k8Hw6CzhChLa+N/44qDuqQO3qghcWUdCkbz03oqxpqbNFTsgqbBdLTU7JawlVeSjWJ
 Kns+aBmqHXRc/JbbRRqoetyUfoOPVT4lWE2zdjK6+08m7g/XICPu6/5aSPmo08JfyoR/
 Ng/uETiJHrXTB9q0z0d7IWMDfnTsPxr07wa09uqktpfhy4FPhS4DiTW3k+mYeEYbOFri
 E6vQop5voeNjZzDNmxJnsuKnmMyHlMpbNwQ2VkZwblDBqAOB6UFbrCCnh07HlnS0iIW8
 0TFDK7uoDAj84yeS64eDX5wDX42MFw9UxcCYAHo9nu4lcYGLyWWu8BEQ5prMsbH159KM
 29Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8vfsNck3gMgNVOZqT+gmdKF6bekSqTZXQKANCTCCt4A=;
 b=QsBOd9ROtuc19ruQiDbWjjB9rgC7GxuZS0e4Kez3CdpKBB2AvSWHVQYo/1ovrzbiwD
 UNlH0CEymr15Bb0YCm+AyjZP+dVWT/6cAl5gEmmZrieE6nZA9VUCgIy0K780jyesIF+G
 J+9DI6MZA1qzAdFlvaVc1zraw2CktKU+RrBXm01eeeb7MW5Fb0v5XWSePmgOv1uhs0Jt
 +cTDUOZPUiWOFkE9PzoazrBjC1ogWbEyUexfCELZTaWYVCRdlA1WdmThDg/eGXOBv7UI
 esu95UZPJafVa4JpQ04jmDoGcqeyd3Fr9uR3oVk8dwVINjTNgQbbKRrcDWRMy2s3BaUA
 PuJg==
X-Gm-Message-State: APjAAAVQ1r2uqzRqcZXXUkD1YIz1za3dUvVG4Ko70aASPN/H3wQnhXzC
 /p1KS6pEoBKkeymqsRXL/lT7BubB
X-Google-Smtp-Source: APXvYqzhZZcdjVNaqpqSJBS/Ud9Wg2jK5/HaZAy44gJZzBP3zjX8LgvGnr0yezk9zVwwy4XlPH48Lw==
X-Received: by 2002:a65:6210:: with SMTP id d16mr11132474pgv.180.1561007781267; 
 Wed, 19 Jun 2019 22:16:21 -0700 (PDT)
Received: from bobo.local0.net (193-116-72-140.tpgi.com.au. [193.116.72.140])
 by smtp.gmail.com with ESMTPSA id
 h12sm8235847pje.12.2019.06.19.22.16.19
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 19 Jun 2019 22:16:20 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 38/52] powerpc/64s/exception: machine check use standard
 macros to save dar/dsisr
Date: Thu, 20 Jun 2019 15:14:45 +1000
Message-Id: <20190620051459.29573-39-npiggin@gmail.com>
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

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 16d5ea1c86bb..437f91179537 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1056,7 +1056,7 @@ BEGIN_FTR_SECTION
 	b	machine_check_common_early
 END_FTR_SECTION_IFCLR(CPU_FTR_HVMODE)
 machine_check_pSeries_0:
-	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXMC, 1, 0x200, 0, 0, 0
+	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXMC, 1, 0x200, 1, 1, 0
 	/*
 	 * MSR_RI is not enabled, because PACA_EXMC is being used, so a
 	 * nested machine check corrupts it. machine_check_common enables
@@ -1071,10 +1071,6 @@ EXC_COMMON_BEGIN(machine_check_common)
 	 * Machine check is different because we use a different
 	 * save area: PACA_EXMC instead of PACA_EXGEN.
 	 */
-	mfspr	r10,SPRN_DAR
-	std	r10,PACA_EXMC+EX_DAR(r13)
-	mfspr	r10,SPRN_DSISR
-	stw	r10,PACA_EXMC+EX_DSISR(r13)
 	EXCEPTION_COMMON(PACA_EXMC, 0x200)
 	FINISH_NAP
 	RECONCILE_IRQ_STATE(r10, r11)
-- 
2.20.1

