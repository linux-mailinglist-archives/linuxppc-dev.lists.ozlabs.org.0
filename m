Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 96DD9619D54
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Nov 2022 17:32:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N3mPM3VGLz3dvk
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Nov 2022 03:32:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=ZvfqWRbm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com; envelope-from=seanjc@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=ZvfqWRbm;
	dkim-atps=neutral
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N3mNQ1ghRz2xKN
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Nov 2022 03:31:33 +1100 (AEDT)
Received: by mail-pf1-x42b.google.com with SMTP id v28so4941555pfi.12
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 04 Nov 2022 09:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tykh0C7NQoqMsiv0FEJ8nDBTc1ar6j/4SljcpXaw+gg=;
        b=ZvfqWRbmiygXbQlvUXzlFPIy6pWgi3NnbKZ9axUfvTwSG1jmeczFdzfmEBk6JPul9u
         KtfoNDPD7+7L7ckLKxE85H3i30VZE1cLcwZqr+9Pmyt/Uvr0gsenysKMrttjRd1DNmYa
         taHLNc4BlGL4LuS+a5zOzje7JmI5lr7pLr83tPoJKPDxZ+8mRqo1TUsZIcKB3+pLirGc
         61VotfoTC994tXlc+pHq0IWsR3SGM7VfiO/hK89Ek0CoqTLSvnWOMLSW6BMMx8STYHyn
         tAWojTUjFC5IOfCMzJ25ZkS53CsxfaYW+If16SDvap+gn/hFvgnPNsAIXJ/ZXr/CVgup
         nXnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tykh0C7NQoqMsiv0FEJ8nDBTc1ar6j/4SljcpXaw+gg=;
        b=E16U5HAKQByDAyNoUpwSmEo+R8Lx0ictQC9A6a3yszXqqB0XQFhNuNSQ66y+UWs+V4
         CX7kN9igjtI/R/CisPDbkaMn8JPIWybnvcxafvH8dPp99PFfa9j5wWjeW68gD9e6ipLl
         l9JeC10EdjkoqtWQYocTvrzFh5J1BFgxKCEsVts61uqSJOoLup39mehZShWx4hoeX0SN
         uOMipdXbJLDmVI/cJikX1XZ9f+51ImNNWnJf3OMaYjAYuQsswi5JWmBZ5IkW3hICe1dR
         U85HgJiJR85h847YhBtsB12PUODgqejqjOnzySWdATvNrlh49lvqGUpEcsCtRbKDY6SA
         OMTw==
X-Gm-Message-State: ACrzQf1il45VOGC9aiW/H3I5cM6r+0/AJSbytNvQ1WRtHOvbjjk2fs8E
	ZRlt9xCDj2/cVAG45/DzaO2IIA==
X-Google-Smtp-Source: AMsMyM4q4CNgN2lQ4PyaYyADoR+QimlVBokrxw9X6LS0+cBweFifUR+XVuuTHXr8UlnLM2zvHk12kA==
X-Received: by 2002:a05:6a00:248e:b0:56e:ad31:b976 with SMTP id c14-20020a056a00248e00b0056ead31b976mr1059125pfv.51.1667579490004;
        Fri, 04 Nov 2022 09:31:30 -0700 (PDT)
Received: from google.com (7.104.168.34.bc.googleusercontent.com. [34.168.104.7])
        by smtp.gmail.com with ESMTPSA id y133-20020a62ce8b000000b00565cbad9616sm2954667pfg.6.2022.11.04.09.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Nov 2022 09:31:29 -0700 (PDT)
