Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE5C4BD34E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Feb 2022 03:04:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K25Fp4pDQz3cQp
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Feb 2022 13:04:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=YxyzZV7A;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2d;
 helo=mail-qv1-xf2d.google.com; envelope-from=cgel.zte@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=YxyzZV7A; dkim-atps=neutral
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com
 [IPv6:2607:f8b0:4864:20::f2d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K25F51Y9qz2xrd
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Feb 2022 13:03:35 +1100 (AEDT)
Received: by mail-qv1-xf2d.google.com with SMTP id e22so28184138qvf.9
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Feb 2022 18:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IfnVO7g/7CxNyjGwJs8ebOgPHTkowomqY0vYzJnQWEU=;
 b=YxyzZV7Ag9r/75/hPkMlxBZKN1rdYRDbkqra+lJ+le34W3Q5rwmQTGZyIf77lM1l8d
 8AQ1GX/RDHXZbWhA07H7FCi4zq3ez3izY2z10YpcR5KVZRR/Yb3ZCA3hcwHXTNQh5qMV
 jIcTYUuTc1LEcxW+RWsOmP3UDVf+KVBSSGiVvpVHFX4h9uNlrJHTXnGQEVibPrFB4wWI
 iFDOYrdYt3/2CY6FJo+WEG6YtYOFkIgh+F4VqXYdrzojflPJyqir2iMpLE6Y+gYvKaql
 gljZJLM/f5UyV93jUlmjSOerjuFh9F9FvicFYzRqZmDQKSbkJ0z/0gly9AE1I/E2V0YP
 weWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IfnVO7g/7CxNyjGwJs8ebOgPHTkowomqY0vYzJnQWEU=;
 b=ggMGUw2fmgAuPvhzF7rlhSOPNXN7y3KjzB+a+k/z7wAW/+tuxjpGL0R8IUaeM3jBXA
 X1VU34BfLCYib1/jtGI2GEG39M4zcrpGIWp4fpaggX+fVveWwv8uXrb1s16c25MPC3Lz
 q1uMhASDX3TADe5kIV28Sauo+sVdMPQhhe+Hk7QfvBlXz21EK99G0YoP6jKs2zI70Jgt
 OB+qHcmZ/zxsX5NtcLnzVHRudjVjfI8bExGqLeAC9NAuAov1NCBYO5QfH8Uc5jHt/vBl
 GIXv1+PVKBCtsbBOBlNbab9htdDlZRzVZ717fNO1jfAi81qhvCUpvIjU2XLcsVFMYBZ5
 p8uA==
X-Gm-Message-State: AOAM5317khcWII6zGIUjWsDUoty6iibQUzjQuDr/StVruYqKZdoUsE2t
 zFLxDFNSjBY4XU5eq2RjcvU=
X-Google-Smtp-Source: ABdhPJxKoVUYoG24d5EjClZyQdLEGq9z9gFN3oVKJvpQFPtE4bTKdHpZUX9MNAf19i9XBrjLu3hkPQ==
X-Received: by 2002:a05:622a:1041:b0:2de:332:fe28 with SMTP id
 f1-20020a05622a104100b002de0332fe28mr5793243qte.141.1645409010597; 
 Sun, 20 Feb 2022 18:03:30 -0800 (PST)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id v19sm26617207qkp.131.2022.02.20.18.03.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Feb 2022 18:03:30 -0800 (PST)
From: cgel.zte@gmail.com
X-Google-Original-From: chi.minghao@zte.com.cn
To: oss@buserror.net
Subject: [PATCH] platforms/83xx: Use of_device_get_match_data()
Date: Mon, 21 Feb 2022 02:03:23 +0000
Message-Id: <20220221020323.1925215-1-chi.minghao@zte.com.cn>
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

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Minghao Chi (CGEL ZTE) <chi.minghao@zte.com.cn>
---
 arch/powerpc/platforms/83xx/suspend.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/arch/powerpc/platforms/83xx/suspend.c b/arch/powerpc/platforms/83xx/suspend.c
index bb147d34d4a6..9ae9268b683c 100644
--- a/arch/powerpc/platforms/83xx/suspend.c
+++ b/arch/powerpc/platforms/83xx/suspend.c
@@ -322,17 +322,12 @@ static const struct platform_suspend_ops mpc83xx_suspend_ops = {
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
-		return -EINVAL;
-
-	type = match->data;
+	type = of_device_get_match_data(&ofdev->dev);
 
 	if (!of_device_is_available(np))
 		return -ENODEV;
-- 
2.25.1

