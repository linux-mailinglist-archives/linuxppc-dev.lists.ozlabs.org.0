Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C83D969782D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Feb 2023 09:30:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PGrqb4Hwmz3cV8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Feb 2023 19:30:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=EAjtSefi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com; envelope-from=philmd@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=EAjtSefi;
	dkim-atps=neutral
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PGrpg4VMPz2x9d
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Feb 2023 19:29:28 +1100 (AEDT)
Received: by mail-wr1-x432.google.com with SMTP id o15so14885859wrc.9
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Feb 2023 00:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D+uRuWA2my0PkLfTRJkVAZ05w6wbQaFzpjSQTlA3Y10=;
        b=EAjtSefiFMcRJUjTT1vKa++/98Yo1SN60xpEBkPSeru5QVrOombFl7ZHZ9y0eBb+k8
         1ZpycnMJayGmVT6T6UnuPRjCB3nPxmBujGFtXaNp8cbOZSlWgdaIEhXU+GGjztzV/czy
         1WDq6VfomA00oo7hLpCf0eBYSqerRkvKuSrVmRTM4XbxzJrQVoIbRj0AGC+iAePl6sTf
         Z2xptiD/VOo1nfoRA4XWNffLKM3ZE08q46EkUvIRst5VglioETpQYFtr/iY0tCSkcOlD
         bJtursUf7vQFXV0RL9Rz9XvQSF18NBopDoEorHB9a2ffDlY3yM0iSt8r0hW9VmbKY8B/
         Tfog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D+uRuWA2my0PkLfTRJkVAZ05w6wbQaFzpjSQTlA3Y10=;
        b=WPW1o7iYv7vVM9tZ9YIMzD2dbpjzX9hW/VuBMGzq80igbgFQLoPsW+zkjdnwmSAzTN
         jeeaais9GkcyAuEOhVaxFsDsfb63uNQrOIb85I3YrRynHnf/IeoWftwPFHU6Pd3BB1we
         QZQsQHAVdoKiRZnz4RRkkAVtvUSuFBK3xiOr16jwDTx/4Wyis3vxBIOUzpxmS8Z8+tFd
         3h44Z1rSqD0Ht4yO7AyxZtKXVqk5SMviawJBYUQhvUwn0QFKfvTxsP6YEkA4Iw6y8Ddp
         cNKxx7WIejODQ9g1WjN/pLMF+kxU/6Tz9dE4zwzJ2+P+BWgXm5ld4YsboFbijcl9qpDa
         gjyA==
X-Gm-Message-State: AO0yUKWFgGpLXNdp1iLNwaGns0kRNhZRnYyfVmnzZhDEAUmuUh9jWnw/
	LGbBUcbl3foycNk2QB+2hF+vDg==
X-Google-Smtp-Source: AK7set8G2iiFdHjvUAVVY5llFOflusvwqwWTyX5fVt/Awzv2HxyXMg5++kq1nd94kDMQiFL/tQeRqw==
X-Received: by 2002:a5d:67cc:0:b0:2c5:58fc:e1bb with SMTP id n12-20020a5d67cc000000b002c558fce1bbmr826926wrw.10.1676449764713;
        Wed, 15 Feb 2023 00:29:24 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id i2-20020adfefc2000000b002c553e061fdsm8524783wrp.112.2023.02.15.00.29.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Feb 2023 00:29:24 -0800 (PST)
Message-ID: <c56dc4b9-035d-7773-ecb2-0e1ac6af7abc@linaro.org>
Date: Wed, 15 Feb 2023 09:29:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH v2 09/24] mips/cpu: Expose play_dead()'s prototype
 definition
