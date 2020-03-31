Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E42199652
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Mar 2020 14:21:35 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48s7jS1Rn3zDq7h
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Mar 2020 23:21:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ego@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48s7Tm1LPFzDqts
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Mar 2020 23:11:23 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02VC3POd124808; Tue, 31 Mar 2020 08:11:18 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30227w022j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 31 Mar 2020 08:11:18 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 02VC3YC1125257;
 Tue, 31 Mar 2020 08:11:17 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30227w0225-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 31 Mar 2020 08:11:17 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 02VCAMKH005824;
 Tue, 31 Mar 2020 12:11:16 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma01dal.us.ibm.com with ESMTP id 301x776t71-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 31 Mar 2020 12:11:16 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02VCBFxi56295688
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 31 Mar 2020 12:11:15 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4226E6A054;
 Tue, 31 Mar 2020 12:11:15 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8A6146A05A;
 Tue, 31 Mar 2020 12:11:14 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.85.71.250])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 31 Mar 2020 12:11:14 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id 4EC072E33D2; Tue, 31 Mar 2020 17:41:10 +0530 (IST)
From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
To: Paul Mackerras <paulus@ozlabs.org>, Michael Neuling <mikey@neuling.org>,
 Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 David Gibson <david@gibson.dropbear.id.au>,
 Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
 Bharata B Rao <bharata@linux.ibm.com>
Subject: [RFC/PATCH  0/3] Add support for stop instruction inside KVM guest
Date: Tue, 31 Mar 2020 17:40:55 +0530
Message-Id: <1585656658-1838-1-git-send-email-ego@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-03-31_04:2020-03-31,
 2020-03-31 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 mlxscore=0 bulkscore=0
 impostorscore=0 spamscore=0 suspectscore=0 mlxlogscore=999
 lowpriorityscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2003020000 definitions=main-2003310110
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
Cc: linuxppc-dev@ozlabs.org, linuxppc-dev@lists.ozlabs.org,
 kvm-ppc@vger.kernel.org, "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>


 *** RFC Only. Not intended for inclusion ************
 
Motivation
~~~~~~~~~~~~~~~

The POWER ISA v3.0 allows stop instruction to be executed from a Guest
Kernel (HV=0,PR=0) context. If the hypervisor has cleared
PSSCR[ESL|EC] bits, then the stop instruction thus executed will cause
the vCPU thread to "pause", thereby donating its cycles to the other
threads in the core until the paused thread is woken up by an
interrupt. If the hypervisor has set the PSSCR[ESL|EC] bits, then
execution of the "stop" instruction will raise a Hypervisor Facility
Unavailable exception.

The stop idle state in the guest (henceforth referred to as stop0lite)
when enabled

* has a very small wakeup latency (1-3us) comparable to that of
  snooze and considerably better compared the Shared CEDE state
  (25-30us).  Results are provided below for wakeup latency measured
  by waking up an idle CPU in a given state using a timer as well as
  using an IPI.

  ======================================================================
  Wakeup Latency measured using a timer (in ns) [Lower is better]
  ======================================================================
  Idle state |  Nr samples |  Min    | Max    | Median | Avg   | Stddev|
  ======================================================================
  snooze     |   60        |  787    | 1059   |  938   | 937.4 | 42.27 |
  ======================================================================
  stop0lite  |   60        |  770    | 1182   |  948   | 946.4 | 67.41 |
  ======================================================================
  Shared CEDE|   60        | 9550    | 36694  | 29219  |28564.1|3545.9 |
  ======================================================================

  ======================================================================
  Wakeup Latency measured using a timer (in ns) [Lower is better]
  ======================================================================
  Idle state |  Nr samples |  Min    | Max    | Median | Avg   | Stddev|
  ======================================================================
  snooze     |   60        |  787    | 1059   |  938   | 937.4 | 42.27 |
  ======================================================================
  stop0lite  |   60        |  770    | 1182   |  948   | 946.4 | 67.41 |
  ======================================================================
  Shared CEDE|   60        | 9550    | 36694  | 29219  |28564.1|3545.9 |
  ======================================================================

