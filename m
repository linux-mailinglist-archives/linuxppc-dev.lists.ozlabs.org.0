Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8244040B114
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Sep 2021 16:39:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H85ZX2swJz3bj0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Sep 2021 00:39:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YOPGuu+H;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=hegdevasant@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=YOPGuu+H; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H85Yr6bmSz2xtS
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Sep 2021 00:38:24 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 18ED1Eo8032226;
 Tue, 14 Sep 2021 10:38:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=egmE0SQrsyahd0u1inUa1Wf6ceV/XNpWn2NUv0zw2k8=;
 b=YOPGuu+HkKLQYAAxyxmkD/ozvQRqc1j1GdP4BIYvfvTkZkA9t8+GPN5bfwn6nnMkc8wT
 pF+/KvrmPyy19BqlpgS0Gng3TasXHOPDxhfDjO87wlTEEnNR7okz5fDaf14VijazFyjh
 M1F9YjdNbD/mMXr2y6aGEUzN3AP71PvO59Fnsb8kZ0GEkwG0AvB1opwZaSA5G0rwygKU
 BJOMM3zmXSvvIhVwerr5Ryu2ChpsQ5JArrAnnGPFxwg92mkKhKbcILyMBRitPkanLSTi
 5U3zjS2XSAWcNAnG5L0kXsPCngJOcmB3nJJOig5TfsddF69TdVSwo7ymw0JAJHRABYoX Kg== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b2v8cjru7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Sep 2021 10:38:16 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18EEVWbx014968;
 Tue, 14 Sep 2021 14:38:14 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04fra.de.ibm.com with ESMTP id 3b0m39v4s5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Sep 2021 14:38:14 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 18EEXeux57344450
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 Sep 2021 14:33:40 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C1DEEA406B;
 Tue, 14 Sep 2021 14:38:11 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 14CC2A405B;
 Tue, 14 Sep 2021 14:38:10 +0000 (GMT)
Received: from hegdevasant.ibm.com (unknown [9.43.34.115])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 14 Sep 2021 14:38:09 +0000 (GMT)
From: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH trivial v2] powerpc/powernv/dump: Fix typo in comment
Date: Tue, 14 Sep 2021 20:08:02 +0530
Message-Id: <20210914143802.54325-1-hegdevasant@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: TcSDAuFvgwrGb3UUAgIVUJqWYXtrndXj
X-Proofpoint-ORIG-GUID: TcSDAuFvgwrGb3UUAgIVUJqWYXtrndXj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.687,Hydra:6.0.235,FMLib:17.0.607.475
 definitions=2020-10-13_15,2020-10-13_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 mlxlogscore=938 clxscore=1015
 impostorscore=0 adultscore=0 priorityscore=1501 suspectscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109140070
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
Cc: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>, joel@jms.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Signed-off-by: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
---
 arch/powerpc/platforms/powernv/opal-dump.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/powernv/opal-dump.c b/arch/powerpc/platforms/powernv/opal-dump.c
index 00c5a59d82d9..717d1d30ade5 100644
--- a/arch/powerpc/platforms/powernv/opal-dump.c
+++ b/arch/powerpc/platforms/powernv/opal-dump.c
@@ -419,7 +419,7 @@ void __init opal_platform_dump_init(void)
 	int rc;
 	int dump_irq;
 
-	/* ELOG not supported by firmware */
+	/* Dump not supported by firmware */
 	if (!opal_check_token(OPAL_DUMP_READ))
 		return;
 
-- 
2.31.1

