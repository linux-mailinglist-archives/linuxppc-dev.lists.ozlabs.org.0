Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E75312C5738
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 15:38:36 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ChgNm66fszDr37
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Nov 2020 01:38:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::441;
 helo=mail-wr1-x441.google.com; envelope-from=lee.jones@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ASuVkVTc; dkim-atps=neutral
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Chf4V2bqzzDqnk
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Nov 2020 00:39:22 +1100 (AEDT)
Received: by mail-wr1-x441.google.com with SMTP id p8so2179539wrx.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Nov 2020 05:39:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J04TG1Pd2VMEs10XeVongpt36rd/B3l0W5A2vaR7ZWw=;
 b=ASuVkVTcgwd/WCUwH04MEIkheHtx5Wjw2rIYLxShk06kubCFMXm+otYbDyMnX4BqK7
 Sw1YvK+F3whskVSDQyijQJWP7yXIzzCYuEDLCKtx2CaUJkAaRY1C2HtdJ2Z8I09aj+rp
 S7o4H42oKh3GRNmuAm5XHVbFFoICws/3LxAPUwMelCmfba3MAskBeFnhHo7SrMLj9Qzv
 pqCV6UV2zzo6SwVIk6pGdX+MUAIfe4Jcqn7ui7qfpp/Tex0G3XWC9wWhnwJfB/nUIj9q
 Op9fEXSZhUanQjdXi4sNoUK3Vohya2vRNVaOZcacB5tfg2zCCFjjNgHXL1xH6rtkqcV6
 H9iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J04TG1Pd2VMEs10XeVongpt36rd/B3l0W5A2vaR7ZWw=;
 b=GZ/W5yG7A35pIsqmR+O3RPhI/6n0TPhrj4X9shEbbBlzqTVK7AzjT4t6MmpYaHR7Lp
 Mwm9msYwDu6zoGdn72wa+5YNjgT9n+ORL9cKZdCCY7k7jNETz915MEJGr6Dq5y/W1Jcg
 k+jmnnQ0KMpTWtpiikbDNZimwiGug/jIDPg1aRWJKeO4jDnSNqBujEwEpQ1supOeVHUU
 8eqQ/pszpxhpnQVQ1NnfIT8ZAxdQTvkt/tG/3jiOvT3nj2G8o92PckAV0Bp2UAeop1Kn
 RwevYMRNFYu4EbIt4Fd/V2e5D9ikDonnhvLs5AIZq2afZJ4DRlx18NcTXofuk7k71i/L
 YLRA==
X-Gm-Message-State: AOAM532qwPf0GE84f+jj40oAg9GZUulceoCiZH1cROOB6zO1zWWoCCKC
 k+jJVI/1f7yR8z8clgh7OzZqQw==
X-Google-Smtp-Source: ABdhPJyN8/8GK8ahfAZyW4Z6JsWycoHhBBqMueSu1OkgXz5UfUCb7Xd72OlnNvdvg9ydmIIzt1uCJQ==
X-Received: by 2002:a5d:4cca:: with SMTP id c10mr3926754wrt.176.1606397944966; 
 Thu, 26 Nov 2020 05:39:04 -0800 (PST)
Received: from dell.default ([91.110.221.235])
 by smtp.gmail.com with ESMTPSA id s133sm7035825wmf.38.2020.11.26.05.39.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2020 05:39:03 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 5/8] net: ethernet: ibm: ibmvnic: Fix some kernel-doc
 misdemeanours
Date: Thu, 26 Nov 2020 13:38:50 +0000
Message-Id: <20201126133853.3213268-6-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201126133853.3213268-1-lee.jones@linaro.org>
References: <20201126133853.3213268-1-lee.jones@linaro.org>
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
 drivers/net/ethernet/ibm/ibmvnic.c | 28 ++++++++++++++--------------
 drivers/net/xen-netfront.c         |  6 +++---
 2 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/net/ethernet/ibm/ibmvnic.c b/drivers/net/ethernet/ibm/ibmvnic.c
index b0884eba568d7..36ea37721e3c8 100644
--- a/drivers/net/ethernet/ibm/ibmvnic.c
+++ b/drivers/net/ethernet/ibm/ibmvnic.c
@@ -1376,10 +1376,10 @@ static int ibmvnic_close(struct net_device *netdev)
 
 /**
  * build_hdr_data - creates L2/L3/L4 header data buffer
- * @hdr_field - bitfield determining needed headers
- * @skb - socket buffer
- * @hdr_len - array of header lengths
- * @tot_len - total length of data
+ * @hdr_field: bitfield determining needed headers
+ * @skb: socket buffer
+ * @hdr_len: array of header lengths
+ * @tot_len: total length of data
  *
  * Reads hdr_field to determine which headers are needed by firmware.
  * Builds a buffer containing these headers.  Saves individual header
@@ -1436,11 +1436,11 @@ static int build_hdr_data(u8 hdr_field, struct sk_buff *skb,
 
 /**
  * create_hdr_descs - create header and header extension descriptors
- * @hdr_field - bitfield determining needed headers
- * @data - buffer containing header data
- * @len - length of data buffer
- * @hdr_len - array of individual header lengths
- * @scrq_arr - descriptor array
+ * @hdr_field: bitfield determining needed headers
+ * @data: buffer containing header data
+ * @len: length of data buffer
+ * @hdr_len: array of individual header lengths
+ * @scrq_arr: descriptor array
  *
  * Creates header and, if needed, header extension descriptors and
  * places them in a descriptor array, scrq_arr
@@ -1488,10 +1488,10 @@ static int create_hdr_descs(u8 hdr_field, u8 *hdr_data, int len, int *hdr_len,
 
 /**
  * build_hdr_descs_arr - build a header descriptor array
- * @skb - socket buffer
- * @num_entries - number of descriptors to be sent
- * @subcrq - first TX descriptor
- * @hdr_field - bit field determining which headers will be sent
+ * @skb: socket buffer
+ * @num_entries: number of descriptors to be sent
+ * @subcrq: first TX descriptor
+ * @hdr_field: bit field determining which headers will be sent
  *
  * This function will build a TX descriptor array with applicable
  * L2/L3/L4 packet header descriptors to be sent by send_subcrq_indirect.
@@ -1997,7 +1997,7 @@ static int do_change_param_reset(struct ibmvnic_adapter *adapter,
 	return 0;
 }
 
-/**
+/*
  * do_reset returns zero if we are able to keep processing reset events, or
  * non-zero if we hit a fatal error and must halt.
  */
diff --git a/drivers/net/xen-netfront.c b/drivers/net/xen-netfront.c
index 920cac4385bf7..93740ef4cf1b4 100644
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

