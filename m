Return-Path: <linuxppc-dev+bounces-409-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0438F95C5E9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2024 08:58:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqrWN4YCyz2yk3;
	Fri, 23 Aug 2024 16:58:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=95.215.58.184
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724394771;
	cv=none; b=dz8SDFlpg4ga1tadOQLmPuJaWxS/t9ZLoPJfjn5JkVLy3PupqE5e+OcE5OaQQdzAv6yybIzfcR4yvtJfwehGBO7faq5cILohMgBazRyVP/RNefJFw9rVBjFd9mqovnsH7uz3K2B5rfDEB+V0B4urHG7tynRWDqhktghX08DOsH4ow4jEY0Hlnz4ZqxQsLTFM7c/32i08mlNPAzOTEqV8o2hvmalFGpCOfugPT230Z7xobjtz7fly8+ms4089TJ/DZwZCWbq9SI+lmLX+3T+tYG7dtPgGFynuq2sBJF1PWAZV3hlRTIVmpY78gn+gOenJQP+hhaBhhFPGVBSGvgqNlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724394771; c=relaxed/relaxed;
	bh=UPXD9Xz1BaTvCyjpi0+oHDqdxADzbC7LmDSjyBTL2ZU=;
	h=X-Greylist:X-Report-Abuse:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:MIME-Version:Content-Transfer-Encoding:X-Migadu-Flow;
	b=HDL37J/AJPo+fdE9UGifViwuwzXV2qd1qcFHZSQ3/orky3aO+fsiBChSm+fSvb9JFJExsVYZ5fNJ8r7pCllvmlzPWCQKZSWhLUqAK5iHHyukdIYc1Zeyqlp1U4o8bbUmKcj+94ZCw3qBBbgGSl7qaKavgBZ+0gAO2V8chKEN6PWyCXGznk357nqRZcpLzbv2luVfQyXEsVg5YKxpPt7rS3I5r2e1EPB5EcakNuAy7fcl1bit9rgEk5nLmPtja0vYxqVVRVViWQHR6/IF5QRTaXzcFODkHwkBRFm04xIdqwQDJOXKOYp1gA+QLcy7nbQUx9va2j8oWodWYpe1hrxC4w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Js1f5327; dkim-atps=neutral; spf=pass (client-ip=95.215.58.184; helo=out-184.mta1.migadu.com; envelope-from=kunwu.chan@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Js1f5327;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=95.215.58.184; helo=out-184.mta1.migadu.com; envelope-from=kunwu.chan@linux.dev; receiver=lists.ozlabs.org)
X-Greylist: delayed 449 seconds by postgrey-1.37 at boromir; Fri, 23 Aug 2024 16:32:48 AEST
Received: from out-184.mta1.migadu.com (out-184.mta1.migadu.com [95.215.58.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wqqxr6GMzz2yhP
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2024 16:32:48 +1000 (AEST)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1724394296;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=UPXD9Xz1BaTvCyjpi0+oHDqdxADzbC7LmDSjyBTL2ZU=;
	b=Js1f5327/2ReHDnybS21HsuIFYM0PkcasXCRxJRio3ru4dIOMSBGsXhBUPe1TBMtspMCB0
	hjWe50lK4406LL4sC12TSHpUoFH6wTnv+33uQ9GfWs9rF7TzuZasRMyGlRmNzF74LpU/v6
	SWMuF1qj1dTRKJIpTL9aTFW6jmTMAt0=
From: Kunwu Chan <kunwu.chan@linux.dev>
To: stuyoder@gmail.com,
	laurentiu.tudor@nxp.com,
	christophe.leroy@csgroup.eu
Cc: linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	Kunwu Chan <chentao@kylinos.cn>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] bus: fsl-mc: make fsl_mc_bus_type const
Date: Fri, 23 Aug 2024 14:24:40 +0800
Message-ID: <20240823062440.113628-1-kunwu.chan@linux.dev>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Kunwu Chan <chentao@kylinos.cn>

Since commit d492cc2573a0 ("driver core: device.h: make struct
bus_type a const *"), the driver core can properly handle constant
struct bus_type, move the fsl_mc_bus_type variable to be a constant
structure as well, placing it into read-only memory which can not be
modified at runtime.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Kunwu Chan <chentao@kylinos.cn>
---
 drivers/bus/fsl-mc/fsl-mc-bus.c | 2 +-
 include/linux/fsl/mc.h          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/bus/fsl-mc/fsl-mc-bus.c b/drivers/bus/fsl-mc/fsl-mc-bus.c
index dd68b8191a0a..930d8a3ba722 100644
--- a/drivers/bus/fsl-mc/fsl-mc-bus.c
+++ b/drivers/bus/fsl-mc/fsl-mc-bus.c
@@ -309,7 +309,7 @@ static struct attribute *fsl_mc_bus_attrs[] = {
 
 ATTRIBUTE_GROUPS(fsl_mc_bus);
 
-struct bus_type fsl_mc_bus_type = {
+const struct bus_type fsl_mc_bus_type = {
 	.name = "fsl-mc",
 	.match = fsl_mc_bus_match,
 	.uevent = fsl_mc_bus_uevent,
diff --git a/include/linux/fsl/mc.h b/include/linux/fsl/mc.h
index 083c860fd28e..c90ec889bfc2 100644
--- a/include/linux/fsl/mc.h
+++ b/include/linux/fsl/mc.h
@@ -436,7 +436,7 @@ void fsl_mc_free_irqs(struct fsl_mc_device *mc_dev);
 struct fsl_mc_device *fsl_mc_get_endpoint(struct fsl_mc_device *mc_dev,
 					  u16 if_id);
 
-extern struct bus_type fsl_mc_bus_type;
+extern const struct bus_type fsl_mc_bus_type;
 
 extern struct device_type fsl_mc_bus_dprc_type;
 extern struct device_type fsl_mc_bus_dpni_type;
-- 
2.43.0


