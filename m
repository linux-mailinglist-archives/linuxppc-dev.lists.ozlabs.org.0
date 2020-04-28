Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3F91BB6CF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 08:36:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49BBk04WBxzDqvt
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 16:36:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49BBff3r9CzDqvV
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Apr 2020 16:33:14 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03S61ctt084369; Tue, 28 Apr 2020 02:32:54 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30mh330rns-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Apr 2020 02:32:54 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 03S62l5f088216;
 Tue, 28 Apr 2020 02:32:54 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30mh330rnc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Apr 2020 02:32:53 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 03S6VpCv002840;
 Tue, 28 Apr 2020 06:32:53 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma05wdc.us.ibm.com with ESMTP id 30mcu69jxg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Apr 2020 06:32:52 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03S6Wq5K15991286
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Apr 2020 06:32:52 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6372FAE05C;
 Tue, 28 Apr 2020 06:32:52 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 347E7AE060;
 Tue, 28 Apr 2020 06:32:44 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.199.55.78])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 28 Apr 2020 06:32:43 +0000 (GMT)
Subject: Re: [PATCH v8 0/7] powerpc/perf: Add json file metric support for the
 hv_24x7 socket/chip level events
To: acme@kernel.org, linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au,
 sukadev@linux.vnet.ibm.com
References: <20200401203340.31402-1-kjain@linux.ibm.com>
From: kajoljain <kjain@linux.ibm.com>
Message-ID: <fa31bc42-d34c-c788-0109-350d769b51ce@linux.ibm.com>
Date: Tue, 28 Apr 2020 12:02:42 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200401203340.31402-1-kjain@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-28_02:2020-04-27,
 2020-04-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 lowpriorityscore=0 malwarescore=0 mlxlogscore=999 priorityscore=1501
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004280046
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
 tglx@linutronix.de, jmario@redhat.com, mpetlan@redhat.com,
 peterz@infradead.org, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 alexander.shishkin@linux.intel.com, linux-perf-users@vger.kernel.org,
 ak@linux.intel.com, yao.jin@linux.intel.com, anju@linux.vnet.ibm.com,
 mamatha4@linux.vnet.ibm.com, jolsa@kernel.org, namhyung@kernel.org,
 mingo@kernel.org, kan.liang@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Arnaldo,
	Please let me know if there any changes required in this patchset,
as some of its patches are still not part of your perf/core tree.

Thanks,
Kajol Jain

On 4/2/20 2:03 AM, Kajol Jain wrote:
> Patchset adds json file metric support for the hv_24x7 socket/chip level
> events. "hv_24x7" pmu interface events needs system dependent parameter
> like socket/chip/core. For example, hv_24x7 chip level events needs
> specific chip-id to which the data is requested should be added as part
> of pmu events.
> 
> So to enable JSON file support to "hv_24x7" interface, patchset reads
> total number of sockets details in sysfs under 
> "/sys/devices/hv_24x7/interface/".
> 
> Second patch of the patchset adds expr_scanner_ctx object to hold user
> data for the expr scanner, which can be used to hold runtime parameter.
> 
> Patch 4 & 6 of the patchset handles perf tool plumbing needed to replace
> the "?" character in the metric expression to proper value and hv_24x7
> json metric file for different Socket/chip resources.
> 
> Patch set also enable Hz/hz prinitg for --metric-only option to print
> metric data for bus frequency.
> 
> Applied and tested all these patches cleanly on top of jiri's flex changes
> with the changes done by Kan Liang for "Support metric group constraint"
> patchset and made required changes.
> 
> Also apply this patch on top of the fix patch send earlier
> for printing metric name incase overlapping events.
> https://git.kernel.org/pub/scm/linux/kernel/git/acme/linux.git/commit/?h=perf/core&id=37cd7f65bf71a48f25eeb6d9be5dacb20d008ea6
> 
> Changelog:
> v7 -> v8
> - Add test case for testing parsing of "?" in metric expression
> - Reaname variables name to runtime
> 
> v6 -> v7
> - Spit patchset into two patch series one for kernel changes and other
>   for tool side changes.
> - Made changes Suggested by Jiri, including rather then reading runtime
>   parameter from metric name, actually add it in structure egroup and
>   metric_expr.
> - As we don't need to read runtime parameter from metric name,
>   now I am not appending it and rather just printing it in
>   generic_metric function.
> 
> Kernel Side changes patch series: https://lkml.org/lkml/2020/3/27/58
> 
> v5 -> v6
> - resolve compilation issue due to rearranging patch series.
> - Rather then adding new function to take careof case for runtime param
>   in metricgroup__add_metric, using metricgroup__add_metric_param itself
>   for that work.
> - Address some optimization suggested like using directly file path
>   rather then adding new macro in header.c
> - Change commit message on patch where we are adding "?" support
>   by adding simple example.
> 
> v4 -> v5
> - Using sysfs__read_int instead of sysfs__read_ull while reading
>   parameter value in powerpc/util/header.c file.
> 
> - Using asprintf rather then malloc and sprintf 
>   Suggested by Arnaldo Carvalho de Melo
> 
> - Break patch 6 from previous version to two patch,
>   - One to add refactor current "metricgroup__add_metric" function
>     and another where actually "?" handling infra added.
> 
> - Add expr__runtimeparam as part of 'expr_scanner_ctx' struct
>   rather then making it global variable. Thanks Jiri for
>   adding this structure to hold user data for the expr scanner.
> 
> - Add runtime param as agrugement to function 'expr__find_other'
>   and 'expr__parse' and made changes on references accordingly.
> 
> v3 -> v4
> - Apply these patch on top of Kan liang changes.
>   As suggested by Jiri.
> 
> v2 -> v3
> - Remove setting  event_count to 0 part in function 'h_24x7_event_read'
>   with comment rather then adding 0 to event_count value.
>   Suggested by: Sukadev Bhattiprolu
> 
> - Apply tool side changes require to replace "?" on Jiri's flex patch
>   series and made all require changes to make it compatible with added
>   flex change.
> 
> v1 -> v2
> - Rename hv-24x7 metric json file as nest_metrics.json
> 
> Jiri Olsa (2):
>   perf expr: Add expr_ prefix for parse_ctx and parse_id
>   perf expr: Add expr_scanner_ctx object
> 
> Kajol Jain (5):
>   perf/tools: Refactoring metricgroup__add_metric function
>   perf/tools: Enhance JSON/metric infrastructure to handle "?"
>   perf/tests/expr: Added test for runtime param in metric expression
>   tools/perf: Enable Hz/hz prinitg for --metric-only option
>   perf/tools/pmu-events/powerpc: Add hv_24x7 socket/chip level metric
>     events
> 
>  tools/perf/arch/powerpc/util/header.c         |  8 ++
>  .../arch/powerpc/power9/nest_metrics.json     | 19 +++++
>  tools/perf/tests/expr.c                       | 20 +++--
>  tools/perf/util/expr.c                        | 25 +++---
>  tools/perf/util/expr.h                        | 19 +++--
>  tools/perf/util/expr.l                        | 37 ++++++---
>  tools/perf/util/expr.y                        |  6 +-
>  tools/perf/util/metricgroup.c                 | 78 +++++++++++++------
>  tools/perf/util/metricgroup.h                 |  2 +
>  tools/perf/util/stat-display.c                |  2 -
>  tools/perf/util/stat-shadow.c                 | 19 +++--
>  11 files changed, 164 insertions(+), 71 deletions(-)
>  create mode 100644 tools/perf/pmu-events/arch/powerpc/power9/nest_metrics.json
> 
