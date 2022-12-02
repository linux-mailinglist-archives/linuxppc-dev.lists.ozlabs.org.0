Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 40322640AD7
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Dec 2022 17:32:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NNz4H13bLz3bhD
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Dec 2022 03:32:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=JuBGytq8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::535; helo=mail-pg1-x535.google.com; envelope-from=seanjc@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=JuBGytq8;
	dkim-atps=neutral
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NNz3K4g9Wz2xl6
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  3 Dec 2022 03:31:24 +1100 (AEDT)
Received: by mail-pg1-x535.google.com with SMTP id q1so4765834pgl.11
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Dec 2022 08:31:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RsaZyzKJOuyFVoAfYZw39HCTNem7JcJUeEd5tgG0e8Y=;
        b=JuBGytq8t5tr5SVnzdgiUWfOnnv3YoaxJ/EPOkhREUxf0Lu7Q36UoNdircCDscdJe1
         Ne3pPvJP46804SbaTNQC7CD0nyOf+6DUf7RttT6MnjeqYf2tKeLulPmMzXN6C0vzpI5a
         kmqZ1b2nEnQBpLkucgI+K9CNuj0M6idXU9Z/tpGiUmJvFfSAKZUEJ0tYDDD5QTm1XgZh
         KUg4c1fCmmWL1AfPqQe/Q+7M8gt59bLLwzR5wrgb2mkyqnFKW9rqK8zn1jiKosWg6tGN
         xvGvpF7x1Z6otoY0Ddi4ibaMdJj9vaSCpFDZW9nFUZDm9ecAOG+G1OAJWfl9eXVsVqrU
         2Qew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RsaZyzKJOuyFVoAfYZw39HCTNem7JcJUeEd5tgG0e8Y=;
        b=ta5OiTHlna7yshHghQpTDoGeuVAT52lU/UJzvb/GYyT0cMgnb03D5E8eGk3z+LDdtH
         SU0/h51Q/1mm6cwXR6nwJiMmj9dtYzjv8cFf0dUPI6+WyExF7P2sg3fLDaa2xFC9qpt/
         2dudb+uJITE2Y/wfmRBaDnSX+XUmWxIU11BlbPCm64OyHrLMT6UC/asa7RHpcAxbUsgH
         TW0YxsA0cXSQ948zRq/cYedMH+sAFK1OBzu9BdkNZYNJMog2wub0G6hOo8321WmhUmc1
         ig1spHYJweC7qr2P2H87D+EADOjTMVb/iZiahZJDtz01ZdwojiI+4EuNWToUqM1fddDf
         Ja/w==
X-Gm-Message-State: ANoB5pmhLqwzQUux8ldZj7jdCDxYoIQV8YBgAPB9TYsDPXCVgTyT7rTD
	Wce8LVBn4O104K4ZfHKL8avX+A==
X-Google-Smtp-Source: AA0mqf5YDkgE2z83Sno75+zaFki0bhnK0sTw98u0yDu/SzUnzr69GggIhlhUBJVYlhlyDIQeZ9Y6nA==
X-Received: by 2002:a65:5601:0:b0:43c:4eef:bac7 with SMTP id l1-20020a655601000000b0043c4eefbac7mr46619641pgs.356.1669998682344;
        Fri, 02 Dec 2022 08:31:22 -0800 (PST)
Received: from google.com (7.104.168.34.bc.googleusercontent.com. [34.168.104.7])
        by smtp.gmail.com with ESMTPSA id g204-20020a6252d5000000b005756a67e227sm5438977pfb.90.2022.12.02.08.31.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 08:31:21 -0800 (PST)
Date: Fri, 2 Dec 2022 16:31:18 +0000
From: Sean Christopherson <seanjc@google.com>
To: "Huang, Kai" <kai.huang@intel.com>
Subject: Re: [PATCH v2 42/50] KVM: Disable CPU hotplug during hardware
 enabling/disabling
Message-ID: <Y4ooVrDTkscy68vg@google.com>
References: <20221130230934.1014142-1-seanjc@google.com>
 <20221130230934.1014142-43-seanjc@google.com>
 <8b1053781e859aa95a08c10b0e8a06912a2b42a2.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8b1053781e859aa95a08c10b0e8a06912a2b42a2.camel@intel.com>
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
Cc: "mjrosato@linux.ibm.com" <mjrosato@linux.ibm.com>, "paul@xen.org" <paul@xen.org>, "Yao, Yuan" <yuan.yao@intel.com>, "david@redhat.com" <david@redhat.com>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "atishp@atishpatra.org" <atishp@atishpatra.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "imbrenda@linux.ibm.com" <imbrenda@linux.ibm.com>, "kvmarm@lists.cs.columbia.edu" <kvmarm@lists.cs.columbia.edu>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "frankja@linux.ibm.com" <frankja@linux.ibm.com>, "maz@kernel.org" <maz@kernel.org>, "chenhuacai@kernel.org" <chenhuacai@kernel.org>, "aleksandar.qemu.devel@gmail.com" <aleksandar.qemu.devel@gmail.com>, "james.morse@arm.com" <james.morse@arm.com>, "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, "Gao, Chao" <chao.gao@intel.com>, "farman@linux.ibm.com" <farman@linux.ibm.com>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>, "kvm
 @vger.kernel.org" <kvm@vger.kernel.org>, "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, "tglx@linutronix.de" <tglx@linutronix.de>, "alexandru.elisei@arm.com" <alexandru.elisei@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "Yamahata, Isaku" <isaku.yamahata@intel.com>, "philmd@linaro.org" <philmd@linaro.org>, "farosas@linux.ibm.com" <farosas@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "cohuck@redhat.com" <cohuck@redhat.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "oliver.upton@linux.dev" <oliver.upton@linux.dev>, "palmer@dabbelt.com" <palmer@dabbelt.com>, "kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>, "anup@brainfault.org" <anup@brainfault.org>, "pbonzini@redhat.com" <pbonzini@redhat.com>, "vkuznets@redhat.com" <vkuznets@redhat.com>, "dwmw2@infradead.org" <dwmw2@infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Dec 02, 2022, Huang, Kai wrote:
