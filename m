Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F97687278
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Feb 2023 01:41:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P6g336Bc7z3ch2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Feb 2023 11:41:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MGrW5dfL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=acme@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MGrW5dfL;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P6g256CGRz3bfT
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Feb 2023 11:41:01 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E7BBF61984;
	Thu,  2 Feb 2023 00:40:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A270C433EF;
	Thu,  2 Feb 2023 00:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675298457;
	bh=+638RvD+o/lvgldQGllUcA183Rg0ykBFb7o+NSPTUtw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MGrW5dfLVI1DywUJCS8E98Zp62gAT/ebwCVOl7A/pSdej6qE4eGfZ1BmatXoQKMC+
	 mY9MA6JUgn0oAWesxFRBlPgyufc9vgiL/CW4Il4PetzieU/l3z/8dSVkuQ6DO12NqV
	 iTBmKDFhrkySLZvx0h/V4sCupJCWCY+PD6QSZZe253z2sYyGIp3QWPWc9TjZWq1bMV
	 nU2ARofjGDz3ryGOzZ1194bt+y8U8m17I11hOmeLNu8ywl8GmRlPbds7eX7Fq3gS9P
	 is+r3E+XukAqo1aj8bPFPZ7qLdfkOgJp/LQBn9Lvoaysqb2bqbsioyfN2l7GWsYggw
	 IhLatb5PCduuQ==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
	id 965F6405BE; Wed,  1 Feb 2023 21:40:54 -0300 (-03)
Date: Wed, 1 Feb 2023 21:40:54 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH 1/2] tests/shell: Add check for perf data file in
 record+probe_libc_inet_pton test
Message-ID: <Y9sGlo2tnSvYX2uF@kernel.org>
References: <20230201180421.59640-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230201180421.59640-1-atrajeev@linux.vnet.ibm.com>
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

Em Wed, Feb 01, 2023 at 11:34:20PM +0530, Athira Rajeev escreveu:
> "probe libc's inet_pton & backtrace it with ping" test
> installs a uprobe and uses perf record/script to check
> the backtrace. Currently even if the "perf record" fails,
> the test reports success. Logs below:
> 
>  # ./perf test -v "probe libc's inet_pton & backtrace it with ping"
>  81: probe libc's inet_pton & backtrace it with ping                 :
> --- start ---

Please add spaces before --- as this separates the commit log message
from the patch and ends up chopped up when I use git-am.

I'm fixing it now.

- Arnaldo

> test child forked, pid 304211
> failed to open /tmp/perf.data.Btf: No such file or directory
> test child finished with 0
> ---- end ----
> probe libc's inet_pton & backtrace it with ping: Ok
> 
> Fix this by adding check for presence of perf.data file
> before proceeding with "perf script".
> 
> With the patch changes, test reports fail correctly.
> 
>  # ./perf test -v "probe libc's inet_pton & backtrace it with ping"
>  81: probe libc's inet_pton & backtrace it with ping                 :
> --- start ---
> test child forked, pid 304358
> FAIL: perf record failed to create "/tmp/perf.data.Uoi"
> test child finished with -1
> ---- end ----
> probe libc's inet_pton & backtrace it with ping: FAILED!
> 
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> ---
>  tools/perf/tests/shell/record+probe_libc_inet_pton.sh | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/tools/perf/tests/shell/record+probe_libc_inet_pton.sh b/tools/perf/tests/shell/record+probe_libc_inet_pton.sh
> index 57e7a6a470c9..08cdd902d0cf 100755
> --- a/tools/perf/tests/shell/record+probe_libc_inet_pton.sh
> +++ b/tools/perf/tests/shell/record+probe_libc_inet_pton.sh
> @@ -58,6 +58,11 @@ trace_libc_inet_pton_backtrace() {
>  	perf_data=`mktemp -u /tmp/perf.data.XXX`
>  	perf_script=`mktemp -u /tmp/perf.script.XXX`
>  	perf record -e $event_name/$eventattr/ -o $perf_data ping -6 -c 1 ::1 > /dev/null 2>&1
> +	# check if perf data file got created in above step.
> +	if [ ! -e $perf_data ]; then
> +		printf "FAIL: perf record failed to create \"%s\" \n" "$perf_data"
> +		return 1
> +	fi
>  	perf script -i $perf_data | tac | grep -m1 ^ping -B9 | tac > $perf_script
>  
>  	exec 3<$perf_script
> -- 
> 2.39.0
> 

-- 

- Arnaldo
