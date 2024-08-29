Return-Path: <linuxppc-dev+bounces-736-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1A8963F14
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2024 10:53:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WvZms1jfQz2yvj;
	Thu, 29 Aug 2024 18:53:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.190
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724915183;
	cv=none; b=eOt8ZQZ6NKRfSNGI3Ykn2Cy+FnZ2mAhV+n7qvK7piYfSpW+9b897Ee5iWaNxAGHUJEJbnzFrc4rJe+zGLza9SXVcdBB9P2C26+6C+RLOzgBXGOC32i0+5k6Oublx8ok4zqXkD83Y8CKrpjjbXYmMTFGkqEBCXvVn0AQzkI0TukYRWCALow29lMm7W+kg4fUVjcXQl0jqK/+ar9eH2H/a7JrixgzcUZmEkci71L/B/qjwDUwLuDq8wAAoFUSFVpBj5lP/26kYfBSZtTCJBMoC6bAB/MsSRNthAw9HnkZ/bIUj+x6HBT+9NznT/Ut64eghF68xofvddKssDe2Bp3nQIg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724915183; c=relaxed/relaxed;
	bh=XBji34h+HX2ThOCPc7edavVF0g53p/vGor/vHrGMlBI=;
	h=X-Greylist:Received:Received:Received:From:To:CC:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy; b=CDeBLHwzCEr9Gur2yrdTY6evVs1f0YZcm1B4gGyMEOiPD+6EhKDIBR2FFLsO9HpqEPxhbPDDMiNnE4Y+OcHHkjxdm0ZPT6jwQb1mKMpyKlFVvVv1192Bfegj9CfZ/4XrYOHDkt0Zx76fdjwvsGmOiWBETQUeaD3nLYvk2pq1f8nYiBeTrAhoQwUU5mm+XsUZrFnGwMjmUj3pBOH4Rh2EGnEUkJMRsLMRbmDpJpjHPiCHtM4DF2ovsxWoSZ99qc1VsejNn6zga4zRLHL/7s0t7Rw9KToOEuDSUNFl2oku5Bm1xIpuhelMy15nl9oNPVmHTC7iNbqU0amn0PRezLnD5w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.190; helo=szxga04-in.huawei.com; envelope-from=linruifeng4@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.190; helo=szxga04-in.huawei.com; envelope-from=linruifeng4@huawei.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 1143 seconds by postgrey-1.37 at boromir; Thu, 29 Aug 2024 17:06:22 AEST
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WvXPp2WYqz2y6G
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2024 17:06:17 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4WvWt20FfLz20mhH;
	Thu, 29 Aug 2024 14:42:18 +0800 (CST)
Received: from kwepemm600016.china.huawei.com (unknown [7.193.23.20])
	by mail.maildlp.com (Postfix) with ESMTPS id 4D5E5180019;
	Thu, 29 Aug 2024 14:47:08 +0800 (CST)
Received: from huawei.com (10.175.112.208) by kwepemm600016.china.huawei.com
 (7.193.23.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 29 Aug
 2024 14:47:07 +0800
From: Lin Ruifeng <linruifeng4@huawei.com>
To: <johannes@sipsolutions.net>, <perex@perex.cz>, <tiwai@suse.com>
CC: <linuxppc-dev@lists.ozlabs.org>, <alsa-devel@alsa-project.org>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH -next] aoa: core: Using helper function for_each_child_of_node()
Date: Thu, 29 Aug 2024 14:33:47 +0800
Message-ID: <20240829063347.69818-1-linruifeng4@huawei.com>
X-Mailer: git-send-email 2.17.1
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.112.208]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600016.china.huawei.com (7.193.23.20)

Helper function for_each_child_of_node() can iterate
through the DT node, so we don't need to use while loop.

Signed-off-by: Lin Ruifeng <linruifeng4@huawei.com>
---
 sound/aoa/core/gpio-feature.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/aoa/core/gpio-feature.c b/sound/aoa/core/gpio-feature.c
index 39bb409b27f6..01060f7c3862 100644
--- a/sound/aoa/core/gpio-feature.c
+++ b/sound/aoa/core/gpio-feature.c
@@ -72,7 +72,7 @@ static struct device_node *get_gpio(char *name,
 		gpio = of_find_node_by_name(NULL, "gpio");
 		if (!gpio)
 			return NULL;
-		while ((np = of_get_next_child(gpio, np))) {
+		for_each_child_of_node(gpio, np) {
 			audio_gpio = of_get_property(np, "audio-gpio", NULL);
 			if (!audio_gpio)
 				continue;
-- 
2.17.1


