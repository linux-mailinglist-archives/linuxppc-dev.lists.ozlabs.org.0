Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BD4173F39E5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Aug 2021 11:27:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GsCph50bgz3dCg
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Aug 2021 19:27:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VBYnobMR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=VBYnobMR; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GsClY0Wthz3bX5
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Aug 2021 19:25:12 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17L948Ij048933; Sat, 21 Aug 2021 05:25:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=lJVLUbYTCn4Kad3DVFoO8Jtnw8KMRW2h70E9O5CnSMI=;
 b=VBYnobMRlPpCw/uadqijFCCpR1QGdkmvfdL9LI2A3Cmnvadhq+oBHAg2nPeM+591hfw5
 FjXOTSkwi3KzNwf+AMRV9f2RrYGKxHlEGNyVEPgFnA6+/khKRWDX35214Vfix/Idmt0P
 rUvTTpDiW3ZerUyflzbjG477sRVwmGNbbZZWy5QocVMdN11g9wsVjstq8EHd4dN+XDn1
 GCHHiDQ8mMFxLkrKU8ZHDyCA0zTTXUt+IjR6JeG+GCoMt3kCO1c+yzOhplOPLU6WKdKm
 d25qwNOHfEbVe+fabKx0xPP0u5ZLJYdUJvNGThojEo9zhvHiOkPhDEamq367NjG8bKhl cg== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ajwrvs25n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 21 Aug 2021 05:25:02 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17L9CdHF007776;
 Sat, 21 Aug 2021 09:25:00 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03ams.nl.ibm.com with ESMTP id 3ajs488c5n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 21 Aug 2021 09:25:00 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17L9Owj444237096
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 21 Aug 2021 09:24:58 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ECE6D11C018;
 Sat, 21 Aug 2021 09:24:57 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D351011C013;
 Sat, 21 Aug 2021 09:24:54 +0000 (GMT)
Received: from saptagiri.in.ibm.com (unknown [9.85.90.43])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Sat, 21 Aug 2021 09:24:54 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 3/3] powerpc/smp: Enable CACHE domain for shared processor
Date: Sat, 21 Aug 2021 14:54:19 +0530
Message-Id: <20210821092419.167454-4-srikar@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210821092419.167454-1-srikar@linux.vnet.ibm.com>
References: <20210821092419.167454-1-srikar@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: H7eI9nxLpyB0nKwhVpKCwTU8kAoxZJjb
X-Proofpoint-ORIG-GUID: H7eI9nxLpyB0nKwhVpKCwTU8kAoxZJjb
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-21_03:2021-08-20,
 2021-08-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 suspectscore=0 mlxlogscore=999 bulkscore=0 adultscore=0
 mlxscore=0 spamscore=0 malwarescore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108210052
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
Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
---
 arch/powerpc/kernel/smp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index 3d26d3c61e94..47b15f31cc29 100644
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

