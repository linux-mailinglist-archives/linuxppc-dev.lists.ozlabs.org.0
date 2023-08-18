Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8417810F3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Aug 2023 18:51:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RS7DZ3rtnz3dxK
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Aug 2023 02:51:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized) smtp.mailfrom=csgroup.eu (client-ip=90.115.179.12; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (unknown [90.115.179.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RS71N4nhyz3cWd
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Aug 2023 02:41:28 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4RS7060ztwz9vjf;
	Fri, 18 Aug 2023 18:40:22 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ppn1n9uuWSiV; Fri, 18 Aug 2023 18:40:22 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4RS6zp2ryfz9vhl;
	Fri, 18 Aug 2023 18:40:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 581038B778;
	Fri, 18 Aug 2023 18:40:06 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id NVmsYWnylAQZ; Fri, 18 Aug 2023 18:40:06 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (PO17626.IDSI0.si.c-s.fr [172.19.54.29])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id DA81D8B775;
	Fri, 18 Aug 2023 18:40:04 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 37IGe0qF142035
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 18 Aug 2023 18:40:00 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 37IGe0xK142034;
	Fri, 18 Aug 2023 18:40:00 +0200
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
Subject: [PATCH v4 23/28] mfd: core: Ensure disabled devices are skiped without aborting
Date: Fri, 18 Aug 2023 18:39:17 +0200
Message-ID: <528425d6472176bb1d02d79596b51f8c28a551cc.1692376361.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1692376360.git.christophe.leroy@csgroup.eu>
References: <cover.1692376360.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1692376735; l=2101; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=hAkFOA9R8r8JmUyKnLgaEreJkNGYzPTwTAaZA8K8KA4=; b=YeZOkU1flwAP6HFasxcc+kTmXgQb5aqLnFHmBhQGqdqq+bhR8cxXtiH2m0yGrTbC5qzh5/Ok6 SXKqp7mwxKtD2wGLbjITvC+WW+jVpAlvefMfI7R+cLvZ1Yv0L2m6/wO
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

The loop searching for a matching device based on its compatible
string is aborted when a matching disabled device is found.
This abort prevents to add devices as soon as one disabled device
is found.

Continue searching for an other device instead of aborting on the
first disabled one fixes the issue.

Fixes: 22380b65dc70 ("mfd: mfd-core: Ensure disabled devices are ignored without error")
Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 drivers/mfd/mfd-core.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/mfd/mfd-core.c b/drivers/mfd/mfd-core.c
index 0ed7c0d7784e..2b85509a90fc 100644
--- a/drivers/mfd/mfd-core.c
+++ b/drivers/mfd/mfd-core.c
@@ -146,6 +146,7 @@ static int mfd_add_device(struct device *parent, int id,
 	struct platform_device *pdev;
 	struct device_node *np = NULL;
 	struct mfd_of_node_entry *of_entry, *tmp;
+	bool disabled = false;
 	int ret = -ENOMEM;
 	int platform_id;
 	int r;
@@ -183,11 +184,10 @@ static int mfd_add_device(struct device *parent, int id,
 	if (IS_ENABLED(CONFIG_OF) && parent->of_node && cell->of_compatible) {
 		for_each_child_of_node(parent->of_node, np) {
 			if (of_device_is_compatible(np, cell->of_compatible)) {
-				/* Ignore 'disabled' devices error free */
+				/* Skip 'disabled' devices */
 				if (!of_device_is_available(np)) {
-					of_node_put(np);
-					ret = 0;
-					goto fail_alias;
+					disabled = true;
+					continue;
 				}
 
 				ret = mfd_match_of_node_to_dev(pdev, np, cell);
@@ -197,10 +197,17 @@ static int mfd_add_device(struct device *parent, int id,
 				if (ret)
 					goto fail_alias;
 
-				break;
+				goto match;
 			}
 		}
 
+		if (disabled) {
+			/* Ignore 'disabled' devices error free */
+			ret = 0;
+			goto fail_alias;
+		}
+
+match:
 		if (!pdev->dev.of_node)
 			pr_warn("%s: Failed to locate of_node [id: %d]\n",
 				cell->name, platform_id);
-- 
2.41.0

