Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F79A81AE20
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Dec 2023 05:47:48 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=S225jgcu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SwdGB0xxJz3dLH
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Dec 2023 15:47:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=S225jgcu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f32; helo=mail-qv1-xf32.google.com; envelope-from=haokexin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com [IPv6:2607:f8b0:4864:20::f32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SwdCm5vtlz3cP3
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Dec 2023 15:45:40 +1100 (AEDT)
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-67f5132e8fcso2651866d6.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Dec 2023 20:45:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703133937; x=1703738737; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=508hzsA1BZw2wQ/qtSJVPGxmi524ZrH5CnpDQLWzUtM=;
        b=S225jgcucCm0AnGdUsUNN77gD62AQhK7k2fUYe8Ynb8+X7+ns++Ab+WMaR25aXF/sS
         CLzMeiDT06wlQI5m5kAChLWzeHFBX1mALw90yJrmyPI1xj+z7uIkVizULWDqd9F0nc47
         2mXLOmRuDZYIFEFLF2lBgQzF+hvhQdTpMSlpFTrjCgXM7C/g1AwRGlOLnVgrlt/Om3g9
         3ChxOKKoeovxZEc7IqR7Hf2Pti6W2d08u1crvoGNeDO+FKaWoagiIgvpHsWSmNzp2Lbh
         FfOhlIlYk/PKPSStMuARCBafcQMzKWuLHgQIOcwZ9zeQuMyL7RwygZS8eAXzO6zfsoCs
         eOxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703133937; x=1703738737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=508hzsA1BZw2wQ/qtSJVPGxmi524ZrH5CnpDQLWzUtM=;
        b=rCDFJ9I9jd059MUhRCyghUVuKWJuGYhGZNq4m6f090dtPqGAyp3Ume8sjMU1Jk/22m
         LKGTXXf1OOJH0b5cU+qoK2fpdBONeTRwMODjXprSDadum9ZS5iALBV/cd0C3eQaRRcUe
         +NFxChQUw0JWEJud+jKRN7CZ5bsfm6aH2zwOwWbqojcnIbaJPHkbNXP0O1howPx4ufdQ
         6WzxRrlqsjgUHOAODQEblCq2CSmpF4NdOXxl++o07x9tHdaEiA862F8JbPqOZrKJiLGh
         MOvwKeAlQUnuh4fJXHO7umMWeAwd+ADed/PQGT6Cw+frvH4yvHSjcbDH2BsVxaK4t/VO
         oq0w==
X-Gm-Message-State: AOJu0Yz07Uz1fmHJv/bwyA8CNRnFNOjgFIg2Bh6tvZCzMgu9r8bE7Bdd
	ezcwDe0PgH48ytc+gPvdefA=
X-Google-Smtp-Source: AGHT+IHynyQm1EkvDOzEXHBgQqb7+M+tw/igfjpw6D5leCrSmS4SxqtZ6h/hnYIuaA/t0ZriLE7jHw==
X-Received: by 2002:a05:6214:2603:b0:67f:67e4:f289 with SMTP id gu3-20020a056214260300b0067f67e4f289mr5263444qvb.4.1703133937462;
        Wed, 20 Dec 2023 20:45:37 -0800 (PST)
Received: from pek-lpggp6.wrs.com (unknown-105-121.windriver.com. [147.11.105.121])
        by smtp.gmail.com with ESMTPSA id ct15-20020a056214178f00b0067f3f3d8e8asm374459qvb.111.2023.12.20.20.45.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 20:45:36 -0800 (PST)
From: Kevin Hao <haokexin@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 2/3] powerpc: mpc83xx: Use wait_event_freezable() for freezable kthread
Date: Thu, 21 Dec 2023 12:45:09 +0800
Message-Id: <20231221044510.1802429-3-haokexin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231221044510.1802429-1-haokexin@gmail.com>
References: <20231221044510.1802429-1-haokexin@gmail.com>
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Pavel Machek <pavel@ucw.cz>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

A freezable kernel thread can enter frozen state during freezing by
either calling try_to_freeze() or using wait_event_freezable() and its
variants. So for the following snippet of code in a kernel thread loop:
  wait_event_interruptible();
  try_to_freeze();

We can change it to a simple wait_event_freezable() and then eliminate
a function call.

Signed-off-by: Kevin Hao <haokexin@gmail.com>
---
 arch/powerpc/platforms/83xx/suspend.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/83xx/suspend.c b/arch/powerpc/platforms/83xx/suspend.c
index eed325ed08cc..c9664e46b03d 100644
--- a/arch/powerpc/platforms/83xx/suspend.c
+++ b/arch/powerpc/platforms/83xx/suspend.c
@@ -264,8 +264,7 @@ static int agent_thread_fn(void *data)
 	set_freezable();
 
 	while (1) {
-		wait_event_interruptible(agent_wq, pci_pm_state >= 2);
-		try_to_freeze();
+		wait_event_freezable(agent_wq, pci_pm_state >= 2);
 
 		if (signal_pending(current) || pci_pm_state < 2)
 			continue;
-- 
2.39.2

