Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0081E20CD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 May 2020 13:22:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49WWkx1TFxzDqJM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 May 2020 21:22:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.120;
 helo=us-smtp-1.mimecast.com; envelope-from=eesposit@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=KcVQ4Yuc; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=fT5BoLP0; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49WWNJ4MgCzDqDc
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 May 2020 21:05:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590491149;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YL7I5JCIHEnCOMA27cTClA3wSdtYCHTGXJdbbFxfa+8=;
 b=KcVQ4YucOJ/hn9+fckTRNlmlqaq7rLL/kVrwaU8npwTnFRUl56VrLYB2aP9Msp6KCjMs56
 PssSMZVm4PoYpwDBAi5rWnSDDb7JLDcsCZaXMSn1pD4fsEsSxN+1dUDDacKefZErX4lQ9M
 iQm8COlgFIiGKV2G4Dpe+oCBx1JxTJQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590491150;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YL7I5JCIHEnCOMA27cTClA3wSdtYCHTGXJdbbFxfa+8=;
 b=fT5BoLP0+H0GCYPtS6Uujmu9EW+FPDlccbg7tPXWkB/SYDhbcxh79mtqqlaYLkLLjTKtUe
 rhYlIBA/rvgECImK+AGxiikblTpXV1YgtKUidgKZHk2cTS7TybCeru0UB+tQs0776UWFcT
 BpBNVxr9KgPB8fSimCiE1JPR286JKDU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-396-SbEAJ1pXPdSgBmXdYYcSTA-1; Tue, 26 May 2020 07:05:46 -0400
X-MC-Unique: SbEAJ1pXPdSgBmXdYYcSTA-1
Received: by mail-wm1-f72.google.com with SMTP id s15so705850wmc.8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 May 2020 04:05:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YL7I5JCIHEnCOMA27cTClA3wSdtYCHTGXJdbbFxfa+8=;
 b=CJnpBAiGSO8JU1wrSRgjTTgN8pZwyK9FSP81ykZI/k1bZK9hbgECo+9cIF8LxjCTP2
 TexfsQn3WNvKEmk9IFHzk3u5ks7YN9Byg+GJjKNRoVp8hwr8UUAMru/1W5HcE6uIQlpf
 I5yCPyyoWpT3ScJOZ0h5mXxoYaKBXgpsQkhonTnvIRsNI+tPIiJsNVrwBOPlJHzWnzw5
 JGOE/H2WTCSDnIIOuuK3rmClecrVQ2bBwqEIednk2xga8DlG1sXHSbpi9aCL+7fyY7bj
 AxYWFS1S4mNCM5UlCeWF1C/dQTcBjHezu3M0bGUy2AQGg+exC9uQmtNv/LI+iHMdD6nz
 e/aw==
X-Gm-Message-State: AOAM530qM+UPN2d6cEtSKKhsy8PfGOREYqnY3a0LvLgLUa+LdBWj0+M5
 13cKwEcIhBGa7HXsuoKzgy1xXidRHr6sJ9kxJhX8Hzu2/17feArOdulC3jc3REYWTSu4I5sgceK
 n9il16eXFpeSM9PUze8pFb9vfNw==
X-Received: by 2002:a5d:484b:: with SMTP id n11mr18085339wrs.356.1590491145437; 
 Tue, 26 May 2020 04:05:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyo4BV3xWVL52mX4Nu+TG9ys/JSV0Y3savYX2kM7iRzxuz+P1aX7wtkuMtb+MvbeCMZqXp14Q==
X-Received: by 2002:a5d:484b:: with SMTP id n11mr18085316wrs.356.1590491145188; 
 Tue, 26 May 2020 04:05:45 -0700 (PDT)
Received: from localhost.localdomain.com ([194.230.155.118])
 by smtp.gmail.com with ESMTPSA id d6sm22928240wrj.90.2020.05.26.04.05.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2020 04:05:36 -0700 (PDT)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: kvm@vger.kernel.org
Subject: [PATCH v3 7/7] [not for merge] netstats: example use of stats_fs API
Date: Tue, 26 May 2020 13:03:17 +0200
Message-Id: <20200526110318.69006-8-eesposit@redhat.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200526110318.69006-1-eesposit@redhat.com>
References: <20200526110318.69006-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
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
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 linux-s390@vger.kernel.org, linux-doc@vger.kernel.org, netdev@vger.kernel.org,
 Emanuele Giuseppe Esposito <e.emanuelegiuseppe@gmail.com>,
 linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org,
 Jonathan Adams <jwadams@google.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, David Rientjes <rientjes@google.com>,
 linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, Jim Mattson <jmattson@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Apply stats_fs on the networking statistics subsystem.

Currently it only works with disabled network namespace
(CONFIG_NET_NS=n), because multiple namespaces will have the same
device name under the same root source that will cause a conflict in
stats_fs.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 include/linux/netdevice.h |  2 ++
 net/Kconfig               |  1 +
 net/core/dev.c            | 66 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 69 insertions(+)

diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index 130a668049ab..408c4e7b0e21 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -48,6 +48,7 @@
 #include <uapi/linux/if_bonding.h>
 #include <uapi/linux/pkt_cls.h>
 #include <linux/hashtable.h>
+#include <linux/stats_fs.h>
 
 struct netpoll_info;
 struct device;
