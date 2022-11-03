Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D10E6617779
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 08:18:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N2w895HNvz3c1n
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 18:18:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=h9I23FTp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com; envelope-from=philmd@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=h9I23FTp;
	dkim-atps=neutral
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N2w6x2Dqjz3cJ2
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Nov 2022 18:16:56 +1100 (AEDT)
Received: by mail-wm1-x335.google.com with SMTP id v124-20020a1cac82000000b003cf7a4ea2caso2670752wme.5
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 03 Nov 2022 00:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hhVVFU4gv+0KPdkJhZ6Bsgp0nMXVzSegBp2GVEhxHuI=;
        b=h9I23FTp6GIOXmio03YkEg/XABkIyK7okfyOacacDCySEptlxLcYcKstMetIpqEjVI
         AJxxtkE/wdXbgKxacBRTI0vKPMD7Lrwttr/WvlHH6ej0kR33MU05lAqiRuHOXS6eYgUi
         5D/WB/7tpxiogfi3huBIVAcoj+aw5jR0iw+raivB9st+zpUrHhjUaefLK8xl1XeXGROT
         jIYtNJVpBXb1lhi22kZeWS2z2s2scGKIObYA8G99yKRsKrD7Waw2HL3AJk86rNi+kcwk
         ldYfFW2HEUS0Ngd3K7BW6C8SpUqOYnm44amyRmlRCLpiKmxp0dOvOZKAUgifFtw1/6bS
         zu8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hhVVFU4gv+0KPdkJhZ6Bsgp0nMXVzSegBp2GVEhxHuI=;
        b=HSDLs8QvIq7LrUNm2P8VtPAY0xBCU+JjOr7qF64l67bz+Dbm+kvYwzfQCYAUOP+QCW
         PFrtpHcJ4Io5i64Amo3pWb7SIIJXgLzqJYbSUsVGySEVMydwiDgHYCEQAPBtfd60SOIE
         2Af+qp3Q9VdjV6hUKGKL7CfPeYeW0t0PeW7tUkAR/shky3It6yMidpcr1NxIU2AfdUHL
         pTObH6DD2IWGNV69/2M4P/yDfo2uVbYytfCYcVjar3205ISLUNxnQqQoXES9crl0o3au
         DT79raaG1htGOS6VzeaHQ7lhWmiF8wgBv7Twp+wbsGpChFX2IDWPKtYG50DDPRy3bu3Q
         D5Uw==
X-Gm-Message-State: ACrzQf336Idq65mKR+Eu05IPdG+qaw6+r2BpPCUBouwKeiNL6jmnT9nT
	Ojl2ooHFsm+hb+YGbR8oIvEPow==
X-Google-Smtp-Source: AMsMyM5U5tWVDdkP8vx2CGlIc4Tyh8xELM0VfMzpr/hFq4D4kTE8+riEzXzUJzEDmk/itTcMkiPp1A==
X-Received: by 2002:a05:600c:22c6:b0:3cf:88bb:3a95 with SMTP id 6-20020a05600c22c600b003cf88bb3a95mr4075812wmg.71.1667459812670;
        Thu, 03 Nov 2022 00:16:52 -0700 (PDT)
Received: from [192.168.11.175] (216.red-88-29-181.dynamicip.rima-tde.net. [88.29.181.216])
        by smtp.gmail.com with ESMTPSA id p22-20020a05600c359600b003c6b9749505sm4601041wmq.30.2022.11.03.00.16.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Nov 2022 00:16:51 -0700 (PDT)
Message-ID: <5aaa19b8-da75-9a3c-634b-d4c26f77943b@linaro.org>
Date: Thu, 3 Nov 2022 08:16:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH 25/44] KVM: s390: Do s390 specific init without bouncing
 through kvm_init()
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
 <20221102231911.3107438-26-seanjc@google.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221102231911.3107438-26-seanjc@google.com>
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
> Move the guts of kvm_arch_init() into a new helper, __kvm_s390_init(),
> and invoke the new helper directly from kvm_s390_init() instead of
> bouncing through kvm_init().  Invoking kvm_arch_init() is the very
> first action performed by kvm_init(), i.e. this is a glorified nop.
> 
> Moving setup to __kvm_s390_init() will allow tagging more functions as
> __init, and emptying kvm_arch_init() will allow dropping the hook
> entirely once all architecture implementations are nops.
> 
> No functional change intended.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>   arch/s390/kvm/kvm-s390.c | 29 +++++++++++++++++++++++++----
>   1 file changed, 25 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

