Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65EDF640A40
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Dec 2022 17:08:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NNyXK1QXdz3fNF
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Dec 2022 03:08:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=NpcRjd8P;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::102f; helo=mail-pj1-x102f.google.com; envelope-from=seanjc@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=NpcRjd8P;
	dkim-atps=neutral
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NNyS31wj8z3c6d
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  3 Dec 2022 03:04:18 +1100 (AEDT)
Received: by mail-pj1-x102f.google.com with SMTP id q17-20020a17090aa01100b002194cba32e9so8728178pjp.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Dec 2022 08:04:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b2GsRYGpugbtZSHFD2RurCZ4JW4xZuzTsOfxXrCkfT8=;
        b=NpcRjd8PL93RDmu18EFPPR+cTZLP3kvCDAEAva9wUQzgEtv6dhPvDs1R9Q9+h2mN7N
         H42dGaT+sl8xeMuYK2rfUD+midQutKuG+T3MUl21HeEIW4MolVpdsUIo9SmBbkggNx39
         8eN3yXePSJelVozj19wEaq9z6VDhzvEr0ForIWyEXE5qa5rozQa3WxAYewh7SubIBKmO
         02PPePyseXuLiMMtCMvFiCLdBEv6hZUEsP/WY2KPh2svytXFAqt8tvoUSmd0DdfZmIR5
         sLez1JP4ikgagdRRPh2k9RbfsucGTq+KVdolkDHLvc/Uk58Zr0iw+nxpff3e47GDmBB4
         X4Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b2GsRYGpugbtZSHFD2RurCZ4JW4xZuzTsOfxXrCkfT8=;
        b=0WqvqSrZoIsV15vwpJy7FcUx/6jhfYPP5oDfbqYkAi//tqA+MMvfs70QvCY9/FldEk
         KJACqySagWsHUJAIMWDL3/46+zh92Amtp+BaC2d2On3E8I4dom2qCLgU3EjsXt+hNSTo
         TBY13Huv0sc481C5eZ2CM8WVKGauA0bQHxrp0r7ImD7+1or5g6/WGBZhTBRadbB3Amwh
         hIN6WQ9E+gNpxKW9hO8b6msh4W2MHlOV9r7TUffTe9og8jLahbJYCZ8WFNbTh5J0Y1in
         MpZ9izsUWt1TvGZ0syUGodFwY57c6QUgI4ILWhGPNNsX7i5D0F4GjK9CGm6N+AF8xvq8
         n52w==
X-Gm-Message-State: ANoB5pmKY3zecxsWC8oWJRkb76Ctd1E2zU637r8cqNDGLkmGTjpm4eXH
	immFRx3QWfqSRvpz2Y1SbauBEw==
X-Google-Smtp-Source: AA0mqf7w0TN/IsoZof5JEkNGBQ8Yd2Zjjhh4wCVFAlaPO07IGqPcQWl6OiCMwNp3DG6Q8B9rQJAiYA==
X-Received: by 2002:a17:90a:9a98:b0:219:2f90:4fb3 with SMTP id e24-20020a17090a9a9800b002192f904fb3mr28837193pjp.109.1669997053879;
        Fri, 02 Dec 2022 08:04:13 -0800 (PST)
Received: from google.com (7.104.168.34.bc.googleusercontent.com. [34.168.104.7])
        by smtp.gmail.com with ESMTPSA id q42-20020a17090a1b2d00b00219752c8ea5sm3349337pjq.37.2022.12.02.08.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 08:04:13 -0800 (PST)
Date: Fri, 2 Dec 2022 16:04:09 +0000
From: Sean Christopherson <seanjc@google.com>
To: "Huang, Kai" <kai.huang@intel.com>
Subject: Re: [PATCH v2 40/50] KVM: x86: Do compatibility checks when onlining
 CPU
Message-ID: <Y4oh+XsbifA2BSj9@google.com>
References: <20221130230934.1014142-1-seanjc@google.com>
 <20221130230934.1014142-41-seanjc@google.com>
 <cf755389c21c73e8367d8162cabc83629d3f9a74.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cf755389c21c73e8367d8162cabc83629d3f9a74.camel@intel.com>
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
> > --- a/arch/x86/kvm/x86.c
> > +++ b/arch/x86/kvm/x86.c
> > @@ -11967,6 +11967,11 @@ int kvm_arch_hardware_enable(void)
> >  	bool stable, backwards_tsc = false;
> >  
> >  	kvm_user_return_msr_cpu_online();
> > +
> > +	ret = kvm_x86_check_processor_compatibility();
> > +	if (ret)
> > +		return ret;
> > +
> >  	ret = static_call(kvm_x86_hardware_enable)();
> >  	if (ret != 0)
> >  		return ret;
> 
> Thinking more, AFAICT, kvm_x86_vendor_init() so far still does the compatibility
> check on all online cpus.  Since now kvm_arch_hardware_enable() also does the
> compatibility check, IIUC the compatibility check will be done twice -- one in
> kvm_x86_vendor_init() and one in hardware_enable_all() when creating the first
> VM.
> 
> Do you think it's still worth to do compatibility check in vm_x86_vendor_init()?
> 
> The behaviour difference should be "KVM module fail to load" vs "failing to
> create the first VM" IIUC.  I don't know whether the former is better than the
> better, but it seems duplicated compatibility checking isn't needed?

It's not strictly needed, but I think it's worth keeping.  The duplicate checking
annoys me too, and I considered removing it multiple times when creating this
series.  But, if there is a hardware incompatibility for whatever reason, failing
to load and thus not instantiating /dev/kvm is friendlier to userspace, e.g.
userspace can immediately flag the platform as potentially flaky, whereas
detecting the likely hardware issue when VM creation fails would essentialy require
scraping the kernel logs.
