Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E752461BA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 11:02:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BVSjp4lhkzDqQD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 19:02:38 +1000 (AEST)
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
 header.s=20161025 header.b=FPU+w3ND; dkim-atps=neutral
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BVRvf5Xx3zDqMF
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Aug 2020 18:26:06 +1000 (AEST)
Received: by mail-pj1-x1044.google.com with SMTP id mw10so7347172pjb.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Aug 2020 01:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=cL9JEmBEHVr7j+h/t21HJyCd1D6huw3HDaRf1+0pC7c=;
 b=FPU+w3NDPol567vC+h/ZbTlRf2kz8vO1fFt9hvJys9Ppxj1YeH8QP1vbGeucslM6P0
 Im1necIo+mxJGaKwhjo+ScTY3KUflAYspI4/wzqj1sWuvWLhM6e9CoyKQjR3vWs1ikX2
 PJ3SFrUqKBN7RrjeFJC5ScMlVN4+/BGn0dqN80T1Cm4XmoQT/wlra+F7rGPNWJAiesRI
 ArrrkVKF8Uu38hcYnKkiFG0HM1hqETjnLfmDrVnENXPGFquqETDot1namxUVLPK7p2Dj
 0l319BCnw7iS/FBOzZeUsQrgv1jRKBX8OLhkOu5HWCW7yfhayCha6zoXqXzv0eMxW7Fo
 m8EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=cL9JEmBEHVr7j+h/t21HJyCd1D6huw3HDaRf1+0pC7c=;
 b=Kv1DRLTSQLW4YzIJH5SfDsF+qHBliBVi5UQi662hfvL0UOCO/jmbR3zYlt+zIBKZ34
 PsKrdjONIUHUluiwvc1RpVw2ikQduFE+UmWKjjfQ5Ap01WFzonhzwWr4DLBPo2fvBbWW
 CayPFgMOS2PB4BUUlNOs2G9Ock1qF8nk6u2VlbQLpVDeAvBi/rbFYaojaTgyx/wcXenW
 A8W/K6vIWLpefB4cHUVSCTWO3oAaNe8aSmzVFsJJChcuMqDgW0l0lw4tgay/q6wIL9HN
 01f0vLJY+gzvu+Wjv1pxZ6qTxVnrHB91zJHQc1p3URSwWzJ95+snlUIZGWNXAjXFjf2D
 Fk3g==
X-Gm-Message-State: AOAM5339ltwgut7YmGuU6YEMzNAuCZddRw10EHsS+EzfEZrlMtCLOoMb
 QKbnxA/lKrTQIf2vxm0OYPQ=
X-Google-Smtp-Source: ABdhPJwIeOMMqSxIZ7onJbrSMiRju8pATc7y+zI7a+Unpdh2nCA4eorIzXR73r8269HMrnvzGnz7Cg==
X-Received: by 2002:a17:90a:8589:: with SMTP id
 m9mr11878650pjn.109.1597652764728; 
 Mon, 17 Aug 2020 01:26:04 -0700 (PDT)
Received: from localhost.localdomain ([49.207.202.98])
 by smtp.gmail.com with ESMTPSA id r186sm19928482pfr.162.2020.08.17.01.25.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:26:04 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: jes@trained-monkey.org, davem@davemloft.net, kuba@kernel.org,
 kda@linux-powerpc.org, dougmill@linux.ibm.com, cooldavid@cooldavid.org,
 mlindner@marvell.com, borisp@mellanox.com
Subject: [PATCH 12/20] ethernet: marvell: convert tasklets to use new
 tasklet_setup() API
Date: Mon, 17 Aug 2020 13:54:26 +0530
Message-Id: <20200817082434.21176-14-allen.lkml@gmail.com>
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
 drivers/net/ethernet/marvell/skge.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/marvell/skge.c b/drivers/net/ethernet/marvell/skge.c
index b792f6306a64..55fe901d3562 100644
--- a/drivers/net/ethernet/marvell/skge.c
+++ b/drivers/net/ethernet/marvell/skge.c
@@ -3338,9 +3338,9 @@ static void skge_error_irq(struct skge_hw *hw)
  * because accessing phy registers requires spin wait which might
  * cause excess interrupt latency.
  */
-static void skge_extirq(unsigned long arg)
+static void skge_extirq(struct tasklet_struct *t)
 {
-	struct skge_hw *hw = (struct skge_hw *) arg;
+	struct skge_hw *hw = from_tasklet(hw, t, phy_task);
 	int port;
 
 	for (port = 0; port < hw->ports; port++) {
@@ -3927,7 +3927,7 @@ static int skge_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	hw->pdev = pdev;
 	spin_lock_init(&hw->hw_lock);
 	spin_lock_init(&hw->phy_lock);
-	tasklet_init(&hw->phy_task, skge_extirq, (unsigned long) hw);
+	tasklet_setup(&hw->phy_task, skge_extirq);
 
 	hw->regs = ioremap(pci_resource_start(pdev, 0), 0x4000);
 	if (!hw->regs) {
-- 
2.17.1

