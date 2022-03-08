Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 682AA4D19B5
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Mar 2022 14:55:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KCcKK22kFz3dNn
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Mar 2022 00:55:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ZSa+nnNe;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::529;
 helo=mail-pg1-x529.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=ZSa+nnNe; dkim-atps=neutral
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KCcDf3Pb1z3bY3
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Mar 2022 00:51:14 +1100 (AEDT)
Received: by mail-pg1-x529.google.com with SMTP id 6so11982766pgg.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 08 Mar 2022 05:51:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6BLfT+MJAdpHuDc2kVjGEp2T811PVvNDuubyKAAzwpY=;
 b=ZSa+nnNeEfn+EU6twOPutRePn2gvusYomGbncOX1o1VvU0qptAK+YfRsorQzY6+5vK
 6IpwnLQV/tgcWQlIsq7B1Uvj8uZR7+vJvi89w7WaOW5iAKbSZjgPFUmIQdRe8bzhN2Iv
 eGNQGrh7EWv8Z37JdXZeHEHHU1yLFbAoc2R3My+owtyiDxhIQjSAQzeFUOdq5iuyzKfB
 MyMAgNg/N6KaAtZpvKR8aPz+tTuWct9Bg/D0xkK+LjRRguJssaMSeS5FpVe6rBRtC9CQ
 a528JkIEnbaME0zyZr7alxJ9bN4o+nkVIs3KUh9fmIQkHw55buczMagm8AM2Ntq92+Fm
 0e+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6BLfT+MJAdpHuDc2kVjGEp2T811PVvNDuubyKAAzwpY=;
 b=wvB+IKkpmCpMbXSvEsGaDXKBcHwaB/hAKYcKnOn7Ixnp81/FXAksjZZtpKyzpQFGXj
 a0iFoxFN0QRTklB1m7WjKIxVh6kOALp+LTQyLxHFX5EbL0QwA5hPrsUxrJkTL2DDN54F
 mI1kgyunO3YxJZYDA8PBP/ZNlpd3zcZfuGPfRwgyT+fzFFGpke6EJshE087kWiMPR8a9
 Xh09zC36CLtwDyMo45zHI3d6Clq2SiAFUMYaYif1KoYTHf6nfXse5LidpnzCCFokO2vi
 U4LhU3D3M3cocucnLOWt0ploIN1cGgxzy/46pW0o1FoVCSPNuHZIhtw5FEvCHoAUUE/+
 OHDA==
X-Gm-Message-State: AOAM5327v5LJ/Ueq7iZ8/jGFjUPxM2ARdTGhI1riq7xEVCuSIamh/fwf
 Ds2/f9acbhxcYbsE9/Lyiz8el5jWU8A=
X-Google-Smtp-Source: ABdhPJz2F6oxSjellcPlopmwRWO79r7cQG+PsYc8HnJVnxZ/+8BMC398LtwAkra9syaWLtBtKhMMYA==
X-Received: by 2002:a05:6a02:106:b0:36c:96dd:8c17 with SMTP id
 bg6-20020a056a02010600b0036c96dd8c17mr14509405pgb.190.1646747473377; 
 Tue, 08 Mar 2022 05:51:13 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (61-68-211-196.tpgi.com.au. [61.68.211.196])
 by smtp.gmail.com with ESMTPSA id
 q14-20020a056a00150e00b004f741b5c071sm541737pfu.86.2022.03.08.05.51.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 05:51:13 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 06/14] powerpc/rtas: Load rtas entry MSR explicitly
Date: Tue,  8 Mar 2022 23:50:39 +1000
Message-Id: <20220308135047.478297-7-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20220308135047.478297-1-npiggin@gmail.com>
References: <20220308135047.478297-1-npiggin@gmail.com>
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
Cc: Laurent Dufour <ldufour@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Rather than adjust the current MSR value to find the rtas entry
MSR on 64-bit, load the explicit value we want as 32-bit does.

This prevents some facilities (e.g., VEC and VSX) from being left
enabled which doesn't seem to cause a problem but it's more
consistent to always use the same MSR and minimise facilities
enabled.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/rtas_entry.S | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/arch/powerpc/kernel/rtas_entry.S b/arch/powerpc/kernel/rtas_entry.S
index 7b93687b9a10..08eb731f08b8 100644
--- a/arch/powerpc/kernel/rtas_entry.S
+++ b/arch/powerpc/kernel/rtas_entry.S
@@ -99,14 +99,7 @@ _GLOBAL(enter_rtas)
 	clrldi	r4,r4,2			/* convert to realmode address */
 	mtlr	r4
 
-	li	r0,0
-	ori	r0,r0,MSR_EE|MSR_SE|MSR_BE|MSR_RI
-	andc	r0,r6,r0
-
-	li	r9,1
-	rldicr	r9,r9,MSR_SF_LG,(63-MSR_SF_LG)
-	ori	r9,r9,MSR_IR|MSR_DR|MSR_FE0|MSR_FE1|MSR_FP|MSR_RI|MSR_LE
-	andc	r6,r0,r9
+	LOAD_REG_IMMEDIATE(r6, MSR_ME)
 
 __enter_rtas:
 	LOAD_REG_ADDR(r4, rtas)
-- 
2.23.0

