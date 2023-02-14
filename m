Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88302695B62
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 08:56:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PGD6z2XHGz3cFT
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 18:56:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=h7M/SCUz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com; envelope-from=philmd@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=h7M/SCUz;
	dkim-atps=neutral
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PGD632FFkz3bgk
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Feb 2023 18:55:39 +1100 (AEDT)
Received: by mail-wr1-x429.google.com with SMTP id o15so11378447wrc.9
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Feb 2023 23:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yp9YVWt295eBrVzLlEnMpa7WOgUH71k9lLJgF3DktSY=;
        b=h7M/SCUzNlOISn5jTGNmLltaLnbaZUtdxvRAjU33Milk2tpbKS2C1xqAq0HPm/BJRT
         FiJ/HCdDfWLCGCTNdK3VS2qjtc9bpTHe81E3CHaSYgmIq5P8HZR7PAW1a8s10oF2TIN2
         HojjglJNveA+nL0EeGaVfr3pzEZ9h17G9zgq7eukZMRTKZ2554cjMQl6XJfdOivXDkqk
         p6+UvsMCjwelsi/fnbvPZ4bmn5hfmGaZNsy5Ihf1d+h0B7f6xnfKvDzNoawdB3/hVkXh
         jP0nQULxasHEDW+waBz6yBAelaG8oXEN0PvGFOoSyLSbjEhs1hwBhQkj5fUqpkYkA3YB
         8MHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yp9YVWt295eBrVzLlEnMpa7WOgUH71k9lLJgF3DktSY=;
        b=TGT5CzFi6e88UNRpT+jKEgOTPtnrXsKEnl+n8exkv4p7am06p9uNaxZtjtcc6z0Fen
         OvGbRzNgCesXcZfDemDKEPMQKWmu050WXDTypokfZkAO9jlY5rfumrP3qN8rRVKoy01+
         fDLpD5nmWC4ag3hHBXUg9o88BcyITwRNfBkR1DF4OwQDJ7Bkk3Say2qRtEP3htmiDpaZ
         8AQpES51pGG5q92s9mSv7zVkCQCeikZXoMGdHxXyoCyCVyczJAKGq50145irQlIHTyH8
         0b4LrtktVn0PmVT9lchOgTYalqA6GkNRA3GmllfA8/kZ3dnT5c5cvkEdoLvOZPUktvGf
         fMHA==
X-Gm-Message-State: AO0yUKUXNy8DL0SdQRZrfrzKuLyfuYlVByiC7JcBSEVZ65M5ExLY1eqg
	coOvJugLySMWuawx970MRrICbw==
X-Google-Smtp-Source: AK7set/rbY3MtHZ2OwQUg49PapdpOUKWpKu/tClY9KXy+Lf8mxXzVA+B1mGvCao1HrbQ7vXyzSy4uA==
X-Received: by 2002:a5d:498c:0:b0:2c5:595a:1c91 with SMTP id r12-20020a5d498c000000b002c5595a1c91mr1050356wrq.7.1676361336205;
        Mon, 13 Feb 2023 23:55:36 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id y1-20020a5d6201000000b002c3ea5ebc73sm12178299wru.101.2023.02.13.23.55.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 23:55:35 -0800 (PST)
Message-ID: <1b4afd82-83cb-0060-7cab-8e16d2e69ff9@linaro.org>
Date: Tue, 14 Feb 2023 08:55:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH v2 19/24] xtensa/cpu: Make sure cpu_die() doesn't return
Content-Language: en-US
To: Josh Poimboeuf <jpoimboe@kernel.org>, linux-kernel@vger.kernel.org
References: <cover.1676358308.git.jpoimboe@kernel.org>
 <cca346b5c87693499e630291d78fb0bf12c24290.1676358308.git.jpoimboe@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <cca346b5c87693499e630291d78fb0bf12c24290.1676358308.git.jpoimboe@kernel.org>
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

Hi Josh,

On 14/2/23 08:05, Josh Poimboeuf wrote:
> cpu_die() doesn't return.  Make that more explicit with a BUG().
> 
> BUG() is preferable to unreachable() because BUG() is a more explicit
> failure mode and avoids undefined behavior like falling off the edge of
> the function into whatever code happens to be next.
> 
> Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
> ---
>   arch/xtensa/kernel/smp.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/xtensa/kernel/smp.c b/arch/xtensa/kernel/smp.c
> index 4dc109dd6214..7bad78495536 100644
> --- a/arch/xtensa/kernel/smp.c
> +++ b/arch/xtensa/kernel/smp.c

Can you update the documentation along? Currently we have:

   /*
    * Called from the idle thread for the CPU which has been shutdown.
    *
    * Note that we disable IRQs here, but do not re-enable them
    * before returning to the caller. This is also the behaviour
    * of the other hotplug-cpu capable cores, so presumably coming
    * out of idle fixes this.
    */

> @@ -341,6 +341,8 @@ void __ref cpu_die(void)
>   	__asm__ __volatile__(
>   			"	movi	a2, cpu_restart\n"
>   			"	jx	a2\n");
> +
> +	BUG();
>   }
>   
>   #endif /* CONFIG_HOTPLUG_CPU */

