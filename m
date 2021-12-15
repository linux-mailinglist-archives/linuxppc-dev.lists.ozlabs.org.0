Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B0C476BC3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Dec 2021 09:19:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JF4lg1Jsjz3fF2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Dec 2021 19:19:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=AgCBvJ2V;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f32;
 helo=mail-qv1-xf32.google.com; envelope-from=nnac123@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=AgCBvJ2V; dkim-atps=neutral
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com
 [IPv6:2607:f8b0:4864:20::f32])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JDgKC19GPz308b
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Dec 2021 03:13:35 +1100 (AEDT)
Received: by mail-qv1-xf32.google.com with SMTP id m17so20700063qvx.8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Dec 2021 08:13:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DvMJ434CH1uK1ceYThBOiVq0e770iFS7Yqkua9hqxn8=;
 b=AgCBvJ2V2uhuPgS7VZA8U8ndMYFx38zKVcCcwNlf2Jj6sX2Dh3aw9V5PLOX+m7DMUo
 rbcrxF1ot1/Hl96dwFQmxQQ0pSe2nBRkMAugJ1h6bHz+6q/8X3F2yFcQwvGgv3PcGee1
 uRtZy50bIyZcNiYBQ7mE0k6H5syjh0QIBzHywuq3T4bXF+TbPvT/5VJdmWUuCxLM52nX
 nIcGa3Xjzw7e/ZPNqU/7Xg3YPU4+mUQ7qxH0ATLFUl9uGl3xVei0p1dwApkZE/MAq49d
 PEg+Z6rqTAlkAFOS3SXJsDDFr3b6BHYT9JDZS+0j+N9tOaF4HPDZ8VMslPfTtumUDhZY
 ULrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DvMJ434CH1uK1ceYThBOiVq0e770iFS7Yqkua9hqxn8=;
 b=nVupk22LSWIPTBKNFFCckqtcVVxq11aPqdfeQMnz/nvLKhsR1XX0Qhihmt/dvGYsTu
 +7HnxTZO0wX2ZM6TojzKCpAhW18s0mMxHi0O6h3tqnMaaxxEFpmmGRFyap/dVkWIj4id
 Z15zn/4PWFjC5YUjWgnmdjTdx2syJfnU6JRAJWufMYokwd+/3hRkkxGurc8LfWS/XwkE
 LTv3ZuJnZWkChOLFxt0HvBnY2jPe3S9Cv7H48vxlzhTrXsZXj6DhVS1lWaJdgxri4seM
 p0yauUuJjcg6yFG4765hvrEvAqCy5HkmoMnG1jel9cfvm7Qy78rHy1tkU1SCD3UKvNxn
 mF1w==
X-Gm-Message-State: AOAM531tzg+7GN4rLzJlHP2Aio23qAyFdD+8Y9ZKr7Yx49ve54frO9b/
 zjnke7meG6g+hLF9IvNlKdQtYrtUrEw=
X-Google-Smtp-Source: ABdhPJyoO5d77TQzLKnFCmnz3MWjpaRtm0knv0BhseVjS+2ae04b9442awmqPS1KN4DkLc0tcDuIDQ==
X-Received: by 2002:a05:6214:29c3:: with SMTP id
 gh3mr11772418qvb.44.1639584812751; 
 Wed, 15 Dec 2021 08:13:32 -0800 (PST)
Received: from starship-12.hsd1.fl.comcast.net
 ([2601:589:4a00:1ed0:73:d0b0:acf1:e2d0])
 by smtp.gmail.com with ESMTPSA id t11sm1276436qkp.56.2021.12.15.08.13.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 08:13:32 -0800 (PST)
From: Nick Child <nnac123@gmail.com>
X-Google-Original-From: Nick Child <nick.child@ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 14/20] powerpc/4xx: Add __init attribute to eligible functions
Date: Wed, 15 Dec 2021 11:12:37 -0500
Message-Id: <20211215161243.16396-15-nick.child@ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211215161243.16396-1-nick.child@ibm.com>
References: <20211215161243.16396-1-nick.child@ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 16 Dec 2021 19:09:28 +1100
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
Cc: Nick Child <nick.child@ibm.com>, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Some functions defined in 'arch/powerpc/platforms/4xx' are deserving of an
`__init` macro attribute. These functions are only called by other
initialization functions and therefore should inherit the attribute.

Signed-off-by: Nick Child <nick.child@ibm.com>
---
 arch/powerpc/platforms/4xx/cpm.c | 4 ++--
 arch/powerpc/platforms/4xx/pci.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/4xx/cpm.c b/arch/powerpc/platforms/4xx/cpm.c
index ae8b812c9202..2571841625a2 100644
--- a/arch/powerpc/platforms/4xx/cpm.c
+++ b/arch/powerpc/platforms/4xx/cpm.c
@@ -163,7 +163,7 @@ static ssize_t cpm_idle_store(struct kobject *kobj,
 static struct kobj_attribute cpm_idle_attr =
 	__ATTR(idle, 0644, cpm_idle_show, cpm_idle_store);
 
-static void cpm_idle_config_sysfs(void)
+static void __init cpm_idle_config_sysfs(void)
 {
 	struct device *dev;
 	unsigned long ret;
@@ -231,7 +231,7 @@ static const struct platform_suspend_ops cpm_suspend_ops = {
 	.enter		= cpm_suspend_enter,
 };
 
-static int cpm_get_uint_property(struct device_node *np,
+static int __init cpm_get_uint_property(struct device_node *np,
 				 const char *name)
 {
 	int len;
diff --git a/arch/powerpc/platforms/4xx/pci.c b/arch/powerpc/platforms/4xx/pci.c
index c13d64c3b019..24f41e178cbc 100644
--- a/arch/powerpc/platforms/4xx/pci.c
+++ b/arch/powerpc/platforms/4xx/pci.c
@@ -1273,7 +1273,7 @@ static int __init ppc405ex_pciex_core_init(struct device_node *np)
 	return 2;
 }
 
-static void ppc405ex_pcie_phy_reset(struct ppc4xx_pciex_port *port)
+static void __init ppc405ex_pcie_phy_reset(struct ppc4xx_pciex_port *port)
 {
 	/* Assert the PE0_PHY reset */
 	mtdcri(SDR0, port->sdr_base + PESDRn_RCSSET, 0x01010000);
-- 
2.25.1