Date: Fri, 4 Nov 2022 16:31:25 +0000
From: Sean Christopherson <seanjc@google.com>
To: Yuan Yao <yuan.yao@linux.intel.com>
Subject: Re: [PATCH 08/44] KVM: x86: Move hardware setup/unsetup to init/exit
Message-ID: <Y2U+XT0Sm+a69CaH@google.com>
References: <20221102231911.3107438-1-seanjc@google.com>
 <20221102231911.3107438-9-seanjc@google.com>
 <20221104062223.7kcrbt66mlmqxk7f@yy-desk-7060>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221104062223.7kcrbt66mlmqxk7f@yy-desk-7060>
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
 linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, Palmer Dabbelt <palmer@dabbelt.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Nov 04, 2022, Yuan Yao wrote:
> On Wed, Nov 02, 2022 at 11:18:35PM +0000, Sean Christopherson wrote:
> > To avoid having to unwind various setup, e.g registration of several
> > notifiers, slot in the vendor hardware setup before the registration of
> > said notifiers and callbacks.  Introducing a functional change while
> > moving code is less than ideal, but the alternative is adding a pile of
> > unwinding code, which is much more error prone, e.g. several attempts to
> > move the setup code verbatim all introduced bugs.

...

> > @@ -9325,6 +9343,24 @@ int kvm_arch_init(void *opaque)
> >  		kvm_caps.supported_xcr0 = host_xcr0 & KVM_SUPPORTED_XCR0;
> >  	}
> >
> > +	rdmsrl_safe(MSR_EFER, &host_efer);
> > +
> > +	if (boot_cpu_has(X86_FEATURE_XSAVES))
> > +		rdmsrl(MSR_IA32_XSS, host_xss);
> > +
> > +	kvm_init_pmu_capability();
> > +
> > +	r = ops->hardware_setup();
> > +	if (r != 0)
> > +		goto out_mmu_exit;
> 
> The failure case of ops->hardware_setup() is unwound
> by kvm_arch_exit() before this patch, do we need to
> keep that old behavior ?

As called out in the changelog, the call to ops->hardware_setup() was deliberately
slotted in before the call to kvm_timer_init() so that kvm_arch_init() wouldn't
need to unwind more stuff if harware_setup() fails.

> > +	/*
> > +	 * Point of no return!  DO NOT add error paths below this point unless
> > +	 * absolutely necessary, as most operations from this point forward
> > +	 * require unwinding.
> > +	 */
> > +	kvm_ops_update(ops);
> > +
> >  	kvm_timer_init();
> >
> >  	if (pi_inject_timer == -1)
> > @@ -9336,8 +9372,32 @@ int kvm_arch_init(void *opaque)
> >  		set_hv_tscchange_cb(kvm_hyperv_tsc_notifier);
> >  #endif
> >
> > +	kvm_register_perf_callbacks(ops->handle_intel_pt_intr);
> > +
> > +	if (!kvm_cpu_cap_has(X86_FEATURE_XSAVES))
> > +		kvm_caps.supported_xss = 0;
> > +
> > +#define __kvm_cpu_cap_has(UNUSED_, f) kvm_cpu_cap_has(f)
> > +	cr4_reserved_bits = __cr4_reserved_bits(__kvm_cpu_cap_has, UNUSED_);
> > +#undef __kvm_cpu_cap_has
> > +
> > +	if (kvm_caps.has_tsc_control) {
> > +		/*
> > +		 * Make sure the user can only configure tsc_khz values that
> > +		 * fit into a signed integer.
> > +		 * A min value is not calculated because it will always
> > +		 * be 1 on all machines.
> > +		 */
> > +		u64 max = min(0x7fffffffULL,
> > +			      __scale_tsc(kvm_caps.max_tsc_scaling_ratio, tsc_khz));
> > +		kvm_caps.max_guest_tsc_khz = max;
> > +	}
> > +	kvm_caps.default_tsc_scaling_ratio = 1ULL << kvm_caps.tsc_scaling_ratio_frac_bits;
> > +	kvm_init_msr_list();
> >  	return 0;
> >
> > +out_mmu_exit:
> > +	kvm_mmu_vendor_module_exit();
> >  out_free_percpu:
> >  	free_percpu(user_return_msrs);
> >  out_free_x86_emulator_cache:
