Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A07695B2C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 08:53:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PGD3D4pt2z3chq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 18:53:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=NH52649B;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com; envelope-from=philmd@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=NH52649B;
	dkim-atps=neutral
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PGD2F3M8Kz3cP0
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Feb 2023 18:52:21 +1100 (AEDT)
Received: by mail-wm1-x32e.google.com with SMTP id l21-20020a05600c1d1500b003dfe462b7e4so691527wms.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Feb 2023 23:52:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7KCqNNvOOLTosMN7wz9mThItPfprRmoru8ZaaTukQ/o=;
        b=NH52649B5e9oWkZQI64CXOcKgWu0R/VPGanKvfobVBc0cMmqnap+INYCicv7uS6X/o
         ORaBA95en0nswtm5iauNHRRX1tzJJwrQBtdNsqTMHfCiqR9ZrY7h1MuCQ2B0q17Ifs5A
         ioeHa5yxwModQmREAq9Bxb+L+YLqf8rG90Up4ZVIWpnwTFsijBaf5q6dOkCfO+tz/ovm
         U3y8H7Zgzh9dHpI55aiO5P1iXbbs9Z3LAPaYswbStsroxSu4tPsIM+08/XuRi+FVAif0
         xNsv0LgQ2OrsB8MLr7DA4FoqeoCRAzACFYgbBPvqZiEGahLCS6fl3MGwo+50JJm9kDr6
         +jHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7KCqNNvOOLTosMN7wz9mThItPfprRmoru8ZaaTukQ/o=;
        b=H3R686jno2Zo3wgWCKcUMwMxzgJqf99QBuq1swDx5Yjbm/zV8eGePPG3nbXNP/Pu47
         gnG/3mgdUQIarN54Z90v5O+gXbJSm0Cx+ycKTvnNWDS2ZN1dXwaK4Dnd8LgZIGLpQM9y
         OJ6P9s4AiHfJvYdcRMMuyilC7NgQJYo6xYu2wZhVSmbYHEM6TxaVsB628BFSDUL24Uf6
         q9FXiFx52Z6nmq/qsMvE11aR1s61Sa6dfm9aLrVaHoVdpqQf6qg17gYnQa6/MesPcXFM
         0SesivU4khPRbRYA/djscO199Hm4iZuqzwJceQ66+2XKoknNjvtXZdmeKR76QPTpA7oO
         SpYg==
X-Gm-Message-State: AO0yUKWeQ7EMuPUN2IuT3OCSKx1HtIGck1JQyrmvHcYTnELC/YxKfjCi
	k+YxyzTFUd0GvWI/0xuKkpSBPg==
X-Google-Smtp-Source: AK7set8pO3VU0fWGWiVYGzhKXFVM1laZtqm7B7bGikeNwcVBB/kJy44ARMxj6EJ67LsgVc8YXj6tsg==
X-Received: by 2002:a05:600c:2ac8:b0:3df:f2a5:49e0 with SMTP id t8-20020a05600c2ac800b003dff2a549e0mr1748597wme.40.1676361138280;
        Mon, 13 Feb 2023 23:52:18 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id k21-20020a05600c1c9500b003e01493b136sm19983423wms.43.2023.02.13.23.52.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 23:52:17 -0800 (PST)
Message-ID: <6989da47-3e94-fa1e-6edc-0c0bbbb1bbfe@linaro.org>
Date: Tue, 14 Feb 2023 08:52:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH v2 16/24] sparc/cpu: Mark cpu_play_dead() __noreturn
Content-Language: en-US
To: Josh Poimboeuf <jpoimboe@kernel.org>, linux-kernel@vger.kernel.org
References: <cover.1676358308.git.jpoimboe@kernel.org>
 <847fdb53cc7124bb7c94e3e104e443a29be85184.1676358308.git.jpoimboe@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <847fdb53cc7124bb7c94e3e104e443a29be85184.1676358308.git.jpoimboe@kernel.org>
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
Cc: juri.lelli@redhat.com, dalias@libc.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, peterz@infradead.org, catalin.marinas@arm.com, dave.hansen@linux.intel.com, x86@kernel.org, jiaxun.yang@flygoat.com, bsegall@google.com, jcmvbkbc@gmail.com, guoren@kernel.org, hpa@zytor.com, sparclinux@vger.kernel.org, kernel@xen0n.name, will@kernel.org, vschneid@redhat.com, f.fainelli@gmail.com, vincent.guittot@linaro.org, ysato@users.sourceforge.jp, chenhuacai@kernel.org, linux@armlinux.org.uk, linux-csky@vger.kernel.org, mingo@redhat.com, bcm-kernel-feedback-list@broadcom.com, mgorman@suse.de, mattst88@gmail.com, linux-xtensa@linux-xtensa.org, paulmck@kernel.org, richard.henderson@linaro.org, npiggin@gmail.com, ink@jurassic.park.msu.ru, rostedt@goodmis.org, loongarch@lists.linux.dev, tglx@linutronix.de, dietmar.eggemann@arm.com, linux-arm-kernel@lists.infradead.org, jgross@suse.com, chris@zankel.net, tsbogend@alpha.franken.de, bristot@redhat.com, linux-mips@vger.kernel.org, linux-alph
 a@vger.kernel.org, bp@alien8.de, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 14/2/23 08:05, Josh Poimboeuf wrote:
> cpu_play_dead() doesn't return.  Annotate it as such.  By extension this
> also makes arch_cpu_idle_dead() noreturn.
> 
> Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
> ---
>   arch/sparc/include/asm/smp_64.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

