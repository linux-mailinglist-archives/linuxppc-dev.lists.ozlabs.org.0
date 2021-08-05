Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8CE3E0C0B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Aug 2021 03:20:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gg9m145sFz3d7S
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Aug 2021 11:20:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=ERUWHop7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=anton@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=ERUWHop7; dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gg9lD4bmSz3cLP
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Aug 2021 11:20:07 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Gg9lB1KGZz9sWc;
 Thu,  5 Aug 2021 11:20:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlabs.org;
 s=201707; t=1628126406;
 bh=1JJwNmuESAvQFYQrD8ppSQ0u01ajqAsXxsPjoN6nDfs=;
 h=Date:From:To:Cc:Subject:From;
 b=ERUWHop7CjhsnrMXlOZNITaabKHiai9+tQUr7S7dzYQxZw/scXW6IXYNi3r29STlL
 uBbrMZrJnAcM9m3CU1/dJ5xyMR9KrsV9RIDHRbgomliPQwXRN//Z/sesGBz92ZKOE9
 n85Ck5c8AW3epwywPg37+gznr8BWqR3xPi43G1HHR30RkD2kifXny+rMCPtwxTy/h5
 zLr/+/sm7oeBwWXNxOFoADrVEuIbCTsBZAuDFuqLMNV2pixGmUXcbkY39HKykAD4Vl
 zsW/+bJMlSE/klsuIP71XyODTG9IfyQIBuVfAn54eYMwL2TZTHJmu8a69PyHwUSyHP
 CFYH1S/h5GCrw==
Date: Thu, 5 Aug 2021 11:20:05 +1000
From: Anton Blanchard <anton@ozlabs.org>
To: Paul Mackerras <paulus@samba.org>, Joel Stanley <joel@jms.id.au>,
 Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc/configs: Disable legacy ptys on microwatt defconfig
Message-ID: <20210805112005.3cb1f412@kryten.localdomain>
X-Mailer: Mutt/1.8.0 (2017-02-23)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

We shouldn't need legacy ptys, and disabling the option improves boot
time by about 0.5 seconds.

Signed-off-by: Anton Blanchard <anton@ozlabs.org>
---

diff --git a/arch/powerpc/configs/microwatt_defconfig b/arch/powerpc/configs/microwatt_defconfig
index a08b739123da..ebc90aefbc0c 100644
--- a/arch/powerpc/configs/microwatt_defconfig
+++ b/arch/powerpc/configs/microwatt_defconfig
@@ -57,6 +57,7 @@ CONFIG_NETDEVICES=y
 # CONFIG_INPUT is not set
 # CONFIG_SERIO is not set
 # CONFIG_VT is not set
+# CONFIG_LEGACY_PTYS is not set
 CONFIG_SERIAL_8250=y
 # CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
 CONFIG_SERIAL_8250_CONSOLE=y

