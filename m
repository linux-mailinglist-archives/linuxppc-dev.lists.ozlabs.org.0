Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6F630D046
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 01:30:13 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DVjJ16gr3zDsTc
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 11:30:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=hP04/WPK; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DVJwT2GWGzDqLS
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Feb 2021 20:11:53 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 11292slu050308; Tue, 2 Feb 2021 04:11:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=bO/J8KO0Y6M7dbQYI0HBH4UTuaZJG339aOghTQVdT/k=;
 b=hP04/WPKRkzbFIQws9M0QuIjh5BEAzbZciaMZoI76+ph4YNOuTZw9Pr/95PPuCW3iMFP
 NiOhuYB0lc4315vO+lOMQXX5EBOLLteRM5FXflg7XuekMsakgtDo7l/LtJWNHzzLuLGN
 YsFXrEkNjRGP2m2YUFW1SexfO7WOutyGqcvaOd5RKN6h0BlQFpyQU5HbzRbYKl9ByWtx
 aQ+n+NuPy6e1z2Bi3sv33cwdd3IPWQhbwHosGJ7TfLNiiDOQhGSjMNrGVNKzkvOzsHbx
 PHGFP2YCzaa+HgowcwqVUqI/V9xKg/p74HcjJXeUIMlrZr7tSfUE73Hec8nLgQcv212H MQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36f3hhrm9w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Feb 2021 04:11:44 -0500
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 11293C3W051339;
 Tue, 2 Feb 2021 04:11:44 -0500
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36f3hhrm9f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Feb 2021 04:11:44 -0500
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11299YZC025260;
 Tue, 2 Feb 2021 09:11:43 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma01wdc.us.ibm.com with ESMTP id 36eyuchcsh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Feb 2021 09:11:43 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1129BgIw26411294
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 2 Feb 2021 09:11:42 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8FE4D28058;
 Tue,  2 Feb 2021 09:11:42 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6AF8A28059;
 Tue,  2 Feb 2021 09:11:39 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.199.35.92])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  2 Feb 2021 09:11:39 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org
Subject: [RFC PATCH 6/6] powerpc/mm: Enable move pmd/pud
Date: Tue,  2 Feb 2021 14:41:16 +0530
Message-Id: <20210202091116.196134-6-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210202091116.196134-1-aneesh.kumar@linux.ibm.com>
References: <20210202091116.196134-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-02_04:2021-01-29,
 2021-02-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 mlxscore=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102020059
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
Cc: peterz@infradead.org, kaleshsingh@google.com,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, joel@joelfernandes.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

mremap HAVE_MOVE_PMD/PUD optimization time comparison for 1GB region:
1GB mremap - Source PTE-aligned, Destination PTE-aligned
        mremap time:      1114318ns
1GB mremap - Source PMD-aligned, Destination PMD-aligned
        mremap time:      1097715ns
1GB mremap - Source PUD-aligned, Destination PUD-aligned
        mremap time:        26851ns

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/platforms/Kconfig.cputype | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
index 3ce907523b1e..2e666e569fdf 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -97,6 +97,8 @@ config PPC_BOOK3S_64
 	select PPC_HAVE_PMU_SUPPORT
 	select SYS_SUPPORTS_HUGETLBFS
 	select HAVE_ARCH_TRANSPARENT_HUGEPAGE
+	select HAVE_MOVE_PMD
+	select HAVE_MOVE_PUD
 	select ARCH_ENABLE_THP_MIGRATION if TRANSPARENT_HUGEPAGE
 	select ARCH_SUPPORTS_NUMA_BALANCING
 	select IRQ_WORK
-- 
2.29.2

