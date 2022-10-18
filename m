Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ED50E6027A6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Oct 2022 10:57:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ms7696FYDz3drW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Oct 2022 19:57:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GPMwGisS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GPMwGisS;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ms7584ftrz3bjX
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Oct 2022 19:56:27 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29I85uKc019395;
	Tue, 18 Oct 2022 08:56:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=oiuINvy70NS5JaBFvpoox4D4IDxLIhoYFcAEjSMgleg=;
 b=GPMwGisS3eQH1ta6A+onjua1ark5TJ+IpsOyow/uUL/3ryRTzi2HwBl7RDSRRkXqJwc6
 n3UQS8vQ8elD8SZd9DjQ79DQDAE9wr88K46u9afBCx6LZ7P/49JwQoy/qAcGI2R+nkLv
 kRL4Q4VRmSvRhCETAV7YqUHoJQcsOnt5rF7u2P5L8KEfoTon+LQJ3sFOSmOiYTsL+XdQ
 BoJWYpS1BTFJ0DaB/t3WrKylPwkQTZw0mmuEO6dmQuYkLTcnchzjy4YxNJ4OOhHwnGPu
 z1jTg+ULb+S+bRAbbnCRiDt9W8JY0yMwy7DWMgJNxdleiUrUbmIsOTWPGuhWZvsuETpw Yg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k9qyvj19c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Oct 2022 08:56:16 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29I87aBE026839;
	Tue, 18 Oct 2022 08:56:15 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com [149.81.74.108])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k9qyvj18d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Oct 2022 08:56:15 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
	by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29I8pR80013167;
	Tue, 18 Oct 2022 08:56:13 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
	by ppma05fra.de.ibm.com with ESMTP id 3k7mg8unx9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Oct 2022 08:56:13 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 29I8uAMx32309880
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 18 Oct 2022 08:56:10 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 339E9AE04D;
	Tue, 18 Oct 2022 08:56:10 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D64ABAE053;
	Tue, 18 Oct 2022 08:56:06 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.34.247])
	by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Tue, 18 Oct 2022 08:56:06 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, ak@linux.intel.com
Subject: [PATCH 1/2] tools/perf: Fix printing os->prefix in CSV metrics output
Date: Tue, 18 Oct 2022 14:26:04 +0530
Message-Id: <20221018085605.63834-1-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 5SxR6uL8_5vU0l6vta8lmb5gIDddTdKh
X-Proofpoint-ORIG-GUID: CpVtYrAnNpn5kIUs9LbZH5DRphCy0lZy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-18_01,2022-10-17_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 priorityscore=1501 mlxscore=0 phishscore=0 mlxlogscore=999 impostorscore=0
 suspectscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

Perf stat with CSV output option prints an extra empty
string as first field in metrics output line.
Sample output below:

	# ./perf stat -x, --per-socket -a -C 1 ls
	S0,1,1.78,msec,cpu-clock,1785146,100.00,0.973,CPUs utilized
	S0,1,26,,context-switches,1781750,100.00,0.015,M/sec
	S0,1,1,,cpu-migrations,1780526,100.00,0.561,K/sec
	S0,1,1,,page-faults,1779060,100.00,0.561,K/sec
	S0,1,875807,,cycles,1769826,100.00,0.491,GHz
	S0,1,85281,,stalled-cycles-frontend,1767512,100.00,9.74,frontend cycles idle
	S0,1,576839,,stalled-cycles-backend,1766260,100.00,65.86,backend cycles idle
	S0,1,288430,,instructions,1762246,100.00,0.33,insn per cycle
====>	,S0,1,,,,,,,2.00,stalled cycles per insn

The above command line uses field separator as ","
via "-x," option and per-socket option displays
socket value as first field. But here the last line
for "stalled cycles per insn" has "," in the
beginning.

Sample output using interval mode:
	# ./perf stat -I 1000 -x, --per-socket -a -C 1 ls
	0.001813453,S0,1,1.87,msec,cpu-clock,1872052,100.00,0.002,CPUs utilized
	0.001813453,S0,1,2,,context-switches,1868028,100.00,1.070,K/sec
	------
	0.001813453,S0,1,85379,,instructions,1856754,100.00,0.32,insn per cycle
====>	0.001813453,,S0,1,,,,,,,1.34,stalled cycles per insn

Above result also has an extra csv separator after
the timestamp. Patch addresses extra field separator
in the beginning of the metric output line.

The counter stats are displayed by function
"perf_stat__print_shadow_stats" in code
"util/stat-shadow.c". While printing the stats info
for "stalled cycles per insn", function "new_line_csv"
is used as new_line callback.

The new_line_csv function has check for "os->prefix"
and if prefix is not null, it will be printed along
with cvs separator.
Snippet from "new_line_csv":
	if (os->prefix)
               fprintf(os->fh, "%s%s", os->prefix, config->csv_sep);

Here os->prefix gets printed followed by ","
which is the cvs separator. The os->prefix is
used in interval mode option ( -I ), to print
time stamp on every new line. But prefix is
already set to contain csv separator when used
in interval mode for csv option.

Reference: Function "static void print_interval"
Snippet:
	sprintf(prefix, "%6lu.%09lu%s", ts->tv_sec, ts->tv_nsec, config->csv_sep);

Also if prefix is not assigned (if not used with
-I option), it gets set to empty string.
Reference: function printout() in util/stat-display.c
Snippet:
	.prefix = prefix ? prefix : "",

Since prefix already set to contain cvs_sep in interval
option, patch removes printing config->csv_sep in
new_line_csv function to avoid printing extra field.

After the patch:

	# ./perf stat -x, --per-socket -a -C 1 ls
	S0,1,2.04,msec,cpu-clock,2045202,100.00,1.013,CPUs utilized
	S0,1,2,,context-switches,2041444,100.00,979.289,/sec
	S0,1,0,,cpu-migrations,2040820,100.00,0.000,/sec
	S0,1,2,,page-faults,2040288,100.00,979.289,/sec
	S0,1,254589,,cycles,2036066,100.00,0.125,GHz
	S0,1,82481,,stalled-cycles-frontend,2032420,100.00,32.40,frontend cycles idle
	S0,1,113170,,stalled-cycles-backend,2031722,100.00,44.45,backend cycles idle
	S0,1,88766,,instructions,2030942,100.00,0.35,insn per cycle
	S0,1,,,,,,,1.27,stalled cycles per insn

Fixes: 92a61f6412d3 ("perf stat: Implement CSV metrics output")
Reported-by: Disha Goel <disgoel@linux.vnet.ibm.com>
Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 tools/perf/util/stat-display.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/perf/util/stat-display.c b/tools/perf/util/stat-display.c
index 5c47ee9963a7..879874a4bc07 100644
--- a/tools/perf/util/stat-display.c
+++ b/tools/perf/util/stat-display.c
@@ -273,7 +273,7 @@ static void new_line_csv(struct perf_stat_config *config, void *ctx)
 
 	fputc('\n', os->fh);
 	if (os->prefix)
-		fprintf(os->fh, "%s%s", os->prefix, config->csv_sep);
+		fprintf(os->fh, "%s", os->prefix);
 	aggr_printout(config, os->evsel, os->id, os->nr);
 	for (i = 0; i < os->nfields; i++)
 		fputs(config->csv_sep, os->fh);
-- 
2.31.1

