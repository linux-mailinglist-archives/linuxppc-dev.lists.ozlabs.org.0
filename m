Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F33D33281C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Mar 2021 15:06:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dvxph2Wt7z3cTK
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Mar 2021 01:06:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=O7tDaFlI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=O7tDaFlI; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DvxpD3m5Xz30Gs
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Mar 2021 01:06:28 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 129E2piD045088; Tue, 9 Mar 2021 09:06:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject : date : message-id; s=pp1;
 bh=Ikl7VIhMOKpIIZvsB3C1Do5nOeGwC2ju/uCK6iEwNh8=;
 b=O7tDaFlI1iuU+gOnTpd1MjeZaMzi7OR+bsE/Vcm2j0gIKKAYRsnWnw7iUXUKcBvOWUHB
 wX/6nAEnfgJzHlEFut6oPcv+dRc2VKxXRA5J7gitNYmcYmst7Coiqq02mCg/gnMnU1JG
 odtUv3hK5EE7vta5YBTfHzKu2L8SynRf3mJ2cikU/30Hep+DnTYD7h01+FEDqlLjeHAR
 1T58ChLA3sruKCrhSvQ7E5Q2vprDBEr1W7+1qzE6BwVDCBsNUn05ABJrImjRQVPSnv5W
 U9j4D/a7vQkEiU3/IpnP4jwmP7hb6MnP/NDxAt9WUp6dNTvqTAGOaA+A3tBoxI3qmwJv fA== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37640j3v9y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Mar 2021 09:06:06 -0500
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 129E3OxA022407;
 Tue, 9 Mar 2021 14:06:04 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03fra.de.ibm.com with ESMTP id 3768mpr1sy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Mar 2021 14:06:04 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 129E61Uu38011212
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 9 Mar 2021 14:06:01 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E9F514C052;
 Tue,  9 Mar 2021 14:06:00 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8DB224C044;
 Tue,  9 Mar 2021 14:04:21 +0000 (GMT)
Received: from localhost.localdomain.localdomain (unknown [9.195.34.70])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  9 Mar 2021 14:04:19 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, mpe@ellerman.id.au, acme@kernel.org,
 jolsa@kernel.org
Subject: [PATCH 0/4] powerpc/perf: Export processor pipeline stage cycles
 information
Date: Tue,  9 Mar 2021 09:03:56 -0500
Message-Id: <1615298640-1529-1-git-send-email-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-09_11:2021-03-08,
 2021-03-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 mlxlogscore=999 clxscore=1015 spamscore=0 impostorscore=0 mlxscore=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2103090071
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

Patch 1/4 adds kernel side support to store the cycle counter
values as part of 'var2_w' and 'var3_w' fields of perf_sample_weight
structure.

Patch 2/4 adds support to make the perf report column header
strings as dynamic.
Patch 3/4 adds powerpc support in perf tools for PERF_SAMPLE_WEIGHT_STRUCT
in sample type: PERF_SAMPLE_WEIGHT_TYPE.
Patch 4/4 adds support to present pipeline stage cycles as part of
mem-mode.

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


Athira Rajeev (4):
  powerpc/perf: Expose processor pipeline stage cycles using
    PERF_SAMPLE_WEIGHT_STRUCT
  tools/perf: Add dynamic headers for perf report columns
  tools/perf: Add powerpc support for PERF_SAMPLE_WEIGHT_STRUCT
  tools/perf: Support pipeline stage cycles for powerpc

 arch/powerpc/include/asm/perf_event_server.h |  2 +-
 arch/powerpc/perf/core-book3s.c              |  4 +--
 arch/powerpc/perf/isa207-common.c            | 29 ++++++++++++++++--
 arch/powerpc/perf/isa207-common.h            |  6 +++-
 tools/perf/Documentation/perf-report.txt     |  1 +
 tools/perf/arch/powerpc/util/Build           |  2 ++
 tools/perf/arch/powerpc/util/event.c         | 46 ++++++++++++++++++++++++++++
 tools/perf/arch/powerpc/util/evsel.c         |  8 +++++
 tools/perf/util/event.h                      |  2 ++
 tools/perf/util/hist.c                       | 11 +++++--
 tools/perf/util/hist.h                       |  1 +
 tools/perf/util/session.c                    |  4 ++-
 tools/perf/util/sort.c                       | 41 +++++++++++++++++++++++--
 tools/perf/util/sort.h                       |  2 ++
 14 files changed, 146 insertions(+), 13 deletions(-)
 create mode 100644 tools/perf/arch/powerpc/util/event.c
 create mode 100644 tools/perf/arch/powerpc/util/evsel.c

-- 
1.8.3.1

