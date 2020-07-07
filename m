Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C91E6216B4D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jul 2020 13:19:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B1KhR4tsRzDqR6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jul 2020 21:19:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B1KX56CnGzDqRB
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jul 2020 21:12:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4B1KX5380fz9Cgv
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jul 2020 21:12:05 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4B1KX505R7z9sTF; Tue,  7 Jul 2020 21:12:05 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ego@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4B1KX43Fc5z9sRN;
 Tue,  7 Jul 2020 21:12:04 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 067B3tnc159601; Tue, 7 Jul 2020 07:12:02 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 324pvd9y6f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Jul 2020 07:12:02 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 067B4Lv9161964;
 Tue, 7 Jul 2020 07:12:02 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 324pvd9y5x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Jul 2020 07:12:02 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 067B07fq007714;
 Tue, 7 Jul 2020 11:12:01 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma01dal.us.ibm.com with ESMTP id 322hd8w2d8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Jul 2020 11:12:01 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 067BC0nJ46137822
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 7 Jul 2020 11:12:00 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6217FB205F;
 Tue,  7 Jul 2020 11:12:00 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BD7A1B2066;
 Tue,  7 Jul 2020 11:11:59 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.85.70.202])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  7 Jul 2020 11:11:59 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id 4CA512E48BA; Tue,  7 Jul 2020 16:41:54 +0530 (IST)
From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, Anton Blanchard <anton@ozlabs.org>,
 Nathan Lynch <nathanl@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michael Neuling <mikey@neuling.org>,
 Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>
Subject: [PATCH 0/5] cpuidle-pseries: Parse extended CEDE information for idle.
Date: Tue,  7 Jul 2020 16:41:34 +0530
Message-Id: <1594120299-31389-1-git-send-email-ego@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-07_07:2020-07-07,
 2020-07-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 phishscore=0 cotscore=-2147483648 impostorscore=0 mlxlogscore=999
 mlxscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2007070085
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
Cc: linuxppc-dev@ozlabs.org, "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>

Hi,

On pseries Dedicated Linux LPARs, apart from the polling snooze idle
state, we currently have the CEDE idle state which cedes the CPU to
the hypervisor with latency-hint = 0.

However, the PowerVM hypervisor supports additional extended CEDE
states, which can be queried through the "ibm,get-systems-parameter"
rtas-call with the CEDE_LATENCY_TOKEN. The hypervisor maps these
extended CEDE states to appropriate platform idle-states in order to
provide energy-savings as well as shifting power to the active
units. On existing pseries LPARs today we have extended CEDE with
latency-hints {1,2} supported.

In Patches 1-3 of this patchset, we add the code to parse the CEDE
latency records provided by the hypervisor. We use this information to
determine the wakeup latency of the regular CEDE (which we have been
so far hardcoding to 10us while experimentally it is much lesser ~
1us), by looking at the wakeup latency provided by the hypervisor for
Extended CEDE states. Since the platform currently advertises Extended
CEDE 1 to have wakeup latency of 2us, we can be sure that the wakeup
latency of the regular CEDE is no more than this.

Patch 4 (currently marked as RFC), expose the extended CEDE states
parsed above to the cpuidle framework, provided that they can wakeup
on an interrupt. On current platforms only Extended CEDE 1 fits the
bill, but this is going to change in future platforms where even
Extended CEDE 2 may be responsive to external interrupts.

Patch 5 (currently marked as RFC), filters out Extended CEDE 1 since
it offers no added advantage over the normal CEDE.

With Patches 1-3, we see an improvement in the single-threaded
performance on ebizzy.

2 ebizzy threads bound to the same big-core. 25% improvement in the
avg records/s (higher the better) with patches 1-3.
x without_patches
* with_patches
    N           Min           Max        Median           Avg        Stddev
x  10       2491089       5834307       5398375       4244335     1596244.9
*  10       2893813       5834474       5832448     5327281.3     1055941.4

We do not observe any major regression in either the context_switch2
benchmark or the schbench benchmark

context_switch2 across CPU0 CPU1 (Both belong to same big-core, but different
small cores). We observe a minor 0.14% regression in the number of
context-switches (higher is better).
x without_patch
* with_patch
    N           Min           Max        Median           Avg        Stddev
x 500        348872        362236        354712     354745.69      2711.827
* 500        349422        361452        353942      354215.4     2576.9258

context_switch2 across CPU0 CPU8 (Different big-cores). We observe a 0.37%
improvement in the number of context-switches (higher is better).
x without_patch
* with_patch
    N           Min           Max        Median           Avg        Stddev
x 500        287956        294940        288896     288977.23     646.59295
* 500        288300        294646        289582     290064.76     1161.9992

schbench:
No major difference could be seen until the 99.9th percentile.

Without-patch
Latency percentiles (usec)
	50.0th: 29
	75.0th: 39
	90.0th: 49
	95.0th: 59
	*99.0th: 13104
	99.5th: 14672
	99.9th: 15824
	min=0, max=17993

With-patch:
Latency percentiles (usec)
	50.0th: 29
	75.0th: 40
	90.0th: 50
	95.0th: 61
	*99.0th: 13648
	99.5th: 14768
	99.9th: 15664
	min=0, max=29812



Gautham R. Shenoy (5):
  cpuidle-pseries: Set the latency-hint before entering CEDE
  cpuidle-pseries: Add function to parse extended CEDE records
  cpuidle-pseries : Fixup exit latency for CEDE(0)
  cpuidle-pseries : Include extended CEDE states in cpuidle framework
  cpuidle-pseries: Block Extended CEDE(1) which adds no additional
    value.

 drivers/cpuidle/cpuidle-pseries.c | 268 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 266 insertions(+), 2 deletions(-)

-- 
1.9.4

