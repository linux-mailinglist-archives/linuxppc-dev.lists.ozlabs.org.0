Return-Path: <linuxppc-dev+bounces-10138-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7501DAFADA1
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Jul 2025 09:51:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bbGdk6SVSz30Tf;
	Mon,  7 Jul 2025 17:51:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751874682;
	cv=none; b=dfEubBNRIau3RERSpsxVmtrnogf9rfu2cLsrQSxVHDb2hA8TigQFirrgS0YVqnInojLRtTJbpU/VO1jfgVjmHrP0GxQmhrfkRSY9KBWr3UHbXF86g5kogeb/Sx7ju2PzJLMyJCL5Nl0EAv0jzyrydYNuRh4cXlwhdHRTIxcdhRQnb2b24uZDW+PXrUTVzl983opPh5IfH4HiNUBbUtJ3anD9nE5cv/Exxik7n8WJNEpdV8do+Lh7pf14hGjP33dfUwqVGctGFjUSOyl0LsJK9bFQ1QYRQRxvWqIQi94Qpbtsr0ZP69tQxJBA+QRZnzgvaVMNI5evoWAdUuw88/eLUg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751874682; c=relaxed/relaxed;
	bh=ZuMkWlfg2yIZ12AfcbIyqWDMfVaAXICSgAm1nwmXIcA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FK72aHN1ebD9Kv0ea4CBftV3rBvs9NNiyOqnk61osbqkfBkZOTmfzW9dMgiT9l7+fZMiqQu1Y66Eha+zO4Up829zS/a9JzpyPKTXEaHEYN7IeOpaQSJy+NJq3ET6W6GkJfQ+RTmW8LRwaUvR5PUGwWhUXlYMX1A3smlbhh7OxOFFbasMHa8wI/XDPFB7d74AjDHxGcbhByFsiIdVWOxFiYh96bh2hr1ZDvMCAVoyWBOY+eelQ8tqybyhBLcH59vn7F9j+JUmjtWxHu9R2C61dAVLsphGygKWHi27ztJkAl+/1r5OHlTyMS/p4I7ttvXCjzAPMZDnf27i/DRVo6sl4w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=a1mtwR+y; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=adityab1@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=a1mtwR+y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=adityab1@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bbGdj28bpz30TG
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Jul 2025 17:51:20 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 566GwooP032132;
	Mon, 7 Jul 2025 07:51:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=ZuMkWl
	fg2yIZ12AfcbIyqWDMfVaAXICSgAm1nwmXIcA=; b=a1mtwR+y7gaKJcXklZ1DLK
	j/lnoBYvtyjA1yglICGSYjHYa9vbTGDjcZSPU+p6n4ZBtqCJzAsvQon71b51y1g/
	9NM6bHy/huxzTBj9lT+n5cQZztD+h1MBXppsosuQ7keLn55GCIrnybxlTCR1+Ibm
	PhZ7/glFD9TVl9s/uoqIGV5D3Soua1xvmTtu6xg316QS/p7e1a/kAc/E8oKinpDp
	GKwQSjiR1sWpiQSN+IqjqzjVL/K1sUJ5ODuSkKDG8TDJyv2US2x1d+S1KZOdqglm
	+2UN0w0L37KZwrVg8IzwHEi5an5dlwDQqaT3CnnuzIBXgwdbAGxRVUCw5ZTJleCA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47ptfyfx0v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Jul 2025 07:51:04 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5677lnma008904;
	Mon, 7 Jul 2025 07:51:04 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47ptfyfx0t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Jul 2025 07:51:04 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5674AWhu025618;
	Mon, 7 Jul 2025 07:51:03 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 47qfcnw3cp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Jul 2025 07:51:03 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5677p18G21889284
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 7 Jul 2025 07:51:01 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8697520043;
	Mon,  7 Jul 2025 07:51:01 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8AEFC2004F;
	Mon,  7 Jul 2025 07:50:59 +0000 (GMT)
Received: from [9.43.94.242] (unknown [9.43.94.242])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  7 Jul 2025 07:50:59 +0000 (GMT)
Message-ID: <5f71c60f-ab63-43a3-8696-2ba349151c42@linux.ibm.com>
Date: Mon, 7 Jul 2025 13:20:58 +0530
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
To: linuxppc-dev@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, rostedt@goodmis.org, mhiramat@kernel.org,
        mark.rutland@arm.com
References: <20250707071837.59753-1-adityab1@linux.ibm.com>
Content-Language: en-US
From: Aditya Bodkhe <adityab1@linux.ibm.com>
In-Reply-To: <20250707071837.59753-1-adityab1@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=crubk04i c=1 sm=1 tr=0 ts=686b7c68 cx=c_pps a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VnNF1IyMAAAA:8 a=GVWLqetRcDZtiWko8XAA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 4-hHMKSEtEMKFlTGPDLgEqFF0eqiJqJJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDA0NCBTYWx0ZWRfX++Lk59MKVT67 pref/8sJxu7m0nxZXIA0PlHdvPVdp3y+aqkRg7iNr0QfecoLtAiB4YZ9NzOIya1DJY8ZIiI7VgI nU5Tu8eiOqjNiAYeO0LfdAGa353za0aTt0GY6RPSgTAUMzLpowRmzHHxFBVawPngDh6yBvkMalN
 8UR+MTwgUbUcoLnkgdGYNAXgurr74J9ERYLIYhFu3ZxFvqBQ5vV71vRlsJ4qeAUKB4vFAAR31Oo QYJy2gpldnlpxose9q1d/uLBnmd30nuoE9/s+uw85+BS9du9M1IAlgTSylXeYrof0EUngveTu0Q 3mgIag34b1CDZ+jNt4TCxnnkY9YRUd3njSZEth7oe0gTg6p4tvKkWYqjko0xacLL5Yyk9qk44jH
 aBb1RQR2uCpTmm/N71J+5/2LTzgkVnQeI+BUFIQMVDQ3jqFOZMai3L7HFD8vElhRihiZlMef
X-Proofpoint-GUID: 5a7OJ_X1-yNPWM1WwZh6rp79htJnwkoB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-07_01,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=999
 priorityscore=1501 adultscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507070044
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Posted wrong version by mistake please ignore .

On 07/07/25 12:48 pm, Aditya Bodkhe wrote:
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
> Signed-off-by: Aditya Bodkhe <adityab1@linux.ibm.com>
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

