Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B255F2D1D5C
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Dec 2020 23:34:28 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CqdQl5clPzDqZ2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Dec 2020 09:34:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=CC/iRUNI; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CqcVB4xK7zDqVc
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Dec 2020 08:52:18 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B7LRq2R118635
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 7 Dec 2020 16:52:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=lb0Qnm83Wxiw6eRQIVQKLABdb6GCiJbrB2q/CsL7Yfk=;
 b=CC/iRUNISWOLUPc2H1rResZM8E8JzfqN/CHFx5I9EOgmeFKj7KCIjxxMc06Wrcc7jpHB
 Omd1prt8uUL3IOkVqLo/L7jiRZKC8YO1ehro6fpDc3nJCpkMqZ71wGsfdj3EgIHtgOy9
 hK7UnMJPa+9WuyxaaAG3f0bks1RU5a2oVI/dEQuFRvVZJLjQcnN2DGq/8x6YtzFrAvsw
 8jevwamC0UQY+gPjLFig1Rk1GtNlbWa/AVq0n4IIf1NHnYguMtx5b8Uc6HZpU9DmU4lu
 bnbnyHQmSnuECR5PbUWDXA+s3SXyhV8ZY1GWYrjq4jw3NaLNOzJTtNgifoPZBcQ/oaif 8A== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 359s0h6c2x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Dec 2020 16:52:16 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B7Lkwvn026721
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 7 Dec 2020 21:52:15 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma04dal.us.ibm.com with ESMTP id 3581u97qps-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Dec 2020 21:52:15 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B7LqFBF18678494
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 7 Dec 2020 21:52:15 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ECBB1AC059;
 Mon,  7 Dec 2020 21:52:14 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BE782AC05F;
 Mon,  7 Dec 2020 21:52:14 +0000 (GMT)
Received: from localhost (unknown [9.160.57.67])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon,  7 Dec 2020 21:52:14 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 19/28] powerpc/pseries/hibernation: remove
 pseries_suspend_cpu()
Date: Mon,  7 Dec 2020 15:51:51 -0600
Message-Id: <20201207215200.1785968-20-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201207215200.1785968-1-nathanl@linux.ibm.com>
References: <20201207215200.1785968-1-nathanl@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-07_16:2020-12-04,
 2020-12-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=1 mlxlogscore=738 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012070132
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
Cc: tyreld@linux.ibm.com, ajd@linux.ibm.com, mmc@linux.vnet.ibm.com,
 cforno12@linux.vnet.ibm.com, drt@linux.vnet.ibm.com, brking@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Since commit 48f6e7f6d948 ("powerpc/pseries: remove cede offline state
for CPUs"), ppc_md.suspend_disable_cpu() is no longer used and all
CPUs (save one) are placed into true offline state as opposed to
H_JOIN. So pseries_suspend_cpu() is effectively unused; remove it.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/suspend.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/suspend.c b/arch/powerpc/platforms/pseries/suspend.c
index 232621f33510..3315d698d5ab 100644
--- a/arch/powerpc/platforms/pseries/suspend.c
+++ b/arch/powerpc/platforms/pseries/suspend.c
@@ -48,20 +48,6 @@ static int pseries_suspend_begin(u64 stream_id)
 		       vasi_state);
 		return -EIO;
 	}
-
-	return 0;
-}
-
-/**
- * pseries_suspend_cpu - Suspend a single CPU
- *
- * Makes the H_JOIN call to suspend the CPU
- *
- **/
-static int pseries_suspend_cpu(void)
-{
-	if (atomic_read(&suspending))
-		return rtas_suspend_cpu(&suspend_data);
 	return 0;
 }
 
@@ -235,7 +221,6 @@ static int __init pseries_suspend_init(void)
 	if ((rc = pseries_suspend_sysfs_register(&suspend_dev)))
 		return rc;
 
-	ppc_md.suspend_disable_cpu = pseries_suspend_cpu;
 	ppc_md.suspend_enable_irqs = pseries_suspend_enable_irqs;
 	suspend_set_ops(&pseries_suspend_ops);
 	return 0;
-- 
2.28.0

