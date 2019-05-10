Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E34719EE9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 May 2019 16:19:55 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 450smS4DS6zDqTd
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 May 2019 00:19:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=anju@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 450skS6ZRRzDqQV
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 May 2019 00:18:08 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4AE4ZrR036162
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 May 2019 10:18:04 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2sd8tqpcjj-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 May 2019 10:18:04 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <anju@linux.vnet.ibm.com>;
 Fri, 10 May 2019 15:18:01 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 10 May 2019 15:17:59 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x4AEHwZX59637818
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 May 2019 14:17:58 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 069074C04A;
 Fri, 10 May 2019 14:17:58 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EAE1B4C040;
 Fri, 10 May 2019 14:17:56 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.145.54.63])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 10 May 2019 14:17:56 +0000 (GMT)
From: Anju T Sudhakar <anju@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH] powerpc/imc: Add documentation for IMC and trace-mode
Date: Fri, 10 May 2019 19:47:52 +0530
X-Mailer: git-send-email 2.17.2
X-TM-AS-GCONF: 00
x-cbid: 19051014-0016-0000-0000-0000027A5EB5
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19051014-0017-0000-0000-000032D71A4D
Message-Id: <20190510141752.8378-1-anju@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-09_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905100098
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
Cc: maddy@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 anju@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Documentation for IMC(In-Memory Collection Counters) infrastructure
and trace-mode of IMC.

Signed-off-by: Anju T Sudhakar <anju@linux.vnet.ibm.com>
---
 Documentation/powerpc/imc.txt | 195 ++++++++++++++++++++++++++++++++++
 1 file changed, 195 insertions(+)
 create mode 100644 Documentation/powerpc/imc.txt

