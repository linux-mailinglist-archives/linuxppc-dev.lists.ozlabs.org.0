Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3D284F80A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Feb 2024 16:00:01 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=epGQgFo4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TWcTW44M5z3cMX
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Feb 2024 01:59:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=epGQgFo4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com; envelope-from=chunkeey@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TWcSh4rx4z3cH2
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Feb 2024 01:59:15 +1100 (AEDT)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5600c43caddso1286459a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Feb 2024 06:59:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707490749; x=1708095549; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+0xXBtbgTuVg75XRZTNZe3JUN/p++sNEEGcA8qhq6Jo=;
        b=epGQgFo4xSb6abHsWyTBzbhAb/iULIX+RgPTiZ38vSMWCO+uuCIBehCP0/yC1PgT7S
         DQdmTbKRibO1Z3XkGHbTgLpCwLxrOe41M/fxy1V/R6vkwOVL/nnXUqTVAmxnhuZmzD7e
         rjsRRVnB4L/ym2UIKOKfbVLReXFVC3cvHb75eg+Tfoe1YZbVg7CR8EfH11reXoKdWkDm
         5DqVr6HlTOtI4LH9N1x496GjW5P1ehS2K64e32yZBZNRFiHcvk5b0Tlv70Yf3KBoovbi
         PrL+XgpKs8FUmtN2JLjTKaIuv2mAVf+xXpIBEPwpUL8/jhujbwky5X4+UTdrqFqEe+/Z
         peUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707490749; x=1708095549;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+0xXBtbgTuVg75XRZTNZe3JUN/p++sNEEGcA8qhq6Jo=;
        b=j2Tr7581mifox8SYTvKVvakIyjC0roERF6B5DLBuMFqpVUy6ggP/6e9lNciTjwMaxv
         QLH/rbobUh2fB1+hNBHVuL2ph1AWFfgEJDRAmJtnwwyI7yBJyxATYBQfye7/jffhSWIZ
         91iJTknRCJfcVYKDimoJJ5PxR83xUWPOysrWHb3+pGP93fzxdhVny3AAUj+rniBbNrPp
         BfKlz3K/WqRoFay60LBxhx607vAR1OdKCFtdfQkTHyJsB3RTRLgu7JG1kRelVloHnUSA
         3oge8XaOn2Ni9Ufjo0glJvWKkgsSk2Xay3+yppd5lUx94mt2cyAm7Co80HdKuunhOBXH
         i8jQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0DyyFhuSH/BvTganMz+cuTfepNmAignoNjwhTZeAzhqrqA1Lv1azlllQVXLg41I8VQYm2kBv+2rmaS7GJN8PtKmqibWTp6kwsbLbsvw==
X-Gm-Message-State: AOJu0YynQw8bAr65vWohqD8tMd1lL0SzyXom6f6GGHPWoSJ3haLWjwdS
	imLQzCxVuleDJSHPF0j2HLP4MASADxVbvySqGQ9jpeY+h0n8/R3L
X-Google-Smtp-Source: AGHT+IFnAc/9+UpFcfxUwqW7zoE/oLkdn+g37DQQGUukeygCLobGD9Oa/oRE9DlJexwVnL7XW9BjDA==
X-Received: by 2002:a05:6402:31e3:b0:55f:6fd:8ac1 with SMTP id dy3-20020a05640231e300b0055f06fd8ac1mr1546053edb.37.1707490748868;
        Fri, 09 Feb 2024 06:59:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUSyLdmusyQzJDzX19vZv6UaXjK04vLrv0tsNRkAL1PePcU3fK0Ite2Vwh6zX3Z88c2gwPA2yRQce0oVIjdnZrjrex3d4m9j8JG36PV3w==
Received: from shift.daheim (p200300d5ff2d6000aaa159fffeeb01f1.dip0.t-ipconnect.de. [2003:d5:ff2d:6000:aaa1:59ff:feeb:1f1])
        by smtp.gmail.com with ESMTPSA id r21-20020aa7d595000000b005611917ebabsm859134edq.47.2024.02.09.06.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Feb 2024 06:59:08 -0800 (PST)
Received: from chuck by shift.daheim with local (Exim 4.97)
	(envelope-from <chuck@shift.daheim>)
	id 1rYSLM-00000004K1O-0uao;
	Fri, 09 Feb 2024 15:59:08 +0100
From: Christian Lamparter <chunkeey@gmail.com>
To: linux-spi@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v1] spi: spi-ppc4xx: include missing platform_device.h
Date: Fri,  9 Feb 2024 15:59:07 +0100
Message-ID: <3eb3f9c4407ba99d1cd275662081e46b9e839173.1707490664.git.chunkeey@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Mark Brown <broonie@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

the driver currently fails to compile on 6.8-rc3 due to:
| spi-ppc4xx.c: In function ‘spi_ppc4xx_of_probe’:
| @346:36: error: invalid use of undefined type ‘struct platform_device’
| 346 |         struct device_node *np = op->dev.of_node;
|     |                                    ^~
| ... (more similar errors)

it was working with 6.7. Looks like it only needed the include
and its compiling fine!

Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
---
 drivers/spi/spi-ppc4xx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/spi/spi-ppc4xx.c b/drivers/spi/spi-ppc4xx.c
index 03aab661be9d..412d6e678224 100644
--- a/drivers/spi/spi-ppc4xx.c
+++ b/drivers/spi/spi-ppc4xx.c
@@ -25,6 +25,7 @@
 #include <linux/slab.h>
 #include <linux/errno.h>
 #include <linux/wait.h>
+#include <linux/platform_device.h>
 #include <linux/of_address.h>
 #include <linux/of_irq.h>
 #include <linux/of_platform.h>
-- 
2.43.0

