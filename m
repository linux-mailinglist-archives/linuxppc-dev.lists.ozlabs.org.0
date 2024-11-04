Return-Path: <linuxppc-dev+bounces-2850-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A05E89BBF2A
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Nov 2024 22:02:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xj3mh2jxYz2yvy;
	Tue,  5 Nov 2024 08:01:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::432"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730754100;
	cv=none; b=aUVWGkca5RxMy94SF8eiGL4L2co9eQ5OTUGxV/qFLFeJ2pIQiiIWpYUAEHxmXvQWxJkRySGffapULQzb9Dte0CaI9+5XA62brrtmEjCCFJsHoB4krb7hC2Zn1RzPV0tflNqZW2hyzNbX/Lnk8y3D/lvf2Z9cZbo4soIy9af9SwZVDPtfTMXCOoc+Bmy/SqfjE4qcaBKeLpduGbZw/Y7x0ymFdv6XXzlK9EtOW0uvaZTr4lL2TCxRuQxYw9/CY9qDSODLa8uT8pbOrEyOS/hA4FSbXi8BaCze1DrWJ+TP0xa/lff9U+3aIC25ImWeUAUTnRpKWQlx+taFyfoLrHfQ7A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730754100; c=relaxed/relaxed;
	bh=HB0r+fmFtPPP2FUicFB9grwBKEnYit58WrhtOqLd8qs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lVa10Jk8zrEQR4oHvxLeFKSi4CxEXittJw6gM5Q27jS/hhmBaQhch44euAUN0GyUUCmkNtSYiLVihqh65kJrSja4R91MiaV8ImWKtN5FjPRIVxEMp7AgzfUS047s2tWYNac+hH1W8n78Zie9qu5f5xt0C33GFaRHokkEsZzHpZXoLXJDOjaKZX8Xg1Ss71VG2ag6Iw8XXLs9pvaVspXxJfgXyZTka6JmAwumwizZyhpDf5bAp/x2xFby+TzRsQs74+zvwyQypXm8eSvBd+3T6ikKEpaz62so+OyxM3MkmI1gz2UxDvXVoeVHYK1QLRd80L4lEE2hVz7Xy8t9WZ+kRw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WNWRIY2D; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com; envelope-from=rosenp@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WNWRIY2D;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com; envelope-from=rosenp@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xj3mg3VqXz2xdg
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Nov 2024 08:01:39 +1100 (AEDT)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-720d01caa66so2998142b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Nov 2024 13:01:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730754096; x=1731358896; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HB0r+fmFtPPP2FUicFB9grwBKEnYit58WrhtOqLd8qs=;
        b=WNWRIY2DJZdkDKu1UjwdZzSytz4iyFllafp25u6WM2WGDwKii7Z8iE358mq9PmQr3F
         D85Ya4fieYjYDmePYT+pN+zrrjfGw5miazWnpe24yezMo2VKlSQzareB+rCn81eUw9yQ
         w9Og8aEqlErAkXvdOl772HjFwlK1/4e8Qv0rmf70/0N1rkJ+23h/XMiqwDvI35XBeacW
         QVNfIQp8WsTWaDceWHa7IdJ9uKho7zV9qUvoWA5ZNCIDLXXas3aaUm5E3/goVotrvamF
         wZO7xffTU8Stk2BNEoQdd2+YG3HzON8Go4xCv7fAulOVRjCogyKf34jcJKGKAbrl11SV
         997Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730754096; x=1731358896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HB0r+fmFtPPP2FUicFB9grwBKEnYit58WrhtOqLd8qs=;
        b=bcX08bdb2fvp7GJZ/49kwV0xcYyj98Xrd490k7m1W0zsrWwBtAzptoAROxRRBf4Vym
         PUHXsZzhmqb9XJ02Y3KKYzi4fMBL0KO6f1/7jBLYw8WxPwE/q6oXatjkXDHPdP/qf2co
         m9JUd8C4NcwM2EGvHtvnrah96xlMA89AqNMIRpm0MYAKiCVNs2PngLkOscPQv1RTi6XG
         gSzsaPsV/7aToCKgeI86GMm4Ue6E6Yn0otRVrWS1RQrBnP1ZmYfklbqKu1BrJXkVPO4j
         /sYKF5EL2i+Lxpm79I9JONOLjwi/p2+3uhibC2swzTnDD1QfI9Ilbv0oCunmTR0E2SkD
         J7kw==
X-Forwarded-Encrypted: i=1; AJvYcCXhlBk8/v3rCB1aaeoXJk3ntFX/lfszxJsZHh72FxqouJgsymHEi2RWK1kFbKy2qcEI7LU+Hi6CJWXXSU4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzH0K9uVl0yWqguZS176WP3mZLGglulc3oL2JSq9sWus8oVRgId
	bFza4tgop9frEubJCJdD1Mteb7DBR/8kiOOxgUXIdEbV1Z82a1ok
X-Google-Smtp-Source: AGHT+IGwMD0UoRgk5kv/dUnGGU4iyNpQ/ODgMyjPi1OiOmbCLzk45IZoztu6i5o/DRbm+JHdKLu80w==
X-Received: by 2002:a05:6a20:d525:b0:1d9:1bde:bf8 with SMTP id adf61e73a8af0-1db91d87351mr22961733637.14.1730754096456;
        Mon, 04 Nov 2024 13:01:36 -0800 (PST)
Received: from ryzen.lan ([2601:644:8200:dab8::a86])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc1b8971sm8307755b3a.12.2024.11.04.13.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 13:01:35 -0800 (PST)
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
Subject: [PATCH net-next 4/4] net: ucc_geth: fix usage with NVMEM MAC address
Date: Mon,  4 Nov 2024 13:01:27 -0800
Message-ID: <20241104210127.307420-5-rosenp@gmail.com>
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

When nvmem is not ready, of_get_ethdev_address returns -EPROBE_DEFER. In
such a case, return -EPROBE_DEFER to avoid not having a proper MAC
address.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/net/ethernet/freescale/ucc_geth.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/freescale/ucc_geth.c b/drivers/net/ethernet/freescale/ucc_geth.c
index 88a9e7db687c..30453a20e467 100644
--- a/drivers/net/ethernet/freescale/ucc_geth.c
+++ b/drivers/net/ethernet/freescale/ucc_geth.c
@@ -3735,7 +3735,9 @@ static int ucc_geth_probe(struct platform_device* ofdev)
 		goto err_deregister_fixed_link;
 	}
 
-	of_get_ethdev_address(np, dev);
+	err = of_get_ethdev_address(np, dev);
+	if (err == -EPROBE_DEFER)
+		goto err_deregister_fixed_link;
 
 	ugeth->ug_info = ug_info;
 	ugeth->dev = device;
-- 
2.47.0