@@ -2117,6 +2118,7 @@ struct net_device {
 	unsigned		wol_enabled:1;
 
 	struct list_head	net_notifier_list;
+	struct stats_fs_source	*stats_fs_src;
 
 #if IS_ENABLED(CONFIG_MACSEC)
 	/* MACsec management functions */
diff --git a/net/Kconfig b/net/Kconfig
index df8d8c9bd021..3441d5bb6107 100644
--- a/net/Kconfig
+++ b/net/Kconfig
@@ -8,6 +8,7 @@ menuconfig NET
 	select NLATTR
 	select GENERIC_NET_UTILS
 	select BPF
+	select STATS_FS_API
 	---help---
 	  Unless you really know what you are doing, you should say Y here.
 	  The reason is that some programs need kernel networking support even
diff --git a/net/core/dev.c b/net/core/dev.c
index 522288177bbd..3db48cd1a097 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -142,6 +142,7 @@
 #include <linux/net_namespace.h>
 #include <linux/indirect_call_wrapper.h>
 #include <net/devlink.h>
+#include <linux/stats_fs.h>
 
 #include "net-sysfs.h"
 
@@ -150,6 +151,11 @@
 /* This should be increased if a protocol with a bigger head is added. */
 #define GRO_MAX_HEAD (MAX_HEADER + 128)
 
+#define NETDEV_STAT(str, m, ...)						\
+	{ str, offsetof(struct rtnl_link_stats64, m),				\
+	  &stats_fs_type_netdev_u64,						\
+	  STATS_FS_SUM, ## __VA_ARGS__ }
+
 static DEFINE_SPINLOCK(ptype_lock);
 static DEFINE_SPINLOCK(offload_lock);
 struct list_head ptype_base[PTYPE_HASH_SIZE] __read_mostly;
@@ -196,6 +202,53 @@ static DEFINE_READ_MOSTLY_HASHTABLE(napi_hash, 8);
 
 static seqcount_t devnet_rename_seq;
 
+static uint64_t stats_fs_get_netdev_u64(struct stats_fs_value *val,
+					void *base)
+{
+	struct net_device *netdev = (struct net_device *)base;
+	struct rtnl_link_stats64 net_stats;
+
+	dev_get_stats(netdev, &net_stats);
+
+	return stats_fs_get_u64(val, &net_stats);
+}
+
+static struct stats_fs_type stats_fs_type_netdev_u64 = {
+	.get = stats_fs_get_netdev_u64,
+	.clear = NULL,
+	.sign = false
+};
+
+static struct stats_fs_source *netdev_root;
+
+static struct stats_fs_value stats_fs_netdev_entries[] = {
+	NETDEV_STAT("rx_packets", rx_packets),
+	NETDEV_STAT("tx_packets", tx_packets),
+	NETDEV_STAT("rx_bytes", rx_bytes),
+	NETDEV_STAT("tx_bytes", tx_bytes),
+	NETDEV_STAT("rx_errors", rx_errors),
+	NETDEV_STAT("tx_errors", tx_errors),
+	NETDEV_STAT("rx_dropped", rx_dropped),
+	NETDEV_STAT("tx_dropped", tx_dropped),
+	NETDEV_STAT("multicast", multicast),
+	NETDEV_STAT("collisions", collisions),
+	NETDEV_STAT("rx_length_errors", rx_length_errors),
+	NETDEV_STAT("rx_over_errors", rx_over_errors),
+	NETDEV_STAT("rx_crc_errors", rx_crc_errors),
+	NETDEV_STAT("rx_frame_errors", rx_frame_errors),
+	NETDEV_STAT("rx_fifo_errors", rx_fifo_errors),
+	NETDEV_STAT("rx_missed_errors", rx_missed_errors),
+	NETDEV_STAT("tx_aborted_errors", tx_aborted_errors),
+	NETDEV_STAT("tx_carrier_errors", tx_carrier_errors),
+	NETDEV_STAT("tx_fifo_errors", tx_fifo_errors),
+	NETDEV_STAT("tx_heartbeat_errors", tx_heartbeat_errors),
+	NETDEV_STAT("tx_window_errors", tx_window_errors),
+	NETDEV_STAT("rx_compressed", rx_compressed),
+	NETDEV_STAT("tx_compressed", tx_compressed),
+	NETDEV_STAT("rx_nohandler", rx_nohandler),
+	{ NULL }
+};
+
 static inline void dev_base_seq_inc(struct net *net)
 {
 	while (++net->dev_base_seq == 0)
@@ -8783,6 +8836,11 @@ static void rollback_registered_many(struct list_head *head)
 	ASSERT_RTNL();
 
 	list_for_each_entry_safe(dev, tmp, head, unreg_list) {
+		stats_fs_source_remove_subordinate(netdev_root,
+						   dev->stats_fs_src);
+		stats_fs_source_revoke(dev->stats_fs_src);
+		stats_fs_source_put(dev->stats_fs_src);
+
 		/* Some devices call without registering
 		 * for initialization unwind. Remove those
 		 * devices and proceed with the remaining.
@@ -9436,6 +9494,11 @@ int register_netdevice(struct net_device *dev)
 	    dev->rtnl_link_state == RTNL_LINK_INITIALIZED)
 		rtmsg_ifinfo(RTM_NEWLINK, dev, ~0U, GFP_KERNEL);
 
+	dev->stats_fs_src = stats_fs_source_create(0, dev->name);
+	stats_fs_source_add_subordinate(netdev_root, dev->stats_fs_src);
+	stats_fs_source_add_values(dev->stats_fs_src, stats_fs_netdev_entries,
+				   dev, 0);
+
 out:
 	return ret;
 
@@ -10500,6 +10563,9 @@ static int __init net_dev_init(void)
 	if (netdev_kobject_init())
 		goto out;
 
+	netdev_root = stats_fs_source_create(0, "net");
+	stats_fs_source_register(netdev_root);
+
 	INIT_LIST_HEAD(&ptype_all);
 	for (i = 0; i < PTYPE_HASH_SIZE; i++)
 		INIT_LIST_HEAD(&ptype_base[i]);
-- 
2.25.4

