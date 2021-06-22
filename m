Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE383B060D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 15:43:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G8SKX5zGzz3cFh
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 23:43:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=h5Ah6tVX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72c;
 helo=mail-qk1-x72c.google.com; envelope-from=danielhb413@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=h5Ah6tVX; dkim-atps=neutral
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G8SHn0JCHz305k
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jun 2021 23:42:12 +1000 (AEST)
Received: by mail-qk1-x72c.google.com with SMTP id j184so39564719qkd.6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jun 2021 06:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wK+lz1570D3RMir3Ex4g5Tw3BeO1bUXSpe3zRlfRReY=;
 b=h5Ah6tVXcrOG/KQ9kESA9h8hnIAWRDim8zgXZYMFM6VMbVO1p0sPq/JjRpGMr03cwQ
 JrAn5Fhck4gbKSuW1AkLhNa/Ut0t/DjI0z3e3dj5fJC1aEGeEIw+ahaGmGDlecIw40XO
 JxRhAAmhdLGoCy21cG+/Oij7eX8d5BsoouLlU35SySq1g3iUKSy0wPHdCDDTxNEOOlhf
 Fam8WZcse8BM82HML0QOroQequa8/7xPfzAO/Jaei2flb+KHuuR4P4tVsdj1P8gfxfRr
 mVsKj8mIWxBnL4+wDx5I0U6Fifxiyb7DWJl88xkJ3MdvbNQj0LH6N61Pvdf7bl+/zqAu
 1n1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wK+lz1570D3RMir3Ex4g5Tw3BeO1bUXSpe3zRlfRReY=;
 b=kxMHNBUwud7KmEgQ8otz5njN+w1VPbGvZdrWAPeU/O0P+abINTYvJBHQv8lD2HmyD0
 bG14ntinyWEXPzo9e/phY229OaA6iKJKrG92mq0AzMiju+fmLtO3pFtUMa7RK8VsFBBC
 POeAbcgAavwIhX5rp/FXLCS42SFM1awabN2vqqgqAnPVI3w4d7IDgGBqZMnQFVdxNKtQ
 lg526z7pkyRHdiEL4exFmwop1M/ynDojDeB2NUgpVgizft2u57EkmmBaDeQy4yOsl67N
 NFUYz/uoC01JgRH+6lb6UupOHqiU00JFXhoGL3Hqp5bVPwzM2SCw+9zPrZ1nN9PyDFjF
 WZMQ==
X-Gm-Message-State: AOAM533ERjd+k/SUQW+6O8i0hrwPtwhG7olSalxOpJtRPBW0y51XU7gq
 qlZJpl+0KZj9rRhi3Y+yklh9rrIdQ0k=
X-Google-Smtp-Source: ABdhPJyV+H/bbfAFWx7yup2l6fbihf4Zx/p1/fqDMCJZYnbl9ncVNYB8kk7DANpF5M59DqZXe0U5Pw==
X-Received: by 2002:a37:9bc3:: with SMTP id d186mr4480073qke.14.1624369329478; 
 Tue, 22 Jun 2021 06:42:09 -0700 (PDT)
Received: from localhost.localdomain ([191.19.29.157])
 by smtp.gmail.com with ESMTPSA id r19sm1644491qtw.59.2021.06.22.06.42.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 06:42:09 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 3/3] powerpc/pseries: fail quicker in dlpar_memory_add_by_ic()
Date: Tue, 22 Jun 2021 10:39:23 -0300
Message-Id: <20210622133923.295373-4-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210622133923.295373-1-danielhb413@gmail.com>
References: <20210622133923.295373-1-danielhb413@gmail.com>
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The validation done at the start of dlpar_memory_add_by_ic() is an all
of nothing scenario - if any LMBs in the range is marked as RESERVED we
can fail right away.

We then can remove the 'lmbs_available' var and its check with
'lmbs_to_add' since the whole LMB range was already validated in the
previous step.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 arch/powerpc/platforms/pseries/hotplug-memory.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c b/arch/powerpc/platforms/pseries/hotplug-memory.c
index c0a03e1537cb..377d852f5a9a 100644
--- a/arch/powerpc/platforms/pseries/hotplug-memory.c
+++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
@@ -796,7 +796,6 @@ static int dlpar_memory_add_by_index(u32 drc_index)
 static int dlpar_memory_add_by_ic(u32 lmbs_to_add, u32 drc_index)
 {
 	struct drmem_lmb *lmb, *start_lmb, *end_lmb;
-	int lmbs_available = 0;
 	int rc;
 
 	pr_info("Attempting to hot-add %u LMB(s) at index %x\n",
@@ -811,15 +810,14 @@ static int dlpar_memory_add_by_ic(u32 lmbs_to_add, u32 drc_index)
 
 	/* Validate that the LMBs in this range are not reserved */
 	for_each_drmem_lmb_in_range(lmb, start_lmb, end_lmb) {
-		if (lmb->flags & DRCONF_MEM_RESERVED)
-			break;
-
-		lmbs_available++;
+		/* Fail immediately if the whole range can't be hot-added */
+		if (lmb->flags & DRCONF_MEM_RESERVED) {
+			pr_err("Memory at %llx (drc index %x) is reserved\n",
+					lmb->base_addr, lmb->drc_index);
+			return -EINVAL;
+		}
 	}
 
-	if (lmbs_available < lmbs_to_add)
-		return -EINVAL;
-
 	for_each_drmem_lmb_in_range(lmb, start_lmb, end_lmb) {
 		if (lmb->flags & DRCONF_MEM_ASSIGNED)
 			continue;
-- 
2.31.1

