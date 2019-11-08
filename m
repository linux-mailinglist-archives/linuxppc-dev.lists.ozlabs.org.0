Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 844ADF5013
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Nov 2019 16:44:15 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 478l1m5R1szF3kq
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Nov 2019 02:44:12 +1100 (AEDT)
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
 header.b="XVACoOOu"; dkim-atps=neutral
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 478gR824zDzF6wS
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Nov 2019 00:02:28 +1100 (AEDT)
Received: by mail-lf1-x143.google.com with SMTP id j14so4395436lfb.8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 08 Nov 2019 05:02:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2QjvBFt/Ahp0rywmkIDhfkZ7dAuBAKpWua4zqIA54R0=;
 b=XVACoOOuXlxl4Cy3V/J8sGSeCCFw8ZKOKZ7FqB/K3JgCxUCJ1xCj/Mqawr8e2qIujx
 O7k1zBR8675/UVFNVWJud7B7gGy4eRxvGFDaQiIdBxLuh/UvxbGJ2jiZIbbPNPtq2kf0
 ZABUDJvpYchPCeIhdPhVBPmgejb6251Cuy5iE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2QjvBFt/Ahp0rywmkIDhfkZ7dAuBAKpWua4zqIA54R0=;
 b=eh/ufDcQABoVtBiwxgkandIlmF1G6667n9+5Xx7ke1jATetWxiu0KvlkOspXiBZTSh
 tUN0k8hqai9iLBCxwxiYn0RDXT4GtdfpP73Wy4IRlZbkoqBaPVPOpsmhBsXIV5l4r+uS
 ECHACtQZjG9hbw2qu+//yk8ewn11sHJ/0Pmfc3/84hAUUlRqUPG/69dTW8j0sbd0burV
 7jbl/4Up0ZMvSrmeggaoHrhmTb2S/bPL97gwJSkW+oouoK45kr3ZD3z+smqAjw7fRRlk
 yzerH2f80EgqymDjV0PJBYAcGNp6xefBFf+OFNiN8lcXjvgo816zy+7hnlMvl6RqfF5+
 eKzg==
X-Gm-Message-State: APjAAAXSNxv8aPOxAu28efCuZNj8a1XhFGjEUB3qMMf7vRJTVP9OSBLD
 kx3lwkh8HaiuNVXN+HKVBz1lXA==
X-Google-Smtp-Source: APXvYqwScoFAHiImQMnrTZk87e9zBJh2EkwdHqWoi9bG9XRi4pfN3RXUv9ZB5CXwEIsQqOH7j53G/g==
X-Received: by 2002:a19:820e:: with SMTP id e14mr6605403lfd.29.1573218143917; 
 Fri, 08 Nov 2019 05:02:23 -0800 (PST)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id d28sm2454725lfn.33.2019.11.08.05.02.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2019 05:02:23 -0800 (PST)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v4 45/47] net/wan/fsl_ucc_hdlc: reject muram offsets above 64K
Date: Fri,  8 Nov 2019 14:01:21 +0100
Message-Id: <20191108130123.6839-46-linux@rasmusvillemoes.dk>
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

Qiang Zhao points out that these offsets get written to 16-bit
registers, and there are some QE platforms with more than 64K
muram. So it is possible that qe_muram_alloc() gives us an allocation
that can't actually be used by the hardware, so detect and reject
that.

Reported-by: Qiang Zhao <qiang.zhao@nxp.com>
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

