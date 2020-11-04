Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2382A6051
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Nov 2020 10:10:57 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CR18s5nJfzDqbC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Nov 2020 20:10:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::341;
 helo=mail-wm1-x341.google.com; envelope-from=lee.jones@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=q3O/SXd4; dkim-atps=neutral
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CR13z6J0qzDqXv
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Nov 2020 20:06:39 +1100 (AEDT)
Received: by mail-wm1-x341.google.com with SMTP id e2so1604323wme.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Nov 2020 01:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/B2umlHEGwiWmUzcbuvTIa6aaDkptaAOjJxXB95ER8o=;
 b=q3O/SXd4LV8Ycy1SNvZO/331iDTMCBCi8rZ58FfA5rgOfwOMV3xdfcQ3fXzVezQH0G
 +kWKkHrxzkgm88APVQPS3NRojiXIMSF6xaiJ/b1UvLhT2GvLse1x6a7/Zl0XGL2K1cfG
 S1FVBL26Ka6AoRQ//rNLtIaWg/HUa0NJLSAHQUJ18bmofOY7Q6RIlslTHkHYnGKPZh0S
 TCWisaLpOSszO/NlsTXsYORH9y+dPxCSPAPlAYpIoQVZe6HD8xvTGj4b8UGE78ZaDHFP
 cMpv0UoPO7nSdYIzAwSNmWBTV6mG0RtmxCCSH3/neHoVNHpEu8DwyiHz0j6+zhIWG36V
 /M+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/B2umlHEGwiWmUzcbuvTIa6aaDkptaAOjJxXB95ER8o=;
 b=VNlwpdfxPdFkKWyTuj2KEtNmXwJyzYMWBGBWEGhbyoxRct/CMz19YXbz0ToHhWnqjH
 8AhvyTr/+QO85XsWSSKuyCfjsc9LMjpszedHQiqDjjmpXsRxIWJsFzB3wdrPCI52X0KM
 9X3JLZUoyRl0tAgNi6cEA23WLTKNXYKeENC4cGtxp4VTqjUnDZ8/jbgzxM6gutj/z1ly
 N4BOI9tvTEbPRAFcRcnaYnSZX0iAyxN/HSG2oxj9/0k0xgoeh5q7G+f5cvi1VpzLrhQL
 ra2GnKg9M/bocYQk1P2YfuyHIdP4mzmswKtCNRahuDaAsKJYwDxRyFPvm6Z3ZEN9RXlR
 ACIw==
X-Gm-Message-State: AOAM530lgS174cQXhac9D8DmophTzlQkbk2eZRMaL49q3T9bW7hC3egn
 cN2NlWQuJOkSvrlkx3hmH1in8Q==
X-Google-Smtp-Source: ABdhPJzo+OegKdhy8F4t60EOE90G4mmOxUJrXbpS2bCT6Vg8Nm6O2AnmaKTkL6KQlAZoEbrT3oNfRg==
X-Received: by 2002:a1c:df89:: with SMTP id w131mr3289237wmg.164.1604480795182; 
 Wed, 04 Nov 2020 01:06:35 -0800 (PST)
Received: from dell.default ([91.110.221.242])
 by smtp.gmail.com with ESMTPSA id e25sm1607823wrc.76.2020.11.04.01.06.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 01:06:34 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: davem@davemloft.net,
	kuba@kernel.org
Subject: [PATCH 09/12] net: ethernet: ibm: ibmvnic: Fix some kernel-doc
 misdemeanours
Date: Wed,  4 Nov 2020 09:06:07 +0000
Message-Id: <20201104090610.1446616-10-lee.jones@linaro.org>
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
 Lijun Pan <ljp@linux.ibm.com>, Dany Madden <drt@linux.ibm.com>,
 Paul Mackerras <paulus@samba.org>, Sukadev Bhattiprolu <sukadev@linux.ibm.com>,
 Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org
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
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/net/ethernet/ibm/ibmvnic.c b/drivers/net/ethernet/ibm/ibmvnic.c
index 1dc3cfdb38abc..b30e1f5784bad 100644
--- a/drivers/net/ethernet/ibm/ibmvnic.c
+++ b/drivers/net/ethernet/ibm/ibmvnic.c
@@ -1357,10 +1357,10 @@ static int ibmvnic_close(struct net_device *netdev)
 
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
@@ -1417,11 +1417,11 @@ static int build_hdr_data(u8 hdr_field, struct sk_buff *skb,
 
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
@@ -1469,10 +1469,10 @@ static int create_hdr_descs(u8 hdr_field, u8 *hdr_data, int len, int *hdr_len,
 
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
@@ -1835,7 +1835,7 @@ static int ibmvnic_set_mac(struct net_device *netdev, void *p)
 	return rc;
 }
 
-/**
+/*
  * do_reset returns zero if we are able to keep processing reset events, or
  * non-zero if we hit a fatal error and must halt.
  */
-- 
2.25.1

