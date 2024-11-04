Return-Path: <linuxppc-dev+bounces-2848-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7730F9BBF25
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Nov 2024 22:01:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xj3md1bk5z2xGH;
	Tue,  5 Nov 2024 08:01:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::435"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730754097;
	cv=none; b=ktXra7/YIAEHN7Yfj2VuRQjyKkDA67z9nsQXZXtgksxjdt55f5ZGJ1lS7LZpNkT1Mw489YhYL9ppx0+f/uNtb2R7CsQxuf++SMVCa5w8caSE8W2k+8h6GzgwBd2RHbQUxT9tO8M2dcOTo+q1QyQzLdzbpx91+Kn5fRhz/YmlfhhbCYYSf3tJpvzuYxYUWOEYZk65QDMsK+H1PTUBxsWSEQgfgd5YVzNB0ZnaVxqgAoWdiVfw8nDdFy+QMdxNGL66iHfrZRWmMU9JdC6KQhwUZVcateW8VWoXl9u7m46FUSdPGQ/QwBZM6jiUrve1Sba0ruagVujgbE4nA3nDybYCcA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730754097; c=relaxed/relaxed;
	bh=+bIZ8zF+L8MJ4yRKB9h8E75aKwY9cSMENvoX7DOPics=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YyD97B3IGHeMYU3DGSf3zqj965dPVuluM4Oj3pf+9RTbDC12REsIGBRQ03lc8ntj/5LPXpIKJZ5j/KNXjmxNbCC6y5AQ5I0ZddIbM2HnvFNzrmpzrtDsxe9B5QQq/9z/+LJSpXVTJetsWM+AQWuMNIsAUINAXRvtXzj/161pKmiC+uFtn2BclAQJyAXotRa6pqj+BcIIvfK0qwzB3DFXp1qXL29m+zXBIyAsQ/qH1tcV72ZHVEas7g4ZKnlGfwa5Hoa9FZTspygrtnNCjp+zgD2ydHFp3VfQMFz4Dx4Fa5MyfUC/TQXw6ChazeSAh4ReznHcX58CFoHycIM/remU4w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Wrhyqevr; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::435; helo=mail-pf1-x435.google.com; envelope-from=rosenp@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Wrhyqevr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::435; helo=mail-pf1-x435.google.com; envelope-from=rosenp@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xj3mb6dcFz2xdg
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Nov 2024 08:01:35 +1100 (AEDT)
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-71e4244fdc6so3671113b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Nov 2024 13:01:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730754093; x=1731358893; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+bIZ8zF+L8MJ4yRKB9h8E75aKwY9cSMENvoX7DOPics=;
        b=Wrhyqevr3AOIWZJ1uqzVUlIuxBwEiLIr97AoCvstmUq+bPbeeDawHeyQpDCYmUzrfH
         yNykU5PoPez0BftT4eUxmMFH+6t/BJNlrMstJN6D5lc1OZwKSlBWxQwGs8sPcl5p34wh
         Ca8Hqw1yboWuvDGTXpyfH/xql3ZHYrMOVLtqDMwEaK+h5MufR253S/f1xFOKMwLJBeQB
         VOpCgnGKOLf1nLHgzkbgDvhpwQVL5WNwhSWVlP4NSURdEoMt/yLtEn1ZM2gTEVoEReV1
         xxufarAsVh0TsoA7Bo1hk3H1496vjmd1p8z/14pg7c7ig9Byebc2P4VnZUzgPe/0EXHc
         WHDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730754093; x=1731358893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+bIZ8zF+L8MJ4yRKB9h8E75aKwY9cSMENvoX7DOPics=;
        b=ogMagEVkZPCNfivZS4ZWso2DKgcAYp9dsBlTGP97BNFMfQnTMlyViDz/UKFMu6nE3l
         MUQc61VF59mA3b/OxQG+HaHTroIQkd8GvAIDTxBQ6HmvetGlokNs/QZFECa3Z79lb+D2
         AoX9fVzne2z5dhQzrRN5TiQH6qG+mx+siKZ+aPpoZPo6CU/VkBVNiQurOSY8F1HAavcG
         2QiupH/kes7jAfyPnMl4u7nTkUm6D8F7rICmfTEE4hthvtYAQW6j7u9HPlCY6T1A0AUm
         /ZMUb7YCoT90KBrR/kj6XEAcd6n7J2o/o8Sc8QSp7+75BNSUaMFedKFp2uTOlfmylNZK
         BU+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVGFzsgNx0qcwXd7qKqMGzLRh4BckSgYGJmfbBCUFPQfZE55zwvHP9uiMZxDC1gT1dyZVUkoHDwCghX1lg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxNijZnjDFQfK24fubKiGD/AuDif3UDdikfdJnHzpBYhjO+Wf3J
	Yud6XNANwux4y9gVk//P9aCkoOE6EUS4QDYN91zA7pDrlWbHw0Fn
