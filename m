Return-Path: <linuxppc-dev+bounces-12213-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E08D7B57653
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Sep 2025 12:31:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cQLsc2lytz3dX3;
	Mon, 15 Sep 2025 20:31:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757932260;
	cv=none; b=Fn+jNENR8eNvS3Z6mje8C0EvIWO+4+aYEj+atfHOUKhGIXkVZxp8pVRn3+8yTF9o8WjmmGBKsKcu6Lr0c3fvpJDsHiQMUMSCocYahYqPPScZ7UTX2LuuT4gBeaHFYwmW6j1CIBpLEMhI7UEsehmBSYKNDL3vozzwunpI0MJ5NYO8DvmBQq6t2HMt0HxUIchh2f9apQpQuvkIbhQevOm/0A3NDUpcAyBD+MG2aaW0D435NYMN3duPUXvj798F1fMV/vzuqo9d8cWyrJmLLRbrpdMMhPan0+f+5TYqDPQhsF9u+cXa440NnC3a8PTs23a+12GfvTlCHE43AQFSQ1/QoA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757932260; c=relaxed/relaxed;
	bh=rKY3I2L6Dm2yeLv1DHsm6iF66xBfO58koyj8cY1jGAE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dc9VANw60yeXi4G1K4B+zyKEjIkq3z9u9k51yj3FsI/Tf1BUTDf015R25Io9nUlJBoVfQl+ZH1VFEzMvoSHOUXDmU7TOCWwbYftpDeobLMaGTEXXZ6a+TN8c7Gh5u8NQy+FoWWCOFYIcpqycmPkkdbLvP+GFDpsY5HwifPVegkiO39geqSL66eQiPFvPiWuSGEMg9fV/RVF6PDVCnOmblupypQ2PV7ihqV5X4xe6+7nCKTNX1koB6BxLeNf9Imy3AMZECWx6OTkigAm+WFeb5Pok/7E3j0gFfAE1+TaXyOi+EcsTcurMiTmvSZ7ignhSh4Rg3HXrkzW/azfkXq9vAQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=c37HllXs; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=c37HllXs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cQLsb3tgcz3dRk
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Sep 2025 20:30:59 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58F6VqxJ028232;
	Mon, 15 Sep 2025 10:30:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=rKY3I2L6Dm2yeLv1D
	Hsm6iF66xBfO58koyj8cY1jGAE=; b=c37HllXsrD72Sloqykl7b+FqlQ83nmVDb
	dI8uMiAjiuHDlR9K5AE1eanls/eMXOjriPvcX/KIW8sv8tWEbZnHK8yND5xEv72m
	Roi7Ok7gCb7X1Xd97Z2+odAe1DmdI918TWFhwv4+QYPLwKaLjd9AXM5mVd3Fcq/n
	JTUwi6sNbIZ4G0g2vEG+sQ5hl1RNvCenwTBCGVVVt/WwfV+W3o31ywTtOInF3j6j
	zDGPL+66f9/LObCpL6EjgDVgWaM+vEcHw/EBa7embxb9RCo5Aw623vyFRjC2rIpx
	+rpSJ/+NLekJD9WkyW/j9fbsdCFrVgGzuBI0IeLVPq46sJlREfEfg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 494x1t9my2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Sep 2025 10:30:53 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 58FASsii013265;
	Mon, 15 Sep 2025 10:30:53 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 494x1t9my0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Sep 2025 10:30:53 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 58F90W68009395;
	Mon, 15 Sep 2025 10:30:52 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 495nn35m5x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Sep 2025 10:30:52 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 58FAUmod41484796
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 15 Sep 2025 10:30:48 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 82D582004B;
	Mon, 15 Sep 2025 10:30:48 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 490A420043;
	Mon, 15 Sep 2025 10:30:42 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.61.244.131])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 15 Sep 2025 10:30:41 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.ibm.com>
To: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Cc: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        irogers@google.com, namhyung@kernel.org,
        linux-perf-users@vger.kernel.org, aboorvad@linux.ibm.com,
        sshegde@linux.ibm.com, atrajeev@linux.ibm.com,
        hbathini@linux.vnet.ibm.com, Aditya.Bodkhe1@ibm.com,
        venkat88@linux.ibm.com, Tejas.Manhas1@ibm.com
