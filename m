Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C6F2F864E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jan 2021 21:13:03 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DHXRc0kVQzDvYr
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Jan 2021 07:13:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::32e;
 helo=mail-wm1-x32e.google.com; envelope-from=lee.jones@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=pZsRMv5b; dkim-atps=neutral
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DHXMV2Y53zDvXG
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Jan 2021 07:09:26 +1100 (AEDT)
Received: by mail-wm1-x32e.google.com with SMTP id 190so8483854wmz.0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Jan 2021 12:09:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yDzb65IKn3nwovbfX3R0K/7WXOxWh6GWTqzLuh+BAmI=;
 b=pZsRMv5bhHtvqYJamsuJ75nikyt6zcEJQlYa5vQNiBCiISvirtV/ccexo7zQxCL1hu
 FyMdw6tJFzSL+XN4ohF9JDJi5bNXyHBfqEqyKGKVtQFvIof1HSwxObDjQ06yYJD+Ny56
 MKCOrA9dCzWddMH10Sre5X+JgsGLmIc++r0XDgmiQQ/UVjhhhmCg2myrmmjsK0CckMSX
 aKr2n65VSUKW1Facr/jNVjR4IeSnYHdw2rTWy//Bt6I1nB7nbCnmxCW/lkikEvkBxrgY
 MzhZpHTN2iXSiKX9uLQIRu6p2MsCvQzueB4ji7GPjK5Z4qOIpiZbDuW1S0rybK4pqPFZ
 o0aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yDzb65IKn3nwovbfX3R0K/7WXOxWh6GWTqzLuh+BAmI=;
 b=AEPitCnkqZf9H71j/p8HAb6KM/bqZLWCNsrHLRc1ShiWaWm2EQPnZijM6cIrz/fnV7
 L9KHDFQLoW3pOPKCNoeYLXKUWEtTxi2Btuz9dkAdvn4dVVTo+a1ejERaYtddmV/gm6+H
 fu344Md3sZe6wevlDiltMOR8MCF3IJEAr8dCloI5h0nJ0GJiiWrZ2rWnXidUOTXQEbX5
 hbh+ZnSnre1YTm6uTvf40tsn3w7edWXsuKT4UStJpEdlsT2dEHuMjjGX1tsv+jdUvYss
 ztFFbIz9bZJDZitluKlXhNVgk6WXvARZbnGjnEiNk9NdmfwBdTzrwXQjyOU4oYjWaHEl
 AIsQ==
X-Gm-Message-State: AOAM531zmcAoMy11lLfyRxvFojOt6prRXYAWCvDICL4W3HADkFIKWuJo
 A+bN1m+PfF1eO8qKafPs/jHQ1A==
X-Google-Smtp-Source: ABdhPJwKdwqNYtrjcalQ/mSZfe/zNNTb1WZf+Bx43LDkCZUpxVVkCGbnv0e+Kgl19uj2hk4l/rtILA==
X-Received: by 2002:a05:600c:d1:: with SMTP id
 u17mr7533052wmm.20.1610741362266; 
 Fri, 15 Jan 2021 12:09:22 -0800 (PST)
Received: from dell.default ([91.110.221.158])
 by smtp.gmail.com with ESMTPSA id d85sm9187863wmd.2.2021.01.15.12.09.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 12:09:21 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 5/7] net: ethernet: ibm: ibmvnic: Fix some kernel-doc
 misdemeanours
