Return-Path: <linuxppc-dev+bounces-5921-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 20724A2B87E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Feb 2025 02:55:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YpxrT73Fnz305D;
	Fri,  7 Feb 2025 12:55:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.188
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738893337;
	cv=none; b=AlYMD+Exj3DOdQjxJ4OLxULbtZ803BNkKU9J3H/j7y2KAX9Izn3hbL67JEW0zw8oqNfs9SZ2t0U1JnECNmf7esoxbGBch7OFcyQOj85r1QhcQ1vrWdgvyTSTc/S3G3zbgxyydVVAaLfgzLa47CVjJAp44Mbhyj/36+dONDgNGdBXDHAJPzBVLvVChsJ87lMWPJB1WRdOK59+kEkCW/BJ4DyTNiei6Caurb1auX4kGLSkBV9CKOAG5q8toWqD+UHK/pQw+DdjchFJAOI7tz8W1JMMYMx7PuWXnZgP9I9oRdg7BbjK38ANMkKxpLMJZ7LQzGjQrnTpPRvFhdCAf2FooQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738893337; c=relaxed/relaxed;
	bh=FX9VSX467MSrG0Bh8a6YMT7QyhnSijDHxgVczoOxEGo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GYqTnE0Bv+125uSKKdjRdrl5klnFCo82ytEUjMIMWRSy1jEX2lymeACmRKLUgIRFgqo99Ijj4QO2qAqUwcjn4mkOkIzaVVGIkd6NCzjk1sxkHlFnrf0FafSi7QaBKhcqb9CD+5lpgDBRHTeCqWA+II4AjPgn/AJB7e9Z7FDZSNBtoZaPh+ymy5OEKjggWIU8X83PM8Sno7t4LDe6OgW812KdHhXrCjLJ3GYWzRlOW8DmfbYo//MoUW9WXSPN3V1L9Hv7HSwvUu1ES2Ne8ihZOmfZ6lnjm+PAF/2gpk7Wl68pPi0IYiTOO8hg1h0SeoXO0KNW2BWGf9oNrj/VXprSKg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.188; helo=szxga02-in.huawei.com; envelope-from=zhangzekun11@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.188; helo=szxga02-in.huawei.com; envelope-from=zhangzekun11@huawei.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 948 seconds by postgrey-1.37 at boromir; Fri, 07 Feb 2025 12:55:36 AEDT
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YpxrS5zMzz2yvl
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Feb 2025 12:55:35 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4YpxSG4vYwzrT0J;
	Fri,  7 Feb 2025 09:38:06 +0800 (CST)
Received: from kwepemf500003.china.huawei.com (unknown [7.202.181.241])
	by mail.maildlp.com (Postfix) with ESMTPS id 8EC5F1400DD;
	Fri,  7 Feb 2025 09:39:42 +0800 (CST)
Received: from huawei.com (10.175.112.208) by kwepemf500003.china.huawei.com
 (7.202.181.241) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 7 Feb
 2025 09:39:40 +0800
From: Zhang Zekun <zhangzekun11@huawei.com>
To: <robh@kernel.org>, <saravanak@google.com>, <justin.chen@broadcom.com>,
	<florian.fainelli@broadcom.com>, <andrew+netdev@lunn.ch>, <kuba@kernel.org>,
	<o.rempel@pengutronix.de>, <kory.maincent@bootlin.com>,
	<jacopo+renesas@jmondi.org>, <kieran.bingham+renesas@ideasonboard.com>,
	<laurent.pinchart+renesas@ideasonboard.com>, <maddy@linux.ibm.com>,
	<mpe@ellerman.id.au>, <npiggin@gmail.com>, <olteanv@gmail.com>,
	<davem@davemloft.net>, <taras.chornyi@plvision.eu>, <edumazet@google.com>,
	<pabeni@redhat.com>, <sudeep.holla@arm.com>, <cristian.marussi@arm.com>
CC: <arm-scmi@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-media@vger.kernel.org>, <netdev@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <chenjun102@huawei.com>,
	<zhangzekun11@huawei.com>
Subject: [PATCH 1/9] of: Add warpper function of_find_node_by_name_balanced()
Date: Fri, 7 Feb 2025 09:31:09 +0800
Message-ID: <20250207013117.104205-2-zhangzekun11@huawei.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20250207013117.104205-1-zhangzekun11@huawei.com>
References: <20250207013117.104205-1-zhangzekun11@huawei.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.112.208]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemf500003.china.huawei.com (7.202.181.241)
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

There are many drivers use of_find_node_by_name() with a not-NULL
device_node pointer, and a number of callers would require a call to
of_node_get() before using it. There are also some drivers who forget
to call of_node_get() which would cause a ref count leak[1]. So, Add a
wraper function for of_find_node_by_name(), drivers may use this function
to call of_find_node_by_name() with the refcount already balanced.

[1] https://lore.kernel.org/all/20241024015909.58654-1-zhangzekun11@huawei.com/

Signed-off-by: Zhang Zekun <zhangzekun11@huawei.com>
---
 include/linux/of.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/of.h b/include/linux/of.h
index eaf0e2a2b75c..b7c6d7ff278c 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -268,6 +268,11 @@ static inline const char *of_node_full_name(const struct device_node *np)
 #define for_each_of_allnodes(dn) for_each_of_allnodes_from(NULL, dn)
 extern struct device_node *of_find_node_by_name(struct device_node *from,
 	const char *name);
+static inline struct device_node *of_find_node_by_name_balanced(struct device_node *from,
+								const char *name)
+{
+	return of_find_node_by_name(of_node_get(from), name);
+}
 extern struct device_node *of_find_node_by_type(struct device_node *from,
 	const char *type);
 extern struct device_node *of_find_compatible_node(struct device_node *from,
-- 
2.22.0


