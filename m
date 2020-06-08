Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8201F1701
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Jun 2020 12:54:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49gVVt4fDpzDqML
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Jun 2020 20:54:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bharata@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49gVPW3Gl9zDqQr
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Jun 2020 20:49:34 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 058AWZK7042274
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 8 Jun 2020 06:49:32 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31g59ra65x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Jun 2020 06:49:32 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 058AWeQ5042676
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 8 Jun 2020 06:49:31 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31g59ra64m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Jun 2020 06:49:31 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 058AjG06030540;
 Mon, 8 Jun 2020 10:49:30 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03ams.nl.ibm.com with ESMTP id 31g2s7usck-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Jun 2020 10:49:29 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 058AnRVB2949554
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 8 Jun 2020 10:49:27 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2C8914C04E;
 Mon,  8 Jun 2020 10:49:27 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 30D464C040;
 Mon,  8 Jun 2020 10:49:26 +0000 (GMT)
Received: from bharata.ibmuc.com (unknown [9.199.48.183])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  8 Jun 2020 10:49:26 +0000 (GMT)
From: Bharata B Rao <bharata@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH v0 2/4] powerpc/prom_init: Ask for Radix GTSE only if
 supported.
Date: Mon,  8 Jun 2020 16:19:07 +0530
Message-Id: <20200608104909.14350-3-bharata@linux.ibm.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200608104909.14350-1-bharata@linux.ibm.com>
References: <20200608104909.14350-1-bharata@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-08_07:2020-06-08,
 2020-06-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0
 impostorscore=0 clxscore=1015 adultscore=0 spamscore=0 phishscore=0
 malwarescore=0 mlxlogscore=999 cotscore=-2147483648 bulkscore=0
 suspectscore=1 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006080077
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
Cc: aneesh.kumar@linux.ibm.com, npiggin@gmail.com,
 Bharata B Rao <bharata@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In the case of radix, don't ask for GTSE by default but ask
only if GTSE is enabled.

Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
---
 arch/powerpc/kernel/prom_init.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_init.c
index 5f15b10eb007..16dd14f58ba6 100644
--- a/arch/powerpc/kernel/prom_init.c
+++ b/arch/powerpc/kernel/prom_init.c
@@ -1336,12 +1336,15 @@ static void __init prom_check_platform_support(void)
 		}
 	}
 
-	if (supported.radix_mmu && supported.radix_gtse &&
-	    IS_ENABLED(CONFIG_PPC_RADIX_MMU)) {
-		/* Radix preferred - but we require GTSE for now */
-		prom_debug("Asking for radix with GTSE\n");
+	if (supported.radix_mmu && IS_ENABLED(CONFIG_PPC_RADIX_MMU)) {
+		/* Radix preferred - Check if GTSE is also supported */
+		prom_debug("Asking for radix\n");
 		ibm_architecture_vec.vec5.mmu = OV5_FEAT(OV5_MMU_RADIX);
-		ibm_architecture_vec.vec5.radix_ext = OV5_FEAT(OV5_RADIX_GTSE);
+		if (supported.radix_gtse)
+			ibm_architecture_vec.vec5.radix_ext =
+					OV5_FEAT(OV5_RADIX_GTSE);
+		else
+			prom_debug("Radix GTSE isn't supported\n");
 	} else if (supported.hash_mmu) {
 		/* Default to hash mmu (if we can) */
 		prom_debug("Asking for hash\n");
-- 
2.21.3

