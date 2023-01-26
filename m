Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9A667DC52
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 03:36:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P31t84DQ2z3fTV
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 13:36:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=n4O/TPhP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.178.240; helo=mslow1.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=n4O/TPhP;
	dkim-atps=neutral
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P2l3t2lLKz3fBb
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jan 2023 02:28:57 +1100 (AEDT)
Received: from relay10.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::230])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 21DBBD2DFC
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jan 2023 15:22:27 +0000 (UTC)
Received: from booty.fritz.box (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPA id CCC7724000B;
	Thu, 26 Jan 2023 15:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1674746531;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=y4XXZUb/eXTVLt3Io7nRJONtjd6MFURYEBCczeziRlI=;
	b=n4O/TPhP8ss3Yw55rWDZdfKA5BDB3pD/eXKOubNenym/Wz0Z3oFGqXygem7AXQ4QxtQUs0
	aTFUIxv3UvBbXaXdfjKt/+DxdiIH3m9pjffuOqX3kEawUd0mIoICswgkMt7Cl2V+9f/nlP
	wZtZJUP9mFhHT8NCsMwnF+uxqasFUWG+4xeiWbYsWAqegNctl6/A3D+q+p+1IifdAbD+ru
	UjJ9ogApnYQW65IA/tLjadQBDynMEBwsEPvMih4MQzWaAqI8kJqr9zHQN6Oc88cQ1ZyKA8
	qBD027A6BojfXIfwIovLnoGdIEzq5/ovTr1GPKV7MYxKP8XDojIjVN3rfVcGNQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>,
	Pravin B Shelar <pshelar@ovn.org>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH] scripts/spelling.txt: add "exsits" pattern and fix typo instances
Date: Thu, 26 Jan 2023 16:22:05 +0100
Message-Id: <20230126152205.959277-1-luca.ceresoli@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 27 Jan 2023 13:32:18 +1100
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
Cc: dev@openvswitch.org, alsa-devel@alsa-project.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linuxppc-dev@lists.ozlabs.org, Colin Ian King <colin.i.king@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fix typos and add the following to the scripts/spelling.txt:

  exsits||exists

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/infiniband/ulp/iser/iscsi_iser.c | 2 +-
 net/openvswitch/flow_table.c             | 2 +-
 scripts/spelling.txt                     | 1 +
 sound/soc/fsl/fsl-asoc-card.c            | 2 +-
 4 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/infiniband/ulp/iser/iscsi_iser.c b/drivers/infiniband/ulp/iser/iscsi_iser.c
index 620ae5b2d80d..6b7603765383 100644
--- a/drivers/infiniband/ulp/iser/iscsi_iser.c
+++ b/drivers/infiniband/ulp/iser/iscsi_iser.c
@@ -446,7 +446,7 @@ iscsi_iser_conn_create(struct iscsi_cls_session *cls_session,
  * @is_leading:      indicate if this is the session leading connection (MCS)
  *
  * Return: zero on success, $error if iscsi_conn_bind fails and
- *         -EINVAL in case end-point doesn't exsits anymore or iser connection
+ *         -EINVAL in case end-point doesn't exists anymore or iser connection
  *         state is not UP (teardown already started).
  */
 static int iscsi_iser_conn_bind(struct iscsi_cls_session *cls_session,
diff --git a/net/openvswitch/flow_table.c b/net/openvswitch/flow_table.c
index 0a0e4c283f02..cfac54cbafdf 100644
--- a/net/openvswitch/flow_table.c
+++ b/net/openvswitch/flow_table.c
@@ -1012,7 +1012,7 @@ static int flow_mask_insert(struct flow_table *tbl, struct sw_flow *flow,
 
 	mask = flow_mask_find(tbl, new);
 	if (!mask) {
-		/* Allocate a new mask if none exsits. */
+		/* Allocate a new mask if none exists. */
 		mask = mask_alloc();
 		if (!mask)
 			return -ENOMEM;
diff --git a/scripts/spelling.txt b/scripts/spelling.txt
index ded8bcfc0247..0147bd8dc6e2 100644
--- a/scripts/spelling.txt
+++ b/scripts/spelling.txt
@@ -625,6 +625,7 @@ exeuction||execution
 existance||existence
 existant||existent
 exixt||exist
+exsits||exists
 exlcude||exclude
 exlcusive||exclusive
 exmaple||example
diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
index 8d14b5593658..2f25358196ee 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -811,7 +811,7 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
 	priv->card.num_links = 1;
 
 	if (asrc_pdev) {
-		/* DPCM DAI Links only if ASRC exsits */
+		/* DPCM DAI Links only if ASRC exists */
 		priv->dai_link[1].cpus->of_node = asrc_np;
 		priv->dai_link[1].platforms->of_node = asrc_np;
 		priv->dai_link[2].codecs->dai_name = codec_dai_name;
-- 
2.34.1

