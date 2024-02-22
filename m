Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 19FD98600B3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Feb 2024 19:15:37 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Y5YR/apD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TghCB6ywZz3vXv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Feb 2024 05:15:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Y5YR/apD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22b; helo=mail-lj1-x22b.google.com; envelope-from=fancer.lancer@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TghBP3YYbz2yN3
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Feb 2024 05:14:51 +1100 (AEDT)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2d228a132acso1160531fa.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Feb 2024 10:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708625688; x=1709230488; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0nAXuUIOjmGqCty40Smyp4CQdr7UcxvXuJwOvkK+QNc=;
        b=Y5YR/apDyowftQf1WPza0FNTkYztkz0ibHDMJ1ROJJZpDnAV6slXZ0GKgm2UmW63Wv
         oQ48f24/INEIMXwV1mh5bfQlF9cUirvM+0qrkxL8/6WbuG/OzgGhxP5afrrHBnwv/QRC
         toM7fK0L7Ax9DqSEbneOgsD8RLMsC0Rq8PGnrw8uniPiboW837UIyyRLPWDw/pj69m2n
         LG6aw86ZiiHBX4BMay2/6/wRl7/M8UXTaBiSE+JB128UPbDtk1SywagvytkE6d/Q5WKv
         GvIO82LfzKTACFM5sk8cyWLKgofCEhoFKzK+4uq6OoB7kTSaPjxzqAhjP3MpqF2P+zdG
         Rs2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708625688; x=1709230488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0nAXuUIOjmGqCty40Smyp4CQdr7UcxvXuJwOvkK+QNc=;
        b=hvUgEUsw9HW6KBq4RkvebcYgoK30PmwDRktBLqyf7l+LsOULw7pe25VjrGj9iSzjyn
         /+y7mDPR9UJJwg9PDf/IussPAuCvlKr6nPF8S3Kii6ubko1gnFZTZQWlm2797RcIlsLg
         dl/L6et+0dv76Qimu0mGRmGuT6SaFYT8Iz4QLAMOwGG/pPLoBNl9B2c+1eVbfchp2nE0
         7PQVhtN8eMaysy7h/QJgtpdb1i/B0JdxdvXcoUD7Jqs1ZK6QinelC5oRO1AVGU6O4PbW
         pe6C+6+oDQSbHinfAYqwJKnsUl0pULyFvdMUHBlCgavPsKS+pkLS80Sjn1w0bPdOT9bs
         MRww==
X-Forwarded-Encrypted: i=1; AJvYcCV7TT8/+J7yJr+78gCdHnrS2yGvzSwqDiI1qIMBftVUFb6I6TNWmFwljRo+ExqXDdHFwM5IomsAv2rkq+XbTn/nzplc5D1i1Nwv8tf8oQ==
X-Gm-Message-State: AOJu0YzMTUOe0inodrB3FZrBK+xrcVpdTTYAGvyTpObB2WZT8OCIC2+U
	DDuARP3k/iKU0iJIuOGSr2dUtFNlpN4Br9LWIQvAFG/SCJXMNOJf
X-Google-Smtp-Source: AGHT+IHuWrnLpg4juM7jhgCVO9zVn6Qc74sw3WuVEmtL6YWr4BWGK20vM8RFfEGoQoVZiRd12s1KiA==
X-Received: by 2002:a2e:a272:0:b0:2d2:4388:63fc with SMTP id k18-20020a2ea272000000b002d2438863fcmr6085862ljm.44.1708625687765;
        Thu, 22 Feb 2024 10:14:47 -0800 (PST)
Received: from localhost ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id bd7-20020a05651c168700b002d24c720b16sm969025ljb.101.2024.02.22.10.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 10:14:47 -0800 (PST)
From: Serge Semin <fancer.lancer@gmail.com>
To: Michal Simek <michal.simek@amd.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>,
	James Morse <james.morse@arm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Robert Richter <rric@kernel.org>,
	Lei Wang <lewan@microsoft.com>,
	Egor Martovetsky <egor@pasemi.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Subject: [PATCH v5 15/20] EDAC/mc: Re-use generic unique MC index allocation procedure
Date: Thu, 22 Feb 2024 21:13:00 +0300
Message-ID: <20240222181324.28242-16-fancer.lancer@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240222181324.28242-1-fancer.lancer@gmail.com>
References: <20240222181324.28242-1-fancer.lancer@gmail.com>
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
Cc: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>, Dinh Nguyen <dinguyen@kernel.org>, Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org
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

