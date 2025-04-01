Return-Path: <linuxppc-dev+bounces-7422-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CEDCA78414
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Apr 2025 23:36:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZS1XX6rPyz2yGf;
	Wed,  2 Apr 2025 08:36:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::642"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743517532;
	cv=none; b=guvW8alREjNM/LiAE3SWQMAH34jB8hVKhck701ppsUxTk0ALy6SpMld9YreL2UnXltTQ6ZL3bjEqa6+zEYrv8TILtWGSu+UGuSUaIeZ970hyMdn1w7Z0MjxvdYfzbOQmFT2V1atEOiONHQq9jPJcHnp8dm8HnMQIAsMqYtBmvA1STZ4/UVMiPvW59UoFsy4O60eQCThkOyL34t+pl3NGxuZy7ANhkt8+8H/hYscJBeD+idlVktoSi7dlbL9u+y5EfiyizSadgKYd3jtBXAZDUpLl853btctx8iXnJtQRcPLo4H1XQqYBjRS3Oz5IHo2fQCQtIDjtnpn1G7eA0E/1oA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743517532; c=relaxed/relaxed;
	bh=1phRyZ5KcBrEb/h+2IGgPuNtDNLntogG8i/AIBPIi5g=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DL0SlVLeUQjQqXTy9bwOIp1UHi9rSjyIooLLeGMhSC9VPUsKaXM3pqjR4pzPepzyTkapSIkhrgJbBo0CTRsqL1vjX2lQKkpLUF3grXF+szlBY2ZiPu3FQ0O4km0+LUqY95a5nPlBvl4MghbXjI8uyWhEO93QlLvEo3OAT90OqwrPp8XTaGgI9NXraW3n8ONreK0PKC9tshbJyDm1bh/1s0k5ob4WuUXBbVk0MKpLgZgbDGYdvFMvXnwaZWva9t2Ryu4/SXog1Ph51X7ltLIMOCT7fMH1dw2nYGNqkHB4IAAygdgvUpJVspSsvsCtXRr3tnVWYYqw0Aiyu/ufFkWfFQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Q9YnB3ra; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::642; helo=mail-pl1-x642.google.com; envelope-from=bsdhenrymartin@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Q9YnB3ra;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::642; helo=mail-pl1-x642.google.com; envelope-from=bsdhenrymartin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZRqzG3qZ6z2ySc
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Apr 2025 01:25:29 +1100 (AEDT)
Received: by mail-pl1-x642.google.com with SMTP id d9443c01a7336-224019ad9edso27028155ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Apr 2025 07:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743517528; x=1744122328; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1phRyZ5KcBrEb/h+2IGgPuNtDNLntogG8i/AIBPIi5g=;
        b=Q9YnB3raHQcVynw56thU3TBdBeRA0WLUBQAz4iI5JEom3gV9m6F8B2Stu2sICUm7L0
         +CxtIjb+NM+7gw/pAJDZHfa8wfQzDjTQiWI89UmcIzAO/ofx+aPaC3ThfAsKsmubd+bj
         rOh/mQeosXF4sbdd+XCa3C5oJfjj899ddf6wPRCmyi2WUSu79IhCkcL3evf2CLlUA666
         FODTrY1eaI1BpMKnsX3kAvAwjm14gqxhp52VR5V6tCfTk8loxaI4BxpP5uHGCSGvc/Zt
         5r5RAljCshsW/RnIvaq35/iRSGjwH9ZECRP97qGwiqwgV7gvDOVwjMyLK0zWGRFdzPDt
         Yqcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743517528; x=1744122328;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1phRyZ5KcBrEb/h+2IGgPuNtDNLntogG8i/AIBPIi5g=;
        b=nR2QPEIoBw9r7W29nhRffPFfgiUIG1NIghnDSzfoa4q/oVQx5WgogeBNGGLEza9rnB
         2irULEjVBo+dHAQsb095AuAvJz9ygmyOtR6TuBFma+RMp9FMwrgDc3Llqdwf+G14jnqF
         2nSazXwa02OaecoE35JpxolFWmwaGaxcqaN81Ex0Z61S3nwqWQtuTNxHh3uaK9J/FfMN
         heZsDsGK/uXRz4XgAuxNQZJlEdkmo9hmDW4mzscq3Ewk9EN6Dx8mfAjEYz0zcln5Lzjl
         ek2YdfUXEKv9PoJc5Zo+LZHQY4Feg0NLFmHlJmsQyqQcRp+H3R7oHMJVkpiFU5eReg1t
         SgTg==
