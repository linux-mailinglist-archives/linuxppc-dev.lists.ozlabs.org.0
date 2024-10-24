Return-Path: <linuxppc-dev+bounces-2555-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A1C9AF41C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Oct 2024 22:53:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XZJ5s52jjz3bZs;
	Fri, 25 Oct 2024 07:53:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::c2d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729803185;
	cv=none; b=F62qcZ5jSGwme22y+RPQ9S6Xyp/qDww3CbrgyrCB5717xsMB0UmovLMgz4KSemFIVRk1ZBpaDWclKpPgjiKXv8xcxQIabutihtxYIhiTB2b056Od3rT91+8PQ9Kx/zQCtkzkDuU1s+ybPa3xG3bCWeMM6bd6LIIiq8bqd5YPoNBiRkreMOnPw5f4eltZl2+U47qvzIq62wpqCzMfaENsNkMIbqg9ZN47Zeh5Cmn65t4CbQwZv9oOz8dTSzezI1Er1H1RBsvZa4fylGHMLt5QBr4+j5JkQgC2CcVhN32in0QH8vmA3GHe+TTVME04mAh/ykCTjVLb+KGupf/F2F3Hgg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729803185; c=relaxed/relaxed;
	bh=hY+ADBkdKrw8rogh6XPTp8lQ9D2YsO/t/WvfK9oXDeM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BgxN1Cs5l8bnzL7J2x1j6mS6VVarxCxZxVCzPEkxdiDbCN0qtR66HNLokkEg1pWTyhCJ2miK0gStvndG/Rga51KLiVVYczuusWUaNY079PBG5yjlvLzbvWi377LcYx8cbkKUftFS79BdZjSJ3j/sCH6cPNQd/2S5gWeESPxOCVvt4OU283qLOucf/r5sZ4ATSOcNurz7ays8hEn6Gj9U7bmxt8xFb9pWkHDpt/p4XamVh91ohAFXTnV+cJ3MWR7UkKhGajnmf4YmaTjRocbd7nOYwLTaBPy7GD1087p/4YglDMydQ3sJVSLVNodZvdRgP70U9VZZXWdZKYlTiD/t6A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ToWaQZTs; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::c2d; helo=mail-oo1-xc2d.google.com; envelope-from=rosenp@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ToWaQZTs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c2d; helo=mail-oo1-xc2d.google.com; envelope-from=rosenp@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com [IPv6:2607:f8b0:4864:20::c2d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XZJ5q6BvDz30Ns
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2024 07:53:03 +1100 (AEDT)
Received: by mail-oo1-xc2d.google.com with SMTP id 006d021491bc7-5ebbed44918so949014eaf.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Oct 2024 13:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729803180; x=1730407980; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hY+ADBkdKrw8rogh6XPTp8lQ9D2YsO/t/WvfK9oXDeM=;
        b=ToWaQZTsgl2uvvPXKsb2Fn0/ETHG83z3kjUQBMhE79crUac0oWdfc0zB+VpO0/ZC7Y
         t4PfyxgJkaW+1jQHsYllKT+OkKaVreU5X7srJWvU/0T+BQyE+/QBxCclrK3ywLmzVmLY
         a63LbpO2ie6N3r+OALB9Fm3+jc+dDwufDFNOOsqeRWKPS+5uJzss6QFn9RNkoejYd9ch
         3o6lukULAvZxAlAowhEqWsLlxDeO2DBuBAoBYE6xg5xrzbVYvxSVDMA3KYOOeG+zBfGz
         69q6SnWpnuX+RUpB57IsBNnUmE07YpPjyoE/JDqt7GsKG7orP+ysaJIiWzzbOGuAO0vT
         QWjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729803180; x=1730407980;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hY+ADBkdKrw8rogh6XPTp8lQ9D2YsO/t/WvfK9oXDeM=;
        b=GeuOL2QkzsetXiOKK69TXL4Wu86LFdL/bjD4MUdhnNRERHMc6Sa4UGljf/WpLqr38z
         J+Vt4ewK4CLqgYWSzaf7N6WDDba6MDAviD/YtZda0igko9fe8RrxkzFqt3lyH8h5oNl1
         M8NcYpZkVJJkjXspQg2RjnzTXDtbv7djSgNUUgPI9cJhpN+b8vYKD9LSTW6dyP2Q69O+
         OaFPl4Z9u4RVNtxoGRv85xQg4I8zm0UZofuZQPLy8WFEuWVxb4ZdouJ6it/mb8t2/fK3
         trBdd6ZFraHf3u09APMxdN9DXg/m5o0IhOHq6PKlqUGqYBOwTfO2R/l+NyVqlcvY7eer
         h+Zw==
X-Forwarded-Encrypted: i=1; AJvYcCV/t/12TsyRS3pVeDgWoaxCbNrLhPpI2dvCyV+cRWcr258mGK1bA3nginMB/5Qukv/tpl6sdL7ac3Gw5N4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzEtBBTObzJZe+N4c/Mxi93WfeRlbjsMk9Zin9hbCLABhR1xhh1
	3ZmmaXEif+kjzFWAWCxsyy1KlS5KQfR6UrKXTKEFdeHiKUpIxrWc
X-Google-Smtp-Source: AGHT+IHdMbp3i3HbP3R3LasrH5g+p6K06Cq3lshvlhP40J7GZunkcV9Vn+vdpgz8CCfHJO5fbN/vXA==
X-Received: by 2002:a05:6870:470a:b0:284:ff51:58ad with SMTP id 586e51a60fabf-28ccb52d823mr7353934fac.27.1729803180165;
        Thu, 24 Oct 2024 13:53:00 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8200:dab8::a86])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7eaeab1dc5esm9132231a12.25.2024.10.24.13.52.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 13:52:59 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: netdev@vger.kernel.org
