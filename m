Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5012B899F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Nov 2020 02:34:05 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cc2Jq1YszzDqpy
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Nov 2020 12:34:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=tlfalcon@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=pPP9Mf/K; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cc1rZ5QBRzDqRL
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Nov 2020 12:13:02 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AJ13HSL116837; Wed, 18 Nov 2020 20:12:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pp1;
 bh=o3SnSx/FUmZ1rbizUSnKEHWZZm9v9ynH8glDMOox6ZA=;
 b=pPP9Mf/KtSueAd/mSM1v+W/G0yjgtr7dDthShSrNyEZ7GrBEHKNGf8S5y1FDjBKw3QVk
 gaFWey5aDIzE1x7mgRrbnFedbFvjIGfQYjW8KDjecv2HQ0DgbVb8y+d3Z0gUkmSz63ga
 mNE/YHOM87wCUvnB23KuzhSPbtuAVssHJDn+i6OGLvqzvD1eAL2ks+n+/pnHfbB0E16X
 75tHw8GQJTvsw+DX43d4z15OuUJP5/00Atq029f7eWMYROkQ4S1aRU9HBNndXxIV7dr8
 9U1j9uFDHMQ1XbWv634JzG05E90Os/frapAOaLFrD8RfDZnDZtpSCzhrHbPKtT16m6SQ NQ== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34w4rha2h3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Nov 2020 20:12:59 -0500
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AJ17FqU026465;
 Thu, 19 Nov 2020 01:12:58 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma05wdc.us.ibm.com with ESMTP id 34t6v9agv5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Nov 2020 01:12:58 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AJ1Cm9d59900340
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 19 Nov 2020 01:12:48 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 296326A05A;
 Thu, 19 Nov 2020 01:12:57 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 689526A04D;
 Thu, 19 Nov 2020 01:12:55 +0000 (GMT)
Received: from oc7186267434.ibm.com (unknown [9.65.199.179])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 19 Nov 2020 01:12:55 +0000 (GMT)
From: Thomas Falcon <tlfalcon@linux.ibm.com>
To: kuba@kernel.org
Subject: [PATCH net-next v2 9/9] ibmvnic: Do not replenish RX buffers after
 every polling loop
Date: Wed, 18 Nov 2020 19:12:25 -0600
Message-Id: <1605748345-32062-10-git-send-email-tlfalcon@linux.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1605748345-32062-1-git-send-email-tlfalcon@linux.ibm.com>
References: <1605748345-32062-1-git-send-email-tlfalcon@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-18_10:2020-11-17,
 2020-11-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=1 clxscore=1015
 mlxscore=0 bulkscore=0 lowpriorityscore=0 mlxlogscore=560 impostorscore=0
 phishscore=0 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011190003
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
Cc: cforno12@linux.ibm.com, netdev@vger.kernel.org, ljp@linux.vnet.ibm.com,
 ricklind@linux.ibm.com, dnbanerg@us.ibm.com, tlfalcon@linux.ibm.com,
 drt@linux.vnet.ibm.com, brking@linux.vnet.ibm.com, sukadev@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Dwip N. Banerjee" <dnbanerg@us.ibm.com>

Reduce the amount of time spent replenishing RX buffers by
only doing so once available buffers has fallen under a certain
threshold, in this case half of the total number of buffers, or
if the polling loop exits before the packets processed is less
than its budget.

Signed-off-by: Dwip N. Banerjee <dnbanerg@us.ibm.com>
---
 drivers/net/ethernet/ibm/ibmvnic.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/ibm/ibmvnic.c b/drivers/net/ethernet/ibm/ibmvnic.c
index 96df6d8fa277..9fe43ab0496d 100644
--- a/drivers/net/ethernet/ibm/ibmvnic.c
+++ b/drivers/net/ethernet/ibm/ibmvnic.c
@@ -2537,7 +2537,10 @@ static int ibmvnic_poll(struct napi_struct *napi, int budget)
 		frames_processed++;
 	}
 
-	if (adapter->state != VNIC_CLOSING)
+	if (adapter->state != VNIC_CLOSING &&
+	    ((atomic_read(&adapter->rx_pool[scrq_num].available) <
+	      adapter->req_rx_add_entries_per_subcrq / 2) ||
+	      frames_processed < budget))
 		replenish_rx_pool(adapter, &adapter->rx_pool[scrq_num]);
 	if (frames_processed < budget) {
 		if (napi_complete_done(napi, frames_processed)) {
-- 
2.26.2

