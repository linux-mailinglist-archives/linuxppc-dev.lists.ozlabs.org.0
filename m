Return-Path: <linuxppc-dev+bounces-2849-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF029BBF28
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Nov 2024 22:01:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xj3mf6Vn5z2ygG;
	Tue,  5 Nov 2024 08:01:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730754098;
	cv=none; b=CZ9uRvILyepURHaGc3vSoKzn67SDC36KmDsrszTNA76Pxs4mNSX4l49b5iaPnrQ+3pOG7k0ABYJDybX6HMp3KzU8yHlWqS2ZKE3GLrPyLo0GfwfU4FO8tQc5LxSmDuJK23LOYckJCGzlKZP8odZKtE713rZ47314RvqF9lHblUMAR+dRh5KF4EsHQiPpJnYJ75scr2jyIz/UvtXB1pxma1rH4mFxHxWqAQN8Ong2sltGYeAHh5zYgT1PecERjXIu/b9BANjzKj3C6LWui5lePt+MQEj4zv90opj7+Igv3EOpUrQUAeVNeVY/2d70JAuQFLfwlXVbaDcMdGcUOUidcg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730754098; c=relaxed/relaxed;
	bh=4pXKZHXAtSZq9rE1V/pmNjGOdaYBnGBtC8hqbRoKbqU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iZd3rhR8xCpel5KjTGuydQ+V84nPjxfUgmM7+uKcQEVUGjL7ZQIXXjLwW/y6hlCIb1kFgYQW8eeMUE9sWBJMxhb/HzPG5ua2Oe6r76iIY90okhiqSW457kKrDsXbxg115alGLbonOxPBQrjzLR/ZbmeVl9RO3TCGFb5E5m9B+ZxdBZCoGzYzTp9IXVJNPsBDYN8tYJZ9ktXPUfdHIYvrsycGKRy5xVjFO1Gsb0UoaaojfxS7tBoPxKIt5TzjR6hHR4/j6n5/Dtz+VfTqNOAmX8r3AaAg/8FA4oT0wsCfPG6B4XOe7AiuBbzYrStFt+aYiMwARM9GAiMIK4ZMmHU25A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mtDE4dy+; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com; envelope-from=rosenp@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mtDE4dy+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com; envelope-from=rosenp@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xj3mf0BmNz2xdg
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Nov 2024 08:01:37 +1100 (AEDT)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-71e625b00bcso4237211b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Nov 2024 13:01:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730754095; x=1731358895; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4pXKZHXAtSZq9rE1V/pmNjGOdaYBnGBtC8hqbRoKbqU=;
        b=mtDE4dy+yQ2UNGgWsPHfW9WOXUEyGeVLx2LOM62eG8QbjBlJgdIK86jrG5pbcIO2AS
         s/QfMu2O175rbv7sBKdmjei6o/4nH5KFhJhgRvSeSxZN91YKf8WLZFhJenqv+z3+BjRB
         5tK6arjhqua6k8FF9969u2sN52zfZZ8tpVmLdrgYqdFGeF1GdDr7OiMb0yVzd3ScS21j
         D+VcaGwMUXmCYj2c2wi/eK/AReTE1EcJTpOONd7/JvYjOhLLaE9Q9QnpgahOi52Udv0I
         cfm438kplq10jILL0y+psPyYn5rVyG5XPTUWSbr6JN9+ouJWbLMYDGduXaM8WTpKuOok
         5zsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730754095; x=1731358895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4pXKZHXAtSZq9rE1V/pmNjGOdaYBnGBtC8hqbRoKbqU=;
        b=LcexZqn8NVnoLytmq617sDLYm6nOXlbL+fg7HSfAu39eVFF312ziCGQdbAG8SfpD+8
         E1ZBktS7218Niuqvi/mC6bqYAXmzQojW1/mfW3ZJz8CHAUVBQ65M4zfGevQJUL7789Q+
         xKglqghM9wjme5km0hjt99dSKHfmPwpT4iSt6VWRUVZbFSaxLBnBMERVFFCBqnBmZbf8
         LbvUjCpp6WVHGvu9bwMvO4KiDRPh1cSffZVurRQmjE40ghvCCuSgAMgBiCBT3hWFfTWy
         P/wTbGE/vSKJagrxWDj4joMxI6qfYE2NoLmPn7kK9a7ZsYo4XMPUt8iJkS4cCiYZqbTI
         qSpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLxiLopz1msvpS8yrNo1vKNd7sBTG1bOeAHrzJnvQ1wHSdXuZ36qoLvG9Hyi3mppr7Xo6HwwtnFDktK5g=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxQAETD89iz2JKEzGKwI/KKzCr/lZ+8bClUnMXg6qdfXiEq7fzq
	K5VTKMh+Qevk1I6GOusXUeTzeZlJqzaSiij/IALOuelcn13DtJryvuw46c2V
X-Google-Smtp-Source: AGHT+IGVOiJFQcleE+NLyWRmjQbIlc5so8HKh80FTo3HLnTFS4d9spw/T8UmVR69HQs88bShBPOJpQ==
X-Received: by 2002:a05:6a00:2302:b0:71e:6c65:e7c4 with SMTP id d2e1a72fcca58-720b9de1608mr21369867b3a.26.1730754094875;
        Mon, 04 Nov 2024 13:01:34 -0800 (PST)
Received: from ryzen.lan ([2601:644:8200:dab8::a86])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc1b8971sm8307755b3a.12.2024.11.04.13.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 13:01:34 -0800 (PST)
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
Subject: [PATCH net-next 3/4] net: ucc_geth: use devm for register_netdev
Date: Mon,  4 Nov 2024 13:01:26 -0800
Message-ID: <20241104210127.307420-4-rosenp@gmail.com>
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

Avoids having to unregister manually.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/net/ethernet/freescale/ucc_geth.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/freescale/ucc_geth.c b/drivers/net/ethernet/freescale/ucc_geth.c
index 00b868a47fd2..88a9e7db687c 100644
--- a/drivers/net/ethernet/freescale/ucc_geth.c
+++ b/drivers/net/ethernet/freescale/ucc_geth.c
@@ -3727,7 +3727,7 @@ static int ucc_geth_probe(struct platform_device* ofdev)
 	/* Carrier starts down, phylib will bring it up */
 	netif_carrier_off(dev);
 
-	err = register_netdev(dev);
+	err = devm_register_netdev(&ofdev->dev, dev);
 	if (err) {
 		if (netif_msg_probe(ugeth))
 			pr_err("%s: Cannot register net device, aborting\n",
@@ -3758,7 +3758,6 @@ static void ucc_geth_remove(struct platform_device* ofdev)
 	struct ucc_geth_private *ugeth = netdev_priv(dev);
 	struct device_node *np = ofdev->dev.of_node;
 
-	unregister_netdev(dev);
 	ucc_geth_memclean(ugeth);
 	if (of_phy_is_fixed_link(np))
 		of_phy_deregister_fixed_link(np);
-- 
2.47.0


