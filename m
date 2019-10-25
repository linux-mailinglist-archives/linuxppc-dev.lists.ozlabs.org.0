Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C382EE4BCE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Oct 2019 15:10:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4704HC1MHZzDqlf
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Oct 2019 00:10:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=rasmusvillemoes.dk (client-ip=2a00:1450:4864:20::242;
 helo=mail-lj1-x242.google.com; envelope-from=linux@rasmusvillemoes.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=rasmusvillemoes.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk
 header.b="GbMgHMlP"; dkim-atps=neutral
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4703d56whYzDqXm
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2019 23:41:13 +1100 (AEDT)
Received: by mail-lj1-x242.google.com with SMTP id q78so2550223lje.5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2019 05:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N50Dd0BwKrCHAeZk4A17lzm64zQu/57ZOLH9CQ/zcnE=;
 b=GbMgHMlPuXicUd1jD2lMN2qhtRW8TtquRFBK/Ddk4tseiBp72B5kglvaqT7HytLeBz
 ERycsML3pLKiOMNp8blGqHqZt1010NyDGfn7LqQaBg6mJbO74s9jsmr3XhByikIXl+at
 RFzgtUIoBjMXP8kS9sv6NM1bEvcbXcMXINIIY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N50Dd0BwKrCHAeZk4A17lzm64zQu/57ZOLH9CQ/zcnE=;
 b=Si7SoRqSQyKNDvs2+ISoGpZoldGpqp1RnmwFV/CyFnIqpQbedVchAuwaRMHGZGty1J
 hQVpik0LgxRJzMU7l8fIXQqPIHKECW5HzxrrJpymBk0aLpzKryzh+NP2N09x2IMJh/Ni
 SzaLgExoiSQQ0Dgi0aoCn/RbLPOM869NTWUen2V/Sx1IwtxCvgzsGuRFEmksMoMA4ODD
 p54nXkZbzePmPN4WbFQ2/V1zsH/ciNsqSiRW+sy/fMbCWUg6PUnKAKUNUSe0RVv7GjEP
 2iixa9eoYQC09r2iB9NAChFbCHXznV5ScbNp4Gv4WtglycgiKtI3vij7uVnceWqoeH7m
 cXIw==
X-Gm-Message-State: APjAAAWsy2sFwBwnyxVwNo11mWBdRqQRoO8UtZfvE9Ng9dF///1Pk7aR
 E6vB/4mmqMuJLXS5ZY4y95hJCg==
X-Google-Smtp-Source: APXvYqwo2JfL7eIt5j0UGDMoCocGX5aXqxwftXfPdGyY5T7w8Mdcm7mXtiOPvL3zk+z+WGo8qCu+jw==
X-Received: by 2002:a2e:7815:: with SMTP id t21mr1151982ljc.149.1572007270677; 
 Fri, 25 Oct 2019 05:41:10 -0700 (PDT)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id 10sm821028lfy.57.2019.10.25.05.41.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2019 05:41:09 -0700 (PDT)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v2 06/23] soc: fsl: qe: avoid tail comments in qe_ic.h
Date: Fri, 25 Oct 2019 14:40:41 +0200
Message-Id: <20191025124058.22580-7-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191025124058.22580-1-linux@rasmusvillemoes.dk>
References: <20191018125234.21825-1-linux@rasmusvillemoes.dk>
 <20191025124058.22580-1-linux@rasmusvillemoes.dk>
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
Cc: Valentin Longchamp <valentin.longchamp@keymile.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org,
 Scott Wood <oss@buserror.net>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is consistent with normal kernel coding style and the style used
in the struct definition above this one.

Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 drivers/soc/fsl/qe/qe_ic.h | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/fsl/qe/qe_ic.h b/drivers/soc/fsl/qe/qe_ic.h
index 9420378d9b6b..29b4d768e4a8 100644
--- a/drivers/soc/fsl/qe/qe_ic.h
+++ b/drivers/soc/fsl/qe/qe_ic.h
@@ -89,11 +89,20 @@ struct qe_ic {
  * QE interrupt controller internal structure
  */
 struct qe_ic_info {
-	u32	mask;	  /* location of this source at the QIMR register. */
-	u32	mask_reg; /* Mask register offset */
-	u8	pri_code; /* for grouped interrupts sources - the interrupt
-			     code as appears at the group priority register */
-	u32	pri_reg;  /* Group priority register offset */
+	/* Location of this source at the QIMR register */
+	u32	mask;
+
+	/* Mask register offset */
+	u32	mask_reg;
+
+	/*
+	 * For grouped interrupts sources - the interrupt code as
+	 * appears at the group priority register
+	 */
+	u8	pri_code;
+
+	/* Group priority register offset */
+	u32	pri_reg;
 };
 
 #endif /* _POWERPC_SYSDEV_QE_IC_H */
-- 
2.23.0

