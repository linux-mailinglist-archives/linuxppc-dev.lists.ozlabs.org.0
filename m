Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9654B86B620
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Feb 2024 18:35:00 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sRvW4T9H;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TlM1Z1bj7z3vXT
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 04:34:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sRvW4T9H;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=imbrenda@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TlM0r4fJhz3bp1
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Feb 2024 04:34:20 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41SHRJAv007887;
	Wed, 28 Feb 2024 17:34:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=5UEo5g8p7zZAhpUVRF+F3cMVGvp5KewyDxvM9D11adI=;
 b=sRvW4T9HMwfszCv7cmirR6GqMaxT14Sjx55SqMGkAszmho4aFGR6n1b1TMIK6NYMFefu
 Ug8eUt8Z1PNoibJ9psc2KOAgGfLm3cQpm/uB7FOCPGq0WuUXneSs53OU2uIi4SMAX9df
 640O5FZmDmUgVuqBoPBwuIUTrEcBQZL1jhY9Ydpw8+CUETj7lpt944x1HZyoFn7bID9n
 7fhev/gQnTYEVtCjTTecY66xq9zanU+BWT4cVk2UKCAaTiKbdwXNYrXdKDbQsjxrtOpj
 2JFnf2bLIuT8eLih+32zlsv3C5rM9LoxupZJDh8UMB7efurHUJxEKGjH2Pn0BgDcPhix xA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wj9870awk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Feb 2024 17:34:09 +0000
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 41SHRMQq008005;
	Wed, 28 Feb 2024 17:34:08 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wj9870avy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Feb 2024 17:34:08 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41SHAhjk021291;
	Wed, 28 Feb 2024 17:34:07 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3wfusp7tqe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Feb 2024 17:34:07 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41SHY1i61704620
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 28 Feb 2024 17:34:03 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 750F820040;
	Wed, 28 Feb 2024 17:34:01 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 917D42004E;
	Wed, 28 Feb 2024 17:34:00 +0000 (GMT)
Received: from p-imbrenda (unknown [9.171.7.158])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with SMTP;
	Wed, 28 Feb 2024 17:34:00 +0000 (GMT)
Date: Wed, 28 Feb 2024 18:33:58 +0100
From: Claudio Imbrenda <imbrenda@linux.ibm.com>
To: Andrew Jones <andrew.jones@linux.dev>
Subject: Re: [kvm-unit-tests PATCH 03/13] treewide: lib/stack: Fix backtrace
Message-ID: <20240228183358.5a72ce73@p-imbrenda>
In-Reply-To: <20240228150416.248948-18-andrew.jones@linux.dev>
References: <20240228150416.248948-15-andrew.jones@linux.dev>
	<20240228150416.248948-18-andrew.jones@linux.dev>
Organization: IBM
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: hLxiySRN2EcEgCzLsB6hSJivtfqmXw7j
X-Proofpoint-GUID: VqnqFTru1FaCUB_11HvinyVG-RZd9EZ5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-28_08,2024-02-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 mlxscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=999 impostorscore=0 clxscore=1011 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402280138
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
Cc: lvivier@redhat.com, linux-s390@vger.kernel.org, thuth@redhat.com, nrb@linux.ibm.com, frankja@linux.ibm.com, kvm@vger.kernel.org, npiggin@gmail.com, kvm-riscv@lists.infradead.org, kvmarm@lists.linux.dev, pbonzini@redhat.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 28 Feb 2024 16:04:19 +0100
Andrew Jones <andrew.jones@linux.dev> wrote:

> We should never pass the result of __builtin_frame_address(0) to
> another function since the compiler is within its rights to pop the
> frame to which it points before making the function call, as may be
> done for tail calls. Nobody has complained about backtrace(), so
> likely all compilations have been inlining backtrace_frame(), not
> dropping the frame on the tail call, or nobody is looking at traces.
> However, for riscv, when built for EFI, it does drop the frame on the
> tail call, and it was noticed. Preemptively fix backtrace() for all
> architectures.
> 
> Fixes: 52266791750d ("lib: backtrace printing")
> Signed-off-by: Andrew Jones <andrew.jones@linux.dev>

