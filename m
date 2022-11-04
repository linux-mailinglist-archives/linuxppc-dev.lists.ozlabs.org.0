Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 77393619257
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Nov 2022 09:03:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N3Y6D2drKz3dtc
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Nov 2022 19:03:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ht881+Jl;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ht881+Jl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ht881+Jl;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ht881+Jl;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N3Y5F1Ndlz30hw
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Nov 2022 19:02:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667548958;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QJu1Z+r/Jj1Q22H/Z28kMZfifRbtSqoNatlqDbaYr8M=;
	b=Ht881+Jlk5g+JMhSSLNDUJyiPl1UFMFDxFF9LzjwLU9xxQgu9oKJvvXsOJj+Pzlzgrs21E
	J6OWFWTWg6jrvcXwWk8vnmUSA/DI3Gv4bwgJ5W2BUCe0SyMptQeSs7A7RaSLTJfhITqF2S
	C16Sm+gvNoncb4hATdNLsdRfOpIH/fg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667548958;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QJu1Z+r/Jj1Q22H/Z28kMZfifRbtSqoNatlqDbaYr8M=;
	b=Ht881+Jlk5g+JMhSSLNDUJyiPl1UFMFDxFF9LzjwLU9xxQgu9oKJvvXsOJj+Pzlzgrs21E
	J6OWFWTWg6jrvcXwWk8vnmUSA/DI3Gv4bwgJ5W2BUCe0SyMptQeSs7A7RaSLTJfhITqF2S
	C16Sm+gvNoncb4hATdNLsdRfOpIH/fg=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-330-WSbdYbquMMq9Zv7XylKdfg-1; Fri, 04 Nov 2022 04:02:37 -0400
X-MC-Unique: WSbdYbquMMq9Zv7XylKdfg-1
Received: by mail-ej1-f72.google.com with SMTP id ga26-20020a1709070c1a00b007ad4a55d6e1so2686441ejc.6
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 04 Nov 2022 01:02:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QJu1Z+r/Jj1Q22H/Z28kMZfifRbtSqoNatlqDbaYr8M=;
        b=8Q8MAj/ypCF3mj2iNYp9ZHzeBK4az8ImIE6hzZEbRO8uT+Hx+EyQ1E0bPZaAxG7DaL
         hK37HYTMqhna1DSVE+Ts64Oqq6Vah07WlT425v/QznTAOHkuwjp3j7s8woS680GF0Utc
         ZshjmgL9YyckccxWQ21LMIZrvzmAuHVgyqRLT+OPImU7jFuY/BttkiJdt/W+cvBig5oJ
         UoeVXTpzb/9T84NAwOZ1cQ1g2iq5jBCCQ4GqkC3mM784iWN4Qf+txsJxlqsV7F9fER0w
         4Xv1kYSLvaCibglSYpJyPr61yDv67En0BAr+IJLQpr8bmVu7NwuNRXWzdRwTOUpaKsMI
         EkbQ==
X-Gm-Message-State: ACrzQf2hA+0Lu94k/rLNd9qIdauI1IFsOet40ipa4Lk+Vb975edqZ4Om
	jxfTpM04UkNpJQwL2FJtvnCWhEn2IvV7aXy7oA/7kdjtRITuDzrEzp59Hsaw+DyfRSMmvRdB+ok
	Jphvd9j5s32k7fb3PpbXNKtaGtw==
X-Received: by 2002:a17:907:1dda:b0:7a6:8ffc:7dc with SMTP id og26-20020a1709071dda00b007a68ffc07dcmr33677003ejc.163.1667548955853;
        Fri, 04 Nov 2022 01:02:35 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5ZNqKb/aQP9ibAQb8G5uHFxFpKasjpH84kkwoGMwJiLbxjg9Lh2wolUrwViafofx0ss1frxA==
