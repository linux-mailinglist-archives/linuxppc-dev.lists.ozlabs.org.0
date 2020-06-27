Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4296C20BF1E
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jun 2020 09:03:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49v4Tm4jlYzDrBp
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jun 2020 17:03:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49v4SF6rcVzDqwB
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jun 2020 17:02:05 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05R6dihe064474; Sat, 27 Jun 2020 03:01:58 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31vx92pen6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 27 Jun 2020 03:01:58 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05R6jjbE086489;
 Sat, 27 Jun 2020 03:01:57 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31vx92pemp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 27 Jun 2020 03:01:57 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05R70IsA025609;
 Sat, 27 Jun 2020 07:01:56 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma03wdc.us.ibm.com with ESMTP id 31wwr7s1ey-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 27 Jun 2020 07:01:56 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05R71ux714418554
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 27 Jun 2020 07:01:56 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 286ED28059;
 Sat, 27 Jun 2020 07:01:56 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 17DC128058;
 Sat, 27 Jun 2020 07:01:54 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.79.210.117])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Sat, 27 Jun 2020 07:01:53 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH 1/2] powerpc/mm/book3s54/pkeys: make pkey access check work on
 execute_only_key
Date: Sat, 27 Jun 2020 12:31:46 +0530
Message-Id: <20200627070147.297535-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-27_03:2020-06-26,
 2020-06-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 lowpriorityscore=0 mlxlogscore=935 clxscore=1015 impostorscore=0
 phishscore=0 spamscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 cotscore=-2147483648 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006270045
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
 Jan Stancek <jstancek@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

pkey_access_permitted() should not check for pkey is available in UAMOR or not.
The kernel needs to do that check only while allocating keys. This also makes
sure execute_only_key which is marked as non-manageable via UAMOR gives the
right access check return w.r.t pkey_access_permitted().

This fix the page fault loop when using PROT_EXEC as below

addr = mmap(0, page_sz, PROT_EXEC, MAP_FILE | MAP_PRIVATE, fildes, 0);
x =  *addr);

Fixes: c46241a370a6 ("powerpc/pkeys: Check vma before returning key fault error to the user")

Reported-by: Jan Stancek <jstancek@redhat.com>
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/mm/book3s64/pkeys.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/pkeys.c b/arch/powerpc/mm/book3s64/pkeys.c
index 1199fc2bfaec..ca5fcb4bff32 100644
--- a/arch/powerpc/mm/book3s64/pkeys.c
+++ b/arch/powerpc/mm/book3s64/pkeys.c
@@ -353,9 +353,6 @@ static bool pkey_access_permitted(int pkey, bool write, bool execute)
 	int pkey_shift;
 	u64 amr;
 
-	if (!is_pkey_enabled(pkey))
-		return true;
-
 	pkey_shift = pkeyshift(pkey);
 	if (execute && !(read_iamr() & (IAMR_EX_BIT << pkey_shift)))
 		return true;
-- 
2.26.2

