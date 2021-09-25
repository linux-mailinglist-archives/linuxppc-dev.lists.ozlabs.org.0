Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 12AF7418322
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Sep 2021 17:15:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HGssF1TQ7z2yYl
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Sep 2021 01:15:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=J5eodTOK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=desnesn@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=J5eodTOK; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HGsrR3pwgz2xtR
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Sep 2021 01:14:30 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18PBcxgg003061; 
 Sat, 25 Sep 2021 11:14:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=ZaI3EcatiddSWtTxy8KDie+gV9GvILToE+ZVdnA8tzA=;
 b=J5eodTOK9UET/2Li84QOFQiKzSYlBHYD52nNma3zXC9IRD5Q8JsNQqW+qd80IFDUUnha
 8MUFkmOYUtoe78livBjHdU6f4mPCnUEz9MTjV9lt46tlMM5aXqXCVCgQ4TlOoxTWUYF4
 mIVQTPqEiPp+RquRQho9FInpvKQa1cD3KYs5GPBFIvI/0iT+9Ah6AS1qrrzwLiB/446r
 LJfsIuC2kcCIYL6njttYIdnqvrmRVkaDpqRNK8kGs2pkcg6LxfnQ8YyYKU9xP7f0WXvl
 VufVpplhVro6fV2xE6jBTle7u2QhwLD0SQt7KhS9+D6FHG6d3zjSUaII03K5iTdN7RL+ +g== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b9yv8ctwr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 25 Sep 2021 11:14:27 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18PFCDjr000589;
 Sat, 25 Sep 2021 15:14:26 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma04wdc.us.ibm.com with ESMTP id 3b9ud9d861-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 25 Sep 2021 15:14:26 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 18PFEO0D11207104
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 25 Sep 2021 15:14:24 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7AFAABE04F;
 Sat, 25 Sep 2021 15:14:24 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BB7E4BE058;
 Sat, 25 Sep 2021 15:14:22 +0000 (GMT)
Received: from ibm.ibmuc.com (unknown [9.160.60.10])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Sat, 25 Sep 2021 15:14:22 +0000 (GMT)
From: "Desnes A. Nunes do Rosario" <desnesn@linux.ibm.com>
To: netdev@vger.kernel.org
Subject: [PATCH] Revert "ibmvnic: check failover_pending in login response"
Date: Sat, 25 Sep 2021 12:14:18 -0300
Message-Id: <20210925151418.1614874-1-desnesn@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: tUBsjFbl1Dsx540taYQXCL5RpfvSXyDs
X-Proofpoint-GUID: tUBsjFbl1Dsx540taYQXCL5RpfvSXyDs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-25_05,2021-09-24_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0
 mlxscore=0 malwarescore=0 adultscore=0 mlxlogscore=999 suspectscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2109250113
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
Cc: drt@linux.ibm.com, tlfalcon@linux.ibm.com, sukadev@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org,
 "Desnes A. Nunes do Rosario" <desnesn@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This reverts commit d437f5aa23aa2b7bd07cd44b839d7546cc17166f.

Code has been duplicated through commit <273c29e944bd> "ibmvnic: check
failover_pending in login response"

Signed-off-by: Desnes A. Nunes do Rosario <desnesn@linux.ibm.com>
---
 drivers/net/ethernet/ibm/ibmvnic.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/net/ethernet/ibm/ibmvnic.c b/drivers/net/ethernet/ibm/ibmvnic.c
index a4579b340120..6aa6ff89a765 100644
--- a/drivers/net/ethernet/ibm/ibmvnic.c
+++ b/drivers/net/ethernet/ibm/ibmvnic.c
@@ -4708,14 +4708,6 @@ static int handle_login_rsp(union ibmvnic_crq *login_rsp_crq,
 		return 0;
 	}
 
-	if (adapter->failover_pending) {
-		adapter->init_done_rc = -EAGAIN;
-		netdev_dbg(netdev, "Failover pending, ignoring login response\n");
-		complete(&adapter->init_done);
-		/* login response buffer will be released on reset */
-		return 0;
-	}
-
 	netdev->mtu = adapter->req_mtu - ETH_HLEN;
 
 	netdev_dbg(adapter->netdev, "Login Response Buffer:\n");
-- 
2.31.1

