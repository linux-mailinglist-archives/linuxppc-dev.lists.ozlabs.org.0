Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6857C5221ED
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 May 2022 19:07:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KyPbm2TP2z3cLp
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 May 2022 03:07:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uJcj/V3x;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=acme@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=uJcj/V3x; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KyPb75SGKz30FR
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 May 2022 03:06:43 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B128C61811;
 Tue, 10 May 2022 17:06:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5473C385A6;
 Tue, 10 May 2022 17:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652202401;
 bh=q7J2WH5N5gDwoaobqal2v9K8HktLcbKwiFlz3iwpMzs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uJcj/V3xREczRWzdVb+5/WQHqIlpZzwyzx2IHFnYiPL3RutyXtON2J95PqifSejaL
 /RTkpfhzhOzTFj/NyCHPMK4p2a747h0eGHMljZ73Vgd9UTkB0QdajoDi1XX9COIMIq
 xciIaoNyQ2iAHaATBix3sY8dsHYi0hqzDDAV+xYOm2Mhzvn1LItFRtuDgRe61lcyhj
 v+sqCDoZAZd9LSYiGIQgDw9Q74z5+KgsWEPSQ6w6ShrTrldZmxRMVbkvp3AV8ZxNuQ
 I6Pv5xONVwOKKB3S5YVFbgDFEEDRfPwFqDzdb3DS9JOkg0TgGwzrJaVzSSMe9b7gNm
 RXkCvIYO1Kdbg==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
 id AFDC0400B1; Tue, 10 May 2022 14:06:38 -0300 (-03)
Date: Tue, 10 May 2022 14:06:38 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH] tools/perf/tests: Skip perf BPF test if clang is not
 present
Message-ID: <YnqbnixOveerC9Yt@kernel.org>
References: <20220505100039.58287-1-atrajeev@linux.vnet.ibm.com>
 <YnQHi5Mhvs2p7BG8@kernel.org>
 <A0479956-31B6-41F1-9940-9ED95CC59E08@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <A0479956-31B6-41F1-9940-9ED95CC59E08@linux.vnet.ibm.com>
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
 linux-perf-users@vger.kernel.org, Jiri Olsa <jolsa@kernel.org>,
 kjain@linux.ibm.com, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Em Fri, May 06, 2022 at 03:07:51PM +0530, Athira Rajeev escreveu:
