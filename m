Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DF403E4C5B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Oct 2019 15:34:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4704pc3tGzzDqlg
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Oct 2019 00:34:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=rasmusvillemoes.dk (client-ip=2a00:1450:4864:20::243;
 helo=mail-lj1-x243.google.com; envelope-from=linux@rasmusvillemoes.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=rasmusvillemoes.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk
 header.b="CHlNbLzn"; dkim-atps=neutral
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4703dG1Yb5zDqXm
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2019 23:41:22 +1100 (AEDT)
Received: by mail-lj1-x243.google.com with SMTP id c4so2515923lja.11
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2019 05:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=25nZvlQO3yC7IxomA1FSL3UVFhWXmdHyCH8gs+B5jDY=;
 b=CHlNbLznCLD+9QqB53UKVxFWZZx6+NuuoSSZ04+l9L/wWDzqpQDRs+hb/7KwGrnUKE
 DXwI+kb2gkU0u8cK+N+oOl6YK5aRBzeHmMaUTEpH2Fbpd/D4tunbyu1e5xE0bT7G1Jgs
 HXleEroGe7pXlS5k2YW9XUhmioLEBexahKruc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=25nZvlQO3yC7IxomA1FSL3UVFhWXmdHyCH8gs+B5jDY=;
 b=gFWlw0YEs2wnb+oMDZevwQmUH+HTuxuCKruZBETKPHgv+EJ51/T12n5VDD0JDRsoCS
 jHk5rWjiKW6qc/3ABNX1IWMiVp2lem+a2Uy26Kjge5Y+08Mj6EFnplZIRnaS+w/3BDUj
 2wAtHpWO+4dWs5KoYVUl9QfUupGIhTFVNo8+d9SQa3bPx6CeAXzNsfqz4pBMvO2s/0UR
 X2HXWm0bWFSf0rxsWMboEyvHrqMNj30cIPR4kNpT+jCWSIxyQSriezOl6ED42qLMbIlt
 q5oaJBMAoHJhpCF6/uNNj7EJtD5NHDduUvgEec0k0uj6NvCiGCXyTW1qAjFMOmusYa63
 Nv0Q==
X-Gm-Message-State: APjAAAWdZbsgIp9tzYZE5sQoC1WFULPGYPcJknNzuYhSufYgSP26CuqU
 5OeJIRdfECJtvGcJd96V9JiD6TRt6Alz3w==
X-Google-Smtp-Source: APXvYqzyE18HLcIQwkmrc5Pv5A6HQWczyLJz1SK8xGVjYLYsbDkY9CpxwHjOUK4P61qt5TGlioKYvg==
X-Received: by 2002:a2e:89d3:: with SMTP id c19mr2340355ljk.201.1572007279184; 
 Fri, 25 Oct 2019 05:41:19 -0700 (PDT)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id 10sm821028lfy.57.2019.10.25.05.41.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2019 05:41:18 -0700 (PDT)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v2 13/23] soc: fsl: qe: remove pointless sysfs registration in
 qe_ic.c
Date: Fri, 25 Oct 2019 14:40:48 +0200
Message-Id: <20191025124058.22580-14-linux@rasmusvillemoes.dk>
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

There's no point in registering with sysfs when that doesn't actually
allow any interaction with the device or driver (no uevents, no sysfs
files that provide information or allow configuration, no nothing).

Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 drivers/soc/fsl/qe/qe_ic.c | 31 -------------------------------
 1 file changed, 31 deletions(-)

diff --git a/drivers/soc/fsl/qe/qe_ic.c b/drivers/soc/fsl/qe/qe_ic.c
index 61a40e40f3ae..6bd6d6fb9696 100644
--- a/drivers/soc/fsl/qe/qe_ic.c
+++ b/drivers/soc/fsl/qe/qe_ic.c
@@ -604,34 +604,3 @@ int qe_ic_set_high_priority(unsigned int virq, unsigned int priority, int high)
 
 	return 0;
 }
-
-static struct bus_type qe_ic_subsys = {
-	.name = "qe_ic",
-	.dev_name = "qe_ic",
-};
-
-static struct device device_qe_ic = {
-	.id = 0,
-	.bus = &qe_ic_subsys,
-};
-
-static int __init init_qe_ic_sysfs(void)
-{
-	int rc;
-
-	printk(KERN_DEBUG "Registering qe_ic with sysfs...\n");
-
-	rc = subsys_system_register(&qe_ic_subsys, NULL);
-	if (rc) {
-		printk(KERN_ERR "Failed registering qe_ic sys class\n");
-		return -ENODEV;
-	}
-	rc = device_register(&device_qe_ic);
-	if (rc) {
-		printk(KERN_ERR "Failed registering qe_ic sys device\n");
-		return -ENODEV;
-	}
-	return 0;
-}
-
-subsys_initcall(init_qe_ic_sysfs);
-- 
2.23.0

