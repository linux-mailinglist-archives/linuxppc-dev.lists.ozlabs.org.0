Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F40344871
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Mar 2021 16:00:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F3yNq11Jjz3cB2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 02:00:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=j3AaMjGT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=j3AaMjGT; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F3yLl163Dz3bcf
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Mar 2021 01:58:54 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12MEeTSA061275; Mon, 22 Mar 2021 10:57:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject : date : message-id; s=pp1;
 bh=dVwGdDKThnQaGbbNn+RikZfnRjeYnSmi8hcASj3kCsU=;
 b=j3AaMjGTyyyT1rbx3T4Afz6aDo8DtO7CrpIkfXI60pgLQg0SFZR/lpykyaXF1+AuaL+p
 H2AcgFAYypRta/IV+D/8EMiOynqtyqp3YrLvrfmaIRpk9gWDIAcq2OdDbojXDCZDjLn2
 QMl3SATOWjHz05bmvF23YeWK7abtHnHK1r/WMNKcqr2XYKKu5DZqqOsbnH4pRhvb4ZZu
 52V26MHW+HlQ6neD9gvyPFsrx6jFbunRYMpPMWXYoaE7OhZS7a5XWUTJtRE6fbQNtzn7
 AxhSCo+BLArSj9NIIhCbNPBF6ownMUapjkJrcjDFItV9O5fpOzaas1TH4z4YHqYPrfS1 eQ== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37dx3vv3mb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Mar 2021 10:57:39 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12MEvK4F032282;
 Mon, 22 Mar 2021 14:57:36 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03ams.nl.ibm.com with ESMTP id 37df68a1xb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Mar 2021 14:57:35 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12MEvXUr55705950
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 22 Mar 2021 14:57:33 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 12E0C4C058;
 Mon, 22 Mar 2021 14:57:33 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1DAE84C040;
 Mon, 22 Mar 2021 14:57:29 +0000 (GMT)
Received: from localhost.localdomain.localdomain (unknown [9.124.209.79])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 22 Mar 2021 14:57:28 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, mpe@ellerman.id.au, acme@kernel.org,
 jolsa@kernel.org
Subject: [PATCH V2 0/5] powerpc/perf: Export processor pipeline stage cycles
 information
Date: Mon, 22 Mar 2021 10:57:22 -0400
Message-Id: <1616425047-1666-1-git-send-email-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-22_07:2021-03-22,
 2021-03-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0
 mlxlogscore=999 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103220107
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
Cc: kan.liang@linux.intel.com, ravi.bangoria@linux.ibm.com,
 peterz@infradead.org, maddy@linux.ibm.com, kjain@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Performance Monitoring Unit (PMU) registers in powerpc exports
number of cycles elapsed between different stages in the pipeline.
Example, sampling registers in ISA v3.1.

This patchset implements kernel and perf tools support to expose
these pipeline stage cycles using the sample type PERF_SAMPLE_WEIGHT_TYPE.

Patch 1/5 adds kernel side support to store the cycle counter
values as part of 'var2_w' and 'var3_w' fields of perf_sample_weight
structure.

Patch 2/5 adds support to make the perf report column header
strings as dynamic.
Patch 3/5 adds powerpc support in perf tools for PERF_SAMPLE_WEIGHT_STRUCT
in sample type: PERF_SAMPLE_WEIGHT_TYPE.
Patch 4/5 adds support to present pipeline stage cycles as part of
mem-mode.
Patch 5/5 is to display the new sort dimenstion in perf report columns
only on powerpc.

Sample output on powerpc:

# perf mem record ls
# perf mem report

