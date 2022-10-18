Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE286027AA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Oct 2022 10:58:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ms77C4jsgz3cjY
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Oct 2022 19:58:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VCuOtGAu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VCuOtGAu;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ms75C1Xd7z3bjX
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Oct 2022 19:56:30 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29I8ht17025247;
	Tue, 18 Oct 2022 08:56:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=tHGQmPBMIckLRPybp4xPIQ97WgrcqQRb7mb/Xd26x2w=;
 b=VCuOtGAuWOl+2yk0V5Ig+7Ssoa59vNpd1vLMv7f2UC1bsEN+sQUSSid2wIx8ZELVWcyi
 Gge9q6FmwjfAbDQiOA2lMf9OmLiB5mVGi7GB0CfDsRkyzssE36gFsVkjSj1tTHgbsoLO
 1cB7d+XiiDjbo7aP9fmGDAVkwMBxZjyHRkHuGBmANFgIW70Wsj2OwnLO4EZWJcUPjVBy
 2HlMC5K27XLBWZ3pk/R2zjdjIc7aaoTWFgdKf1MB/OqFDeNavUyROsy6oPsyuxyfr8uJ
 49Abfr/N/sbIpx7MQud8OkJlPt28cvyglHfHITcgSgMflwWxHi7hpHO0iicYqaOMRQaz 0g== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k9rvq0bn7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Oct 2022 08:56:19 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29I8jFna031214;
	Tue, 18 Oct 2022 08:56:18 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k9rvq0bmj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Oct 2022 08:56:18 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29I8opJB009552;
	Tue, 18 Oct 2022 08:56:17 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma06ams.nl.ibm.com with ESMTP id 3k7m4jmv9r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Oct 2022 08:56:16 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 29I8pGSU45679090
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 18 Oct 2022 08:51:16 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B3A1BAE04D;
	Tue, 18 Oct 2022 08:56:13 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A4C94AE051;
	Tue, 18 Oct 2022 08:56:10 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.34.247])
	by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Tue, 18 Oct 2022 08:56:10 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, ak@linux.intel.com
Subject: [PATCH 2/2] tools/perf: Fix printing field separator in CSV metrics output
Date: Tue, 18 Oct 2022 14:26:05 +0530
Message-Id: <20221018085605.63834-2-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221018085605.63834-1-atrajeev@linux.vnet.ibm.com>
References: <20221018085605.63834-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: _tOXVZzbcIEHxiCAgYWtpdFKKkdP1-gq
X-Proofpoint-GUID: WMmWhUa0-sEAWxqXz5Olcam6hXy-NGjo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-18_01,2022-10-17_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 mlxlogscore=999 impostorscore=0 adultscore=0 suspectscore=0
 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210180048
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
Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 tools/perf/util/stat-display.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/tools/perf/util/stat-display.c b/tools/perf/util/stat-display.c
index 879874a4bc07..5ca151adf826 100644
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
-			[AGGR_NODE] = 0,
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

