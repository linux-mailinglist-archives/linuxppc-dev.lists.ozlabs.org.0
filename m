Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA5D19B721
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 22:37:31 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48sygC3B48zDr8m
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 07:37:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48sybp5QSjzDqLx
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Apr 2020 07:34:30 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 031KWnnk109880
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 1 Apr 2020 16:34:28 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 303wrxra65-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Apr 2020 16:34:27 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <kjain@linux.ibm.com>;
 Wed, 1 Apr 2020 21:34:23 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 1 Apr 2020 21:34:17 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 031KXE0t50528760
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 1 Apr 2020 20:33:14 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 255F7A405B;
 Wed,  1 Apr 2020 20:34:18 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 65BB9A405F;
 Wed,  1 Apr 2020 20:34:12 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.199.38.236])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  1 Apr 2020 20:34:12 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: acme@kernel.org, linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au,
 sukadev@linux.vnet.ibm.com
Subject: [PATCH v8 0/7] powerpc/perf: Add json file metric support for the
 hv_24x7 socket/chip level events
Date: Thu,  2 Apr 2020 02:03:33 +0530
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20040120-0028-0000-0000-000003F03BF9
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20040120-0029-0000-0000-000024B5C36C
Message-Id: <20200401203340.31402-1-kjain@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-01_04:2020-03-31,
 2020-04-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 mlxlogscore=999 clxscore=1015 bulkscore=0 malwarescore=0 suspectscore=0
 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004010170
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
Cc: mark.rutland@arm.com, maddy@linux.vnet.ibm.com, peterz@infradead.org,
 yao.jin@linux.intel.com, mingo@kernel.org, kan.liang@linux.intel.com,
 ak@linux.intel.com, alexander.shishkin@linux.intel.com,
 anju@linux.vnet.ibm.com, mamatha4@linux.vnet.ibm.com,
 ravi.bangoria@linux.ibm.com, kjain@linux.ibm.com, jmario@redhat.com,
 namhyung@kernel.org, tglx@linutronix.de, mpetlan@redhat.com,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, jolsa@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Patchset adds json file metric support for the hv_24x7 socket/chip level
events. "hv_24x7" pmu interface events needs system dependent parameter
like socket/chip/core. For example, hv_24x7 chip level events needs
specific chip-id to which the data is requested should be added as part
of pmu events.

So to enable JSON file support to "hv_24x7" interface, patchset reads
total number of sockets details in sysfs under 
"/sys/devices/hv_24x7/interface/".

Second patch of the patchset adds expr_scanner_ctx object to hold user
data for the expr scanner, which can be used to hold runtime parameter.

Patch 4 & 6 of the patchset handles perf tool plumbing needed to replace
the "?" character in the metric expression to proper value and hv_24x7
json metric file for different Socket/chip resources.

Patch set also enable Hz/hz prinitg for --metric-only option to print
metric data for bus frequency.

Applied and tested all these patches cleanly on top of jiri's flex changes
with the changes done by Kan Liang for "Support metric group constraint"
patchset and made required changes.

Also apply this patch on top of the fix patch send earlier
for printing metric name incase overlapping events.
https://git.kernel.org/pub/scm/linux/kernel/git/acme/linux.git/commit/?h=perf/core&id=37cd7f65bf71a48f25eeb6d9be5dacb20d008ea6

Changelog:
v7 -> v8
- Add test case for testing parsing of "?" in metric expression
- Reaname variables name to runtime

v6 -> v7
- Spit patchset into two patch series one for kernel changes and other
  for tool side changes.
- Made changes Suggested by Jiri, including rather then reading runtime
  parameter from metric name, actually add it in structure egroup and
  metric_expr.
- As we don't need to read runtime parameter from metric name,
  now I am not appending it and rather just printing it in
  generic_metric function.

Kernel Side changes patch series: https://lkml.org/lkml/2020/3/27/58

v5 -> v6
- resolve compilation issue due to rearranging patch series.
- Rather then adding new function to take careof case for runtime param
  in metricgroup__add_metric, using metricgroup__add_metric_param itself
  for that work.
- Address some optimization suggested like using directly file path
  rather then adding new macro in header.c
- Change commit message on patch where we are adding "?" support
  by adding simple example.

v4 -> v5
- Using sysfs__read_int instead of sysfs__read_ull while reading
  parameter value in powerpc/util/header.c file.

- Using asprintf rather then malloc and sprintf 
  Suggested by Arnaldo Carvalho de Melo

- Break patch 6 from previous version to two patch,
  - One to add refactor current "metricgroup__add_metric" function
    and another where actually "?" handling infra added.

- Add expr__runtimeparam as part of 'expr_scanner_ctx' struct
  rather then making it global variable. Thanks Jiri for
  adding this structure to hold user data for the expr scanner.

- Add runtime param as agrugement to function 'expr__find_other'
  and 'expr__parse' and made changes on references accordingly.

v3 -> v4
- Apply these patch on top of Kan liang changes.
  As suggested by Jiri.

v2 -> v3
- Remove setting  event_count to 0 part in function 'h_24x7_event_read'
  with comment rather then adding 0 to event_count value.
  Suggested by: Sukadev Bhattiprolu

- Apply tool side changes require to replace "?" on Jiri's flex patch
  series and made all require changes to make it compatible with added
  flex change.

v1 -> v2
- Rename hv-24x7 metric json file as nest_metrics.json

Jiri Olsa (2):
  perf expr: Add expr_ prefix for parse_ctx and parse_id
  perf expr: Add expr_scanner_ctx object

Kajol Jain (5):
  perf/tools: Refactoring metricgroup__add_metric function
  perf/tools: Enhance JSON/metric infrastructure to handle "?"
  perf/tests/expr: Added test for runtime param in metric expression
  tools/perf: Enable Hz/hz prinitg for --metric-only option
  perf/tools/pmu-events/powerpc: Add hv_24x7 socket/chip level metric
    events

 tools/perf/arch/powerpc/util/header.c         |  8 ++
 .../arch/powerpc/power9/nest_metrics.json     | 19 +++++
 tools/perf/tests/expr.c                       | 20 +++--
 tools/perf/util/expr.c                        | 25 +++---
 tools/perf/util/expr.h                        | 19 +++--
 tools/perf/util/expr.l                        | 37 ++++++---
 tools/perf/util/expr.y                        |  6 +-
 tools/perf/util/metricgroup.c                 | 78 +++++++++++++------
 tools/perf/util/metricgroup.h                 |  2 +
 tools/perf/util/stat-display.c                |  2 -
 tools/perf/util/stat-shadow.c                 | 19 +++--
 11 files changed, 164 insertions(+), 71 deletions(-)
 create mode 100644 tools/perf/pmu-events/arch/powerpc/power9/nest_metrics.json

-- 
2.21.0

