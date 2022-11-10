Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 237596247C3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 17:59:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N7SkH6gdGz3f3M
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Nov 2022 03:59:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=LnpIznW5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=seanjc@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=LnpIznW5;
	dkim-atps=neutral
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N7SjN6ZHHz2x9J
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Nov 2022 03:59:03 +1100 (AEDT)
Received: by mail-pl1-x632.google.com with SMTP id p21so1875643plr.7
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Nov 2022 08:59:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=++qaNnNL5OJX09F4SmymJbSNGTe4YNGKf8knlNeZLIM=;
        b=LnpIznW50UbJYIR0PEtWeJYNJ+5rH6MIlZozMzFMTwSQvTcP33ucW9c9lQSevvLDXI
         QyB5+yXhMZUDNlkwdSbDFjM7JR9S8ttOodJeLQApsp/g1X2g7iaiRMpztbbtLirGmHXP
         Ok5MPlCZ4tZXNzdoN/5EaAFNU5i/kMEU+Pj6UbsvHwVNko95a9bIdjWXiNhQrkyCMZcF
         1gbXxHeTac5BLcvPalQHTWFwjbFrO0re69/ZDM4/c7ATiGknmYZEnSteDE0eFOsuiUGv
         o02wNWrUZNQBtGle02WgOsPhE6Inb5/XeEtyenAcor9m9bnEppDYL8UdqJt6p1agDB2o
         ED2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=++qaNnNL5OJX09F4SmymJbSNGTe4YNGKf8knlNeZLIM=;
        b=3O/nAwpVIEvIl6obY4p7BgKCBLKYdRhd0e5HjazbiAQSG8Z4bppE4O+v/BXj8xGViL
         te7J0XXU8/FQN6KFZ/dG3Bbig0Dgb56GYRgDbwyz2PoLE6Kl6cRTz0VKjhOrMLxmsciF
         ld9XqTtfPluw9LP+Nhc8gChc22cfwn/QdeUsJMoQBTjTpXbqMIYHWzzapfpfhxljdrji
         2HyapaOvrjcMQcRNzaClci62QJS1xycIfE++gYb+KLo+8Gt0Z7kiMH4A1Ao3LQhHSzCC
         73KSKIY+ojLIyLY7kf0/jBDooyogloDC4TFKsAVb7Er5Jr0YZvyiFUrVZ3J687nHp0RZ
         fmjw==
X-Gm-Message-State: ANoB5pkGc+dSwhBoBOYTLgv7FS5RHW68PXul+ios7i4jtt7q90c7DWrb
	Y1ZJhKFComCfqrJe7LJ5J2+L7A==
X-Google-Smtp-Source: AA0mqf4HLI0425WgRwXjVOczy7lGJ1ZoFRhJMikRvyU6kmBBe6o5W1MVmVmeziJeqm75+QzM+47Lew==
X-Received: by 2002:a17:902:6aca:b0:188:736c:befa with SMTP id i10-20020a1709026aca00b00188736cbefamr1100928plt.8.1668099540938;
        Thu, 10 Nov 2022 08:59:00 -0800 (PST)
Received: from google.com (7.104.168.34.bc.googleusercontent.com. [34.168.104.7])
        by smtp.gmail.com with ESMTPSA id n63-20020a17090a5ac500b00200461cfa99sm3302123pji.11.2022.11.10.08.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 08:59:00 -0800 (PST)
Date: Thu, 10 Nov 2022 16:58:56 +0000
From: Sean Christopherson <seanjc@google.com>
To: "Huang, Kai" <kai.huang@intel.com>
Subject: Re: [PATCH 38/44] KVM: Disable CPU hotplug during hardware enabling
Message-ID: <Y20t0AMNqvtyOwp2@google.com>
References: <20221102231911.3107438-1-seanjc@google.com>
 <20221102231911.3107438-39-seanjc@google.com>
 <88e920944de70e7d69a98f74005b49c59b5aaa3b.camel@intel.com>
 <b198fe971cecd301f0c7c66028cfd71dd7ba7e62.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b198fe971cecd301f0c7c66028cfd71dd7ba7e62.camel@intel.com>
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

On Thu, Nov 10, 2022, Huang, Kai wrote:
> On Thu, 2022-11-10 at 01:33 +0000, Huang, Kai wrote:
> > > @@ -9283,7 +9283,13 @@ static int
> > > kvm_x86_check_processor_compatibility(struct kvm_x86_init_ops *ops)
> > >  	int cpu = smp_processor_id();
> > >  	struct cpuinfo_x86 *c = &cpu_data(cpu);
> > >  
> > > -	WARN_ON(!irqs_disabled());
> > > +	/*
> > > +	 * Compatibility checks are done when loading KVM and when enabling
> > > +	 * hardware, e.g. during CPU hotplug, to ensure all online CPUs are
> > > +	 * compatible, i.e. KVM should never perform a compatibility check
> > > on
> > > +	 * an offline CPU.
> > > +	 */
> > > +	WARN_ON(!irqs_disabled() && cpu_active(cpu));
> > >  
> > 
> > Also, the logic of:
> > 
> > 	!irqs_disabled() && cpu_active(cpu)
> > 
> > is quite weird.
> > 
> > The original "WARN(!irqs_disabled())" is reasonable because in STARTING
> > section
> > the IRQ is indeed disabled.
> > 
> > But this doesn't make sense anymore after we move to ONLINE section, in which
> > IRQ has already been enabled (see start_secondary()).  IIUC the WARN_ON()
> > doesn't get exploded is purely because there's an additional cpu_active(cpu)
> > check.
> > 
> > So, a more reasonable check should be something like:
> > 
> > 	WARN_ON(irqs_disabled() || cpu_active(cpu) || !cpu_online(cpu));
> > 
> > Or we can simply do:
> > 
> > 	WARN_ON(!cpu_online(cpu) || cpu_active(cpu));
> > 
> > (because I don't know whether it's possible IRQ can somehow get disabled in
> > ONLINE section).
> > 
> > Btw above is purely based on code analysis, but I haven't done any test.
> 
> Hmm.. I wasn't thinking thoroughly.  I forgot CPU compatibility check also
> happens on all online cpus when loading KVM.  For this case, IRQ is disabled and
> cpu_active() is true.  For the hotplug case, IRQ is enabled but  cpu_active() is
> false.
> 
> So WARN_ON(!irqs_disabled() && cpu_active(cpu)) looks reasonable.  Sorry for the
> noise.  Just needed some time to connect the comment with the code.

No worries, more than once while working through this code, I've considered setting
up one of those evidence boards from the movies with string and push pins to help
connect all the dots.
