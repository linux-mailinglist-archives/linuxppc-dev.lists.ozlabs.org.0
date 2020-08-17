Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 654DD246162
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 10:53:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BVSWW5jS7zDqMM
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 18:53:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::642;
 helo=mail-pl1-x642.google.com; envelope-from=allen.lkml@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=tSp/51Vb; dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BVRvK4BnMzDqQR
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Aug 2020 18:25:49 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id q19so7149368pll.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Aug 2020 01:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=D/Mkx0k3buW6nMMz3cj3YWbXhyfw6abwbH3pFqES0j8=;
 b=tSp/51VbeSEu3dHGWXjYT/NQzG6Ptsjimy1nJUoATyHiHCcmg9eo9jc9IaiQERQ5Nb
 iJAIIF6kNiA5Kd5aBC89NdU0cLtr7LWwAU+vRwMSSvoATCgF7tWwsvtG0wOy0xB8tR9/
 uOAPcGvqdMIfqbFOiERkTgq5S7X+z4sS3ug7MnwdPATua5rWEURHlk4bziUaJs2Yjlsb
 vWNz9vVRd5LVHKlFP5bfXX+bJKOEIpgIa0s/1Mg//6L3c221wwHGJElufgvzxMAdDM+e
 EvVviBBP45IMyXnW+2hgOqqTLP6sEvrQhnYgq1S+mB1staPKH7MXoRECZYP4+f3temKw
 OJDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=D/Mkx0k3buW6nMMz3cj3YWbXhyfw6abwbH3pFqES0j8=;
 b=ClnlHF3zJFYUTfqj1HA8rZMtqHAtD0MhF21M4sRq43LTlKI+z9tsXsDm2d+boXZJOC
 t//6KXyxWKxhZpkrtEBV6Z6HMr0LMpyqsA4L5pzrFx8dGvVHzG60//v9b0YyTsNzBVrC
 0fWhch/+EwATQBLBlzKTudCLjKs8yYkXPYGuKtLZQveI/jkicTW1F/B4FilE13eASwRS
 I3X3ShUgEQqLSO6uQ259FjB63MM16ZuKH/7gDRaUCNr8WbcqlGh40emecMvXo4PbcPoB
 FFqHocs279N/rVm6wdvsQrC9Q2H4n6xFsRebJU9PUg2P0HQ8hb9L+JV3xriPNvdya6H9
 T7Ww==
X-Gm-Message-State: AOAM532/iHIUQe51Rb47NDHn6iJtm02uMNgaP9XFMcyb0UhHNzct7W6l
 o85RDNLaTggwVSz1/GZKRZA=
X-Google-Smtp-Source: ABdhPJzYryo5CXUtCOTUoLLG1O0Nlya6EIJjoKSX670WNzdCiD+322/w/djTW43/04u8aHuCOv3Ndg==
X-Received: by 2002:a17:90b:3197:: with SMTP id
 hc23mr11406806pjb.110.1597652747547; 
 Mon, 17 Aug 2020 01:25:47 -0700 (PDT)
Received: from localhost.localdomain ([49.207.202.98])
 by smtp.gmail.com with ESMTPSA id r186sm19928482pfr.162.2020.08.17.01.25.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:25:47 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: jes@trained-monkey.org, davem@davemloft.net, kuba@kernel.org,
 kda@linux-powerpc.org, dougmill@linux.ibm.com, cooldavid@cooldavid.org,
 mlindner@marvell.com, borisp@mellanox.com
Subject: [PATCH 09/20] ethernet: ehea: convert tasklets to use new
 tasklet_setup() API
Date: Mon, 17 Aug 2020 13:54:23 +0530
Message-Id: <20200817082434.21176-11-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817082434.21176-1-allen.lkml@gmail.com>
References: <20200817082434.21176-1-allen.lkml@gmail.com>
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
Cc: keescook@chromium.org, linux-rdma@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Allen Pais <allen.lkml@gmail.com>,
 oss-drivers@netronome.com, Romain Perier <romain.perier@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, linux-acenic@sunsite.dk,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In preparation for unconditionally passing the
struct tasklet_struct pointer to all tasklet
callbacks, switch to using the new tasklet_setup()
and from_tasklet() to pass the tasklet pointer explicitly.

Signed-off-by: Romain Perier <romain.perier@gmail.com>
Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/net/ethernet/ibm/ehea/ehea_main.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/ibm/ehea/ehea_main.c b/drivers/net/ethernet/ibm/ehea/ehea_main.c
index 0273fb7a9d01..f3d104fec7e9 100644
--- a/drivers/net/ethernet/ibm/ehea/ehea_main.c
+++ b/drivers/net/ethernet/ibm/ehea/ehea_main.c
@@ -1212,9 +1212,9 @@ static void ehea_parse_eqe(struct ehea_adapter *adapter, u64 eqe)
 	}
 }
 
-static void ehea_neq_tasklet(unsigned long data)
+static void ehea_neq_tasklet(struct tasklet_struct *t)
 {
-	struct ehea_adapter *adapter = (struct ehea_adapter *)data;
+	struct ehea_adapter *adapter = from_tasklet(adapter, t, neq_tasklet);
 	struct ehea_eqe *eqe;
 	u64 event_mask;
 
@@ -3417,8 +3417,7 @@ static int ehea_probe_adapter(struct platform_device *dev)
 		goto out_free_ad;
 	}
 
-	tasklet_init(&adapter->neq_tasklet, ehea_neq_tasklet,
-		     (unsigned long)adapter);
+	tasklet_setup(&adapter->neq_tasklet, ehea_neq_tasklet);
 
 	ret = ehea_create_device_sysfs(dev);
 	if (ret)
-- 
2.17.1

