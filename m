Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2D87E8C6E
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Nov 2023 21:03:19 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=R4RIFVbE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SSRT121pRz3cXy
	for <lists+linuxppc-dev@lfdr.de>; Sun, 12 Nov 2023 07:03:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=R4RIFVbE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com; envelope-from=colin.i.king@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SSRS81vdyz2yDD
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 12 Nov 2023 07:02:30 +1100 (AEDT)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-40859c464daso24621605e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Nov 2023 12:02:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699732943; x=1700337743; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ux3JnOkDtQtFFiSSmtfisW2bjV3FX8kEYn9loFMjrbU=;
        b=R4RIFVbE7of277Ni7Jw1AWJpuNjBzFG/7YdkzG5nr91nenJTLHSGr2QcaAgiiLZUX7
         Cupi9eX4Gbd1QoVTQC+IPcrlGzvvGElgPz18RH2KQHIHfKO0VnTaC01YsuYFlhe5Yjnl
         xdb/dxyLvD08529fOMfOanOmugYVlDrINGok+5hSt3h78XDf2Ish77IqQxLMFac9rRh3
         JM/sxwjn/jyXAdN0om++/qMXkJ4IwBmZfoBoPjTRbF5x16jNMcwaRKbAHTk+uqdomVZj
         wSNVN7XC+a9QvspSTN5taWFZYuITwJx5bzpBNKJ7UGWqWZt9yH9yBDrkho6PnLc9Bjag
         t3VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699732943; x=1700337743;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ux3JnOkDtQtFFiSSmtfisW2bjV3FX8kEYn9loFMjrbU=;
        b=pEY8GFxRKdKAl0qNUst49E55dacvkMh1ZRqAyczK2GjV/OIdXH74XHxmpt9OytU37C
         CHCZrf+SrupuCIqv/Cd7CGlc9vPKsyTbYSUfGvXliYTxAaw3KIkIVxBV2iVSHgRKCd3Y
         CFKHRtCHgZW5G9Tuzr/nJP/8XLjPp2kiHwMN+4igqKOfvXA2U5r2369JHEFAnNawhY3+
         lc+htokmYwgsLC+9U86aSHMfexzKcLDTrwm2gU7i1IFL2peeTUfanFHNpsD9IZf/qJyS
         7eYCOGqNUFfyABFNfsnENHIQMBea7R/+uK/tiR2U+PpcvlYeU3lj6fHyYMeTnvUHORiH
         aNAA==
X-Gm-Message-State: AOJu0Yzi4GXc2NH0iUdGgPE567A21GxEQ6YOGcKG+3EUkkhuPxl6KQIj
	tN3g1hNLpll+OBswhW/T2Ks=
X-Google-Smtp-Source: AGHT+IGtegBIMkINKygpu/FywbEpt/rU4mDYId2ckUhjyq7MIoNRe3aAfbMCExoD7jPrCWGbz7pEqA==
X-Received: by 2002:a05:600c:3543:b0:401:b204:3b97 with SMTP id i3-20020a05600c354300b00401b2043b97mr2234114wmq.4.1699732943216;
        Sat, 11 Nov 2023 12:02:23 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id r9-20020a05600c320900b00407b93d8085sm8652755wmp.27.2023.11.11.12.02.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Nov 2023 12:02:22 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Roy Pledge <Roy.Pledge@nxp.com>,
	Li Yang <leoyang.li@nxp.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH][next] soc: fsl: dpio: remove redundant assignment to pointer p
Date: Sat, 11 Nov 2023 20:02:21 +0000
Message-Id: <20231111200221.338612-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pointer p is being assigned a value that is never read, the assignment
is redundant and can be removed. Cleans up clang scan build warning:

drivers/soc/fsl/dpio/qbman-portal.c:662:3: warning: Value stored to 'p'
is never read [deadcode.DeadStores]

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/soc/fsl/dpio/qbman-portal.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/soc/fsl/dpio/qbman-portal.c b/drivers/soc/fsl/dpio/qbman-portal.c
index 0a3fb6c115f4..c2fa5c981edc 100644
--- a/drivers/soc/fsl/dpio/qbman-portal.c
+++ b/drivers/soc/fsl/dpio/qbman-portal.c
@@ -659,7 +659,6 @@ int qbman_swp_enqueue_multiple_direct(struct qbman_swp *s,
 
 	if (!s->eqcr.available) {
 		eqcr_ci = s->eqcr.ci;
-		p = s->addr_cena + QBMAN_CENA_SWP_EQCR_CI;
 		s->eqcr.ci = qbman_read_register(s, QBMAN_CINH_SWP_EQCR_CI);
 		s->eqcr.ci &= full_mask;
 
-- 
2.39.2

