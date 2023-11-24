Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A6DFB7F85B7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Nov 2023 22:59:31 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=ZLzvQp68;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ScTR54Nlwz3vdw
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Nov 2023 08:59:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=ZLzvQp68;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amarulasolutions.com (client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com; envelope-from=dario.binacchi@amarulasolutions.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sc9XM3NCxz3cT7
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Nov 2023 21:02:57 +1100 (AEDT)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-54acdd65c88so979183a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Nov 2023 02:02:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1700820165; x=1701424965; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5csYTmQGy3z4bAN0r6APXLt4Snp34nfDUTEQWBMPna8=;
        b=ZLzvQp68gHJ70XZemPpnY3JFGyafX9IiljWGaAEBe7MTroHcknQkVcHiYisFnvbkQS
         MZFay6WsD4yX8O0WHI75AR5vBjs19fy9uSCfrqasjHosee4cvMVniQS8NbPJTrcXmibN
         70xvIk2yY71iz+33LzCwwceYnmdRu8Fxbd1Zo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700820165; x=1701424965;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5csYTmQGy3z4bAN0r6APXLt4Snp34nfDUTEQWBMPna8=;
        b=fFGDutu6cvRoOE6xnjKb08Kqn53l7Wm5msPSp88gYg+9ikQC2yRQDAUxFEP9mn4Vmd
         YXhUG5BY5kwXpyI+XXxo8nHtzYB+0Kmpn696eVdOaCDkmH/8pwEiaHTtRb/+ZXCBsY4O
         AlfSXf7qDJQWmi5pNynmLSzTSE3iYjis2aSLFYvB8dp5ihivGxXivMhCgVFt6AxLMCQz
         g7VfbaE0oK1YpmMfMfS1+ATU6sFKE6+Oi864AtKJzq7TH5EQ4sXce5CeO5dIFX9ZvOAF
         /S4ooE94lTk97+ya+xv4G0dd2Q3KWkTRAJh11FChu1YDTNf4YsW/Mz2i9dXAH6gQzlJW
         eC2Q==
X-Gm-Message-State: AOJu0YyzvXJlYMMpWj0d2j+8fP4pMPZ2D35DrxIFJLuzvd2j69TiG++V
	f1dLpDAvox0U5RpNzG2q2cCSEw==
X-Google-Smtp-Source: AGHT+IEQhr8vTHKYV1CC4+1sE3VpHU6n5sVo3sIi2W3tqIz7X8brK06exgxjIqL9O1SqVQ9+tr1wgw==
X-Received: by 2002:a17:906:3a87:b0:a03:24d9:12ce with SMTP id y7-20020a1709063a8700b00a0324d912cemr1665021ejd.63.1700820165499;
        Fri, 24 Nov 2023 02:02:45 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:7c18:b9c9:f303:f6bb])
        by smtp.gmail.com with ESMTPSA id q22-20020a170906361600b00a0290da4a50sm1863015ejb.186.2023.11.24.02.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 02:02:44 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc/85xx: Fix typo in code comment
Date: Fri, 24 Nov 2023 11:02:37 +0100
Message-ID: <20231124100241.660374-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 25 Nov 2023 08:57:59 +1100
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
Cc: Rob Herring <robh@kernel.org>, Zhicheng Fan <b32736@freescale.com>, linuxppc-dev@lists.ozlabs.org, Kumar Gala <galak@kernel.crashing.org>, Nicholas Piggin <npiggin@gmail.com>, Scott Wood <oss@buserror.net>, Dario Binacchi <dario.binacchi@amarulasolutions.com>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>, Timur Tabi <timur@freescale.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

s/singals/signals/

Fixes: 04e358d896a7 ("powerpc/85xx: Add Quicc Engine support for p1025rdb")
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 arch/powerpc/platforms/85xx/mpc85xx_rdb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/85xx/mpc85xx_rdb.c b/arch/powerpc/platforms/85xx/mpc85xx_rdb.c
index ec9f60fbebc7..e0cec670d8db 100644
--- a/arch/powerpc/platforms/85xx/mpc85xx_rdb.c
+++ b/arch/powerpc/platforms/85xx/mpc85xx_rdb.c
@@ -76,7 +76,7 @@ static void __init mpc85xx_rdb_setup_arch(void)
 			/* P1025 has pins muxed for QE and other functions. To
 			* enable QE UEC mode, we need to set bit QE0 for UCC1
 			* in Eth mode, QE0 and QE3 for UCC5 in Eth mode, QE9
-			* and QE12 for QE MII management singals in PMUXCR
+			* and QE12 for QE MII management signals in PMUXCR
 			* register.
 			*/
 				setbits32(&guts->pmuxcr, MPC85xx_PMUXCR_QE(0) |
-- 
2.42.0

