Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BBCEA1745B2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Feb 2020 10:16:23 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48V1443L7kzDrCQ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Feb 2020 20:16:20 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48V11y52Q4zDqJt
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Feb 2020 20:14:29 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01T98jcs179155
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Feb 2020 04:14:27 -0500
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yfm4y97xs-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Feb 2020 04:14:27 -0500
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <kjain@linux.ibm.com>;
 Sat, 29 Feb 2020 09:14:24 -0000
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Sat, 29 Feb 2020 09:14:19 -0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 01T9EHsK45351168
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 29 Feb 2020 09:14:17 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 448EA11C054;
 Sat, 29 Feb 2020 09:14:17 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C537311C050;
 Sat, 29 Feb 2020 09:14:07 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.199.39.183])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Sat, 29 Feb 2020 09:14:07 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: acme@kernel.org, linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au,
 suka@linux.vnet.ibm.com
Subject: [PATCH v3 0/8] powerpc/perf: Add json file metric support for the
 hv_24x7 socket/chip level events
Date: Sat, 29 Feb 2020 14:43:48 +0530
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20022909-0012-0000-0000-0000038B6477
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20022909-0013-0000-0000-000021C8131F
Message-Id: <20200229091356.22157-1-kjain@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-29_02:2020-02-28,
 2020-02-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 mlxscore=0
 clxscore=1015 bulkscore=0 spamscore=0 mlxlogscore=999 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002290069
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
Cc: mark.rutland@arm.com, ravi.bangoria@linux.ibm.com, maddy@linux.vnet.ibm.com,
 tglx@linutronix.de, jmario@redhat.com, peterz@infradead.org,
 gregkh@linuxfoundation.org, mpetlan@redhat.com,
 alexander.shishkin@linux.intel.com, linux-perf-users@vger.kernel.org,
 ak@linux.intel.com, yao.jin@linux.intel.com, anju@linux.vnet.ibm.com,
 mamatha4@linux.vnet.ibm.com, kjain@linux.ibm.com, jolsa@kernel.org,
 namhyung@kernel.org, mingo@kernel.org, kan.liang@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

First patch of the patchset fix inconsistent results we are getting when
we run multiple 24x7 events.

Patchset adds json file metric support for the hv_24x7 socket/chip level
events. "hv_24x7" pmu interface events needs system dependent parameter
like socket/chip/core. For example, hv_24x7 chip level events needs
specific chip-id to which the data is requested should be added as part
of pmu events.

So to enable JSON file support to "hv_24x7" interface, patchset expose
total number of sockets and chips per-socket details in sysfs
files (sockets, chips) under "/sys/devices/hv_24x7/interface/".

To get sockets and number of chips per sockets, patchset adds a rtas call
with token "PROCESSOR_MODULE_INFO" to get these details. Patchset also
handles partition migration case to re-init these system depended
parameters by adding proper calls in post_mobility_fixup() (mobility.c).

Patch 6 & 8 of the patchset handles perf tool plumbing needed to replace
the "?" character in the metric expression to proper value and hv_24x7
json metric file for different Socket/chip resources.

Patch set also enable Hz/hz prinitg for --metric-only option to print
metric data for bus frequency.

Applied and tested all these patches cleanly on top of jiri's flex changes
patchset and made required changes.

Changelog:
v2 -> v3
- Remove setting  event_count to 0 part in function 'h_24x7_event_read'
  with comment rather then adding 0 to event_count value.
  Suggested by: Sukadev Bhattiprolu

- Apply tool side changes require to replace "?" on Jiri's flex patch
  series and made all require changes to make it compatible with added
  flex change.

v1 -> v2
- Rename hv-24x7 metric json file as nest_metrics.json

Kajol Jain (8):
  powerpc/perf/hv-24x7: Fix inconsistent output values incase multiple
    hv-24x7 events run
  powerpc/hv-24x7: Add rtas call in hv-24x7 driver to get processor
    details
  powerpc/hv-24x7: Add sysfs files inside hv-24x7 device to show
    processor details
  Documentation/ABI: Add ABI documentation for chips and sockets
  powerpc/hv-24x7: Update post_mobility_fixup() to handle migration
  perf/tools: Enhance JSON/metric infrastructure to handle "?"
  tools/perf: Enable Hz/hz prinitg for --metric-only option
  perf/tools/pmu-events/powerpc: Add hv_24x7 socket/chip level metric
    events

 .../sysfs-bus-event_source-devices-hv_24x7    |  14 +++
 arch/powerpc/perf/hv-24x7.c                   | 104 ++++++++++++++--
 arch/powerpc/platforms/pseries/mobility.c     |  12 ++
 arch/powerpc/platforms/pseries/pseries.h      |   3 +
 tools/perf/arch/powerpc/util/header.c         |  47 ++++++++
 .../arch/powerpc/power9/nest_metrics.json     |  19 +++
 tools/perf/util/expr.h                        |   1 +
 tools/perf/util/expr.l                        |  18 ++-
 tools/perf/util/expr.y                        |   2 +
 tools/perf/util/metricgroup.c                 | 112 +++++++++++-------
 tools/perf/util/metricgroup.h                 |   1 +
 tools/perf/util/stat-display.c                |   2 -
 tools/perf/util/stat-shadow.c                 |   6 +
 13 files changed, 286 insertions(+), 55 deletions(-)
 create mode 100644 tools/perf/pmu-events/arch/powerpc/power9/nest_metrics.json

-- 
2.21.0

