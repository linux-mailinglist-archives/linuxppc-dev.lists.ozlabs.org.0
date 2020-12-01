Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B2DBD2CA783
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Dec 2020 16:56:42 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Clmtc1H45zDqjZ
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Dec 2020 02:56:40 +1100 (AEDT)
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
 header.s=pp1 header.b=h2fUV4e0; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Clmnr5MjjzDqZL
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Dec 2020 02:52:32 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B1FWtCk132208; Tue, 1 Dec 2020 10:52:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject : date : message-id; s=pp1;
 bh=8h/lucV7+TEL8emLTDp9gRaHsESEemRQGOVpkhnIYs0=;
 b=h2fUV4e0RAw73ZW9DpxmrnRxWGwV3lrM5jXZn7gYeo9ISxElQbe9w8BKLhBY/DyKOlxV
 0Xa2qR94O+k/j2ApVQapR6o6DB11ihMDeCsx4spDXLxNTH0IoBybYTir+Xby2Zn6W9fI
 ct4LNqKCmq92pWGkzDd3Eg4D4lQVxJ2Z7lNL22oEm20+Ts+9c/HDyCzQHmf5c32H0xXf
 WarI0XJXrSMx2MyGeBL3yijCV/+iYoen+r7BCX7SsqMGvXA0WCBLgKntLg+6OPjvdv8R
 4l8HTjIbsuhlx/DUGPORKQWKFql0alcLB+9eXMdRyv3faQQwF06hQTRhhQCMaFk/aTZh Mg== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 355jpwmxb8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Dec 2020 10:52:22 -0500
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B1FXOsp017070;
 Tue, 1 Dec 2020 15:52:21 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma01dal.us.ibm.com with ESMTP id 355rf785q4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Dec 2020 15:52:21 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B1FqKEE46858668
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 1 Dec 2020 15:52:20 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 96267AE060;
 Tue,  1 Dec 2020 15:52:20 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 32525AE067;
 Tue,  1 Dec 2020 15:52:19 +0000 (GMT)
Received: from oc7186267434.ibm.com (unknown [9.160.5.242])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  1 Dec 2020 15:52:19 +0000 (GMT)
From: Thomas Falcon <tlfalcon@linux.ibm.com>
To: kuba@kernel.org
Subject: [PATCH net v3 0/2] ibmvnic: Bug fixes for queue descriptor processing
Date: Tue,  1 Dec 2020 09:52:09 -0600
Message-Id: <1606837931-22676-1-git-send-email-tlfalcon@linux.ibm.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-12-01_07:2020-11-30,
 2020-12-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 suspectscore=1 bulkscore=0 spamscore=0
 adultscore=0 impostorscore=0 mlxlogscore=999 priorityscore=1501
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012010097
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
 netdev@vger.kernel.org, brking@linux.vnet.ibm.com, sukadev@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This series resolves a few issues in the ibmvnic driver's
RX buffer and TX completion processing. The first patch
includes memory barriers to synchronize queue descriptor
reads. The second patch fixes a memory leak that could
occur if the device returns a TX completion with an error
code in the descriptor, in which case the respective socket
buffer and other relevant data structures may not be freed
or updated properly.

v3: Correct length of Fixes tags, requested by Jakub Kicinski

v2: Provide more detailed comments explaining specifically what
    reads are being ordered, suggested by Michael Ellerman

Thomas Falcon (2):
  ibmvnic: Ensure that SCRQ entry reads are correctly ordered
  ibmvnic: Fix TX completion error handling

 drivers/net/ethernet/ibm/ibmvnic.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

-- 
1.8.3.1

