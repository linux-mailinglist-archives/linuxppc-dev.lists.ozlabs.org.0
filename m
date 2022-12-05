Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C66F36428C0
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Dec 2022 13:49:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NQk0K50Gjz3bh5
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Dec 2022 23:49:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=g08hwSlB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=acme@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=g08hwSlB;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NQjzN2LK3z2xZp
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Dec 2022 23:49:04 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7A1A861084;
	Mon,  5 Dec 2022 12:49:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3EE1C433C1;
	Mon,  5 Dec 2022 12:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670244540;
	bh=mFqYvD3gjKGJzFiKSWb9kYyT39RDNofZBd2/IEHHBJk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g08hwSlB1Ay3rj2Hp7MNezdxgR06AYJAnNMmknUp1LeYKZlM/XSQnRL7HFSftc24q
	 HBCgfVhtS8ABVm2ZPlD2HEuW62wmJClVcbVZi1v/Jg0KB7yZEd8C+ZL+LSKtmkiAG+
	 cB4i7njMhHF9U5VXcoyx/clAoxqXoQlmbHy6K75Q+G+aaqR5mx78Q3v78jWh11O+sS
	 +8Ys9Z2oWBj1wFGzBSPusgQeKRy1dJBmzwHcsiRyYvWxpdprINtGoGujMq1g3tn2zz
	 nQg3aFdk812ewGX1U6Fn8nQeqvjSaWKiI01htBfEp8IKfgpb9RG9vnwmdvj3t4SgzP
	 xRoxGWNFNbT3Q==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
	id 8165040404; Mon,  5 Dec 2022 09:48:57 -0300 (-03)
Date: Mon, 5 Dec 2022 09:48:57 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [V3] tools/perf: Fix printing field separator in CSV metrics
 output
Message-ID: <Y43ouXptBn/fAdIq@kernel.org>
References: <20221205042852.83382-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221205042852.83382-1-atrajeev@linux.vnet.ibm.com>
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
Cc: irogers@google.com, ak@linux.intel.com, rnsastry@linux.ibm.com, linux-perf-users@vger.kernel.org, maddy@linux.vnet.ibm.com, james.clark@arm.com, jolsa@kernel.org, kjain@linux.ibm.com, namhyung@kernel.org, disgoel@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Em Mon, Dec 05, 2022 at 09:58:52AM +0530, Athira Rajeev escreveu:
> In perf stat with CSV output option, number of fields
> in metrics output is not matching with number of fields
> in other event output lines.
> 
> Sample output below after applying patch to fix
> printing os->prefix.
> 
> 	# ./perf stat -x, --per-socket -a -C 1 ls
> 	S0,1,82.11,msec,cpu-clock,82111626,100.00,1.000,CPUs utilized
> 	S0,1,2,,context-switches,82109314,100.00,24.358,/sec
> 	------
> ====>	S0,1,,,,,,,1.71,stalled cycles per insn

Thanks, tested and applied.

- Arnaldo
 
> The above command line uses field separator as ","
> via "-x," option and per-socket option displays
> socket value as first field. But here the last line
> for "stalled cycles per insn" has more separators.
> Each csv output line is expected to have 8 field
> separators (for the 9 fields), where as last line
> has 9 "," in the result. Patch fixes this issue.
> 
> The counter stats are displayed by function
> "perf_stat__print_shadow_stats" in code
> "util/stat-shadow.c". While printing the stats info
> for "stalled cycles per insn", function "new_line_csv"
> is used as new_line callback.
> 
> The fields printed in each line contains:
> "Socket_id,aggr nr,Avg,unit,event_name,run,enable_percent,ratio,unit"
> 
> The metric output prints Socket_id, aggr nr, ratio
> and unit. It has to skip through remaining five fields
> ie, Avg,unit,event_name,run,enable_percent. The csv
> line callback uses "os->nfields" to know the number of
> fields to skip to match with other lines.
> Currently it is set as:
> 	os.nfields = 3 + aggr_fields[config->aggr_mode] + (counter->cgrp ? 1 : 0);
> 
> But in case of aggregation modes, csv_sep already
> gets printed along with each field (Function "aggr_printout"
> in util/stat-display.c). So aggr_fields can be
> removed from nfields. And fixed number of fields to
> skip has to be "4". This is to skip fields for:
> "avg, unit, event name, run, enable_percent"
> 
> This needs 4 csv separators. Patch removes aggr_fields
> and uses 4 as fixed number of os->nfields to skip.
> 
> After the patch:
> 
> 	# ./perf stat -x, --per-socket -a -C 1 ls
> 	S0,1,79.08,msec,cpu-clock,79085956,100.00,1.000,CPUs utilized
> 	S0,1,7,,context-switches,79084176,100.00,88.514,/sec
> 	------
> ====>	S0,1,,,,,,0.81,stalled cycles per insn
> 
> Fixes: 92a61f6412d3 ("perf stat: Implement CSV metrics output")
> Reported-by: Disha Goel <disgoel@linux.vnet.ibm.com>
> Reviewed-by: Kajol Jain <kjain@linux.ibm.com>
> Tested-by: Disha Goel<disgoel@linux.vnet.ibm.com>
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> ---
> Changelog:
> v2 -> v3:
> - Rebased on top of tmp.perf/core
> 
> v1 -> v2:
> - Rebased on top of latest source.
> - Added Reviewed-by and Tested-by from Kajol and
>   Disha.
> 
>  tools/perf/util/stat-display.c | 13 +------------
>  1 file changed, 1 insertion(+), 12 deletions(-)
> 
> diff --git a/tools/perf/util/stat-display.c b/tools/perf/util/stat-display.c
> index f1ee4b052198..4e9696f4096f 100644
> --- a/tools/perf/util/stat-display.c
> +++ b/tools/perf/util/stat-display.c
> @@ -686,20 +686,9 @@ static void printout(struct perf_stat_config *config, struct outstate *os,
>  	struct evsel *counter = os->evsel;
>  
>  	if (config->csv_output) {
> -		static const int aggr_fields[AGGR_MAX] = {
> -			[AGGR_NONE] = 1,
> -			[AGGR_GLOBAL] = 0,
> -			[AGGR_SOCKET] = 2,
> -			[AGGR_DIE] = 2,
> -			[AGGR_CORE] = 2,
> -			[AGGR_THREAD] = 1,
> -			[AGGR_UNSET] = 0,
> -			[AGGR_NODE] = 1,
> -		};
> -
>  		pm = config->metric_only ? print_metric_only_csv : print_metric_csv;
>  		nl = config->metric_only ? new_line_metric : new_line_csv;
> -		os->nfields = 3 + aggr_fields[config->aggr_mode] + (counter->cgrp ? 1 : 0);
> +		os->nfields = 4 + (counter->cgrp ? 1 : 0);
>  	} else if (config->json_output) {
>  		pm = config->metric_only ? print_metric_only_json : print_metric_json;
>  		nl = config->metric_only ? new_line_metric : new_line_json;
> -- 
> 2.31.1

-- 

- Arnaldo
