Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 38AF0642244
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Dec 2022 05:30:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NQVvk0zGZz3bgR
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Dec 2022 15:30:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TCNHrYAF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TCNHrYAF;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NQVtk2MNTz2xml
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Dec 2022 15:29:17 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2B540TtI037333;
	Mon, 5 Dec 2022 04:29:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=DPYja2i+8swycNALpY529Xep+PGkWuRM/8qARh8VO1s=;
 b=TCNHrYAFJiYnU3gCjehg5aNR/gdwVAV3MetavizJX4zrihvo5ymO81YGjUCDF6ZEi+XS
 3ASdokZ3WFhB+wPUG0FGWz8NmHVaSZdyx9emfn9etmjNGXkbbhtDVzHUyQmt+BTwVIzy
 8lueSoLYT2y4lx2L36yeIa2BW40ruPleEd2iGz8MGOR53CEqRsm1HRV1FeCbFl8fSaYA
 fAEKcRDr9tQLiGPEpSMhnNFtn1idqFmpQ8soV+4MWld7HTSSaq79pl3NqwbjeF9QOVmt
 xMpxiaPldyOLvve3UpIWZKBMmeHLVhh5gw8zhcPLNWAbl2zjl6ns6mRD+PQr0RiFwo2j dA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m8gh9yg08-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Dec 2022 04:29:04 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2B54SNUU018554;
	Mon, 5 Dec 2022 04:29:03 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m8gh9yfyr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Dec 2022 04:29:03 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
	by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2B53LC45017302;
	Mon, 5 Dec 2022 04:29:01 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by ppma04fra.de.ibm.com with ESMTP id 3m7x38sj01-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Dec 2022 04:29:01 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2B54SvJA4784654
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 5 Dec 2022 04:28:57 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A893642042;
	Mon,  5 Dec 2022 04:28:57 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7D57242041;
	Mon,  5 Dec 2022 04:28:54 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.96.42])
	by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon,  5 Dec 2022 04:28:54 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, ak@linux.intel.com
Subject: [V3] tools/perf: Fix printing field separator in CSV metrics output
Date: Mon,  5 Dec 2022 09:58:52 +0530
Message-Id: <20221205042852.83382-1-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: WoINqmJcM7ozIbfNiOMuRQ0rdTuNcptL
X-Proofpoint-GUID: q16YXwv0Oe2JyybE5AY0vaXqmZ7VnmMW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-05_01,2022-12-01_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1011
 bulkscore=0 impostorscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212050023
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
	S0,1,82.11,msec,cpu-clock,82111626,100.00,1.000,CPUs utilized
	S0,1,2,,context-switches,82109314,100.00,24.358,/sec
	------
====>	S0,1,,,,,,,1.71,stalled cycles per insn

The above command line uses field separator as ","
via "-x," option and per-socket option displays
socket value as first field. But here the last line
for "stalled cycles per insn" has more separators.
Each csv output line is expected to have 8 field
separators (for the 9 fields), where as last line
has 9 "," in the result. Patch fixes this issue.

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

This needs 4 csv separators. Patch removes aggr_fields
and uses 4 as fixed number of os->nfields to skip.

After the patch:

	# ./perf stat -x, --per-socket -a -C 1 ls
	S0,1,79.08,msec,cpu-clock,79085956,100.00,1.000,CPUs utilized
	S0,1,7,,context-switches,79084176,100.00,88.514,/sec
	------
====>	S0,1,,,,,,0.81,stalled cycles per insn

Fixes: 92a61f6412d3 ("perf stat: Implement CSV metrics output")
Reported-by: Disha Goel <disgoel@linux.vnet.ibm.com>
Reviewed-by: Kajol Jain <kjain@linux.ibm.com>
Tested-by: Disha Goel<disgoel@linux.vnet.ibm.com>
Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
Changelog:
v2 -> v3:
- Rebased on top of tmp.perf/core

v1 -> v2:
- Rebased on top of latest source.
- Added Reviewed-by and Tested-by from Kajol and
  Disha.

 tools/perf/util/stat-display.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/tools/perf/util/stat-display.c b/tools/perf/util/stat-display.c
index f1ee4b052198..4e9696f4096f 100644
--- a/tools/perf/util/stat-display.c
+++ b/tools/perf/util/stat-display.c
@@ -686,20 +686,9 @@ static void printout(struct perf_stat_config *config, struct outstate *os,
 	struct evsel *counter = os->evsel;
 
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
-		os->nfields = 3 + aggr_fields[config->aggr_mode] + (counter->cgrp ? 1 : 0);
+		os->nfields = 4 + (counter->cgrp ? 1 : 0);
 	} else if (config->json_output) {
 		pm = config->metric_only ? print_metric_only_json : print_metric_json;
 		nl = config->metric_only ? new_line_metric : new_line_json;
-- 
2.31.1

