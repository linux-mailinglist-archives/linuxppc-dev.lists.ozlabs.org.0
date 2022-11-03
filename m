Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 892D7617767
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 08:13:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N2w3H2YCGz3cJY
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 18:13:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=EOYmqRt+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com; envelope-from=philmd@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=EOYmqRt+;
	dkim-atps=neutral
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N2w1T6q8Pz3cMw
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Nov 2022 18:12:13 +1100 (AEDT)
Received: by mail-wr1-x429.google.com with SMTP id bs21so1296258wrb.4
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 03 Nov 2022 00:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OBfEswiMsti3OjaKbPQcyAca5te7/jZ5jHcc8SlAT9E=;
        b=EOYmqRt+/NXugZnlIP4em6mI3EQkzvGwpLXhzORTBxBkCP2uHtj6EIHrWTEowCV0gy
         LjLxmy1kx2FmBqwAXMu8s7YUEChDsUQy5qxfdkx40NZii0vXZu9Y5+E9WIQ98im7w2Qz
         aOc+G9yXO8FMp2gmsGVhL5vc6lj4hdeRWLBju/dhOwwfhZrxP6JKghml+WEnDzleKfR2
         xT+vK0HSOhR2frMY/9x+44r4Scku2Y/ouh8iYDp71I/Bsog0PelRVmfpSZ0wxjqL2jqd
         o6DVxRPDxt5z1+9lDTnQ22y8cNKN7oK+0fUhVvCWoxg4QyLcgrLA6TLc/Hs3GkkFsCs4
         skXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OBfEswiMsti3OjaKbPQcyAca5te7/jZ5jHcc8SlAT9E=;
        b=L5uIpU8NIDFDvc8PpS+NoIh1e2om1HUMRp9Gj9/HwPEjiytZYX2vh+vDHw/Y19U7ue
         YNKNdPZwIC31tQrk+9fd106t+1PvUOVJxlaSCqRigeRK2RWzRqfk3N+kOiaXL0VIZvA7
         HZfQaholr6sAq3Egil44qENEPd+/NiVbJhfRACYYzA+eMj0/iWNKqePEx+WOJMVsuWtT
         rQM477qijxL7jvPZuRJYHr4YwJxmWXmPLSEtw4va5djFKC5+uC66lFMdIaofrUoR+tCX
         EK3+gG+95SOx8Db5DBL01CfeB4X49dHdWz8odHBm8zwKwqo6/PUhTmx1eSE0pPSzWujF
         vFCA==
X-Gm-Message-State: ACrzQf1Nu/h6MNEhsc2YI+gqIAYXV9eSj9fCuRtJAHFkKPyniMv4Q2zu
	7508wAA7fCDUV0UmiMPxKy3f8g==
X-Google-Smtp-Source: AMsMyM6cHSUzeR4K9K8x56LNKCrmIwrY3rn7gLNAI0DHx5P8Dkfz8OPY8ArcGxqxO2wWVx+YIs8sgw==
X-Received: by 2002:a5d:644d:0:b0:236:8330:a5bf with SMTP id d13-20020a5d644d000000b002368330a5bfmr17103381wrw.125.1667459529624;
        Thu, 03 Nov 2022 00:12:09 -0700 (PDT)
Received: from [192.168.11.175] (216.red-88-29-181.dynamicip.rima-tde.net. [88.29.181.216])
        by smtp.gmail.com with ESMTPSA id k15-20020adff28f000000b00236740c6e6fsm1599wro.100.2022.11.03.00.12.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Nov 2022 00:12:09 -0700 (PDT)
Message-ID: <9cec1cc6-5050-9fc6-46ec-a8984b8266a8@linaro.org>
Date: Thu, 3 Nov 2022 08:12:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH 21/44] KVM: MIPS: Register die notifier prior to
 kvm_init()
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
 <20221102231911.3107438-22-seanjc@google.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221102231911.3107438-22-seanjc@google.com>
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
> Call kvm_init() only after _all_ setup is complete, as kvm_init() exposes
> /dev/kvm to userspace and thus allows userspace to create VMs (and call
> other ioctls).
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>   arch/mips/kvm/mips.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

