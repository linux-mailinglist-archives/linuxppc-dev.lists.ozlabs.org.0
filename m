Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DD333695C09
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 09:06:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PGDL25vGSz3cHG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 19:06:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=evhLL97J;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com; envelope-from=philmd@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=evhLL97J;
	dkim-atps=neutral
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PGDK75H5Tz3bfp
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Feb 2023 19:05:15 +1100 (AEDT)
Received: by mail-wm1-x334.google.com with SMTP id k8-20020a05600c1c8800b003dc57ea0dfeso13065795wms.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Feb 2023 00:05:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JF52YzZhW4elUM7Kky6bPhzQenJZTY4P/46jrbrklX0=;
        b=evhLL97JMkNYAYn9bGpom2GYrZHUYt2CtyFeYuIEml6T8racA9Aij5ni53nA2qN2B/
         7ol3c+EAOiUcR3bb0Nbg6oEblv3Vg7fMwY7/0LEF5VCVPbgg/9qJMYGdcPWyfh/NzUJP
         nVm8iXoCxY27TAbyblLvNVZ54uQ2sCsTY83Lokf3aopdz/EdDYYXBo8GWIClq0AGjewl
         aTkyCiKCaGx5UjLiSjzaakSSVH5DgeZyjpiMZih++pjBLki4KH45JDUvESt1xmw+rXib
         kUDSlfXab71A8Mkvhrw8TlHo9Ob8++YPLFpUADMuiGoEgIwoLSkBvntwalRx8rWTfTF1
         ikQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JF52YzZhW4elUM7Kky6bPhzQenJZTY4P/46jrbrklX0=;
        b=D2+mHpWphx2JfKq9UHs8uQQWzCPWQsoxB6V27MKOWCo5APsikCd0OAmmhRZLSZcRDp
         qmyOaVqArL0B65QlvY8o6SMb2ne8eFxRp8eyVcSrLJa6NzBF4voca6fbTvKRD0aqD41g
         0QeECLZOmGSXhxLY0TwcyzMvDR3gS9HWtETcxFQ/1y8E8P7MIvFRDaEiK22ZqliG3odr
         pAY7UmX4ETX/u562cx2Wb4RHLuaXU6kjKUSqKFax9GY2vGe3NojW9zqqvwu7Ai4zuTqx
         3FEXJNkZGPuyQNsh5mbs2/W7pJv3OvvLBDmJx9K9T1MZ5E6+r1mJICd4xHDt9sH7BQKh
         TY/Q==
X-Gm-Message-State: AO0yUKXV537qUZNB+zaBqHRr4drndmJrLm8Fxu1aBNAiOnxXEEUk+F5b
	NbLMKiBRXGOwU63Iu8Cxee6Z0w==
X-Google-Smtp-Source: AK7set+HRG63gtrfZ+yNMRuCoXR1/Fc+yCbk1jg17GVbOh3n568w3mx2NtmeBnWmKBshSuBezAU6Uw==
X-Received: by 2002:a05:600c:3d98:b0:3e1:e149:b67b with SMTP id bi24-20020a05600c3d9800b003e1e149b67bmr8681792wmb.18.1676361911280;
        Tue, 14 Feb 2023 00:05:11 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id d5-20020a1c7305000000b003dc4baaedd3sm18757416wmb.37.2023.02.14.00.05.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Feb 2023 00:05:10 -0800 (PST)
Message-ID: <579b0715-dba2-246c-63a1-7e0ef4e9f9a5@linaro.org>
Date: Tue, 14 Feb 2023 09:05:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH v2 17/24] x86/cpu: Make sure play_dead() doesn't return
Content-Language: en-US
To: Josh Poimboeuf <jpoimboe@kernel.org>, linux-kernel@vger.kernel.org
References: <cover.1676358308.git.jpoimboe@kernel.org>
 <11e6ac1cf10f92967882926e3ac16287b50642f2.1676358308.git.jpoimboe@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <11e6ac1cf10f92967882926e3ac16287b50642f2.1676358308.git.jpoimboe@kernel.org>
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
> After commit 076cbf5d2163 ("x86/xen: don't let xen_pv_play_dead()
> return"), play_dead() never returns.  Make that more explicit with a
> BUG().
> 
> BUG() is preferable to unreachable() because BUG() is a more explicit
> failure mode and avoids undefined behavior like falling off the edge of
> the function into whatever code happens to be next.
> 
> Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
> ---
>   arch/x86/include/asm/smp.h | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/x86/include/asm/smp.h b/arch/x86/include/asm/smp.h
> index b4dbb20dab1a..8f628e08b25a 100644
> --- a/arch/x86/include/asm/smp.h
> +++ b/arch/x86/include/asm/smp.h
> @@ -96,6 +96,7 @@ static inline void __cpu_die(unsigned int cpu)
>   static inline void play_dead(void)
>   {
>   	smp_ops.play_dead();
> +	BUG();
>   }

Similarly, smp_ops::play_dead() should be decorated noreturn first.
