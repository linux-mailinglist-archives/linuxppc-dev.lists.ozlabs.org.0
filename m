Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 032B82B8991
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Nov 2020 02:28:39 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cc2BW271NzDqFM
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Nov 2020 12:28:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=tlfalcon@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=e3IYd1vp; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cc1rS2QRvzDqS7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Nov 2020 12:12:55 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AJ11n5L194712; Wed, 18 Nov 2020 20:12:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pp1;
 bh=M0d37I5CZ69sPlUenlgHIt6Po3tNJO1AFbMDGV9bWpM=;
 b=e3IYd1vpnOwQNh27peNFWLaBIE5jmQCEc7SMopY3XhT3GoT+bQgqrWIVKT8dD6myFSKJ
 Z1TXqt7lUNuK7ZX0LCGMRBpHzbjZws23uBwfX0Cn6zjh/k7eZHf9By5R4dK0bxOTi3xC
 U4PQvnWDtDfN7YSRhUnF4NMDeQxfsaMwbmDXWuwW1Ogy2/Ya/smkoFjs6c8nNHx9z64f
 /v+X1o+HqXe4Tr4MKmt0yrGwNnwoh+mgQk2ep0vFVkoVEqorJIYg8IgYIqDPymwTHCp4
 SZ9O4B2prlomtk74fXaq6ASCxvyMC1eN9ta4oGNayyngcDsDSwnuxuDhnSjwhvuxdAU2 Aw== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 34w8p8tatv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Nov 2020 20:12:51 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AJ17SK3004835;
 Thu, 19 Nov 2020 01:12:51 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma03dal.us.ibm.com with ESMTP id 34w262x809-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Nov 2020 01:12:50 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AJ1Ch9J27656612
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 19 Nov 2020 01:12:43 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 175536A04F;
 Thu, 19 Nov 2020 01:12:49 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7424B6A04D;
 Thu, 19 Nov 2020 01:12:47 +0000 (GMT)
Received: from oc7186267434.ibm.com (unknown [9.65.199.179])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 19 Nov 2020 01:12:47 +0000 (GMT)
From: Thomas Falcon <tlfalcon@linux.ibm.com>
To: kuba@kernel.org
Subject: [PATCH net-next v2 5/9] ibmvnic: Remove send_subcrq function
Date: Wed, 18 Nov 2020 19:12:21 -0600
Message-Id: <1605748345-32062-6-git-send-email-tlfalcon@linux.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1605748345-32062-1-git-send-email-tlfalcon@linux.ibm.com>
References: <1605748345-32062-1-git-send-email-tlfalcon@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-18_10:2020-11-17,
 2020-11-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=1
 phishscore=0 mlxscore=0 adultscore=0 impostorscore=0 mlxlogscore=999
 malwarescore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011190000
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

It is not longer used, so remove it.

Signed-off-by: Thomas Falcon <tlfalcon@linux.ibm.com>
---
 drivers/net/ethernet/ibm/ibmvnic.c | 34 ------------------------------
 1 file changed, 34 deletions(-)

diff --git a/drivers/net/ethernet/ibm/ibmvnic.c b/drivers/net/ethernet/ibm/ibmvnic.c
index 2aace693559f..e9b0cb6dfd9d 100644
--- a/drivers/net/ethernet/ibm/ibmvnic.c
+++ b/drivers/net/ethernet/ibm/ibmvnic.c
@@ -84,8 +84,6 @@ static int ibmvnic_reset_crq(struct ibmvnic_adapter *);
 static int ibmvnic_send_crq_init(struct ibmvnic_adapter *);
 static int ibmvnic_reenable_crq_queue(struct ibmvnic_adapter *);
 static int ibmvnic_send_crq(struct ibmvnic_adapter *, union ibmvnic_crq *);
-static int send_subcrq(struct ibmvnic_adapter *adapter, u64 remote_handle,
-		       union sub_crq *sub_crq);
 static int send_subcrq_indirect(struct ibmvnic_adapter *, u64, u64, u64);
 static irqreturn_t ibmvnic_interrupt_rx(int irq, void *instance);
 static int enable_scrq_irq(struct ibmvnic_adapter *,
@@ -3629,38 +3627,6 @@ static void print_subcrq_error(struct device *dev, int rc, const char *func)
 	}
 }
 
-static int send_subcrq(struct ibmvnic_adapter *adapter, u64 remote_handle,
-		       union sub_crq *sub_crq)
-{
-	unsigned int ua = adapter->vdev->unit_address;
-	struct device *dev = &adapter->vdev->dev;
-	u64 *u64_crq = (u64 *)sub_crq;
-	int rc;
-
-	netdev_dbg(adapter->netdev,
-		   "Sending sCRQ %016lx: %016lx %016lx %016lx %016lx\n",
-		   (unsigned long int)cpu_to_be64(remote_handle),
-		   (unsigned long int)cpu_to_be64(u64_crq[0]),
-		   (unsigned long int)cpu_to_be64(u64_crq[1]),
-		   (unsigned long int)cpu_to_be64(u64_crq[2]),
-		   (unsigned long int)cpu_to_be64(u64_crq[3]));
-
-	/* Make sure the hypervisor sees the complete request */
-	mb();
-
-	rc = plpar_hcall_norets(H_SEND_SUB_CRQ, ua,
-				cpu_to_be64(remote_handle),
-				cpu_to_be64(u64_crq[0]),
-				cpu_to_be64(u64_crq[1]),
-				cpu_to_be64(u64_crq[2]),
-				cpu_to_be64(u64_crq[3]));
-
-	if (rc)
-		print_subcrq_error(dev, rc, __func__);
-
-	return rc;
-}
-
 static int send_subcrq_indirect(struct ibmvnic_adapter *adapter,
 				u64 remote_handle, u64 ioba, u64 num_entries)
 {
-- 
2.26.2

