Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 452C791AE1C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jun 2024 19:34:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FAjbaRRz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W95KD4wXSz3dLl
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2024 03:34:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FAjbaRRz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22a; helo=mail-lj1-x22a.google.com; envelope-from=fancer.lancer@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W95JV5nKFz3cW5
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jun 2024 03:33:30 +1000 (AEST)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2ec3f875e68so90655961fa.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2024 10:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719509607; x=1720114407; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0nAXuUIOjmGqCty40Smyp4CQdr7UcxvXuJwOvkK+QNc=;
        b=FAjbaRRzHEfhygHt8A8UU+vXFb0BhygePUgfOC7u3dkfx3paeh7vu/FpxduvwqJs2t
         Yl5VIXjVBclVaMOp9DO7ALXGLDIfDtcgWTT60fN20HCOxdcPO9wvQ170sL1h1DDhXMwJ
         yiuZj+iu/1gF0fH5TLOUSalin0Pz7G7UDY66S7leXB0jZ6GJr9j3OVoqd70thL7o0JM4
         CwVV8G3qcOGFS6PDqynEDoWvw/QUnJN+QrXqlp/cMV2r8hErBTijOpPdJ2nJygNa2pD3
         LPyyxhzOv7NVb+lkv60wyK3L2gX8Q0vz7KDPgEBZXwWGJGHPcQktMrMUh0xycV1Ekbkr
         cEnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719509607; x=1720114407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0nAXuUIOjmGqCty40Smyp4CQdr7UcxvXuJwOvkK+QNc=;
        b=mGMgb67SDGaxjKh4tqgzFA26l7/GYgUK4yaPf2Ap/E76GlaJLXL5FAMAsOEqLTiuFH
         10eUjSw87ZT4eyCPfNXKpfXk9wjS5LPHpE+jNajfbA9D8Rt7bQJBgqzjJI9LovukoNDr
         UV7fN+mzy7VVdG+GiQySaPA08Y/uca2Y7wQL9/EhaG/oh5GsKOUeyAl55rW6CH4DBlDG
         RYd4j+jOeNqTsVfIGdJfsqUCVbmgh2JnP4/5+sg/6hFrxkUMq6/KpepfDAOt2Yu9x6Dw
         O6bNMzGuIcmBv5W0KXMUEhTe7PxOJdNYVTEnGEL66ECQ71q25bcSHdeGz24bpDUwr3fC
         DmfA==
X-Forwarded-Encrypted: i=1; AJvYcCXIYmWsEZE6LNuMLyv6ZOiGCeI5pQ/hda852FNEOslAZkuI2QVhuJJ2kKG7Y3QO03m8TrmovZ4/PeztTHLJ29a8ttwkQqI29VmPYek0bA==
X-Gm-Message-State: AOJu0Yxof6NEnxlkBUlu6zpmFJzRBMmFCirT2OSXuZDCcjMIZ89jLXK6
	WeqjEI6dqowcDUpzAO5H2RKc/sgX/yg/Xu0F9mrGRtPKrZb87BVz
X-Google-Smtp-Source: AGHT+IHGoGY2n1QfAG6JTwUNGhhCZzy4UmpenhlHuzy1RroDnkwx5LnD4lEgqD3Y8VeOD4uJVKvTsQ==
X-Received: by 2002:a2e:9907:0:b0:2eb:dabb:f2b2 with SMTP id 38308e7fff4ca-2ec5b38b74amr84977561fa.30.1719509607182;
        Thu, 27 Jun 2024 10:33:27 -0700 (PDT)
Received: from localhost ([213.79.110.82])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ee4a4bef32sm3213471fa.120.2024.06.27.10.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 10:33:26 -0700 (PDT)
From: Serge Semin <fancer.lancer@gmail.com>
To: Michal Simek <michal.simek@amd.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>,
	James Morse <james.morse@arm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Robert Richter <rric@kernel.org>,
	Lei Wang <lewan@microsoft.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Egor Martovetsky <egor@pasemi.com>
Subject: [PATCH RESEND v6 13/18] EDAC/mc: Re-use generic unique MC index allocation procedure
Date: Thu, 27 Jun 2024 20:32:20 +0300
Message-ID: <20240627173251.25718-14-fancer.lancer@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240627173251.25718-1-fancer.lancer@gmail.com>
References: <20240627173251.25718-1-fancer.lancer@gmail.com>
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
Cc: Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>, Dinh Nguyen <dinguyen@kernel.org>, Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The EDAC drivers locally maintaining a statically defined
memory-controllers counter don't care much about the MC index assigned as
long as it's unique so the EDAC core perceives it. Convert these drivers
to be using the generic MC index allocation procedure recently added to
the EDAC core.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>

