Return-Path: <linuxppc-dev+bounces-11905-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE24BB4A353
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Sep 2025 09:18:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cLZt91QGNz30Ng;
	Tue,  9 Sep 2025 17:18:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757402305;
	cv=none; b=erBNe+5GnK/FQpraXW8eBmGq9D5H9Rg4xTR9spzk+CiSli+6yNKnrxptDqA2DveA880xeU8xWEbT+jViJzOO95pjniSYVah46jAK/An49oH+EkGBdyeKk4NsG12WN/i0/OGfQWiAy/rO9T0gO4q7AUhN9xzgdkxz7tAPtSyHGqZcBBZRH3p2yI499ICaDcbNrdY6MNhaM4IyY2Gyb7CeGvM3AZos8WEKCPxMK4HCYDMDVmon1VQIs7pPMMcrNwU+wv55NYz+zGXZFM7fTV02qWsSZjAblQWBNpgY2Udy+pRANH7lZ4lw/FKNhGnFGNhoHZeBl5zxtEjwjokLdTXajw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757402305; c=relaxed/relaxed;
	bh=hjqHTVqv4LgPJB3gW/Ooz87fYzFgcaYeFzD2uFG8HMg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PyUK70gFmkOMBluiQdq/bJ7jAuhGtVuId+p8fRjz5kwJzrPVqF9f/DKGYSuGEwugCcVqA4ZN8xys978tmw//giAGICst8eMNGj1XDESMuKF7jppwgQnRy1fYxC524WTtTiVaLDEExTyUnkhQtwyulyo2Fc6+j3YrmKOH3Zl8O6gJgDtMwsF3fYpQnp9d7gn8P6T7tqlY9CuLDMT+3AW52jSTxUezc7EX42zoRJLigzfRbbbF2auB4UrUrfJUvS+yg14ldXthxlJm0bywY/sy7NrmCeLx7TkZj/ooOTFo1/LnodW6lh2GM64+Kfx1+QaMuevedxejHVJpl4UpTRD/sQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=F0ob7Eiz; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=F0ob7Eiz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cLZt82jklz30Lt
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Sep 2025 17:18:24 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 588Mpv1T022960;
	Tue, 9 Sep 2025 07:18:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=hjqHTV
	qv4LgPJB3gW/Ooz87fYzFgcaYeFzD2uFG8HMg=; b=F0ob7Eiz9eb2KDQ8G3cm3x
	YQDXEY7hHjwDzY9ZyA0i/fB6JKyMDOo4ss3tP+U1EuFrM0cYoJIo5HcT8ftxAQLO
	aIwQt+GROaAW0NXUfGVQVj/4XhTlUTuGlTeD7zVUudSyK5NxuzykiesVPIRPGfvH
	V0301T8EWP6zdx3DibL9/5xvxivP88JzFmwTCHBro/MNNN7le4r8A1p414PD5lhI
	8qeD4q0ue9aiShoY7uuu3xG9E/vTdEKYA8Fu+LFF29kXgDCcNhc6pz9cI3oK3IHZ
	3JhRlXecQUObvv2i8Js0QdacrqL4hStZqb49iaKosl9rDQUiJBD5dgE0wNMxNmrQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490xycu08a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Sep 2025 07:18:06 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5897I5Qi029500;
	Tue, 9 Sep 2025 07:18:05 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490xycu088-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Sep 2025 07:18:05 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5895mrMd020458;
	Tue, 9 Sep 2025 07:18:04 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 490yp0t14a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Sep 2025 07:18:04 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5897I03551970330
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 9 Sep 2025 07:18:00 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4DD8E20040;
	Tue,  9 Sep 2025 07:18:00 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 052B220043;
	Tue,  9 Sep 2025 07:17:57 +0000 (GMT)
Received: from [9.43.21.165] (unknown [9.43.21.165])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  9 Sep 2025 07:17:56 +0000 (GMT)
Message-ID: <fe1b474b-a9d7-482c-b713-28eb2af37329@linux.ibm.com>
Date: Tue, 9 Sep 2025 12:47:55 +0530
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
Subject: Re: [PATCH v3 1/2] powerpc/ftrace: support
 CONFIG_FUNCTION_GRAPH_RETVAL
To: Aditya Bodkhe <adityab1@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, rostedt@goodmis.org, mhiramat@kernel.org,
        mark.rutland@arm.com, Venkat Rao Bagalkote <venkat88@linux.ibm.com>
References: <20250909045615.50251-1-adityab1@linux.ibm.com>
Content-Language: en-US
From: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <20250909045615.50251-1-adityab1@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: vXfCZE_0cvAGRpCPEF7y3HQIaait3uaS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDIzNSBTYWx0ZWRfX4H8nU5jqR/6X
 Q+/KacEVOef2pVLC93c4ikI3mQefj7T9YNDy+dbLppsDqyGv4dOE4/a9UTAL8P/quXQlpJlrNsJ
 w3IYK552YAmyX7P52Ry20HNG2OMJZydFsGVkHJ1k6kKMBcFU+xMIxvH8QmUWDfKZG6YdLEbbnyw
 pG3SB2MtVzLedl0gYRjxzxpbtqyi4HnuiZ3XnLSSndfIV3E8OA8QWxKlUJGj7RLcWGw8oUt6sWr
 ANDDtyI1YDyVd7ktxIL/AIOKyRmGjQqeCF8O0SWHdoE4gDtXqrjin54ZmxA//LBgcvPFQIBhe3c
 8nO9Zbqz4kL59J3MM/+6qW/pWaTsoPASCQhICxSK8cHGm90uzyfYuVMu5ZHlCELfBe4z+8cMvAC
 lF2Dls9d
X-Proofpoint-GUID: zXW5mYf8BmCY4BVrdt7wGSVf0siSEgGW
X-Authority-Analysis: v=2.4 cv=F59XdrhN c=1 sm=1 tr=0 ts=68bfd4ae cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8
 a=1UX6Do5GAAAA:8 a=dNnesIPfpvp5sUh9fRYA:9 a=QEXdDO2ut3YA:10
 a=Et2XPkok5AAZYJIKzHr1:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060235
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 09/09/25 10:26 am, Aditya Bodkhe wrote:
> commit a1be9ccc57f0 ("function_graph: Support recording and printing the
> return value of function") introduced support for function graph return
> value tracing.
> 
> Additionally, commit a3ed4157b7d8 ("fgraph: Replace fgraph_ret_regs with
> ftrace_regs") further refactored and optimized the implementation,
> making `struct fgraph_ret_regs` unnecessary.
> 
> This patch enables the above modifications for powerpc all, ensuring that
> function graph return value tracing is available on this architecture.
> 
> In this patch we have redefined two functions:
> - 'ftrace_regs_get_return_value()' - the existing implementation on
> ppc returns -ve of return value based on some conditions not
> relevant to our patch.
> - 'ftrace_regs_get_frame_pointer()' - always returns 0 in current code .
> 
> We also allocate stack space to equivalent of 'SWITCH_FRAME_SIZE',
> allowing us to directly use predefined offsets like 'GPR3' and 'GPR4'
> this keeps code clean and consistent with already defined offsets .
> 
> After this patch, v6.14+ kernel can also be built with FPROBE on powerpc
> but there are a few other build and runtime dependencies for FPROBE to
> work properly. The next patch addresses them.
> 

Looks good to me.

Reviewed-by: Hari Bathini <hbathini@linux.ibm.com>

> Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Signed-off-by: Aditya Bodkhe <adityab1@linux.ibm.com>
> ---
> 
> Changelog:
> v2 -> v3:
> - Rebase on Linux 6.17-rc4
> 
> v2:https://lore.kernel.org/all/20250722085648.1640-1-adityab1@linux.ibm.com/
> 
> v1 -> v2:
> - Added explanation for redefining ftrace_regs_get_return_value()
> and ftrace_regs_get_frame_pointer()
> - Explained why stack space equivalent to 'SWITCH_FRAME_SIZE' is allocated.
> 
> v1:https://lore.kernel.org/all/20250528134820.74121-1-adityab1@linux.ibm.com/
> 
> ---
>   arch/powerpc/Kconfig                     |  1 +
>   arch/powerpc/include/asm/ftrace.h        | 15 +++++++++
>   arch/powerpc/kernel/trace/ftrace_entry.S | 42 ++++++++++++++----------
>   3 files changed, 41 insertions(+), 17 deletions(-)
> 
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 93402a1d9c9f..451d0e140051 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -246,6 +246,7 @@ config PPC
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
> index 3565c67fc638..6599fe3c6234 100644
> --- a/arch/powerpc/kernel/trace/ftrace_entry.S
> +++ b/arch/powerpc/kernel/trace/ftrace_entry.S
> @@ -409,23 +409,31 @@ EXPORT_SYMBOL(_mcount)
>   _GLOBAL(return_to_handler)
>   	/* need to save return values */
>   #ifdef CONFIG_PPC64
> -	std	r4,  -32(r1)
> -	std	r3,  -24(r1)
> +	stdu	r1, -SWITCH_FRAME_SIZE(r1)
> +	std	r4, GPR4(r1)
> +	std	r3, GPR3(r1)
> +	/* Save previous stack pointer (r1) */
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
> +	/* pass ftrace_regs/pt_regs to ftrace_return_to_handler */
> +	addi	r3, r1, STACK_INT_FRAME_REGS
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
> +	/* pass ftrace_regs/pt_regs to ftrace_return_to_handler */
> +	addi	r3, r1, STACK_INT_FRAME_REGS
>   #endif
>   
>   	bl	ftrace_return_to_handler
> @@ -435,15 +443,15 @@ _GLOBAL(return_to_handler)
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


