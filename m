Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 750564B16EA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Feb 2022 21:29:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JvpJC0tZmz3cXG
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Feb 2022 07:29:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=XUKFP8rJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::230;
 helo=mail-lj1-x230.google.com; envelope-from=rikard.falkeborn@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=XUKFP8rJ; dkim-atps=neutral
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JvpGs4xhdz3bZF
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Feb 2022 07:28:19 +1100 (AEDT)
Received: by mail-lj1-x230.google.com with SMTP id e17so9695592ljk.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Feb 2022 12:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JAkfLqS1mn3oAfFq28iNQnGWVtiunNgv+AFmscduaNg=;
 b=XUKFP8rJPo9/aEd2lZb/1SLDebOiI5bN08CSRObyr0TipJnB++WKsWZNipwulLBg5h
 rLBh5j4A9JMD1CLTs/pbCDuHWPYsFGp2HgsuaQOt41mpegXKt69xayhBbKbhBs83dTCi
 52bhXpyw+YHnNr12FRi+PD/Pr7Aiptpz0v4cz11nW+SfTcllK6v4A/XVFOI3HnsCS2A2
 0JZ0Hmq9T+IIb/tQm3P5oIkADalBdldEQBs24ysc+scYr5D1uPcvLHYcmHnjb+fvQ1g/
 WiZDKQy6VjjvZjPoEQHZ0A4nsmw0CFeVa0x+qXPlKwZt2wFS+VTwigCkDfQd89M27yDH
 TG3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JAkfLqS1mn3oAfFq28iNQnGWVtiunNgv+AFmscduaNg=;
 b=8ChK5ihX/LSWkXZRZh0VSrSZOe4Iu5dx1Yf/T+/ssFqj2RuTyobB+p1kbQKOPnqoqZ
 6q+ellZyeQvDNMLKQhF2MftkYoKjck9liBIF7HqyQkBA+oUv/H1qeUbCk7NEqhcIVOor
 dtnRQ2wc3RsnXvfMEKdbvfJh7C6ZvNaNJMdNZuYkl1TMWnYvbhrEpGSD7SoV3v5noQX5
 ADpcQT2atMP/T2vgpdYX2ajd4g7ymV2Xq/n1BQNDp6DXoxK1lPVuq3BfuOFNa+C8bKP5
 mtKVJ/GeWQKnFcCh1QDsHEpycAg8nz8gfmHLMaPUk8bWwoMpgvYRRuvY4LVp5Pqwjpxb
 /K6Q==
X-Gm-Message-State: AOAM531SSY1MhG5HHeo/uwzakHjlWJeJxifqMi/7BFmuZN6NLw7ZQ61x
 qNSwH4Xg+zdU/RfTK07YIeI=
X-Google-Smtp-Source: ABdhPJwkyCZXBAi5XHnv9zFxw7zDY3V2YycrQwOLfPm7C4KciMKRmBBZQt6l+06emCum+AlV+5o7Mw==
X-Received: by 2002:a05:651c:1413:: with SMTP id
 u19mr6114885lje.240.1644524894855; 
 Thu, 10 Feb 2022 12:28:14 -0800 (PST)
Received: from localhost.localdomain (h-155-4-221-129.NA.cust.bahnhof.se.
 [155.4.221.129])
 by smtp.gmail.com with ESMTPSA id d19sm1223881lfg.108.2022.02.10.12.28.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 12:28:14 -0800 (PST)
From: Rikard Falkeborn <rikard.falkeborn@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>
Subject: [PATCH 1/3] crypto: omap-aes - Constify static attribute_group
Date: Thu, 10 Feb 2022 21:28:03 +0100
Message-Id: <20220210202805.7750-2-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220210202805.7750-1-rikard.falkeborn@gmail.com>
References: <20220210202805.7750-1-rikard.falkeborn@gmail.com>
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
Cc: linux-kernel@vger.kernel.org, Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 Paul Mackerras <paulus@samba.org>, linux-crypto@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The only usage of omap_aes_attr_group is to pass its address to
sysfs_{create,remove}_group(), which takes pointers to const struct
attribute_group. Make it const to allow the compiler to put it in
read-only memory.

Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
 drivers/crypto/omap-aes.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/omap-aes.c b/drivers/crypto/omap-aes.c
index a196bb8b1701..581211a92628 100644
--- a/drivers/crypto/omap-aes.c
+++ b/drivers/crypto/omap-aes.c
@@ -1093,7 +1093,7 @@ static struct attribute *omap_aes_attrs[] = {
 	NULL,
 };
 
-static struct attribute_group omap_aes_attr_group = {
+static const struct attribute_group omap_aes_attr_group = {
 	.attrs = omap_aes_attrs,
 };
 
-- 
2.35.1

