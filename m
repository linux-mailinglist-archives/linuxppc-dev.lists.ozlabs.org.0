Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0789810CD63
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Nov 2019 18:02:05 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47P3pL02RjzDqJg
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Nov 2019 04:02:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=rasmusvillemoes.dk (client-ip=2a00:1450:4864:20::143;
 helo=mail-lf1-x143.google.com; envelope-from=linux@rasmusvillemoes.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=rasmusvillemoes.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk
 header.b="PondpcWe"; dkim-atps=neutral
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47P13Q3H9tzDqys
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Nov 2019 01:58:10 +1100 (AEDT)
Received: by mail-lf1-x143.google.com with SMTP id a17so20229190lfi.13
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Nov 2019 06:58:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=byxQuHw6IVmwv5QbVm5twa+er8x0Qu7qmmS64lJfOnw=;
 b=PondpcWeSDGdnmJ3H3VheUMZ5EamRr1/9yXbPe7FnTxs0EB3gX3rAmq3N+xxQXg1zC
 8n9IySGiwvx4CXJ87vaurWMM04a78FAMf2Sv1PDfAzRwEzyV7rH4OyqjmmxRqM28QIEv
 FB3fNi1x+H8+Cb63fYmgSdnsF52YRLDjjuMIo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=byxQuHw6IVmwv5QbVm5twa+er8x0Qu7qmmS64lJfOnw=;
 b=AtvhZ4ihl8xYKecRcZ0bLBzIvpuGbaDhr6Ah9ncbyRyFsjRrcETilgTePPdpEW+DYX
 heW14FJnK8+oPtczAN+79CYE9uUQymZ4VePObdRH+8O7eSbLuV5+PVq4WOtaqDtmkhLv
 c0go1dWu4LtBQIzTL2IUyUM56XPJpfJI9S9yPsO2eYtSPnbIG+T1/h38aaCBHX9t80Ul
 GGsFhnLlqqU4ZqPMg2lamtiXZdRGQaAYEq7aBuieKeKQAQpZv5wenLyggzC/78vpD+Cc
 wcoxaqp6cj0BNKq8pZvSF8bW8Qbsi3FdKl/qNfrz6h6af2pc1aXp76CVy7MJj2dmjbHB
 8iSg==
X-Gm-Message-State: APjAAAWxiUOmM307IwR7hXj7ZlPFckAOPoTsP+pW8TAvsWqKGNHfMw2+
 w5DfoUD8kaw5iiOKCyszoJUW/A==
X-Google-Smtp-Source: APXvYqyFtd33g1Hp4cvK1H6BPWnHJDxlirit0nsDRKrmBSAkYuEyCJVhYftiyBHH6/qxlZfMH1fiXA==
X-Received: by 2002:a19:e011:: with SMTP id x17mr8564756lfg.59.1574953083383; 
 Thu, 28 Nov 2019 06:58:03 -0800 (PST)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id u2sm2456803lfl.18.2019.11.28.06.58.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Nov 2019 06:58:03 -0800 (PST)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v6 45/49] net/wan/fsl_ucc_hdlc: fix reading of __be16 registers
Date: Thu, 28 Nov 2019 15:55:50 +0100
Message-Id: <20191128145554.1297-46-linux@rasmusvillemoes.dk>
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

When releasing the allocated muram resource, we rely on reading back
the offsets from the riptr/tiptr registers. But those registers are
__be16 (and we indeed write them using iowrite16be), so we can't just
read them back with a normal C dereference.

This is not currently a real problem, since for now the driver is
PPC32-only. But it will soon be allowed to be used on arm and arm64 as
well.

Reviewed-by: Timur Tabi <timur@kernel.org>
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

