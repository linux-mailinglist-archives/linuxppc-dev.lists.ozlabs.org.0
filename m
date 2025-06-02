Return-Path: <linuxppc-dev+bounces-9078-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D2F7ACAE20
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Jun 2025 14:36:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b9td85Wj3z2yN2;
	Mon,  2 Jun 2025 22:36:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748867804;
	cv=none; b=MDmOdifmbcb8K8jFvmP5a03OJhjz8aL6YD2Hp+rQB0A2emre6hOqrDtRW4dnp0Gl6x0Oxs408SObkXNjRCRSpjjwXg+Lhw8nssP6MaTS4DiuAWqJc85hJVirt+2Ik/EkJw1TcTVvWokBSHwPppvxLOVVu9ThEGswjqGsOsG8vXexh0xX6IVhTZ/G6wNh9FcZCtT/FJTwZIWWUHm5tSrb8upZ8qOqtkEoGgYyNRNfX0b0edCx6z+Ia4HdbZqMLWTPoLWAOTqycd10Jf0Ec7dY6VeJhJADBabqqtKBSOpNRwGuXMaPzkLLjIKw+IgV0FXQ4/LQTR0w3yGGU5PMuUZEoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748867804; c=relaxed/relaxed;
	bh=hn7jsksEFOxj2EbB5fkqijs0r3shX82Lm3/fAvKOU4A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L1rVQbUlLlMTocc20IBqR3iLuCp1lP2mH89WTA9T+sg+yaic7hZH6LRXtTc/sYuluoZPD2g31Q5V8B/+q6L2m73yYxiEbeqrfbOZNQ8fm6u2yA4pEqxfjSU0MfR8lO5e03+ChvlCgL4ke4X6WrrvmbSLxR3ZXowEzPoX/doX3zmIM/crqc6tJZc35yf5vXFEwR8hWNGq4zcFlt7Mq57uxqPconO+hz29tAacqGar0DvZEDnoe8XAKSSXVuuJkpr4MVIZBbIMfOncYF/EC/hrqhGhWnCdwY1Qiw5E00HyY0XTfq07nvb3/j/LLWCnaO1bVypds/f7YVf0zjmUe9xiAQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=O6KSrwJm; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=O6KSrwJm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b9td74mMzz2xjK
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Jun 2025 22:36:43 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5529lJgq021647;
	Mon, 2 Jun 2025 12:36:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=hn7jsk
	sEFOxj2EbB5fkqijs0r3shX82Lm3/fAvKOU4A=; b=O6KSrwJmP+UPYZHE+k6f13
	HlrJB+tojXWxi1scbBdQ3vMMScN4x4+hVDUI+3IQSiHyqi/g51AD8rgAXsWVMRCk
	tSNPIQiWvLMtWrnhFrja6bN08xcIyXwpkDagSexTII0jVEjEva+Tm/KOgr7Bu5Df
	hebKoRjjWf9PTwKUl+cBANsme3zYabEMmDtoXyNR53LnbIz1d+eo/MXEfqNIsFvu
	QDedgF0k3BtTNrMapY+/OE7EoCSMVwrBA0jOv7MEpA+1GLQ0gym4jew8AdL3iKdX
	P9yIGgKRPqiPIiPJPChyGRnusc+iplHdeTDUpIHBKUPGQKs/WaxLl9XZ01nCaxfA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46ysgd15rc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Jun 2025 12:36:26 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 552CMUwY007231;
	Mon, 2 Jun 2025 12:36:26 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46ysgd15r7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Jun 2025 12:36:26 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 552AgJWO012517;
	Mon, 2 Jun 2025 12:36:25 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 470et25ujp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Jun 2025 12:36:25 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 552CaJqA18809124
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 2 Jun 2025 12:36:19 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 204492004D;
	Mon,  2 Jun 2025 12:36:19 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 88DA220040;
	Mon,  2 Jun 2025 12:36:16 +0000 (GMT)
Received: from [9.43.59.52] (unknown [9.43.59.52])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  2 Jun 2025 12:36:16 +0000 (GMT)
Message-ID: <f3c4356c-666d-4fe4-b8fd-da3037ed5976@linux.ibm.com>
Date: Mon, 2 Jun 2025 18:06:15 +0530
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
Subject: Re: [PATCH 1/2] powerpc/ftrace: support CONFIG_FUNCTION_GRAPH_RETVAL
To: Aditya Bodkhe <adityab1@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, rostedt@goodmis.org, mhiramat@kernel.org,
        mark.rutland@arm.com, Aditya Bodkhe <aditya.b1@linux.ibm.com>
