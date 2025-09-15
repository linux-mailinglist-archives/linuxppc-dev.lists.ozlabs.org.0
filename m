Return-Path: <linuxppc-dev+bounces-12195-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF45CB5714B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Sep 2025 09:23:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cQGjP1F35z3dLd;
	Mon, 15 Sep 2025 17:23:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757921017;
	cv=none; b=SIbgbaVlIh/2TpRhcQ68yLKFHYPaXXSAp4DzwuYlcILn+aKrDb74LX6haL3Vb4gBc6YWhyFgZ5Er748aGygSHYRMd+7RXIahUH3EYYpstse8JAyR1/sm6VzqwK+1/zVlLpSzEd5OMPa4azUa4aCxqDB5EpLFJm7N4vTjVJW8WcxXNfwSM4q3tSnswx7G3Q3Oh0gaLNao1fiaJ8O155D5dwnOgcQqxB1Cw+9GBuc3o8wZwHPp6NUvqYXT0gscYINO/D/q2r4A4ogUagiop9Lt5EHa2m9MxLUDO9YWHru/4Ly1l2DG29BiHdIWO9pJ6HAaOcJqsndiJP5Vk9TX1MCpSA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757921017; c=relaxed/relaxed;
	bh=wkTVIt4sqtBahtUKBUUpb0WCwDlegHfu9wdcB61B/pM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TuynPjbYlK4GewRUHW6RUNRi+3KSwGqgWiHRkVSu9vRR1Y5Yh0qpEAx5kxgTAj2bV1IBkeUzxRNH3paIyTNBK6V39nAACf/PVQPyOT5cdd8Y0bJlSvCaHIUv7CNyClYlhps9+sIy3+0zoIo05/go5TFIVptEl/ipmJmJYh2jrk390n5bFA5Trikv2Jn0z2RUNxmgemxGJzujuZ4jfugI271eZuyEE54EBqoAoth2sekeot16B4cBoMq+X9VqF2V6eEARLL9qLyLR2Fevg6l0JrkEtXCQ9PBCS4kMVbQvbtWgKuw9Ma2lHkxfcSD7I+u3u5jVqHAS6a5+SvsIZ44keA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=A5rjqpt+; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=A5rjqpt+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cQGjN2VHmz3dBp
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Sep 2025 17:23:36 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58EHfpdB017258;
	Mon, 15 Sep 2025 07:23:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=wkTVIt4sqtBahtUKB
	UUpb0WCwDlegHfu9wdcB61B/pM=; b=A5rjqpt+tCZojM5reJV3CVGQ63bFNcPN/
	OM98CU1UBGaRynbl0fsuS/hMXSadevVsg28VJXxc9y7eeH9QjXTeyP0WZ0wyWwgj
	6kdLYX3S0KJ/dLULHRWWN6eQb9Dv+N2ousFqc8w+QBHkphvY3ue5ep8iaNNpwBUG
	ZI3FcX2mELbfP/CfVzT6sQtdteFUpA2UXXUWXW9nr9RE6su7c9H545kkrmnxRnzk
	kDRL06OhGD9bqt+/dTKfqVrIUPTi6NT9JvkpUMvEmusiLKpl8WJnlA9AQEP9bIJ7
	jdYMfHVMl+0rV3RnJCaKR+w5mNPZqK/HFfLoos2wAP75XqhijYUAg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49504b12v0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Sep 2025 07:23:31 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 58F7MD5C026853;
	Mon, 15 Sep 2025 07:23:31 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49504b12um-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Sep 2025 07:23:31 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 58F73FGo029514;
	Mon, 15 Sep 2025 07:23:30 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 495kb0nbmm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Sep 2025 07:23:29 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 58F7NQPj32703102
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 15 Sep 2025 07:23:26 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 27C3A20040;
	Mon, 15 Sep 2025 07:23:26 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 094FC20043;
	Mon, 15 Sep 2025 07:23:20 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.61.244.131])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 15 Sep 2025 07:23:19 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.ibm.com>
To: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Cc: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        irogers@google.com, namhyung@kernel.org,
        linux-perf-users@vger.kernel.org, aboorvad@linux.ibm.com,
        sshegde@linux.ibm.com, atrajeev@linux.ibm.com,
        hbathini@linux.vnet.ibm.com, Aditya.Bodkhe1@ibm.com,
        venkat88@linux.ibm.com, Tejas.Manhas1@ibm.com
Subject: [PATCH V2 7/7] powerpc/perf/vpa-dtl: Add documentation for VPA dispatch trace log PMU
Date: Mon, 15 Sep 2025 12:52:24 +0530
Message-Id: <20250915072224.98958-8-atrajeev@linux.ibm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250915072224.98958-1-atrajeev@linux.ibm.com>
References: <20250915072224.98958-1-atrajeev@linux.ibm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAyMCBTYWx0ZWRfX2NnUDsyvkPit
 9NuhTOirbU8zV5lyBFjIuJYOKjJvgpWYUfIRBbeEPDCCCXHk9kElGERypQA0wd0dbHMMH0W0fs2
 kVU5EBCj7m5I1fkVHaDpaWBtN/i8/P+lUAyCB9Ij0NgkODbDV1lYZ+zjbxB8+s1Ia3HixMuTCqZ
 mtN2Yhl8sSzVPcy8ZN6DU2Vz40MYmdFkX/sU4LDuRMZZW+qhdiX9FSXNRHLXHOUpzYPRqnXmlyT
 Kd6D79uPwnPUqES+WsH5qWTHDPcLQLLXFx7Vasfpn9dXt1+eXoEZ9Zxtj8I+Nn4vj64ItuEqG5O
 ifJMTqlugr7XZiWn5k+2Scxl5hwx6EVd/qLCmEb25EHc1mBlWOEfJN4kqVLo91mL/eay13CTv9i
 MbGCxbf0
X-Proofpoint-ORIG-GUID: tL8Jx1sMvLkx_e0MwjA_40BpiKaQfKZ-
X-Authority-Analysis: v=2.4 cv=dt/bC0g4 c=1 sm=1 tr=0 ts=68c7bef3 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=yJojWOMRYYMA:10 a=VnNF1IyMAAAA:8 a=02MW3PgXJqTBV82uIr0A:9
X-Proofpoint-GUID: 3txNWA8B2Ss7QhPMM3Ej0wutAwgMfNBy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_03,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130020
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
 Documentation/arch/powerpc/index.rst   |   1 +
 Documentation/arch/powerpc/vpa-dtl.rst | 155 +++++++++++++++++++++++++
 2 files changed, 156 insertions(+)
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
index 000000000000..98a8550ae1cc
--- /dev/null
+++ b/Documentation/arch/powerpc/vpa-dtl.rst
@@ -0,0 +1,155 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. _htm:
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
+  # ./perf record -a -e sched:*,vpa_dtl/dtl_all/ -c 1000000000 sleep 1
+
+The result can be interpreted using perf record. Snippet of perf report -D:
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


