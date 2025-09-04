Return-Path: <linuxppc-dev+bounces-11704-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93795B434FF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Sep 2025 10:10:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cHXGN1cJsz2yrZ;
	Thu,  4 Sep 2025 18:10:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756973420;
	cv=none; b=UCo3Rd8te51cJHcmlzEXh8W8IL1edNB06z4cep0ZUD4OAk1ij/JGxlnzuReEPuqSHstq+QP2oJSTijgx1hkNrgN8UjVxVRNXCQPNTJ9DPnGb/EqKwV7dzSxEylL0IRZ4JovVaGoMxuEEkG38oSFBC7se9gKgpHWiLt7///BfbrPIt6jmcHzA7Lzt6aEqeVhyQdgyEf4xyPP9JTL2jBwGPsqB0CjtTNExflIQKZP1Dp5WPwUvI9c5wdUoZ//fYa9ikYnKGManWPkG7+LkqJEpiaohvJvtmUVYxWP0v5VjaVRYQ/AT639Sv4t5BZ9pCLVlWqsYnDdYm4oTXWgDvFh0YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756973420; c=relaxed/relaxed;
	bh=lYZMBxt2j2huvkQlShpA3q2FeSYcP3PruKhpLqhLU7A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mAjI3XxFxbOZ8OfLEVMrPFxkGRnH7jr8zrQFnzY8TZO0cl37chBlgXlYj6rQpCHmyaVYVnt+J8QBgqpL4KAMcXRys9GZT9vnLcK2aT2qyuLD6tv6X1ShUUotmyAZn3p1rZd8KLVopQ0EnROFeZCKJYsgVrKr2jpfHW4x0RlrJFfh8ujLE4uj8V2UfOh29KghGphAPpbn+5LlrwiobYNONlnHK1P0eVB/8cmTShc0MySBzpAxQo6PtZ1eGZD/zkQpKoubXlNf5KK0+ly81+DTOg9WmROMsiFIP9Y1p1nF8NYqc9wi9fqIuSKqS9kNGEJhqHzr36NCl2uPloL0tq8XJg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lyxsLLHt; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lyxsLLHt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cHXGL3SKZz2xd6
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Sep 2025 18:10:18 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583NU2ri026055;
	Thu, 4 Sep 2025 08:09:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=lYZMBx
	t2j2huvkQlShpA3q2FeSYcP3PruKhpLqhLU7A=; b=lyxsLLHtPSZoK6E52arz5B
	JryP95tgHzr7cawOOb6LD7zzPNe1JeMBR6MqJ57L9wR4DTVr0Yvx/j+Hs4AzjeRN
	eN5VjQhCzfAHgMfuJk6pm90tBhwBxJiySkIlHEKihJ2tSB+DFQ2oTwQoOOajZuE4
	InsQj3DF9V7vvStFA2anjAjJuxf+tmYXOoM2becxWEKUWYEFdntjahRSSuqpNrwu
	jo431vCFsdEYKZygLbCP+rDi92jf70aoyJhoLQBAMRtkBQrFCzLO/lrxRY/l2vR2
	Unxqv/ts4v9Zm+Dbfp7GN9FCha6QFhm5HPO7h/v3+qlmxE0PYRUiTAaETIsfamWA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48uswdgxqx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Sep 2025 08:09:42 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 58487wXT023039;
	Thu, 4 Sep 2025 08:09:42 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48uswdgxqr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Sep 2025 08:09:42 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 58450Hqp014145;
	Thu, 4 Sep 2025 08:09:41 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 48veb3k5uk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Sep 2025 08:09:41 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 58489bSE56099156
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 4 Sep 2025 08:09:37 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5E61620043;
	Thu,  4 Sep 2025 08:09:37 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DC2082004B;
	Thu,  4 Sep 2025 08:09:31 +0000 (GMT)
Received: from [9.78.106.34] (unknown [9.78.106.34])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  4 Sep 2025 08:09:31 +0000 (GMT)
Message-ID: <46243c40-8e5e-47d3-97bd-71f29eeb0127@linux.ibm.com>
Date: Thu, 4 Sep 2025 13:39:31 +0530
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v2 5/5] selftests/bpf: Fix arena_spin_lock
 selftest failure
To: Saket Kumar Bhaskar <skb99@linux.ibm.com>, bpf@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: sachinpb@linux.ibm.com, venkat88@linux.ibm.com, andrii@kernel.org,
        eddyz87@gmail.com, mykolal@fb.com, ast@kernel.org,
        daniel@iogearbox.net, martin.lau@linux.dev, song@kernel.org,
        yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org,
        sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org,
        christophe.leroy@csgroup.eu, naveen@kernel.org, maddy@linux.ibm.com,
        mpe@ellerman.id.au, npiggin@gmail.com, memxor@gmail.com,
        iii@linux.ibm.com, shuah@kernel.org
References: <20250829165135.1273071-1-skb99@linux.ibm.com>
 <20250829165135.1273071-6-skb99@linux.ibm.com>