---

Changelog v4:
- Initial patch introduction.
---
 drivers/edac/dmc520_edac.c | 4 +---
 drivers/edac/pasemi_edac.c | 5 +----
 drivers/edac/ppc4xx_edac.c | 5 +----
 3 files changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/edac/dmc520_edac.c b/drivers/edac/dmc520_edac.c
index 4e30b989a1a4..93734a97a67b 100644
--- a/drivers/edac/dmc520_edac.c
+++ b/drivers/edac/dmc520_edac.c
@@ -173,8 +173,6 @@ struct dmc520_edac {
 	int masks[NUMBER_OF_IRQS];
 };
 
-static int dmc520_mc_idx;
-
 static u32 dmc520_read_reg(struct dmc520_edac *pvt, u32 offset)
 {
 	return readl(pvt->reg_base + offset);
@@ -517,7 +515,7 @@ static int dmc520_edac_probe(struct platform_device *pdev)
 	layers[0].size = dmc520_get_rank_count(reg_base);
 	layers[0].is_virt_csrow = true;
 
-	mci = edac_mc_alloc(dmc520_mc_idx++, ARRAY_SIZE(layers), layers, sizeof(*pvt));
+	mci = edac_mc_alloc(EDAC_AUTO_MC_NUM, ARRAY_SIZE(layers), layers, sizeof(*pvt));
 	if (!mci) {
 		edac_printk(KERN_ERR, EDAC_MOD_NAME,
 			    "Failed to allocate memory for mc instance\n");
diff --git a/drivers/edac/pasemi_edac.c b/drivers/edac/pasemi_edac.c
index 1a1c3296ccc8..afebfbda1ea0 100644
--- a/drivers/edac/pasemi_edac.c
+++ b/drivers/edac/pasemi_edac.c
@@ -57,8 +57,6 @@
 #define PASEMI_EDAC_ERROR_GRAIN			64
 
 static int last_page_in_mmc;
-static int system_mmc_id;
-
 
 static u32 pasemi_edac_get_error_info(struct mem_ctl_info *mci)
 {
@@ -203,8 +201,7 @@ static int pasemi_edac_probe(struct pci_dev *pdev,
 	layers[1].type = EDAC_MC_LAYER_CHANNEL;
 	layers[1].size = PASEMI_EDAC_NR_CHANS;
 	layers[1].is_virt_csrow = false;
-	mci = edac_mc_alloc(system_mmc_id++, ARRAY_SIZE(layers), layers,
-			    0);
+	mci = edac_mc_alloc(EDAC_AUTO_MC_NUM, ARRAY_SIZE(layers), layers, 0);
 	if (mci == NULL)
 		return -ENOMEM;
 
diff --git a/drivers/edac/ppc4xx_edac.c b/drivers/edac/ppc4xx_edac.c
index 1eea3341a916..06d267d40a6a 100644
--- a/drivers/edac/ppc4xx_edac.c
+++ b/drivers/edac/ppc4xx_edac.c
@@ -1214,7 +1214,6 @@ static int ppc4xx_edac_probe(struct platform_device *op)
 	const struct device_node *np = op->dev.of_node;
 	struct mem_ctl_info *mci = NULL;
 	struct edac_mc_layer layers[2];
-	static int ppc4xx_edac_instance;
 
 	/*
 	 * At this point, we only support the controller realized on
@@ -1265,7 +1264,7 @@ static int ppc4xx_edac_probe(struct platform_device *op)
 	layers[1].type = EDAC_MC_LAYER_CHANNEL;
 	layers[1].size = ppc4xx_edac_nr_chans;
 	layers[1].is_virt_csrow = false;
-	mci = edac_mc_alloc(ppc4xx_edac_instance, ARRAY_SIZE(layers), layers,
+	mci = edac_mc_alloc(EDAC_AUTO_MC_NUM, ARRAY_SIZE(layers), layers,
 			    sizeof(struct ppc4xx_edac_pdata));
 	if (mci == NULL) {
 		ppc4xx_edac_printk(KERN_ERR, "%pOF: "
@@ -1303,8 +1302,6 @@ static int ppc4xx_edac_probe(struct platform_device *op)
 			goto fail1;
 	}
 
-	ppc4xx_edac_instance++;
-
 	return 0;
 
  fail1:
-- 
2.43.0

