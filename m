Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D72A951C5FF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 May 2022 19:21:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KvL915qShz3c8r
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 03:21:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rjljow7i;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=acme@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=rjljow7i; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KvL8M20VCz3bpw
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 May 2022 03:21:23 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 07F8D61EE7;
 Thu,  5 May 2022 17:21:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38302C385A4;
 Thu,  5 May 2022 17:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651771279;
 bh=an7j8IPPJIl/MRkD1QsQLwLeY+XBrbvfebPNYo3DWSk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rjljow7iaxTF4AckWX0mfTOTxFp6DhGXt6VflWhRptJQ4OusqUircKHbO5hJKSa8v
 MiPneIzA3UNKxRuCAwic+JzZzpG/6BVpeLh7+NlYYCpkW0MEu5rgeOafWfoBUbY1xP
 G8qXCpUpHBB+/TztncWoqxrMYrrGsKqOF0VMf29nDx58x+YMgNBVAdU3FOCKtZCD2+
 vM8LmoMfPF957zo+5epjzZn90xdhtUenR1rYbBZkXuJRDSj+CCqOvtnFE2Kmj/VLs9
 yzlBLdD5lUS9wCPkRj1+GpdibeIkMJ0jRwIpbuiWF3dcTvPLIWGZblW2f2WVumGYcP
 bIDlFD4VXNV8Q==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
 id 28F15400B1; Thu,  5 May 2022 14:21:15 -0300 (-03)
Date: Thu, 5 May 2022 14:21:15 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH] tools/perf/tests: Skip perf BPF test if clang is not
 present
Message-ID: <YnQHi5Mhvs2p7BG8@kernel.org>
References: <20220505100039.58287-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220505100039.58287-1-atrajeev@linux.vnet.ibm.com>
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
Cc: irogers@google.com, maddy@linux.vnet.ibm.com, rnsastry@linux.ibm.com,
 linux-perf-users@vger.kernel.org, jolsa@kernel.org, kjain@linux.ibm.com,
 disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Em Thu, May 05, 2022 at 03:30:39PM +0530, Athira Rajeev escreveu:
> Perf BPF filter test fails in environment where "clang"
> is not installed.
> 
> Test failure logs:
> 
> <<>>
>  42: BPF filter                    :
>  42.1: Basic BPF filtering         : Skip
>  42.2: BPF pinning                 : FAILED!
>  42.3: BPF prologue generation     : FAILED!
> <<>>
> 
> Enabling verbose option provided debug logs which says
> clang/llvm needs to be installed. Snippet of verbose logs:
> 
> <<>>
>  42.2: BPF pinning                  :
>  --- start ---
> test child forked, pid 61423
> ERROR:	unable to find clang.
> Hint:	Try to install latest clang/llvm to support BPF.
>         Check your $PATH
> 
> <<logs_here>>
> 
> Failed to compile test case: 'Basic BPF llvm compile'
> Unable to get BPF object, fix kbuild first
> test child finished with -1
>  ---- end ----
> BPF filter subtest 2: FAILED!
> <<>>
> 
> Here subtests, "BPF pinning" and "BPF prologue generation"
> failed and logs shows clang/llvm is needed. After installing
> clang, testcase passes.
> 
> Reason on why subtest failure happens though logs has proper
> debug information:
> Main function __test__bpf calls test_llvm__fetch_bpf_obj by
> passing 4th argument as true ( 4th arguments maps to parameter
> "force" in test_llvm__fetch_bpf_obj ). But this will cause
> test_llvm__fetch_bpf_obj to skip the check for clang/llvm.
> 
> Snippet of code part which checks for clang based on
> parameter "force" in test_llvm__fetch_bpf_obj:
> 
> <<>>
> if (!force && (!llvm_param.user_set_param &&
> <<>>
> 
> Since force is set to "false", test won't get skipped and
> fails to compile test case. The BPF code compilation needs
> clang, So pass the fourth argument as "false" and also skip
> the test if reason for return is "TEST_SKIP"
> 
> After the patch:
> 
> <<>>
>  42: BPF filter                    :
>  42.1: Basic BPF filtering         : Skip
>  42.2: BPF pinning                 : Skip
>  42.3: BPF prologue generation     : Skip
> <<>>

Wouldn't it be better to add the reason for the skip, like other tests
do?

E.g.:

 23: Watchpoint                                                      :
 23.1: Read Only Watchpoint                                          : Skip (missing hardware support)
 23.2: Write Only Watchpoint                                         : Ok
 23.3: Read / Write Watchpoint                                       : Ok
 23.4: Modify Watchpoint

Something like:

After the patch:

<<>>
 42: BPF filter                    :
 42.1: Basic BPF filtering         : Skip (clang not installed)
 42.2: BPF pinning                 : Skip (clang not installed)
 42.3: BPF prologue generation     : Skip (clang not installed)
<<>>
 
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> ---
>  tools/perf/tests/bpf.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/perf/tests/bpf.c b/tools/perf/tests/bpf.c
> index 57b9591f7cbb..ae62f01239e3 100644
> --- a/tools/perf/tests/bpf.c
> +++ b/tools/perf/tests/bpf.c
> @@ -222,11 +222,11 @@ static int __test__bpf(int idx)
>  
>  	ret = test_llvm__fetch_bpf_obj(&obj_buf, &obj_buf_sz,
>  				       bpf_testcase_table[idx].prog_id,
> -				       true, NULL);
> +				       false, NULL);
>  	if (ret != TEST_OK || !obj_buf || !obj_buf_sz) {
>  		pr_debug("Unable to get BPF object, %s\n",
>  			 bpf_testcase_table[idx].msg_compile_fail);
> -		if (idx == 0)
> +		if ((idx == 0) || (ret == TEST_SKIP))
>  			return TEST_SKIP;
>  		else
>  			return TEST_FAIL;
> -- 
> 2.35.1

-- 

- Arnaldo
