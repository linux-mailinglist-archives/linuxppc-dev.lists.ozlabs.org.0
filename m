Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E75524B67
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 May 2022 13:19:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KzTnk3wwtz3byY
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 May 2022 21:19:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=alhbp/ZJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=alhbp/ZJ; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KzTn12lsbz2xn8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 May 2022 21:19:00 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24C9OkrA002859;
 Thu, 12 May 2022 11:18:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=DZyfJa3n27KzJhHC/Rvftu3DdF0ZhWMkGVgoCsPghkE=;
 b=alhbp/ZJSwkBSEz5PfMHdwyqeildNjZ0qdnTVTif1u+vDk2GL3Xwyuk+a4zIJIGX9efw
 zwNO39P6CM1frXO70AgILPOoiQuv+EGp3ObW3Yhcq2n6ndAJ2T60v1po8NrOH0SYqduZ
 jmwQby1qbsAbFik7flRaOA23C6igsMdxlzSYvlyKbG4uRefyWP1VKxfP2JBnbFYvNxm1
 OzqcPEgJQuBmvBsRLAbBRgf2FxbzhWPEy+Z97EK1aMtmxGYl8L1Mk2dcDnqg0MMGZClM
 PqNKrytdVoXDqTdG1zfXS5uSj7VjmjUfzMWmWApp5txES368vjwx0StQ4nbY4KD2my/e dw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g0y3kk11k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 May 2022 11:18:54 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24CBGu2f006741;
 Thu, 12 May 2022 11:18:54 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g0y3kk115-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 May 2022 11:18:54 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24CB7x9M000944;
 Thu, 12 May 2022 11:18:51 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04fra.de.ibm.com with ESMTP id 3g0ma1gqu1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 May 2022 11:18:51 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24CBInEH50004398
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 12 May 2022 11:18:49 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7F5E7A405C;
 Thu, 12 May 2022 11:18:49 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 52C50A4054;
 Thu, 12 May 2022 11:18:46 +0000 (GMT)
Received: from [9.43.85.52] (unknown [9.43.85.52])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 12 May 2022 11:18:46 +0000 (GMT)
Message-ID: <cc8b7337-b494-87a6-ecfc-b8301304f7f2@linux.ibm.com>
Date: Thu, 12 May 2022 16:48:44 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH V2] tools/perf/tests: Skip perf BPF test if clang is not
 present
Content-Language: en-US
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, acme@kernel.org,
 jolsa@kernel.org
References: <20220511115438.84032-1-atrajeev@linux.vnet.ibm.com>
From: kajoljain <kjain@linux.ibm.com>
In-Reply-To: <20220511115438.84032-1-atrajeev@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Lx5Mqe2oibMsUnFluQ10817RJvLB8_ce
X-Proofpoint-GUID: NeXzPWFaVpdvirhNe23w-hoOfD3fNBaI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-12_02,2022-05-12_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0
 mlxlogscore=999 lowpriorityscore=0 spamscore=0 adultscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 mlxscore=0 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205120050
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
 linux-perf-users@vger.kernel.org, disgoel@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 5/11/22 17:24, Athira Rajeev wrote:
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
> 
> Fixes: ba1fae431e74 ("perf test: Add 'perf test BPF'")
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> ---
> Changelog:
>  Addressed review comments from Arnaldo by adding
>  reason for skipping of testcase.
> 
>  tools/perf/tests/bpf.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
Patch looks fine to me.

Reviewed-by: Kajol Jain<kjain@linux.ibm.com>

Thanks,
Kajol Jain

> 
> diff --git a/tools/perf/tests/bpf.c b/tools/perf/tests/bpf.c
> index 57b9591f7cbb..17c023823713 100644
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
> @@ -364,9 +364,11 @@ static int test__bpf_prologue_test(struct test_suite *test __maybe_unused,
>  static struct test_case bpf_tests[] = {
>  #ifdef HAVE_LIBBPF_SUPPORT
>  	TEST_CASE("Basic BPF filtering", basic_bpf_test),
> -	TEST_CASE("BPF pinning", bpf_pinning),
> +	TEST_CASE_REASON("BPF pinning", bpf_pinning,
> +			"clang isn't installed or environment missing BPF support"),
>  #ifdef HAVE_BPF_PROLOGUE
> -	TEST_CASE("BPF prologue generation", bpf_prologue_test),
> +	TEST_CASE_REASON("BPF prologue generation", bpf_prologue_test,
> +			"clang isn't installed or environment missing BPF support"),
>  #else
>  	TEST_CASE_REASON("BPF prologue generation", bpf_prologue_test, "not compiled in"),
>  #endif
