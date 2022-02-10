Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5604B16F4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Feb 2022 21:30:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JvpJt3mblz3cBN
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Feb 2022 07:30:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=iZl4wrtm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::229;
 helo=mail-lj1-x229.google.com; envelope-from=rikard.falkeborn@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=iZl4wrtm; dkim-atps=neutral
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JvpGs4skyz3bXg
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Feb 2022 07:28:19 +1100 (AEDT)
Received: by mail-lj1-x229.google.com with SMTP id q22so9662994ljh.7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Feb 2022 12:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0JFFc8Y8S/MJQV0pUH9CkbsR9iY9FpiUIqHH7t3EabQ=;
 b=iZl4wrtmPfNa48F4sIiGoav74iUIdFBNW7q/gQ7yUbZdO5dNdDExqFSlRI0u9Jhzef
 PM18OYFiAweR7Jh9wQbKV4Aixul3Dr1IzqSxmREUOgnPNGCUWfe+TZ3xmQO9gvr/Uaij
 S2/NhG9r2raBmVJK4GgsUxshaC773FXD2CP9y12gj1uznvuwMNAPnB4Co4d5dX9Ke4eH
 PERH7sBAGPvgWZ6xWTL0S+2EuI+vntZY+hhmCbJKc/po8s2wq8HR4mAo+A28RiL5pkiC
 u4y5rpUQwvdjxjdxlCzKMPLqz9ks5/YY9l+y7/LW7Fgt6CsyyKIzr4V7vrgk6DS7I0qU
 UYow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0JFFc8Y8S/MJQV0pUH9CkbsR9iY9FpiUIqHH7t3EabQ=;
 b=nr6A2huFzN8QWRFgCPT0PHrsxYM9MPwD7Ej/Y9uWRqLLeGbAa3gPOEDb/CNVhtq6jN
 949Oy89DmZFE04I3kZiF6yCzVJfekgl74wOZN99rafy/CckAER3Izr/oi/1q1605g7K3
 /cIy3bTRXwW3Aieq5tb6igVErNpWNUwFrcS6zewvNAvBFNkWxH8FmukTshktF/y6dC1u
 ZbO7mrsSje0YiOs/QQeUM4SvaFWd7OXplmzK9R46L0/6AvtMwHY9NtQDQyZYQfqbROim
 168w9b7g7ygj9G1VHlTNQCpTv5UySY9MRzJhvCSKX8RHkNglgz++lIOkkLl2x9X4JWHm
 4fZA==
X-Gm-Message-State: AOAM531Zr02s7nKZKSSzdDBUj7fvRHo9TsMGSlqTZk9sZf5/BmBYQ5Y+
 +aUVn30vZkao2DSS7PhX/Ww=
X-Google-Smtp-Source: ABdhPJxcR4HoAHzNcSWE2AHYc1G0dBt+nW2gRreDLBkUU1o2TFUZIlk4JdcwFpJMibKBogBF9NjTuw==
X-Received: by 2002:a2e:bc05:: with SMTP id b5mr6306919ljf.10.1644524895942;
 Thu, 10 Feb 2022 12:28:15 -0800 (PST)
Received: from localhost.localdomain (h-155-4-221-129.NA.cust.bahnhof.se.
 [155.4.221.129])
 by smtp.gmail.com with ESMTPSA id d19sm1223881lfg.108.2022.02.10.12.28.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 12:28:15 -0800 (PST)
From: Rikard Falkeborn <rikard.falkeborn@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>
Subject: [PATCH 2/3] crypto: omap-sham - Constify static attribute_group
Date: Thu, 10 Feb 2022 21:28:04 +0100
Message-Id: <20220210202805.7750-3-rikard.falkeborn@gmail.com>
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

The only usage of omap_sham_attr_group is to pass its address to
sysfs_{create,remove}_group(), which takes pointers to const struct
attribute_group. Make it const to allow the compiler to put it in
read-only memory.

Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
 drivers/crypto/omap-sham.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/omap-sham.c b/drivers/crypto/omap-sham.c
index f6bf53c00b61..4b37dc69a50c 100644
--- a/drivers/crypto/omap-sham.c
+++ b/drivers/crypto/omap-sham.c
@@ -2045,7 +2045,7 @@ static struct attribute *omap_sham_attrs[] = {
 	NULL,
 };
 
-static struct attribute_group omap_sham_attr_group = {
+static const struct attribute_group omap_sham_attr_group = {
 	.attrs = omap_sham_attrs,
 };
 
-- 
2.35.1

