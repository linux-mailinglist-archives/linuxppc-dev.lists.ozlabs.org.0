Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4765B7810B9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Aug 2023 18:44:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RS75F106Nz3fCm
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Aug 2023 02:44:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized) smtp.mailfrom=csgroup.eu (client-ip=90.115.179.12; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (unknown [90.115.179.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RS70P5K4Qz3d8t
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Aug 2023 02:40:37 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4RS6zs1by5z9vhM;
	Fri, 18 Aug 2023 18:40:09 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lXP2OwoFw5RG; Fri, 18 Aug 2023 18:40:09 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4RS6zl1qYrz9vhN;
	Fri, 18 Aug 2023 18:40:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 3397E8B763;
	Fri, 18 Aug 2023 18:40:03 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id TDM3vjXENiKH; Fri, 18 Aug 2023 18:40:03 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (PO17626.IDSI0.si.c-s.fr [172.19.54.29])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 79E568B779;
	Fri, 18 Aug 2023 18:40:01 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 37IGdvd5141991
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 18 Aug 2023 18:39:58 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 37IGdvDx141990;
	Fri, 18 Aug 2023 18:39:57 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Herve Codina <herve.codina@bootlin.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew@lunn.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Shengjiu Wang <shengjiu.wang@gmail.com>,
        Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
        Nicolin Chen <nicoleotsuka@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v4 12/28] soc: fsl: cpm1: qmc: Remove no more needed checks from qmc_check_chans()
Date: Fri, 18 Aug 2023 18:39:06 +0200
Message-ID: <cfe9f648f849526b1aac01ca13ee7e5f3f51a3e5.1692376361.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1692376360.git.christophe.leroy@csgroup.eu>
References: <cover.1692376360.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1692376734; l=2150; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=/2BhkcYFCfVdUJW9iyItt6BfQ3h3Y35LDTdW3A3srlw=; b=CFqlIBlU5AMPuF2hcu/jmjdlTWFhn4WJXBe5RU5oDbnFR1fmzzJ7MkFjSNMKy/bhhMfQs26rg mJOq+SUcC8tA1BBdocSnonDqluqi7jfx8NcGyh8jOB9gb71QuJAoRbk
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Herve Codina <herve.codina@bootlin.com>

The newly introduced qmc_chan_setup_tsa* functions check that the
channel entries are not already used.
These checks are also performed by qmc_check_chans() and are no more
needed.

Remove them from qmc_check_chans().

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 drivers/soc/fsl/qe/qmc.c | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/drivers/soc/fsl/qe/qmc.c b/drivers/soc/fsl/qe/qmc.c
index bddff0b74252..2416408bb7e7 100644
--- a/drivers/soc/fsl/qe/qmc.c
+++ b/drivers/soc/fsl/qe/qmc.c
@@ -884,10 +884,7 @@ EXPORT_SYMBOL(qmc_chan_reset);
 static int qmc_check_chans(struct qmc *qmc)
 {
 	struct tsa_serial_info info;
-	bool is_one_table = false;
 	struct qmc_chan *chan;
-	u64 tx_ts_mask = 0;
-	u64 rx_ts_mask = 0;
 	u64 tx_ts_assigned_mask;
 	u64 rx_ts_assigned_mask;
 	int ret;
@@ -911,7 +908,6 @@ static int qmc_check_chans(struct qmc *qmc)
 			dev_err(qmc->dev, "Number of TSA Tx/Rx TS assigned are not equal\n");
 			return -EINVAL;
 		}
-		is_one_table = true;
 	}
 
 	tx_ts_assigned_mask = info.nb_tx_ts == 64 ? U64_MAX : (((u64)1) << info.nb_tx_ts) - 1;
@@ -922,27 +918,11 @@ static int qmc_check_chans(struct qmc *qmc)
 			dev_err(qmc->dev, "chan %u uses TSA unassigned Tx TS\n", chan->id);
 			return -EINVAL;
 		}
-		if (tx_ts_mask & chan->tx_ts_mask) {
-			dev_err(qmc->dev, "chan %u uses an already used Tx TS\n", chan->id);
-			return -EINVAL;
-		}
 
 		if (chan->rx_ts_mask > rx_ts_assigned_mask) {
 			dev_err(qmc->dev, "chan %u uses TSA unassigned Rx TS\n", chan->id);
 			return -EINVAL;
 		}
-		if (rx_ts_mask & chan->rx_ts_mask) {
-			dev_err(qmc->dev, "chan %u uses an already used Rx TS\n", chan->id);
-			return -EINVAL;
-		}
-
-		if (is_one_table && (chan->tx_ts_mask != chan->rx_ts_mask)) {
-			dev_err(qmc->dev, "chan %u uses different Rx and Tx TS\n", chan->id);
-			return -EINVAL;
-		}
-
-		tx_ts_mask |= chan->tx_ts_mask;
-		rx_ts_mask |= chan->rx_ts_mask;
 	}
 
 	return 0;
-- 
2.41.0

