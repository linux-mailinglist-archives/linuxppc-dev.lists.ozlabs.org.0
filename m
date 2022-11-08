Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 589D1621E28
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Nov 2022 21:58:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N6L6T1z7Zz3chb
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Nov 2022 07:58:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Nln5MO2w;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=acme@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Nln5MO2w;
	dkim-atps=neutral
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N6L5Z133Sz2x9J
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Nov 2022 07:57:37 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id ABDF0CE1CE7;
	Tue,  8 Nov 2022 20:57:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92428C433D6;
	Tue,  8 Nov 2022 20:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667941052;
	bh=49yUNaK0Xy40RzZQ8Gmjq/wjdUfbv1ybDc9tX4cGuQA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Nln5MO2wwkXiDS0CjrB6+QZ4ujWJ2Erdig+8IQY7eA4OWIZuvFt8ymGgHjVMI+Bg+
	 ZIwZnUxvU7QRbIA61kv428d34KhGK8LXb5pKcIUuzvxp44dR482LO/+j/ctm7QJExE
	 EmFxWkm5jXBrr5IJ0bnJpyBCtgzOtyT8AssqIb7Vz/T/R4FcfAhDo+5n5zraJT98Vf
	 eUo4Wlc1FNLkeGXGf4T8qca5HjsTQCmvesLfaCBVPCrnF79gplO3d9NKVbkp7lnAj+
	 THvufH3BqiY4mQ+fPySDEXXDbBmTM3lbKHFOz1MDprBY5dkzP8fR9YfkGcumWguzu0
	 WoGfjo5X8L+dw==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
	id D95584034E; Tue,  8 Nov 2022 17:57:28 -0300 (-03)
Date: Tue, 8 Nov 2022 17:57:28 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH 2/2] tools/perf: Fix printing field separator in CSV
 metrics output
Message-ID: <Y2rCuGSKoIjHwWGx@kernel.org>
References: <20221018085605.63834-1-atrajeev@linux.vnet.ibm.com>
 <20221018085605.63834-2-atrajeev@linux.vnet.ibm.com>
 <173AA14E-B018-4BA7-A7A8-E7069E273960@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <173AA14E-B018-4BA7-A7A8-E7069E273960@linux.vnet.ibm.com>
