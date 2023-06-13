Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ADFB472EC7D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jun 2023 22:08:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fpPhcmdC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qgfl04CT2z3bnM
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jun 2023 06:08:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fpPhcmdC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=acme@kernel.org; receiver=lists.ozlabs.org)
X-Greylist: delayed 824 seconds by postgrey-1.37 at boromir; Wed, 14 Jun 2023 06:07:59 AEST
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qgfk73RZRz30hW
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jun 2023 06:07:59 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BB0756329C;
	Tue, 13 Jun 2023 20:07:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB924C433D9;
	Tue, 13 Jun 2023 20:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686686875;
	bh=bxoBJRuJZdWdLzS4ucCrn7oF8Tvayrmi2Q3tUqgeROk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fpPhcmdCvmDRUYhEJNAIwu3BtbfX0P2UzmhqB3t7bcTZfDob+l/lF7cuvSKY6RA9x
	 aAAoNSuEnJpDTCtjVu8r6qhFovEaEf4WAwNLEWQRPd8tlFG6iB8nlPuodzJZOd7FAT
	 JrctNPxaiSVoH8vMKWAunSoiRYgyky64bf223H+Va9JCOdXfV+2dEk/z7ljBlzbFfg
	 LqaiNn7fMwDWWLmTMb1CEHu1RFnI7UEZc+ycV9amTajF+y6828/o1X1aY2EstocwT5
	 I0p6E6lxsXMKwI+DAuIKDQHxZw+NhiuehvfZR8Bycxs0vYQnI4Xti49ZDgrbQyeddB
	 kQj3Epg2BDuKA==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
	id CF52340692; Tue, 13 Jun 2023 17:07:52 -0300 (-03)
Date: Tue, 13 Jun 2023 17:07:52 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH 16/17] perf tests task_analyzer: print command on failure
Message-ID: <ZIjMmKvo9QsPK+B/@kernel.org>
References: <20230613164145.50488-1-atrajeev@linux.vnet.ibm.com>
 <20230613164145.50488-17-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230613164145.50488-17-atrajeev@linux.vnet.ibm.com>
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
Cc: irogers@google.com, maddy@linux.ibm.com, john.g.garry@oracle.com, kjain@linux.ibm.com, ravi.bangoria@amd.com, linux-perf-users@vger.kernel.org, Petar Gligoric <petar.gligoric@rohde-schwarz.com>, Hagen Paul Pfeifer <hagen@jauu.net>, jolsa@kernel.org, Aditya Gupta <adityag@linux.ibm.com>, namhyung@kernel.org, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Em Tue, Jun 13, 2023 at 10:11:44PM +0530, Athira Rajeev escreveu:
> From: Aditya Gupta <adityag@linux.ibm.com>
> 
> Instead of printing "perf command failed" everytime, print the exact
> command that run earlier

Looks like a nice improvement, added the test authors to the CC list on
this message,

Thanks, applied.

