Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C41EA2B0D8F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Nov 2020 20:12:30 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CXB7H60hRzDr1K
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Nov 2020 06:12:27 +1100 (AEDT)
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
 header.s=pp1 header.b=HH/FayT7; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CXB564kdhzDqyf
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Nov 2020 06:10:34 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0ACJ1tM1093848; Thu, 12 Nov 2020 14:10:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pp1;
 bh=LxtLYgU0FiAWWQKss+2QJHZWEiG9xWMqeCAn4NJxQ9U=;
 b=HH/FayT7HDX9VT/Pa5/eg05Fo9FEIe9uVisQoYgjYKhcsxKpMM8LE6mQa+ma3+osXglA
 L30P8nD1KMJr2LBdURLFllbD6wGCvUZxjX2co3DaQeZmgWQDjeZYvHeTm/dOy87AS3aG
 bdXgQevxhezUR5mHSCWlkkb1D6bWUZuZOBejv59Iy0jXwowqdpdz4k1JmkictGn7iuf8
 I4555Ox66JquPc/f17Xgk4COX8SgbPjtTOf2ouDvA6vISS/wFxT1fcLmu1v+EtKD3eK2
 O2Wsp/v3kLnakYkW7xtsbgKtdAsu/qQWk5zTXjUE8CTb1MsQ9mh44SW9a58eCCGM6Kes bQ== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0b-001b2d01.pphosted.com with ESMTP id 34s9vkt41w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Nov 2020 14:10:31 -0500
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0ACJ76Sj011368;
 Thu, 12 Nov 2020 19:10:31 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma05wdc.us.ibm.com with ESMTP id 34nk79mv5k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Nov 2020 19:10:31 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0ACJAThC55050666
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 12 Nov 2020 19:10:30 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E242BAE06A;
 Thu, 12 Nov 2020 19:10:29 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DB218AE066;
 Thu, 12 Nov 2020 19:10:28 +0000 (GMT)
Received: from oc7186267434.ibm.com (unknown [9.160.10.22])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 12 Nov 2020 19:10:28 +0000 (GMT)
From: Thomas Falcon <tlfalcon@linux.ibm.com>
To: netdev@vger.kernel.org
Subject: [PATCH net-next 08/12] ibmvnic: Remove send_subcrq function
Date: Thu, 12 Nov 2020 13:10:03 -0600
Message-Id: <1605208207-1896-9-git-send-email-tlfalcon@linux.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1605208207-1896-1-git-send-email-tlfalcon@linux.ibm.com>
References: <1605208207-1896-1-git-send-email-tlfalcon@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-12_10:2020-11-12,
 2020-11-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=1
 mlxscore=0 adultscore=0 impostorscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 mlxlogscore=999 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011120109
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
Cc: cforno12@linux.ibm.com, ljp@linux.vnet.ibm.com, ricklind@linux.ibm.com,
 dnbanerg@us.ibm.com, tlfalcon@linux.ibm.com, drt@linux.vnet.ibm.com,
 brking@linux.vnet.ibm.com, sukadev@linux.vnet.ibm.com,
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
index 2c24d4774457..b2ca34e94078 100644
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
@@ -3579,38 +3577,6 @@ static void print_subcrq_error(struct device *dev, int rc, const char *func)
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

