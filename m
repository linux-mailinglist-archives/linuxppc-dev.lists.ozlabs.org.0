Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 837AD3715A3
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 May 2021 15:04:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FYjqq3s2vz3c6R
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 May 2021 23:04:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=R7fgQLgf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::629;
 helo=mail-pl1-x629.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=R7fgQLgf; dkim-atps=neutral
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FYjnd2DFRz2yYm
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 May 2021 23:03:01 +1000 (AEST)
Received: by mail-pl1-x629.google.com with SMTP id s20so2727625plr.13
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 May 2021 06:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jIrJw0Rl0ogosE0eD+GUDs9uAC2wEGhdBNqrMjsOmcY=;
 b=R7fgQLgftiUqzO9ZfnxvTRPErgW8Tznfc/P5GB+BBQ8WbVvmNJfpfD8HRzwjFLrG8K
 jd3itbn0L99buVvaW3eKidkJAZ35LcAHzfUqg4BYf6h3U2exk9v3kI/dUoXLnPwLhzmt
 xxem+Qm6BNTBIopvHUh7EBKQ9zt0O2Pong1+LeR4yyQjcjO3HPaPv8Ktm9K0Z881Gixa
 IrBgS+zeAdBc5igquJrmUl1S2BdVodOEdW8I+JzNQvT5xGTcTaXIwyNRmwJM+CZaPqHH
 ZoDxXqjevcM7c2lxOJ48VjiYjCaW13eEbXrEuFwEVIM6uPoU2amSZGEmaBXpEus+5Egs
 pf2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jIrJw0Rl0ogosE0eD+GUDs9uAC2wEGhdBNqrMjsOmcY=;
 b=ovhiyq3lWCTp8fYx3uGAIJfKgC4ouSVcBGT0f1st2w9bBln7AEu6pnHFO+jEMoGSdQ
 syPGdw6a/N4f07vBFu96kdyLM+0+KFPR8X1vcqb7l497wHVMC4Je0ayHjXtI2dfl2ji/
 nl4ZovcAkZQwlWmTu7MlQ/H9E094iSeD8rXA/pHLWZI+OZIHVKAh1aT6RgRuXN3FeU8E
 SZ2u3RzEYUfLgghTvziQaa23XFVoWrfTBamKEP60gsfTsfaZiIpOUrdfEPdfqdS2JbA7
 /DNqlLz4RfWughcfhYrDCTX63bhdzIdAgdhoMJxXukHn/s6mtS/iOpPdokNwfkNM/hAE
 NJKA==
X-Gm-Message-State: AOAM531b+V9UAkOLi988ZOKXqSd/Na+EN3QF2CTxNMmjrOcn2INKVlzd
 L5X7F2SjlJMX0nnwoUJWcEaOmfdCg5g=
X-Google-Smtp-Source: ABdhPJzRAMbqOtvuQX1VIogrwnHmAWavfSe/HVDux8bnxfTigLhLygwhDEtEhFKJfZRO3lQEtVYkzA==
X-Received: by 2002:a17:90b:17d2:: with SMTP id
 me18mr10239615pjb.22.1620046978731; 
 Mon, 03 May 2021 06:02:58 -0700 (PDT)
Received: from bobo.ibm.com ([61.68.127.20])
 by smtp.gmail.com with ESMTPSA id f1sm18069053pjt.50.2021.05.03.06.02.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 06:02:57 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 4/4] powerpc/powernv: Remove POWER9 PVR version check for
 entry and uaccess flushes
Date: Mon,  3 May 2021 23:02:43 +1000
Message-Id: <20210503130243.891868-5-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210503130243.891868-1-npiggin@gmail.com>
References: <20210503130243.891868-1-npiggin@gmail.com>
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

These aren't necessarily POWER9 only, and it's not to say some new
vulnerability may not get discovered on other processors for which
we would like the flexibility of having the workaround enabled by
firmware.

Remove the restriction that they only apply to POWER9.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/platforms/powernv/setup.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/setup.c b/arch/powerpc/platforms/powernv/setup.c
index a8db3f153063..6ec67223f8c7 100644
--- a/arch/powerpc/platforms/powernv/setup.c
+++ b/arch/powerpc/platforms/powernv/setup.c
@@ -122,15 +122,6 @@ static void pnv_setup_security_mitigations(void)
 			type = L1D_FLUSH_ORI;
 	}
 
-	/*
-	 * If we are non-Power9 bare metal, we don't need to flush on kernel
-	 * entry or after user access: they fix a P9 specific vulnerability.
-	 */
-	if (!pvr_version_is(PVR_POWER9)) {
-		security_ftr_clear(SEC_FTR_L1D_FLUSH_ENTRY);
-		security_ftr_clear(SEC_FTR_L1D_FLUSH_UACCESS);
-	}
-
 	enable = security_ftr_enabled(SEC_FTR_FAVOUR_SECURITY) && \
 		 (security_ftr_enabled(SEC_FTR_L1D_FLUSH_PR)   || \
 		  security_ftr_enabled(SEC_FTR_L1D_FLUSH_HV));
-- 
2.23.0