X-Url: http://acmel.wordpress.com
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
Cc: Ian Rogers <irogers@google.com>, Andi Kleen <ak@linux.intel.com>, Nageswara Sastry <rnsastry@linux.ibm.com>, kjain@linux.ibm.com, linux-perf-users@vger.kernel.org, maddy@linux.vnet.ibm.com, james.clark@arm.com, Jiri Olsa <jolsa@kernel.org>, namhyung@kernel.org, disgoel@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Em Wed, Nov 02, 2022 at 02:07:06PM +0530, Athira Rajeev escreveu:
> 
> 
> > On 18-Oct-2022, at 2:26 PM, Athira Rajeev <atrajeev@linux.vnet.ibm.com> wrote:
> > 
> > In perf stat with CSV output option, number of fields
> > in metrics output is not matching with number of fields
> > in other event output lines.
> > 
> > Sample output below after applying patch to fix
> > printing os->prefix.
> > 
> > 	# ./perf stat -x, --per-socket -a -C 1 ls
> > 	S0,1,1.89,msec,cpu-clock,1887692,100.00,1.013,CPUs utilized
> > 	S0,1,2,,context-switches,1885842,100.00,1.060,K/sec
> > 	S0,1,0,,cpu-migrations,1885374,100.00,0.000,/sec
> > 	S0,1,2,,page-faults,1884880,100.00,1.060,K/sec
> > 	S0,1,189544,,cycles,1263158,67.00,0.100,GHz
> > 	S0,1,64602,,stalled-cycles-frontend,1876146,100.00,34.08,frontend cycles idle
> > 	S0,1,128241,,stalled-cycles-backend,1875512,100.00,67.66,backend cycles idle
> > 	S0,1,95578,,instructions,1874676,100.00,0.50,insn per cycle
> > ===>	S0,1,,,,,,,1.34,stalled cycles per insn
> > 
> > The above command line uses field separator as ","
> > via "-x," option and per-socket option displays
> > socket value as first field. But here the last line
> > for "stalled cycles per insn" has more separators.
> > Each csv output line is expected to have 8 field
> > separatorsi (for the 9 fields), where as last line
> > has 10 "," in the result. Patch fixes this issue.
> > 
> > The counter stats are displayed by function
> > "perf_stat__print_shadow_stats" in code
> > "util/stat-shadow.c". While printing the stats info
> > for "stalled cycles per insn", function "new_line_csv"
> > is used as new_line callback.
> > 
> > The fields printed in each line contains:
> > "Socket_id,aggr nr,Avg,unit,event_name,run,enable_percent,ratio,unit"
> > 
> > The metric output prints Socket_id, aggr nr, ratio
> > and unit. It has to skip through remaining five fields
> > ie, Avg,unit,event_name,run,enable_percent. The csv
> > line callback uses "os->nfields" to know the number of
> > fields to skip to match with other lines.
> > Currently it is set as:
> > 	os.nfields = 3 + aggr_fields[config->aggr_mode] + (counter->cgrp ? 1 : 0);
> > 
> > But in case of aggregation modes, csv_sep already
> > gets printed along with each field (Function "aggr_printout"
> > in util/stat-display.c). So aggr_fields can be
> > removed from nfields. And fixed number of fields to
> > skip has to be "4". This is to skip fields for:
> > "avg, unit, event name, run, enable_percent"
> > Example from line for instructions:
> > "1.89,msec,cpu-clock,1887692,100.00"
> > 
> > This needs 4 csv separators. Patch removes aggr_fields
> > and uses 4 as fixed number of os->nfields to skip.
> > 
> > After the patch:
> > 
> > 	# ./perf stat -x, --per-socket -a -C 1 ls
> > 	S0,1,1.92,msec,cpu-clock,1917648,100.00,1.010,CPUs utilized
> > 	S0,1,54,,context-switches,1916762,100.00,28.176,K/sec
> > 	-------
> > 	S0,1,528693,,instructions,1908854,100.00,0.36,insn per cycle
> > 	S0,1,,,,,,1.81,stalled cycles per insn
> > 
> > Fixes: 92a61f6412d3 ("perf stat: Implement CSV metrics output")
> > Reported-by: Disha Goel <disgoel@linux.vnet.ibm.com>
> > Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> 
> Hi All,
> 
> Looking for review comments for this change.

This clashed with a patch from Namhyung that I just applied:

http://lore.kernel.org/lkml/20221107213314.3239159-2-namhyung@kernel.org

Can you please check? I just applied the other patch in this series.

Thanks,

- Arnaldo
 
> Thanks
> Athira
> 
> > ---
> > tools/perf/util/stat-display.c | 13 +------------
> > 1 file changed, 1 insertion(+), 12 deletions(-)
> > 
> > diff --git a/tools/perf/util/stat-display.c b/tools/perf/util/stat-display.c
> > index 879874a4bc07..5ca151adf826 100644
> > --- a/tools/perf/util/stat-display.c
> > +++ b/tools/perf/util/stat-display.c
> > @@ -551,20 +551,9 @@ static void printout(struct perf_stat_config *config, struct aggr_cpu_id id, int
> > 	new_line_t nl;
> > 
> > 	if (config->csv_output) {
> > -		static const int aggr_fields[AGGR_MAX] = {
> > -			[AGGR_NONE] = 1,
> > -			[AGGR_GLOBAL] = 0,
> > -			[AGGR_SOCKET] = 2,
> > -			[AGGR_DIE] = 2,
> > -			[AGGR_CORE] = 2,
> > -			[AGGR_THREAD] = 1,
> > -			[AGGR_UNSET] = 0,
> > -			[AGGR_NODE] = 0,
> > -		};
> > -
> > 		pm = config->metric_only ? print_metric_only_csv : print_metric_csv;
> > 		nl = config->metric_only ? new_line_metric : new_line_csv;
> > -		os.nfields = 3 + aggr_fields[config->aggr_mode] + (counter->cgrp ? 1 : 0);
> > +		os.nfields = 4 + (counter->cgrp ? 1 : 0);
> > 	} else if (config->json_output) {
> > 		pm = config->metric_only ? print_metric_only_json : print_metric_json;
> > 		nl = config->metric_only ? new_line_metric : new_line_json;
> > -- 
> > 2.31.1
> > 

-- 

- Arnaldo
