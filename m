Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D02E32A605D
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Nov 2020 10:14:03 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CR1DS12rMzDqXR
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Nov 2020 20:14:00 +1100 (AEDT)
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
 header.s=google header.b=vwJYvf5t; dkim-atps=neutral
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CR14412MwzDqXT
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Nov 2020 20:06:44 +1100 (AEDT)
Received: by mail-wr1-x441.google.com with SMTP id y12so21180591wrp.6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Nov 2020 01:06:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hCoWNpiCY5I/CQYGLXURefOzHbVXVRlIXhsHqYI/w30=;
 b=vwJYvf5tSu7houONcmY2RH0gAqaH3s1DrvDwNkF4scpQukej3gO26Urf1rHRcXlx7G
 B2whz/j1yA3d9bp292+5xEZLWicfY9GfbwHm4C6yccYuE9OZmNKeLxI5PBb//bQitl+E
 v6nlckH1Km93jQw2G02u45i90OEKa58QkQJKwuVrgtTcvR2aoDTlVT2T+iFhz7AEFzBt
 4/GD1b8f73SRPihSSmP/Qu1gKvWTXZV54+o+y+7Dlakhv8SCIvaIOrhA7JHtfRDLugEK
 W+adwHbrSM4M/7sWpJ5Qu1vE6cyyvCWOjhiqzAcVRe3JrHoLI/3pZfXIMko92etRfCXg
 uymA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hCoWNpiCY5I/CQYGLXURefOzHbVXVRlIXhsHqYI/w30=;
 b=A+8ui+bDihvqMgw/i1O9J6MQXqswXEBGt5ldsUkGaTo0ThWPgSbvPADoDuWpYBwNtY
 pfnGRSawucnv+XVMS9gTkIyhlY2Wl4vj+5xOrjb10+TrK1Vm+OJ79ir2/LZIxQb70OQU
 QZ4ihPBpJNPysNpbLALNVQPPe0bjsOJxYyx5ioBlJtQSafTj1aXJ9KxEpV3f/WG5wELT
 wStcj8MQdu7f4JS7aW4Bqz5r2Ny5FC5llEpqeTSwJz/UEpQVVuw5gphyo/wIM3DPy+6d
 +VCLT3NZ7Yae84LWxrq1ObzJe9LhVesZ4hTEyRn9SIoclVsm8F+wrj/vN2ZMgjwU9d7t
 Ni7g==
X-Gm-Message-State: AOAM5339h2CzPKQWGIX/dJ+mPFHjPdSNzpgI5NKy2R6nnyxEpCyJjOFi
 bV8ZXaK3/P9EauAxfk0sn3MWNQ==
X-Google-Smtp-Source: ABdhPJyouHiD9Dbeluv3U+pp3NeWi36AECmXpnyN2oBwE+mQUrCkcIzIM6ScwsKBWyolVfD7r82PcQ==
X-Received: by 2002:adf:a195:: with SMTP id u21mr24545841wru.132.1604480799084; 
 Wed, 04 Nov 2020 01:06:39 -0800 (PST)
Received: from dell.default ([91.110.221.242])
 by smtp.gmail.com with ESMTPSA id e25sm1607823wrc.76.2020.11.04.01.06.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 01:06:38 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: davem@davemloft.net,
	kuba@kernel.org
Subject: [PATCH 12/12] net: ethernet: ibm: ibmvnic: Fix some kernel-doc issues
Date: Wed,  4 Nov 2020 09:06:10 +0000
Message-Id: <20201104090610.1446616-13-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201104090610.1446616-1-lee.jones@linaro.org>
References: <20201104090610.1446616-1-lee.jones@linaro.org>
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
Cc: Thomas Falcon <tlfalcon@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Santiago Leon <santi_leon@yahoo.com>,
 John Allen <jallen@linux.vnet.ibm.com>, netdev@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, Dany Madden <drt@linux.ibm.com>,
 Lijun Pan <ljp@linux.ibm.com>, Sukadev Bhattiprolu <sukadev@linux.ibm.com>,
 Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org
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
index b30e1f5784bad..08dab7a94b7ea 100644
--- a/drivers/net/ethernet/ibm/ibmvnic.c
+++ b/drivers/net/ethernet/ibm/ibmvnic.c
@@ -1360,7 +1360,7 @@ static int ibmvnic_close(struct net_device *netdev)
  * @hdr_field: bitfield determining needed headers
  * @skb: socket buffer
  * @hdr_len: array of header lengths
- * @tot_len: total length of data
+ * @hdr_data: buffer to write the header to
  *
  * Reads hdr_field to determine which headers are needed by firmware.
  * Builds a buffer containing these headers.  Saves individual header
@@ -1418,7 +1418,7 @@ static int build_hdr_data(u8 hdr_field, struct sk_buff *skb,
 /**
  * create_hdr_descs - create header and header extension descriptors
  * @hdr_field: bitfield determining needed headers
- * @data: buffer containing header data
+ * @hdr_data: buffer containing header data
  * @len: length of data buffer
  * @hdr_len: array of individual header lengths
  * @scrq_arr: descriptor array
@@ -1469,9 +1469,8 @@ static int create_hdr_descs(u8 hdr_field, u8 *hdr_data, int len, int *hdr_len,
 
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

