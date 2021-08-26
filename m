Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 599B13F8506
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Aug 2021 12:07:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GwJRc0n5Bz3c8t
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Aug 2021 20:07:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pqm1wYXh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=pqm1wYXh; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GwJNh0JYnz2xYB
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Aug 2021 20:04:35 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17QA4Ooe057607; Thu, 26 Aug 2021 06:04:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=/O+BfQpZgygafWy+cQc3eFoGh1R5M0r75uhtHJ3KVus=;
 b=pqm1wYXhOcBt6Ohw/5ppHSg7bAzqFeLI2BSmd0vFdf2Y61/4pNDYo8LOpp55zMZQc1b+
 /mfsU0RKrB1XwKNDkNXpSrT4PUhnNq6pFKpXZEtdFNBcrAw1x10rCC0RLagRkez1f3dG
 jAs79L5j8q5DafebRMkFyllKjxmYcXpUCG5qK2Q5xCFnUAGRCYMYohLvQ2wIr9enXPQc
 yYOKJqzrlVpPi2EBI/Z6L/QOxfdmMMTh80Td+7lISRe0NQYkW+joXCr7bw/cdBpdtdQu
 mUU5EpmvQhJdcQazOX3kSZVIQrEF/pMLIZu/kmZtpfvrvcHYniTxABfkQwme+ZTVrlSl ow== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ap7e2t921-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Aug 2021 06:04:25 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17QA2mT5026987;
 Thu, 26 Aug 2021 10:04:20 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma02fra.de.ibm.com with ESMTP id 3ajs48fp03-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Aug 2021 10:04:20 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 17QA0TnL57540894
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 26 Aug 2021 10:00:29 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7D30F52054;
 Thu, 26 Aug 2021 10:04:17 +0000 (GMT)
Received: from saptagiri.in.ibm.com (unknown [9.43.43.205])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id C12DC5206B;
 Thu, 26 Aug 2021 10:04:14 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v2 3/3] powerpc/smp: Enable CACHE domain for shared processor
Date: Thu, 26 Aug 2021 15:34:01 +0530
Message-Id: <20210826100401.412519-4-srikar@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210826100401.412519-1-srikar@linux.vnet.ibm.com>
References: <20210826100401.412519-1-srikar@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: MrcLLMfG_vMySGZrtRolq0VW4wMCBuKT
X-Proofpoint-ORIG-GUID: MrcLLMfG_vMySGZrtRolq0VW4wMCBuKT
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-26_02:2021-08-26,
 2021-08-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 adultscore=0 impostorscore=0 mlxlogscore=999 phishscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Valentin Schneider <valentin.schneider@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently CACHE domain is not enabled on shared processor mode PowerVM
LPARS. On PowerVM systems, 'ibm,thread-group' device-tree property 2
under cpu-device-node indicates which all CPUs share L2-cache. However
'ibm,thread-group' device-tree property 2 is a relatively new property.
In absence of 'ibm,thread-group' property 2, 'l2-cache' device property
under cpu-device-node could help system to identify CPUs sharing L2-cache.
However this property is not exposed by PhyP in shared processor mode
configurations.

In absence of properties that inform OS about which CPUs share L2-cache,
fallback on core boundary.

Here are some stats from Power9 shared LPAR with the changes.

$ lscpu
Architecture:        ppc64le
Byte Order:          Little Endian
CPU(s):              32
On-line CPU(s) list: 0-31
Thread(s) per core:  8
Core(s) per socket:  1
Socket(s):           3
NUMA node(s):        2
Model:               2.2 (pvr 004e 0202)
Model name:          POWER9 (architected), altivec supported
Hypervisor vendor:   pHyp
Virtualization type: para
L1d cache:           32K
L1i cache:           32K
NUMA node0 CPU(s):   16-23
NUMA node1 CPU(s):   0-15,24-31
Physical sockets:    2
Physical chips:      1
Physical cores/chip: 10

Before patch
$ grep -r . /sys/kernel/debug/sched/domains/cpu0/domain*/name
Before
/sys/kernel/debug/sched/domains/cpu0/domain0/name:SMT
/sys/kernel/debug/sched/domains/cpu0/domain1/name:DIE
/sys/kernel/debug/sched/domains/cpu0/domain2/name:NUMA

After
/sys/kernel/debug/sched/domains/cpu0/domain0/name:SMT
/sys/kernel/debug/sched/domains/cpu0/domain1/name:CACHE
/sys/kernel/debug/sched/domains/cpu0/domain2/name:DIE
/sys/kernel/debug/sched/domains/cpu0/domain3/name:NUMA

$  awk '/domain/{print $1, $2}' /proc/schedstat | sort -u | sed -e 's/00000000,//g'
Before
domain0 00000055
domain0 000000aa
domain0 00005500
domain0 0000aa00
domain0 00550000
domain0 00aa0000
domain0 55000000
domain0 aa000000
domain1 00ff0000
domain1 ff00ffff
domain2 ffffffff

After
domain0 00000055
domain0 000000aa
domain0 00005500
domain0 0000aa00
domain0 00550000
domain0 00aa0000
domain0 55000000
domain0 aa000000
domain1 000000ff
domain1 0000ff00
domain1 00ff0000
domain1 ff000000
domain2 ff00ffff
domain2 ffffffff
domain3 ffffffff

(Lower is better)
perf stat -a -r 5 -n perf bench sched pipe  | tail -n 2
Before
           153.798 +- 0.142 seconds time elapsed  ( +-  0.09% )

After
           111.545 +- 0.652 seconds time elapsed  ( +-  0.58% )

which is an improvement of 27.47%

Cc: linuxppc-dev@lists.ozlabs.org
Cc: Nathan Lynch <nathanl@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Valentin Schneider <valentin.schneider@arm.com>
Cc: Gautham R Shenoy <ego@linux.vnet.ibm.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>
Reviewed-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>
Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
---
 arch/powerpc/kernel/smp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index b5bd5a4708d0..b31b8ca3ae2e 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -1365,7 +1365,7 @@ static bool update_mask_by_l2(int cpu, cpumask_var_t *mask)
 	l2_cache = cpu_to_l2cache(cpu);
 	if (!l2_cache || !*mask) {
 		/* Assume only core siblings share cache with this CPU */
-		for_each_cpu(i, submask_fn(cpu))
+		for_each_cpu(i, cpu_sibling_mask(cpu))
 			set_cpus_related(cpu, i, cpu_l2_cache_mask);
 
 		return false;
-- 
2.18.2

