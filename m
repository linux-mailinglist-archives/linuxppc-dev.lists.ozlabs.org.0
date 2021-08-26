Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C13BD3F8502
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Aug 2021 12:05:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GwJQ35gCMz2ymg
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Aug 2021 20:05:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=e4TJtNW8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=e4TJtNW8; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GwJNX7549z2xrt
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Aug 2021 20:04:28 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17QA2ZF2053443; Thu, 26 Aug 2021 06:04:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=xLz8FXEwpJ9bcIySCsKKt75xEZu76eq2hgNuhZzFT90=;
 b=e4TJtNW8TFw/uIVwW6VgtecDlluRYfKcOtTXYBs4X77eXnmSRgMUM70f4SsdbcD9rm1N
 sWLM+BjDb1a39Bzm9B1sEiPLGNYKT1mHqpWUPz2xV3NHdJji9/S8z36MAn9gn/ANfEpp
 EIXwYEjMFlKG5sTHImDILDlpZiL325g5l+wXHz29OowRC5B+VHJDBZVrr7NtdYTga8lA
 84dLx5lSCRiwp4YA2W1enwmOk7U+7F0Fm7uKNTf3dshUTmnNZRaIMYu4n8mV+aHiVZXZ
 X5jgFEfPSetyn/c57hIwQjxPJE7JYVkWz6cgVlnlJJLXbrdbQeI3lPsQ1/+L0985VX5a 2A== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ap7ayta2c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Aug 2021 06:04:17 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17QA2lIl004906;
 Thu, 26 Aug 2021 10:04:15 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06fra.de.ibm.com with ESMTP id 3ajrrhyp78-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Aug 2021 10:04:15 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 17QA0MHc54460918
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 26 Aug 2021 10:00:22 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D02E65206B;
 Thu, 26 Aug 2021 10:04:10 +0000 (GMT)
Received: from saptagiri.in.ibm.com (unknown [9.43.43.205])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id F2F045204F;
 Thu, 26 Aug 2021 10:04:07 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v2 1/3] powerpc/smp: Fix a crash while booting kvm guest with
 nr_cpus=2
Date: Thu, 26 Aug 2021 15:33:59 +0530
Message-Id: <20210826100401.412519-2-srikar@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210826100401.412519-1-srikar@linux.vnet.ibm.com>
References: <20210826100401.412519-1-srikar@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 8GqEj0E8FzZ37c2jKVZIFcwawlgnC52T
X-Proofpoint-GUID: 8GqEj0E8FzZ37c2jKVZIFcwawlgnC52T
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-26_02:2021-08-26,
 2021-08-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 adultscore=0 impostorscore=0 mlxlogscore=999 priorityscore=1501
 suspectscore=0 bulkscore=0 spamscore=0 phishscore=0 clxscore=1015
 mlxscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108260061
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
 Vincent Guittot <vincent.guittot@linaro.org>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Valentin Schneider <valentin.schneider@arm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Aneesh reported a crash with a fairly recent upstream kernel when
booting kernel whose commandline was appended with nr_cpus=2

1:mon> e
cpu 0x1: Vector: 300 (Data Access) at [c000000008a67bd0]
    pc: c00000000002557c: cpu_to_chip_id+0x3c/0x100
    lr: c000000000058380: start_secondary+0x460/0xb00
    sp: c000000008a67e70
   msr: 8000000000001033
   dar: 10
 dsisr: 80000
  current = 0xc00000000891bb00
  paca    = 0xc0000018ff981f80   irqmask: 0x03   irq_happened: 0x01
    pid   = 0, comm = swapper/1
Linux version 5.13.0-rc3-15704-ga050a6d2b7e8 (kvaneesh@ltc-boston8) (gcc (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0, GNU ld (GNU Binutils for Ubuntu) 2.34) #433 SMP Tue May 25 02:38:49 CDT 2021
1:mon> t
[link register   ] c000000000058380 start_secondary+0x460/0xb00
[c000000008a67e70] c000000008a67eb0 (unreliable)
[c000000008a67eb0] c0000000000589d4 start_secondary+0xab4/0xb00
[c000000008a67f90] c00000000000c654 start_secondary_prolog+0x10/0x14

Current code assumes that num_possible_cpus() is always greater than
threads_per_core. However this may not be true when using nr_cpus=2 or
similar options. Handle the case where num_possible_cpus() is not an
exact multiple of  threads_per_core.

Cc: linuxppc-dev@lists.ozlabs.org
Cc: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
Cc: Nathan Lynch <nathanl@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Valentin Schneider <valentin.schneider@arm.com>
Cc: Gautham R Shenoy <ego@linux.vnet.ibm.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>
Fixes: c1e53367dab1 ("powerpc/smp: Cache CPU to chip lookup")
Reported-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
Debugged-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
---
Changelog: v1 -> v2:
v1: - https://lore.kernel.org/linuxppc-dev/20210821092419.167454-2-srikar@linux.vnet.ibm.com/t/#u
Handled comment from Gautham Shenoy
[ Updated to use DIV_ROUND_UP instead of max to handle more situations ]

 arch/powerpc/kernel/smp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index 6c6e4d934d86..bf11b3c4eb28 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -1074,7 +1074,7 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
 	}
 
 	if (cpu_to_chip_id(boot_cpuid) != -1) {
-		int idx = num_possible_cpus() / threads_per_core;
+		int idx = DIV_ROUND_UP(num_possible_cpus(), threads_per_core);
 
 		/*
 		 * All threads of a core will all belong to the same core,
-- 
2.18.2

