Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3F117534D
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Mar 2020 06:26:58 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48W7tR3XLBzDqZT
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Mar 2020 16:26:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ravi.bangoria@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48W7qf29L1zDqWJ
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Mar 2020 16:24:29 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0225OIwm042123
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 2 Mar 2020 00:24:26 -0500
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2yfmyq9kn3-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Mar 2020 00:24:26 -0500
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ravi.bangoria@linux.ibm.com>;
 Mon, 2 Mar 2020 05:24:24 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 2 Mar 2020 05:24:19 -0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0225OHi044892230
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 2 Mar 2020 05:24:17 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6BED452051;
 Mon,  2 Mar 2020 05:24:17 +0000 (GMT)
Received: from bangoria.in.ibm.com (unknown [9.124.31.175])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 3C1D05204E;
 Mon,  2 Mar 2020 05:24:14 +0000 (GMT)
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [RFC 00/11] perf: Enhancing perf to export processor hazard
 information
Date: Mon,  2 Mar 2020 10:53:44 +0530
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20030205-0028-0000-0000-000003DFC467
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20030205-0029-0000-0000-000024A4EBE6
Message-Id: <20200302052355.36365-1-ravi.bangoria@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-02_01:2020-02-28,
 2020-03-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015
 priorityscore=1501 mlxlogscore=999 malwarescore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003020039
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
Cc: mark.rutland@arm.com, ravi.bangoria@linux.ibm.com, ak@linux.intel.com,
 maddy@linux.ibm.com, peterz@infradead.org, alexey.budankov@linux.intel.com,
 adrian.hunter@intel.com, acme@kernel.org, alexander.shishkin@linux.intel.com,
 yao.jin@linux.intel.com, mingo@redhat.com, paulus@samba.org,
 eranian@google.com, robert.richter@amd.com, namhyung@kernel.org,
 kim.phillips@amd.com, jolsa@redhat.com, kan.liang@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Most modern microprocessors employ complex instruction execution
pipelines such that many instructions can be 'in flight' at any
given point in time. Various factors affect this pipeline and
hazards are the primary among them. Different types of hazards
exist - Data hazards, Structural hazards and Control hazards.
Data hazard is the case where data dependencies exist between
instructions in different stages in the pipeline. Structural
hazard is when the same processor hardware is needed by more
than one instruction in flight at the same time. Control hazards
are more the branch misprediction kinds. 

Information about these hazards are critical towards analyzing
performance issues and also to tune software to overcome such
issues. Modern processors export such hazard data in Performance
Monitoring Unit (PMU) registers. Ex, 'Sampled Instruction Event
Register' on IBM PowerPC[1][2] and 'Instruction-Based Sampling' on
AMD[3] provides similar information.

Implementation detail:

A new sample_type called PERF_SAMPLE_PIPELINE_HAZ is introduced.
If it's set, kernel converts arch specific hazard information
into generic format:

  struct perf_pipeline_haz_data {
         /* Instruction/Opcode type: Load, Store, Branch .... */
         __u8    itype;
         /* Instruction Cache source */
         __u8    icache;
         /* Instruction suffered hazard in pipeline stage */
         __u8    hazard_stage;
         /* Hazard reason */
         __u8    hazard_reason;
         /* Instruction suffered stall in pipeline stage */
         __u8    stall_stage;
         /* Stall reason */
         __u8    stall_reason;
         __u16   pad;
  };

