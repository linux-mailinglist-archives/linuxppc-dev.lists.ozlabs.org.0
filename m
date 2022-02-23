Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E114C14EE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Feb 2022 15:00:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K3d3n1chjz3cVx
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Feb 2022 01:00:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=GymnIA83;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::233;
 helo=mail-lj1-x233.google.com; envelope-from=anders.roxell@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=GymnIA83; dkim-atps=neutral
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K3d1S6W1hz30QY
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Feb 2022 00:58:51 +1100 (AEDT)
Received: by mail-lj1-x233.google.com with SMTP id e8so16863820ljj.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Feb 2022 05:58:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TtmeV9bgxOIabhJpHOR897CD9xgb87UemODU6yGgV2U=;
 b=GymnIA83ywZadcnbrH4WXAA1AYMSMwQQFG+f6+MJGcGzXs93QyC+I3pkZAYZUY1t7n
 BB4H1PhCoHA3ERxhhsMdBWyONDAMvWvgnq8s1XgGDFMk/XFgO6POiisIUkVULMiiR28d
 L457MenKKJCMf59k6BkSgvmwgqFqc27/fA+obvrgeubI2hNPDP5drUQvxWtD3a2FINm1
 aX5NL8q3McFgAd3fuku73JiC0o/muPvfaOzg852LwuWz6Qn1TjH3hwkO70YTCYzGhj0H
 7a4g8JAUsH993rQyM3gjS5Slv40OhdGEud634eHKE81XX0ZC+Tq+m1r67d/6B0KrJaou
 AAuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TtmeV9bgxOIabhJpHOR897CD9xgb87UemODU6yGgV2U=;
 b=O4XIMfH6wWy4OujdbJuqFNP4sAzjt3gwJyMCIKRDAaE+YIAo8k2r8BFQJ0LBncHxf9
 gYYPhVuBxPGSwoO1xzjIsIzm/WU1PJ7JlLu5qrt1feYpzcgPrjWygoKcuoLSDkSLGfXn
 nCjWR872JNWTfmZ9AjRSLkmLeivb1ZI+XQ8Siv3BwJorcBFgSgq5wYjslWcgnl3+LGqd
 Y7+bG0Yc6kGDB4eQARN2Gdp1Ebt0BQyTXve06bJp9v9dC66TfD+SVKSij/qPoGQK+Jko
 qEKAd1FiO1S8Mc4XrGgq2dWOPO9lTcjzPj4VCdiDndrT4TFp4iksXQ9GuQWtSvo72DtI
 jK9g==
X-Gm-Message-State: AOAM530hi5bsZkmFKofjzYZwyrPsSRDa2w5Y2hN2fTASXhmNsKdAxJk7
 kdNxeHBckrioMTSOZyh4NOG0pQ==
X-Google-Smtp-Source: ABdhPJxdhGGNcfhWILNWBQG+bDluWfBg0UF4vCKHIstcbc31RJ6jCLB737+rgRuExlH3ou4RVu/I5w==
X-Received: by 2002:a05:651c:1597:b0:246:6331:c697 with SMTP id
 h23-20020a05651c159700b002466331c697mr696830ljq.265.1645624724041; 
 Wed, 23 Feb 2022 05:58:44 -0800 (PST)
Received: from localhost (c-9b28e555.07-21-73746f28.bbcust.telenor.se.
 [85.229.40.155])
 by smtp.gmail.com with ESMTPSA id w10sm1649505lfu.200.2022.02.23.05.58.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Feb 2022 05:58:43 -0800 (PST)
From: Anders Roxell <anders.roxell@linaro.org>
To: mpe@ellerman.id.au
Subject: [PATCH 1/3] powerpc: lib: sstep: fix 'sthcx' instruction
Date: Wed, 23 Feb 2022 14:58:18 +0100
Message-Id: <20220223135820.2252470-1-anders.roxell@linaro.org>
X-Mailer: git-send-email 2.34.1
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
Cc: Arnd Bergmann <arnd@arndb.de>, Anders Roxell <anders.roxell@linaro.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Looks like there been a copy paste mistake when added the instruction
'stbcx' twice and one was probably meant to be 'sthcx'.
Changing to 'sthcx' from 'stbcx'.

Cc: <stable@vger.kernel.org> # v4.13+
Fixes: 350779a29f11 ("powerpc: Handle most loads and stores in instruction emulation code")
Reported-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
---
 arch/powerpc/lib/sstep.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
index bd3734d5be89..d2d29243fa6d 100644
--- a/arch/powerpc/lib/sstep.c
+++ b/arch/powerpc/lib/sstep.c
@@ -3389,7 +3389,7 @@ int emulate_loadstore(struct pt_regs *regs, struct instruction_op *op)
 			__put_user_asmx(op->val, ea, err, "stbcx.", cr);
 			break;
 		case 2:
-			__put_user_asmx(op->val, ea, err, "stbcx.", cr);
+			__put_user_asmx(op->val, ea, err, "sthcx.", cr);
 			break;
 #endif
 		case 4:
-- 
2.34.1

