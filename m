Return-Path: <linuxppc-dev+bounces-7036-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1687CA6086E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Mar 2025 06:46:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZDYJp3BBbz3cY0;
	Fri, 14 Mar 2025 16:46:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741931194;
	cv=none; b=iPjXbTQo3jis+uKnc/gwMksgdpHkAYbZPOBb8F7u3nwTIxEv61i27NuulGmNq33NdmN358McHnBAfD5w6nqLhjD8ob7SgHaWkQiX+Z61+a/lU4omy5Wr/JK9ivA30tP0rAx/AszJX95rWaVdNlKPb6aJ3t9bEFrhkkNmcR81nSyGEzf573pzQ0xJgLk/dVFDXhjR9ziBuYQ7J73fbECXbqJN9H/+GZ8Q3+HHthxwa7Kn3zV7XarwFrmjPsG+CSV064ozHecP7WhNAih2w4dJAXP4MKXI3HbTVWxuEnxXXeakc4jwVsw5PpN3TnVfh9li8f+tdA/dDLRUz750Cn/o7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741931194; c=relaxed/relaxed;
	bh=MwVYPr7/JahDzLEPr39TM/CoUV6AsGze/brxnTHHiOc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oNpvEB4Zww/Af/Dy2vKrcZF7caiYSayFZOdQWwjwfEJSmrGz99thH2t70A58fwSxMKMM0/DbBJtDYytDfpy5UUL7NplVRTDMIKGwJyDyM+vUf8S5qsoiLEnhoKozmFdT03CDWEhygfYttXZUiAPQvOl1/qZy0SXgwFcEZ8Qx7S92hKmcGz4X1PQT/hdYdQFvtZhXv9lphKWSW8HljsgRjgU8sTuArqUhhcFX/cMR5/fHmQYrgjvGlGnGmcMXY8SDgy3Of4KDwxtkFNU4GF4hltwrz3HB60FYTwOqbhnW8QYp5TvCXhSIPzL5uPt1CqIL09C4Ba1pfk+7OzSjIcskQA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JPQjRw5j; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JPQjRw5j;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZDYJn5H82z30gC
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Mar 2025 16:46:33 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52DNOvdH018074;
	Fri, 14 Mar 2025 05:46:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=MwVYPr7/JahDzLEPr
	39TM/CoUV6AsGze/brxnTHHiOc=; b=JPQjRw5jyIo4LSnDe/LgzhDwKHRnx4z50
	dyexkfSR1fKYyCykGfHAesfKQcoI6OYleyIDfDK/xJtzwgEvRirc/vGSHlbG+RG8
	o+Fo2hX4vDEs/PW3jNW8xmLb64OfCHoUk3EaXeSzO2iqd5l4iYTno2BEN2maI3zU
	fUOIBUkbk730FTQvyDoxXKXzGcyyQWw+I7TdIx+0p2XTrjB5OcR4nD/nWndJqkdU
	cLzsMVsBkO/PxXSWaxLVZzvNTGOWF761ddLbNtZIb5RyPGpXFb/imszeOJDMVpz3
	3Kw479VuyCzYMex9a+HRKxbR08fHyBVMqDzyrYMpSxUmlhwiAY5Og==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45c0srbwd0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Mar 2025 05:46:23 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52E5f4nA002102;
	Fri, 14 Mar 2025 05:46:22 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45c0srbwcu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Mar 2025 05:46:22 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52E4OnoG012359;
	Fri, 14 Mar 2025 05:46:21 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 45atsrne45-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Mar 2025 05:46:21 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 52E5kHk455116166
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Mar 2025 05:46:17 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 92D762004B;
	Fri, 14 Mar 2025 05:46:17 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 362D820043;
	Fri, 14 Mar 2025 05:46:14 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.39.22.126])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 14 Mar 2025 05:46:13 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Cc: sshegde@linux.ibm.com, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        mpe@ellerman.id.au, peterz@infradead.org, fbarrat@linux.ibm.com,
        ajd@linux.ibm.com, mahesh@linux.ibm.com, oohall@gmail.com,
        hbathini@linux.ibm.com, dhowells@redhat.com, haren@linux.ibm.com,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/6] powerpc: fadump: use lock guard for mutex
Date: Fri, 14 Mar 2025 11:15:41 +0530
Message-ID: <20250314054544.1998928-4-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250314054544.1998928-1-sshegde@linux.ibm.com>
References: <20250314054544.1998928-1-sshegde@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: cn0oyIPr0nPtp64hNPcm0nsDHxubdUR8
X-Proofpoint-GUID: GZb7snCNZ99lih3uHAJ8kU9CscgD49pH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_01,2025-03-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 phishscore=0 mlxlogscore=684 mlxscore=0 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503140041
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

use guard(mutex) for scope based resource management of mutex.
This would make the code simpler and easier to maintain.

More details on lock guards can be found at
https://lore.kernel.org/all/20230612093537.614161713@infradead.org/T/#u

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
 arch/powerpc/kernel/fadump.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index 4b371c738213..5fd2c546fd8c 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -1374,15 +1374,13 @@ static void fadump_free_elfcorehdr_buf(void)
 
 static void fadump_invalidate_release_mem(void)
 {
-	mutex_lock(&fadump_mutex);
+	guard(mutex)(&fadump_mutex);
+
 	if (!fw_dump.dump_active) {
-		mutex_unlock(&fadump_mutex);
 		return;
 	}
 
 	fadump_cleanup();
-	mutex_unlock(&fadump_mutex);
-
 	fadump_free_elfcorehdr_buf();
 	fadump_release_memory(fw_dump.boot_mem_top, memblock_end_of_DRAM());
 	fadump_free_cpu_notes_buf();
-- 
2.39.3


