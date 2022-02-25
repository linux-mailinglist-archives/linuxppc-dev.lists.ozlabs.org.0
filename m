Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B674C3ABB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Feb 2022 02:08:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K4Wqf1nmyz3cDS
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Feb 2022 12:08:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=XUcgz3qA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::735;
 helo=mail-qk1-x735.google.com; envelope-from=cgel.zte@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=XUcgz3qA; dkim-atps=neutral
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K4Wpv49Xtz2yLT
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Feb 2022 12:07:49 +1100 (AEDT)
Received: by mail-qk1-x735.google.com with SMTP id v5so3350961qkj.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Feb 2022 17:07:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MmpWNXteUzVTbNYEU6Qa76g7YMtYPs+CYkqOGTVLu6E=;
 b=XUcgz3qAQCNU5oUmiGDepPTHObKouehD7vOd+akhJdcRYvSwqLm9hxbNv7dLNzsvw1
 xVLMRnZr8A9lEgvJYQUJR9+wWZEdgiAOujvh2XgZ+gIKdZU160jRIjCJJaNR16vV1iWw
 XGHwBMKD//3FTia2P8krGxrQbKUmezZJgy6If23tk2xgZ9GI+yYcwDwqUidV2lbSof3g
 PLDDKj8bK3a3jejWFfHT8Ai+yFh73SkRju72+ZaYkAEPLnou1LUDIWBIKI1aNhJhsSCo
 Oud2e3Yl2v+TYUM6CgQvwPWNm1SkNYDLFfDZF2oJdJNZ1Sj89zM0Ns5vVEDTqKglv90Y
 lwpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MmpWNXteUzVTbNYEU6Qa76g7YMtYPs+CYkqOGTVLu6E=;
 b=dhIJfVStVQV3eVYtCUSlLjx3G4wCy6r/5VvHirDRIXCpfeNlUP5WvJGRsJdTKNGheI
 QlYzWtP/5AB5IRAP37TDbcU8VdUuZbt0+gL5CNuyZV5WEsU4Nodqq6gfgQW4Lm6P8vTl
 GSYaEkZRi2wRfsGm/Oa4RKcMfUWQSnsZjSjj70yYDtVetU7gXy1eJNcPiuuHZThfuIX2
 QSWJwYVQy133tnU6Fni/bZOOE+PeWusD89YIQBvE78wnAyR6FCT2O3+bgpu0k6W8QdYZ
 4mIzh3oEqI0XiLVUwXxw6U1m1bH7CTHSOYXBWMoYbaEsvGeIFfCJSqkbR2dQXV07j0oP
 If1A==
X-Gm-Message-State: AOAM532iFM0w/AcJfzuU6L0zyVfcW0u5fJgFyT9RMgChTgh829yPyEPz
 +J076YoQXl2Otw4Vv9E9VCI=
X-Google-Smtp-Source: ABdhPJxM7Nd9VDWfi96k/1ejXcy5rfq9AQ1PnzId1Bxbi2C3gSS2vGdhuwpSZ+3Z8YcmCbbPWKDVTw==
X-Received: by 2002:a05:620a:787:b0:508:b18a:e109 with SMTP id
 7-20020a05620a078700b00508b18ae109mr3441749qka.471.1645751265610; 
 Thu, 24 Feb 2022 17:07:45 -0800 (PST)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 y18-20020a05622a165200b002dda08f1371sm697215qtj.0.2022.02.24.17.07.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 17:07:44 -0800 (PST)
From: cgel.zte@gmail.com
X-Google-Original-From: chi.minghao@zte.com.cn
To: oss@buserror.net
Subject: [PATCH V2] platforms/83xx: Use of_device_get_match_data()
Date: Fri, 25 Feb 2022 01:07:37 +0000
Message-Id: <20220225010737.2038781-1-chi.minghao@zte.com.cn>
X-Mailer: git-send-email 2.25.1
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
Cc: Zeal Robot <zealci@zte.com.cn>, linux-kernel@vger.kernel.org,
 Minghao Chi <chi.minghao@zte.com.cn>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Minghao Chi (CGEL ZTE) <chi.minghao@zte.com.cn>

Use of_device_get_match_data() to simplify the code.
v1->v2:
	Add a judgment on the return value of the A function as NULL

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Minghao Chi (CGEL ZTE) <chi.minghao@zte.com.cn>
---
 arch/powerpc/platforms/83xx/suspend.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/platforms/83xx/suspend.c b/arch/powerpc/platforms/83xx/suspend.c
index bb147d34d4a6..6d47a5b81485 100644
--- a/arch/powerpc/platforms/83xx/suspend.c
+++ b/arch/powerpc/platforms/83xx/suspend.c
@@ -322,18 +322,15 @@ static const struct platform_suspend_ops mpc83xx_suspend_ops = {
 static const struct of_device_id pmc_match[];
 static int pmc_probe(struct platform_device *ofdev)
 {
-	const struct of_device_id *match;
 	struct device_node *np = ofdev->dev.of_node;
 	struct resource res;
 	const struct pmc_type *type;
 	int ret = 0;
 
-	match = of_match_device(pmc_match, &ofdev->dev);
-	if (!match)
+	type = of_device_get_match_data(&ofdev->dev);
+	if (!type)
 		return -EINVAL;
 
-	type = match->data;
-
 	if (!of_device_is_available(np))
 		return -ENODEV;
 
-- 
2.25.1