X-Received: by 2002:a17:907:1dda:b0:7a6:8ffc:7dc with SMTP id og26-20020a1709071dda00b007a68ffc07dcmr33676971ejc.163.1667548955613;
        Fri, 04 Nov 2022 01:02:35 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:4783:a68:c1ee:15c5? ([2001:b07:6468:f312:4783:a68:c1ee:15c5])
        by smtp.googlemail.com with ESMTPSA id tz14-20020a170907c78e00b0078ddb518a90sm1433630ejc.223.2022.11.04.01.02.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Nov 2022 01:02:34 -0700 (PDT)
Message-ID: <6c71fcca-c17f-5979-e15e-afcf08899064@redhat.com>
Date: Fri, 4 Nov 2022 09:02:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 33/44] KVM: x86: Do VMX/SVM support checks directly in
 vendor code
To: Sean Christopherson <seanjc@google.com>
References: <20221102231911.3107438-1-seanjc@google.com>
 <20221102231911.3107438-34-seanjc@google.com>
 <bfa98587-3b36-3834-a4b9-585a0e0aa56a@redhat.com>
 <Y2QJ2TuyZImbFFvi@google.com>
 <c29e7d40-ddb9-def0-f944-a921a05a4bb2@redhat.com>
 <Y2QPSK1/6esl61wQ@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <Y2QPSK1/6esl61wQ@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: Matthew Rosato <mjrosato@linux.ibm.com>, David Hildenbrand <david@redhat.com>, Yuan Yao <yuan.yao@intel.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Claudio Imbrenda <imbrenda@linux.ibm.com>, kvmarm@lists.cs.columbia.edu, linux-s390@vger.kernel.org, Janosch Frank <frankja@linux.ibm.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, James Morse <james.morse@arm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Chao Gao <chao.gao@intel.com>, Eric Farman <farman@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org, Atish Patra <atishp@atishpatra.org>, kvmarm@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, Alexandru Elisei <alexandru.elisei@arm.com>, linux-arm-kernel@lists.infradead.org, Isaku Yamahata <isaku.yamahata@intel.com>, Fabiano Rosas <farosas@linux.ibm.com>, 
 linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, Palmer Dabbelt <palmer@dabbelt.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, Vitaly Kuznetsov <vkuznets@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11/3/22 19:58, Sean Christopherson wrote:
> 
> diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
> index 3e508f239098..ebe617ab0b37 100644
> --- a/arch/x86/kernel/cpu/common.c
> +++ b/arch/x86/kernel/cpu/common.c
> @@ -191,6 +191,8 @@ static void default_init(struct cpuinfo_x86 *c)
>                          strcpy(c->x86_model_id, "386");
>          }
>   #endif
> +
> +       clear_cpu_cap(c, X86_FEATURE_MSR_IA32_FEAT_CTL);
>   }
>   
>   static const struct cpu_dev default_cpu = {

Not needed I think?  default_init does not call init_ia32_feat_ctl.

> diff --git a/arch/x86/kernel/cpu/cpuid-deps.c b/arch/x86/kernel/cpu/cpuid-deps.c
> index c881bcafba7d..3a7ae67f5a5e 100644
> --- a/arch/x86/kernel/cpu/cpuid-deps.c
> +++ b/arch/x86/kernel/cpu/cpuid-deps.c
> @@ -72,6 +72,8 @@ static const struct cpuid_dep cpuid_deps[] = {
>          { X86_FEATURE_AVX512_FP16,              X86_FEATURE_AVX512BW  },
>          { X86_FEATURE_ENQCMD,                   X86_FEATURE_XSAVES    },
>          { X86_FEATURE_PER_THREAD_MBA,           X86_FEATURE_MBA       },
> +       { X86_FEATURE_VMX,                      X86_FEATURE_MSR_IA32_FEAT_CTL         },
> +       { X86_FEATURE_SGX,                      X86_FEATURE_MSR_IA32_FEAT_CTL         },
>          { X86_FEATURE_SGX_LC,                   X86_FEATURE_SGX       },
>          { X86_FEATURE_SGX1,                     X86_FEATURE_SGX       },
>          { X86_FEATURE_SGX2,                     X86_FEATURE_SGX1      },
> 

Yes, good idea.

Paolo