> On Wed, 2022-11-30 at 23:09 +0000, Sean Christopherson wrote:
> > From: Chao Gao <chao.gao@intel.com>
> > 
> > Disable CPU hotplug when enabling/disabling hardware to prevent the
> > corner case where if the following sequence occurs:
> > 
> >   1. A hotplugged CPU marks itself online in cpu_online_mask
> >   2. The hotplugged CPU enables interrupt before invoking KVM's ONLINE
> >      callback
> >   3  hardware_{en,dis}able_all() is invoked on another CPU
> > 
> > the hotplugged CPU will be included in on_each_cpu() and thus get sent
> > through hardware_{en,dis}able_nolock() before kvm_online_cpu() is called.
> 
> Should we explicitly call out what is the consequence of such case, otherwise
> it's hard to tell whether this truly is an issue?
>
> IIUC, since now the compatibility check has already been moved to
> kvm_arch_hardware_enable(), the consequence is hardware_enable_all() will fail
> if the now online cpu isn't compatible, which will results in failing to create
> the first VM.  This isn't ideal since the incompatible cpu should be rejected to
> go online instead.

Actually, in that specific scenario, KVM should not reject the CPU.  E.g. if KVM
is autoloaded (common with systemd and/or qemu-kvm installed), but not used by
userspace, then KVM is overstepping by rejecting the incompatible CPU since the
user likely cares more about onlining a CPU than they do about KVM.

> > KVM currently fudges around this race by keeping track of which CPUs have
> > done hardware enabling (see commit 1b6c016818a5 "KVM: Keep track of which
> > cpus have virtualization enabled"), but that's an inefficient, convoluted,
> > and hacky solution.

...

> > +	/*
> > +	 * Compatibility checks are done when loading KVM and when enabling
> > +	 * hardware, e.g. during CPU hotplug, to ensure all online CPUs are
> > +	 * compatible, i.e. KVM should never perform a compatibility check on
> > +	 * an offline CPU.
> > +	 */
> > +	WARN_ON(!cpu_online(cpu));
> 
> IMHO this chunk logically should belong to previous patch.  IIUC disabling CPU
> hotplug during hardware_enable_all() doesn't have relationship to this WARN().

Hmm, yeah, I agree.  I'll move it.

> >  static int hardware_enable_all(void)
> >  {
> >  	int r = 0;
> >  
> > +	/*
> > +	 * When onlining a CPU, cpu_online_mask is set before kvm_online_cpu()
> > +	 * is called, and so on_each_cpu() between them includes the CPU that
> > +	 * is being onlined.  As a result, hardware_enable_nolock() may get
> > +	 * invoked before kvm_online_cpu(), which also enables hardware if the
> > +	 * usage count is non-zero.  Disable CPU hotplug to avoid attempting to
> > +	 * enable hardware multiple times.
> 
> It won't enable hardware multiple times, right?  Since hardware_enable_nolock()
> has below check:
> 
>         if (cpumask_test_cpu(cpu, cpus_hardware_enabled))                      
>                 return;                                                        
>                                                                                                                                                    
>         cpumask_set_cpu(cpu, cpus_hardware_enabled);     
> 
> IIUC the only issue is the one that I replied in the changelog.
> 
> Or perhaps I am missing something?

You're not missing anything in terms of code.  What the comment means by "attempting"
in this case is calling hardware_enable_nolock().  As called out in the changelog,
guarding against this race with cpus_hardware_enabled is a hack, i.e. KVM should
not have to rely on a per-CPU flag.

 : KVM currently fudges around this race by keeping track of which CPUs have
 : done hardware enabling (see commit 1b6c016818a5 "KVM: Keep track of which
 : cpus have virtualization enabled"), but that's an inefficient, convoluted,
 : and hacky solution.

I actually considered removing the per-CPU flag, but decided not to because it's
simpler to blast

	on_each_cpu(hardware_disable_nolock, ...)

in kvm_reboot() and if enabling hardware fails on one or more CPUs, and taking a
#UD on VMXOFF in the latter case is really unnecessary, i.e. the flag is nice to
have for other reasons.

That said, after this patch, KVM should be able to WARN in the enable path.  I'll
test that and do a more thorough audit; unless I'm missing something, I'll add a
patch to do:

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index b8c6bfb46066..ee896fa2f196 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -5027,7 +5027,7 @@ static int kvm_usage_count;
 
 static int __hardware_enable_nolock(void)
 {
-       if (__this_cpu_read(hardware_enabled))
+       if (WARN_ON_ONCE(__this_cpu_read(hardware_enabled)))
                return 0;
 
        if (kvm_arch_hardware_enable()) {

