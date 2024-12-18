Return-Path: <linuxppc-dev+bounces-4283-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A4249F5D20
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Dec 2024 03:56:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YCdby2DNVz30DV;
	Wed, 18 Dec 2024 13:56:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::e33"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734490574;
	cv=none; b=eAjP6fYrX0HIsH2OLIKVXbEFHC3BTDe+mWx26I32vRkcPs29J0jmjDwwWPinbc14/svfK3N21485CCKVKwCGwPEsLLLP8pOwUZarcVNOYT3SteecBG263UWfE/MtQu/VrMwE6F1OdARlXyvTXD3jxEqjXdIOkPujr/F0bugWwB7mk8fIyaXKkk4P9SfmXgi5IicrvU2tCidxMxNMKsEmJ4DXrlKkmMNc4vQyWI89TaarFbadf3kv2m06W07zeHhGXmgnU1QyLY5wWCRpRWjJavIMaP8PbaqP31ipSN13apzg4yaFhiRNF4cFskJ++VYAocKmS9oiQtwJE35ibmHzog==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734490574; c=relaxed/relaxed;
	bh=/MGnTuEMctB6wlh4CNFaMVpSKzC3AE17XrRVHhf36cc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=YUJIqpOiUsxrkPMaATiR1bzQcx0slBHdnUoFcvCz/jSLmhOfHIbuUrp559MwYFEEOCJsfMc08qBjQVJe58ncNzhy2Mg0ANxY4PZvH6hEIKdUNOqfpRyrkMmgZB7DF3DVRZCrY9e8w+0FC6NAu+t3SUctr0HfDTSWfrMqUsNk54wp44EnO7JHf1tIVxHbc0XyyDZeSbKh0SdUBPMKtXs/haASABYQ1f1tDcd66XwjzJjv17U7j+SZd7eK5n/wyUTc8z1W9Au9hd+M6otllDKBSQ74Ndk25Bpifi2AjxKcqyxJH/4pVZdKrbecv4ui+TY7tpafC7XGBcmk8ZSE/gF2VA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SVrMS9QO; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::e33; helo=mail-vs1-xe33.google.com; envelope-from=luis.hernandez093@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SVrMS9QO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::e33; helo=mail-vs1-xe33.google.com; envelope-from=luis.hernandez093@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com [IPv6:2607:f8b0:4864:20::e33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YCdbw6ggcz3064
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Dec 2024 13:56:12 +1100 (AEDT)
Received: by mail-vs1-xe33.google.com with SMTP id ada2fe7eead31-4aff31b77e8so1921443137.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Dec 2024 18:56:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734490568; x=1735095368; darn=lists.ozlabs.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/MGnTuEMctB6wlh4CNFaMVpSKzC3AE17XrRVHhf36cc=;
        b=SVrMS9QOQfm6c6BYQla1usDxAZAw0onAH7Cxz8ER5vLhW962dJ93xmoTh76nMl9MwJ
         ZLLQun2fgjQpWneWjQ7Q5uMi75cRqar651i97v9gPkdwGLla0uqkghZm3Q+jaYaxIJUg
         o2NMlGvaF7Maw/SscD3pkWiqufv7LnrTdeORdl17pDvdjUld3FFL5jalBDyYb1+fD3wq
         /46ttwrChvTU+tRPGNIcU34dHX5Gh7Ggzj0zCGqw6rQByTAbZreP3J9KSFRq2nEflE+U
         krpMglsurpnjmBnsddR8sctl8/NT7oA4wmpR+XktgXZpeU3eFK695obJWjxtWVoe8Wef
         0qqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734490568; x=1735095368;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/MGnTuEMctB6wlh4CNFaMVpSKzC3AE17XrRVHhf36cc=;
        b=t8xq932kOUErZVkgApKfdS6EgfQ76IJKpT8/Ua/tTOX5MeTZdsEzq8hDUIGMx8bj5x
         RbQI8Dy1PHsMOgDacEe3t9G1u9T+XWwK48O1SLSaVfR1Ec1qrEXj3dgk3M24xknQaCb9
         ypTNLI2uYgJT2/q2snkuFhU24Q+kpGO8wqoXFg9OkbTeWsq7zxXHq71rVs968dF3FOwS
         FU634bFEsjzgT7u01H8qtm1XHPdcI1wVoLddjoecszCnDsLthzMMOWIb3Dd5TfkkULHb
         28PuI1eICqys6j/nzzDlsWF6kdV9xOPspIa8fVpOJPj7uT0Mc1kwVeyagDDZu1QuS2Rf
         PJAg==
X-Gm-Message-State: AOJu0YzFoyapQ8XetoTxSPsvlEvvRVKVgU2K23OeBztaGE7B0WNUXNkT
	zje6RKTeIcxdhX40hQe45khaNYsRO3Tj+YI6qXq2sajDVn3lK5Km
X-Gm-Gg: ASbGncv3olh1zONHNqnIfABycorSYsrbnCV3s9Ebgy4nh+uLTcpt4igjI/pSDmtHPuk
	RM5vzvSvfQQo/eEDJ04AYhsTDvLqfQ35fvueRlTpmPqPE0Ym5FYCl82XwNVgOlJbbh+zG7BtqDF
	SybkTOFCpVHtmclp19/geqVObt3HXvZrChaQMNBp8Q7x9olq8ZNTBDIRwuJvgk9bJ6A3KCJphnp
	VJVZWeeqrrnjA0l5q9zV9wWzVrjWwuXLbzlRBpfjRYw+1Az85ST0VtekJLjuE/axftgnPqBYfSZ
	ErnRajBhR7U/wdb0fcs0IeHkJ5nOMrfDjYB/LV2bJw==
X-Google-Smtp-Source: AGHT+IG8BM3RRv86o6y32VDpnRH4tLU3ksmo2dZ91zFqb+jsyb+VxkLDFBtcAttyZUzXjbObDwB3wg==
X-Received: by 2002:a05:6102:160e:b0:4b1:5cc6:92df with SMTP id ada2fe7eead31-4b2ae549730mr1552937137.0.1734490568555;
        Tue, 17 Dec 2024 18:56:08 -0800 (PST)
Received: from granite.localdomain (syn-142-197-128-048.res.spectrum.com. [142.197.128.48])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b270293014sm1331149137.19.2024.12.17.18.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 18:56:07 -0800 (PST)
From: Luis Felipe Hernandez <luis.hernandez093@gmail.com>
Date: Tue, 17 Dec 2024 21:55:41 -0500
Subject: [PATCH v2] macintosh: declare ctl_table as const
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241217-constify_ctl_table-v1-1-402ebceaeb8e@gmail.com>
X-B4-Tracking: v=1; b=H4sIAKw5YmcC/x3MQQqAIBBA0avErBNSgqSrRERNMzUgGipRRHdPW
 r7F/w8kikIJ+uqBSKckCb5A1xXgPvuNlKzFYBrTaqM7hcGnLHxPmN2U58WRslYzMqO1TQslPCK
 xXP90gNPA+L4fFu3yMWgAAAA=
X-Change-ID: 20241217-constify_ctl_table-881fcffc8804
To: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 linux@weissschuh.net, rbm@suse.com
Cc: Luis Felipe Hernandez <luis.hernandez093@gmail.com>
X-Mailer: b4 0.15-dev-355e8
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734490567; l=1564;
 i=luis.hernandez093@gmail.com; s=20241216; h=from:subject:message-id;
 bh=HMT7ymrg7muZbCh4orsKnOowhGi0scta8H0Ya7UnDs8=;
 b=0PNWNN2JVTvzrOmkicivMrgTvoKiGT+RPAT1Xa139wKp2C6izj+VT5jqRYDZvHSNv9HTFIoBb
 PgSFsQcn/6rBa1KaH6oHfBOCujPmP91pCESf2J6PpEVJPSBU1tZhdP3
X-Developer-Key: i=luis.hernandez093@gmail.com; a=ed25519;
 pk=E4Sj8ywxKbE+P0rYLQl7e84XZJfcVOiqNallR7p5IO4=
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Since commit 7abc9b53bd51 ("sysctl: allow registration of const struct
ctl_table"), the sysctl registration API allows struct ctl_table variables
to be placed into read-only memory.

mac_hid_files is registered as a sysctl table and should be treated as
read-only. By declaring the mac_hid_files structure as const, we ensure
that it cannot be accidentally modified. This change improves safety.

Suggested-by: Thomas Weißschuh <linux@weissschuh.net>
Suggested-by: Ricardo B. Marliere <rbm@suse.com>
Reviewed-by: Ricardo B. Marliere <rbm@suse.com>
Signed-off-by: Luis Felipe Hernandez <luis.hernandez093@gmail.com>
---
Changes in v2:
  * Remove redundant commit reference
  * Fix Suggested-by tags
---
 drivers/macintosh/mac_hid.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/macintosh/mac_hid.c b/drivers/macintosh/mac_hid.c
index b461b1bed25b2df106ecf612b82efaedf69f62b0..369d72f59b3c10869bc914f31e7dcb73e029ef7f 100644
--- a/drivers/macintosh/mac_hid.c
+++ b/drivers/macintosh/mac_hid.c
@@ -215,7 +215,7 @@ static int mac_hid_toggle_emumouse(const struct ctl_table *table, int write,
 }
 
 /* file(s) in /proc/sys/dev/mac_hid */
-static struct ctl_table mac_hid_files[] = {
+static const struct ctl_table mac_hid_files[] = {
 	{
 		.procname	= "mouse_button_emulation",
 		.data		= &mouse_emulate_buttons,

---
base-commit: fdb298fa865b0136f7be842e6c2e6310dede421a
change-id: 20241217-constify_ctl_table-881fcffc8804

Best regards,
-- 
Luis Felipe Hernandez <luis.hernandez093@gmail.com>