- Arnaldo
 
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
> Signed-off-by: Aditya Gupta <adityag@linux.ibm.com>
> ---
>  tools/perf/tests/shell/test_task_analyzer.sh | 24 ++++++++++----------
>  1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/tools/perf/tests/shell/test_task_analyzer.sh b/tools/perf/tests/shell/test_task_analyzer.sh
> index 84ab7e7f57d5..b094eeb3bf66 100755
> --- a/tools/perf/tests/shell/test_task_analyzer.sh
> +++ b/tools/perf/tests/shell/test_task_analyzer.sh
> @@ -53,14 +53,14 @@ prepare_perf_data() {
>  test_basic() {
>  	out="$tmpdir/perf.out"
>  	perf script report task-analyzer > "$out"
> -	check_exec_0 "perf"
> +	check_exec_0 "perf script report task-analyzer"
>  	find_str_or_fail "Comm" "$out" "${FUNCNAME[0]}"
>  }
>  
>  test_ns_rename(){
>  	out="$tmpdir/perf.out"
>  	perf script report task-analyzer --ns --rename-comms-by-tids 0:random > "$out"
> -	check_exec_0 "perf"
> +	check_exec_0 "perf script report task-analyzer --ns --rename-comms-by-tids 0:random"
>  	find_str_or_fail "Comm" "$out" "${FUNCNAME[0]}"
>  }
>  
> @@ -68,7 +68,7 @@ test_ms_filtertasks_highlight(){
>  	out="$tmpdir/perf.out"
>  	perf script report task-analyzer --ms --filter-tasks perf --highlight-tasks perf \
>  	> "$out"
> -	check_exec_0 "perf"
> +	check_exec_0 "perf script report task-analyzer --ms --filter-tasks perf --highlight-tasks perf"
>  	find_str_or_fail "Comm" "$out" "${FUNCNAME[0]}"
>  }
>  
> @@ -76,61 +76,61 @@ test_extended_times_timelimit_limittasks() {
>  	out="$tmpdir/perf.out"
>  	perf script report task-analyzer --extended-times --time-limit :99999 \
>  	--limit-to-tasks perf > "$out"
> -	check_exec_0 "perf"
> +	check_exec_0 "perf script report task-analyzer --extended-times --time-limit :99999 --limit-to-tasks perf"
>  	find_str_or_fail "Out-Out" "$out" "${FUNCNAME[0]}"
>  }
>  
>  test_summary() {
>  	out="$tmpdir/perf.out"
>  	perf script report task-analyzer --summary > "$out"
> -	check_exec_0 "perf"
> +	check_exec_0 "perf script report task-analyzer --summary"
>  	find_str_or_fail "Summary" "$out" "${FUNCNAME[0]}"
>  }
>  
>  test_summaryextended() {
>  	out="$tmpdir/perf.out"
>  	perf script report task-analyzer --summary-extended > "$out"
> -	check_exec_0 "perf"
> +	check_exec_0 "perf script report task-analyzer --summary-extended"
>  	find_str_or_fail "Inter Task Times" "$out" "${FUNCNAME[0]}"
>  }
>  
>  test_summaryonly() {
>  	out="$tmpdir/perf.out"
>  	perf script report task-analyzer --summary-only > "$out"
> -	check_exec_0 "perf"
> +	check_exec_0 "perf script report task-analyzer --summary-only"
>  	find_str_or_fail "Summary" "$out" "${FUNCNAME[0]}"
>  }
>  
>  test_extended_times_summary_ns() {
>  	out="$tmpdir/perf.out"
>  	perf script report task-analyzer --extended-times --summary --ns > "$out"
> -	check_exec_0 "perf"
> +	check_exec_0 "perf script report task-analyzer --extended-times --summary --ns"
>  	find_str_or_fail "Out-Out" "$out" "${FUNCNAME[0]}"
>  	find_str_or_fail "Summary" "$out" "${FUNCNAME[0]}"
>  }
>  
>  test_csv() {
>  	perf script report task-analyzer --csv csv > /dev/null
> -	check_exec_0 "perf"
> +	check_exec_0 "perf script report task-analyzer --csv csv"
>  	find_str_or_fail "Comm;" csv "${FUNCNAME[0]}"
>  }
>  
>  test_csv_extended_times() {
>  	perf script report task-analyzer --csv csv --extended-times > /dev/null
> -	check_exec_0 "perf"
> +	check_exec_0 "perf script report task-analyzer --csv csv --extended-times"
>  	find_str_or_fail "Out-Out;" csv "${FUNCNAME[0]}"
>  }
>  
>  test_csvsummary() {
>  	perf script report task-analyzer --csv-summary csvsummary > /dev/null
> -	check_exec_0 "perf"
> +	check_exec_0 "perf script report task-analyzer --csv-summary csvsummary"
>  	find_str_or_fail "Comm;" csvsummary "${FUNCNAME[0]}"
>  }
>  
>  test_csvsummary_extended() {
>  	perf script report task-analyzer --csv-summary csvsummary --summary-extended \
>  	>/dev/null
> -	check_exec_0 "perf"
> +	check_exec_0 "perf script report task-analyzer --csv-summary csvsummary --summary-extended"
>  	find_str_or_fail "Out-Out;" csvsummary "${FUNCNAME[0]}"
>  }
>  
> -- 
> 2.39.1
> 

-- 

- Arnaldo
