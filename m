Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0B161777E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 08:19:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N2w9S1lvLz3cC0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 18:19:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=jw3d99cv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com; envelope-from=philmd@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=jw3d99cv;
	dkim-atps=neutral
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N2w8X3tVZz2xFx
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Nov 2022 18:18:20 +1100 (AEDT)
Received: by mail-wr1-x430.google.com with SMTP id h9so1367188wrt.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 03 Nov 2022 00:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D/SNnecemsjQs+W90QUlkgsOD/Rjb4+lDkgjOjEDTCQ=;
        b=jw3d99cvMg52Lg1tLW9BuRNFr97hU8VbjiyM8gochZWG1eGvxYgj4JDJfCZnnjS66j
         2lDmaY49Y9gNXV+0NqqYMPompzAvLelDDyxTDyv63Mzv1FpaKJ2B9UYwTxwc6+9E1fj5
         FJhI1fX/X/YYeQJFY71s0y5YmCRlxUG6ujCNUlpLlY/mY+G8+yumC0FbiEGwNFo+LVFU
         bsVfMxNPq9XriX8IesQE+M4MIPqclT9ZI+C/ooGdqt08Ib6SHWOMYVtcjCYmkNt5Y22V
         kEpFY0C9GTT/VRjoVENUsza65QqqGrehKGm4P0CKYdVEVtyKJm9XwB/y8pqmKkigPrlA
         3XhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D/SNnecemsjQs+W90QUlkgsOD/Rjb4+lDkgjOjEDTCQ=;
        b=CJmTcNqOrchTxU2sW1Qv6+GnynWkexHn+g8L1XZzTxQTqK0s0kFVOdKZd2Kmz/hUW7
         J/5QVhoTBP35z9x/23tusx3K0fjfd3fC3OGE76KnXAo5Sjqr/CtBzNsiTgdvkBVNMk8Y
         WE9wzhewh4bx4+v27LHGxFYyLvJgOF9khOwSMuBd0/n0yNSx6q3BmYhcbdxMWRdNQFTj
         jr2u6ZH49Mp161ZVnJOrc2PpAAlXXQMpqfnLCpGJmCfj4UXQH6aEnKvKbNeRB25Cfl9e
         s5rpHkB7lGgDeuUE3I0Y9hByMkqzR995U/VaSO2FFuHk4jsDeGQltlN/J3NUiGN4BzdB
         /XZQ==
X-Gm-Message-State: ACrzQf0lBKJ+zMEMGtPer6tEPLmUMF3ffQdJkchS3AmsdkbXe/ICMshG
	u+2Pw0TuJIf7MVemrqkQxRCeYA==
X-Google-Smtp-Source: AMsMyM6jhYnE/aEjYcHXapzofavAu7pX7ddMD038s2P34j/GAHoNYKyfFysuRe52YUvpGlRBEmTO3A==
X-Received: by 2002:a5d:42c7:0:b0:236:4ddd:3576 with SMTP id t7-20020a5d42c7000000b002364ddd3576mr17938354wrr.289.1667459896483;
        Thu, 03 Nov 2022 00:18:16 -0700 (PDT)
Received: from [192.168.11.175] (216.red-88-29-181.dynamicip.rima-tde.net. [88.29.181.216])
        by smtp.gmail.com with ESMTPSA id j7-20020a05600c190700b003b477532e66sm6341187wmq.2.2022.11.03.00.18.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Nov 2022 00:18:15 -0700 (PDT)
Message-ID: <1da0b1fa-ca20-4370-26b4-9f18ab8ac95d@linaro.org>
Date: Thu, 3 Nov 2022 08:18:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH 27/44] KVM: Drop kvm_arch_{init,exit}() hooks
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
 <20221102231911.3107438-28-seanjc@google.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221102231911.3107438-28-seanjc@google.com>
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
> Drop kvm_arch_init() and kvm_arch_exit() now that all implementations
> are nops.
> 
> No functional change intended.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>   arch/arm64/kvm/arm.c                | 11 -----------
>   arch/mips/kvm/mips.c                | 10 ----------
>   arch/powerpc/include/asm/kvm_host.h |  1 -
>   arch/powerpc/kvm/powerpc.c          |  5 -----
>   arch/riscv/kvm/main.c               |  9 ---------
>   arch/s390/kvm/kvm-s390.c            | 10 ----------
>   arch/x86/kvm/x86.c                  | 10 ----------
>   include/linux/kvm_host.h            |  3 ---
>   virt/kvm/kvm_main.c                 | 19 ++-----------------
>   9 files changed, 2 insertions(+), 76 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

