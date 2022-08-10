Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E1D58EB72
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Aug 2022 13:44:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M2p4J73qPz3c41
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Aug 2022 21:44:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=L5bSi9j5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::22f; helo=mail-lj1-x22f.google.com; envelope-from=anders.roxell@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=L5bSi9j5;
	dkim-atps=neutral
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M2p3h1BLJz2ywl
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Aug 2022 21:43:25 +1000 (AEST)
Received: by mail-lj1-x22f.google.com with SMTP id v10so12322312ljh.9
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Aug 2022 04:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=KRr7duS52TODFaYDFxdheo3ZE1Z29DCImBOABo5du1w=;
        b=L5bSi9j5tjzNYxKY/Yjve3HQTu5putRB3hOcGDpbo8kEHFySaD8u2jNqhyhgxw5PSY
         ilAiLUNa/T5OFqIpIF/cwUJPb6RBzELpPa4RGLQmxCLAh+dKYfLiMrnrm5PntvEpG/4o
         rWyJe0i4PARwDTKX25pa6Pl3gXMtgxi4kx4nO0hQHQQVLPDNwu4bMCHROeTUqd+RX9GD
         xE21kcgTC6gSjguLlKzyylBIPTA1YL6t1Ir61sGELzAf8s7aXeCNobk/V6ftThHsHzC8
         m9hUj4f98RIUuIKIw1083ZqM9pO+DXYb2Vcq60xnMYchNP5yM/s0uBpTY+gEiHE9EBnK
         WhwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=KRr7duS52TODFaYDFxdheo3ZE1Z29DCImBOABo5du1w=;
        b=6swfhL7f3oP7eHlb+IiYMCEHXlAxp7R9b+nsjSB4//iDeTNrsaTwwufrBDEqYQWhUS
         Qn7a84MOu0/pikN4HZR59jYx3CnP2ueX+IJF1wyXH8S7XWh6LrmgAUeAj76RPrQnc1oY
         iCGEcZfrpbEbwFRe4KgJ7v1hqfOReFspBP7nibhpbuUmq/HhwoqDMHdYKTu/x1TgmVIL
         q4ctcfbuUln+Qk9o2nTc4wsQ0YwyD+aALrRN9LelFWh7HzLyq5Y8UHMrlvU8aanrDl0K
         6reffAgpOi/9I8REd3LijO7Rm9uBkEDr8Hwnum+OkGznHHIW5vEw94eovoMy2nM818Sq
         IWRg==
X-Gm-Message-State: ACgBeo3tyStvkiUsIXkSOQ2RomlDbrLPSHeKF9SoOHRr3eQv5fOkVCxp
	/T15MJVdvsya4vjD8Jwv6FS0yw==
X-Google-Smtp-Source: AA6agR58RoUom5V9F0K5f8O7nc43sAMKbqRT2vJAmqcRE8MN5wQHYZN/H6+z2EXmE7lIKsqk6gh2zA==
X-Received: by 2002:a2e:391d:0:b0:25e:7237:13ef with SMTP id g29-20020a2e391d000000b0025e723713efmr9176026lja.350.1660131801071;
        Wed, 10 Aug 2022 04:43:21 -0700 (PDT)
Received: from localhost (c-e429e555.07-21-73746f28.bbcust.telenor.se. [85.229.41.228])
        by smtp.gmail.com with ESMTPSA id a17-20020a056512375100b0048b969ac5cdsm319863lfs.5.2022.08.10.04.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Aug 2022 04:43:20 -0700 (PDT)
From: Anders Roxell <anders.roxell@linaro.org>
To: nathan@kernel.org,
	ndesaulniers@google.com,
	mpe@ellerman.id.au
Subject: [PATCHv3, resend] powerpc: mm: radix_tlb: rearrange the if-else block
Date: Wed, 10 Aug 2022 13:43:18 +0200
Message-Id: <20220810114318.3220630-1-anders.roxell@linaro.org>
X-Mailer: git-send-email 2.35.1
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
Cc: Anders Roxell <anders.roxell@linaro.org>, Arnd Bergmann <arnd@arndb.de>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Clang warns:

arch/powerpc/mm/book3s64/radix_tlb.c:1191:23: error: variable 'hstart' is uninitialized when used here [-Werror,-Wuninitialized]
                                __tlbiel_va_range(hstart, hend, pid,
                                                  ^~~~~~
arch/powerpc/mm/book3s64/radix_tlb.c:1175:23: note: initialize the variable 'hstart' to silence this warning
                unsigned long hstart, hend;
                                    ^
                                     = 0
arch/powerpc/mm/book3s64/radix_tlb.c:1191:31: error: variable 'hend' is uninitialized when used here [-Werror,-Wuninitialized]
                                __tlbiel_va_range(hstart, hend, pid,
                                                          ^~~~
arch/powerpc/mm/book3s64/radix_tlb.c:1175:29: note: initialize the variable 'hend' to silence this warning
                unsigned long hstart, hend;
                                          ^
                                           = 0
2 errors generated.

Rework the 'if (IS_ENABLE(CONFIG_TRANSPARENT_HUGEPAGE))' so hstart/hend
always gets initialized, this will silence the warnings. That will also
simplify the 'else' path. Clang is getting confused with these warnings,
but the warnings is a false-positive.

Suggested-by: Arnd Bergmann <arnd@arndb.de>
Suggested-by: Nathan Chancellor <nathan@kernel.org>
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
---
 arch/powerpc/mm/book3s64/radix_tlb.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3s64/radix_tlb.c
index 4e29b619578c..6d7a1ef723e6 100644
--- a/arch/powerpc/mm/book3s64/radix_tlb.c
+++ b/arch/powerpc/mm/book3s64/radix_tlb.c
@@ -1179,15 +1179,12 @@ static inline void __radix__flush_tlb_range(struct mm_struct *mm,
 			}
 		}
 	} else {
-		bool hflush = false;
+		bool hflush;
 		unsigned long hstart, hend;
 
-		if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE)) {
-			hstart = (start + PMD_SIZE - 1) & PMD_MASK;
-			hend = end & PMD_MASK;
-			if (hstart < hend)
-				hflush = true;
-		}
+		hstart = (start + PMD_SIZE - 1) & PMD_MASK;
+		hend = end & PMD_MASK;
+		hflush = IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) && hstart < hend;
 
 		if (type == FLUSH_TYPE_LOCAL) {
 			asm volatile("ptesync": : :"memory");
-- 
2.35.1

