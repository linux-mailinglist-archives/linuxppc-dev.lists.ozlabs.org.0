Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D2854E9D8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jun 2022 21:12:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LPBcw6gj0z3c9D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jun 2022 05:12:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kI1Fd0XS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kI1Fd0XS;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LPBcD5wPpz2xgX
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jun 2022 05:11:40 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25GHvN52015313;
	Thu, 16 Jun 2022 19:11:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=Gi4D21+TGtq8NM9IhuW3KnTyLPDV0Qd0GHT/kz34hrY=;
 b=kI1Fd0XS5NLrN1CuW6nXGnjcDceRRPBDil57+58wMPpANPS8yMDtVv8l/UPF+B7ksXDZ
 e6ZuBcHRlXNHlLOGMTVY6NW+SW9jlOoisuCNyj/eKk+WtbjbUYmvyJ+TzmXDU0XkhsKY
 qdmtVUbM6V0evzb1J/fgnxkYPolo/5IGDMy7p13IBU36VV7Q+I2FZ9YmNadYnb3picdQ
 Rf8Y6vIhxnZHbLR/vu/+u6Qtnm8HAV8wAodq5iWuY6cgX+uvTvQ7OYBLYPRGmaMzSdxZ
 bx2QrlJykBJ1wicgP25NoXuly/5PuJzb6sFt8Q8VJvIsGPUOobrTe/mbUG4hQ9nWoZzE +w== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.10])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gqhbdqh8v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Jun 2022 19:11:35 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
	by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25GJ5ijE014083;
	Thu, 16 Jun 2022 19:11:35 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
	by ppma02dal.us.ibm.com with ESMTP id 3gmjpamjug-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Jun 2022 19:11:34 +0000
Received: from b03ledav002.gho.boulder.ibm.com (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
	by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 25GJBXhA27984154
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 Jun 2022 19:11:33 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 78B59136055;
	Thu, 16 Jun 2022 19:11:33 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2C342136053;
	Thu, 16 Jun 2022 19:11:32 +0000 (GMT)
Received: from li-37e927cc-2b02-11b2-a85c-931637a79255.ibm.com.com (unknown [9.160.59.133])
	by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
	Thu, 16 Jun 2022 19:11:31 +0000 (GMT)
From: Tyrel Datwyler <tyreld@linux.ibm.com>
To: james.bottomley@hansenpartnership.com
Subject: [PATCH] ibmvfc: multiqueue bug fixes
Date: Thu, 16 Jun 2022 12:11:24 -0700
Message-Id: <20220616191126.1281259-1-tyreld@linux.ibm.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: OuC6Z17xocPFoGl6bUNTJgnPPSSq_d0k
X-Proofpoint-GUID: OuC6Z17xocPFoGl6bUNTJgnPPSSq_d0k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-16_16,2022-06-16_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=480 spamscore=0 impostorscore=0 suspectscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206160077
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, martin.petersen@oracle.com, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, brking@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fixes for a couple observed crashes of the ibmvfc driver when in MQ mode.

Tyrel Datwyler (2):
  ibmvfc: store vhost pointer during subcrq allocation
  ibmvfc: alloc/free queue resource only during probe/remove

 drivers/scsi/ibmvscsi/ibmvfc.c | 82 ++++++++++++++++++++++++++--------
 drivers/scsi/ibmvscsi/ibmvfc.h |  2 +-
 2 files changed, 65 insertions(+), 19 deletions(-)

-- 
2.35.3

