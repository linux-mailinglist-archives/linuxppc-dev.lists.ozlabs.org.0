Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5527E246031
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 10:32:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BVS2Q2mPzzDqQg
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 18:31:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::442;
 helo=mail-pf1-x442.google.com; envelope-from=allen.lkml@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=sRB8R0mF; dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BVRtN4RQdzDqQR
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Aug 2020 18:25:00 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id k18so7858871pfp.7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Aug 2020 01:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=U6kvtvahmst982l1SHnIdlPVTNs/K0Y5vkr0Zrgcbuc=;
 b=sRB8R0mF9f4I67M2vJjyOzq5HGOLhCwIYyJApLgBpnOvMgv9SObv1CuqoerN2lpagu
 3H1IMXBzE+dZbgcDpqRB7MjwtkDlohqJ/sN4S3D//2oLIMlDg9VLkzVibeyVBjC+ncFi
 pfc9AX7nnkE34sGzhXzgCG036rnkXe9hA721AJ6njKPcXQzgWjwCiwG5UTHheZBPt0Cn
 xFADoAgnj5Rk4CLpl9CXmhZi3LSe+fZIt7wNuX6N0TxPc37aXsRaYUpuDr7/y071m/iI
 i0bBC2JcJiy+5QIpzwI5/1j/Hn+pBqI9lf4HiH+UvSifqCWQWzoGH+00Xy5We5cg91OY
 j6Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=U6kvtvahmst982l1SHnIdlPVTNs/K0Y5vkr0Zrgcbuc=;
 b=MuiEzuczakN2kNavmZbIJZRLYNJF5+tgeqT/roGG02SkO0r7Hkyg94+HzD/2ZZmDTs
 ru0YavSDGBYtfVPG8TY1379QvVRdinIyxNIry0sOB6NZUsn/Po7B+s2QMeK2UJBWnant
 1HPxsOkiZsucwqEnCkpMCVwYUvv3WMAPdeHEcg6b8buJiHDilaUMmHEzeTJvovllHo+S
 QeJ97q/AGTiwXvsQn8EHLgNfaYdS4bxdgN6Dgd5eqdwgG17GWzPJ19bYudGV4TrC+AbO
 cEw4nAEJ5gvmUNqZuE3+/WgHRBNAHf99CWd0iuoz5Af5WZ18A3eDbPndQdiUCmIPVD0H
 57cQ==
X-Gm-Message-State: AOAM532k1hnaIBss09JRu0H7DboGS50e/D5O3fV9+w8V/+OLcxqvBc8V
 wYJ+p6Kl8mydm7GlbuQ3IdE=
X-Google-Smtp-Source: ABdhPJyeeK7R8O+e+zrG4p84BODgyo/hoS+OJR9A7pYB1XGWzEAoUBeuR9leHrthUrODwRqKFFFWTg==
X-Received: by 2002:a65:63ca:: with SMTP id n10mr9480913pgv.252.1597652695193; 
 Mon, 17 Aug 2020 01:24:55 -0700 (PDT)
Received: from localhost.localdomain ([49.207.202.98])
 by smtp.gmail.com with ESMTPSA id r186sm19928482pfr.162.2020.08.17.01.24.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:24:54 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: jes@trained-monkey.org, davem@davemloft.net, kuba@kernel.org,
 kda@linux-powerpc.org, dougmill@linux.ibm.com, cooldavid@cooldavid.org,
 mlindner@marvell.com, borisp@mellanox.com
Subject: [PATCH 01/20] ethernet: alteon: convert tasklets to use new
 tasklet_setup() API
Date: Mon, 17 Aug 2020 13:54:14 +0530
Message-Id: <20200817082434.21176-2-allen.lkml@gmail.com>
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
 drivers/net/ethernet/alteon/acenic.c | 9 +++++----
 drivers/net/ethernet/alteon/acenic.h | 2 +-
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/alteon/acenic.c b/drivers/net/ethernet/alteon/acenic.c
index ac86fcae1582..8a4c2319953d 100644
--- a/drivers/net/ethernet/alteon/acenic.c
+++ b/drivers/net/ethernet/alteon/acenic.c
@@ -1562,10 +1562,11 @@ static void ace_watchdog(struct net_device *data, unsigned int txqueue)
 }
 
 
-static void ace_tasklet(unsigned long arg)
+static void ace_tasklet(struct tasklet_struct *t)
 {
-	struct net_device *dev = (struct net_device *) arg;
-	struct ace_private *ap = netdev_priv(dev);
+	struct ace_private *ap = from_tasklet(ap, t, ace_tasklet);
+	struct net_device *dev = (struct net_device *)((char *)ap -
+				ALIGN(sizeof(struct net_device), NETDEV_ALIGN));
 	int cur_size;
 
 	cur_size = atomic_read(&ap->cur_rx_bufs);
@@ -2269,7 +2270,7 @@ static int ace_open(struct net_device *dev)
 	/*
 	 * Setup the bottom half rx ring refill handler
 	 */
-	tasklet_init(&ap->ace_tasklet, ace_tasklet, (unsigned long)dev);
+	tasklet_setup(&ap->ace_tasklet, ace_tasklet);
 	return 0;
 }
 
diff --git a/drivers/net/ethernet/alteon/acenic.h b/drivers/net/ethernet/alteon/acenic.h
index c670067b1541..4b02c705859c 100644
--- a/drivers/net/ethernet/alteon/acenic.h
+++ b/drivers/net/ethernet/alteon/acenic.h
@@ -776,7 +776,7 @@ static int ace_open(struct net_device *dev);
 static netdev_tx_t ace_start_xmit(struct sk_buff *skb,
 				  struct net_device *dev);
 static int ace_close(struct net_device *dev);
-static void ace_tasklet(unsigned long dev);
+static void ace_tasklet(struct tasklet_struct *t);
 static void ace_dump_trace(struct ace_private *ap);
 static void ace_set_multicast_list(struct net_device *dev);
 static int ace_change_mtu(struct net_device *dev, int new_mtu);
-- 
2.17.1