X-Forwarded-Encrypted: i=1; AJvYcCWl0neOj+E1CVMSo8rKSw3qTkKda4pqMh9ISEBN1GtOMzl/3b/vNDG1hQINObmvtWFKZkreFUkAKY5JftI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yykx3PYFbNMS2TwoFIvgYTY7L1bfE3uMECnYtKCdMKBOUIT6t5I
	8xqdHz/w0Shoq+Vs6EocTg5J707T4COkD8tUSknUsLtPX9LcG1bn
X-Gm-Gg: ASbGnctaYbZA4bqpoLOebSBKm0Yzvi74kq6RL5HPFDecfdtH/0uODIRBuZEEVAexf/e
	WXiWsjXFqNbD0mvWHBfti9QPAYOpn1898HK+/PjZfc12A2iUjX7azmOWjvOSRcmNhmy5VMGZUEy
	mW6ImIwAbwrwyitM7aA7FGTt/5bh+3PeROODD4NGe/X7/sPYrq0m8dFxBYkkPdhutHZvA9Ip97F
	o7B2KlzMeuIkaTdwLefkDqrDM49Quio7mXopTYctNdoczJ7XVZE51nQMcOSkwEWIrZye6Z7RHF7
	aN+x3daHlkm+mxhWe816j/DkRIXP7m9pXQjRGTa1zwUB3UqyD+WHYNqwAxrJzUvRqxFvuwM=
X-Google-Smtp-Source: AGHT+IFV9dBzNcxDUHEuxWuZhPi/1saRFkCoRQug1IzAs4LF+0tMPIs9Zk7YIgX5WGynxkjRbFRZFw==
X-Received: by 2002:a17:902:c408:b0:224:1609:a747 with SMTP id d9443c01a7336-2292f97ba73mr186070825ad.31.1743517527938;
        Tue, 01 Apr 2025 07:25:27 -0700 (PDT)
Received: from henry.localdomain ([111.202.148.167])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eee22a2sm88704425ad.81.2025.04.01.07.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 07:25:27 -0700 (PDT)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: shengjiu.wang@gmail.com,
	xiubo.lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: kernel@pengutronix.de,
	linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Henry Martin <bsdhenrymartin@gmail.com>
Subject: [PATCH v1] ASoC: imx-card: Add NULL check in imx_card_probe()
Date: Tue,  1 Apr 2025 22:25:10 +0800
Message-Id: <20250401142510.29900-1-bsdhenrymartin@gmail.com>
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

devm_kasprintf() returns NULL when memory allocation fails. Currently,
imx_card_probe() does not check for this case, which results in a NULL
pointer dereference.

Add NULL check after devm_kasprintf() to prevent this issue.

Fixes: aa736700f42f ("ASoC: imx-card: Add imx-card machine driver")
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
 sound/soc/fsl/imx-card.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/fsl/imx-card.c b/sound/soc/fsl/imx-card.c
index 905294682996..3686d468506b 100644
--- a/sound/soc/fsl/imx-card.c
+++ b/sound/soc/fsl/imx-card.c
@@ -772,6 +772,8 @@ static int imx_card_probe(struct platform_device *pdev)
 				data->dapm_routes[i].sink =
 					devm_kasprintf(&pdev->dev, GFP_KERNEL, "%d %s",
 						       i + 1, "Playback");
+				if (!data->dapm_routes[i].sink)
+					return -ENOMEM;
 				data->dapm_routes[i].source = "CPU-Playback";
 			}
 		}
@@ -789,6 +791,8 @@ static int imx_card_probe(struct platform_device *pdev)
 				data->dapm_routes[i].source =
 					devm_kasprintf(&pdev->dev, GFP_KERNEL, "%d %s",
 						       i + 1, "Capture");
+				if (!data->dapm_routes[i].source)
+					return -ENOMEM;
 				data->dapm_routes[i].sink = "CPU-Capture";
 			}
 		}
-- 
2.34.1