Date: Fri, 15 Jan 2021 20:09:03 +0000
Message-Id: <20210115200905.3470941-6-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210115200905.3470941-1-lee.jones@linaro.org>
References: <20210115200905.3470941-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: Thomas Falcon <tlfalcon@linux.vnet.ibm.com>,
 John Allen <jallen@linux.vnet.ibm.com>, linux-kernel@vger.kernel.org,
 Santiago Leon <santi_leon@yahoo.com>, Jakub Kicinski <kuba@kernel.org>,
 netdev@vger.kernel.org, Lijun Pan <ljp@linux.ibm.com>,
 Dany Madden <drt@linux.ibm.com>, Paul Mackerras <paulus@samba.org>,
 Sukadev Bhattiprolu <sukadev@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fixes the following W=1 kernel build warning(s):

 from drivers/net/ethernet/ibm/ibmvnic.c:35:
 inlined from ‘handle_vpd_rsp’ at drivers/net/ethernet/ibm/ibmvnic.c:4124:3:
 drivers/net/ethernet/ibm/ibmvnic.c:1362: warning: Function parameter or member 'hdr_field' not described in 'build_hdr_data'
 drivers/net/ethernet/ibm/ibmvnic.c:1362: warning: Function parameter or member 'skb' not described in 'build_hdr_data'
 drivers/net/ethernet/ibm/ibmvnic.c:1362: warning: Function parameter or member 'hdr_len' not described in 'build_hdr_data'
 drivers/net/ethernet/ibm/ibmvnic.c:1362: warning: Function parameter or member 'hdr_data' not described in 'build_hdr_data'
 drivers/net/ethernet/ibm/ibmvnic.c:1423: warning: Function parameter or member 'hdr_field' not described in 'create_hdr_descs'
 drivers/net/ethernet/ibm/ibmvnic.c:1423: warning: Function parameter or member 'hdr_data' not described in 'create_hdr_descs'
 drivers/net/ethernet/ibm/ibmvnic.c:1423: warning: Function parameter or member 'len' not described in 'create_hdr_descs'
 drivers/net/ethernet/ibm/ibmvnic.c:1423: warning: Function parameter or member 'hdr_len' not described in 'create_hdr_descs'
 drivers/net/ethernet/ibm/ibmvnic.c:1423: warning: Function parameter or member 'scrq_arr' not described in 'create_hdr_descs'
 drivers/net/ethernet/ibm/ibmvnic.c:1474: warning: Function parameter or member 'txbuff' not described in 'build_hdr_descs_arr'
 drivers/net/ethernet/ibm/ibmvnic.c:1474: warning: Function parameter or member 'num_entries' not described in 'build_hdr_descs_arr'
 drivers/net/ethernet/ibm/ibmvnic.c:1474: warning: Function parameter or member 'hdr_field' not described in 'build_hdr_descs_arr'
 drivers/net/ethernet/ibm/ibmvnic.c:1832: warning: Function parameter or member 'adapter' not described in 'do_change_param_reset'
 drivers/net/ethernet/ibm/ibmvnic.c:1832: warning: Function parameter or member 'rwi' not described in 'do_change_param_reset'
 drivers/net/ethernet/ibm/ibmvnic.c:1832: warning: Function parameter or member 'reset_state' not described in 'do_change_param_reset'
 drivers/net/ethernet/ibm/ibmvnic.c:1911: warning: Function parameter or member 'adapter' not described in 'do_reset'
 drivers/net/ethernet/ibm/ibmvnic.c:1911: warning: Function parameter or member 'rwi' not described in 'do_reset'
 drivers/net/ethernet/ibm/ibmvnic.c:1911: warning: Function parameter or member 'reset_state' not described in 'do_reset'

Cc: Dany Madden <drt@linux.ibm.com>
Cc: Lijun Pan <ljp@linux.ibm.com>
Cc: Sukadev Bhattiprolu <sukadev@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Santiago Leon <santi_leon@yahoo.com>
Cc: Thomas Falcon <tlfalcon@linux.vnet.ibm.com>
Cc: John Allen <jallen@linux.vnet.ibm.com>
Cc: netdev@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/net/ethernet/ibm/ibmvnic.c | 27 +++++++++++++--------------
 drivers/net/xen-netfront.c         |  6 +++---
 2 files changed, 16 insertions(+), 17 deletions(-)

