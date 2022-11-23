Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28AD66354D6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Nov 2022 10:12:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NHFkS6fZHz3cKb
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Nov 2022 20:12:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=tTDWWV/i;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=tTDWWV/i;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NHFjW42R4z3cGD
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Nov 2022 20:11:11 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D064361B14;
	Wed, 23 Nov 2022 09:11:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72099C433D7;
	Wed, 23 Nov 2022 09:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1669194667;
	bh=GXMwyAFHH9LtUUd0vupv4sOaQtEdgJicv+5Xo2PzPp4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tTDWWV/i8ylNnUWJxVvj8KqwYxHX714nE3j4F0xJMRsvPCoterdNRmDk2JVHw2ajU
	 yug61nlIFnIfEZBwTnbV2scDW45w4UM/28BUclpF6i65Q2wCz75leSH2ppLd7S/vLn
	 SOQIULes3lczErsuWPh0jNlPEVMEAiyjU+1jWeQ0=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Subject: [PATCH 5.4 027/156] perf stat: Fix printing os->prefix in CSV metrics output
Date: Wed, 23 Nov 2022 09:49:44 +0100
Message-Id: <20221123084558.941921215@linuxfoundation.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221123084557.816085212@linuxfoundation.org>
References: <20221123084557.816085212@linuxfoundation.org>
User-Agent: quilt/0.67
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Sasha Levin <sashal@kernel.org>, Ian Rogers <irogers@google.com>, Andi Kleen <ak@linux.intel.com>, Nageswara R Sastry <rnsastry@linux.ibm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Madhavan Srinivasan <maddy@linux.vnet.ibm.com>, patches@lists.linux.dev, Arnaldo Carvalho de Melo <acme@redhat.com>, Athira Jajeev <atrajeev@linux.vnet.ibm.com>, James Clark <james.clark@arm.com>, Jiri Olsa <jolsa@kernel.org>, Kajol Jain <kjain@linux.ibm.com>, Namhyung Kim <namhyung@kernel.org>, Disha Goel <disgoel@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>

[ Upstream commit ad353b710c7493df3d4fc2d3a51819126bed2e81 ]

'perf stat' with CSV output option prints an extra empty string as first
field in metrics output line.  Sample output below:

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

The above command line uses field separator as "," via "-x," option and
per-socket option displays socket value as first field. But here the
last line for "stalled cycles per insn" has "," in the beginning.

Sample output using interval mode:

	# ./perf stat -I 1000 -x, --per-socket -a -C 1 ls
	0.001813453,S0,1,1.87,msec,cpu-clock,1872052,100.00,0.002,CPUs utilized
	0.001813453,S0,1,2,,context-switches,1868028,100.00,1.070,K/sec
	------
	0.001813453,S0,1,85379,,instructions,1856754,100.00,0.32,insn per cycle
====>	0.001813453,,S0,1,,,,,,,1.34,stalled cycles per insn

Above result also has an extra CSV separator after
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
already set to contain CSV separator when used
in interval mode for CSV option.

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

Fixes: 92a61f6412d3a09d ("perf stat: Implement CSV metrics output")
Reported-by: Disha Goel <disgoel@linux.vnet.ibm.com>
Reviewed-By: Kajol Jain <kjain@linux.ibm.com>
Signed-off-by: Athira Jajeev <atrajeev@linux.vnet.ibm.com>
Tested-by: Disha Goel <disgoel@linux.vnet.ibm.com>
Cc: Andi Kleen <ak@linux.intel.com>
Cc: Ian Rogers <irogers@google.com>
Cc: James Clark <james.clark@arm.com>
Cc: Jiri Olsa <jolsa@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nageswara R Sastry <rnsastry@linux.ibm.com>
Cc: Namhyung Kim <namhyung@kernel.org>
Link: https://lore.kernel.org/r/20221018085605.63834-1-atrajeev@linux.vnet.ibm.com
Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 tools/perf/util/stat-display.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/perf/util/stat-display.c b/tools/perf/util/stat-display.c
index 93147cc40162..e18c26501a7f 100644
--- a/tools/perf/util/stat-display.c
+++ b/tools/perf/util/stat-display.c
@@ -193,7 +193,7 @@ static void new_line_csv(struct perf_stat_config *config, void *ctx)
 
 	fputc('\n', os->fh);
 	if (os->prefix)
-		fprintf(os->fh, "%s%s", os->prefix, config->csv_sep);
+		fprintf(os->fh, "%s", os->prefix);
 	aggr_printout(config, os->evsel, os->id, os->nr);
 	for (i = 0; i < os->nfields; i++)
 		fputs(config->csv_sep, os->fh);
-- 
2.35.1



