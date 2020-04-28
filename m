Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BBCF41BC23F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 17:07:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49BQ45340czDqt3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 01:07:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=ushqNWwQ; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49BPzf57MRzDqst
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Apr 2020 01:03:41 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 49BPzW3dfTz9v15v;
 Tue, 28 Apr 2020 17:03:35 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=ushqNWwQ; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 888An010Dbh2; Tue, 28 Apr 2020 17:03:35 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 49BPzW1cy2z9v15t;
 Tue, 28 Apr 2020 17:03:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1588086215; bh=5CBd4E9CA6IITWddshmZNH+j536GtE2mfs5mAzryyEg=;
 h=Subject:To:References:Cc:From:Date:In-Reply-To:From;
 b=ushqNWwQ8Sv0BKzc6AjEoxwqBMK3bsqwJ0M68LYgj5hS4LPLhkZ18T5F8KNnTPt0l
 D4obI2WQowdkZrR5SYkGtT+4mENu9vxfj17MqP9vXUbL1gfs3wC8CFY1bH8Q64Y3tr
 QvtU8MbkkdwupPbL60Axww8WbCpoTQ4iNHupfg3U=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9D16F8B814;
 Tue, 28 Apr 2020 17:03:36 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id l_h9AbbocvpW; Tue, 28 Apr 2020 17:03:36 +0200 (CEST)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 06C1C8B868;
 Tue, 28 Apr 2020 17:03:35 +0200 (CEST)
Subject: Re: [PATCH v8 8/8] powerpc/vdso: Provide __kernel_clock_gettime64()
 on vdso32
To: Russell Currey <ruscur@russell.cc>
References: <cover.1588079622.git.christophe.leroy@c-s.fr>
 <e78344d3fcc1d33bfb1782e430b7f0529f6c612f.1588079622.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <b946c4d8-59aa-f851-b73c-602c7b0d86e4@c-s.fr>
Date: Tue, 28 Apr 2020 15:03:32 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <e78344d3fcc1d33bfb1782e430b7f0529f6c612f.1588079622.git.christophe.leroy@c-s.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,


On 04/28/2020 01:16 PM, Christophe Leroy wrote:
> Provides __kernel_clock_gettime64() on vdso32. This is the
> 64 bits version of __kernel_clock_gettime() which is
> y2038 compliant.
>
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>

Why does snowpatch still report upstream failure ? This is fixed in 
latest powerpc/merge which is

commit d9e4eabb775e1ba56d83bd4047de2413a21f87ce
Merge: 54dc28ff5e0b 51184ae37e05
Author: Michael Ellerman <mpe@ellerman.id.au>
Date:   Tue Apr 28 09:01:47 2020 +1000

     Automatic merge of branches 'master', 'next' and 'fixes' into merge

Looks like snowpatch is still using

commit 54dc28ff5e0b3585224d49a31b53e030342ca5c3
Merge: 5d23fec1ac1d b2768df24ec4
Author: Michael Ellerman <mpe@ellerman.id.au>
Date:   Sun Apr 26 09:44:18 2020 +1000

     Automatic merge of branches 'master', 'next' and 'fixes' into merge

Why ?

Christophe



> ---
>   arch/powerpc/kernel/vdso32/gettimeofday.S  | 9 +++++++++
>   arch/powerpc/kernel/vdso32/vdso32.lds.S    | 1 +
>   arch/powerpc/kernel/vdso32/vgettimeofday.c | 6 ++++++
>   3 files changed, 16 insertions(+)
>
> diff --git a/arch/powerpc/kernel/vdso32/gettimeofday.S b/arch/powerpc/kernel/vdso32/gettimeofday.S
> index fd7b01c51281..a6e29f880e0e 100644
> --- a/arch/powerpc/kernel/vdso32/gettimeofday.S
> +++ b/arch/powerpc/kernel/vdso32/gettimeofday.S
> @@ -35,6 +35,15 @@ V_FUNCTION_BEGIN(__kernel_clock_gettime)
>   	cvdso_call __c_kernel_clock_gettime
>   V_FUNCTION_END(__kernel_clock_gettime)
>   
> +/*
> + * Exact prototype of clock_gettime64()
> + *
> + * int __kernel_clock_gettime64(clockid_t clock_id, struct __timespec64 *ts);
> + *
> + */
> +V_FUNCTION_BEGIN(__kernel_clock_gettime64)
> +	cvdso_call __c_kernel_clock_gettime64
> +V_FUNCTION_END(__kernel_clock_gettime64)
>   
>   /*
>    * Exact prototype of clock_getres()
> diff --git a/arch/powerpc/kernel/vdso32/vdso32.lds.S b/arch/powerpc/kernel/vdso32/vdso32.lds.S
> index 6cf729612268..05b462143238 100644
> --- a/arch/powerpc/kernel/vdso32/vdso32.lds.S
> +++ b/arch/powerpc/kernel/vdso32/vdso32.lds.S
> @@ -144,6 +144,7 @@ VERSION
>   #ifndef CONFIG_PPC_BOOK3S_601
>   		__kernel_gettimeofday;
>   		__kernel_clock_gettime;
> +		__kernel_clock_gettime64;
>   		__kernel_clock_getres;
>   		__kernel_time;
>   		__kernel_get_tbfreq;
> diff --git a/arch/powerpc/kernel/vdso32/vgettimeofday.c b/arch/powerpc/kernel/vdso32/vgettimeofday.c
> index 0b9ab4c22ef2..f7f71fecf4ed 100644
> --- a/arch/powerpc/kernel/vdso32/vgettimeofday.c
> +++ b/arch/powerpc/kernel/vdso32/vgettimeofday.c
> @@ -11,6 +11,12 @@ int __c_kernel_clock_gettime(clockid_t clock, struct old_timespec32 *ts,
>   	return __cvdso_clock_gettime32_data(vd, clock, ts);
>   }
>   
> +int __c_kernel_clock_gettime64(clockid_t clock, struct __kernel_timespec *ts,
> +			       const struct vdso_data *vd)
> +{
> +	return __cvdso_clock_gettime_data(vd, clock, ts);
> +}
> +
>   int __c_kernel_gettimeofday(struct __kernel_old_timeval *tv, struct timezone *tz,
>   			    const struct vdso_data *vd)
>   {

