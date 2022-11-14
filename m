Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F0D62783B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Nov 2022 09:56:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N9jq12YTSz3cNb
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Nov 2022 19:56:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dTAGpTXj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dTAGpTXj;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N9jp13ZsYz3blt
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Nov 2022 19:55:52 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.5) with ESMTP id 2AE7rlwW024630;
	Mon, 14 Nov 2022 08:55:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=a9Obil4L/SqCYDOBgLgYhTRskWi+CX5jOMidKyVBrlA=;
 b=dTAGpTXjx2ZN3626mtb1tecvHuQWaaZLiDHA0vT9N0xv8Xux5i01wn0ZMOlK3q1SsFmo
 xCOvCtAArS/+ldbrD4Du/DpBMTlcQf5C9m8rC7OgiMoRc0CScszhKQkLL4GN6z10bXIk
 XNdtyC/hbkcf7phVmT3UpcC206lXXL//K4hiAPk/BAA2upUMo+21ku0Vk+gCcw6kLKSt
 5mjDcdWmIGhkvCAVEmWhB59/fwfCHrPp1Onj1cegn/pOnrl2qqB1Q3yKqMSvReIiHUVd
 87ixwp/lX7sED2U4l6PrKB+4CHLmY3+kTKXrdVfe/0CmicdCtixts0FjN+dOnA4vb+5K 1Q== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kuhpe1np7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Nov 2022 08:55:34 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AE8BVbt018129;
	Mon, 14 Nov 2022 08:55:34 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com [149.81.74.107])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kuhpe1nnf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Nov 2022 08:55:33 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
	by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AE8oeMt005023;
	Mon, 14 Nov 2022 08:55:31 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by ppma03fra.de.ibm.com with ESMTP id 3kt348smr9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Nov 2022 08:55:31 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AE8tSwH31195432
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 14 Nov 2022 08:55:28 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F18FFA405F;
	Mon, 14 Nov 2022 08:55:27 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 34DF1A405B;
	Mon, 14 Nov 2022 08:55:25 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.93.244])
	by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 14 Nov 2022 08:55:24 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, ak@linux.intel.com
Subject: [PATCH V2] tools/perf: Fix printing field separator in CSV metrics output
Date: Mon, 14 Nov 2022 14:25:23 +0530
Message-Id: <20221114085523.86570-1-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: wV_CAXtjCpK4GCaneK3GaqjU9JhdaTjT
X-Proofpoint-ORIG-GUID: HJsW2mD2HkIq5dMObAkQmoujL5f3KQzX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-14_07,2022-11-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0
 clxscore=1015 bulkscore=0 mlxlogscore=999 malwarescore=0 impostorscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211140062
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
Cc: irogers@google.com, maddy@linux.vnet.ibm.com, rnsastry@linux.ibm.com, linux-perf-users@vger.kernel.org, james.clark@arm.com, kjain@linux.ibm.com, namhyung@kernel.org, disgoel@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In perf stat with CSV output option, number of fields
in metrics output is not matching with number of fields
in other event output lines.

Sample output below after applying patch to fix
printing os->prefix.

	# ./perf stat -x, --per-socket -a -C 1 ls
	S0,1,1.89,msec,cpu-clock,1887692,100.00,1.013,CPUs utilized
	S0,1,2,,context-switches,1885842,100.00,1.060,K/sec
	S0,1,0,,cpu-migrations,1885374,100.00,0.000,/sec
	S0,1,2,,page-faults,1884880,100.00,1.060,K/sec
	S0,1,189544,,cycles,1263158,67.00,0.100,GHz
	S0,1,64602,,stalled-cycles-frontend,1876146,100.00,34.08,frontend cycles idle
	S0,1,128241,,stalled-cycles-backend,1875512,100.00,67.66,backend cycles idle
	S0,1,95578,,instructions,1874676,100.00,0.50,insn per cycle