diff --git a/drivers/net/ethernet/ibm/ibmvnic.c b/drivers/net/ethernet/ibm/ibmvnic.c
index aed985e08e8ad..4c4252e68de5a 100644
--- a/drivers/net/ethernet/ibm/ibmvnic.c
+++ b/drivers/net/ethernet/ibm/ibmvnic.c
@@ -1384,10 +1384,10 @@ static int ibmvnic_close(struct net_device *netdev)
 
 /**
  * build_hdr_data - creates L2/L3/L4 header data buffer
- * @hdr_field - bitfield determining needed headers
- * @skb - socket buffer
- * @hdr_len - array of header lengths
- * @tot_len - total length of data
+ * @hdr_field: bitfield determining needed headers
+ * @skb: socket buffer
+ * @hdr_len: array of header lengths
+ * @hdr_data: buffer to write the header to
  *
  * Reads hdr_field to determine which headers are needed by firmware.
  * Builds a buffer containing these headers.  Saves individual header
@@ -1444,11 +1444,11 @@ static int build_hdr_data(u8 hdr_field, struct sk_buff *skb,
 
 /**
  * create_hdr_descs - create header and header extension descriptors
- * @hdr_field - bitfield determining needed headers
- * @data - buffer containing header data
- * @len - length of data buffer
- * @hdr_len - array of individual header lengths
- * @scrq_arr - descriptor array
+ * @hdr_field: bitfield determining needed headers
+ * @hdr_data: buffer containing header data
+ * @len: length of data buffer
+ * @hdr_len: array of individual header lengths
+ * @scrq_arr: descriptor array
  *
  * Creates header and, if needed, header extension descriptors and
  * places them in a descriptor array, scrq_arr
@@ -1496,10 +1496,9 @@ static int create_hdr_descs(u8 hdr_field, u8 *hdr_data, int len, int *hdr_len,
 
 /**
  * build_hdr_descs_arr - build a header descriptor array
- * @skb - socket buffer
- * @num_entries - number of descriptors to be sent
- * @subcrq - first TX descriptor
- * @hdr_field - bit field determining which headers will be sent
+ * @txbuff: tx buffer
+ * @num_entries: number of descriptors to be sent
+ * @hdr_field: bit field determining which headers will be sent
  *
  * This function will build a TX descriptor array with applicable
  * L2/L3/L4 packet header descriptors to be sent by send_subcrq_indirect.
@@ -1925,7 +1924,7 @@ static int ibmvnic_set_mac(struct net_device *netdev, void *p)
 	return rc;
 }
 
-/**
+/*
  * do_reset returns zero if we are able to keep processing reset events, or
  * non-zero if we hit a fatal error and must halt.
  */
diff --git a/drivers/net/xen-netfront.c b/drivers/net/xen-netfront.c
index b01848ef46493..811ddc8a94eea 100644
--- a/drivers/net/xen-netfront.c
+++ b/drivers/net/xen-netfront.c
@@ -1582,7 +1582,7 @@ static struct net_device *xennet_create_dev(struct xenbus_device *dev)
 	return ERR_PTR(err);
 }
 
-/**
+/*
  * Entry point to this code when a new device is created.  Allocate the basic
  * structures and the ring buffers for communication with the backend, and
  * inform the backend of the appropriate details for those.
@@ -1659,7 +1659,7 @@ static void xennet_disconnect_backend(struct netfront_info *info)
 	}
 }
 
-/**
+/*
  * We are reconnecting to the backend, due to a suspend/resume, or a backend
  * driver restart.  We tear down our netif structure and recreate it, but
  * leave the device-layer structures intact so that this is transparent to the
@@ -2305,7 +2305,7 @@ static int xennet_connect(struct net_device *dev)
 	return 0;
 }
 
-/**
+/*
  * Callback received when the backend's state changes.
  */
 static void netback_changed(struct xenbus_device *dev,
-- 
2.25.1

