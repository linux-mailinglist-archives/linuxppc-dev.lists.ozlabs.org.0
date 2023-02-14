Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8403B695F0A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 10:26:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PGG7F2yg6z3cNg
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 20:26:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=NES+X0ji;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com; envelope-from=philmd@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=NES+X0ji;
	dkim-atps=neutral
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PGG6H6BYHz3cJF
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Feb 2023 20:25:57 +1100 (AEDT)
Received: by mail-wr1-x42d.google.com with SMTP id bu23so14903255wrb.8
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Feb 2023 01:25:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QDxRPg0tzmSlpSdGNasFtKDU/RizntlcLVEvFLg/3J0=;
        b=NES+X0jitlSFN9CMyxtOBnwXvr4UEkpCwjSf8ktPB+wXMhbktMrNUflH+JM2ssaH9K
         1szwzK+H0w1R1obMWrGYq2h5EqmbiN8TzRSCSDfQ0xIRnMtUM0YXe0sOqWpLCMwXuGjf
         pq5Tp+btAH/Jp2UMc+IUaq03lyRqROMWnwZHj0SyNjg2aEHISp2YzMuCIH2fFqgRFL2C
         nh8rUW+D8G8ohs7qk9rK8//cKtczB59ooJFvWHa+cMfxk4FIJRL/sUbUY+TwB9aq5oQ6
         5XNgdahaS2tg0VmMYr3n7xy9L8AkuRxwtGbyTzFH3A9vsOSJ49wrhdrqe9fR4BHUPm/1
         +QNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QDxRPg0tzmSlpSdGNasFtKDU/RizntlcLVEvFLg/3J0=;
        b=ml21gYxeG8zbe8O5s5DBBgmZNuQhpGvs+8BidLU4LiouAEZOdLk80GxY3Ow0jL2b84
         M8qUPfSDV4QqO+YqIxbQCg5QU44jxo+cmvumViu7ErMqHfKsDpeh/b/IuT0yHNERT6qQ
         Egbo6KBECebtqGSRtkl/0k9wgQkvtIdI1zYtC3FHQldwILpQvD/7yjYoIwHY+L96xK7j
         67jMxEiFdLP1aF5/YEtIPvRTlizBjXOptwzjCJ6IqBFUJMUG4JF8Ns0rl9TacqwaWIOR
         Lsvl4JKzzQyDJVF74f7GJSnIJ66uFDjx1HvfVstayTZycK6UI0TiowehCkMQ+3Nh1sQ/
         AWtQ==
X-Gm-Message-State: AO0yUKUKKaiQjSsSf2uBExbgtRZHdy94JHfp5qFK5+uigGPk8iQj5fT1
	FC4lC+w7kf9thoxcE/CJyO3NCw==
X-Google-Smtp-Source: AK7set/9MnT573XDoeCr+EYDww6Z0dgS8IXweDvdGBdO2qa8Cb9d8o+MYY77g+qurwoNXDnWtaacEA==
X-Received: by 2002:adf:e9c5:0:b0:2c5:4dbf:587 with SMTP id l5-20020adfe9c5000000b002c54dbf0587mr1635221wrn.57.1676366753443;
        Tue, 14 Feb 2023 01:25:53 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id d15-20020a5d6dcf000000b002c3f9404c45sm12906865wrz.7.2023.02.14.01.25.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Feb 2023 01:25:53 -0800 (PST)
Message-ID: <a48ebe98-82b5-8f7b-8327-4e60bdb231c8@linaro.org>
Date: Tue, 14 Feb 2023 10:25:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH v2 00/24] cpu,sched: Mark arch_cpu_idle_dead() __noreturn
Content-Language: en-US
To: Josh Poimboeuf <jpoimboe@kernel.org>, linux-kernel@vger.kernel.org
References: <cover.1676358308.git.jpoimboe@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <cover.1676358308.git.jpoimboe@kernel.org>
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
> v2:
> - make arch_call_rest_init() and rest_init() __noreturn
> - make objtool 'global_returns' work for weak functions
> - rebase on tip/objtool/core with dependencies merged in (mingo)
> - add acks
> 
> v1.1:
> - add __noreturn to all arch_cpu_idle_dead() implementations (mpe)

Possible similar candidates: panic_smp_self_stop, nmi_panic_self_stop
and kexec.