References: <20250528134820.74121-1-adityab1@linux.ibm.com>
Content-Language: en-US
From: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <20250528134820.74121-1-adityab1@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=GdwXnRXL c=1 sm=1 tr=0 ts=683d9aca cx=c_pps a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VnNF1IyMAAAA:8 a=GVWLqetRcDZtiWko8XAA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 1h9eOEtw4XS8OmNcFYYnvUBdRPiJtwTC
X-Proofpoint-ORIG-GUID: 9brDj5LJoIhQM1rXpA-BdHPY7e2ekXHS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAyMDEwNiBTYWx0ZWRfXyxa6mk/eVEvF Cc0prlkmHuxSx2FZCNZSitHX2LtpupUyhpDO9qQM95M6/8xd2XY7mqtTYAP0d7K9P2w6CPiFoTF 8TNFu98e/nPSmkFvr/KwvnCLwewnCDWQPgjY4gO1r1aG7foWLV1y41oNxv4dyH+jQjvJWwj/dBv
 rWpH/X21SeurzzdAdcKmDUEWJacCuntXgegUG9cDYqqPiQ93hn0y9tTVTAa+3SBNdo9GdBQtHlH fQK/Gqi6f8yUCEHszsMTthjqb2WYp0yFT0ptqAx0kPanbSRSefWILZN3ciIhe02NDP6b+RqYLay OXsOYsES6jAiVM0EQ4A8PB4Fs/czcWQL0TKK7ZG31TfU7TAwmEPAMbtf/28N0WXd8HNA6N/joen
 ZYjF+WCG/n4uVutbEXRvV1vt8uAta9q6s7rx73wdBrEmtz/rKz5wmhwfNZVS2XXZJBhH1qkz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-02_05,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0 clxscore=1015
 mlxscore=0 impostorscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2506020106
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 28/05/25 7:18 pm, Aditya Bodkhe wrote:
> From: Aditya Bodkhe <aditya.b1@linux.ibm.com>
> 
> commit a1be9ccc57f0 ("function_graph: Support recording and printing the
> return value of function") introduced support for function graph return
> value tracing.
> 
> Additionally, commit a3ed4157b7d8 ("fgraph: Replace fgraph_ret_regs with
> ftrace_regs") further refactored and optimized the implementation,
> making `struct fgraph_ret_regs` unnecessary.
> 
> This patch enables the above modifications for powerpc64, ensuring that
> function graph return value tracing is available on this architecture.
> 
> After this patch, v6.14+ kernel can also be built with FPROBE on powerpc
> but there are a few other build and runtime dependencies for FPROBE to
> work properly. The next patch addresses them.
> 
> Signed-off-by: Aditya Bodkhe <aditya.b1@linux.ibm.com>

Except for a couple of minor nits below..

Reviewed-by: Hari Bathini <hbathini@linux.ibm.com>

> ---
>   arch/powerpc/Kconfig                     |  1 +
>   arch/powerpc/include/asm/ftrace.h        | 15 +++++++++
>   arch/powerpc/kernel/trace/ftrace_entry.S | 41 ++++++++++++++----------
>   3 files changed, 40 insertions(+), 17 deletions(-)
> 
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index c3e0cc83f120..9163521bc4b9 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -250,6 +250,7 @@ config PPC
>   	select HAVE_FUNCTION_ARG_ACCESS_API
>   	select HAVE_FUNCTION_DESCRIPTORS	if PPC64_ELF_ABI_V1
>   	select HAVE_FUNCTION_ERROR_INJECTION
> +	select HAVE_FUNCTION_GRAPH_FREGS
>   	select HAVE_FUNCTION_GRAPH_TRACER
>   	select HAVE_FUNCTION_TRACER		if !COMPILE_TEST && (PPC64 || (PPC32 && CC_IS_GCC))
>   	select HAVE_GCC_PLUGINS			if GCC_VERSION >= 50200   # plugin support on gcc <= 5.1 is buggy on PPC
> diff --git a/arch/powerpc/include/asm/ftrace.h b/arch/powerpc/include/asm/ftrace.h
> index 82da7c7a1d12..6ffc9c9cf4e3 100644
> --- a/arch/powerpc/include/asm/ftrace.h
> +++ b/arch/powerpc/include/asm/ftrace.h
> @@ -50,6 +50,21 @@ static __always_inline struct pt_regs *arch_ftrace_get_regs(struct ftrace_regs *
>   		asm volatile("mfmsr %0" : "=r" ((_regs)->msr));	\
>   	} while (0)
>   
> +#undef ftrace_regs_get_return_value
> +static __always_inline unsigned long
> +ftrace_regs_get_return_value(const struct ftrace_regs *fregs)
> +{
> +	return arch_ftrace_regs(fregs)->regs.gpr[3];
> +}
> +#define ftrace_regs_get_return_value ftrace_regs_get_return_value
> +
> +#undef ftrace_regs_get_frame_pointer
> +static __always_inline unsigned long
> +ftrace_regs_get_frame_pointer(const struct ftrace_regs *fregs)
> +{
> +	return arch_ftrace_regs(fregs)->regs.gpr[1];
> +}
> +
>   static __always_inline void
>   ftrace_regs_set_instruction_pointer(struct ftrace_regs *fregs,
>   				    unsigned long ip)
> diff --git a/arch/powerpc/kernel/trace/ftrace_entry.S b/arch/powerpc/kernel/trace/ftrace_entry.S
> index 3565c67fc638..eafbfb7584ed 100644
> --- a/arch/powerpc/kernel/trace/ftrace_entry.S
> +++ b/arch/powerpc/kernel/trace/ftrace_entry.S
> @@ -409,23 +409,30 @@ EXPORT_SYMBOL(_mcount)
>   _GLOBAL(return_to_handler)
>   	/* need to save return values */
>   #ifdef CONFIG_PPC64
> -	std	r4,  -32(r1)
> -	std	r3,  -24(r1)
> +	stdu	r1, -SWITCH_FRAME_SIZE(r1)
> +	std	r4, GPR4(r1)
> +	std	r3, GPR3(r1)

> +  /* Save previous stack pointer (r1) */

Please use tab instead of "  " before the comment.

> +	addi	r3, r1, SWITCH_FRAME_SIZE
> +	std	r3, GPR1(r1)
>   	/* save TOC */
> -	std	r2,  -16(r1)
> -	std	r31, -8(r1)
> +	std	r2,  24(r1)
> +	std	r31, 32(r1)
>   	mr	r31, r1
> -	stdu	r1, -112(r1)
> -
> +  /* pass ftrace_regs/pt_regs to ftrace_return_to_handler */
> +	addi	r3,  r1, STACK_INT_FRAME_REGS

Have a newline here

>   	/*
>   	 * We might be called from a module.
>   	 * Switch to our TOC to run inside the core kernel.
>   	 */
>   	LOAD_PACA_TOC()
>   #else
> -	stwu	r1, -16(r1)
> -	stw	r3, 8(r1)
> -	stw	r4, 12(r1)
> +	stwu	r1, -SWITCH_FRAME_SIZE(r1)
> +	stw	r4, GPR4(r1)
> +	stw	r3, GPR3(r1)
> +	addi	r3, r1, SWITCH_FRAME_SIZE
> +	stw	r3, GPR1(r1)
> +	addi	r3, r1, STACK_INT_FRAME_REGS
>   #endif
>   
>   	bl	ftrace_return_to_handler
> @@ -435,15 +442,15 @@ _GLOBAL(return_to_handler)
>   	mtlr	r3
>   
>   #ifdef CONFIG_PPC64
> -	ld	r1, 0(r1)
> -	ld	r4,  -32(r1)
> -	ld	r3,  -24(r1)
> -	ld	r2,  -16(r1)
> -	ld	r31, -8(r1)
> +	ld	r4,  GPR4(r1)
> +	ld	r3,  GPR3(r1)
> +	ld	r2,  24(r1)
> +	ld	r31, 32(r1)
> +	ld	r1,  0(r1)
>   #else
> -	lwz	r3, 8(r1)
> -	lwz	r4, 12(r1)
> -	addi	r1, r1, 16
> +	lwz	r3, GPR3(r1)
> +	lwz	r4, GPR4(r1)
> +	addi	r1, r1, SWITCH_FRAME_SIZE
>   #endif
>   
>   	/* Jump back to real return address */

- Hari