Cc: Madalin Bucur <madalin.bucur@nxp.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Rosen Penev <rosenp@gmail.com>,
	linux-kernel@vger.kernel.org (open list),
	linuxppc-dev@lists.ozlabs.org (open list:FREESCALE QUICC ENGINE UCC ETHERNET DRIVER)
Subject: [PATCH net-next] net: freescale: use ethtool string helpers
Date: Thu, 24 Oct 2024 13:52:57 -0700
Message-ID: <20241024205257.574836-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.47.0
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
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The latter is the preferred way to copy ethtool strings.

Avoids manually incrementing the pointer. Cleans up the code quite well.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../ethernet/freescale/dpaa/dpaa_ethtool.c    | 40 ++++++-------------
 .../ethernet/freescale/dpaa2/dpaa2-ethtool.c  | 15 +++----
 .../net/ethernet/freescale/dpaa2/dpaa2-mac.c  |  7 +---
 .../freescale/dpaa2/dpaa2-switch-ethtool.c    |  9 ++---
 .../ethernet/freescale/enetc/enetc_ethtool.c  | 35 +++++-----------
 .../net/ethernet/freescale/gianfar_ethtool.c  |  8 ++--
 .../net/ethernet/freescale/ucc_geth_ethtool.c | 21 +++++-----
 7 files changed, 49 insertions(+), 86 deletions(-)

