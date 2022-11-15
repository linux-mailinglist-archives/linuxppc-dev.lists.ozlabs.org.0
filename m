Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E145562A2B0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Nov 2022 21:21:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NBcz855zZz3cGv
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Nov 2022 07:21:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=QoLsrppx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::52b; helo=mail-pg1-x52b.google.com; envelope-from=seanjc@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=QoLsrppx;
	dkim-atps=neutral
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NBcyC54Kvz3bXR
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Nov 2022 07:21:07 +1100 (AEDT)
Received: by mail-pg1-x52b.google.com with SMTP id b62so14403010pgc.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Nov 2022 12:21:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XxrH205VSL6PuZxNZy5QSHBg1esXqApruwRLQHoD1FQ=;
        b=QoLsrppxCqrrm8Et/yxXiG7qWE0hiOrc+RLWkwKVvGYvEXTURW54Ct7G0aFnW7vDom
         O3WnXZWOxSKhgS+uv00LIKaFYAiY4w1O0HuVw0sHlWnVNkXyDKqsQfpccjPy0o//76Ot
         9HbC7sv+GYjRBhUyAvWsaFUrflZFb6BoKafnLIcIXy0vGyf6tKbOGR6vv68o6WUCslEQ
         BOT4pCgeSJnKExa2xfKvrZGwBZhzuokrCi6o4yMRfhSIGNbmSd/1S94WiYpeZI3RH1jS
         tMxrZXr8PoWD2Hx+ZMuaUIAmz2hZjOEiOFHGi/ELuekxNrIkmFIAeW4IyLdTJL7wajgf
         6FdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XxrH205VSL6PuZxNZy5QSHBg1esXqApruwRLQHoD1FQ=;
        b=4DcYHe8ATAV2sZzPBSQ7Euh8ngxrQpbK/Lul7nXDxGC2z3jC7rvYUNblgfYx8+Pf7/
         DAQEQ5dtwNxku7i9e1HD/azn0HagMJ4MiEl2CM0kuaad03gkMNZr4/NTuzLp036sXg+M
         YftvHc0dMZFtMJFq9zK/PP/X9Gcj+RcbCF0/+XqCbcQ1AI0jPKuTm5WJIvNlwHfGnp8U
         NsccfewuBrtQwEvA/BI+qMO+ke7njzV6tDTT5MhVbe00K8VNJvrx8Kx3h54T7zWATFH/
         ItX3F6by6/NOlrfjwLcrSnIfx0LPlLvzwpnfCKziHjNJMMtuNc7H7+00zoOuZxaVzFv5
         KKDw==
X-Gm-Message-State: ANoB5pnISWLBqFWQVLmAkCGcwFTU43hYuO/zilbo56cE4hXsHH4fPG3Y
	Og3fTm5E9iBjE6LJ0NSmxYArMg==
X-Google-Smtp-Source: AA0mqf7I+HCT8JLUK2SnELicaIfj+5Xh/wdDfnKOa9DuiFN7rhFS7bzZLz9XVMfRQzvW4tmCjZQXQw==
X-Received: by 2002:aa7:9493:0:b0:56b:9ae8:ca05 with SMTP id z19-20020aa79493000000b0056b9ae8ca05mr19812088pfk.59.1668543664233;
        Tue, 15 Nov 2022 12:21:04 -0800 (PST)
Received: from google.com (7.104.168.34.bc.googleusercontent.com. [34.168.104.7])
        by smtp.gmail.com with ESMTPSA id o15-20020a170902d4cf00b001754fa42065sm10448477plg.143.2022.11.15.12.21.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 12:21:03 -0800 (PST)