> 
> 
> > On 05-May-2022, at 10:51 PM, Arnaldo Carvalho de Melo <acme@kernel.org> wrote:
> > 
> > Em Thu, May 05, 2022 at 03:30:39PM +0530, Athira Rajeev escreveu:
> >> Perf BPF filter test fails in environment where "clang"
> >> is not installed.
> >> 
> >> Test failure logs:
> >> 
> >> <<>>
> >> 42: BPF filter                    :
> >> 42.1: Basic BPF filtering         : Skip
> >> 42.2: BPF pinning                 : FAILED!
> >> 42.3: BPF prologue generation     : FAILED!
> >> <<>>
> >> 
> >> Enabling verbose option provided debug logs which says
> >> clang/llvm needs to be installed. Snippet of verbose logs:
> >> 
> >> <<>>
> >> 42.2: BPF pinning                  :
> >> --- start ---
> >> test child forked, pid 61423
> >> ERROR:	unable to find clang.
> >> Hint:	Try to install latest clang/llvm to support BPF.
> >>        Check your $PATH
> >> 
> >> <<logs_here>>
> >> 
> >> Failed to compile test case: 'Basic BPF llvm compile'
> >> Unable to get BPF object, fix kbuild first
> >> test child finished with -1
> >> ---- end ----
> >> BPF filter subtest 2: FAILED!
> >> <<>>
> >> 
> >> Here subtests, "BPF pinning" and "BPF prologue generation"
> >> failed and logs shows clang/llvm is needed. After installing
> >> clang, testcase passes.
> >> 
> >> Reason on why subtest failure happens though logs has proper
> >> debug information:
> >> Main function __test__bpf calls test_llvm__fetch_bpf_obj by
> >> passing 4th argument as true ( 4th arguments maps to parameter
> >> "force" in test_llvm__fetch_bpf_obj ). But this will cause
> >> test_llvm__fetch_bpf_obj to skip the check for clang/llvm.
> >> 
> >> Snippet of code part which checks for clang based on
> >> parameter "force" in test_llvm__fetch_bpf_obj:
> >> 
> >> <<>>
> >> if (!force && (!llvm_param.user_set_param &&
> >> <<>>
> >> 
> >> Since force is set to "false", test won't get skipped and
> >> fails to compile test case. The BPF code compilation needs
> >> clang, So pass the fourth argument as "false" and also skip
> >> the test if reason for return is "TEST_SKIP"
> >> 
> >> After the patch:
> >> 
> >> <<>>
> >> 42: BPF filter                    :
> >> 42.1: Basic BPF filtering         : Skip
> >> 42.2: BPF pinning                 : Skip
> >> 42.3: BPF prologue generation     : Skip
> >> <<>>
> > 
> > Wouldn't it be better to add the reason for the skip, like other tests
> > do?
> > 
> > E.g.:
> > 
> > 23: Watchpoint                                                      :
> > 23.1: Read Only Watchpoint                                          : Skip (missing hardware support)
> > 23.2: Write Only Watchpoint                                         : Ok
> > 23.3: Read / Write Watchpoint                                       : Ok
> > 23.4: Modify Watchpoint
> > 
> > Something like:
> > 
> > After the patch:
> > 
> > <<>>
> > 42: BPF filter                    :
> > 42.1: Basic BPF filtering         : Skip (clang not installed)
> > 42.2: BPF pinning                 : Skip (clang not installed)
> > 42.3: BPF prologue generation     : Skip (clang not installed)
> 
> 
> Hi Arnaldo,
> 
> I tried to use TEST_CASE_REASON("BPF pinning", bpf_pinning, "clang not installed")
> 
> The clang check is done in test_llvm__fetch_bpf_obj under some condition checks:
> 
> <<>>
>          /*
>          * Skip this test if user's .perfconfig doesn't set [llvm] section
>          * and clang is not found in $PATH
>          */
>         if (!force && (!llvm_param.user_set_param &&
>                        llvm__search_clang())) {
>                 pr_debug("No clang, skip this test\n");
>                 return TEST_SKIP;
>         }
> <<>>
> 
> But the reason for BPF skip could happen at other places also ie non-root user, bpf support checks from check_env.
> So can't exactly print the skip reason to be clang since It could get skipped from other environment checks too. Any suggestions Arnaldo ?

We have cases where the framework isn't flexible enough to say exactly
what was the reason for the failure and we use language such as "maybe
clang isn't installed or some other reason?"

- Arnaldo
 
> Thanks
> Athira
> 
> > <<>>
> > 
> >> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> >> ---
> >> tools/perf/tests/bpf.c | 4 ++--
> >> 1 file changed, 2 insertions(+), 2 deletions(-)
> >> 
> >> diff --git a/tools/perf/tests/bpf.c b/tools/perf/tests/bpf.c
> >> index 57b9591f7cbb..ae62f01239e3 100644
> >> --- a/tools/perf/tests/bpf.c
> >> +++ b/tools/perf/tests/bpf.c
> >> @@ -222,11 +222,11 @@ static int __test__bpf(int idx)
> >> 
> >> 	ret = test_llvm__fetch_bpf_obj(&obj_buf, &obj_buf_sz,
> >> 				       bpf_testcase_table[idx].prog_id,
> >> -				       true, NULL);
> >> +				       false, NULL);
> >> 	if (ret != TEST_OK || !obj_buf || !obj_buf_sz) {
> >> 		pr_debug("Unable to get BPF object, %s\n",
> >> 			 bpf_testcase_table[idx].msg_compile_fail);
> >> -		if (idx == 0)
> >> +		if ((idx == 0) || (ret == TEST_SKIP))
> >> 			return TEST_SKIP;
> >> 		else
> >> 			return TEST_FAIL;
> >> -- 
> >> 2.35.1
> > 
> > -- 
> > 
> > - Arnaldo

-- 

- Arnaldo
