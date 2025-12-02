Return-Path: <linuxppc-dev+bounces-14561-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 236EAC9BB73
	for <lists+linuxppc-dev@lfdr.de>; Tue, 02 Dec 2025 15:09:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dLN1y4Dfrz3btq;
	Wed, 03 Dec 2025 01:09:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::632"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764684582;
	cv=none; b=KPLY3oZuL7Z9QXRk/wSS202Y0yRJFGipIF2AkoA5TkZCa2uNBIjLuivUaT0mf0sRvhjIrH/FDnBaePXof+x0E/GjTm4F7y2FdX4tp1wQaivTgQizNiHSLwB0YpCjjgKCC3JgHHF54EBWZK9bcxRypPqDf0+/nOCgdYvkMBSH8l38btak+azv05dc+JgB+o4VMazK+yPRVq9+Y/OamEq6xRcP2dwRrKv6SfG0MPCHGjGCpL3J2tai4Bsn9GOrYGeitPOjhg9z04Fav1xyqK/Ivh3EgYuR9CJ6zoxmynhHRCxxLXUrUaILTgkiZGfP8nWRcEOSzXgCwVXFFrqxF2e35w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764684582; c=relaxed/relaxed;
	bh=u5fqqXVelWjhXMRnMuDnOU2/tvOubBj8tdqlv18yr7U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bbrMnkomaeEKMwX+4WHf6EzMcL5qp9+Q8SQPBjZT/CKqwTlZNAKU3PS68MMrcb5EwOLqige3cQvYXv2R0+8bL8mgebpPdSAevUT7Mp3kQZEiDQ0Mt9GLjcXK1MT30++4OrcMWbsWzOx2QdDFOvnO4eIGK6wcekK9EpLowdcoxGMRLkUmLW6cOv1yP/V9a7nOPV0xJddx6u3S28NZE1ZqbzXWMNycujTRB2l2jbn7Jan5z3M5BcVMpXAh7sUYDFHdtPa4x7bzy37wBJ6pRyDIlJvWMDjqFAQBkQsqDVYVWn7HtPb4mKL/7h4CxPLrQeGqID+jNFAs1WZQsZ2iP2qT4g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=baylibre.com; dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=ibC29g/1; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com; envelope-from=ukleinek@baylibre.com; receiver=lists.ozlabs.org) smtp.mailfrom=baylibre.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=ibC29g/1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=baylibre.com (client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com; envelope-from=ukleinek@baylibre.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dLN1v0tfDz3bsQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Dec 2025 01:09:36 +1100 (AEDT)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-b735487129fso794697566b.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 02 Dec 2025 06:09:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1764684572; x=1765289372; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u5fqqXVelWjhXMRnMuDnOU2/tvOubBj8tdqlv18yr7U=;
        b=ibC29g/1031fuMe//G3gV2n6TrenlPZvAYwm85ySxcstYfx1eYP4Zs51RPZRJwQr94
         QQgNssxkDqDo7r0eJHOTktPwaj/EUfaTUOJevljyy8fOI8WT2PMn0tRuHcFvGry3gxEK
         gQILJX06EMeBiVAsJvqbCdyAUyTQ7/vJLkRnfeV2M51zOX3b2dKC6uZ8nfez3i84/0DJ
         Pnp2xMm7LOEB8eUODZrLsY5PmmhhOz5t/pQoKk4PESghW/qcU3fSvgq3z5zfxwNOUgKt
         xOtGIOWPfZG4efJMuqHNv/u7/NWkvrGR+VnHhQUzME1pE2a6Vuvs63KfbpnBpxtNpCVy
         ItaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764684572; x=1765289372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u5fqqXVelWjhXMRnMuDnOU2/tvOubBj8tdqlv18yr7U=;
        b=jNaqIqCzODvaHVYSgE7wXnR35uVj791+mSYMiBzTJ9iktyj7ahbKFVizqPHL501MMT
         4wQ46VNImD80mUEjMRFV68haRBJ1euPx3/LHIIRIyAzPaaGF7XjDSje4RS5VdG0hUjlH
         HYAVO6Aidv+F34Cdt7Ua/1A4qFUE2smcSvUXySHR3XPzKMQchtgVdN3OB0q+MlhK2Thj
         2JnH32JgRsVb0MLw6R4PylnRuHZbfoRUnPa/Dc5OAwX8S5VbTHPAt9cIo+96pO7M7TiS
         6PL67SpUAhTDMYIdTf8ksODqcW1FzGkcJS6/+krN+p7w/kh61oPAYptIlQT6VZ7nG9eA
         +y3A==
X-Gm-Message-State: AOJu0YwObG98g2IAonXHSWtiDq9bFvCrkuKZqB0ARU0NI2QH2hlCtWkg
	B/h+J+K2shP9BH5zIZWir+KnNP2Z10KtgZBc44TUQpYHEZczkN9kw5OyS4QfL8Mivxw=
X-Gm-Gg: ASbGncvnOehajgaNjgEiIV8NnTQK3PuHFhXevFeddCr4Mls/pAJnuqR7LX/y4PBV4AN
	torgj8M+FC/aUsur+0m2NiQTks+X4lNDAGaGI+HmDMIjhlf2s2Jpu+dIjyJfJAqJG6HXd5dPTnZ
	GjkV3IL695Ir7pJWXrAF+RwBT92A9onBoDviL8JfTxbBQk08VfLSxF33buc+JT4hei0Q8bPMUKk
	lYgNH5QDsrkzSrO9whFvb+eCE9Mm+AB4w1AB5SKzBoyXSmLEmv9B+Vt8ta5DRSpbvXX/qUNkPht
	HRwysv0gel/SQSgTBOMD2y1Jo8WJLJKEiEUGQRHTa63EN/q+hTmkKo76+8mr8NnOlXs3cT6igXp
	3GRfm9t7hCTVAyyAUzlzhgb4io9ygS+ODmHUYYK7oJwjU0GKb3Aa2vymGmX93dxGqlran3xcHzC
	5ECipF2TP9lT7MLvfbDz3JNnBxKVMx0LQCpRYFacF/TP7Ddwxsau6uTiLdgOGSn7oV7/0Ob1AWj
	xo=
X-Google-Smtp-Source: AGHT+IHaK8lU44ArToflsiBJWEoxxGEp7KKK5qh0mlGv7cncmxBpRAnQWJg45mc3K1i3QkMoVgWwWg==
X-Received: by 2002:a17:907:94c3:b0:b73:2b08:ac70 with SMTP id a640c23a62f3a-b76718cfdf2mr4933843466b.49.1764684572456;
        Tue, 02 Dec 2025 06:09:32 -0800 (PST)
Received: from localhost (p200300f65f006608c90d1d7fe637464b.dip0.t-ipconnect.de. [2003:f6:5f00:6608:c90d:1d7f:e637:464b])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b76f5a4b926sm1527352566b.68.2025.12.02.06.09.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 06:09:32 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 1/2] bus: fsl-mc: Drop error message in probe function
Date: Tue,  2 Dec 2025 15:09:19 +0100
Message-ID:  <52c89497f78839446713a9c5456defce97a74c7d.1764684327.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1764684327.git.u.kleine-koenig@baylibre.com>
References: <cover.1764684327.git.u.kleine-koenig@baylibre.com>
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=931; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=rGedrLMxTlyfPxZC1WVwHH4H8Qouy+qKqsFxp/fpLx4=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpLvMRJomKeuIvIZqpcMNngak6GmXbj2V7KPZ0m luyRHsWeY2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaS7zEQAKCRCPgPtYfRL+ TqymB/42TW9HC73oSVnoByC9FhjGRdbTf8d6JMRwL0mw2KeK1t3dcoX3lJbrNrwLyo53BFvQqVs TFJzldQq/PKqqeo6fh6ZNhRz0uigea0ZdQqk9nWlLFDrfqbe5QI8nGR0Vfb+w+0q2SeTSOreL/V 9VnkgX1BtZ+P9ftmgxUDXi4+3Az09j76jJKdnqcA9Mccpvrnqx6BnJL2qbfJOKgajVRVOa0ef3c LgyCJh+NLC9k+wLhEILO94yZ+tF76t8KoM+4SjG8WMUTKdg6HkZKJ/saohw5KOr9/1Nt2TTDzVo UbsEYi/gt4KRutp+nneu+m8Wq1jQePycHSVEHGvQQiD2En99
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The driver core already emits an error message when probe fails, see
call_driver_probe() in drivers/base/dd.c. So drop the duplicated error
message.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/bus/fsl-mc/fsl-mc-bus.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/bus/fsl-mc/fsl-mc-bus.c b/drivers/bus/fsl-mc/fsl-mc-bus.c
index 25845c04e562..0f0a5067f109 100644
--- a/drivers/bus/fsl-mc/fsl-mc-bus.c
+++ b/drivers/bus/fsl-mc/fsl-mc-bus.c
@@ -442,14 +442,7 @@ static int fsl_mc_driver_probe(struct device *dev)
 
 	mc_drv = to_fsl_mc_driver(dev->driver);
 
-	error = mc_drv->probe(mc_dev);
-	if (error < 0) {
-		if (error != -EPROBE_DEFER)
-			dev_err(dev, "%s failed: %d\n", __func__, error);
-		return error;
-	}
-
-	return 0;
+	return mc_drv->probe(mc_dev);
 }
 
 static int fsl_mc_driver_remove(struct device *dev)
-- 
2.47.3


