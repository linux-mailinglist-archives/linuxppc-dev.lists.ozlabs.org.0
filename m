Return-Path: <linuxppc-dev+bounces-6002-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A1398A2DDA4
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Feb 2025 13:27:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YrRmX6Ry8z2xmZ;
	Sun,  9 Feb 2025 23:27:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::633"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739104044;
	cv=none; b=LN1gJ/BCcsVqExwHFbRWM4fB7fWU5tI2s8n29/GJiLf7LKj7X2o/N0PeuR3bY2WgBsmCIV25znoHfJNHvnEiiB+uI042Ar2WoViNHOARVOEb+J4LjFL/eScdzH+hLbvJvbge4y4RLML+28Yqjk1Hnu173PKcM8mWUPfT6Wkmh4KNh94IqR3EC9ANq/1PlAbPnR3NDCbBoY1nbQKxHoUWeyQAEa75e9vTQqJ08pXDi2Svy4pgZvCS+KA1miu008wtbQkJ7RYQxpz0Fl6RmhMxDKIyT9IyJCvWPZTozNOTpM9WQY/DmVjnldaEmXsj4NBv8kYTM+0v+MSjLwl1ZRstlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739104044; c=relaxed/relaxed;
	bh=s/Q0g45wO/Vm5iLpg41l4hJpa4Tg12cuaqUPd3vVcdI=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=kpyWIzQ4Ot7LtuMYKixso83MCKLuqhTzXZO/mLvBLlhBR1xwCqKzKVEX5DxLJnlkk9T8aiFfevIsfHu+N0BR+T0UoaA1uKdK8iww+WqsCtLjK1EapECvS7rae6jeAulYVqOxnlNaUiAArR5MhZM3nFJxnjj2TOFIrahvi01CjCrnX+kYfF9rw9xLy5/dlgklicROy3kqzeWHKD1EQWa7Dr9BdpknwJsEcL2FiWp5j1v04udiCa8zwD4swdeLhVdVaAaGli0TI9vIqQjPj6t8DmCVZunzP8QlyOOGa+LU2GQG7/Wrf7ej/UfGWRNfH3/cnX46aji+Nsyk5dRwRO88zQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=EQ9L3eHH; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com; envelope-from=hkallweit1@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=EQ9L3eHH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com; envelope-from=hkallweit1@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YrRmW2XZSz2xbS
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 Feb 2025 23:27:22 +1100 (AEDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-ab78e6edb48so292032666b.2
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 09 Feb 2025 04:27:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739104039; x=1739708839; darn=lists.ozlabs.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s/Q0g45wO/Vm5iLpg41l4hJpa4Tg12cuaqUPd3vVcdI=;
        b=EQ9L3eHHXjH2woLAS3Em6T2pMdTATlXrNdC6sgdUZ+ysgVjQDs1Cp1W2NY16NPj9O2
         O92Zk8qH1Fd80x30deoRNjZSSgZHX3+ehMRHuVJifAm1lbLpMNkmvdnljYcj+iPIfGe5
         v3/2YE1oqxYUmXB2Sw29HsQg7W4AXOCdIrtM86FXCHvD/lvDO9JwGfXOWFxbQjyyiX3A
         LOgXPAP2LiVgvmbVV+bAt3n1LYdhUDU3AybsRFCWHKyk3BEa4ZiWK2cmVRnit9q1BKXH
         wLRfgGABfkTn3H37vsuTRe3/xa+oOFoTWzTJKfihOcs89fCa44wBEfAqHrDCZQsMi+Ts
         Nb1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739104039; x=1739708839;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s/Q0g45wO/Vm5iLpg41l4hJpa4Tg12cuaqUPd3vVcdI=;
        b=NFkFK+uo3voXehH/MW295YssOZ17f3ZPHoFXbaAsvCYjysbNwcJyU/J/RQ8UD3spx0
         w74MKweCkjJkMfgDxI061g4B8yqGcjO7X/sW3WxFj4E9QcGdFS6hqxCbrX1VINLI5LoJ
         qC9G493MtAg4wFUZ4uydHLEDrXTDtk2bJrfbSYC9UJZAYvbXJ9+C1ZAZeyN5lFksYvo/
         TP5Dyxee2egVnLttpCZ34OiaqN3KkIgEaTeevmgiAx0QpztJfE5Y+eu5ImWt+Bi4jADy
         xDr5520PUtujUgN06bZZFUKU8Uv4vvhKQi2eEvfN51Gg2jYxPH8sZtHLQa4yHBA3uR6+
         SutQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjqtLcwMUGdNRL4Z2+9Lht3ah1uXuIO9UttTKRQi/pjqRpTsPxnzRlejbr6pbFfjl3v6lbkaPC4N0WfLc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyNY/Sz7rvUW0pMesbQ9B2sUctlPOFXwwmgtH7Ft1KeJrnC6qPc
	jrDSnzc84IXTzbD4H83ZdXOVipZxts1q09ZzjJxLDGAPW2hFrDQJ
X-Gm-Gg: ASbGncsfabtK26CPm3sZkXO5KCqT4N5zM1jGpHt7yuJqFtMFO9kNwTdHBYAtzABxENh
	O/Ane+tevheSZAWGjK8YLHc96s+1wGY3u+fB/vH/TgHGpGJtIvRa7tgDSXDwKREm1ZPU1XhAacz
	GCeUXXrfFb6WK1QTi0le+5NSF8mLxMV6kzjAUxN33LvGqJtx+rw5nfqJpb/XF2e8e/9uHa1lQ/7
	KExrYleLZjahRh8kHpKZzaCFyNQj49mpJCLthbYfscSnnJvpZYudeeIEina2Yurak2lCdb0xhr9
	qZHFyvs4u4p0bcHPlzfnMHKfk/94NcXRYFw+7h3FW512l9i+59CwB2YHkGj0V/gETdlBLJCsKdI
	iB43P2ayK76yQcKtUqxDa6BjO4bEf6HVsBB/rEt24Egdksf3Fs4TMiLgzCHCgC5H3hKETBeVhLq
	85ybWvh44=
X-Google-Smtp-Source: AGHT+IEhfxVc23G9a45HCrUbZrYLCTwURq5kvHB3aPAZ0j7Kz+eR1B9m+52RTg+woKuLjm2dzMnWlw==
X-Received: by 2002:a05:6402:210e:b0:5dc:58c8:3154 with SMTP id 4fb4d7f45d1cf-5de450800a4mr29998512a12.28.1739104039232;
        Sun, 09 Feb 2025 04:27:19 -0800 (PST)
Received: from ?IPV6:2a02:3100:acf0:cb00:e533:c1d0:f45f:da1c? (dynamic-2a02-3100-acf0-cb00-e533-c1d0-f45f-da1c.310.pool.telefonica.de. [2a02:3100:acf0:cb00:e533:c1d0:f45f:da1c])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-ab772f48882sm667378466b.19.2025.02.09.04.27.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Feb 2025 04:27:18 -0800 (PST)
Message-ID: <62e9429b-57e0-42ec-96a5-6a89553f441d@gmail.com>
Date: Sun, 9 Feb 2025 13:27:44 +0100
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
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, David Miller <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Simon Horman <horms@kernel.org>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 linuxppc-dev@lists.ozlabs.org
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH net-next] net: freescale: ucc_geth: remove unused
 PHY_INIT_TIMEOUT and PHY_CHANGE_TIME
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Both definitions are unused. Last users have been removed with:

1577ecef7666 ("netdev: Merge UCC and gianfar MDIO bus drivers")
728de4c927a3 ("ucc_geth: migrate ucc_geth to phylib")

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/net/ethernet/freescale/ucc_geth.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/ethernet/freescale/ucc_geth.h b/drivers/net/ethernet/freescale/ucc_geth.h
index 38789faae..84f92f638 100644
--- a/drivers/net/ethernet/freescale/ucc_geth.h
+++ b/drivers/net/ethernet/freescale/ucc_geth.h
@@ -890,8 +890,6 @@ struct ucc_geth_hardware_statistics {
 							   addresses */
 
 #define TX_TIMEOUT                              (1*HZ)
-#define PHY_INIT_TIMEOUT                        100000
-#define PHY_CHANGE_TIME                         2
 
 /* Fast Ethernet (10/100 Mbps) */
 #define UCC_GETH_URFS_INIT                      512	/* Rx virtual FIFO size
-- 
2.48.1


