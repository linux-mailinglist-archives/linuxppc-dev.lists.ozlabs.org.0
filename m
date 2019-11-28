Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2915610CD8D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Nov 2019 18:14:47 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47P4503VWrzDqHb
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Nov 2019 04:14:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=rasmusvillemoes.dk (client-ip=2a00:1450:4864:20::244;
 helo=mail-lj1-x244.google.com; envelope-from=linux@rasmusvillemoes.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=rasmusvillemoes.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk
 header.b="Fm9J/BPt"; dkim-atps=neutral
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47P13T72ZPzDqn4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Nov 2019 01:58:13 +1100 (AEDT)
Received: by mail-lj1-x244.google.com with SMTP id e28so4649566ljo.9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Nov 2019 06:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uJFqdfn2nSDjHf42hirywvV4nKXCcu5QZEHn2MRQUqE=;
 b=Fm9J/BPtzefO6mLtz+s8hghaGLQl9/e0iHtM+c2WZUylSQ5IRCuZvLLrqa9pvESajc
 sgUXiAdEW5ODvwgf/p7K3+6ps2qo4ojoUJEOeaW4+cvwZGzSxZUYdES0IEMWB57Deuf4
 xjUml1c0Urakd08HfwFSCPyXLT1jfJ5CE/vuE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uJFqdfn2nSDjHf42hirywvV4nKXCcu5QZEHn2MRQUqE=;
 b=VE2kcdfw7Nj6pn/X6wLmnO+qv1xl3IoCoY+KQKOz8WKNO0goMCsrPeS9kj2Huy010O
 dLC6XrZtyk2tUk+qay5l5wfJSnOfYezjrT1LFHzbXApSFGZFE7QAq0B7xb52gsCRh7Ir
 SHGULEXBD0p50WkghDKgvkHyesj+Omje85IFckbQWsQm8NzQPOn8lqUnIexLJAQrWHz6
 0e3nTCRCIDGbbOOvfNSG8kI+gTwHcS2bYAiU+FgUGQJ2GgbpT38UHi53W8FuHmN29lVH
 nydz7H78MH5m19iycnwgfuhbMc5CK71RTjewQWaPFjCf/Y5xEuKYivF/yYD/GpaIZrAg
 PSqg==
X-Gm-Message-State: APjAAAXlaN9dxMQ0DnFEXUbGybxnGTdYsnw88JT4536R6sPJFhs8jX+E
 j1c77S7Oe7Dm6sFZ3lIQUxPEow==
X-Google-Smtp-Source: APXvYqyvULz2Tjp/CvI4s3FOQVWvQSzO1JW8WbB25Ky4p0+qkSxEH1U0IiPoAs0MVz6PY4HNawn0gg==
X-Received: by 2002:a2e:90da:: with SMTP id o26mr1140714ljg.25.1574953085644; 
 Thu, 28 Nov 2019 06:58:05 -0800 (PST)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id u2sm2456803lfl.18.2019.11.28.06.58.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Nov 2019 06:58:05 -0800 (PST)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v6 47/49] net: ethernet: freescale: make UCC_GETH explicitly
 depend on PPC32
Date: Thu, 28 Nov 2019 15:55:52 +0100
Message-Id: <20191128145554.1297-48-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191128145554.1297-1-linux@rasmusvillemoes.dk>
References: <20191128145554.1297-1-linux@rasmusvillemoes.dk>
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
Cc: Timur Tabi <timur@kernel.org>, netdev@vger.kernel.org,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org,
 Scott Wood <oss@buserror.net>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently, QUICC_ENGINE depends on PPC32, so this in itself does not
change anything. In order to allow removing the PPC32 dependency from
QUICC_ENGINE and avoid allmodconfig build failures, add this explicit
dependency.

Also, the QE Ethernet has never been integrated on any non-PowerPC SoC
and most likely will not be in the future.

Reviewed-by: Timur Tabi <timur@kernel.org>
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

