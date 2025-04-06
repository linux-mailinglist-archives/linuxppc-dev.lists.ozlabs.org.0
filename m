Return-Path: <linuxppc-dev+bounces-7472-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B21DDA7D0B8
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Apr 2025 23:37:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZW5Jz3vr9z2yf4;
	Mon,  7 Apr 2025 07:37:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::a32"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743973745;
	cv=none; b=lNq03Eot65EnV5hoyF6zuHXm+DRCzPRX32/9T7fKPt1ixbX3JLT6/hV8v7SKqOkvOzZmY0bgDx0hdNCIzKM67wSIedFq2lEy76Sx0a614Yzt3Kcapm9EOivTnweSDOjQ+Jzs+sq1NlGZUv3CcX6JMkjggjssipmQ625+b+YEhZKcpXhArgUtVHVqlPNqV8Vh77ahVyAKJ7aPGF+dcoJo6be35dSp/8hxX8i5VImrzMSJu3SePH25QzvYbQae9Gj3kEfNF0p97pysMOci7ERWNVhCPvDXTQG+QO86CghCF4tURK5USysqPG1FmCPykxfoVyGgnGg1ck4Etof6FLJtUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743973745; c=relaxed/relaxed;
	bh=uO0kiqoq6Pl2+MksHXiWbGo7Ymj7pCMwZir/Mc87ed8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dvotCg0bWLGsp0+yPjVO1DBxvfOX+klE3vXG8X5Ywns5t7YnKM2KtfImRW9yc7w1gY/CqE5ifQYIBAove3AyhZrK5Xy9NUkIuc0UumJZtz2+DJ6wMvWEcpvFbJfS24bVLJqP8GvwjTzRgZia16FAyIo6/HVLh1wAHlF83IuzXTpeI1KBMBIt43hr0EifLtqldS32LFPNHFFQ/HFGYqL3jWAQrXzASicjRcS7dM/rLZG7TILrs+o6xj7UYEZqgwp0Q2uRKXYhTOPyrf9/8HoPWgfezfbxq9B/5+qM5myxyRoePfDguhwfbLguG0UmtrWoQ2qstmYrUgtVDE+/soxyKg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=AEPnpDJX; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::a32; helo=mail-vk1-xa32.google.com; envelope-from=chenyuan0y@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=AEPnpDJX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::a32; helo=mail-vk1-xa32.google.com; envelope-from=chenyuan0y@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-vk1-xa32.google.com (mail-vk1-xa32.google.com [IPv6:2607:f8b0:4864:20::a32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZW4hb6BYtz2yZN
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Apr 2025 07:09:03 +1000 (AEST)
Received: by mail-vk1-xa32.google.com with SMTP id 71dfb90a1353d-5240d07fee1so95755e0c.1
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 06 Apr 2025 14:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743973737; x=1744578537; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uO0kiqoq6Pl2+MksHXiWbGo7Ymj7pCMwZir/Mc87ed8=;
        b=AEPnpDJXWlNRsrzv7DQMVai3GT3PIoRa5320Qo6/o2hV+MW8DMMMg65KSDTPowoRzT
         EmCJWMj6giJLJf1UShFm0Y9HoSeOeRVxEf+jcfQIlAXTd2EuF70KrFpe9qbrmp87n104
         IbN5Re69QOj6EOb0DiiGJG72v2nfWCvCYedrd3f1aixYjFAHt+bvphtbXs46Yfox2uTO
         fTiaCqAN0soOF6EuNJgua3IPTxGp5KkM75n1zudbx6yonz23PrWh3gWdk6W+UKsa9AJ3
         PQx8tyWyEeXRak0DDtUef4QUpMrsLwz1Qgf5TJsas31R8aPo+scrRfqYnYMi2G0tFXQU
         6xZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743973737; x=1744578537;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uO0kiqoq6Pl2+MksHXiWbGo7Ymj7pCMwZir/Mc87ed8=;
        b=JQrAjGKDms1rmlLqN7H0FeyIJijBz9PilVPSTifBnLrhR9pKJrPQNy/ersQ/mR3snP
         d7tt0MoX+vIvv1nQaVLLBM7tzA19ZJTr5A2kj1PBm6OnUQdtzyLv12W7G+bi1RijA/c9
         3YT72qIW+mmWjvhBrquZEhkvw4J8XjHJ+w2pT2riu/UKZLwXWltdy429Q6knP1Mzw29r
         eM0Hs3ufPKHcOYODWPmi3a1UeWOtA6/3nUSPkPr/KYbZ9l4xUSMvWdJ0UFLgyVs95I0s
         It92BrSzheCvm1wrHfiVM+1BZOLxilFfFdFP7ca5YnNbBNfLsj8Mid7KUKDFqu1gN9H5
         HyVA==
X-Forwarded-Encrypted: i=1; AJvYcCVhCrkh+8NvolF6dDFlDhpvvZZLhNyXpgCk24AU3dZJ8GtBAFJElBHNrKprH1t2JTz6KJ/0gE5APxvCHys=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy2Nj1eJITJK6nu4kIekrTJGcZEXY2K9qk7TEZYp/3Tx/GVc45N
	kSF0ivCzRy2JSLY6Z3E4Rxx+A9p8z2Wg1AqbpWhAIjJgCM+Fprs=
X-Gm-Gg: ASbGncvFSB8ejMh3GCw15uyDGZk76YqyQM9QQvx5cy0n1zQeWmT2ABhiUHHv8Ltdvnm
	150HJpJHsGJjEScGYC6OtZsGnM6sXIZj7eahBNfrY5+LRBK+Op+2mWqciAdMt6HRqNFpmCS8LtK
	37bLB4aQoaQ3xE14IeAIebpiL4pXZQVmGjaYCD0iQh7SIvg1PCoH3BVOvr7Qv+odfNknItNsdPl
	dBGG1hYjC/6nvm9y+WIVRhnXkYa4jJmclRTnxiV/fYwhZFmMVD9n6yvfRpvB09bl4WCmsghPzZZ
	GTdIM7ryG/rhk/dikI60x/Yr704L+s9i7ABvpx8EB84UlcnU92n4
X-Google-Smtp-Source: AGHT+IGTpGiCEbxTarSt7y732oj9f2PCf4kNvnO3XFvF0pPA3Ka+/n2IuVGjqKpGPACv04v8yPFYeA==
X-Received: by 2002:a05:6122:46a0:b0:520:3f83:fdca with SMTP id 71dfb90a1353d-527642fd2d7mr2662608e0c.0.1743973737408;
        Sun, 06 Apr 2025 14:08:57 -0700 (PDT)
Received: from ise-alpha.. ([2620:0:e00:550a:642:1aff:fee8:511b])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5275afa73b5sm1615080e0c.41.2025.04.06.14.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 14:08:57 -0700 (PDT)
From: Chenyuan Yang <chenyuan0y@gmail.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de
Cc: linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chenyuan Yang <chenyuan0y@gmail.com>
Subject: [PATCH] ASoC: imx-card: Adjust over allocation of memory in imx_card_parse_of()
Date: Sun,  6 Apr 2025 16:08:54 -0500
Message-Id: <20250406210854.149316-1-chenyuan0y@gmail.com>
X-Mailer: git-send-email 2.34.1
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
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Incorrect types are used as sizeof() arguments in devm_kcalloc().
It should be sizeof(dai_link_data) for link_data instead of
sizeof(snd_soc_dai_link).

This is found by our static analysis tool.

Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
---
 sound/soc/fsl/imx-card.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/imx-card.c b/sound/soc/fsl/imx-card.c
index 3686d468506b..45e000f61ecc 100644
--- a/sound/soc/fsl/imx-card.c
+++ b/sound/soc/fsl/imx-card.c
@@ -544,7 +544,7 @@ static int imx_card_parse_of(struct imx_card_data *data)
 	if (!card->dai_link)
 		return -ENOMEM;
 
-	data->link_data = devm_kcalloc(dev, num_links, sizeof(*link), GFP_KERNEL);
+	data->link_data = devm_kcalloc(dev, num_links, sizeof(*link_data), GFP_KERNEL);
 	if (!data->link_data)
 		return -ENOMEM;
 
-- 
2.34.1


