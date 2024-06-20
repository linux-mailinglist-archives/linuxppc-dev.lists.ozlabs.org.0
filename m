Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D1890FFDD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2024 11:05:10 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=BYraRfk7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W4ZM721cfz3cGb
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2024 19:05:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=BYraRfk7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.178.240; helo=mslow1.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W4ZLR0d1Bz30TZ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2024 19:04:29 +1000 (AEST)
Received: from relay7-d.mail.gandi.net (unknown [217.70.183.200])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 65747C452C
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2024 08:43:26 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 5E33D20012;
	Thu, 20 Jun 2024 08:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1718872999;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YDLRcTY0BkTaFAdlLFjztJqIMTmDai9TLYinXM16row=;
	b=BYraRfk7fEz5L1838NbMQUtgasaGC3yafWba1AA59mzifxKYEytwkNwf8SyIWpTY3kgf6B
	XVylMtJ5iP8zPd51l9KZueVKs9oinG3sl6rbBmqPv7N/6EmTdGrluo/VNLTg6qjw1NVJ5K
	FxI9ONYG7CI54wUSXtP8pOp/P6Q7OuDTS/4XCYA8fJ3iZ5xX/HN37b9QFIO0OqRZskePlB
	L91Bt6v+i5rN5HUE8T5+kkQFZ0M0AKz8O/Spdg6uN9XAhBPsCZbP6cwciBfrvrhyDFvpEf
	ggReD1B+0vtfuCPOfKDWeEOU4Tr4aTq27ArjK8IYP4XQs5WublUbr+biTu74ig==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH 08/10] soc: fsl: cpm1: qmc: Introduce qmc_chan_count_phandles()
Date: Thu, 20 Jun 2024 10:42:55 +0200
Message-ID: <20240620084300.397853-9-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240620084300.397853-1-herve.codina@bootlin.com>
References: <20240620084300.397853-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

No function in the QMC API is available to get the number of phandles
present in a phandle list.

Fill this lack introducing qmc_chan_count_phandles().

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 drivers/soc/fsl/qe/qmc.c | 13 +++++++++++++
 include/soc/fsl/qe/qmc.h |  2 ++
 2 files changed, 15 insertions(+)

diff --git a/drivers/soc/fsl/qe/qmc.c b/drivers/soc/fsl/qe/qmc.c
index e23d60018400..76bb496305a0 100644
--- a/drivers/soc/fsl/qe/qmc.c
+++ b/drivers/soc/fsl/qe/qmc.c
@@ -1777,6 +1777,19 @@ static struct qmc_chan *qmc_chan_get_from_qmc(struct device_node *qmc_np, unsign
 	return qmc_chan;
 }
 
+int qmc_chan_count_phandles(struct device_node *np, const char *phandles_name)
+{
+	int count;
+
+	/* phandles are fixed args phandles with one arg */
+	count = of_count_phandle_with_args(np, phandles_name, NULL);
+	if (count < 0)
+		return count;
+
+	return count / 2;
+}
+EXPORT_SYMBOL(qmc_chan_count_phandles);
+
 struct qmc_chan *qmc_chan_get_byphandles_index(struct device_node *np,
 					       const char *phandles_name,
 					       int index)
diff --git a/include/soc/fsl/qe/qmc.h b/include/soc/fsl/qe/qmc.h
index 0fa7205145ce..294e42ea8d4c 100644
--- a/include/soc/fsl/qe/qmc.h
+++ b/include/soc/fsl/qe/qmc.h
@@ -16,6 +16,8 @@ struct device_node;
 struct device;
 struct qmc_chan;
 
+int qmc_chan_count_phandles(struct device_node *np, const char *phandles_name);
+
 struct qmc_chan *qmc_chan_get_byphandles_index(struct device_node *np,
 					       const char *phandles_name,
 					       int index);
-- 
2.45.0

