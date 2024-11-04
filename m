Return-Path: <linuxppc-dev+bounces-2847-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 018499BBF23
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Nov 2024 22:01:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xj3mc5BZpz2xsd;
	Tue,  5 Nov 2024 08:01:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730754096;
	cv=none; b=ZvpI4bMQzJf1FcWnvF2bmRHqcRDKrYNy71dJK+Z+vQe/ESlcP7mfykzdFSZOCnXaex0149YF2JeSdTkZhEjyATe/YmvThdgy96phvYHB1jTJaUsZOxnvYcYv0W5nYXN6eX+UBNp28miMVCCDQZFA9y9xc1HcRpgdpgKKXkT+3V2A96BIP42o46Milh1oaDjck3tvvSIHNdD6jpiQ9GNPdyF3efxhcDN2CyRXgLpVz2fdmjCYXX81MFypV86S1gpZ3NebqLUaFjp5zqu7xARiDy7/zYWvLyGedH9jrN9CZOByrQuOP8hiEUHYKcMbgYNpRvXJfrJWCGmfu5qinK2wRA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730754096; c=relaxed/relaxed;
	bh=Ip9/C2ewikw3KgUEbRX7k49RSpJtURcwU9L3ZheHKjQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=STGEIJiSi8KQZ36CBIyyRjRW/nxoQf+gl0tFAVIGwUra/U4kUrkoTsBtW+tw5ErA0TqyfrbCTotVBM05L+5zbHhPFKykOh0Db5MzSnBJmd+GncUjhwMaEAYpvRqwDnztOTLwYBiSiSgFGDjFkruSVClN+7tJNc1hzvT+aiEMNlPij8fxPeP7LJKB7o9mh258lklUPvHRpPrlwtjh8Y1x62wuoRCRS4o9Ef1UXppBzGsiX4bfeEH51j4VkwhK1/V5RLNlHt6Ysm0v6RSVBHNHZ58K6JlTFJ6iXM9zTKRCFDRk8oTM8LsdSzvrvzq/5Ky3BTw0700o/AVS0xTt0lZc+Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kuhkqenP; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com; envelope-from=rosenp@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kuhkqenP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com; envelope-from=rosenp@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xj3mZ6FFqz2xJF
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Nov 2024 08:01:34 +1100 (AEDT)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-71e52582cf8so3994148b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Nov 2024 13:01:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730754092; x=1731358892; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ip9/C2ewikw3KgUEbRX7k49RSpJtURcwU9L3ZheHKjQ=;
        b=kuhkqenPy+hwoOQEGa34Z4/y34lAyANJ1oJmNTwSM/PW/7lLVe/6Fz1Irbet8RRu1E
         Vw8z0fTGjr9TtN5rxMk0UudKXmmP/KYNJYAVp8re38nyHWy5FweenZaGUAp5xAcb2MKN
         ZDFxUWOwv69RwFP8yy705ee/hQJOQl6MMpAOov6JmvE1uxMQjPsKhv/il6H/H1FMZ5DO
         FezX75L+lNsQJb65w0oxKfEVz68x8nWvwGRFsWE7+RkvSyGk3weRjcL5zYmCtF55kDYd
         7k46edbRbA2BHHbus3xWrcrSEuZfvSFiSPIjSG/ELpx6mBqTrg7JiBI6w18Og+2tY8fz
         P42g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730754092; x=1731358892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ip9/C2ewikw3KgUEbRX7k49RSpJtURcwU9L3ZheHKjQ=;
        b=VAMktAV3yKdZbAjLXrig4L2CoZJt0craxCuLLuhb9ILKSrHEm6131RfkBS4J4sXSp3
         ZKRk9tfQsa/RUjmT8btfZGBOEEcL6QCqI1wj+r5krmN2w+Jt7I73+oI2nIgC4OCw7cQt
         Pgxi7kPA07hg6beC/S8vg8zGXg1yA9NUp2fPwzuPWEKxscqjqaKRHiF5dzgHF9CRyNI1
         Jg2z3J+zZk3hQy/MsdzcOxnnoaunuI/hSP7w4Dzb4EBW4nES2sLqqLGCefI58oC+RB0Q
         O79v/S4r+PtWPrqGlzRsRuz0YEvk5owywwgMkkucBJLW1G/pOdeJYsjcc8v3AvnURpox
         ELEw==
