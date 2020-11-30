Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4EB2C8DB9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Nov 2020 20:12:47 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ClFHJ3GtZzDqP6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Dec 2020 06:12:44 +1100 (AEDT)
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
 header.s=pp1 header.b=dMHuGMVl; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ClFBs4wkrzDqZS
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Dec 2020 06:08:53 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AUJ4G8u027953; Mon, 30 Nov 2020 14:08:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pp1;
 bh=zV3FKOHjEtgnFdmx3RVauLTCLF5FDzFB5ely4Yw1NiU=;
 b=dMHuGMVlf6Qg71M2jLeWSOcey43AtGRQ+gfgPM82KIOnD8sbpr4VycIYTPURW9ofnnOe
 xMytICMpbat6nX6h71csYkY5T87/PRPbtsTBKDZW+jUbpPFMTR7Ak4SDQKOsmEK3JP/V
 irCb9q3WSO87swSNdOqYAeGmw1yS+A+6GqD43ijthEnto6U5DAm8WFk87PB8e0JuQZAt
 FxQTEl8/Ag0uKmZ4ktSOEPWA2dKtrWX5IHki85+xS25XCIffyN2L7sEiF1FE3tNRv7eS
 7iJvkn5i0BmiyST1z1D6D6vDVX8CC95yKCqijvTAtREVhsxCGnmh1/iUN1R4M5e7MWF+ WQ== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3555gyj9se-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Nov 2020 14:08:49 -0500
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AUJ10Gv002310;
 Mon, 30 Nov 2020 19:08:48 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma01wdc.us.ibm.com with ESMTP id 353e68tghm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Nov 2020 19:08:48 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AUJ7WBa67043628
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 30 Nov 2020 19:07:32 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8077D2805C;
 Mon, 30 Nov 2020 19:07:32 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 78DCF28060;
 Mon, 30 Nov 2020 19:07:31 +0000 (GMT)
Received: from oc7186267434.ibm.com (unknown [9.160.4.131])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 30 Nov 2020 19:07:31 +0000 (GMT)
From: Thomas Falcon <tlfalcon@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH net v2 2/2] ibmvnic: Fix TX completion error handling
Date: Mon, 30 Nov 2020 13:07:24 -0600
Message-Id: <1606763244-28111-3-git-send-email-tlfalcon@linux.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1606763244-28111-1-git-send-email-tlfalcon@linux.ibm.com>
References: <1606763244-28111-1-git-send-email-tlfalcon@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-30_08:2020-11-30,
 2020-11-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 clxscore=1015 lowpriorityscore=0 mlxlogscore=999 adultscore=0
 suspectscore=1 bulkscore=0 phishscore=0 malwarescore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011300122
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

TX completions received with an error return code are not
being processed properly. When an error code is seen, do not
proceed to the next completion before cleaning up the existing
entry's data structures.

Fixes: 032c5e828 ("Driver for IBM System i/p VNIC protocol")
Signed-off-by: Thomas Falcon <tlfalcon@linux.ibm.com>
---
 drivers/net/ethernet/ibm/ibmvnic.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/ibm/ibmvnic.c b/drivers/net/ethernet/ibm/ibmvnic.c
index 5ea9f5c..10878f8 100644
--- a/drivers/net/ethernet/ibm/ibmvnic.c
+++ b/drivers/net/ethernet/ibm/ibmvnic.c
@@ -3113,11 +3113,9 @@ static int ibmvnic_complete_tx(struct ibmvnic_adapter *adapter,
 
 		next = ibmvnic_next_scrq(adapter, scrq);
 		for (i = 0; i < next->tx_comp.num_comps; i++) {
-			if (next->tx_comp.rcs[i]) {
+			if (next->tx_comp.rcs[i])
 				dev_err(dev, "tx error %x\n",
 					next->tx_comp.rcs[i]);
-				continue;
-			}
 			index = be32_to_cpu(next->tx_comp.correlators[i]);
 			if (index & IBMVNIC_TSO_POOL_MASK) {
 				tx_pool = &adapter->tso_pool[pool];
-- 
1.8.3.1

