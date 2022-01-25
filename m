Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A53B249A794
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jan 2022 04:21:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JjXDy4Qbqz3cQD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jan 2022 14:21:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.57;
 helo=out30-57.freemail.mail.aliyun.com; envelope-from=yinan@linux.alibaba.com;
 receiver=<UNKNOWN>)
Received: from out30-57.freemail.mail.aliyun.com
 (out30-57.freemail.mail.aliyun.com [115.124.30.57])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JjXDX3b4sz2x9W
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jan 2022 14:20:40 +1100 (AEDT)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R171e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04395; MF=yinan@linux.alibaba.com;
 NM=1; PH=DS; RN=3; SR=0; TI=SMTPD_---0V2oIoUV_1643080828; 
Received: from 30.240.99.45(mailfrom:yinan@linux.alibaba.com
 fp:SMTPD_---0V2oIoUV_1643080828) by smtp.aliyun-inc.com(127.0.0.1);
 Tue, 25 Jan 2022 11:20:29 +0800
Message-ID: <0fa0daec-881a-314b-e28b-3828e80bbd90@linux.alibaba.com>
Date: Tue, 25 Jan 2022 11:20:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [powerpc] ftrace warning kernel/trace/ftrace.c:2068 with
 code-patching selftests
To: Steven Rostedt <rostedt@goodmis.org>
References: <944D10DA-8200-4BA9-8D0A-3BED9AA99F82@linux.ibm.com>
 <e9422643-a210-b77f-a037-da63a9d2e925@linux.alibaba.com>
 <20220124114548.30241947@gandalf.local.home>
From: Yinan Liu <yinan@linux.alibaba.com>
In-Reply-To: <20220124114548.30241947@gandalf.local.home>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: linuxppc-dev@lists.ozlabs.org, Sachin Sant <sachinp@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> Yeah, I think it's time to opt in, instead of opting out.
> 
> Something like this:
> 
> -- Steve
> 
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index c2724d986fa0..5256ebe57451 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -82,6 +82,7 @@ config ARM
>   	select HAVE_EBPF_JIT if !CPU_ENDIAN_BE32
>   	select HAVE_CONTEXT_TRACKING
>   	select HAVE_C_RECORDMCOUNT
> +	select HAVE_BUILDTIME_MCOUNT_SORT
>   	select HAVE_DEBUG_KMEMLEAK if !XIP_KERNEL
>   	select HAVE_DMA_CONTIGUOUS if MMU
>   	select HAVE_DYNAMIC_FTRACE if !XIP_KERNEL && !CPU_ENDIAN_BE32 && MMU
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index c4207cf9bb17..7996548b2b27 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -166,6 +166,7 @@ config ARM64
>   	select HAVE_ASM_MODVERSIONS
>   	select HAVE_EBPF_JIT
>   	select HAVE_C_RECORDMCOUNT
> +	select HAVE_BUILDTIME_MCOUNT_SORT
>   	select HAVE_CMPXCHG_DOUBLE
>   	select HAVE_CMPXCHG_LOCAL
>   	select HAVE_CONTEXT_TRACKING
> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index 7399327d1eff..46080dea5dba 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -186,6 +186,7 @@ config X86
>   	select HAVE_CONTEXT_TRACKING_OFFSTACK	if HAVE_CONTEXT_TRACKING
>   	select HAVE_C_RECORDMCOUNT
>   	select HAVE_OBJTOOL_MCOUNT		if STACK_VALIDATION
> +	select HAVE_BUILDTIME_MCOUNT_SORT
>   	select HAVE_DEBUG_KMEMLEAK
>   	select HAVE_DMA_CONTIGUOUS
>   	select HAVE_DYNAMIC_FTRACE
> diff --git a/kernel/trace/Kconfig b/kernel/trace/Kconfig
> index 752ed89a293b..7e5b92090faa 100644
> --- a/kernel/trace/Kconfig
> +++ b/kernel/trace/Kconfig
> @@ -70,10 +70,16 @@ config HAVE_C_RECORDMCOUNT
>   	help
>   	  C version of recordmcount available?
>   
> +config HAVE_BUILDTIME_MCOUNT_SORT
> +       bool
> +       help
> +         An architecture selects this if it sorts the mcount_loc section
> +	 at build time.
> +
>   config BUILDTIME_MCOUNT_SORT
>          bool
>          default y
> -       depends on BUILDTIME_TABLE_SORT && !S390
> +       depends on HAVE_BUILDTIME_MCOUNT_SORT
>          help
>            Sort the mcount_loc section at build time.

LGTM. This will no longer destroy ftrace on other architectures.
Those arches that we are not sure about can test and enable this 
function by themselves.


Best regards
--yinan