X-Forwarded-Encrypted: i=1; AJvYcCULvnRR/Rp19O6FO/DDy7kRhPOBXGU2zoja7VSdz7Me71Amr1yO5jAUW0DGH/OpuxxfRwwMEuImp/JG4vE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwzCtdiR91W/pg31yL6k145WRdQkcHeQL2B0tQzz/eHShio0sOw
	R9QyxLwlxP2wY5nEFttGDZ2pgCxdxXmAxkqD7pSs18ld4k7J8jOJ
X-Google-Smtp-Source: AGHT+IEnbdG1Ii06AUcv2+s6OlAYE4thaNj7TjcIIQC8s8ZBO9ULIesDRtW5uiZzRUj/PuB2sXQt1g==
X-Received: by 2002:a05:6a00:1814:b0:71e:3b51:e850 with SMTP id d2e1a72fcca58-720c98a3d3amr19246643b3a.2.1730754091800;
        Mon, 04 Nov 2024 13:01:31 -0800 (PST)
Received: from ryzen.lan ([2601:644:8200:dab8::a86])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc1b8971sm8307755b3a.12.2024.11.04.13.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 13:01:31 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	maxime.chevallier@bootlin.com,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linuxppc-dev@lists.ozlabs.org (open list:FREESCALE QUICC ENGINE UCC ETHERNET DRIVER),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net-next 1/4] net: ucc_geth: use devm for kmemdup
Date: Mon,  4 Nov 2024 13:01:24 -0800
Message-ID: <20241104210127.307420-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241104210127.307420-1-rosenp@gmail.com>
References: <20241104210127.307420-1-rosenp@gmail.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Avoids manual frees for it. Funny enough the free in _remove should be
the last thing done.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/net/ethernet/freescale/ucc_geth.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/freescale/ucc_geth.c b/drivers/net/ethernet/freescale/ucc_geth.c
index a7dd0a2ead86..4bf5ff5642e7 100644
--- a/drivers/net/ethernet/freescale/ucc_geth.c
+++ b/drivers/net/ethernet/freescale/ucc_geth.c
@@ -3594,22 +3594,23 @@ static int ucc_geth_probe(struct platform_device* ofdev)
 	if ((ucc_num < 0) || (ucc_num > 7))
 		return -ENODEV;
 
-	ug_info = kmemdup(&ugeth_primary_info, sizeof(*ug_info), GFP_KERNEL);
-	if (ug_info == NULL)
+	ug_info = devm_kmemdup(&ofdev->dev, &ugeth_primary_info,
+			       sizeof(*ug_info), GFP_KERNEL);
+	if (!ug_info)
 		return -ENOMEM;
 
 	ug_info->uf_info.ucc_num = ucc_num;
 
 	err = ucc_geth_parse_clock(np, "rx", &ug_info->uf_info.rx_clock);
 	if (err)
-		goto err_free_info;
+		return err;
 	err = ucc_geth_parse_clock(np, "tx", &ug_info->uf_info.tx_clock);
 	if (err)
-		goto err_free_info;
+		return err;
 
 	err = of_address_to_resource(np, 0, &res);
 	if (err)
-		goto err_free_info;
+		return err;
 
 	ug_info->uf_info.regs = res.start;
 	ug_info->uf_info.irq = irq_of_parse_and_map(np, 0);
@@ -3622,7 +3623,7 @@ static int ucc_geth_probe(struct platform_device* ofdev)
 		 */
 		err = of_phy_register_fixed_link(np);
 		if (err)
-			goto err_free_info;
+			return err;
 		ug_info->phy_node = of_node_get(np);
 	}
 
@@ -3751,9 +3752,6 @@ static int ucc_geth_probe(struct platform_device* ofdev)
 		of_phy_deregister_fixed_link(np);
 	of_node_put(ug_info->tbi_node);
 	of_node_put(ug_info->phy_node);
-err_free_info:
-	kfree(ug_info);
-
 	return err;
 }
 
@@ -3769,7 +3767,6 @@ static void ucc_geth_remove(struct platform_device* ofdev)
 		of_phy_deregister_fixed_link(np);
 	of_node_put(ugeth->ug_info->tbi_node);
 	of_node_put(ugeth->ug_info->phy_node);
-	kfree(ugeth->ug_info);
 	free_netdev(dev);
 }
 
-- 
2.47.0


