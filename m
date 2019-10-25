Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B1CE4C12
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Oct 2019 15:27:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4704f75nZnzDqjM
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Oct 2019 00:27:11 +1100 (AEDT)
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
 header.b="Ak1M7QhB"; dkim-atps=neutral
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4703dD6TNCzDqXm
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2019 23:41:20 +1100 (AEDT)
Received: by mail-lj1-x244.google.com with SMTP id s4so1663162ljj.10
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2019 05:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=y+kwl//SoVDAzocBexIsEmz66pzal0ckH4IWTjSFzkk=;
 b=Ak1M7QhBuyHZjE5WQ2jax0Lc1hG2C4sfAdA8o2GByl3nHQYZA8BrncbEkAdONHCS0K
 0pcVPUkKXKtO3vplL4HUoK+2O6ZIg1afec+LTJTSScE/uQt0Rb4aRuEoqjepyYkHyNgq
 kc+/m0Zlgg5E+KctsTCNhX6th/s6KvIRKvPRY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y+kwl//SoVDAzocBexIsEmz66pzal0ckH4IWTjSFzkk=;
 b=B8GJIyra/Kt/ZG9eKNytlR8mDN05ExUjICP8ElPEmPapFE4aR4Nc7+rpxpZlvX4Hl1
 uI5xctnJzqGVa5KVRYQS94x1wVSGqOMtgd6FohkPLBCBIP4bPIka+ArxoF/2g3A2PJwI
 srn2C8+w+aPEwS4kO2lDhrv1HeIr5LoPqtpEd/jRGiMQU0Ny0U6L77ujILcxooMw6joT
 7Nlepf+JFQUBe+PmEHyK3IKf+fd68F41EpwIx4Vdcu1PQ/pKYJvyxdG0rtkBJv0uIkBq
 wJhCsLwpcXeFF3TYlD5w/FPeFUtaKawS3sSADcC9eTFf9ugBClWbAzmY98KO901LtwMR
 vIJw==
X-Gm-Message-State: APjAAAXKYPTmdHGfyLZkGlOxMV1b+KOcsTsRmUhXDQSIMY3Fv94WSYLM
 +es4rXwM+AwCQTaYp5H/zl/nPg==
X-Google-Smtp-Source: APXvYqzli6SMC1Z8hQATuoEoXx1WkPPyEoLopU+HdkiAKE9p++1V643MYdrGXfcfqZbuCSF3Q8KXBw==
X-Received: by 2002:a2e:a0c9:: with SMTP id f9mr2381853ljm.77.1572007277982;
 Fri, 25 Oct 2019 05:41:17 -0700 (PDT)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id 10sm821028lfy.57.2019.10.25.05.41.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2019 05:41:17 -0700 (PDT)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v2 12/23] soc: fsl: qe: drop assign-only high_active in
 qe_ic_init
Date: Fri, 25 Oct 2019 14:40:47 +0200
Message-Id: <20191025124058.22580-13-linux@rasmusvillemoes.dk>
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

high_active is only assigned to but never used. Remove it.

Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 drivers/soc/fsl/qe/qe_ic.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/fsl/qe/qe_ic.c b/drivers/soc/fsl/qe/qe_ic.c
index f3659c312e13..61a40e40f3ae 100644
--- a/drivers/soc/fsl/qe/qe_ic.c
+++ b/drivers/soc/fsl/qe/qe_ic.c
@@ -450,7 +450,7 @@ void __init qe_ic_init(struct device_node *node, unsigned int flags,
 {
 	struct qe_ic *qe_ic;
 	struct resource res;
-	u32 temp = 0, ret, high_active = 0;
+	u32 temp = 0, ret;
 
 	ret = of_address_to_resource(node, 0, &res);
 	if (ret)
@@ -496,10 +496,8 @@ void __init qe_ic_init(struct device_node *node, unsigned int flags,
 		temp |= CICR_GRTB;
 
 	/* choose destination signal for highest priority interrupt */
-	if (flags & QE_IC_HIGH_SIGNAL) {
+	if (flags & QE_IC_HIGH_SIGNAL)
 		temp |= (SIGNAL_HIGH << CICR_HPIT_SHIFT);
-		high_active = 1;
-	}
 
 	qe_ic_write(qe_ic->regs, QEIC_CICR, temp);
 
-- 
2.23.0

