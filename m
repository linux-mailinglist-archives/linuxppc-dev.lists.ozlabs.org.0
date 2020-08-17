Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 23485246121
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 10:50:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BVSRd4HtwzDqMk
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 18:50:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1044;
 helo=mail-pj1-x1044.google.com; envelope-from=allen.lkml@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=InxMEUwY; dkim-atps=neutral
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BVRvF2X04zDqBX
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Aug 2020 18:25:45 +1000 (AEST)
Received: by mail-pj1-x1044.google.com with SMTP id l60so7452685pjb.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Aug 2020 01:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=39RvJQz8ipypvoPM9UBQxK34sqwXBw2fpRHeH1750N4=;
 b=InxMEUwYzhx+GnG4B1eM3y4duNRfyx1CZB/Ws7HUtFocxH7jTVin6brUpn0347NKxY
 G2vDtc6Jn/U+dIZO/rs8meMl8+D5kFk0pTu+Kq8iKPzEQX6z2YVKdlxtJGEdNAEfX4gs
 HzG5sxEy9yHpH9i/XYP/zjlfTFVttJpEeuCBLjoMmzrtbLpjW8/3H8wGNJLZJLWaX2ZL
 GRS+u1RdIHn/f/qA2wjdhyEjO3m2RbZX3lxe9fGOEVpBO6OpU5T6MjohvX+6vnKmyZwA
 CV1bKneiCat0Wl7RPi6Q7NLdBUFgwZJupvGI6vmFPrpDARH658prdsAMmX5pzSXVradm
 FHVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=39RvJQz8ipypvoPM9UBQxK34sqwXBw2fpRHeH1750N4=;
 b=gjKzk+6c3+Kc4wAxjcPjkjNySq5fqPsB4+B5JG9GyrMKKxWtIUzT82CE/rLBoovmco
 IkDh2nGTxigE4MKKxJvZfFzwh0hFcvOTwfjBIuF8sU2Ed86TWLNA+MSrSs9KomXkHLXJ
 LGO14pc4iVo2EYshYy9K9k+tgFxEhwrzvz6wf9+gVKNnt3rffZ7BB5s8VwSAOGPOm+XR
 ip5TtMtJ6ImCrWcFZXS33YcUzWFUKW+CeRmvGcdh/l1WM0JUcKLWY8dZw1HF6gg7vV5p
 /fkhr+7ICvUZZOH+PXqiocL+/bABmwgWb42Y1Ob5L+wIm5c2OPlCyrczJdaA2La/VK5C
 Ot3w==
X-Gm-Message-State: AOAM530HekeAQzkKQQmoHjuFcv6gvZyO5fZE+ih+rfeHmCUQlEejwSzZ
 coQCtyze9UKa6VelMg1dxH8=
X-Google-Smtp-Source: ABdhPJwv5/9VRVYulpBw4/bIATV1JwJ7vrwdzGannOz/rXuZqIamAy8BJXZR+zXTAlce5mRSmFRAtg==
X-Received: by 2002:a17:90b:100e:: with SMTP id
 gm14mr11408110pjb.39.1597652741860; 
 Mon, 17 Aug 2020 01:25:41 -0700 (PDT)
Received: from localhost.localdomain ([49.207.202.98])
 by smtp.gmail.com with ESMTPSA id r186sm19928482pfr.162.2020.08.17.01.25.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:25:41 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: jes@trained-monkey.org, davem@davemloft.net, kuba@kernel.org,
 kda@linux-powerpc.org, dougmill@linux.ibm.com, cooldavid@cooldavid.org,
 mlindner@marvell.com, borisp@mellanox.com
Subject: [PATCH 08/20] ethernet: hinic: convert tasklets to use new
 tasklet_setup() API
Date: Mon, 17 Aug 2020 13:54:22 +0530
Message-Id: <20200817082434.21176-10-allen.lkml@gmail.com>
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
 drivers/net/ethernet/huawei/hinic/hinic_hw_eqs.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/huawei/hinic/hinic_hw_eqs.c b/drivers/net/ethernet/huawei/hinic/hinic_hw_eqs.c
index ca8cb68a8d20..f304a5b16d75 100644
--- a/drivers/net/ethernet/huawei/hinic/hinic_hw_eqs.c
+++ b/drivers/net/ethernet/huawei/hinic/hinic_hw_eqs.c
@@ -370,9 +370,9 @@ static void eq_irq_work(struct work_struct *work)
  * ceq_tasklet - the tasklet of the EQ that received the event
  * @ceq_data: the eq
  **/
-static void ceq_tasklet(unsigned long ceq_data)
+static void ceq_tasklet(struct tasklet_struct *t)
 {
-	struct hinic_eq *ceq = (struct hinic_eq *)ceq_data;
+	struct hinic_eq *ceq = from_tasklet(ceq, t, ceq_tasklet);
 
 	eq_irq_handler(ceq);
 }
@@ -782,8 +782,7 @@ static int init_eq(struct hinic_eq *eq, struct hinic_hwif *hwif,
 
 		INIT_WORK(&aeq_work->work, eq_irq_work);
 	} else if (type == HINIC_CEQ) {
-		tasklet_init(&eq->ceq_tasklet, ceq_tasklet,
-			     (unsigned long)eq);
+		tasklet_setup(&eq->ceq_tasklet, ceq_tasklet);
 	}
 
 	/* set the attributes of the msix entry */
-- 
2.17.1

