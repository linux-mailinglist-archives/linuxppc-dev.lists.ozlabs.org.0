Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B55373608ED
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Apr 2021 14:10:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FLdTb5KXQz3cB7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Apr 2021 22:10:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Su+YfmPD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Su+YfmPD; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FLdSv64Y5z30JD
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Apr 2021 22:10:07 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13FC2Sbp086505; Thu, 15 Apr 2021 08:09:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=mMPINFnXDEisgVDHiuKCEUfiCStJ7PqI/ecvCl27g50=;
 b=Su+YfmPDRo2P8MCDrRYhWuRyNQ8bKNDZRpuNglNTUaegzZe2H6qNAG2xVUHGVs1bEigo
 IQ6oIQ3dGVKIZDeL8J5LvCnZUlTYbkaWouqO1El8g+sx2LSVLFUHzPdn0S1Xu6KnWpVf
 F/3ZB87FSH7qOUd5IJslxrZyPr9SmpxSEriPBpsEKyFX+YMWGVdIOGr0MjqCkN512B/J
 rfzOuxkWV+Ic1duSOwUZooQSSyZ4XshCxOCmKQssvFhxdAw839HXPgnJmUH02fY9RRpl
 gO4seMxcG378VPmHNhKcYFtPCy2v3UQOprHNhBOqrsOQZIqumdrliCki0HzbJxFfzxMF lg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37x4dkrwrw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Apr 2021 08:09:52 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13FC388l091932;
 Thu, 15 Apr 2021 08:09:51 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37x4dkrwr6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Apr 2021 08:09:51 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13FC8cHJ014725;
 Thu, 15 Apr 2021 12:09:49 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04ams.nl.ibm.com with ESMTP id 37u3n8uv54-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Apr 2021 12:09:49 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13FC9k3K46530924
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 15 Apr 2021 12:09:46 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C6CFAA4054;
 Thu, 15 Apr 2021 12:09:46 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 212C9A405B;
 Thu, 15 Apr 2021 12:09:44 +0000 (GMT)
Received: from saptagiri.in.ibm.com (unknown [9.85.74.6])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 15 Apr 2021 12:09:43 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 2/3] Revert "powerpc/topology: Update topology_core_cpumask"
Date: Thu, 15 Apr 2021 17:39:33 +0530
Message-Id: <20210415120934.232271-3-srikar@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210415120934.232271-1-srikar@linux.vnet.ibm.com>
References: <20210415120934.232271-1-srikar@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 88NmlV0E-O5GBppjdh40PKitS_vB5WI2
X-Proofpoint-ORIG-GUID: 5jxpv2QamY_ZWJFi5vBiK3scZMMr0UxP
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-15_04:2021-04-15,
 2021-04-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 phishscore=0 clxscore=1015 suspectscore=0
 adultscore=0 spamscore=0 lowpriorityscore=0 mlxlogscore=999
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104150081
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 Gautham R Shenoy <ego@linux.vnet.ibm.com>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Valentin Schneider <valentin.schneider@arm.com>, qemu-ppc@nongnu.org,
 Cedric Le Goater <clg@kaod.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Ingo Molnar <mingo@kernel.org>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Now that cpu_core_mask has been reintroduced, lets revert
commit 4bce545903fa ("powerpc/topology: Update topology_core_cpumask")

Post this commit, lscpu should reflect topologies as requested by a user
when a QEMU instance is launched with NUMA spanning multiple sockets.

Cc: linuxppc-dev@lists.ozlabs.org
Cc: qemu-ppc@nongnu.org
Cc: Cedric Le Goater <clg@kaod.org>
Cc: David Gibson <david@gibson.dropbear.id.au>
Cc: Nathan Lynch <nathanl@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Valentin Schneider <valentin.schneider@arm.com>
Cc: Gautham R Shenoy <ego@linux.vnet.ibm.com>
Reported-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
---
 arch/powerpc/include/asm/topology.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/topology.h b/arch/powerpc/include/asm/topology.h
index 3beeb030cd78..e4db64c0e184 100644
--- a/arch/powerpc/include/asm/topology.h
+++ b/arch/powerpc/include/asm/topology.h
@@ -126,7 +126,7 @@ static inline int cpu_to_coregroup_id(int cpu)
 #define topology_physical_package_id(cpu)	(cpu_to_chip_id(cpu))
 
 #define topology_sibling_cpumask(cpu)	(per_cpu(cpu_sibling_map, cpu))
-#define topology_core_cpumask(cpu)	(cpu_cpu_mask(cpu))
+#define topology_core_cpumask(cpu)	(per_cpu(cpu_core_map, cpu))
 #define topology_core_id(cpu)		(cpu_to_core_id(cpu))
 
 #endif
-- 
2.25.1