Content-Language: en-US
From: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <20250829165135.1273071-6-skb99@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=PeP/hjhd c=1 sm=1 tr=0 ts=68b94946 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VnNF1IyMAAAA:8 a=VEVeFnGeokgqBf-cvYoA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzNCBTYWx0ZWRfX+IKpt+5fEs6F
 cJW4feq7iDXxY+HuwsaRyQ8FOjCH8Qcu2oH5X31ZQmdiaFrdhoyQ/zS0rff8OeUaOZqucDSG0VQ
 qFIyBWu0JDafnUuGFyeK5wyDJaaQ/wEKgUSSfcg1lJjSz0oN3UFrCTFqgW0V08CoFEtevHEW0wo
 2RVD5vTG/qo+zuRIAAGXJODhgnOSqu+sPT14UHS9Vn+ZX4HrJxm1ovbKIpVslgfi4bUZ8U6A6WS
 G7gkjCkTzI4ys+f9g5kktRAf1GCT7ZgoGFBFC0l+gROGhtwZ1//ySfnlLtOBaN9eRfKEodRY5Vc
 Z6HN2U/kn6a51RQKLLWE/kB5+Y7ihVTe/pTpBI7738XhR49t/+PUmNK8jVlBXyiiaVpgsvRla6o
 6lX2eTD+
X-Proofpoint-GUID: wjGYIsAtELFxuO2oRDNuuW7hWNXKEOYD
X-Proofpoint-ORIG-GUID: Waxr-btwg2e1pWEgriooDrUBdm4QvH7t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_02,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0
 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300034
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 29/08/25 10:21 pm, Saket Kumar Bhaskar wrote:
> For systems having CONFIG_NR_CPUS set to > 1024 in kernel config
> the selftest fails as arena_spin_lock_irqsave() returns EOPNOTSUPP.
> 
> The selftest is skipped incase bpf program returns EOPNOTSUPP,
> with a descriptive message logged.
> 
> Signed-off-by: Saket Kumar Bhaskar <skb99@linux.ibm.com>
> ---
>   .../selftests/bpf/prog_tests/arena_spin_lock.c      | 13 +++++++++++++
>   tools/testing/selftests/bpf/progs/arena_spin_lock.c |  5 ++++-
>   2 files changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/bpf/prog_tests/arena_spin_lock.c b/tools/testing/selftests/bpf/prog_tests/arena_spin_lock.c
> index 0223fce4db2b..1ec1ca987893 100644
> --- a/tools/testing/selftests/bpf/prog_tests/arena_spin_lock.c
> +++ b/tools/testing/selftests/bpf/prog_tests/arena_spin_lock.c
> @@ -40,8 +40,13 @@ static void *spin_lock_thread(void *arg)
>   
>   	err = bpf_prog_test_run_opts(prog_fd, &topts);
>   	ASSERT_OK(err, "test_run err");
> +
> +	if (topts.retval == -EOPNOTSUPP)
> +		goto end;
> +
>   	ASSERT_EQ((int)topts.retval, 0, "test_run retval");
>   
> +end:
>   	pthread_exit(arg);
>   }
>   
> @@ -63,6 +68,7 @@ static void test_arena_spin_lock_size(int size)
>   	skel = arena_spin_lock__open_and_load();
>   	if (!ASSERT_OK_PTR(skel, "arena_spin_lock__open_and_load"))
>   		return;
> +
>   	if (skel->data->test_skip == 2) {
>   		test__skip();
>   		goto end;
> @@ -86,6 +92,13 @@ static void test_arena_spin_lock_size(int size)
>   			goto end_barrier;
>   	}
>   
> +	if (skel->data->test_skip == 2) {
> +		printf("%s:SKIP: %d CPUs exceed the maximum supported by arena spinlock\n",
> +		       __func__, get_nprocs());
> +		test__skip();
> +		goto end_barrier;
> +	}
> +
>   	ASSERT_EQ(skel->bss->counter, repeat * nthreads, "check counter value");
>   
>   end_barrier:
> diff --git a/tools/testing/selftests/bpf/progs/arena_spin_lock.c b/tools/testing/selftests/bpf/progs/arena_spin_lock.c
> index c4500c37f85e..a475b974438e 100644
> --- a/tools/testing/selftests/bpf/progs/arena_spin_lock.c
> +++ b/tools/testing/selftests/bpf/progs/arena_spin_lock.c
> @@ -37,8 +37,11 @@ int prog(void *ctx)
>   #if defined(ENABLE_ATOMICS_TESTS) && defined(__BPF_FEATURE_ADDR_SPACE_CAST)
>   	unsigned long flags;
>   
> -	if ((ret = arena_spin_lock_irqsave(&lock, flags)))
> +	if ((ret = arena_spin_lock_irqsave(&lock, flags))) {
> +		if (ret == -EOPNOTSUPP)
> +			test_skip = 2;
>   		return ret;

test_skip being set to `1` when the test runs seems counter intuitive.
How about setting test_skip to `0` when run conditions are met
and test_skip=1 if run conditions are not met and
test_skip=2 when operation is not supported?

- Hari