Subject: [PATCH V3 7/7] powerpc/perf/vpa-dtl: Add documentation for VPA dispatch trace log PMU
Date: Mon, 15 Sep 2025 15:59:47 +0530
Message-Id: <20250915102947.26681-8-atrajeev@linux.ibm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250915102947.26681-1-atrajeev@linux.ibm.com>
References: <20250915102947.26681-1-atrajeev@linux.ibm.com>
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
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=OMsn3TaB c=1 sm=1 tr=0 ts=68c7eadd cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=yJojWOMRYYMA:10 a=VnNF1IyMAAAA:8 a=Qr6oVggghYX5NUaczaUA:9
X-Proofpoint-ORIG-GUID: hIEVi4MyP3rmed9ykC8W-8_lvJchFE93
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAwMSBTYWx0ZWRfX4eu1AuNCpVqA
 cPWIvKu6mEMurD7OZZvw0yqr/eBo5wGR6WErkdkOpdjsL1p0Yaqx/zkA8nAk9BgTZIQMk54iR3y
 eCaAIXET33FYp+dsdL9SBdrrl8eJaIcfTrf9r3VDirVBOb4StQj2xxwXujQGSYzD4H3bElXn5oF
 J2GGqjsA26lY2HDPJLbJzLUco/Yb1xS5mPUt5jMzh/YAkbuUAns08IClrXleY54aCXuLV7ipe0g
 kfG0/rqUL1WdKteaAxvl0tg5mXDNs2CMKyXEJhYC0rAdHRDGGT/Km8xBRd2ttG4pFnHj9KzHIaG
 VQCM21BYGZItI75e5m40nQXB0ZMy4eaMnKsuUtT2Y/VJr1ntjoFLTMLyoC9GadZBihRTUrrXhwk
 oP6QyH9A
X-Proofpoint-GUID: iTvv51OWbGAYytO6efjDXlU61jn1ROrv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_04,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 spamscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130001
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Documentation for vpa-dtl (Virtual Processor Area - Dispatch Trace Log)
PMU interface. And how it can be used to collect the distrace trace log
entries in perf data, how to process/report as part of perf report/perf
script.

Signed-off-by: Athira Rajeev <atrajeev@linux.ibm.com>
---
Changelog:
v2 -> v3:
Updated to fix warning from "make htmdocs"

 Documentation/arch/powerpc/index.rst   |   1 +
 Documentation/arch/powerpc/vpa-dtl.rst | 156 +++++++++++++++++++++++++
 2 files changed, 157 insertions(+)
 create mode 100644 Documentation/arch/powerpc/vpa-dtl.rst

diff --git a/Documentation/arch/powerpc/index.rst b/Documentation/arch/powerpc/index.rst
index 53fc9f89f3e4..1be2ee3f0361 100644
--- a/Documentation/arch/powerpc/index.rst
+++ b/Documentation/arch/powerpc/index.rst
@@ -37,6 +37,7 @@ powerpc
     vas-api
     vcpudispatch_stats
     vmemmap_dedup
+    vpa-dtl
 
     features
 
