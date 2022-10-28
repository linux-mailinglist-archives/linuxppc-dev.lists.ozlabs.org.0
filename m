Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1FE612656
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Oct 2022 01:02:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N0FLG2cJFz3cM0
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Oct 2022 10:02:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cJhca6Gg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=us.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ricklind@us.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cJhca6Gg;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MzZ9X67YPz3cG8
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Oct 2022 07:37:36 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29SKSkjI001555;
	Fri, 28 Oct 2022 20:37:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : subject :
 date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=a6Ke+InNOb0hHiYxtWxMzvHsUMhQt/dPk02a0Iq0wTE=;
 b=cJhca6Gg6NjFJJGsjIUAoSJuTzAoLiRVkc29ffv/D56Ma1eEzjbUa2WSB1XQ3SV6/VxB
 wyKPiytSN+bqYrx9rxXnj5GPvnOKH8//8HSVIVVDE3lkbzziOCNrq4jOYCYuufZ63IyH
 b4eBL2IFlx5XMizGqjdYOeHxu0YWiqh6eozNc8LbbBk+sH3Fht3uBTVYjY9kmBoIzOaE
 NBAM+QN+ArM73aJD/m/3WrB4g41S4M+Ql2FANZYb7Rg9nN4TiAqFC0m4SqHJV95cByoB
 P4Q8WDfetYm7nGNd0SUFUNj51FTWBrB9Yv8m8ZIszNa3Hf3AbCnLRQldKdg20qqpiuLY +A== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kgp57g7v5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Oct 2022 20:37:32 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
	by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29SKZLgp024431;
	Fri, 28 Oct 2022 20:37:31 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com [9.57.198.29])
	by ppma01dal.us.ibm.com with ESMTP id 3kfahyhcnd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Oct 2022 20:37:31 +0000
Received: from smtpav05.wdc07v.mail.ibm.com ([9.208.128.117])
	by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 29SKbTs58323664
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 28 Oct 2022 20:37:30 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3BB3A58043;
	Fri, 28 Oct 2022 20:37:29 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 91F4A58053;
	Fri, 28 Oct 2022 20:37:27 +0000 (GMT)
Received: from fledgling.ibm.com.com (unknown [9.160.37.48])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 28 Oct 2022 20:37:27 +0000 (GMT)
From: Rick Lindsley <ricklind@us.ibm.com>
To: haren@linux.ibm.com, nnac123@linux.ibm.com, danymadden@us.ibm.com,
        tlfalcon@linux.ibm.com, netdev@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] Change maintainers for vnic driver
Date: Fri, 28 Oct 2022 13:35:11 -0700
Message-Id: <20221028203509.4070154-1-ricklind@us.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: l9xRDQwx0DSlI-y0B2msHQY5G87vcuXy
X-Proofpoint-ORIG-GUID: l9xRDQwx0DSlI-y0B2msHQY5G87vcuXy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-28_10,2022-10-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 clxscore=1011 mlxlogscore=813 bulkscore=0 impostorscore=0 mlxscore=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2210280129
X-Mailman-Approved-At: Sun, 30 Oct 2022 09:56:23 +1100
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Changed maintainers for vnic driver, since Dany has new responsibilities.
Also added Nick Child as reviewer.

Signed-off-by: Rick Lindsley <ricklind@us.ibm.com>

---
 MAINTAINERS | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 10c1344b4473..d5a5e776febb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9775,7 +9775,10 @@ S:	Supported
 F:	drivers/pci/hotplug/rpaphp*
 
 IBM Power SRIOV Virtual NIC Device Driver
-M:	Dany Madden <drt@linux.ibm.com>
+M:	Haren Myneni <haren@linux.ibm.com>
+M:	Rick Lindsley <ricklind@linux.ibm.com>
+R:	Nick Child <nnac123@linux.ibm.com>
+R:	Dany Madden <danymadden@us.ibm.com>
 R:	Thomas Falcon <tlfalcon@linux.ibm.com>
 L:	netdev@vger.kernel.org
 S:	Supported
-- 
2.31.1

