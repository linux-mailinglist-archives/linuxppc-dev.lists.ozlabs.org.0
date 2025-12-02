Return-Path: <linuxppc-dev+bounces-14562-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 46CD7C9BB6D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 02 Dec 2025 15:09:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dLN1y4Kq9z3bvX;
	Wed, 03 Dec 2025 01:09:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::530"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764684582;
	cv=none; b=OrE8dWyGFXZc9N9JLqKvgOIXyWXQJ23QLjkm+3FSpYOOCPuBNgfu+Phlh7+fH9BKzbU4lHGJdSDwHc7Um7HD51T2rgQURY629fuM8DklvTSAfYEp7wCuNn9DU12noiAsjjpyUARvP3O33DnxMUQ7hWta/pfi9XJbTvn505JqOrX+iG+xPty2cBqTCWHeOITf7BGJam2Z7IoYPa1cMvJtlPuez+kt8sD/wpLzTzKCtTEncfKz8R8WtJtc6P09cSkZx8SraPNrCTwd7WrGURciKFaYqOXqf8P6vnC26/Ul5MQqCxzgAXZYduYiszoWMHGIhddFAc37vT3vaR9tIzFB4A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764684582; c=relaxed/relaxed;
	bh=lrZ8CFGQ6uW54LhbL4RHSvgC5v+XbmRr1aIAeG+BF5s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BYGRwM6lQkJopnF00vdrkoJDWDpXXDDm0mVvqSiWurF3r+Yj3x6QwmMq8IlLDm1MShC/aTLYbrSSLdIjv/5ST3x6et8AXRmE9NhU+aNnltOisdoSYz+SAUeGO64M5rXc9Fu3VzkBbgFZ6xlbWDNGevGOp6cotL9aVVZvDxrwCjFsxkmbB4c3mYOJ98eY9r8ls+3MRoBnKqv/8Cf7yjWyecHSe292gzeK6xfOKEaISPDFgnGLJkw6Q6Mvh8bS9Xm7ZaBD84NZn1+oVnTRjeorVKiVZ/GO+5nIfrmobJOqb+LKubBCQH7fybmVmRxH5DIDtK9FZY3PFmJK0HNnVCaWeQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=baylibre.com; dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=uLpDA/Yb; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com; envelope-from=ukleinek@baylibre.com; receiver=lists.ozlabs.org) smtp.mailfrom=baylibre.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=uLpDA/Yb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=baylibre.com (client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com; envelope-from=ukleinek@baylibre.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dLN1v0Y53z3bqs
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Dec 2025 01:09:37 +1100 (AEDT)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-640ca678745so9557993a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 02 Dec 2025 06:09:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1764684574; x=1765289374; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lrZ8CFGQ6uW54LhbL4RHSvgC5v+XbmRr1aIAeG+BF5s=;
        b=uLpDA/Yb4xD5nwL/Y+TNrsZsdshto9sP55QJ7RTe78t4b6FcpWlGnHuol06SgN4D6u
         YcfVuwJ34wXtUqtFTXqbK2jAsVv2q2qMNAoOBlHRcn44mOOcykTGz0yJqmEVleW0OTnb
         tGxGw7e+PKOs8NL5M2LeBxUIvP1XMNq5PQ95k+n0DVKY33prXFpKW3EhPiH+wZstemBR
         tTrqFg8ZDiNRtFd/n/KD1WyzkJg7dPkYtQuLdF37OXp4/rym2MCv3ErlXdzy4Uss7lah
         ktw3isOnHZUNwNGdpepW4q7qgob72OME1FtbQT4zU/kfBbASxIrFUHguw9xtswq3Wuh5
         5mqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764684574; x=1765289374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lrZ8CFGQ6uW54LhbL4RHSvgC5v+XbmRr1aIAeG+BF5s=;
        b=Trnpr2lRC3TV9X4xQTIqenteyALljDS87zn8p8I8rPCmjxvZNUCVeHwC0JnV3azwc8
         CMwyyN8I95o+MDFLY2+U/srtw+oVKFxtOt1fE34o8Cv3tLXIN8GazNYCpRaBuqA8LqhQ
         x2froRT+Hxf693ARh5ZzyIApjPkTe3m94zIFOuji4F2zm4KKHRaEdcP5OXz+KsyiJpya
         fEOD4y4iqwhEO9mgIm6Xe1WBzh8JmFj+dWqw1a/gBvbjx3BbcEW7zwMDLEwj2rCGaJxg
         f9S6P5Qs05F9SocVIVbibRHzE7CRmp1XaPne0DkM9M0VGNqYr/0Un6IX8aeG2XQqJAb4
         1ufQ==
X-Gm-Message-State: AOJu0Yx4y1F8AxzfAIeujTaMCjoZRNILVQUYmoOhhhDzyVRwVdjNnD+9
	N1l3XEPqk2Nwz2pl8FG72I6KmOFUcHzsCiXxAEhRfyji4xlf2Hqo8cnutTDgCu1Fgr4=
X-Gm-Gg: ASbGncttuAVE7teVeBzy2IomagYNTye4e4zJpt/C/pgm7TWNGBD3veGQNGPoaKV015w
	fkbdR9ukAnle+cEmNUv9SCHenBflmo8E5QbVzpPlbO9MsOh2AqVQglmZpbKCg3CIF68PgczDgm9
	0dE2Un0GKp6e0FXYygOjKMm+bm+N8oLE5xvUN90zm0pOZ6qaODF68f5itN9nCOoKEpcNt8/3a5V
	zyYNUR64CW9HBMAkbyIJ4IVDyjg8rBPKL+V76JufU3oCJUk1YgzfibyuX2GC4Jq6Swh/cgeNeHM
	U4LG1Ihgiz137jijtf09dMNXW4g8nqT2BlilxlZ29Aa37BIrrRqr6irmfxgv+L+29a6D0Rgdw3G
	myoiXJH/XyQukLC6ytKGOJyS9a4FzXiYcPaW58xJaj9NHgXJUXm6E7x/HuCs9Y8vxImM4c7fwYC
	de6vYN2eBzviSGlyeT7vtv/qMXnrgGoAZa8r6Qs8yygi58E0uf9IACkmH5MFevMUa6eCUJsuvN/
	RM=
X-Google-Smtp-Source: AGHT+IE3wDnvbH9fogu00AvNsGUXcFOg5u6c/bSfcbWXbLbv/0Eb929HIQeIzwHb04w6+GsbANNayA==
X-Received: by 2002:a05:6402:4388:b0:645:cd33:7db5 with SMTP id 4fb4d7f45d1cf-645cd337dd5mr26143732a12.24.1764684574488;
        Tue, 02 Dec 2025 06:09:34 -0800 (PST)
Received: from localhost (p200300f65f006608c90d1d7fe637464b.dip0.t-ipconnect.de. [2003:f6:5f00:6608:c90d:1d7f:e637:464b])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-64750a6ea4csm15754945a12.4.2025.12.02.06.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 06:09:33 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 2/2] bus: fsl-mc: Convert to bus callbacks
Date: Tue,  2 Dec 2025 15:09:20 +0100
Message-ID:  <848fffe5c479d899c04a4c99ccb5f0128ccc942d.1764684327.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3319; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=EC/ESygIHtIaQ2DhXIiCCTElGKwY3/uSrKeqUf1SlOw=; b=owGbwMvMwMXY3/A7olbonx/jabUkhky9z8Lv9pZXs/poSsyzkPZdvG1/wVKLU3uDlCXjBIVnh LA68CV2MhqzMDByMciKKbLYN67JtKqSi+xc++8yzCBWJpApDFycAjCRvHD2/x5sKnN6mHQed3GI 7Jc6/CpLy/cAq9PnLGkNt+mr7F0e7BVkiA6QkvsUavhy0m+jnRcFtNJk4k85pAirbjvi+I27+4f c8dQzCqXf/J64Xepne1/qsysysmQKg//DuJqzq/1b2D4E5vRKzZRoVzG3n7vr3KsHV3eocRZH3f nSOeehU8M+2+RwNlcZlpVpFi1Hs1b8lwnndlKu/5yRIScZ6y3c0PvVIqvaS9JFZvqDe6tOTVuiv ZLniPURxhtqRzef0540t8mh2M0471ekw183DRdZ07fnT3ELvWRXWndJSmV6bePmBYcS9cMShAx8 XQ9aWhz+6hs858W+I882y3S+fc/pJxXuvjnN/FJP028A
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

