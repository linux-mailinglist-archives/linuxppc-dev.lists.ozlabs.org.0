Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FB32C574A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 15:46:33 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ChgYx4Z6zzDrJq
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Nov 2020 01:46:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::442;
 helo=mail-wr1-x442.google.com; envelope-from=lee.jones@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=CRjmklKz; dkim-atps=neutral
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Chf4g4K5RzDrDD
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Nov 2020 00:39:31 +1100 (AEDT)
Received: by mail-wr1-x442.google.com with SMTP id 64so2161266wra.11
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Nov 2020 05:39:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xRpAJlbq6+V+ePZQw5yqXL7428RUL9OWlsKS5RA6BKg=;
 b=CRjmklKzjv8jTVM8y5ehKKzL+Eel4+NeZfyvFpAJcJJCxkpaa/dQY/KI+1cxh1uKQ4
 x31XOW25cX4mFhG9B7f7Iq2OIMx1+YfwDvE8nsKg8nvngYAjmgAV1fdsiTKsLKsqr20d
 AVbJvZ+6JOoefJT03HN8cVZvAS/fcbeQr1wDFZHm80j3PrkvXxeRl91q4S97uqp5DDi6
 c8V8JkOpiN+wGrHi1sLekRUKouPglPzl1kSpPXorZqMDILV4Mo6Nd0z19ltIH1Hu0zoN
 wUZihn3nrw73DDDpfNkwdhmP6qJozeDF8vGvP60mgCrsT6gXef46skpBc28THKvD2tXQ
 6Iwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xRpAJlbq6+V+ePZQw5yqXL7428RUL9OWlsKS5RA6BKg=;
 b=X2p5qrqxrSZJo/1s2u6dz0TV658r8PkYXu+M7k21ZxO7b9eaI+iWR4jsPzPgS+/Sqm
 lpqRBCcs3lcUw0kayfPTbUvf92nYkE8IACVHLbuxBbk/3eRY0FhM7/yX8ejAZJ5Yd35g
 DZlNkz6WrPN5gApXqQj5sQ51loQc0+GJfUl4bTrGBhR3U+6Y0nGNelt/XwOp/6Bwdzcr
 /Jds0c8tj21Om8n0IB8YYUXFq1ggbzwEf23yO0j6HlVtjE0kBZ4kuaX4+MSQukKlBBdj
 CSC/poOUM39W0bTpB3wdCXYM3Acf+7gfvsE5zfePpTePwpWLjoTiqR3r2McZHOUXqKfy
 oMQw==
X-Gm-Message-State: AOAM530HsQdZ2J7rldx4Y6cgR4FUblSFXWoOF4NmjVj8j4+xrMp0JGdr
 /M8LMNq1uLdvosTRY0djwA7y7w==
X-Google-Smtp-Source: ABdhPJyLZT0V4+zVqDNFo6SwnsBmTFtnBfv+6D8SII+64k4pMDJ9qNUY8G8xUyMfkpwcg4n/U1GplQ==
X-Received: by 2002:a5d:66cd:: with SMTP id k13mr3908174wrw.365.1606397949075; 
 Thu, 26 Nov 2020 05:39:09 -0800 (PST)
Received: from dell.default ([91.110.221.235])
 by smtp.gmail.com with ESMTPSA id s133sm7035825wmf.38.2020.11.26.05.39.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2020 05:39:08 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 8/8] net: ethernet: ibm: ibmvnic: Fix some kernel-doc issues
Date: Thu, 26 Nov 2020 13:38:53 +0000
Message-Id: <20201126133853.3213268-9-lee.jones@linaro.org>
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
 drivers/net/ethernet/ibm/ibmvnic.c:1362: warning: Function parameter or member 'hdr_data' not described in 'build_hdr_data'
 drivers/net/ethernet/ibm/ibmvnic.c:1362: warning: Excess function parameter 'tot_len' description in 'build_hdr_data'
 drivers/net/ethernet/ibm/ibmvnic.c:1423: warning: Function parameter or member 'hdr_data' not described in 'create_hdr_descs'
 drivers/net/ethernet/ibm/ibmvnic.c:1423: warning: Excess function parameter 'data' description in 'create_hdr_descs'
 drivers/net/ethernet/ibm/ibmvnic.c:1474: warning: Function parameter or member 'txbuff' not described in 'build_hdr_descs_arr'
 drivers/net/ethernet/ibm/ibmvnic.c:1474: warning: Excess function parameter 'skb' description in 'build_hdr_descs_arr'
 drivers/net/ethernet/ibm/ibmvnic.c:1474: warning: Excess function parameter 'subcrq' description in 'build_hdr_descs_arr'

Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Dany Madden <drt@linux.ibm.com>
Cc: Lijun Pan <ljp@linux.ibm.com>
Cc: Sukadev Bhattiprolu <sukadev@linux.ibm.com>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Santiago Leon <santi_leon@yahoo.com>
Cc: Thomas Falcon <tlfalcon@linux.vnet.ibm.com>
Cc: John Allen <jallen@linux.vnet.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: netdev@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/net/ethernet/ibm/ibmvnic.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/ibm/ibmvnic.c b/drivers/net/ethernet/ibm/ibmvnic.c
index 36ea37721e3c8..0687f6cb0c7a2 100644
--- a/drivers/net/ethernet/ibm/ibmvnic.c
+++ b/drivers/net/ethernet/ibm/ibmvnic.c
@@ -1379,7 +1379,7 @@ static int ibmvnic_close(struct net_device *netdev)
  * @hdr_field: bitfield determining needed headers
  * @skb: socket buffer
  * @hdr_len: array of header lengths
- * @tot_len: total length of data
+ * @hdr_data: buffer to write the header to
  *
  * Reads hdr_field to determine which headers are needed by firmware.
  * Builds a buffer containing these headers.  Saves individual header
@@ -1437,7 +1437,7 @@ static int build_hdr_data(u8 hdr_field, struct sk_buff *skb,
 /**
  * create_hdr_descs - create header and header extension descriptors
  * @hdr_field: bitfield determining needed headers
- * @data: buffer containing header data
+ * @hdr_data: buffer containing header data
  * @len: length of data buffer
  * @hdr_len: array of individual header lengths
  * @scrq_arr: descriptor array
@@ -1488,9 +1488,8 @@ static int create_hdr_descs(u8 hdr_field, u8 *hdr_data, int len, int *hdr_len,
 
 /**
  * build_hdr_descs_arr - build a header descriptor array
- * @skb: socket buffer
+ * @txbuff: tx buffer
  * @num_entries: number of descriptors to be sent
- * @subcrq: first TX descriptor
  * @hdr_field: bit field determining which headers will be sent
  *
  * This function will build a TX descriptor array with applicable
-- 
2.25.1

