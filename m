Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 016D861776F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 08:15:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N2w4v0rj4z3cMl
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 18:15:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=H1aAZTt5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com; envelope-from=philmd@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=H1aAZTt5;
	dkim-atps=neutral
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N2w3x6TS1z2xJ7
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Nov 2022 18:14:21 +1100 (AEDT)
Received: by mail-wm1-x334.google.com with SMTP id c3-20020a1c3503000000b003bd21e3dd7aso2688376wma.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 03 Nov 2022 00:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6Pdpi+9UoXFmBx6WS1nIzeC5GAA4ErfSd67Sd5AqWcg=;
        b=H1aAZTt5omn1creuvv0ovxmACFg4pOnVWmYHZn4E4lfgT71L/+bkBqMdS2VJqi5qOj
         YmATL6SnR5o+XQBpr5Zki/b3eg+7a33Y6+MAjm8hsgmFIym9xbyYuh0hkg0prpG2xE5F
         PuLR8pBfv6BBbgXz9sU9CedCiJ2OZly1K4pMrBC8+JOwPT599bO9tsyb8SJGk4MzThPL
         1kCqwm334cbHc7nOfuU0bDlyQDVQIepbwXFRhrNPfzdSZaSvyNIoq33No6jykj/v3m8W
         r8ppiNCB0xs+LOISHZCIqL+1GiXCOzslnZH2Bev57sQnF5H5kmf2+UwyKku2qWO1cQWO
         MoPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6Pdpi+9UoXFmBx6WS1nIzeC5GAA4ErfSd67Sd5AqWcg=;
        b=EBmld7snCmEmnkyLk0Tz55gKauhx4G2q5fYCNeldlf1GeQECCqaSOpUdEgK3k7JThe
         Moq51nRCOLoVNXmwlo8M+OTiqoj4x4bGKyVEfgazTEm2CnGKustWysWa8KaaoYeLPd6e
         5Av6aL6EwrdKjCAW+nqs6aw/DaKL2v88d2AjJW9tUDOvE+zHGTSOo2MByc/otDwyq0MW
         NKhj6OFWVww8kaxIBqp/oDgvAVpt4ASIetbcPaEOT2fq0oLUq6EEYtGiM5c05/Lc4luS
         4CaRGwng7wNgrAEc+1t41nmA4anzplUTVyBrW9U82X+pdPQt6vZ4fYK84pEcx/TDUXeH
         TAaA==
X-Gm-Message-State: ACrzQf31f48RNUakNUWDJBRGXy6rELfp6U25j2dW8gBwBFFeqKXhH4V+
	OmC2GA8GMZGtcFY3LOc6NshmVQ==
X-Google-Smtp-Source: AMsMyM5MQbAO6gubSSNJTg2fBstLeZi84Spz6yMzRnw+j7KRE9PRabE8XztmxDtlM/M+GTvsQ9gWSw==
X-Received: by 2002:a05:600c:5127:b0:3c6:47ff:5d33 with SMTP id o39-20020a05600c512700b003c647ff5d33mr19212651wms.68.1667459657899;
        Thu, 03 Nov 2022 00:14:17 -0700 (PDT)
Received: from [192.168.11.175] (216.red-88-29-181.dynamicip.rima-tde.net. [88.29.181.216])
        by smtp.gmail.com with ESMTPSA id e7-20020a5d5007000000b00236644228besm34910wrt.40.2022.11.03.00.14.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Nov 2022 00:14:17 -0700 (PDT)
Message-ID: <cb935198-e2f3-bc9e-a13c-2fa2bf8ea46b@linaro.org>
Date: Thu, 3 Nov 2022 08:14:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH 22/44] KVM: RISC-V: Do arch init directly in
 riscv_kvm_init()
Content-Language: en-US
To: Sean Christopherson <seanjc@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>
References: <20221102231911.3107438-1-seanjc@google.com>
 <20221102231911.3107438-23-seanjc@google.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221102231911.3107438-23-seanjc@google.com>
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, kvmarm@lists.cs.columbia.edu, linux-s390@vger.kernel.org, Chao Gao <chao.gao@intel.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Yuan Yao <yuan.yao@intel.com>, kvmarm@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, Alexandru Elisei <alexandru.elisei@arm.com>, linux-arm-kernel@lists.infradead.org, Isaku Yamahata <isaku.yamahata@intel.com>, Fabiano Rosas <farosas@linux.ibm.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, kvm-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/11/22 00:18, Sean Christopherson wrote:
> Fold the guts of kvm_arch_init() into riscv_kvm_init() instead of
> bouncing through kvm_init()=>kvm_arch_init().  Functionally, this is a
> glorified nop as invoking kvm_arch_init() is the very first action
> performed by kvm_init().
> 
> Moving setup to riscv_kvm_init(), which is tagged __init, will allow
> tagging more functions and data with __init and __ro_after_init.  And
> emptying kvm_arch_init() will allow dropping the hook entirely once all
> architecture implementations are nops.
> 
> No functional change intended.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>   arch/riscv/kvm/main.c | 18 +++++++++---------
>   1 file changed, 9 insertions(+), 9 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