Acked-by: Claudio Imbrenda <imbrenda@linux.ibm.com>

> ---
>  lib/arm/stack.c   | 13 +++++--------
>  lib/arm64/stack.c | 12 +++++-------
>  lib/riscv/stack.c | 12 +++++-------
>  lib/s390x/stack.c | 12 +++++-------
>  lib/stack.h       | 24 +++++++++++++++++-------
>  lib/x86/stack.c   | 12 +++++-------
>  6 files changed, 42 insertions(+), 43 deletions(-)
> 
> diff --git a/lib/arm/stack.c b/lib/arm/stack.c
> index 7d081be7c6d0..66d18b47ea53 100644
> --- a/lib/arm/stack.c
> +++ b/lib/arm/stack.c
> @@ -8,13 +8,16 @@
>  #include <libcflat.h>
>  #include <stack.h>
>  
> -int backtrace_frame(const void *frame, const void **return_addrs,
> -		    int max_depth)
> +int arch_backtrace_frame(const void *frame, const void **return_addrs,
> +			 int max_depth, bool current_frame)
>  {
>  	static int walking;
>  	int depth;
>  	const unsigned long *fp = (unsigned long *)frame;
>  
> +	if (current_frame)
> +		fp = __builtin_frame_address(0);
> +
>  	if (walking) {
>  		printf("RECURSIVE STACK WALK!!!\n");
>  		return 0;
> @@ -33,9 +36,3 @@ int backtrace_frame(const void *frame, const void **return_addrs,
>  	walking = 0;
>  	return depth;
>  }
> -
> -int backtrace(const void **return_addrs, int max_depth)
> -{
> -	return backtrace_frame(__builtin_frame_address(0),
> -			       return_addrs, max_depth);
> -}
> diff --git a/lib/arm64/stack.c b/lib/arm64/stack.c
> index 82611f4b1815..f5eb57fd8892 100644
> --- a/lib/arm64/stack.c
> +++ b/lib/arm64/stack.c
> @@ -8,7 +8,8 @@
>  
>  extern char vector_stub_start, vector_stub_end;
>  
> -int backtrace_frame(const void *frame, const void **return_addrs, int max_depth)
> +int arch_backtrace_frame(const void *frame, const void **return_addrs,
> +			 int max_depth, bool current_frame)
>  {
>  	const void *fp = frame;
>  	static bool walking;
> @@ -17,6 +18,9 @@ int backtrace_frame(const void *frame, const void **return_addrs, int max_depth)
>  	bool is_exception = false;
>  	unsigned long addr;
>  
> +	if (current_frame)
> +		fp = __builtin_frame_address(0);
> +
>  	if (walking) {
>  		printf("RECURSIVE STACK WALK!!!\n");
>  		return 0;
> @@ -54,9 +58,3 @@ int backtrace_frame(const void *frame, const void **return_addrs, int max_depth)
>  	walking = false;
>  	return depth;
>  }
> -
> -int backtrace(const void **return_addrs, int max_depth)
> -{
> -	return backtrace_frame(__builtin_frame_address(0),
> -			       return_addrs, max_depth);
> -}
> diff --git a/lib/riscv/stack.c b/lib/riscv/stack.c
> index 712a5478d547..d865594b9671 100644
> --- a/lib/riscv/stack.c
> +++ b/lib/riscv/stack.c
> @@ -2,12 +2,16 @@
>  #include <libcflat.h>
>  #include <stack.h>
>  
> -int backtrace_frame(const void *frame, const void **return_addrs, int max_depth)
> +int arch_backtrace_frame(const void *frame, const void **return_addrs,
> +			 int max_depth, bool current_frame)
>  {
>  	static bool walking;
>  	const unsigned long *fp = (unsigned long *)frame;
>  	int depth;
>  
> +	if (current_frame)
> +		fp = __builtin_frame_address(0);
> +
>  	if (walking) {
>  		printf("RECURSIVE STACK WALK!!!\n");
>  		return 0;
> @@ -24,9 +28,3 @@ int backtrace_frame(const void *frame, const void **return_addrs, int max_depth)
>  	walking = false;
>  	return depth;
>  }
> -
> -int backtrace(const void **return_addrs, int max_depth)
> -{
> -	return backtrace_frame(__builtin_frame_address(0),
> -			       return_addrs, max_depth);
> -}
> diff --git a/lib/s390x/stack.c b/lib/s390x/stack.c
> index 9f234a12adf6..d194f654e94d 100644
> --- a/lib/s390x/stack.c
> +++ b/lib/s390x/stack.c
> @@ -14,11 +14,15 @@
>  #include <stack.h>
>  #include <asm/arch_def.h>
>  
> -int backtrace_frame(const void *frame, const void **return_addrs, int max_depth)
> +int arch_backtrace_frame(const void *frame, const void **return_addrs,
> +			 int max_depth, bool current_frame)
>  {
>  	int depth = 0;
>  	struct stack_frame *stack = (struct stack_frame *)frame;
>  
> +	if (current_frame)
> +		stack = __builtin_frame_address(0);
> +
>  	for (depth = 0; stack && depth < max_depth; depth++) {
>  		return_addrs[depth] = (void *)stack->grs[8];
>  		stack = stack->back_chain;
> @@ -28,9 +32,3 @@ int backtrace_frame(const void *frame, const void **return_addrs, int max_depth)
>  
>  	return depth;
>  }
> -
> -int backtrace(const void **return_addrs, int max_depth)
> -{
> -	return backtrace_frame(__builtin_frame_address(0),
> -			       return_addrs, max_depth);
> -}
> diff --git a/lib/stack.h b/lib/stack.h
> index 10fc2f793354..6edc84344b51 100644
> --- a/lib/stack.h
> +++ b/lib/stack.h
> @@ -11,17 +11,27 @@
>  #include <asm/stack.h>
>  
>  #ifdef HAVE_ARCH_BACKTRACE_FRAME
> -extern int backtrace_frame(const void *frame, const void **return_addrs,
> -			   int max_depth);
> +extern int arch_backtrace_frame(const void *frame, const void **return_addrs,
> +				int max_depth, bool current_frame);
> +
> +static inline int backtrace_frame(const void *frame, const void **return_addrs,
> +				  int max_depth)
> +{
> +	return arch_backtrace_frame(frame, return_addrs, max_depth, false);
> +}
> +
> +static inline int backtrace(const void **return_addrs, int max_depth)
> +{
> +	return arch_backtrace_frame(NULL, return_addrs, max_depth, true);
> +}
>  #else
> -static inline int
> -backtrace_frame(const void *frame __unused, const void **return_addrs __unused,
> -		int max_depth __unused)
> +extern int backtrace(const void **return_addrs, int max_depth);
> +
> +static inline int backtrace_frame(const void *frame, const void **return_addrs,
> +				  int max_depth)
>  {
>  	return 0;
>  }
>  #endif
>  
> -extern int backtrace(const void **return_addrs, int max_depth);
> -
>  #endif
> diff --git a/lib/x86/stack.c b/lib/x86/stack.c
> index 5ecd97ce90b9..58ab6c4b293a 100644
> --- a/lib/x86/stack.c
> +++ b/lib/x86/stack.c
> @@ -1,12 +1,16 @@
>  #include <libcflat.h>
>  #include <stack.h>
>  
> -int backtrace_frame(const void *frame, const void **return_addrs, int max_depth)
> +int arch_backtrace_frame(const void *frame, const void **return_addrs,
> +			 int max_depth, bool current_frame)
>  {
>  	static int walking;
>  	int depth = 0;
>  	const unsigned long *bp = (unsigned long *) frame;
>  
> +	if (current_frame)
> +		bp = __builtin_frame_address(0);
> +
>  	if (walking) {
>  		printf("RECURSIVE STACK WALK!!!\n");
>  		return 0;
> @@ -23,9 +27,3 @@ int backtrace_frame(const void *frame, const void **return_addrs, int max_depth)
>  	walking = 0;
>  	return depth;
>  }
> -
> -int backtrace(const void **return_addrs, int max_depth)
> -{
> -	return backtrace_frame(__builtin_frame_address(0), return_addrs,
> -			       max_depth);
> -}