Date: Tue, 15 Nov 2022 20:21:00 +0000
From: Sean Christopherson <seanjc@google.com>
To: "Huang, Kai" <kai.huang@intel.com>
Subject: Re: [PATCH 38/44] KVM: Disable CPU hotplug during hardware enabling
Message-ID: <Y3P0rAjywL1a7Pme@google.com>
References: <20221102231911.3107438-1-seanjc@google.com>
 <20221102231911.3107438-39-seanjc@google.com>
 <88e920944de70e7d69a98f74005b49c59b5aaa3b.camel@intel.com>
 <b198fe971cecd301f0c7c66028cfd71dd7ba7e62.camel@intel.com>
 <Y3PzhANShVlTXVg1@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y3PzhANShVlTXVg1@google.com>
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
Cc: "mjrosato@linux.ibm.com" <mjrosato@linux.ibm.com>, "david@redhat.com" <david@redhat.com>, "Yao, Yuan" <yuan.yao@intel.com>, "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "imbrenda@linux.ibm.com" <imbrenda@linux.ibm.com>, "kvmarm@lists.cs.columbia.edu" <kvmarm@lists.cs.columbia.edu>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "frankja@linux.ibm.com" <frankja@linux.ibm.com>, "maz@kernel.org" <maz@kernel.org>, "chenhuacai@kernel.org" <chenhuacai@kernel.org>, "aleksandar.qemu.devel@gmail.com" <aleksandar.qemu.devel@gmail.com>, "james.morse@arm.com" <james.morse@arm.com>, "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, "Gao, Chao" <chao.gao@intel.com>, "farman@linux.ibm.com" <farman@linux.ibm.com>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>, "kvm@vger.kernel.org" <kvm@vg
 er.kernel.org>, "atishp@atishpatra.org" <atishp@atishpatra.org>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, "tglx@linutronix.de" <tglx@linutronix.de>, "alexandru.elisei@arm.com" <alexandru.elisei@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "Yamahata, Isaku" <isaku.yamahata@intel.com>, "farosas@linux.ibm.com" <farosas@linux.ibm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "oliver.upton@linux.dev" <oliver.upton@linux.dev>, "palmer@dabbelt.com" <palmer@dabbelt.com>, "kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>, "anup@brainfault.org" <anup@brainfault.org>, "pbonzini@redhat.com" <pbonzini@redhat.com>, "vkuznets@redhat.com" <vkuznets@redhat.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Nov 15, 2022, Sean Christopherson wrote:
> On Thu, Nov 10, 2022, Huang, Kai wrote:
> > On Thu, 2022-11-10 at 01:33 +0000, Huang, Kai wrote:
> > > > @@ -9283,7 +9283,13 @@ static int
> > > > kvm_x86_check_processor_compatibility(struct kvm_x86_init_ops *ops)
> > > >  	int cpu = smp_processor_id();
> > > >  	struct cpuinfo_x86 *c = &cpu_data(cpu);
> > > >  
> > > > -	WARN_ON(!irqs_disabled());
> > > > +	/*
> > > > +	 * Compatibility checks are done when loading KVM and when enabling
> > > > +	 * hardware, e.g. during CPU hotplug, to ensure all online CPUs are
> > > > +	 * compatible, i.e. KVM should never perform a compatibility check
> > > > on
> > > > +	 * an offline CPU.
> > > > +	 */
> > > > +	WARN_ON(!irqs_disabled() && cpu_active(cpu));
> > > >  
> > > 
> > > Also, the logic of:
> > > 
> > > 	!irqs_disabled() && cpu_active(cpu)
> > > 
> > > is quite weird.
> > > 
> > > The original "WARN(!irqs_disabled())" is reasonable because in STARTING
> > > section
> > > the IRQ is indeed disabled.
> > > 
> > > But this doesn't make sense anymore after we move to ONLINE section, in which
> > > IRQ has already been enabled (see start_secondary()).  IIUC the WARN_ON()
> > > doesn't get exploded is purely because there's an additional cpu_active(cpu)
> > > check.
> > > 
> > > So, a more reasonable check should be something like:
> > > 
> > > 	WARN_ON(irqs_disabled() || cpu_active(cpu) || !cpu_online(cpu));
> > > 
> > > Or we can simply do:
> > > 
> > > 	WARN_ON(!cpu_online(cpu) || cpu_active(cpu));
> > > 
> > > (because I don't know whether it's possible IRQ can somehow get disabled in
> > > ONLINE section).
> > > 
> > > Btw above is purely based on code analysis, but I haven't done any test.
> > 
> > Hmm.. I wasn't thinking thoroughly.  I forgot CPU compatibility check also
> > happens on all online cpus when loading KVM.  For this case, IRQ is disabled and
> > cpu_active() is true.  For the hotplug case, IRQ is enabled but  cpu_active() is
> > false.
> 
> Actually, you're right (and wrong).  You're right in that the WARN is flawed.  And
> the reason for that is because you're wrong about the hotplug case.  In this version
> of things, the compatibility checks are routed through hardware enabling, i.e. this
> flow is used only when loading KVM.  This helper should only be called via SMP function
> call, which means that IRQs should always be disabled.

Grr, but not routing through this helper is flawed in that KVM doesn't do the
CR4 checks in the hardware enabling case.  Don't think that changes the WARN, but
other patches in this series need tweaks.
