Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4819A6B4794
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Mar 2023 15:51:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PY8CC1NJMz3ftt
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Mar 2023 01:51:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.167.181; helo=mail-oi1-f181.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PY87f5zxhz3fWl
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Mar 2023 01:48:46 +1100 (AEDT)
Received: by mail-oi1-f181.google.com with SMTP id c11so4412398oiw.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Mar 2023 06:48:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678459724;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZSlcrAdOk2ZHbJaFPGHkD2mhUxcO2+0jdOc1ehU4BF0=;
        b=do+XO4Ibk45tOoCb2ZUm65UIu377n+zZIJs1iPR3h1Vy/aYVa717qGzIM8gBVlMFWs
         CRE3C2lZ2LfzalNUR/Xz9swFPsVoidfTAcCBPdjTUjKAVIH2fHdcTkomQTfpLbtLD8YV
         47m2yflELDNXVXoBOoMvFGTN65WoQ7CIT6h/7QRDvjYn7dCjJOSbmSBaF+nYXv0+dTQS
         c4Uz0KlMrzYs49kP3kwjjckmG6dQkmh+w9plMj/IvLhSVlQOXoouFQ5NCa7RpZ7xEjGr
         pI3Rw05+hboUtM3e7TuQAQhDkK0OAgydaQQZptZiCgQqiPXngbB+hRjCYG3Sm99XIImt
         AvTQ==
X-Gm-Message-State: AO0yUKV3JIB2SleNYrVSbw7JKoIYxd0XvbLGiUR6k3gqlaUcjtEQip+T
	zTfjvNCcT3PM/VS1nYXaD7rBbgzPfQ==
X-Google-Smtp-Source: AK7set81+R7SptvFiU1mElhgKcbUszs0JCXieCGbcvg5GrDnQizYVUU/z1OANIDVszl1Z9u1lrX8nw==
X-Received: by 2002:aca:2210:0:b0:384:ea9:237d with SMTP id b16-20020aca2210000000b003840ea9237dmr11076654oic.36.1678459724416;
        Fri, 10 Mar 2023 06:48:44 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id y129-20020acae187000000b0038476262f65sm967368oig.33.2023.03.10.06.48.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 06:48:43 -0800 (PST)
Received: (nullmailer pid 1546844 invoked by uid 1000);
	Fri, 10 Mar 2023 14:47:35 -0000
From: Rob Herring <robh@kernel.org>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Colin Leroy <colin@colino.net>
Subject: [PATCH] macintosh: Use of_property_present() for testing DT property presence
Date: Fri, 10 Mar 2023 08:47:35 -0600
Message-Id: <20230310144735.1546817-1-robh@kernel.org>
X-Mailer: git-send-email 2.39.2
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
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

It is preferred to use typed property access functions (i.e.
of_property_read_<type> functions) rather than low-level
of_get_property/of_find_property functions for reading properties. As
part of this, convert of_get_property/of_find_property calls to the
recently added of_property_present() helper when we just want to test
for presence of a property and nothing more.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/macintosh/rack-meter.c    | 2 +-
 drivers/macintosh/therm_adt746x.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/macintosh/rack-meter.c b/drivers/macintosh/rack-meter.c
index c28893e41a8b..40240bce77b0 100644
--- a/drivers/macintosh/rack-meter.c
+++ b/drivers/macintosh/rack-meter.c
@@ -387,7 +387,7 @@ static int rackmeter_probe(struct macio_dev* mdev,
 	       if (of_node_name_eq(np, "lightshow"))
 		       break;
 	       if (of_node_name_eq(np, "sound") &&
-		   of_get_property(np, "virtual", NULL) != NULL)
+		   of_property_present(np, "virtual"))
 		       break;
 	}
 	if (np == NULL) {
diff --git a/drivers/macintosh/therm_adt746x.c b/drivers/macintosh/therm_adt746x.c
index 8f5db9093c9a..384b87d661e1 100644
--- a/drivers/macintosh/therm_adt746x.c
+++ b/drivers/macintosh/therm_adt746x.c
@@ -483,7 +483,7 @@ static int probe_thermostat(struct i2c_client *client)
 	if (vers != 1)
 		return -ENXIO;
 
-	if (of_get_property(np, "hwsensor-location", NULL)) {
+	if (of_property_present(np, "hwsensor-location")) {
 		for (i = 0; i < 3; i++) {
 			sensor_location[i] = of_get_property(np,
 					"hwsensor-location", NULL) + offset;
-- 
2.39.2