* provides an improved single threaded performance compared to snooze
  since the idle state completely relinquishes the core cycles. The
  single threaded performance is observed to be better even when
  compared to "Shared CEDE", since in the latter case something else
  can scheduled on the ceded CPU, while "stop0lite" doesn't give up
  the CPU.

  On a KVM guest with smp 8,sockets=1,cores=2,threads=4 with vCPUs of
  a vCore bound to a physical core, we run a single-threaded ebizzy
  pinned to one of the guest vCPUs while the sibling vCPUs in the core
  are idling. We enable only one guest idle state at a time to measure
  the single-threaded performance benefit that the idle state provides
  by giving up the core resources to the non-idle thread. we obtain
  ~13% improvement in the throughput compared to that with "snooze"
  and ~8% improvement in the throughput compared to "Shared CEDE".
   
   =======================================================================
   | ebizzy records/s : [Higher the better]                              |
   =======================================================================
   |Idle state |  Nr    |  Min    | Max    | Median | Avg     | Stddev   |
   |           |samples |         |        |        |         |          |
   =======================================================================	   
   |snooze     |   10   |  1378988| 1379358| 1379032|1379067.3|    113.47|
   =======================================================================
   |stop0lite  |   10   |  1561836| 1562058| 1561906|1561927.5|     81.87|
   =======================================================================
   |Shared CEDE|   10   |  1446584| 1447383| 1447037|1447009.0|    244.16|
   =======================================================================

Is stop0lite a replacement for snooze ?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Not yet. snooze is a polling state, and can respond much faster to a
need_resched() compared to stop0lite which needs an IPI to wakeup from
idle state. This can be seen in the results below:

With the context_switch2 pipe test, we can see that with stop0lite,
the number of context switches are 32.47% lesser than with
snooze. This is due to the fact that snooze is a polling state which
polls for TIF_NEED_RESCHED. Thus it does not require an interrupt to
exit the state and start executing the scheduler code. However,
stop0lite needs an IPI.

Compared to the "Shared CEDE" state, we see that with stop0lite, we
have 82.7% improvement in the number of context switches. This is due
to the low wakeup latency compared to Shared CEDE.

======================================================================
context switch2 : Number of context switches/s [Higher the better]
======================================================================
Idle state |  Nr    |  Min    | Max    | Median | Avg     | Stddev   |
           |samples |         |        |        |         |          |
======================================================================	   
snooze     |  100   |   210480|  221578|  219860|219684.88|   1344.97|
======================================================================
stop0lite  |  100   |   146730|  150266|  148258|148331.70|    871.50|
======================================================================
Shared CEDE|  100   |    75812|   82792|   81232| 81187.16|    832.99|
======================================================================


Is stop0lite a replacement for Shared CEDE ?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
No. For longer idle durations, Shared CEDE is a better option compared
to "stop0lite", both from a performance (CEDEd CPUs can be put into
deeper idle states such as stop2, which can provide SMT folding
benefits) and utilization (Hypervisor can utilize the idle CPUs for
running something useful).


What this patch-set does:
~~~~~~~~~~~~~~~~~~~~~~~~~~~~
The patchset has 3 patches

Patch 1: Allows the guest to run "stop" instruction without crashing
         even if the hypervisor has set the PSSCR[ESL|EC] bits. This
         is done by handling the Hypervisor Facility Unavailable
         exception and incrementing the program counter by 4 bytes,
         thus emulating the wakeup from a PSSCR[ESL = EC = 0] stop.

Patch 2: Clears the PSSCR[ESL|EC] bits unconditionally before
         dispatching a vCPU, thereby allowing the vCPU to execute a
         "stop" instruction.

Patch 3: Defines a cpuidle state for pseries guest named "stop0lite"
         to be invoked by the cpuidle driver.


What this patch-set does not do:
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

* It does not define an interface by which the guest discovers the
  stop-capability. Should this be defined via device-tree?

* It does address the problem of guest migration. i.e, a guest started
  on a hypervisor which supports guest stop state, if migrated to a
  hypervisor which does not support guest stop state will crash,
  unless it has Patch 1 above.
  

I would like to seek feedback and comments with respect to how to go
about implementing the issues that have not been addressed in this
patchset.

Gautham R. Shenoy (3):
  powerpc/kvm: Handle H_FAC_UNAVAIL when guest executes stop.
  pseries/kvm: Clear PSSCR[ESL|EC] bits before guest entry
  cpuidle/pseries: Add stop0lite state

 arch/powerpc/include/asm/reg.h          |  1 +
 arch/powerpc/kvm/book3s_hv.c            |  8 ++++++--
 arch/powerpc/kvm/book3s_hv_rmhandlers.S | 25 +++++++++++++------------
 drivers/cpuidle/cpuidle-pseries.c       | 27 +++++++++++++++++++++++++++
 4 files changed, 47 insertions(+), 14 deletions(-)

-- 
1.9.4