# To display the perf.data header info, please use --header/--header-only options.
#
#
# Total Lost Samples: 0
#
# Samples: 11  of event 'cpu/mem-loads/'
# Total weight : 1332
# Sort order   : local_weight,mem,sym,dso,symbol_daddr,dso_daddr,snoop,tlb,locked,blocked,local_ins_lat,stall_cyc
#
# Overhead       Samples  Local Weight  Memory access             Symbol                              Shared Object     Data Symbol                                    Data Object            Snoop         TLB access              Locked  Blocked     Finish Cyc     Dispatch Cyc 
# ........  ............  ............  ........................  ..................................  ................  .............................................  .....................  ............  ......................  ......  ..........  .............  .............
#
    44.14%             1  588           L1 hit                    [k] rcu_nmi_exit                    [kernel.vmlinux]  [k] 0xc0000007ffdd21b0                         [unknown]              N/A           N/A                     No       N/A        7              5            
    22.22%             1  296           L1 hit                    [k] copypage_power7                 [kernel.vmlinux]  [k] 0xc0000000ff6a1780                         [unknown]              N/A           N/A                     No       N/A        293            3            
     6.98%             1  93            L1 hit                    [.] _dl_addr                        libc-2.31.so      [.] 0x00007fff86fa5058                         libc-2.31.so           N/A           N/A                     No       N/A        7              1            
     6.61%             1  88            L2 hit                    [.] new_do_write                    libc-2.31.so      [.] _IO_2_1_stdout_+0x0                        libc-2.31.so           N/A           N/A                     No       N/A        84             1            
     5.93%             1  79            L1 hit                    [k] printk_nmi_exit                 [kernel.vmlinux]  [k] 0xc0000006085df6b0                         [unknown]              N/A           N/A                     No       N/A        7              1            
     4.05%             1  54            L2 hit                    [.] __alloc_dir                     libc-2.31.so      [.] 0x00007fffdb70a640                         [stack]                N/A           N/A                     No       N/A        18             1            
     3.60%             1  48            L1 hit                    [.] _init                           ls                [.] 0x000000016ca82118                         [heap]                 N/A           N/A                     No       N/A        7              6            
     2.40%             1  32            L1 hit                    [k] desc_read                       [kernel.vmlinux]  [k] _printk_rb_static_descs+0x1ea10            [kernel.vmlinux].data  N/A           N/A                     No       N/A        7              1            
     1.65%             1  22            L2 hit                    [k] perf_iterate_ctx.constprop.139  [kernel.vmlinux]  [k] 0xc00000064d79e8a8                         [unknown]              N/A           N/A                     No       N/A        16             1            
     1.58%             1  21            L1 hit                    [k] perf_event_interrupt            [kernel.vmlinux]  [k] 0xc0000006085df6b0                         [unknown]              N/A           N/A                     No       N/A        7              1            
     0.83%             1  11            L1 hit                    [k] perf_event_exec                 [kernel.vmlinux]  [k] 0xc0000007ffdd3288                         [unknown]              N/A           N/A                     No       N/A        7              4            


Changelog:
Changes from v1 -> v2
  Addressed Jiri's review comments:
  - Display the new sort dimension 'p_stage_cyc' only
    on supported architecture.
  - Check for arch specific header string for matching
    sort order in patch2.
  
Athira Rajeev (5):
  powerpc/perf: Expose processor pipeline stage cycles using
    PERF_SAMPLE_WEIGHT_STRUCT
  tools/perf: Add dynamic headers for perf report columns
  tools/perf: Add powerpc support for PERF_SAMPLE_WEIGHT_STRUCT
  tools/perf: Support pipeline stage cycles for powerpc
  tools/perf: Display sort dimension p_stage_cyc only on supported archs

 arch/powerpc/include/asm/perf_event_server.h |  2 +-
 arch/powerpc/perf/core-book3s.c              |  4 +-
 arch/powerpc/perf/isa207-common.c            | 29 ++++++++++++--
 arch/powerpc/perf/isa207-common.h            |  6 ++-
 tools/perf/Documentation/perf-report.txt     |  2 +
 tools/perf/arch/powerpc/util/Build           |  2 +
 tools/perf/arch/powerpc/util/event.c         | 53 ++++++++++++++++++++++++
 tools/perf/arch/powerpc/util/evsel.c         |  8 ++++
 tools/perf/util/event.h                      |  3 ++
 tools/perf/util/hist.c                       | 11 +++--
 tools/perf/util/hist.h                       |  1 +
 tools/perf/util/session.c                    |  4 +-
 tools/perf/util/sort.c                       | 60 +++++++++++++++++++++++++++-
 tools/perf/util/sort.h                       |  2 +
 14 files changed, 174 insertions(+), 13 deletions(-)
 create mode 100644 tools/perf/arch/powerpc/util/event.c
 create mode 100644 tools/perf/arch/powerpc/util/evsel.c

-- 
1.8.3.1