===>	S0,1,,,,,,,1.34,stalled cycles per insn

The above command line uses field separator as ","
via "-x," option and per-socket option displays
socket value as first field. But here the last line
for "stalled cycles per insn" has more separators.
Each csv output line is expected to have 8 field
separatorsi (for the 9 fields), where as last line
has 10 "," in the result. Patch fixes this issue.

The counter stats are displayed by function
"perf_stat__print_shadow_stats" in code
"util/stat-shadow.c". While printing the stats info
for "stalled cycles per insn", function "new_line_csv"
is used as new_line callback.

The fields printed in each line contains:
"Socket_id,aggr nr,Avg,unit,event_name,run,enable_percent,ratio,unit"

The metric output prints Socket_id, aggr nr, ratio
and unit. It has to skip through remaining five fields
ie, Avg,unit,event_name,run,enable_percent. The csv
line callback uses "os->nfields" to know the number of
fields to skip to match with other lines.
Currently it is set as:
	os.nfields = 3 + aggr_fields[config->aggr_mode] + (counter->cgrp ? 1 : 0);

But in case of aggregation modes, csv_sep already
gets printed along with each field (Function "aggr_printout"
in util/stat-display.c). So aggr_fields can be
removed from nfields. And fixed number of fields to
skip has to be "4". This is to skip fields for:
"avg, unit, event name, run, enable_percent"
Example from line for instructions:
"1.89,msec,cpu-clock,1887692,100.00"

This needs 4 csv separators. Patch removes aggr_fields
and uses 4 as fixed number of os->nfields to skip.

After the patch:

	# ./perf stat -x, --per-socket -a -C 1 ls
	S0,1,1.92,msec,cpu-clock,1917648,100.00,1.010,CPUs utilized
	S0,1,54,,context-switches,1916762,100.00,28.176,K/sec
	-------
	S0,1,528693,,instructions,1908854,100.00,0.36,insn per cycle
	S0,1,,,,,,1.81,stalled cycles per insn

Fixes: 92a61f6412d3 ("perf stat: Implement CSV metrics output")
Reported-by: Disha Goel <disgoel@linux.vnet.ibm.com>
Reviewed-By: Kajol Jain <kjain@linux.ibm.com>
Tested-by: Disha Goel<disgoel@linux.vnet.ibm.com>
Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
Changelog:
- Rebased on top of latest source.
- Added Reviewed-by and Tested-by from Kajol and
  Disha.

 tools/perf/util/stat-display.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/tools/perf/util/stat-display.c b/tools/perf/util/stat-display.c
index ba66bb7fc1ca..5ce14bf18055 100644
--- a/tools/perf/util/stat-display.c
+++ b/tools/perf/util/stat-display.c
@@ -551,20 +551,9 @@ static void printout(struct perf_stat_config *config, struct aggr_cpu_id id, int
 	new_line_t nl;
 
 	if (config->csv_output) {
-		static const int aggr_fields[AGGR_MAX] = {
-			[AGGR_NONE] = 1,
-			[AGGR_GLOBAL] = 0,
-			[AGGR_SOCKET] = 2,
-			[AGGR_DIE] = 2,
-			[AGGR_CORE] = 2,
-			[AGGR_THREAD] = 1,
-			[AGGR_UNSET] = 0,
-			[AGGR_NODE] = 1,
-		};
-
 		pm = config->metric_only ? print_metric_only_csv : print_metric_csv;
 		nl = config->metric_only ? new_line_metric : new_line_csv;
-		os.nfields = 3 + aggr_fields[config->aggr_mode] + (counter->cgrp ? 1 : 0);
+		os.nfields = 4 + (counter->cgrp ? 1 : 0);
 	} else if (config->json_output) {
 		pm = config->metric_only ? print_metric_only_json : print_metric_json;
 		nl = config->metric_only ? new_line_metric : new_line_json;
-- 
2.31.1

