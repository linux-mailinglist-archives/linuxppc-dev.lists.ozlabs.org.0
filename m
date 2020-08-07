Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C049E23E83E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Aug 2020 09:47:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BNHX36kjDzDqwp
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Aug 2020 17:47:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=V6gpAB+7; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BNHTj73C8zDqXJ
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Aug 2020 17:45:45 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0777VVDY083462; Fri, 7 Aug 2020 03:45:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=7APp82u1fCIlemZu0jLuz5QrArJmIFqrMX78hUa7qdo=;
 b=V6gpAB+7J9/ujY1w9q4oJi/jEjLfGyjtqUGqAPsIsnz9WA8wjBa/19pEBTwikE9Xbavl
 wmvLrf8CA4pPDt7mQf+5YyAHDBtY2rdWxqSJYtYr6jg34RZelnhwfd2v7Yz+nyhX1TiE
 ndtEincxtUpJdfngl+523HsE+tR7bKmW/RFdYIsM4Jc2xis33AgmlYlqV0lkymeN6HDE
 mCrgGPkec63NcDbwwJ+11+Ipt307Enz0EZD5n29OmREcJr0WWxamQmAJRPusC5bATmv5
 lSEuQwedO65Y3S+Gj2Ersf9sa3wIB84eBdzx6lyZ6WbuunXLUzFRqfZWUubmTOlpYbOf TA== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32rnu9met2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Aug 2020 03:45:30 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0777eQKO019843;
 Fri, 7 Aug 2020 07:45:28 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03ams.nl.ibm.com with ESMTP id 32n0186d1v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Aug 2020 07:45:28 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 0777jQ6u65143248
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 7 Aug 2020 07:45:26 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 27605AE056;
 Fri,  7 Aug 2020 07:45:26 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 13843AE051;
 Fri,  7 Aug 2020 07:45:22 +0000 (GMT)
Received: from srikart450.in.ibm.com (unknown [9.199.45.118])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  7 Aug 2020 07:45:21 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v2 1/2] sched/topology: Allow archs to override cpu_smt_mask
Date: Fri,  7 Aug 2020 13:15:16 +0530
Message-Id: <20200807074517.27957-1-srikar@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-07_02:2020-08-06,
 2020-08-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 mlxlogscore=999
 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008070051
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
Cc: Gautham R Shenoy <ego@linux.vnet.ibm.com>,
 Michael Neuling <mikey@neuling.org>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Mel Gorman <mgorman@techsingularity.net>, LKML <linux-kernel@vger.kernel.org>,
 Valentin Schneider <valentin.schneider@arm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Ingo Molnar <mingo@kernel.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

cpu_smt_mask tracks topology_sibling_cpumask. This would be good for
most architectures. One of the users of cpu_smt_mask(), would be to
identify idle-cores. On Power9, a pair of SMT4 cores can be presented by
the firmware as a SMT8 core for backward compatibility reasons.

Powerpc allows LPARs to be live migrated from Power8 to Power9. Do note
Power8 had only SMT8 cores. Existing software which has been
developed/configured for Power8 would expect to see SMT8 core.
Maintaining the illusion of SMT8 core is a requirement to make that
work.

In order to maintain above userspace backward compatibility with
previous versions of processor, Power9 onwards there is option to the
firmware to advertise a pair of SMT4 cores as a fused cores aka SMT8
core. On Power9 this pair shares the L2 cache as well. However, from the
scheduler's point of view, a core should be determined by SMT4, since
its a completely independent unit of compute. Hence allow PowerPc
architecture to override the default cpu_smt_mask() to point to the SMT4
cores in a SMT8 mode.

This will ensure the scheduler is always given the right information.

Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Cc: LKML <linux-kernel@vger.kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Michael Neuling <mikey@neuling.org>
Cc: Gautham R Shenoy <ego@linux.vnet.ibm.com>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Valentin Schneider <valentin.schneider@arm.com>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>
Cc: Mel Gorman <mgorman@techsingularity.net>
Cc: Vincent Guittot <vincent.guittot@linaro.org>
Cc: Vaidyanathan Srinivasan <svaidy@linux.ibm.com>
Acked-by; Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
---
Changelog v1->v2:
	Update the commit msg based on the discussion in community esp
	with Peter Zijlstra and Michael Ellerman.

 include/linux/topology.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/topology.h b/include/linux/topology.h
index 608fa4aadf0e..ad03df1cc266 100644
--- a/include/linux/topology.h
+++ b/include/linux/topology.h
@@ -198,7 +198,7 @@ static inline int cpu_to_mem(int cpu)
 #define topology_die_cpumask(cpu)		cpumask_of(cpu)
 #endif
 
-#ifdef CONFIG_SCHED_SMT
+#if defined(CONFIG_SCHED_SMT) && !defined(cpu_smt_mask)
 static inline const struct cpumask *cpu_smt_mask(int cpu)
 {
 	return topology_sibling_cpumask(cpu);
-- 
2.18.2

