Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3069C876F59
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Mar 2024 06:52:53 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=I1EBIRG2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TsByp6xFxz3vYx
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Mar 2024 16:52:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=I1EBIRG2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TsBy212W9z3d8y
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Mar 2024 16:52:09 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 4294c7gx025587;
	Sat, 9 Mar 2024 05:52:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=VndDyGPRaqg15I4kLtz1rwHG70SZRsEb3lIduh1t8lA=;
 b=I1EBIRG2liUcd0EHrfBlk8E9qy4sMWoMRNktgLHPUjdts2SYcbczUOttd44u+KP+cRRK
 QCYTQCoS0zJuVsN/WKqraUpaKE9MHKx8nm1VWfRMXoLgDt6TQleuOqWf/YArourDVJ0S
 QdYUirZ94URSb+4ZVIfMKGnpiiflZls7qEG53+pPkO0JRN+IDOeg3VXRWGbEnSq9TeQD
 TGhCxe0ctwZ0MiJz6zSyKzM3IzUPMPIzsa8i1Y2zxCd+EQA+a3KHP+7a1YOCxpThXgK3
 prbDaoUZWJt/AUZaoSysAtikkVzirRawZKHkzl3jLMzOKn4UNDYkRMsI4B5zMKwtkS6g 9A== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wrgwjgk2g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 09 Mar 2024 05:52:01 +0000
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4295q1lr004146;
	Sat, 9 Mar 2024 05:52:01 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wrgwjgk2d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 09 Mar 2024 05:52:01 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 4293qhSr031533;
	Sat, 9 Mar 2024 05:52:00 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3wmgnkrq9y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 09 Mar 2024 05:52:00 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4295ptrF38928700
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 9 Mar 2024 05:51:57 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0D1AD20043;
	Sat,  9 Mar 2024 05:51:55 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0BB8020040;
	Sat,  9 Mar 2024 05:51:48 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.52.192])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat,  9 Mar 2024 05:51:47 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        irogers@google.com, namhyung@kernel.org
Subject: [PATCH 0/3] Add data type profiling support for powerpc
Date: Sat,  9 Mar 2024 11:21:33 +0530
Message-Id: <20240309055136.96556-1-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: KPC7OSWUBZIVNC33ExGO_lMAK5ETQNfE
X-Proofpoint-ORIG-GUID: FYIqYk15zSWdZvfPdmxbe4vdzJwwfrMC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-08_08,2024-03-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 malwarescore=0 impostorscore=0 mlxlogscore=999 clxscore=1011 spamscore=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2403090045
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
Cc: Akanksha J N <Akanksha.J.N@ibm.com>, atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com, linux-perf-users@vger.kernel.org, maddy@linux.ibm.com, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Akanksha J N <Akanksha.J.N@ibm.com>

The patchset from Namhyung added support for data type profiling
in perf tool. This enabled support to associate PMU samples to data
types they refer using DWARF debug information. With the upstream
perf, currently it possible to run perf report or perf annotate to
view the data type information on x86.

This patchset includes changes need to enable data type profiling
support for powerpc. Main change are:
1. powerpc instruction nmemonic table to associate load/store
instructions with move_ops which is use to identify if instruction
is a memory access one.
2. To get register number and access offset from the given
instruction, code uses fields from "struct arch" -> objump.
Add entry for powerpc here.
3. A get_arch_regnum to return register number from the
register name string.

These three patches are the basic foundational patches.
With these changes, data types is getting identified for kernel
and user-space samples. There are still samples, which comes as
"unknown" and needs to be checked. We plan to get those addressed
in follow up. With the current patchset:

# ./perf record -a -e mem-loads sleep 1
# ./perf report -s type,typeoff --hierarchy --group --stdio
Snippet of logs:
#
# Total Lost Samples: 0
#
# Samples: 277  of events 'mem-loads, dummy:u'
# Event count (approx.): 149813
#
#            Overhead  Data Type / Data Type Offset
# ...................  ............................
#
    65.93%   0.00%     (unknown)
       65.93%   0.00%     (unknown) +0 (no field)
     8.19%   0.00%     struct vm_area_struct
        8.19%   0.00%     struct vm_area_struct +136 (vm_file)
     4.53%   0.00%     struct rq
        3.14%   0.00%     struct rq +0 (__lock.raw_lock.val)
        0.83%   0.00%     struct rq +3216 (avg_irq.runnable_sum)
        0.24%   0.00%     struct rq +4 (nr_running)
        0.14%   0.00%     struct rq +12 (nr_preferred_running)
        0.12%   0.00%     struct rq +2760 (sd)
        0.06%   0.00%     struct rq +3368 (prev_steal_time_rq)
        0.01%   0.00%     struct rq +2592 (curr)
     3.53%   0.00%     struct rb_node
        3.53%   0.00%     struct rb_node +0 (__rb_parent_color)
     3.43%   0.00%     struct slab
        3.43%   0.00%     struct slab +32 (freelist)
     3.30%   0.00%     unsigned int
        3.30%   0.00%     unsigned int +0 (no field)
     3.22%   0.00%     struct vm_fault
        3.22%   0.00%     struct vm_fault +48 (pmd)
     2.55%   0.00%     unsigned char
        2.55%   0.00%     unsigned char +0 (no field)
     1.06%   0.00%     struct task_struct
        1.06%   0.00%     struct task_struct +4 (thread_info.cpu)
     0.92%   0.00%     void*    
        0.92%   0.00%     void* +0 (no field)
     0.74%   0.00%     __int128 unsigned
        0.74%   0.00%     __int128 unsigned +8 (no field)
     0.59%   0.00%     struct perf_event
        0.54%   0.00%     struct perf_event +552 (ctx)
        0.04%   0.00%     struct perf_event +152 (pmu)
     0.20%   0.00%     struct sched_entity
        0.20%   0.00%     struct sched_entity +0 (load.weight)
     0.18%   0.00%     struct cfs_rq
        0.18%   0.00%     struct cfs_rq +96 (curr)

Thanks
Athira

Athira Rajeev (3):
  tools/perf/arch/powerpc: Add load/store in powerpc annotate
    instructions for data type profling
  tools/erf/util/annotate: Set register_char and memory_ref_char for
    powerpc
  tools/perf/arch/powerc: Add get_arch_regnum for powerpc

 .../perf/arch/powerpc/annotate/instructions.c | 66 +++++++++++++++++++
 tools/perf/arch/powerpc/util/dwarf-regs.c     | 29 ++++++++
 tools/perf/util/annotate.c                    |  5 ++
 3 files changed, 100 insertions(+)

-- 
2.43.0