... which can be read by user from mmap() ring buffer. With this
approach, sample perf report in hazard mode looks like (On IBM
PowerPC):

  # ./perf record --hazard ./ebizzy
  # ./perf report --hazard
  Overhead  Symbol          Shared  Instruction Type  Hazard Stage   Hazard Reason         Stall Stage   Stall Reason  ICache access
    36.58%  [.] thread_run  ebizzy  Load              LSU            Mispredict            LSU           Load fin      L1 hit
     9.46%  [.] thread_run  ebizzy  Load              LSU            Mispredict            LSU           Dcache_miss   L1 hit
     1.76%  [.] thread_run  ebizzy  Fixed point       -              -                     -             -             L1 hit
     1.31%  [.] thread_run  ebizzy  Load              LSU            ERAT Miss             LSU           Load fin      L1 hit
     1.27%  [.] thread_run  ebizzy  Load              LSU            Mispredict            -             -             L1 hit
     1.16%  [.] thread_run  ebizzy  Fixed point       -              -                     FXU           Fixed cycle   L1 hit
     0.50%  [.] thread_run  ebizzy  Fixed point       ISU            Source Unavailable    FXU           Fixed cycle   L1 hit
     0.30%  [.] thread_run  ebizzy  Load              LSU            LMQ Full, DERAT Miss  LSU           Load fin      L1 hit
     0.24%  [.] thread_run  ebizzy  Load              LSU            ERAT Miss             -             -             L1 hit
     0.08%  [.] thread_run  ebizzy  -                 -              -                     BRU           Fixed cycle   L1 hit
     0.05%  [.] thread_run  ebizzy  Branch            -              -                     BRU           Fixed cycle   L1 hit
     0.04%  [.] thread_run  ebizzy  Fixed point       ISU            Source Unavailable    -             -             L1 hit