Content-Language: en-US
To: Josh Poimboeuf <jpoimboe@kernel.org>
References: <cover.1676358308.git.jpoimboe@kernel.org>
 <39835bc75af2e812fce56400533cb2ab41bcf0e2.1676358308.git.jpoimboe@kernel.org>
 <080a5ccb-7fa0-1a75-538f-a09dc146fc4e@linaro.org>
 <20230214181101.3a2tscbmwdnwbqpu@treble>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230214181101.3a2tscbmwdnwbqpu@treble>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: juri.lelli@redhat.com, dalias@libc.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, peterz@infradead.org, catalin.marinas@arm.com, dave.hansen@linux.intel.com, x86@kernel.org, jiaxun.yang@flygoat.com, linux-mips@vger.kernel.org, bsegall@google.com, jcmvbkbc@gmail.com, guoren@kernel.org, hpa@zytor.com, sparclinux@vger.kernel.org, kernel@xen0n.name, will@kernel.org, vschneid@redhat.com, f.fainelli@gmail.com, vincent.guittot@linaro.org, ysato@users.sourceforge.jp, chenhuacai@kernel.org, linux@armlinux.org.uk, linux-csky@vger.kernel.org, mingo@redhat.com, bcm-kernel-feedback-list@broadcom.com, mgorman@suse.de, mattst88@gmail.com, linux-xtensa@linux-xtensa.org, paulmck@kernel.org, richard.henderson@linaro.org, npiggin@gmail.com, ink@jurassic.park.msu.ru, rostedt@goodmis.org, loongarch@lists.linux.dev, tglx@linutronix.de, dietmar.eggemann@arm.com, linux-arm-kernel@lists.infradead.org, jgross@suse.com, chris@zankel.net, tsbogend@alpha.franken.de, bristot@redhat.com, linux-kern
 el@vger.kernel.org, linux-alpha@vger.kernel.org, bp@alien8.de, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 14/2/23 19:11, Josh Poimboeuf wrote:
> On Tue, Feb 14, 2023 at 08:46:41AM +0100, Philippe Mathieu-Daudé wrote:
>> Hi Josh,
>>
>> On 14/2/23 08:05, Josh Poimboeuf wrote:
>>> Include <asm/smp.h> to make sure play_dead() matches its prototype going
>>> forward.
>>>
>>> Acked-by: Florian Fainelli <f.fainelli@gmail.com>
>>> Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
>>> ---
>>>    arch/mips/kernel/smp-bmips.c | 1 +
>>>    1 file changed, 1 insertion(+)
>>>
>>> diff --git a/arch/mips/kernel/smp-bmips.c b/arch/mips/kernel/smp-bmips.c
>>> index f5d7bfa3472a..df9158e8329d 100644
>>> --- a/arch/mips/kernel/smp-bmips.c
>>> +++ b/arch/mips/kernel/smp-bmips.c
>>> @@ -38,6 +38,7 @@
>>>    #include <asm/traps.h>
>>>    #include <asm/barrier.h>
>>>    #include <asm/cpu-features.h>
>>> +#include <asm/smp.h>
>>
>> What about the other implementations?
>>
>> $ git grep -L asm/smp.h $(git grep -wlF 'play_dead(void)' arch/mips)
>> arch/mips/cavium-octeon/smp.c
>> arch/mips/kernel/smp-bmips.c
>> arch/mips/kernel/smp-cps.c
>> arch/mips/loongson64/smp.c
> 
> Indeed.  I really wish we had -Wmissing-prototypes.
> 
> I'll squash this in:
> 
> diff --git a/arch/mips/cavium-octeon/smp.c b/arch/mips/cavium-octeon/smp.c
> index 89954f5f87fb..4212584e6efa 100644
> --- a/arch/mips/cavium-octeon/smp.c
> +++ b/arch/mips/cavium-octeon/smp.c
> @@ -20,6 +20,7 @@
>   #include <asm/mmu_context.h>
>   #include <asm/time.h>
>   #include <asm/setup.h>
> +#include <asm/smp.h>
>   
>   #include <asm/octeon/octeon.h>
>   
> diff --git a/arch/mips/kernel/smp-cps.c b/arch/mips/kernel/smp-cps.c
> index bcd6a944b839..6d69a9ba8167 100644
> --- a/arch/mips/kernel/smp-cps.c
> +++ b/arch/mips/kernel/smp-cps.c
> @@ -20,6 +20,7 @@
>   #include <asm/mipsregs.h>
>   #include <asm/pm-cps.h>
>   #include <asm/r4kcache.h>
> +#include <asm/smp.h>
>   #include <asm/smp-cps.h>
>   #include <asm/time.h>
>   #include <asm/uasm.h>
> diff --git a/arch/mips/loongson64/smp.c b/arch/mips/loongson64/smp.c
> index c81c2bd07c62..df8d789ede3c 100644
> --- a/arch/mips/loongson64/smp.c
> +++ b/arch/mips/loongson64/smp.c
> @@ -14,6 +14,7 @@
>   #include <linux/cpufreq.h>
>   #include <linux/kexec.h>
>   #include <asm/processor.h>
> +#include <asm/smp.h>
>   #include <asm/time.h>
>   #include <asm/tlbflush.h>
>   #include <asm/cacheflush.h>

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Thanks.
