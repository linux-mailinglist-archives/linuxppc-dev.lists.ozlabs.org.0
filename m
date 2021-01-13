Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ECB92F5034
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Jan 2021 17:43:26 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DGCtc3fvLzDrYX
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Jan 2021 03:43:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::42e;
 helo=mail-wr1-x42e.google.com; envelope-from=lee.jones@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=wibdpcpc; dkim-atps=neutral
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DGCrf4mmyzDrVT
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Jan 2021 03:41:38 +1100 (AEDT)
Received: by mail-wr1-x42e.google.com with SMTP id a12so2801180wrv.8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Jan 2021 08:41:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F0dvH29ffi2i4F8zScMsXrCXjoLq5dAgU1ImPQgyxOk=;
 b=wibdpcpcVpqQHxtGL4Ai5SGD5EVrLUQO5Ly9cf7Aq2JcCEh4zDIybpj/dPs65Do5kI
 gvz7nkcYf4edgF5Ik8Isyw5YYiQTjT6troPEqGhyeEXTuaq01Pi+6R9+rpjyl/cGsfCc
 Ceh4jbARCc/OvZeoE6YplRkf9iZtmCaAQwb0aCZyNQWVNohTpORK3ZIz50vUYRGWgEob
 csr1PcBK3/glDfNEXOE9EjJOlbAnXW39VC4Ur2WuD4kH+cWSa3/AAt67BTDxRZ+Z1Pps
 rC82FPnTMc3T8zlTSaNytt2bEdMrf5s3H/F5QJfW21qJP3Fdp6D0rjvTRT54JKqIORoe
 HyZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F0dvH29ffi2i4F8zScMsXrCXjoLq5dAgU1ImPQgyxOk=;
 b=TF2XyzZqR/e1nFOo9IiolencdUKs11wfbGAKKVab4h+rvNCpeSmScmtFrqGDyEYE26
 T1YmtDcvLOOOz/MQIjTF7uvt6WvlfR5tQKYjr7OZSyEoSVkusPTS33my9ZS6lg+zNLME
 HjA8ophu9zeIQ350WBR/kHtmzPjKtV9Lw6hyuP75TZTnGWfwwsIcW92DS35wVDLQK8LP
 d3ijEvH7psMSGfImMsT+VSWXwGBaxLS7FpTCkrI3IdqqyiQuAVPNtA6WvRgxmUcQ/491
 TRBmh63n9wbyxgvFuCYXbcVwUwTDn1THeEEcCWFG+ZVsCPY5xwkSyHMS4JC75Ccri0mt
 VlIA==
X-Gm-Message-State: AOAM5318R2PAlki1bICvPqF4cwjSd4LeTbxv+igK73ZPM5work+IOHxq
 YQtF4BkJymmpkAd8PUt6tSJn2g==
X-Google-Smtp-Source: ABdhPJzJ9Z74XOA6gEvmFmXS6Z7WD6p71MlRifSd5NwXrD9UD4gxMch0et8aOg1lY2mrZvNlI1qYWQ==
X-Received: by 2002:adf:82c8:: with SMTP id 66mr3473869wrc.420.1610556094790; 
 Wed, 13 Jan 2021 08:41:34 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id t16sm3836510wmi.3.2021.01.13.08.41.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 08:41:34 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 5/7] net: ethernet: ibm: ibmvnic: Fix some kernel-doc
 misdemeanours
Date: Wed, 13 Jan 2021 16:41:21 +0000
Message-Id: <20210113164123.1334116-6-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210113164123.1334116-1-lee.jones@linaro.org>
References: <20210113164123.1334116-1-lee.jones@linaro.org>
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
index c20b78120bb42..6ef2adbd283a3 100644
--- a/drivers/net/xen-netfront.c
+++ b/drivers/net/xen-netfront.c
@@ -1580,7 +1580,7 @@ static struct net_device *xennet_create_dev(struct xenbus_device *dev)
 	return ERR_PTR(err);
 }
 
-/**
+/*
  * Entry point to this code when a new device is created.  Allocate the basic
  * structures and the ring buffers for communication with the backend, and
  * inform the backend of the appropriate details for those.
@@ -1657,7 +1657,7 @@ static void xennet_disconnect_backend(struct netfront_info *info)
 	}
 }
 
-/**
+/*
  * We are reconnecting to the backend, due to a suspend/resume, or a backend
  * driver restart.  We tear down our netif structure and recreate it, but
  * leave the device-layer structures intact so that this is transparent to the
@@ -2303,7 +2303,7 @@ static int xennet_connect(struct net_device *dev)
 	return 0;
 }
 
-/**
+/*
  * Callback received when the backend's state changes.
  */
 static void netback_changed(struct xenbus_device *dev,
-- 
2.25.1

