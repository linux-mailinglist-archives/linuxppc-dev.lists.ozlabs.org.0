Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B33695C8F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 09:14:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PGDWH03LMz3cML
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 19:14:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=VyF1fPdQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com; envelope-from=philmd@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=VyF1fPdQ;
	dkim-atps=neutral
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PGDVM4g75z3cBP
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Feb 2023 19:13:14 +1100 (AEDT)
Received: by mail-wm1-x330.google.com with SMTP id l37-20020a05600c1d2500b003dfe46a9801so10927197wms.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Feb 2023 00:13:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cRk5ZZgGHESQjRAciCkzTAgvsM2DNZ9ZsvdntVwJ0aM=;
        b=VyF1fPdQ9QypQQWSzFllqGzI7seyTSuDNNWwfWkkysTNgd3Z0AjIHNF4LL0vR9kDt1
         TWXLrpk12hmDLU5xwDRS8oUfZzApeC/OHNNgO/kMt5igi3066XuNNQHPHFYxq5aB3Iio
         Rm5A78vOgv0qZPG3TgPZ61nsLc76jlc9DVGKtErGMeKDI9u1sAq/m/nABeTJZydjJdxc
         KGyGm1+PtUnlS5irzivoc/koNSZhBHg8b061deMm/1IYjdDegSeovedsXz378PrcPSkc
         AtwiyODrhxTX3DivF8dzOcKQXifNwgDmLtIw7KfLqn/lQcvbpYuvCV1bwFmaRQqmk4vF
         cK6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cRk5ZZgGHESQjRAciCkzTAgvsM2DNZ9ZsvdntVwJ0aM=;
        b=KYwcE4bytcLu2b/bYi1gEZaofHr5RQ6XgB+T664bHyWZJMKMcJvmHWs7bXKUQDYF3B
         8vqxEJKzXMaOg+GmwRmpkfdexMjDoAw54Ak9Y6iJddgC2fgd/OXItjA623yuZ2W6fLk7
         GNCbBh1r5iD0+nFpeYjr1Vg5cug9A4e8NpqYONmqjw2Uwjb2vOO5vd2FLZkWhz+mrNv8
         U4D4iIJK6dcCBViVqvEjOvznxkNjnoxJjf5r8PjznEG8EwCUgBL14kpBlTKbrkQqYaoZ
         rAmRsaq7sUqg19wzKfn5DL6zQ5Q2GpflgpQuSxLKFQ+gShHCUmi4kozDqmJrlyxXFDeX
         tVDg==
X-Gm-Message-State: AO0yUKUYR5+2sRZX7ifbF4D5WOwV5NqNBSxKvXh5PBkEgIXKHhkR0hH9
	3zJzKWMPp4fwFvR/CGVW3GI8gw==
X-Google-Smtp-Source: AK7set86AEK8D+D8+uPrCG75m0oQUNX8HZoOAkr8DDcCJCZFL80/CRikdClz+P95k5T2L/MBj1J/jQ==
X-Received: by 2002:a05:600c:30d2:b0:3dc:4fd7:31f7 with SMTP id h18-20020a05600c30d200b003dc4fd731f7mr1177763wmn.41.1676362392093;
        Tue, 14 Feb 2023 00:13:12 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id l9-20020a05600c4f0900b003db1ca20170sm17626418wmq.37.2023.02.14.00.13.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Feb 2023 00:13:11 -0800 (PST)
Message-ID: <14274f04-2991-95bd-c29b-07e86e8755c1@linaro.org>
Date: Tue, 14 Feb 2023 09:13:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH v2 04/24] arm64/cpu: Mark cpu_die() __noreturn
Content-Language: en-US
To: Josh Poimboeuf <jpoimboe@kernel.org>, linux-kernel@vger.kernel.org
References: <cover.1676358308.git.jpoimboe@kernel.org>
 <e47fc487980d5330e6059ac6e16416bec88cda0e.1676358308.git.jpoimboe@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <e47fc487980d5330e6059ac6e16416bec88cda0e.1676358308.git.jpoimboe@kernel.org>
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
Cc: juri.lelli@redhat.com, dalias@libc.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, peterz@infradead.org, catalin.marinas@arm.com, dave.hansen@linux.intel.com, x86@kernel.org, jiaxun.yang@flygoat.com, bsegall@google.com, jcmvbkbc@gmail.com, guoren@kernel.org, hpa@zytor.com, sparclinux@vger.kernel.org, kernel@xen0n.name, will@kernel.org, vschneid@redhat.com, f.fainelli@gmail.com, vincent.guittot@linaro.org, ysato@users.sourceforge.jp, chenhuacai@kernel.org, linux@armlinux.org.uk, linux-csky@vger.kernel.org, mingo@redhat.com, bcm-kernel-feedback-list@broadcom.com, mgorman@suse.de, mattst88@gmail.com, linux-xtensa@linux-xtensa.org, paulmck@kernel.org, richard.henderson@linaro.org, npiggin@gmail.com, ink@jurassic.park.msu.ru, rostedt@goodmis.org, loongarch@lists.linux.dev, tglx@linutronix.de, dietmar.eggemann@arm.com, linux-arm-kernel@lists.infradead.org, jgross@suse.com, chris@zankel.net, tsbogend@alpha.franken.de, bristot@redhat.com, linux-mips@vger.kernel.org, linux-alph
 a@vger.kernel.org, bp@alien8.de, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 14/2/23 08:05, Josh Poimboeuf wrote:
> cpu_die() doesn't return.  Annotate it as such.  By extension this also
> makes arch_cpu_idle_dead() noreturn.
> 
> Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
> ---
>   arch/arm64/include/asm/smp.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/include/asm/smp.h b/arch/arm64/include/asm/smp.h
> index fc55f5a57a06..5733a31bab08 100644
> --- a/arch/arm64/include/asm/smp.h
> +++ b/arch/arm64/include/asm/smp.h
> @@ -100,7 +100,7 @@ static inline void arch_send_wakeup_ipi_mask(const struct cpumask *mask)
>   extern int __cpu_disable(void);
>   
>   extern void __cpu_die(unsigned int cpu);
> -extern void cpu_die(void);
> +extern void __noreturn cpu_die(void);
>   extern void cpu_die_early(void);

Shouldn't cpu_operations::cpu_die() be declared noreturn first?

