Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E34D618A2B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 22:05:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N3GVN3xyhz3cS4
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Nov 2022 08:05:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=W1jfdVvC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102b; helo=mail-pj1-x102b.google.com; envelope-from=isaku.yamahata@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=W1jfdVvC;
	dkim-atps=neutral
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N3GTQ2Ywqz2xf6
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Nov 2022 08:04:08 +1100 (AEDT)
Received: by mail-pj1-x102b.google.com with SMTP id gw22so2822613pjb.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 03 Nov 2022 14:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RKpWMQos6VVD1S/I4lACLsmO/tYS5LRA7d2ENkEKbRo=;
        b=W1jfdVvCiC74H1TrCZBHpy39zmLx6ZdDw7CTvEA3hQRy2SYEYEHpqHKEqbYIPLurIe
         Y2whGNqDI5mui4w+1QXrkHh+GC9ATmNd8ps8PeHw3qaJpwgt1d7jvMCXqs25Zy8Lpx4o
         BRkdqU5nSWSpkaBgaA/lV+5CSWVpabSirQHa1cejuentrhT/uERBbBImlSMJgf6A967J
         fjOlpx3kn0dIaEHhhAKeVdXj4/EkPaL2dmbdM+AJdzuPv1TA2eEp2KkYLi7TVhEuAixL
         VUk9wO+wTZMMnlMLn0pWY/lQ/5O1/2ysb54mA9Nupm245dVRVUlabq2dQWglwCNzBaAj
         yq6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RKpWMQos6VVD1S/I4lACLsmO/tYS5LRA7d2ENkEKbRo=;
        b=PcchRfySakIJLE2oZogLU6CP8QINpCa9p18/UIuvtDedaPRBYR5bOcHUdSdu5/u0rv
         5GLP16DQFVoyECCGRiMWQ0/FNCzI9U4TsFtEolUurm9mWMkhH2Sk6/FmFu9Sqe+5+RX1
         j6tYaZSVYXDmW5qzDqg18+euJPCov6QOjKT0MV0b10QqyORAL2UbZ11nUZUzfE2I6w9C
         8bKZSsfpkk2cQKWWqEdMCIhPt/3Z9TNjZqfK/Qfuk9ZQe/pVoGjBIAt6K6LqpnNlWH96
         iUGcsOvhyiX7F8jlib+nQQZdKnUEH9YOB1NcRZfTW1HhSzacht4rwyJYE5eetW8RWF74
         mHxA==
X-Gm-Message-State: ACrzQf05SWOxWIMAw6ZI3Zq/2I9y7TenWyZc2GRCVJWLtgwP0dwF+Bvg
	cpHIPqsnoUDG87fsv2nHkmU=
X-Google-Smtp-Source: AMsMyM4B7LXLMUo1WLny520SMeR1sIUEIak6LqJqMDk6N+6eScsWNFNrZpvHK/6RhT2SJsSNsCUIWw==
X-Received: by 2002:a17:902:e5c5:b0:186:5f09:8468 with SMTP id u5-20020a170902e5c500b001865f098468mr32699741plf.122.1667509444114;
        Thu, 03 Nov 2022 14:04:04 -0700 (PDT)
Received: from localhost ([192.55.54.55])
        by smtp.gmail.com with ESMTPSA id 27-20020a63125b000000b0046a1c832e9fsm1137383pgs.34.2022.11.03.14.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 14:04:03 -0700 (PDT)
Date: Thu, 3 Nov 2022 14:04:02 -0700
From: Isaku Yamahata <isaku.yamahata@gmail.com>
To: Sean Christopherson <seanjc@google.com>
Subject: Re: [PATCH 36/44] KVM: x86: Do compatibility checks when onlining CPU
Message-ID: <20221103210402.GB1063309@ls.amr.corp.intel.com>
References: <20221102231911.3107438-1-seanjc@google.com>
 <20221102231911.3107438-37-seanjc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221102231911.3107438-37-seanjc@google.com>
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
Cc: Matthew Rosato <mjrosato@linux.ibm.com>, David Hildenbrand <david@redhat.com>, Yuan Yao <yuan.yao@intel.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Claudio Imbrenda <imbrenda@linux.ibm.com>, kvmarm@lists.cs.columbia.edu, isaku.yamahata@gmail.com, linux-s390@vger.kernel.org, Janosch Frank <frankja@linux.ibm.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, James Morse <james.morse@arm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Chao Gao <chao.gao@intel.com>, Eric Farman <farman@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org, Atish Patra <atishp@atishpatra.org>, kvmarm@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, Alexandru Elisei <alexandru.elisei@arm.com>, linux-arm-kernel@lists.infradead.org, Isaku Yamahata <isaku.yamahata@intel.com>, Fabiano Rosas
  <farosas@linux.ibm.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, Palmer Dabbelt <palmer@dabbelt.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Nov 02, 2022 at 11:19:03PM +0000,
Sean Christopherson <seanjc@google.com> wrote:

> From: Chao Gao <chao.gao@intel.com>
> 
> Do compatibility checks when enabling hardware to effectively add
> compatibility checks when onlining a CPU.  Abort enabling, i.e. the
> online process, if the (hotplugged) CPU is incompatible with the known
> good setup.
> 
> At init time, KVM does compatibility checks to ensure that all online
> CPUs support hardware virtualization and a common set of features. But
> KVM uses hotplugged CPUs without such compatibility checks. On Intel
> CPUs, this leads to #GP if the hotplugged CPU doesn't support VMX, or
> VM-Entry failure if the hotplugged CPU doesn't support all features
> enabled by KVM.
> 
> Note, this is little more than a NOP on SVM, as SVM already checks for
> full SVM support during hardware enabling.
> 
> Opportunistically add a pr_err() if setup_vmcs_config() fails, and
> tweak all error messages to output which CPU failed.
> 
> Signed-off-by: Chao Gao <chao.gao@intel.com>
> Co-developed-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/x86/include/asm/kvm_host.h |  2 +-
>  arch/x86/kvm/svm/svm.c          | 20 +++++++++++---------
>  arch/x86/kvm/vmx/vmx.c          | 33 +++++++++++++++++++--------------
>  arch/x86/kvm/x86.c              |  5 +++--
>  4 files changed, 34 insertions(+), 26 deletions(-)
> 
> diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
> index f223c845ed6e..c99222b71fcc 100644
> --- a/arch/x86/include/asm/kvm_host.h
> +++ b/arch/x86/include/asm/kvm_host.h
> @@ -1666,7 +1666,7 @@ struct kvm_x86_nested_ops {
>  };
>  
>  struct kvm_x86_init_ops {
> -	int (*check_processor_compatibility)(void);
> +	int (*check_processor_compatibility)(int cpu);

Is this cpu argument used only for error message to include cpu number
with avoiding repeating raw_smp_processor_id() in pr_err()?
The actual check is done on the current executing cpu.

If cpu != raw_smp_processor_id(), cpu is wrong. Although the function is called
in non-preemptive context, it's a bit confusing. So voting to remove it and
to use.

Thanks,
-- 
Isaku Yamahata <isaku.yamahata@gmail.com>
