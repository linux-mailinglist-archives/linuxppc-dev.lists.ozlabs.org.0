Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C6F246232
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 11:12:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BVSxg2BRCzDqSW
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 19:12:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::643;
 helo=mail-pl1-x643.google.com; envelope-from=allen.lkml@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=R1csLVhA; dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BVRw96RjgzDqQX
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Aug 2020 18:26:33 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id s14so1165129plp.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Aug 2020 01:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=sk5rpeS55SBVIoCz+MRV7vl3Lfu/wV4G0MR5a0P4VHA=;
 b=R1csLVhAJxc3yHfRuiOVfIM1K1da22Ewqk4d+S/8PeGJ+32fz7zhRbnJDPHJJDKTdz
 0HXIvVZM3am+i1sKz3hJwGy+Hli5AXl4Fb58zCp5uP0o3pJy80XMhYkUYI8bKRzc0a0o
 x2TKcQ+dmZMMxwrb2J5ATfaA13xUGsPJruvFtyp4VyUwo47tTFqIxVatUxhNaH4YQfv/
 mLR9OJhnOIPZ1lAuRwbu8D8nldBsUf/goYQQw3AvOSROT7WNe/UrLkPwTGNuZWTZULaS
 LEE21diiOErwWO2gIY0BjuOb8+ndEMhUNA/J5gB5GjdJoiJkQeHR/akuo2r5p+ATFRRP
 5D4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=sk5rpeS55SBVIoCz+MRV7vl3Lfu/wV4G0MR5a0P4VHA=;
 b=V1CwCYXj4JJ6KwHA5NL1YE0rv6WP2Hs77HwMPf03fLFzspdFkkbopHN/bw5EYHiGwk
 9PI6LNC069qUGBl1LzOVdFoeMFT+NjXgNdVtbUuHjIuagQ1lTJqJUIvXMDOjMeLLo0J3
 vAFMV3yofTqJ75FMYp3HMixeRj6ijBIgPYuZEWfWL/+AjROloTkRE51Jw0jco5JrKaQg
 A5YXWDjY1OScat0KlNe54Ik5HP0FUpIu+pVd6c7JEw/RQrkC658jzjJ9yXuPChDkbixt
 iI/ziQAuzzCeUPH4aGI1pMLZgt4qEiDmYc54fzF75Yh324w8iKqZ0Z9FF8WtTJD6N7rH
 4AMA==
X-Gm-Message-State: AOAM530nGrejA9iID3w317jR3UhS4/LABrFxC5sXAuAyLC0vxJ+KsQ40
 K6Zsx3NfkjA6/BpjdyHRAEw=
X-Google-Smtp-Source: ABdhPJxel0tdqet5sG9IVVMDhmbxE47JSymBZcwF/5VCrNzd2cjfx/50fzzPWqn2s+vAy5zva75SdQ==
X-Received: by 2002:a17:90b:3197:: with SMTP id
 hc23mr11408391pjb.110.1597652790990; 
 Mon, 17 Aug 2020 01:26:30 -0700 (PDT)
Received: from localhost.localdomain ([49.207.202.98])
 by smtp.gmail.com with ESMTPSA id r186sm19928482pfr.162.2020.08.17.01.26.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:26:30 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: jes@trained-monkey.org, davem@davemloft.net, kuba@kernel.org,
 kda@linux-powerpc.org, dougmill@linux.ibm.com, cooldavid@cooldavid.org,
 mlindner@marvell.com, borisp@mellanox.com
Subject: [PATCH 16/20] ethernet: netronome: convert tasklets to use new
 tasklet_setup() API
Date: Mon, 17 Aug 2020 13:54:30 +0530
Message-Id: <20200817082434.21176-18-allen.lkml@gmail.com>
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
 drivers/net/ethernet/netronome/nfp/nfp_net_common.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/netronome/nfp/nfp_net_common.c b/drivers/net/ethernet/netronome/nfp/nfp_net_common.c
index 39ee23e8c0bf..1dcd24d899f5 100644
--- a/drivers/net/ethernet/netronome/nfp/nfp_net_common.c
+++ b/drivers/net/ethernet/netronome/nfp/nfp_net_common.c
@@ -2287,9 +2287,9 @@ static bool nfp_ctrl_rx(struct nfp_net_r_vector *r_vec)
 	return budget;
 }
 
-static void nfp_ctrl_poll(unsigned long arg)
+static void nfp_ctrl_poll(struct tasklet_struct *t)
 {
-	struct nfp_net_r_vector *r_vec = (void *)arg;
+	struct nfp_net_r_vector *r_vec = from_tasklet(r_vec, t, tasklet);
 
 	spin_lock(&r_vec->lock);
 	nfp_net_tx_complete(r_vec->tx_ring, 0);
@@ -2337,8 +2337,7 @@ static void nfp_net_vecs_init(struct nfp_net *nn)
 
 			__skb_queue_head_init(&r_vec->queue);
 			spin_lock_init(&r_vec->lock);
-			tasklet_init(&r_vec->tasklet, nfp_ctrl_poll,
-				     (unsigned long)r_vec);
+			tasklet_setup(&r_vec->tasklet, nfp_ctrl_poll);
 			tasklet_disable(&r_vec->tasklet);
 		}
 
-- 
2.17.1

