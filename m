Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD4D4C3126
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Feb 2022 17:23:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K4JBL5Y53z3cS0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Feb 2022 03:23:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=kuPalLo0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::12b;
 helo=mail-lf1-x12b.google.com; envelope-from=anders.roxell@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=kuPalLo0; dkim-atps=neutral
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K4J911Zsbz3002
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Feb 2022 03:22:44 +1100 (AEDT)
Received: by mail-lf1-x12b.google.com with SMTP id d23so4729171lfv.13
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Feb 2022 08:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TtmeV9bgxOIabhJpHOR897CD9xgb87UemODU6yGgV2U=;
 b=kuPalLo0ngHOxMvZ6qIgbB+moVrh17o+Lv9Ez7Ucqyo8MJkTddP+53mAdrQrjT/iIS
 NBbuQpY9+EyL7o0cF9EUX6BiaG/emCBJwgZ7/O8LOzPt3zwXXcdR7BdF3oPNbstEtaWI
 IEpIbLKdf7RuUHHHH74BbrDqcA7itr0BCaBeyWEfVAkr1eXo6yITFooJcpQfXjpLSX/N
 Q00TNT7VNos313AB95PZ1Ztfl68NEuVi3Ghw1As1wnhd+/t9fByKElDKdjKiVesNlmeG
 vgsJyynXcSf5AHf2vzLpP1zEFsoWFYmp1lebeWmVkb4/Y4nnwgoLUfDxWnIwz1JXLLGa
 7GGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TtmeV9bgxOIabhJpHOR897CD9xgb87UemODU6yGgV2U=;
 b=efivx76bDsbiRZD8RlB6jkqRTMW6b1DotN6LwVJiHx5zpe+gJT1QOd0o4I17wlkbQg
 QFvupi9Iv+I9ZwoP6/QEi2NOhgFPfnVYI8ny4Iaa3TRWrlySZoSjhs+H/CJJ4QzmOFPP
 3mP0VzcQVn7DJzAxP/n1tAhW0Z9m1Jah7Rec4wN1V90ZKkb23uJtcFjdyUZtQbkfj7Ur
 ow7R4zVFhFL65HLmZ4cZeAXvOWCaU/6vemL9IEM5N7SdHRkLj0gCDUK4am2cVwC4rXds
 tN6KC4kyk5rbbzn+6s9l4HXu/M5k05mhkwUkujMda1pfMLEgIEIIyotjGuM8qiFhNysb
 HuHQ==
X-Gm-Message-State: AOAM5316bzDeuTU4uu5z68k3BDzJ+B8RV+42sdBhGuC0R9OkVbhaIG1L
 CBZOnAlpyu6ZykrLYkPppneFvg==
X-Google-Smtp-Source: ABdhPJwiKP+dfsndf3VPpMglOVWrIIfHrXym6SEpHnxWV0ApQvGlhQKCMMsZmT1onUav3oJu2Z4OkQ==
X-Received: by 2002:ac2:5d67:0:b0:442:f135:3bcc with SMTP id
 h7-20020ac25d67000000b00442f1353bccmr2267428lft.452.1645719756809; 
 Thu, 24 Feb 2022 08:22:36 -0800 (PST)
Received: from localhost (c-9b28e555.07-21-73746f28.bbcust.telenor.se.
 [85.229.40.155])
 by smtp.gmail.com with ESMTPSA id v9sm242600lfr.130.2022.02.24.08.22.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 08:22:36 -0800 (PST)
From: Anders Roxell <anders.roxell@linaro.org>
To: mpe@ellerman.id.au
Subject: [PATCHv2 1/3] powerpc: lib: sstep: fix 'sthcx' instruction
Date: Thu, 24 Feb 2022 17:22:13 +0100
Message-Id: <20220224162215.3406642-1-anders.roxell@linaro.org>
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