diff --git a/drivers/net/ethernet/freescale/dpaa/dpaa_ethtool.c b/drivers/net/ethernet/freescale/dpaa/dpaa_ethtool.c
index b0060cf96090..10c5fa4d23d2 100644
--- a/drivers/net/ethernet/freescale/dpaa/dpaa_ethtool.c
+++ b/drivers/net/ethernet/freescale/dpaa/dpaa_ethtool.c
@@ -243,38 +243,24 @@ static void dpaa_get_ethtool_stats(struct net_device *net_dev,
 static void dpaa_get_strings(struct net_device *net_dev, u32 stringset,
 			     u8 *data)
 {
-	unsigned int i, j, num_cpus, size;
-	char string_cpu[ETH_GSTRING_LEN];
-	u8 *strings;
+	unsigned int i, j, num_cpus;
 
-	memset(string_cpu, 0, sizeof(string_cpu));
-	strings   = data;
-	num_cpus  = num_online_cpus();
-	size      = DPAA_STATS_GLOBAL_LEN * ETH_GSTRING_LEN;
+	num_cpus = num_online_cpus();
 
 	for (i = 0; i < DPAA_STATS_PERCPU_LEN; i++) {
-		for (j = 0; j < num_cpus; j++) {
-			snprintf(string_cpu, ETH_GSTRING_LEN, "%s [CPU %d]",
-				 dpaa_stats_percpu[i], j);
-			memcpy(strings, string_cpu, ETH_GSTRING_LEN);
-			strings += ETH_GSTRING_LEN;
-		}
-		snprintf(string_cpu, ETH_GSTRING_LEN, "%s [TOTAL]",
-			 dpaa_stats_percpu[i]);
-		memcpy(strings, string_cpu, ETH_GSTRING_LEN);
-		strings += ETH_GSTRING_LEN;
-	}
-	for (j = 0; j < num_cpus; j++) {
-		snprintf(string_cpu, ETH_GSTRING_LEN,
-			 "bpool [CPU %d]", j);
-		memcpy(strings, string_cpu, ETH_GSTRING_LEN);
-		strings += ETH_GSTRING_LEN;
+		for (j = 0; j < num_cpus; j++)
+			ethtool_sprintf(&data, "%s [CPU %d]",
+					dpaa_stats_percpu[i], j);
+
+		ethtool_sprintf(&data, "%s [TOTAL]", dpaa_stats_percpu[i]);
 	}
-	snprintf(string_cpu, ETH_GSTRING_LEN, "bpool [TOTAL]");
-	memcpy(strings, string_cpu, ETH_GSTRING_LEN);
-	strings += ETH_GSTRING_LEN;
+	for (i = 0; j < num_cpus; i++)
+		ethtool_sprintf(&data, "bpool [CPU %d]", i);
+
+	ethtool_puts(&data, "bpool [TOTAL]");
 
-	memcpy(strings, dpaa_stats_global, size);
+	for (i = 0; i < DPAA_STATS_GLOBAL_LEN; i++)
+		ethtool_puts(&data, dpaa_stats_global[i]);
 }
 
 static int dpaa_get_hash_opts(struct net_device *dev,
diff --git a/drivers/net/ethernet/freescale/dpaa2/dpaa2-ethtool.c b/drivers/net/ethernet/freescale/dpaa2/dpaa2-ethtool.c
index 7f476519b7ad..fd05dd12f107 100644
--- a/drivers/net/ethernet/freescale/dpaa2/dpaa2-ethtool.c
+++ b/drivers/net/ethernet/freescale/dpaa2/dpaa2-ethtool.c
@@ -217,20 +217,15 @@ static int dpaa2_eth_set_pauseparam(struct net_device *net_dev,
 static void dpaa2_eth_get_strings(struct net_device *netdev, u32 stringset,
 				  u8 *data)
 {
-	u8 *p = data;
 	int i;
 
 	switch (stringset) {
 	case ETH_SS_STATS:
-		for (i = 0; i < DPAA2_ETH_NUM_STATS; i++) {
-			strscpy(p, dpaa2_ethtool_stats[i], ETH_GSTRING_LEN);
-			p += ETH_GSTRING_LEN;
-		}
-		for (i = 0; i < DPAA2_ETH_NUM_EXTRA_STATS; i++) {
-			strscpy(p, dpaa2_ethtool_extras[i], ETH_GSTRING_LEN);
-			p += ETH_GSTRING_LEN;
-		}
-		dpaa2_mac_get_strings(p);
+		for (i = 0; i < DPAA2_ETH_NUM_STATS; i++)
+			ethtool_puts(&data, dpaa2_ethtool_stats[i]);
+		for (i = 0; i < DPAA2_ETH_NUM_EXTRA_STATS; i++)
+			ethtool_puts(&data, dpaa2_ethtool_extras[i]);
+		dpaa2_mac_get_strings(data);
 		break;
 	}
 }
diff --git a/drivers/net/ethernet/freescale/dpaa2/dpaa2-mac.c b/drivers/net/ethernet/freescale/dpaa2/dpaa2-mac.c
index a69bb22c37ea..892ed2f91084 100644
--- a/drivers/net/ethernet/freescale/dpaa2/dpaa2-mac.c
+++ b/drivers/net/ethernet/freescale/dpaa2/dpaa2-mac.c
@@ -560,13 +560,10 @@ int dpaa2_mac_get_sset_count(void)
 
 void dpaa2_mac_get_strings(u8 *data)
 {
-	u8 *p = data;
 	int i;
 
-	for (i = 0; i < DPAA2_MAC_NUM_STATS; i++) {
-		strscpy(p, dpaa2_mac_ethtool_stats[i], ETH_GSTRING_LEN);
-		p += ETH_GSTRING_LEN;
-	}
+	for (i = 0; i < DPAA2_MAC_NUM_STATS; i++)
+		ethtool_puts(&data, dpaa2_mac_ethtool_stats[i]);
 }
 
 void dpaa2_mac_get_ethtool_stats(struct dpaa2_mac *mac, u64 *data)
diff --git a/drivers/net/ethernet/freescale/dpaa2/dpaa2-switch-ethtool.c b/drivers/net/ethernet/freescale/dpaa2/dpaa2-switch-ethtool.c
index 6bc1988be311..cdcf03c8c552 100644
--- a/drivers/net/ethernet/freescale/dpaa2/dpaa2-switch-ethtool.c
+++ b/drivers/net/ethernet/freescale/dpaa2/dpaa2-switch-ethtool.c
@@ -170,17 +170,16 @@ dpaa2_switch_ethtool_get_sset_count(struct net_device *netdev, int sset)
 static void dpaa2_switch_ethtool_get_strings(struct net_device *netdev,
 					     u32 stringset, u8 *data)
 {
-	u8 *p = data;
+	const char *str;
 	int i;
 
 	switch (stringset) {
 	case ETH_SS_STATS:
 		for (i = 0; i < DPAA2_SWITCH_NUM_COUNTERS; i++) {
-			memcpy(p, dpaa2_switch_ethtool_counters[i].name,
-			       ETH_GSTRING_LEN);
-			p += ETH_GSTRING_LEN;
+			str = dpaa2_switch_ethtool_counters[i].name;
+			ethtool_puts(&data, str);
 		}
-		dpaa2_mac_get_strings(p);
+		dpaa2_mac_get_strings(data);
 		break;
 	}
 }
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_ethtool.c b/drivers/net/ethernet/freescale/enetc/enetc_ethtool.c
index 2563eb8ac7b6..e1745b89362d 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_ethtool.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_ethtool.c
@@ -247,38 +247,25 @@ static int enetc_get_sset_count(struct net_device *ndev, int sset)
 static void enetc_get_strings(struct net_device *ndev, u32 stringset, u8 *data)
 {
 	struct enetc_ndev_priv *priv = netdev_priv(ndev);
-	u8 *p = data;
 	int i, j;
 
 	switch (stringset) {
 	case ETH_SS_STATS:
-		for (i = 0; i < ARRAY_SIZE(enetc_si_counters); i++) {
-			strscpy(p, enetc_si_counters[i].name, ETH_GSTRING_LEN);
-			p += ETH_GSTRING_LEN;
-		}
-		for (i = 0; i < priv->num_tx_rings; i++) {
-			for (j = 0; j < ARRAY_SIZE(tx_ring_stats); j++) {
-				snprintf(p, ETH_GSTRING_LEN, tx_ring_stats[j],
-					 i);
-				p += ETH_GSTRING_LEN;
-			}
-		}
-		for (i = 0; i < priv->num_rx_rings; i++) {
-			for (j = 0; j < ARRAY_SIZE(rx_ring_stats); j++) {
-				snprintf(p, ETH_GSTRING_LEN, rx_ring_stats[j],
-					 i);
-				p += ETH_GSTRING_LEN;
-			}
-		}
+		for (i = 0; i < ARRAY_SIZE(enetc_si_counters); i++)
+			ethtool_puts(&data, enetc_si_counters[i].name);
+		for (i = 0; i < priv->num_tx_rings; i++)
+			for (j = 0; j < ARRAY_SIZE(tx_ring_stats); j++)
+				ethtool_sprintf(&data, tx_ring_stats[j], i);
+		for (i = 0; i < priv->num_rx_rings; i++)
+			for (j = 0; j < ARRAY_SIZE(rx_ring_stats); j++)
+				ethtool_sprintf(&data, rx_ring_stats[j], i);
 
 		if (!enetc_si_is_pf(priv->si))
 			break;
 
-		for (i = 0; i < ARRAY_SIZE(enetc_port_counters); i++) {
-			strscpy(p, enetc_port_counters[i].name,
-				ETH_GSTRING_LEN);
-			p += ETH_GSTRING_LEN;
-		}
+		for (i = 0; i < ARRAY_SIZE(enetc_port_counters); i++)
+			ethtool_puts(&data, enetc_port_counters[i].name);
+
 		break;
 	}
 }
diff --git a/drivers/net/ethernet/freescale/gianfar_ethtool.c b/drivers/net/ethernet/freescale/gianfar_ethtool.c
index a99b95c4bcfb..781d92e703cb 100644
--- a/drivers/net/ethernet/freescale/gianfar_ethtool.c
+++ b/drivers/net/ethernet/freescale/gianfar_ethtool.c
@@ -115,12 +115,14 @@ static const char stat_gstrings[][ETH_GSTRING_LEN] = {
 static void gfar_gstrings(struct net_device *dev, u32 stringset, u8 * buf)
 {
 	struct gfar_private *priv = netdev_priv(dev);
+	int i;
 
 	if (priv->device_flags & FSL_GIANFAR_DEV_HAS_RMON)
-		memcpy(buf, stat_gstrings, GFAR_STATS_LEN * ETH_GSTRING_LEN);
+		for (i = 0; i < GFAR_STATS_LEN; i++)
+			ethtool_puts(&buf, stat_gstrings[i]);
 	else
-		memcpy(buf, stat_gstrings,
-		       GFAR_EXTRA_STATS_LEN * ETH_GSTRING_LEN);
+		for (i = 0; i < GFAR_EXTRA_STATS_LEN; i++)
+			ethtool_puts(&buf, stat_gstrings[i]);
 }
 
 /* Fill in an array of 64-bit statistics from various sources.
diff --git a/drivers/net/ethernet/freescale/ucc_geth_ethtool.c b/drivers/net/ethernet/freescale/ucc_geth_ethtool.c
index 601beb93d3b3..699f346faf5c 100644
--- a/drivers/net/ethernet/freescale/ucc_geth_ethtool.c
+++ b/drivers/net/ethernet/freescale/ucc_geth_ethtool.c
@@ -287,20 +287,17 @@ static void uec_get_strings(struct net_device *netdev, u32 stringset, u8 *buf)
 {
 	struct ucc_geth_private *ugeth = netdev_priv(netdev);
 	u32 stats_mode = ugeth->ug_info->statisticsMode;
+	int i;
 
-	if (stats_mode & UCC_GETH_STATISTICS_GATHERING_MODE_HARDWARE) {
-		memcpy(buf, hw_stat_gstrings, UEC_HW_STATS_LEN *
-			       	ETH_GSTRING_LEN);
-		buf += UEC_HW_STATS_LEN * ETH_GSTRING_LEN;
-	}
-	if (stats_mode & UCC_GETH_STATISTICS_GATHERING_MODE_FIRMWARE_TX) {
-		memcpy(buf, tx_fw_stat_gstrings, UEC_TX_FW_STATS_LEN *
-			       	ETH_GSTRING_LEN);
-		buf += UEC_TX_FW_STATS_LEN * ETH_GSTRING_LEN;
-	}
+	if (stats_mode & UCC_GETH_STATISTICS_GATHERING_MODE_HARDWARE)
+		for (i = 0; i < UEC_HW_STATS_LEN; i++)
+			ethtool_puts(&buf, hw_stat_gstrings[i]);
+	if (stats_mode & UCC_GETH_STATISTICS_GATHERING_MODE_FIRMWARE_TX)
+		for (i = 0; i < UEC_TX_FW_STATS_LEN; i++)
+			ethtool_puts(&buf, tx_fw_stat_gstrings[i]);
 	if (stats_mode & UCC_GETH_STATISTICS_GATHERING_MODE_FIRMWARE_RX)
-		memcpy(buf, rx_fw_stat_gstrings, UEC_RX_FW_STATS_LEN *
-			       	ETH_GSTRING_LEN);
+		for (i = 0; i < UEC_RX_FW_STATS_LEN; i++)
+			ethtool_puts(&buf, rx_fw_stat_gstrings[i]);
 }
 
 static void uec_get_ethtool_stats(struct net_device *netdev,
-- 
2.47.0