diff --git a/Documentation/powerpc/imc.txt b/Documentation/powerpc/imc.txt
new file mode 100644
index 000000000000..9c32e059f3be
--- /dev/null
+++ b/Documentation/powerpc/imc.txt
@@ -0,0 +1,195 @@
+		===================================
+		IMC (In-Memory Collection Counters)
+		===================================
+		Date created: 10 May 2019
+
+Table of Contents:
+------------------
+	- Basic overview
+	- IMC example Usage
+	- IMC Trace Mode
+		- LDBAR Register Layout
+		- TRACE_IMC_SCOM bit representation
+	- Trace IMC example usage
+	- Benefits of using IMC trace-mode
+
+
+Basic overview
+==============
+
+IMC (In-Memory collection counters) is a hardware monitoring facility
+that collects large number of hardware performance events at Nest level
+(these are on-chip but off-core), Core level and Thread level.
+
+The Nest PMU counters are handled by a Nest IMC microcode which runs
+in the OCC (On-Chip Controller) complex. The microcode collects the
+counter data and moves the nest IMC counter data to memory.
+
+The Core and Thread IMC PMU counters are handled in the core. Core
+level PMU counters give us the IMC counters' data per core and thread
+level PMU counters give us the IMC counters' data per CPU thread.
+
+OPAL obtains the IMC PMU and supported events information from the
+IMC Catalog and passes on to the kernel via the device tree. The event's
+information contains :
+ - Event name
+ - Event Offset
+ - Event description
+and, maybe :
+ - Event scale
+ - Event unit
+
+Some PMUs may have a common scale and unit values for all their
+supported events. For those cases, the scale and unit properties for
+those events must be inherited from the PMU.
+
+The event offset in the memory is where the counter data gets
+accumulated.
+
+IMC catalog is available at:
+	https://github.com/open-power/ima-catalog
+
+The kernel discovers the IMC counters information in the device tree
+at the "imc-counters" device node which has a compatible field
+"ibm,opal-in-memory-counters". From the device tree, the kernel parses
+the PMUs and their event's information and register the PMU and it
+attributes in the kernel.
+
+IMC example usage
+=================
+
+# perf list
+
+  [...]
+  nest_mcs01/PM_MCS01_64B_RD_DISP_PORT01/            [Kernel PMU event]
+  nest_mcs01/PM_MCS01_64B_RD_DISP_PORT23/            [Kernel PMU event]
+
+  [...]
+  core_imc/CPM_0THRD_NON_IDLE_PCYC/                  [Kernel PMU event]
+  core_imc/CPM_1THRD_NON_IDLE_INST/                  [Kernel PMU event]
+
+  [...]
+  thread_imc/CPM_0THRD_NON_IDLE_PCYC/                [Kernel PMU event]
+  thread_imc/CPM_1THRD_NON_IDLE_INST/                [Kernel PMU event]
+
+To see per chip data for nest_mcs0/PM_MCS_DOWN_128B_DATA_XFER_MC0/ :
+ # ./perf stat -e "nest_mcs01/PM_MCS01_64B_WR_DISP_PORT01/" -a --per-socket
+
+To see non-idle instructions for core 0 :
+ # ./perf stat -e "core_imc/CPM_NON_IDLE_INST/" -C 0 -I 1000
+
+To see non-idle instructions for a "make" :
+ # ./perf stat -e "thread_imc/CPM_NON_IDLE_PCYC/" make
+
+
+IMC Trace-mode
+===============
+
+POWER9 support two modes for IMC which are the Accumulation mode and
+Trace mode. In Accumulation mode, event counts are accumulated in system
+Memory. Hypervisor then reads the posted counts periodically or when
+requested. In IMC Trace mode, the 64 bit trace scom value is initialized
+with the event information. The CPMC*SEL and CPMC_LOAD in the trace scom,
+specifies the event to be monitored and the sampling duration. On each
+overflow in the CPMC*SEL, hardware snapshots the program counter along
+with event counts and writes into memory pointed by LDBAR.
+
+LDBAR is a 64 bit special purpose per thread register, it has bits to
+indicate whether hardware is configured for accumulation or trace mode.
+
+* LDBAR Register Layout:
+	0     : Enable/Disable
+	1     : 0 -> Accumulation Mode
+		1 -> Trace Mode
+	2:3   : Reserved
+	4-6   : PB scope
+	7     : Reserved
+	8:50  : Counter Address
+	51:63 : Reserved
+
+* TRACE_IMC_SCOM bit representation:
+
+	0:1     : SAMPSEL
+	2:33    : CPMC_LOAD
+	34:40   : CPMC1SEL
+	41:47   : CPMC2SEL
+	48:50   : BUFFERSIZE
+	51:63   : RESERVED
+
+CPMC_LOAD contains the sampling duration. SAMPSEL and CPMC*SEL determines
+the event to count. BUFFRSIZE indicates the memory range. On each overflow,
+hardware snapshots program counter along with event counts and update the
+memory and reloads the CMPC_LOAD value for the next sampling duration.
+IMC hardware does not support exceptions, so it quietly wraps around if
+memory buffer reaches the end.
+
+*Currently the event monitored for trace-mode is fixed as cycle.
+
+Trace IMC example usage
+=======================
+
+# perf list
+
+  [....]
+  trace_imc/trace_cycles/                            [Kernel PMU event]
+
+To record an application/process with trace-imc event
+# perf record -e trace_imc/trace_cycles/ yes > /dev/nul
+[ perf record: Woken up 1 times to write data ]
+[ perf record: Captured and wrote 0.012 MB perf.data (21 samples) ]
+
+The perf.data generated, can be read using perf report.
+
+Benefits of using IMC trace-mode
+================================
+
+PMI interrupt handling is avoided, since IMC trace mode snapshots the
+program counter and update to the memory. And this also provide a way for
+the operating system to do instruction sampling in real time without
+PMI(Performance Monitoring Interrupts) processing overhead.
+Example:-
+
+Performance data using 'perf top' with and without trace-imc event:
+
+PMI interrupts count when `perf top` command is executed without trace-imc event.
+
+# cat /proc/interrupts  (a snippet from the output)
+9944      1072        804        804       1644        804       1306
+804        804        804        804        804        804        804
+804        804       1961       1602        804        804       1258
+[-----------------------------------------------------------------]
+803        803        803        803        803        803        803
+803        803        803        803        804        804        804
+804        804        804        804        804        804        803
+803        803        803        803        803       1306        803
+803   Performance monitoring interrupts
+
+
+`perf top` with trace-imc (executed right after 'perf top' without trace-imc event):
+
+# perf top -e trace_imc/trace_cycles/
+12.50%  [kernel]          [k] arch_cpu_idle
+11.81%  [kernel]          [k] __next_timer_interrupt
+11.22%  [kernel]          [k] rcu_idle_enter
+10.25%  [kernel]          [k] find_next_bit
+ 7.91%  [kernel]          [k] do_idle
+ 7.69%  [kernel]          [k] rcu_dynticks_eqs_exit
+ 5.20%  [kernel]          [k] tick_nohz_idle_stop_tick
+     [-----------------------]
+
+# cat /proc/interrupts (a snippet from the output)
+
+9944      1072        804        804       1644        804       1306
+804        804        804        804        804        804        804
+804        804       1961       1602        804        804       1258
+[-----------------------------------------------------------------]
+803        803        803        803        803        803        803
+803        803        803        804        804        804        804
+804        804        804        804        804        804        803
+803        803        803        803        803       1306        803
+803   Performance monitoring interrupts
+
+The PMI interrupts count remains the same.
+
+----------------------------------------------------------
+Author(s) : Anju T Sudhakar <anju@linux.vnet.ibm.com>
-- 
2.17.2

