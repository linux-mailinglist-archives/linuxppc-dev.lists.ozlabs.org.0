Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A5AFF363761
	for <lists+linuxppc-dev@lfdr.de>; Sun, 18 Apr 2021 21:43:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FNgNB4jXGz3bxp
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 05:43:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ltNUX/vo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ltNUX/vo; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FNgMk65Htz2xfp
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Apr 2021 05:42:41 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13IJXMAp058465; Sun, 18 Apr 2021 15:42:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : content-type : date : content-transfer-encoding :
 mime-version; s=pp1; bh=1L9M3MBvLYPTpjSJpnK/SmAcOxfoJFoBng0cr61AYJk=;
 b=ltNUX/vo3FQqkJDY4jngxFT3TiHiKOQ6EBj9VeRQtAOPPqjRO8sWH0uQB3ZLwFxNL+Vh
 DxkwqxrWNOYVYRWa6fAL47av+liHRCWmdETd5ZziGgrk//FKRZJNN5ZrAYuA7pzYdffL
 QrB4HlSxE3xdyG08Zw2HuQmjRG93Q5ucHmNeyHY8p+pgyXpdx6PzXaBh9xMOHeyxDk9e
 /53hYBolHnDn134EGHJED515yB3TxhNH8ztlwqy9HlndM1q81qAxxrbCcNaR+WTbSCit
 jXK3g24nlWZPF9V9Mt6sk5XGkLpasNlyXyA8d5jqY9SPZR8VvpM6sOeTYcK8ysVGfq17 nQ== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 380d883mtu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 18 Apr 2021 15:42:30 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13IJcfBP016892;
 Sun, 18 Apr 2021 19:42:30 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma05wdc.us.ibm.com with ESMTP id 37yqa8mevq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 18 Apr 2021 19:42:30 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13IJgTL68389014
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 18 Apr 2021 19:42:29 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 48BFE112064;
 Sun, 18 Apr 2021 19:42:29 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 95C7B11206B;
 Sun, 18 Apr 2021 19:42:28 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.85.149.131])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Sun, 18 Apr 2021 19:42:28 +0000 (GMT)
Message-ID: <08511c1e92ac239f20ac88c73c59d1f8cf02e6ad.camel@linux.ibm.com>
Subject: [PATCH] Documentation/powerpc: Add proper links for manual and tests
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 18 Apr 2021 12:29:42 -0700
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: nF4KemfJDei3fNcvZiqcBdwIHa71nk1h
X-Proofpoint-GUID: nF4KemfJDei3fNcvZiqcBdwIHa71nk1h
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-18_12:2021-04-16,
 2021-04-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=925
 mlxscore=0 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 phishscore=0 spamscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104180138
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
Cc: abali@us.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


The links that are mentioned in this document are no longer
valid. So changed the proper links for NXGZIP user manual and
test cases.

Signed-off-by: Haren Myneni <haren@linux.ibm.com>
Reported-by: Bulent Abali <abali@us.ibm.com>
---
 Documentation/powerpc/vas-api.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/powerpc/vas-api.rst b/Documentation/powerpc/vas-api.rst
index 90c50ed839f3..bdb50fed903e 100644
--- a/Documentation/powerpc/vas-api.rst
+++ b/Documentation/powerpc/vas-api.rst
@@ -254,7 +254,7 @@ using this window. the signal will be issued to the thread group leader
 signals.
 
 NX-GZIP User's Manual:
-https://github.com/libnxz/power-gzip/blob/master/power_nx_gzip_um.pdf
+https://github.com/libnxz/power-gzip/blob/master/doc/power_nx_gzip_um.pdf
 
 Simple example
 ==============
@@ -301,5 +301,5 @@ Simple example
 			close(fd) or window can be closed upon process exit
 		}
 
-	Refer https://github.com/abalib/power-gzip for tests or more
+	Refer https://github.com/libnxz/power-gzip for tests or more
 	use cases.
-- 
2.26.2


