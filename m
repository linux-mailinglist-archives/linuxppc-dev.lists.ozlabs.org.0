Return-Path: <linuxppc-dev+bounces-1581-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5D3985399
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Sep 2024 09:18:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XD7Nm49s1z2yXd;
	Wed, 25 Sep 2024 17:18:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=92.121.34.21
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727248680;
	cv=none; b=lpniMnrMoj3EAWwQSbiD1kpCpaNtFfdgokGalhU2IsNAMgoJh522UGMd6V5auHbagraixRXWrQB02lIvlFFEBcuVphu9RS/9fYn7k6/LMyiwhwnvPI7YIqg84sAu9jWLajAtOh/wAzU0lbBFCrRBiujz+hMzjJOY4CBTB8raKbmaUSna9GJMzpGYlkDEOdYIgIqK2nCCZrLKH14lwZ5/iXl2CA6YlyujxcZnblxhHVebjUfruKCFFuHK7el2WqWj7t7UHvo/YlnD3NzZrlSQcgFtpeigIP0FrwWAFl8V5ThKP5FgEXs+SEM3TOIAydGeJxAhB3UzkkxU13riLSS0FA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727248680; c=relaxed/relaxed;
	bh=xk5Akn471TKQWn5neOjgSQDStg5n2ODlIn5sLehI3wc=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References; b=OhvzINObb2bcVbWoMloN+tH344aVDGgNUyTfUhXnOBd0qP1l8zqLVE5KrarSVGCeXUHwfaQFrzj8FJS3aMulurMYN/ttRG8V0xoPzhj+z1IvLwRpSavb5/iU4JOMSSFmxJF8bE1MRzl9j7u1SrHoQuLOgTqF2cDszMMuvJCzLmrAsZCi3W9ofrLg8Y4NSPUXKiiD2fX7c2Xgz6rMw3v27w/5aZ+c1Zl4UvphshxHz7N1ISxKy0aeR7RI/xk2ftssgKiF8lyKdU6Vq1WEJFVcSpeisrZ7TwUeG7pd8gNX6yIGEf4CBnU+qMNDeDb3qYe833VMTJRZGIX73b+d1CXeag==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass (client-ip=92.121.34.21; helo=inva021.nxp.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=92.121.34.21; helo=inva021.nxp.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XD7Nl5rr9z2yVV
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Sep 2024 17:17:59 +1000 (AEST)
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 5B9E4202A0C;
	Wed, 25 Sep 2024 09:17:57 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 2B885202A0A;
	Wed, 25 Sep 2024 09:17:57 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 7B1E4183AD47;
	Wed, 25 Sep 2024 15:17:55 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: vkoul@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 7/7] ASoC: fsl_easrc: register m2m platform device
Date: Wed, 25 Sep 2024 14:55:16 +0800
Message-Id: <1727247316-16156-8-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1727247316-16156-1-git-send-email-shengjiu.wang@nxp.com>
References: <1727247316-16156-1-git-send-email-shengjiu.wang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>

Register m2m platform device,that user can
use M2M feature.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_easrc.c | 33 +++++++++++++++++++++++++++++++--
 1 file changed, 31 insertions(+), 2 deletions(-)

diff --git a/sound/soc/fsl/fsl_easrc.c b/sound/soc/fsl/fsl_easrc.c
index a1a7a90ff5ef..25d1c103df32 100644
--- a/sound/soc/fsl/fsl_easrc.c
+++ b/sound/soc/fsl/fsl_easrc.c
@@ -2204,6 +2204,12 @@ static int fsl_easrc_probe(struct platform_device *pdev)
 		goto err_pm_disable;
 	}
 
+	ret = fsl_asrc_m2m_init(easrc);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to init m2m device %d\n", ret);
+		return ret;
+	}
+
 	return 0;
 
 err_pm_disable:
@@ -2213,6 +2219,10 @@ static int fsl_easrc_probe(struct platform_device *pdev)
 
 static void fsl_easrc_remove(struct platform_device *pdev)
 {
+	struct fsl_asrc *easrc = dev_get_drvdata(&pdev->dev);
+
+	fsl_asrc_m2m_exit(easrc);
+
 	pm_runtime_disable(&pdev->dev);
 }
 
@@ -2313,10 +2323,29 @@ static int fsl_easrc_runtime_resume(struct device *dev)
 	return ret;
 }
 
+static int fsl_easrc_suspend(struct device *dev)
+{
+	struct fsl_asrc *easrc = dev_get_drvdata(dev);
+	int ret;
+
+	fsl_asrc_m2m_suspend(easrc);
+	ret = pm_runtime_force_suspend(dev);
+	return ret;
+}
+
+static int fsl_easrc_resume(struct device *dev)
+{
+	struct fsl_asrc *easrc = dev_get_drvdata(dev);
+	int ret;
+
+	ret = pm_runtime_force_resume(dev);
+	fsl_asrc_m2m_resume(easrc);
+	return ret;
+}
+
 static const struct dev_pm_ops fsl_easrc_pm_ops = {
 	RUNTIME_PM_OPS(fsl_easrc_runtime_suspend, fsl_easrc_runtime_resume, NULL)
-	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
-				pm_runtime_force_resume)
+	SYSTEM_SLEEP_PM_OPS(fsl_easrc_suspend, fsl_easrc_resume)
 };
 
 static struct platform_driver fsl_easrc_driver = {
-- 
2.34.1


