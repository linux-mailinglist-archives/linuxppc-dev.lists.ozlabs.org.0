Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC613F6E70
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Aug 2021 06:26:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GvXwQ2QpHz2yWG
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Aug 2021 14:25:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=atbj+tZO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=atbj+tZO; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GvXvd4Rfdz2xxn
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Aug 2021 14:25:16 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17P45bfQ176035; Wed, 25 Aug 2021 00:24:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=RZ1uIbuxfzIzbnGOm+nWbAoArO5aFmFS2Ua/vLkzoiw=;
 b=atbj+tZO8Hcg3StO3CZ/T8m4Fq8zvIyQlNeAu4vm1nUwvRD83lHLwDv5MwNC3PRCpUHJ
 BBsZlkfjotNXQX7/OlPgJIOZXIo/KI4TQ/7Hae3Jj0Tod4EjT9VUj6YPhNTsCvKLiKBg
 5qMuJ+l4G0equzTgtXG/6Fs4RWvWbXnuu2jUn8mJL8EjjlQGdJrnZ25cmDJw7EhoDRiu
 mwrKI/PSFbwJhSToO1bQ8uFA8QCwC8Aja+/nd+z8kwTYg0phFaFb5SN1pr/M8dlpg4YA
 OPE0Ip0/1ckUdN680tnisWslnBJnGtAOKeCo3z6t/lB4LIG8WCOGu0IN7NU1tk4m72ps pg== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3anebkrqj7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Aug 2021 00:24:58 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17P4NIf8021182;
 Wed, 25 Aug 2021 04:24:57 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma03dal.us.ibm.com with ESMTP id 3ajs4dxy69-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Aug 2021 04:24:57 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17P4Otua40829224
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 25 Aug 2021 04:24:55 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CBCFA78068;
 Wed, 25 Aug 2021 04:24:55 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 352677805E;
 Wed, 25 Aug 2021 04:24:53 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.43.51.106])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 25 Aug 2021 04:24:52 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH] powerpc/doc: Fix htmldocs errors
Date: Wed, 25 Aug 2021 09:54:47 +0530
Message-Id: <20210825042447.106219-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: cEXAARAlou_jeEb3w5KlsLrv96xy29TA
X-Proofpoint-ORIG-GUID: cEXAARAlou_jeEb3w5KlsLrv96xy29TA
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-25_01:2021-08-25,
 2021-08-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999
 impostorscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 mlxscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108250023
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>, Jonathan Corbet <corbet@lwn.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fix make htmldocs related errors with the newly added associativity.rst
doc file.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 Documentation/powerpc/associativity.rst | 29 +++++++++++++------------
 Documentation/powerpc/index.rst         |  1 +
 2 files changed, 16 insertions(+), 14 deletions(-)

diff --git a/Documentation/powerpc/associativity.rst b/Documentation/powerpc/associativity.rst
index 07e7dd3d6c87..4d01c7368561 100644
--- a/Documentation/powerpc/associativity.rst
+++ b/Documentation/powerpc/associativity.rst
@@ -1,6 +1,6 @@
 ============================
 NUMA resource associativity
-=============================
+============================
 
 Associativity represents the groupings of the various platform resources into
 domains of substantially similar mean performance relative to resources outside
@@ -20,11 +20,11 @@ A value of 1 indicates the usage of Form 1 associativity. For Form 2 associativi
 bit 2 of byte 5 in the "ibm,architecture-vec-5" property is used.
 
 Form 0
------
+------
 Form 0 associativity supports only two NUMA distances (LOCAL and REMOTE).
 
 Form 1
------
+------
 With Form 1 a combination of ibm,associativity-reference-points, and ibm,associativity
 device tree properties are used to determine the NUMA distance between resource groups/domains.
 
@@ -78,17 +78,18 @@ numa-lookup-index-table.
 
 For ex:
 ibm,numa-lookup-index-table = <3 0 8 40>;
-ibm,numa-distace-table = <9>, /bits/ 8 < 10  20  80
-					 20  10 160
-					 80 160  10>;
-  | 0    8   40
---|------------
-  |
-0 | 10   20  80
-  |
-8 | 20   10  160
-  |
-40| 80   160  10
+ibm,numa-distace-table = <9>, /bits/ 8 < 10  20  80 20  10 160 80 160  10>;
+
+::
+
+	  | 0    8   40
+	--|------------
+	  |
+	0 | 10   20  80
+	  |
+	8 | 20   10  160
+	  |
+	40| 80   160  10
 
 A possible "ibm,associativity" property for resources in node 0, 8 and 40
 
diff --git a/Documentation/powerpc/index.rst b/Documentation/powerpc/index.rst
index bf5f1a2bdbdf..0f7d3c495693 100644
--- a/Documentation/powerpc/index.rst
+++ b/Documentation/powerpc/index.rst
@@ -7,6 +7,7 @@ powerpc
 .. toctree::
     :maxdepth: 1
 
+    associativity
     booting
     bootwrapper
     cpu_families
-- 
2.31.1

