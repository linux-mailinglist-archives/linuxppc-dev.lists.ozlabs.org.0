Return-Path: <linuxppc-dev+bounces-14563-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3E8C9BB76
	for <lists+linuxppc-dev@lfdr.de>; Tue, 02 Dec 2025 15:09:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dLN1z0bSJz3byj;
	Wed, 03 Dec 2025 01:09:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::630"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764684582;
	cv=none; b=aPHnKMos65LUjr9JZhFrSwVpAnwob6/FuE74rnsKkwWhmzxn7RAXGJeg9oBPcE5PLQ1C+7y9XwSNCgHHlC/bSYZnqz9WG4UtSoj6uAfjbX1Fm41oVfWJUBIrHhtXy9xxRIIXYnGEKelBrqDcHDEuLk2ZVXKb/EQiTLRrn6O2wDSFCHz623lRBfJfmRCdasXD6VC1tavX9XBkRNWJY50YF8Z0GRaQAbA3PFlU6mrBomydlqD8xAIH7gg8sf6DwEszeLuaFJO6jL4TqLgXTs4/ca9g4yS9TKPcXZ8Z5snE44axZh2bHdnFMS4FLYXrzmQIDjkaOlDJ08dhhSYAfeZnSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764684582; c=relaxed/relaxed;
	bh=DMa/urb/ThrPlFEDW22u26esLQ500hpne0pae4F4jXc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DQpOqxMzGU3fiRHqqb03V8U/pibGdCXV5WROEtWeV55LBeRKvd/5fRpobwWUorY1Zu6exZU9NjTzsl1Ru7y7DdoSv8khvBBh+A2bLJUpgHNjlzCgWBwFctwaXduGwpKFYCiAk2doJYqNB3k3VVuI1ypBm0lwlU5YCOssGRN0ncPSDuTH1CPE2zfeNOqPfK+9Tgwuf7h+hCohxfhrGOCKd3QLoT7eKe9Kz1URHjDOJhO9+Ot4VPjVkGrqwK2hNO4dQGWOt0M0gf+8snT3mebQNriU8eonaQyG23ZY/fzHE0sokAO/34E5POFebWxMEpu3/kA1ZL34T9h5SIeaEJnDvA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=baylibre.com; dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=w0XJSI80; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com; envelope-from=ukleinek@baylibre.com; receiver=lists.ozlabs.org) smtp.mailfrom=baylibre.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=w0XJSI80;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=baylibre.com (client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com; envelope-from=ukleinek@baylibre.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dLN1v5C8yz3bsS
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Dec 2025 01:09:39 +1100 (AEDT)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-b739ef3f739so299957666b.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 02 Dec 2025 06:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1764684571; x=1765289371; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DMa/urb/ThrPlFEDW22u26esLQ500hpne0pae4F4jXc=;
        b=w0XJSI80euHV6yY3GzDnYPeG0RhRpueFNKqR9nAyZcRa8TLAi1cR4BvbrLXLG7sZaz
         wpnPjr9SoTtc2jlM6APKZvFiukoZ4wYlFrttvFJla/35nzCZ1f2D03UhGji+vNJOy0Or
         WdKLpmGlPdLWXJS8NeQDywPaOE83VRErOqeKScIiFTLRKSywICLBrCtAU3ellOWb5sAC
         rq2su+fTXMmoUbibbmbwebJAln5FMNWoIu1d6oqiceZ9G/sA0H+GV7oMZ67bHWTL4nbT
         9YgsCf1KNWBx77cGoRhpOOW0C5NIK9Nsb71u1l3JYsQcmca4PIzPVGH7joVeYoX055Ta
         jBDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764684571; x=1765289371;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DMa/urb/ThrPlFEDW22u26esLQ500hpne0pae4F4jXc=;
        b=VuT0RJpDGGA93TRXDVQXP528hDcWmXRpEsZxUE2rUrw+qC7NjGsD65zXkt1cy71UNZ
         CMGffT8sfGkZbkviVSuqsqTk2148YEUxH+mGPgaNC1WzWdQfzR/2MLgcAE5QmNLVbTD0
         znwxL8DNyy7hq6jB53MbqEBadcVTXC2J30gxFwf0Yb4yymqzlY+KOU0JWCpD5KNnv51u
         PfGsbAgD9VRzXNRhGJD975oK75wu+fG50CZUimqlJnIM7bFUuy+2plf2q+sdANdNalyC
         4kdCKUCP7QHKH40YoG/o0fOTb/P9EaG3JDuA2FvpG+Jx3Lh1OoWHkn2nDVzUocMpuANh
         TdVg==
X-Gm-Message-State: AOJu0Yzw4GjoJPlfH4JUSACESR3RCC4JuMpmhhI2yQSZ+k7BTSHzstuw
	aYidRxF+H2pcYSYl11T7NEZq1SY3e+cUArG8Zr3jnUsyJaPL+psmQOGNJZFWyNWPO7c=
X-Gm-Gg: ASbGnctGUhRERid5GfxwNoO1ZQXwQzqWdE5NiyFeS0mJ6nYxD144WYFeAxuabyZ1/Vk
	VjV4o2K5d6vbgmJhQMX2Ea/q2iOSPrB0Qr5DMM/snCDzOw4xJrJ/ibJhTU575heTWmjiZjQiFW8
	7oj2DwLJ/tHVt48ZLBfx2Pq8nUOWaE7vuQmCgwyKMX50GGbCSZR3iUhRNY3K5c5+BgPkRK+JBKu
	0s+xIRfQD57eGEhWo1R74HTJ5SvABtJp+pAFO05cgBdwcpITfvRE5Lc1/JEMwyEW8g4OJgDWw+/
	Cg4AMip87p9JJJshX/PgocWiUgIVr/b7JZNiFUM4Is9qJ0iLIDWPowVuNXVtWC/nSjw3odYkxum
	FKSwzxSKSp3m44v9H8B7ozrtEf9nGsLWrKjsQYmnl4Zd2NiIYyL3nnKxhjkHNw+WrPKO00Zya9T
	3R9E7vWm4h5ioKCtq6kIWsGPvsSmFBogWwY6w7BQPo63db7vT7w02qbKtezJxfMyZXa/Guu1ESr
	f4=
X-Google-Smtp-Source: AGHT+IFmOwa04jR3vlTaC5qNYIonoSKzOCwEkZGc4UCJiaiHXQAl+Q2G2uWQXgdy7j/j5yBILJMrhQ==
X-Received: by 2002:a17:907:72cd:b0:b73:6d78:9b79 with SMTP id a640c23a62f3a-b76c54b8a7bmr3778546866b.20.1764684571341;
        Tue, 02 Dec 2025 06:09:31 -0800 (PST)
Received: from localhost (p200300f65f006608c90d1d7fe637464b.dip0.t-ipconnect.de. [2003:f6:5f00:6608:c90d:1d7f:e637:464b])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b76f59aea78sm1470028766b.36.2025.12.02.06.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 06:09:30 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 0/2] bus: fsl-mc: Convert to bus callbacks
Date: Tue,  2 Dec 2025 15:09:18 +0100
Message-ID: <cover.1764684327.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=541; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=/RJRiglTwDq/b0ta8q9LhHk0GP5+3sqVlNz5rx+ndYc=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpLvMOECyPJ/+IqTQYLrP55aiikQFNo6oXyu3iZ 6Cw94MYYpaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaS7zDgAKCRCPgPtYfRL+ TjPcB/9LLcqm4USmpVquAdVUDgpzt3xYNldL85xepTfEy0HC89S7j7ET5PmbxOc9wEc7dJr2V5o cFuHuPvIXHLYcA4Rp0dKqqVSXcKKvyXog+Sw9oS6W8KBi+HSdFTQjUwFUKE7aqwGWiiJrpNUaIz q5YHHz/wOMmkjcNfGl2PtfXx0rWzX1C03mabyJDEBor8DuM4/HnLuNLTBVOLPppsz9HPbXQBDoz yrtdxt5U0fiGZIBOdUJTUozC8jYK9aRIUNPs4rYjEPoYWGv3Pa0ZlT3POE/47Nj0c4n2uPnjZFJ 3+GgvbUhCrSjNLsFNWUYK+HHpDeokRK8v0rrm/ixO/GY6jgA
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hello,

with the eventual objective to drop .probe, .remove and .shutdown from
struct device_driver convert the fsl-mc bus to use proper bus functions.

There is no intended change of behaviour.

Best regards
Uwe

Uwe Kleine-König (2):
  bus: fsl-mc: Drop error message in probe function
  bus: fsl-mc: Convert to bus callbacks

 drivers/bus/fsl-mc/fsl-mc-bus.c | 77 ++++++++++++++-------------------
 1 file changed, 32 insertions(+), 45 deletions(-)


base-commit: 7d0a66e4bb9081d75c82ec4957c50034cb0ea449
-- 
2.47.3


