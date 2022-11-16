Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C47862B0E1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Nov 2022 02:57:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NBmPy0Qhtz3cD2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Nov 2022 12:57:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Zkhmtpyv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=seanjc@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Zkhmtpyv;
	dkim-atps=neutral
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NBmP02KJJz2xJN
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Nov 2022 12:56:19 +1100 (AEDT)
Received: by mail-pl1-x629.google.com with SMTP id 4so15139390pli.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Nov 2022 17:56:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KVMI/nFFiiWGPsODZP4uTO9+eDXKExXBhUQy4MPYB78=;
        b=ZkhmtpyvuQjtpiKcSTwV4FQaNI1BndPmVfYwRbI4kyGyIBWLGYAK9adsViZh/yHJ7x
         GuxgtogV7PtxaPytplYxo+Klt0B/2ry2vtbUojn3VI5CZqcW98TXvlxs8G1FSU2NCLPG
         osV9xc1d2y7cg0+wNaz5Nf0N26qzO6pIP5sDWfotE89nSnvse7sYp7t8PQ00S927CjrN
         Mt9iItQr7ceVWaHS8qhCiI1BYymChnkKt5hyJqGOY0FEweE8dtCPm+eSBErPLu7yhTm8
         o9dFADTr9ZdWsubEfckpwD5DI+8OZmAD6JfaYPF77XPfSWF6ATOhEkaqdt7s4F4xOEiQ
         xj8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KVMI/nFFiiWGPsODZP4uTO9+eDXKExXBhUQy4MPYB78=;
        b=fVwUjVvd7D4NJAHMeYCGc24Tlc6q/MYvYDyqKgqICKJlY8FmGWhctd/Ei2itccGJeS
         tqdGw8aPbvHiwa0voc7su/g/LTVgDtL7YY41kbd9pRxYi8HRrP7c3fL3LH32Isvmg48X
         o1QuIEilgrPhnAAfnfX1hVHYMOuFcqtsuxqy6lAJWczQ+zKMBzxsmyNDpE1/5ZMJ3XH3
         XJUMv58+/J49mBC9fWERCIcyNgpa6vbRy0+5uv+/eLGzEgFAsuwU1dUNQFSc/Voc7ppK
         Llo3iSBiNKVeV/Who5akjEwXkKaizYMzFgUfg2kMszT0GCwMJNnQm2QLNlLzjhh+oplO
         bB5g==
X-Gm-Message-State: ANoB5pnRvM7gC80S0nlOEorUqOkArntvKHZvBQGsTVQr7rO2poY4EGfs
	yKCTKRGcaAj5xgquovTZcm3dHA==
X-Google-Smtp-Source: AA0mqf6H0QJ9u7lmf5OzgdM3vacJIFtJ+zbl369j6MJCYNSFKT6kmzTaZY88ji+zMgthkUAHrSJWdg==
X-Received: by 2002:a17:90a:5883:b0:218:f84:3f98 with SMTP id j3-20020a17090a588300b002180f843f98mr1206419pji.238.1668563776878;
        Tue, 15 Nov 2022 17:56:16 -0800 (PST)
Received: from google.com (7.104.168.34.bc.googleusercontent.com. [34.168.104.7])
        by smtp.gmail.com with ESMTPSA id z25-20020aa79499000000b0056ca3569a66sm9483483pfk.129.2022.11.15.17.56.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 17:56:16 -0800 (PST)
Date: Wed, 16 Nov 2022 01:56:12 +0000
From: Sean Christopherson <seanjc@google.com>
To: "Huang, Kai" <kai.huang@intel.com>
Subject: Re: [PATCH 33/44] KVM: x86: Do VMX/SVM support checks directly in
 vendor code
Message-ID: <Y3RDPOerOIf6SwI0@google.com>
References: <20221102231911.3107438-1-seanjc@google.com>
 <20221102231911.3107438-34-seanjc@google.com>
 <95c3cce88560024566f3b4b0061ca7e62a8a4286.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <95c3cce88560024566f3b4b0061ca7e62a8a4286.camel@intel.com>
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
Cc: "mjrosato@linux.ibm.com" <mjrosato@linux.ibm.com>, "david@redhat.com" <david@redhat.com>, "Yao, Yuan" <yuan.yao@intel.com>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "imbrenda@linux.ibm.com" <imbrenda@linux.ibm.com>, "kvmarm@lists.cs.columbia.edu" <kvmarm@lists.cs.columbia.edu>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "frankja@linux.ibm.com" <frankja@linux.ibm.com>, "chenhuacai@kernel.org" <chenhuacai@kernel.org>, "aleksandar.qemu.devel@gmail.com" <aleksandar.qemu.devel@gmail.com>, "james.morse@arm.com" <james.morse@arm.com>, "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, "Gao, Chao" <chao.gao@intel.com>, "farman@linux.ibm.com" <farman@linux.ibm.com>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "kvmarm@lists.linux
 .dev" <kvmarm@lists.linux.dev>, "tglx@linutronix.de" <tglx@linutronix.de>, "alexandru.elisei@arm.com" <alexandru.elisei@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "Yamahata, Isaku" <isaku.yamahata@intel.com>, "atishp@atishpatra.org" <atishp@atishpatra.org>, "farosas@linux.ibm.com" <farosas@linux.ibm.com>, "anup@brainfault.org" <anup@brainfault.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "oliver.upton@linux.dev" <oliver.upton@linux.dev>, "palmer@dabbelt.com" <palmer@dabbelt.com>, "kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>, "maz@kernel.org" <maz@kernel.org>, "pbonzini@redhat.com" <pbonzini@redhat.com>, "vkuznets@redhat.com" <vkuznets@redhat.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Nov 15, 2022, Huang, Kai wrote:
> On Wed, 2022-11-02 at 23:19 +0000, Sean Christopherson wrote:
> > +static bool __init kvm_is_vmx_supported(void)
> > +{
> > +	if (!cpu_has_vmx()) {
> > +		pr_err("CPU doesn't support VMX\n");
> > +		return false;
> > +	}
> > +
> > +	if (!boot_cpu_has(X86_FEATURE_MSR_IA32_FEAT_CTL) ||
> > +	    !boot_cpu_has(X86_FEATURE_VMX)) {
> > +		pr_err("VMX not enabled in MSR_IA32_FEAT_CTL\n");
> > +		return false;
> > +	}
> > +
> > +	return true;
> > +}
> > +
> >  static int __init vmx_check_processor_compat(void)
> >  {
> >  	struct vmcs_config vmcs_conf;
> >  	struct vmx_capability vmx_cap;
> >  
> > -	if (!this_cpu_has(X86_FEATURE_MSR_IA32_FEAT_CTL) ||
> > -	    !this_cpu_has(X86_FEATURE_VMX)) {
> > -		pr_err("VMX is disabled on CPU %d\n", smp_processor_id());
> > +	if (!kvm_is_vmx_supported())
> >  		return -EIO;
> > -	}
> >  
> 
> Looks there's a functional change here -- the old code checks local cpu's
> feature bits but the new code always checks bsp's feature bits.  Should have no
> problem I think, though.

Ouch.  The bad check will defeat the purpose of doing compat checks.  Nice catch!
