Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4943B22DF76
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Jul 2020 15:28:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BF3f655WSzDvrL
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Jul 2020 23:27:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BF3bH0PgszDqcG
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Jul 2020 23:25:30 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06QD2OZn161646; Sun, 26 Jul 2020 09:25:24 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32gevpuu6u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 26 Jul 2020 09:25:24 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06QDLCoJ015079;
 Sun, 26 Jul 2020 13:25:23 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma01dal.us.ibm.com with ESMTP id 32gcy2mfta-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 26 Jul 2020 13:25:23 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06QDPIve4719130
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 26 Jul 2020 13:25:18 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DF5E113605D;
 Sun, 26 Jul 2020 13:25:21 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6149D13604F;
 Sun, 26 Jul 2020 13:25:20 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.199.32.81])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Sun, 26 Jul 2020 13:25:20 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v2] powerpc/book3s64/pkey: Disable pkey on POWER6 and before
Date: Sun, 26 Jul 2020 18:55:17 +0530
Message-Id: <20200726132517.399076-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-26_04:2020-07-24,
 2020-07-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 priorityscore=1501 mlxscore=0 suspectscore=0 adultscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 mlxlogscore=758 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007260096
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

POWER6 only support AMR update via privileged mode(MSR[PR] = 0, SPRN_AMR=29)
The PR=1 alias for that SPR (SPRN_AMR=13) was only supported
from POWER7. Since we don't allow userspace modifying of AMR value
we should disable pkey support on P6 and before.

The hypervisor will still report pkey support via ibm,processor-storage-keys.
Hence check for P7 CPU_FTR bit to decide on pkey support.

Fixes: a24204c30796 ("powerpc/book3s64/pkeys: kill cpu feature key CPU_FTR_PKEY")
Reported-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/mm/book3s64/pkeys.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/powerpc/mm/book3s64/pkeys.c b/arch/powerpc/mm/book3s64/pkeys.c
index 792b36aa9619..69a6b87f2bb4 100644
--- a/arch/powerpc/mm/book3s64/pkeys.c
+++ b/arch/powerpc/mm/book3s64/pkeys.c
@@ -73,6 +73,12 @@ static int scan_pkey_feature(void)
 	if (early_radix_enabled())
 		return 0;
 
+	/*
+	 * Only P7 and above supports SPRN_AMR update with MSR[PR] = 1
+	 */
+	if (!early_cpu_has_feature(CPU_FTR_ARCH_206))
+		return 0;
+
 	ret = of_scan_flat_dt(dt_scan_storage_keys, &pkeys_total);
 	if (ret == 0) {
 		/*
-- 
2.26.2

