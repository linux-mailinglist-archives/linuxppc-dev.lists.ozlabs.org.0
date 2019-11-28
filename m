Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C2A10CD7D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Nov 2019 18:09:59 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47P3zS1jhLzDr5V
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Nov 2019 04:09:56 +1100 (AEDT)
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
 header.b="Hf/PPnAb"; dkim-atps=neutral
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47P13S45yYzDqn4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Nov 2019 01:58:12 +1100 (AEDT)
Received: by mail-lf1-x141.google.com with SMTP id f16so20275452lfm.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Nov 2019 06:58:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A61btIRCfGl2K49FU+YApUFpLzedg3OmEOwCORD6qFU=;
 b=Hf/PPnAbgXenT8bkLjfb4K/u1LbHRKbg0TAYF79JBnqjid3M76xfsO2Iqr0VVwnFyD
 rZNl4JtYAtUQD8Zu1LwxcvmtRvoRs1HGQ6aR9a88XKhA2wHLwBiX2tp7T944IhB1pgwY
 FAIkJLiijQAUm9eh3TF6qwqwuxYQZ78WxFPpM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A61btIRCfGl2K49FU+YApUFpLzedg3OmEOwCORD6qFU=;
 b=TOnb3cDWGsSR+ZeYMo5nv46x4KMt3UzqQ1MQW6vBCXmxKwmCVng5UgPl3xzzD6R5W7
 8S/wGZ1NdRlzzSKufruT1iwbuKRd0y+63Vnr82OT99bbOaGFsAzox1a3lSSR5torzQ4E
 4VwuGazfn0lX5KDUXwTF3Gs9SZcnSzO/yHpoGvCTvar96d4ZSy69L23MjDvRImoZ508X
 Sr9enctRcaGOjVJdOreCvH68rLt/sIup9iJrNk8BlFeR2kgEGkhyNlq2StMbD8uiIM9P
 q3G82bVd4Ub9QJvgCmGi0gQRLsYYZo22e5Mll3oSi9LVZq4u1I1VaNLIJqmk7wWr8zrJ
 rbxg==
X-Gm-Message-State: APjAAAVG4wgwEN+WTMF1ivoxBoq4wSTSaf3yWYA0PFywrHd3TF3GlHuh
 xRlrzyymeZDVP8D9exrAWsHnvA==
X-Google-Smtp-Source: APXvYqxhBAd4opJgrPy7P/4weZdPIJVgERAZIrjiD0AKu9eR6iQ1KzTsifkMtoeeLjTOMUJ9elo8CA==
X-Received: by 2002:a19:cc08:: with SMTP id c8mr32134885lfg.124.1574953084507; 
 Thu, 28 Nov 2019 06:58:04 -0800 (PST)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id u2sm2456803lfl.18.2019.11.28.06.58.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Nov 2019 06:58:04 -0800 (PST)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v6 46/49] net/wan/fsl_ucc_hdlc: reject muram offsets above 64K
Date: Thu, 28 Nov 2019 15:55:51 +0100
Message-Id: <20191128145554.1297-47-linux@rasmusvillemoes.dk>
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

Qiang Zhao points out that these offsets get written to 16-bit
registers, and there are some QE platforms with more than 64K
muram. So it is possible that qe_muram_alloc() gives us an allocation
that can't actually be used by the hardware, so detect and reject
that.

Reported-by: Qiang Zhao <qiang.zhao@nxp.com>
Reviewed-by: Timur Tabi <timur@kernel.org>
Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 drivers/net/wan/fsl_ucc_hdlc.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/wan/fsl_ucc_hdlc.c b/drivers/net/wan/fsl_ucc_hdlc.c
index 8d13586bb774..f029eaa7cfc0 100644
--- a/drivers/net/wan/fsl_ucc_hdlc.c
+++ b/drivers/net/wan/fsl_ucc_hdlc.c
@@ -245,6 +245,11 @@ static int uhdlc_init(struct ucc_hdlc_private *priv)
 		ret = -ENOMEM;
 		goto free_riptr;
 	}
+	if (riptr != (u16)riptr || tiptr != (u16)tiptr) {
+		dev_err(priv->dev, "MURAM allocation out of addressable range\n");
+		ret = -ENOMEM;
+		goto free_tiptr;
+	}
 
 	/* Set RIPTR, TIPTR */
 	iowrite16be(riptr, &priv->ucc_pram->riptr);
-- 
2.23.0

