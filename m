Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A3C72EC7C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jun 2023 22:07:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MPAq+9ZT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qgfjz4dCyz30h5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jun 2023 06:07:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MPAq+9ZT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=acme@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qgfhv58qLz30hB
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jun 2023 06:06:55 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 12AFD61554;
	Tue, 13 Jun 2023 20:06:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B11BC433F0;
	Tue, 13 Jun 2023 20:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686686812;
	bh=TDAL0PNjfKzexRJes9YMCwJd4LRCQtxHOJlAvxL4ucQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MPAq+9ZTxS2wXilNMI2iVJVGpBRMz6rfjPWVEKiRyej/IaTiGK/UGRJLMdTg7vDEb
	 lIwoSnsAW3bM2p2rsiJ65/vl6tgrDfJb2qjvz9FifYbUIqWU2QN2QDVtxUYppK3JSg
	 yKVQbnrg8FcGBhkaXKi+Y0bK+dbaQgM6Gv2MiYTiXgoaGmjeEobTj0stPEVwF1OeUA
	 uOu1K5o8g5x/FvFolLjkeR+m9rXf16/HCdbYEHMntkZz99hjKV4KkDkK0Otmz+kIX/
	 g90yiWczFZHOCBJ7+vWJAMvIArIWIN9O0rnQq2HD62F/Bv+tdXPqZfKAS98q0QmZuY
	 RCPmLgv+ywq2Q==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
	id A25B240692; Tue, 13 Jun 2023 17:06:49 -0300 (-03)
Date: Tue, 13 Jun 2023 17:06:49 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
	Petar Gligoric <petar.gligoric@rohde-schwarz.com>,
	Hagen Paul Pfeifer <hagen@jauu.net>
Subject: Re: [PATCH 15/17] perf tests task_analyzer: fix bad substitution
 ${$1}
Message-ID: <ZIjMWUk/axKfMCM4@kernel.org>
References: <20230613164145.50488-1-atrajeev@linux.vnet.ibm.com>
 <20230613164145.50488-16-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230613164145.50488-16-atrajeev@linux.vnet.ibm.com>
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
Cc: irogers@google.com, maddy@linux.ibm.com, john.g.garry@oracle.com, kjain@linux.ibm.com, ravi.bangoria@amd.com, linux-perf-users@vger.kernel.org, jolsa@kernel.org, Aditya Gupta <adityag@linux.ibm.com>, namhyung@kernel.org, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Em Tue, Jun 13, 2023 at 10:11:43PM +0530, Athira Rajeev escreveu:
> From: Aditya Gupta <adityag@linux.ibm.com>
> 
> ${$1} gives bad substitution error on sh, bash, and zsh. This seems like
> a typo, and this patch modifies it to $1, since that is what it's usage
> looks like from wherever `check_exec_0` is called.

Nicely spotted!

Please add the people that last touched the problem to the cc list,
specially when it fixes a bug.

Thanks for adding a Fixes tag, that helps the stable@kernel.org guys to
get this propagated to supported kernel releases.

I've added the test author to the CC list in this message.

thanks!

- Arnaldo
 
> This issue due to ${$1} caused all function calls to give error in
> `find_str_or_fail` line, and so no test runs completely. But
> 'perf test "perf script task-analyzer tests"' wrongly reports
> that tests passed with the status OK, which is wrong considering
> the tests didn't even run completely
> 
> Fixes: e8478b84d6ba ("perf test: add new task-analyzer tests")
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
> Signed-off-by: Aditya Gupta <adityag@linux.ibm.com>
> ---
>  tools/perf/tests/shell/test_task_analyzer.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/perf/tests/shell/test_task_analyzer.sh b/tools/perf/tests/shell/test_task_analyzer.sh
> index 4264b54b654b..84ab7e7f57d5 100755
> --- a/tools/perf/tests/shell/test_task_analyzer.sh
> +++ b/tools/perf/tests/shell/test_task_analyzer.sh
> @@ -31,7 +31,7 @@ report() {
>  
>  check_exec_0() {
>  	if [ $? != 0 ]; then
> -		report 1 "invokation of ${$1} command failed"
> +		report 1 "invocation of $1 command failed"
>  	fi
>  }
>  
> -- 
> 2.39.1
> 

-- 

- Arnaldo
