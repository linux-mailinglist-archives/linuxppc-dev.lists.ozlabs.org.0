Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B6CF4FFE
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Nov 2019 16:41:03 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 478ky35FmNzF5HP
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Nov 2019 02:40:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=rasmusvillemoes.dk (client-ip=2a00:1450:4864:20::141;
 helo=mail-lf1-x141.google.com; envelope-from=linux@rasmusvillemoes.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=rasmusvillemoes.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk
 header.b="fbtFc25Q"; dkim-atps=neutral
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 478gR60q6KzF6qp
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Nov 2019 00:02:26 +1100 (AEDT)
Received: by mail-lf1-x141.google.com with SMTP id y6so4423518lfj.2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 08 Nov 2019 05:02:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SKjk4xtgUQ/kA6JZGPtMJVtONpNy6V4lFIeGBwHjI8g=;
 b=fbtFc25QQKF1HYy9EJWgNQgGlj4NvVM/SZQzlg+mehsa55gfaar01ZvOzQEFiHiJS8
 NIWL01E4b4KculB+YonomNkzR6/ye1LnowBIkbJ9/0ahn29mzO+PzUdzYz/FKdLUGozG
 3Bl1Mlzo2VusjD/D//znojGiimZguwgG2m4r0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SKjk4xtgUQ/kA6JZGPtMJVtONpNy6V4lFIeGBwHjI8g=;
 b=I0fBpwunk1XiAhqnb9rAd9BxInJDNWmxQL+SUSv36dT54RnZSCL77wecXDfhiZqwZn
 gtL6inHJlanUOs+l4sfF5jj4O5JS9K8LjP16HP+IjFMdIht8Ky9yr42fj2h1TWpR+EU5
 T7smWNRyDjo+LLayoJe/7qwk9ww8WtWLbCoVb77Cd7FAT7dMi+W9JG1UWJRHPVCXLKH6
 NByycgFq6XW3E+A/4g4AfmZJbqenpdYYUlC1xkic+F3eIrdQHjQGkliKcAopCB0Aemyn
 Uq8Vbks6IG70nfgTFFtLBzEl0uhYOg4TzlgAPRCK/GXSnuDP6Hs9FFNgzM9HWjM4zHXE
 /DIQ==
X-Gm-Message-State: APjAAAVghvqSDwVJi3bvgRfpuaULUhNyrI0kAkLgI9Ve9KsB4cQBpELn
 59iKWv/W6iKzCJGO9S2JwuPypQ==
X-Google-Smtp-Source: APXvYqwH4Au0vtX7CvDcjAgRV7H9RHuuGAfZs53rG3gF/CjSF6Puxm/KMJghDcukVOdVzQRBjC2v/w==
X-Received: by 2002:a19:f107:: with SMTP id p7mr6505066lfh.91.1573218142811;
 Fri, 08 Nov 2019 05:02:22 -0800 (PST)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id d28sm2454725lfn.33.2019.11.08.05.02.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2019 05:02:22 -0800 (PST)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v4 44/47] net/wan/fsl_ucc_hdlc: fix reading of __be16 registers
Date: Fri,  8 Nov 2019 14:01:20 +0100
Message-Id: <20191108130123.6839-45-linux@rasmusvillemoes.dk>
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

When releasing the allocated muram resource, we rely on reading back
the offsets from the riptr/tiptr registers. But those registers are
__be16 (and we indeed write them using iowrite16be), so we can't just
read them back with a normal C dereference.

This is not currently a real problem, since for now the driver is
PPC32-only. But it will soon be allowed to be used on arm and arm64 as
well.

Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 drivers/net/wan/fsl_ucc_hdlc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wan/fsl_ucc_hdlc.c b/drivers/net/wan/fsl_ucc_hdlc.c
index 405b24a5a60d..8d13586bb774 100644
--- a/drivers/net/wan/fsl_ucc_hdlc.c
+++ b/drivers/net/wan/fsl_ucc_hdlc.c
@@ -732,8 +732,8 @@ static int uhdlc_open(struct net_device *dev)
 
 static void uhdlc_memclean(struct ucc_hdlc_private *priv)
 {
-	qe_muram_free(priv->ucc_pram->riptr);
-	qe_muram_free(priv->ucc_pram->tiptr);
+	qe_muram_free(ioread16be(&priv->ucc_pram->riptr));
+	qe_muram_free(ioread16be(&priv->ucc_pram->tiptr));
 
 	if (priv->rx_bd_base) {
 		dma_free_coherent(priv->dev,
-- 
2.23.0

