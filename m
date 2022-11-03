Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 952DA617786
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 08:21:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N2wCd3VYhz3cMK
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 18:21:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=eMrmoHws;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com; envelope-from=philmd@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=eMrmoHws;
	dkim-atps=neutral
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N2wBg5tv9z2xCj
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Nov 2022 18:20:11 +1100 (AEDT)
Received: by mail-wr1-x42d.google.com with SMTP id v1so1273476wrt.11
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 03 Nov 2022 00:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yWamQQEiXwuUaXnbl6PlP555HrcaEY3+l7Gw0jB534c=;
        b=eMrmoHwsidAITYv+vZDTWUffj0xdVr6f9Irj4fYthgmDb2BtaKGEsFELQu2H6bnkWP
         kvYw40kYqV8j7+KID6Jv8TSwG2Jdrk3L2i6NZZnW1qKtWYQv3oDxv2zGF+cGC9qJEynl
         Q3HGYurZ4Dh8OnDMCMVGhftsWYYclQysAxS0McddFHROl75oHtCo1tssLi3inAUUaVcx
         fUR6nDRn+ryNrHgMilhwWNuUUGNT/fA+7xVLj81AQOwbU9CL+I5tsAtyXoOgw2iEFCeq
         61/G+FvjBXJZUKkwTCZRxbrU1QIQmLSBOvOReMSizUzMvu13QKzBhMJ0mgPECH0jRV1d
         jpMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yWamQQEiXwuUaXnbl6PlP555HrcaEY3+l7Gw0jB534c=;
        b=5u4FvMlMlNfCKydd8pk+Au01PzZqlb3cBSWDiToToTaSwtklLdzzm7NDrb3o/FDtiY
         clClM6Sr468wzlLw9iv2diQCnsleJRHiQkCIr0miue4bwfhFPP4UUrWV5Na6bTDKrsNl
         dpnc7VM53IeJUxpQmpyfFPkJWfPfBPeKKTim3Pz+qaS5VDEgPxpMi5MBb/2pf6gTDjyA
         1izFVkAHuS57TLAcPJxomzYN0c2BPrY0mpVymFUxF1aTw9Oc0M75ajdz604jU2UFcJ57
         trw+KjpYYSsxgLZBWh6/7g0py8TYm6M5R8IcoI/MThl5DH7c/421vBEDIInDYy0Fl7QK
         /D4A==
X-Gm-Message-State: ACrzQf08l37KVIn5Z+orwRuf2LS6q1aro8mM7gmR4NhQhsaiGDuqbHPN
	e0HdARhy0KJXQKVD7dteyWvRAw==
X-Google-Smtp-Source: AMsMyM6CSjH/RTBpmDd/QhMZZkOx7oc3nNeJrTJLnMoKwCsW0evNR4jvL0bJpuI6uqT433DOly9rxA==
X-Received: by 2002:a5d:5744:0:b0:236:5c21:177f with SMTP id q4-20020a5d5744000000b002365c21177fmr17331121wrw.449.1667460007685;
        Thu, 03 Nov 2022 00:20:07 -0700 (PDT)
Received: from [192.168.11.175] (216.red-88-29-181.dynamicip.rima-tde.net. [88.29.181.216])
        by smtp.gmail.com with ESMTPSA id fc19-20020a05600c525300b003cf57329221sm5884991wmb.14.2022.11.03.00.20.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Nov 2022 00:20:07 -0700 (PDT)
Message-ID: <3a2d1d5e-b105-11ed-413b-4ad2dbba058e@linaro.org>
Date: Thu, 3 Nov 2022 08:20:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH 30/44] KVM: Drop kvm_arch_check_processor_compat() hook
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
 <20221102231911.3107438-31-seanjc@google.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221102231911.3107438-31-seanjc@google.com>
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
> Drop kvm_arch_check_processor_compat() and its support code now that all
> architecture implementations are nops.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>   arch/arm64/kvm/arm.c       |  7 +------
>   arch/mips/kvm/mips.c       |  7 +------
>   arch/powerpc/kvm/book3s.c  |  2 +-
>   arch/powerpc/kvm/e500.c    |  2 +-
>   arch/powerpc/kvm/e500mc.c  |  2 +-
>   arch/powerpc/kvm/powerpc.c |  5 -----
>   arch/riscv/kvm/main.c      |  7 +------
>   arch/s390/kvm/kvm-s390.c   |  7 +------
>   arch/x86/kvm/svm/svm.c     |  4 ++--
>   arch/x86/kvm/vmx/vmx.c     |  4 ++--
>   arch/x86/kvm/x86.c         |  5 -----
>   include/linux/kvm_host.h   |  4 +---
>   virt/kvm/kvm_main.c        | 24 +-----------------------
>   13 files changed, 13 insertions(+), 67 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