With the eventual goal to drop .probe(), .remove() and .shutdown() from
struct device_driver, convert the fsl bus to use bus methods.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/bus/fsl-mc/fsl-mc-bus.c | 70 +++++++++++++++------------------
 1 file changed, 32 insertions(+), 38 deletions(-)

diff --git a/drivers/bus/fsl-mc/fsl-mc-bus.c b/drivers/bus/fsl-mc/fsl-mc-bus.c
index 0f0a5067f109..6bc163d2ca49 100644
--- a/drivers/bus/fsl-mc/fsl-mc-bus.c
+++ b/drivers/bus/fsl-mc/fsl-mc-bus.c
@@ -137,6 +137,35 @@ static int fsl_mc_bus_uevent(const struct device *dev, struct kobj_uevent_env *e
 	return 0;
 }
 
+static int fsl_mc_probe(struct device *dev)
+{
+	struct fsl_mc_driver *mc_drv = to_fsl_mc_driver(dev->driver);
+	struct fsl_mc_device *mc_dev = to_fsl_mc_device(dev);
+
+	if (mc_drv->probe)
+		return mc_drv->probe(mc_dev);
+
+	return 0;
+}
+
+static void fsl_mc_remove(struct device *dev)
+{
+	struct fsl_mc_driver *mc_drv = to_fsl_mc_driver(dev->driver);
+	struct fsl_mc_device *mc_dev = to_fsl_mc_device(dev);
+
+	if (mc_drv->remove)
+		mc_drv->remove(mc_dev);
+}
+
+static void fsl_mc_shutdown(struct device *dev)
+{
+	struct fsl_mc_driver *mc_drv = to_fsl_mc_driver(dev->driver);
+	struct fsl_mc_device *mc_dev = to_fsl_mc_device(dev);
+
+	if (mc_drv->shutdown)
+		mc_drv->shutdown(mc_dev);
+}
+
 static int fsl_mc_dma_configure(struct device *dev)
 {
 	const struct device_driver *drv = READ_ONCE(dev->driver);
@@ -314,6 +343,9 @@ const struct bus_type fsl_mc_bus_type = {
 	.name = "fsl-mc",
 	.match = fsl_mc_bus_match,
 	.uevent = fsl_mc_bus_uevent,
+	.probe = fsl_mc_probe,
+	.remove = fsl_mc_remove,
+	.shutdown = fsl_mc_shutdown,
 	.dma_configure  = fsl_mc_dma_configure,
 	.dma_cleanup = fsl_mc_dma_cleanup,
 	.dev_groups = fsl_mc_dev_groups,
@@ -434,35 +466,6 @@ static const struct device_type *fsl_mc_get_device_type(const char *type)
 	return NULL;
 }
 
-static int fsl_mc_driver_probe(struct device *dev)
-{
-	struct fsl_mc_driver *mc_drv;
-	struct fsl_mc_device *mc_dev = to_fsl_mc_device(dev);
-	int error;
-
-	mc_drv = to_fsl_mc_driver(dev->driver);
-
-	return mc_drv->probe(mc_dev);
-}
-
-static int fsl_mc_driver_remove(struct device *dev)
-{
-	struct fsl_mc_driver *mc_drv = to_fsl_mc_driver(dev->driver);
-	struct fsl_mc_device *mc_dev = to_fsl_mc_device(dev);
-
-	mc_drv->remove(mc_dev);
-
-	return 0;
-}
-
-static void fsl_mc_driver_shutdown(struct device *dev)
-{
-	struct fsl_mc_driver *mc_drv = to_fsl_mc_driver(dev->driver);
-	struct fsl_mc_device *mc_dev = to_fsl_mc_device(dev);
-
-	mc_drv->shutdown(mc_dev);
-}
-
 /*
  * __fsl_mc_driver_register - registers a child device driver with the
  * MC bus
@@ -479,15 +482,6 @@ int __fsl_mc_driver_register(struct fsl_mc_driver *mc_driver,
 	mc_driver->driver.owner = owner;
 	mc_driver->driver.bus = &fsl_mc_bus_type;
 
-	if (mc_driver->probe)
-		mc_driver->driver.probe = fsl_mc_driver_probe;
-
-	if (mc_driver->remove)
-		mc_driver->driver.remove = fsl_mc_driver_remove;
-
-	if (mc_driver->shutdown)
-		mc_driver->driver.shutdown = fsl_mc_driver_shutdown;
-
 	error = driver_register(&mc_driver->driver);
 	if (error < 0) {
 		pr_err("driver_register() failed for %s: %d\n",
-- 
2.47.3