diff --git a/Documentation/arch/powerpc/vpa-dtl.rst b/Documentation/arch/powerpc/vpa-dtl.rst
new file mode 100644
index 000000000000..58d0022f993a
--- /dev/null
+++ b/Documentation/arch/powerpc/vpa-dtl.rst
@@ -0,0 +1,156 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. _vpa-dtl:
+
+===================================
+DTL (Dispatch Trace Log)
+===================================
+
+Athira Rajeev, 19 April 2025
+
+.. contents::
+    :depth: 3
+
+
+Basic overview
+==============
+
+The pseries Shared Processor Logical Partition(SPLPAR) machines can
+retrieve a log of dispatch and preempt events from the hypervisor
+using data from Disptach Trace Log(DTL) buffer. With this information,
+user can retrieve when and why each dispatch & preempt has occurred.
+The vpa-dtl PMU exposes the Virtual Processor Area(VPA) DTL counters
+via perf.
+
+Infrastructure used
+===================
+
+The VPA DTL PMU counters do not interrupt on overflow or generate any
+PMI interrupts. Therefore, hrtimer is used to poll the DTL data. The timer
+nterval can be provided by user via sample_period field in nano seconds.
+vpa dtl pmu has one hrtimer added per vpa-dtl pmu thread. DTL (Dispatch
+Trace Log) contains information about dispatch/preempt, enqueue time etc.
+We directly copy the DTL buffer data as part of auxiliary buffer and it
+will be processed later. This will avoid time taken to create samples
+in the kernel space. The PMU driver collecting Dispatch Trace Log (DTL)
+entries makes use of AUX support in perf infrastructure. On the tools side,
+this data is made available as PERF_RECORD_AUXTRACE records.
+
+To correlate each DTL entry with other events across CPU's, an auxtrace_queue
+is created for each CPU. Each auxtrace queue has a array/list of auxtrace buffers.
+All auxtrace queues is maintained in auxtrace heap. The queues are sorted
+based on timestamp. When the different PERF_RECORD_XX records are processed,
+compare the timestamp of perf record with timestamp of top element in the
+auxtrace heap so that DTL events can be co-related with other events
+Process the auxtrace queue if the timestamp of element from heap is
+lower than timestamp from entry in perf record. Sometimes it could happen that
+one buffer is only partially processed. if the timestamp of occurrence of
+another event is more than currently processed element in the queue, it will
+move on to next perf record. So keep track of position of buffer to continue
+processing next time. Update the timestamp of the auxtrace heap with the timestamp
+of last processed entry from the auxtrace buffer.
+
+This infrastructure ensures dispatch trace log entries can be correlated
+and presented along with other events like sched.
+
+vpa-dtl PMU example usage
+=========================
+
+.. code-block:: sh
+
+  # ls /sys/devices/vpa_dtl/
+  events  format  perf_event_mux_interval_ms  power  subsystem  type  uevent
+
+
+To capture the DTL data using perf record:
+.. code-block:: sh
+
+  # ./perf record -a -e sched:\*,vpa_dtl/dtl_all/ -c 1000000000 sleep 1
+
+The result can be interpreted using perf record. Snippet of perf report -D
+
+.. code-block:: sh
+
+  # ./perf report -D
+
+There are different PERF_RECORD_XX records. In that records corresponding to
+auxtrace buffers includes:
+
+1. PERF_RECORD_AUX
+   Conveys that new data is available in AUX area
+
+2. PERF_RECORD_AUXTRACE_INFO
+   Describes offset and size of auxtrace data in the buffers
+
+3. PERF_RECORD_AUXTRACE
+   This is the record that defines the auxtrace data which here in case of
+   vpa-dtl pmu is dispatch trace log data.
+
+Snippet from perf report -D showing the PERF_RECORD_AUXTRACE dump
+
+.. code-block:: sh
+
+0 0 0x39b10 [0x30]: PERF_RECORD_AUXTRACE size: 0x690  offset: 0  ref: 0  idx: 0  tid: -1  cpu: 0
+.
+. ... VPA DTL PMU data: size 1680 bytes, entries is 35
+.  00000000: boot_tb: 21349649546353231, tb_freq: 512000000
+.  00000030: dispatch_reason:decrementer interrupt, preempt_reason:H_CEDE, enqueue_to_dispatch_time:7064, ready_to_enqueue_time:187, waiting_to_ready_time:6611773
+.  00000060: dispatch_reason:priv doorbell, preempt_reason:H_CEDE, enqueue_to_dispatch_time:146, ready_to_enqueue_time:0, waiting_to_ready_time:15359437
+.  00000090: dispatch_reason:decrementer interrupt, preempt_reason:H_CEDE, enqueue_to_dispatch_time:4868, ready_to_enqueue_time:232, waiting_to_ready_time:5100709
+.  000000c0: dispatch_reason:priv doorbell, preempt_reason:H_CEDE, enqueue_to_dispatch_time:179, ready_to_enqueue_time:0, waiting_to_ready_time:30714243
+.  000000f0: dispatch_reason:priv doorbell, preempt_reason:H_CEDE, enqueue_to_dispatch_time:197, ready_to_enqueue_time:0, waiting_to_ready_time:15350648
+.  00000120: dispatch_reason:priv doorbell, preempt_reason:H_CEDE, enqueue_to_dispatch_time:213, ready_to_enqueue_time:0, waiting_to_ready_time:15353446
+.  00000150: dispatch_reason:priv doorbell, preempt_reason:H_CEDE, enqueue_to_dispatch_time:212, ready_to_enqueue_time:0, waiting_to_ready_time:15355126
+.  00000180: dispatch_reason:decrementer interrupt, preempt_reason:H_CEDE, enqueue_to_dispatch_time:6368, ready_to_enqueue_time:164, waiting_to_ready_time:5104665
+
+Above is representation of dtl entry of below format:
+
+struct dtl_entry {
+        u8      dispatch_reason;
+        u8      preempt_reason;
+        u16     processor_id;
+        u32     enqueue_to_dispatch_time;
+        u32     ready_to_enqueue_time;
+        u32     waiting_to_ready_time;
+        u64     timebase;
+        u64     fault_addr;
+        u64     srr0;
+        u64     srr1;
+
+};
+
+First two fields represent the dispatch reason and preempt reason. The post
+processing of PERF_RECORD_AUXTRACE records will translate to meaningful data
+for user to consume.
+
+Visualize the dispatch trace log entries with perf report
+=========================================================
+
+.. code-block:: sh
+
+  # ./perf record -a -e sched:*,vpa_dtl/dtl_all/ -c 1000000000 sleep 1
+  [ perf record: Woken up 1 times to write data ]
+  [ perf record: Captured and wrote 0.300 MB perf.data ]
+
+  # ./perf report
+  # Samples: 321  of event 'vpa-dtl'
+  # Event count (approx.): 321
+  #
+  # Children      Self  Command  Shared Object      Symbol
+  # ........  ........  .......  .................  ..............................
+  #
+     100.00%   100.00%  swapper  [kernel.kallsyms]  [k] plpar_hcall_norets_notrace
+
+Visualize the dispatch trace log entries with perf script
+=========================================================
+
+.. code-block:: sh
+
+   # ./perf script
+     migration/9      67 [009] 105373.359903:                     sched:sched_waking: comm=perf pid=13418 prio=120 target_cpu=009
+     migration/9      67 [009] 105373.359904:               sched:sched_migrate_task: comm=perf pid=13418 prio=120 orig_cpu=9 dest_cpu=10
+     migration/9      67 [009] 105373.359907:               sched:sched_stat_runtime: comm=migration/9 pid=67 runtime=4050 [ns]
+     migration/9      67 [009] 105373.359908:                     sched:sched_switch: prev_comm=migration/9 prev_pid=67 prev_prio=0 prev_state=S ==> next_comm=swapper/9 next_pid=0 next_prio=120
+            :256     256 [016] 105373.359913:                                vpa-dtl: timebase: 21403600706628832 dispatch_reason:decrementer interrupt, preempt_reason:H_CEDE, enqueue_to_dispatch_time:4854,                        ready_to_enqueue_time:139, waiting_to_ready_time:511842115 c0000000000fcd28 plpar_hcall_norets_notrace+0x18 ([kernel.kallsyms])
+            :256     256 [017] 105373.360012:                                vpa-dtl: timebase: 21403600706679454 dispatch_reason:priv doorbell, preempt_reason:H_CEDE, enqueue_to_dispatch_time:236,                         ready_to_enqueue_time:0, waiting_to_ready_time:133864583 c0000000000fcd28 plpar_hcall_norets_notrace+0x18 ([kernel.kallsyms])
+            perf   13418 [010] 105373.360048:               sched:sched_stat_runtime: comm=perf pid=13418 runtime=139748 [ns]
+            perf   13418 [010] 105373.360052:                     sched:sched_waking: comm=migration/10 pid=72 prio=0 target_cpu=010
-- 
2.47.1