X-Google-Smtp-Source: AGHT+IHvyohNo16U96R1KwDf+tb8U7yjZoIHw3NSm12/Rem7Lvwp3HRybPvr/i8cZs2/qOPlSvCccQ==
X-Received: by 2002:a05:6a00:8cf:b0:71e:3b8f:92e with SMTP id d2e1a72fcca58-720c98a3b4amr19231161b3a.3.1730754093280;
        Mon, 04 Nov 2024 13:01:33 -0800 (PST)
Received: from ryzen.lan ([2601:644:8200:dab8::a86])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc1b8971sm8307755b3a.12.2024.11.04.13.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 13:01:32 -0800 (PST)
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
Subject: [PATCH net-next 2/4] net: ucc_geth: use devm for alloc_etherdev
Date: Mon,  4 Nov 2024 13:01:25 -0800
Message-ID: <20241104210127.307420-3-rosenp@gmail.com>
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

Avoids manual frees. Removes one goto.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/net/ethernet/freescale/ucc_geth.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/freescale/ucc_geth.c b/drivers/net/ethernet/freescale/ucc_geth.c
index 4bf5ff5642e7..00b868a47fd2 100644
--- a/drivers/net/ethernet/freescale/ucc_geth.c
+++ b/drivers/net/ethernet/freescale/ucc_geth.c
@@ -3691,9 +3691,8 @@ static int ucc_geth_probe(struct platform_device* ofdev)
 			ug_info->uf_info.irq);
 
 	/* Create an ethernet device instance */
-	dev = alloc_etherdev(sizeof(*ugeth));
-
-	if (dev == NULL) {
+	dev = devm_alloc_etherdev(&ofdev->dev, sizeof(*ugeth));
+	if (!dev) {
 		err = -ENOMEM;
 		goto err_deregister_fixed_link;
 	}
@@ -3733,7 +3732,7 @@ static int ucc_geth_probe(struct platform_device* ofdev)
 		if (netif_msg_probe(ugeth))
 			pr_err("%s: Cannot register net device, aborting\n",
 			       dev->name);
-		goto err_free_netdev;
+		goto err_deregister_fixed_link;
 	}
 
 	of_get_ethdev_address(np, dev);
@@ -3745,8 +3744,6 @@ static int ucc_geth_probe(struct platform_device* ofdev)
 
 	return 0;
 
-err_free_netdev:
-	free_netdev(dev);
 err_deregister_fixed_link:
 	if (of_phy_is_fixed_link(np))
 		of_phy_deregister_fixed_link(np);
@@ -3767,7 +3764,6 @@ static void ucc_geth_remove(struct platform_device* ofdev)
 		of_phy_deregister_fixed_link(np);
 	of_node_put(ugeth->ug_info->tbi_node);
 	of_node_put(ugeth->ug_info->phy_node);
-	free_netdev(dev);
 }
 
 static const struct of_device_id ucc_geth_match[] = {
-- 
2.47.0