Also perf annotate with hazard data:

         │    Disassembly of section .text:
         │
         │    0000000010001cf8 <compare>:
         │    compare():
         │    return NULL;
         │    }
         │
         │    static int
         │    compare(const void *p1, const void *p2)
         │    {
   33.23 │      std    r31,-8(r1)
         │       {haz_stage: LSU, haz_reason: ERAT Miss, stall_stage: LSU, stall_reason: Store, icache: L1 hit}
         │       {haz_stage: LSU, haz_reason: ERAT Miss, stall_stage: LSU, stall_reason: Store, icache: L1 hit}
         │       {haz_stage: LSU, haz_reason: Load Hit Store, stall_stage: LSU, stall_reason: -, icache: L3 hit}
         │       {haz_stage: LSU, haz_reason: ERAT Miss, stall_stage: -, stall_reason: -, icache: L1 hit}
         │       {haz_stage: LSU, haz_reason: ERAT Miss, stall_stage: LSU, stall_reason: Store, icache: L1 hit}
         │       {haz_stage: LSU, haz_reason: ERAT Miss, stall_stage: LSU, stall_reason: Store, icache: L1 hit}
    0.84 │      stdu   r1,-64(r1)
         │       {haz_stage: LSU, haz_reason: ERAT Miss, stall_stage: -, stall_reason: -, icache: L1 hit}
    0.24 │      mr     r31,r1
         │       {haz_stage: -, haz_reason: -, stall_stage: -, stall_reason: -, icache: L1 hit}
   21.18 │      std    r3,32(r31)
         │       {haz_stage: LSU, haz_reason: ERAT Miss, stall_stage: LSU, stall_reason: Store, icache: L1 hit}
         │       {haz_stage: LSU, haz_reason: ERAT Miss, stall_stage: LSU, stall_reason: Store, icache: L1 hit}
         │       {haz_stage: LSU, haz_reason: ERAT Miss, stall_stage: LSU, stall_reason: Store, icache: L1 hit}


Patches:
 - Patch #1 is a simple cleanup patch
 - Patch #2, #3, #4 implements generic and arch specific kernel
   infrastructure
 - Patch #5 enables perf record and script with hazard mode
 - Patch #6, #7, #8 enables perf report with hazard mode
 - Patch #9, #10, #11 enables perf annotate with hazard mode

Note:
 - This series is based on the talk by Madhavan in LPC 2018[4]. This is
   just an early RFC to get comments about the approach and not intended
   to be merged yet.
 - I've prepared the series base on v5.6-rc3. But it depends on generic
   perf annotate fixes [5][6] which are already merged by Arnaldo in
   perf/urgent and perf/core.

[1]: Book III, Section 9.4.10:
     https://openpowerfoundation.org/?resource_lib=power-isa-version-3-0 
[2]: https://wiki.raptorcs.com/w/images/6/6b/POWER9_PMU_UG_v12_28NOV2018_pub.pdf#G9.1106986
[3]: https://www.amd.com/system/files/TechDocs/24593.pdf#G19.1089550
[4]: https://linuxplumbersconf.org/event/2/contributions/76/
[5]: http://lore.kernel.org/r/20200204045233.474937-1-ravi.bangoria@linux.ibm.com
[6]: http://lore.kernel.org/r/20200213064306.160480-1-ravi.bangoria@linux.ibm.com


Madhavan Srinivasan (7):
  perf/core: Data structure to present hazard data
  powerpc/perf: Arch specific definitions for pipeline
  powerpc/perf: Arch support to expose Hazard data
  perf tools: Enable record and script to record and show hazard data
  perf hists: Make a room for hazard info in struct hist_entry
  perf hazard: Functions to convert generic hazard data to arch specific
    string
  perf report: Enable hazard mode

Ravi Bangoria (4):
  powerpc/perf: Simplify ISA207_SIER macros
  perf annotate: Introduce type for annotation_line
  perf annotate: Preparation for hazard
  perf annotate: Show hazard data in tui mode

 arch/powerpc/include/asm/perf_event_server.h  |   2 +
 .../include/uapi/asm/perf_pipeline_haz.h      |  80 ++++++
 arch/powerpc/perf/core-book3s.c               |   4 +
 arch/powerpc/perf/isa207-common.c             | 165 ++++++++++++-
 arch/powerpc/perf/isa207-common.h             |  23 +-
 arch/powerpc/perf/power8-pmu.c                |   1 +
 arch/powerpc/perf/power9-pmu.c                |   1 +
 include/linux/perf_event.h                    |   7 +
 include/uapi/linux/perf_event.h               |  32 ++-
 kernel/events/core.c                          |   6 +
 tools/include/uapi/linux/perf_event.h         |  32 ++-
 tools/perf/Documentation/perf-record.txt      |   3 +
 tools/perf/builtin-annotate.c                 |   7 +-
 tools/perf/builtin-c2c.c                      |   4 +-
 tools/perf/builtin-diff.c                     |   6 +-
 tools/perf/builtin-record.c                   |   1 +
 tools/perf/builtin-report.c                   |  29 +++
 tools/perf/tests/hists_link.c                 |   4 +-
 tools/perf/ui/browsers/annotate.c             | 128 ++++++++--
 tools/perf/ui/gtk/annotate.c                  |   6 +-
 tools/perf/util/Build                         |   2 +
 tools/perf/util/annotate.c                    | 153 +++++++++++-
 tools/perf/util/annotate.h                    |  38 ++-
 tools/perf/util/event.h                       |   1 +
 tools/perf/util/evsel.c                       |  10 +
 tools/perf/util/hazard.c                      |  51 ++++
 tools/perf/util/hazard.h                      |  14 ++
 tools/perf/util/hazard/Build                  |   1 +
 .../util/hazard/powerpc/perf_pipeline_haz.h   |  80 ++++++
 .../perf/util/hazard/powerpc/powerpc_hazard.c | 142 +++++++++++
 .../perf/util/hazard/powerpc/powerpc_hazard.h |  14 ++
 tools/perf/util/hist.c                        | 112 ++++++++-
 tools/perf/util/hist.h                        |  13 +
 tools/perf/util/machine.c                     |   6 +
 tools/perf/util/machine.h                     |   3 +
 tools/perf/util/perf_event_attr_fprintf.c     |   1 +
 tools/perf/util/record.h                      |   1 +
 tools/perf/util/session.c                     |  16 ++
 tools/perf/util/sort.c                        | 230 ++++++++++++++++++
 tools/perf/util/sort.h                        |  23 ++
 40 files changed, 1387 insertions(+), 65 deletions(-)
 create mode 100644 arch/powerpc/include/uapi/asm/perf_pipeline_haz.h
 create mode 100644 tools/perf/util/hazard.c
 create mode 100644 tools/perf/util/hazard.h
 create mode 100644 tools/perf/util/hazard/Build
 create mode 100644 tools/perf/util/hazard/powerpc/perf_pipeline_haz.h
 create mode 100644 tools/perf/util/hazard/powerpc/powerpc_hazard.c
 create mode 100644 tools/perf/util/hazard/powerpc/powerpc_hazard.h

-- 
2.21.1

