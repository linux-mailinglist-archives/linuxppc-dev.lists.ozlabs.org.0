Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E443A46F2C5
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Dec 2021 19:07:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J927k6Bzbz3cNl
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Dec 2021 05:07:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Lhbpmm1U;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::532;
 helo=mail-ed1-x532.google.com; envelope-from=paolo.bonzini@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Lhbpmm1U; dkim-atps=neutral
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J9272438dz304j
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Dec 2021 05:07:08 +1100 (AEDT)
Received: by mail-ed1-x532.google.com with SMTP id e3so22551559edu.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Dec 2021 10:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/BR1/2RGDScqGY9eUb2OeC+8FFb2k7htqUCGVYcL9Ck=;
 b=Lhbpmm1UKqlpxT/ebiO1Bba267s4bE94yh07WOHh4nJeWCnmE8+23Eg5C12Rhgfpsc
 0I4D6URfKKEqBAzSviybZHxAOPOACMyExokRlTYNq44nDkWCuzRtqrXLPqBLh0Q1MX+o
 Jtx1lpBHXhEr3ddLKS6N/SSGxs76Q2vWnWxLnCwJZn1OqNjqHCU0mb7ID9NFK1G/sQ7f
 QnXai4TvqSPLltPU5wh6tLAcP4ybsTybXo1I146LDMPVWG7M5ZooS0wo6QoJtRF//8Lt
 64rO/CTBMU0ZFk+JY57EO2EnzjUHgznePMSl5XKLuc96fG3MU0lOVX14FEeAcqzIaDIb
 CLtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/BR1/2RGDScqGY9eUb2OeC+8FFb2k7htqUCGVYcL9Ck=;
 b=KjF2xhlrvcBbw0DnrOBcwK2a1PNu2uIujne0mp8MUxQKw6IMWKwKxh6MqBmCOdUgIj
 fP+ysFCO58y89tt+YH63FP6su45ioqR6iSQlCaoCGe8c8Wet8i09UgEOPdBz6B+MAtNq
 Ijn5lVLgbQQzfI7DZq76SFLHr70YiHMCe3DdtAZ2FpH8yJwfU8qQ1OnFKwVTcKSi0eiE
 ITTpUWiSqEeTdzz56y/7W6Cz5xY2nqhhMZHOkvQmnAEKtuPpgAqQOXpMa7Y1TSo2hsr8
 d7zg8XLszf2kEgy1Dr4xtIuTGmxnQg5hI5N0l9wI6jeJxDcCn5Ad+o7wjUAYJNSsqppX
 9zMQ==
X-Gm-Message-State: AOAM532ODucSiWO9QBLhZS5s8NRnirYQlWyQ+EGTAd0Lxv6xHUsSTLUR
 GLQ/UtvaQmhov8sLt01ewKE=
X-Google-Smtp-Source: ABdhPJyCcY7SoPv6aHO9XYFGu1O783sL+OxwRl4LzsOaKHe6HzGM6Aj5sR6vgOMnSD+1083Jrn4srQ==
X-Received: by 2002:a05:6402:d05:: with SMTP id
 eb5mr31407913edb.360.1639073154112; 
 Thu, 09 Dec 2021 10:05:54 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id og38sm275399ejc.5.2021.12.09.10.05.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Dec 2021 10:05:52 -0800 (PST)
Message-ID: <048a1ef6-193a-eb82-0433-70c97e1a03e5@redhat.com>
Date: Thu, 9 Dec 2021 19:05:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v5 06/12] KVM: powerpc: Use Makefile.kvm for common files
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, kvm <kvm@vger.kernel.org>
References: <20211121125451.9489-1-dwmw2@infradead.org>
 <20211121125451.9489-7-dwmw2@infradead.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211121125451.9489-7-dwmw2@infradead.org>
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
Cc: Anup Patel <anup.patel@wdc.com>,
 "wanpengli @ tencent . com" <wanpengli@tencent.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Joao Martins <joao.m.martins@oracle.com>, Will Deacon <will@kernel.org>,
 kvmarm@lists.cs.columbia.edu, linux-s390@vger.kernel.org,
 "joro @ 8bytes . org" <joro@8bytes.org>, Huacai Chen <chenhuacai@kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, karahmed@amazon.com,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 butt3rflyh4ck <butterflyhuangxx@gmail.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 "jmattson @ google . com" <jmattson@google.com>,
 "seanjc @ google . com" <seanjc@google.com>,
 "mtosatti @ redhat . com" <mtosatti@redhat.com>, linux-mips@vger.kernel.org,
 James Morse <james.morse@arm.com>, kvm-riscv@lists.infradead.org,
 Marc Zyngier <maz@kernel.org>, "vkuznets @ redhat . com" <vkuznets@redhat.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11/21/21 13:54, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> It's all fairly baroque but in the end, I don't think there's any reason
> for $(KVM)/irqchip.o to have been handled differently, as they all end
> up in $(kvm-y) in the end anyway, regardless of whether they get there
> via $(common-objs-y) and the CPU-specific object lists.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)
> ---
>   arch/powerpc/kvm/Makefile | 6 +-----
>   1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/arch/powerpc/kvm/Makefile b/arch/powerpc/kvm/Makefile
> index 583c14ef596e..245f59118413 100644
> --- a/arch/powerpc/kvm/Makefile
> +++ b/arch/powerpc/kvm/Makefile
> @@ -4,11 +4,8 @@
>   #
>   
>   ccflags-y := -Ivirt/kvm -Iarch/powerpc/kvm
> -KVM := ../../../virt/kvm
>   
> -common-objs-y = $(KVM)/kvm_main.o $(KVM)/eventfd.o $(KVM)/binary_stats.o
> -common-objs-$(CONFIG_KVM_VFIO) += $(KVM)/vfio.o
> -common-objs-$(CONFIG_KVM_MMIO) += $(KVM)/coalesced_mmio.o
> +include $(srctree)/virt/kvm/Makefile.kvm
>   
>   common-objs-y += powerpc.o emulate_loadstore.o
>   obj-$(CONFIG_KVM_EXIT_TIMING) += timing.o
> @@ -125,7 +122,6 @@ kvm-book3s_32-objs := \
>   kvm-objs-$(CONFIG_KVM_BOOK3S_32) := $(kvm-book3s_32-objs)
>   
>   kvm-objs-$(CONFIG_KVM_MPIC) += mpic.o
> -kvm-objs-$(CONFIG_HAVE_KVM_IRQ_ROUTING) += $(KVM)/irqchip.o
>   
>   kvm-objs := $(kvm-objs-m) $(kvm-objs-y)

Same here,

kvm-y += $(kvm-objs-m) $(kvm-objs-y)

would be slightly preferrable IMO.

Paolo
