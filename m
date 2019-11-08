Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F003F5020
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Nov 2019 16:47:10 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 478l574B4WzF6ww
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Nov 2019 02:47:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=rasmusvillemoes.dk (client-ip=2a00:1450:4864:20::241;
 helo=mail-lj1-x241.google.com; envelope-from=linux@rasmusvillemoes.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=rasmusvillemoes.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk
 header.b="JPiH6ZKd"; dkim-atps=neutral
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 478gR85WWgzF6x6
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Nov 2019 00:02:28 +1100 (AEDT)
Received: by mail-lj1-x241.google.com with SMTP id n21so6107573ljg.12
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 08 Nov 2019 05:02:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BB15j+OZLSCqmbjpw6Rixs0w7wUAu62j+M3Q47LEWSI=;
 b=JPiH6ZKd2ZnUmbFTOFb+zecHncuK5W1rGbGHK2U2HNNwnIhWkIOIPn3+7Ay7T0tzM1
 5EAegX18KxWev95bX7gOYwgvjHEidVs2vmnDI0xounVD1lgao9hp6JuWyqGGmyzDgY1m
 DdQZLrXfOdpXw03FSH6fnD3E4Vvj1RGWqOAVA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BB15j+OZLSCqmbjpw6Rixs0w7wUAu62j+M3Q47LEWSI=;
 b=Zd9/zTbUwt3bYEri7gbAKkwBZqHYZCMR14QaKa6RF51bQQztvlRNXYkvR0/hbIlBLb
 XTGy6V3xlc/TMcksyZs6fdDULeFMp5x9lyZ/hlk8JYD9Kk9qI3ROUG2S1kHAz4C8kCHD
 n6S0uwJ22oNn8F5+4DHD1DnJq5bna1NnoDVhV7tcOQ6gPSTg2e+rqSqKS1rVZMTdWYA1
 10VK5l/1M1hawh4KUwdtdUJ+AK7YN+PbrG25S/IuD/lw+HOXfOuFTFl2yZIK2TU+J3Jy
 CUsXvs+AfuPmsaBwel8YHqjEuata+lTQC+JoyXnujP45W1t9Htn2wDlnJFJEsidYLWQa
 M+Rg==
X-Gm-Message-State: APjAAAUnZzei1vtAFDhgkmQO2hsM5Y4SG0yZnhuLH+yw//4MCwPWdpLv
 P0GTCTzIV82+Cm6NQG51vHiA6fx9+ylZxh4I
X-Google-Smtp-Source: APXvYqxJ5+E/xDqZwwVj1PKuG5R1Tse40MqtXo1j/SjaIDAjgO45IHqu0Kxn9Mf/lNqB6jnMlGV11g==
X-Received: by 2002:a2e:b5a2:: with SMTP id f2mr6613757ljn.108.1573218145233; 
 Fri, 08 Nov 2019 05:02:25 -0800 (PST)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id d28sm2454725lfn.33.2019.11.08.05.02.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2019 05:02:24 -0800 (PST)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v4 46/47] net: ethernet: freescale: make UCC_GETH explicitly
 depend on PPC32
Date: Fri,  8 Nov 2019 14:01:22 +0100
Message-Id: <20191108130123.6839-47-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191108130123.6839-1-linux@rasmusvillemoes.dk>
References: <20191108130123.6839-1-linux@rasmusvillemoes.dk>
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
Cc: netdev@vger.kernel.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 linux-kernel@vger.kernel.org, Scott Wood <oss@buserror.net>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently, QUICC_ENGINE depends on PPC32, so this in itself does not
change anything. In order to allow removing the PPC32 dependency from
QUICC_ENGINE and avoid allmodconfig build failures, add this explicit
dependency.

Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 drivers/net/ethernet/freescale/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/freescale/Kconfig b/drivers/net/ethernet/freescale/Kconfig
index 6a7e8993119f..2bd7ace0a953 100644
--- a/drivers/net/ethernet/freescale/Kconfig
+++ b/drivers/net/ethernet/freescale/Kconfig
@@ -74,7 +74,7 @@ config FSL_XGMAC_MDIO
 
 config UCC_GETH
 	tristate "Freescale QE Gigabit Ethernet"
-	depends on QUICC_ENGINE
+	depends on QUICC_ENGINE && PPC32
 	select FSL_PQ_MDIO
 	select PHYLIB
 	---help---
-- 
2.23.0

