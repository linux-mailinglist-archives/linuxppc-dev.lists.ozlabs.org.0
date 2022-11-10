Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4A162478B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 17:50:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N7SWT1gXsz3f3d
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Nov 2022 03:50:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=OOR4bwRU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::102f; helo=mail-pj1-x102f.google.com; envelope-from=seanjc@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=OOR4bwRU;
	dkim-atps=neutral
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N7SVW2thrz3cLW
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Nov 2022 03:49:38 +1100 (AEDT)
Received: by mail-pj1-x102f.google.com with SMTP id b11so2007201pjp.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Nov 2022 08:49:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rPjVc+C4keVB9JNeySRKdiTbUPe13351AhOJe9TtZf8=;
        b=OOR4bwRUplBbyMMh2BEwu+86VP3qxijSJnezQ7clymoLz9HUcLonm3WyVFc88kB5fY
         O/E+L3vna3lCH6PwuGGALEpEbdqf//FCQPJXnQH0fruVZmuKpiXxpksMlHLNli5FBIVk
         yHcqF3ftlcFWSWpaRO18yKIRlZ4MLKYwLTrjNA/qL4cv528Rj8wkmrotYw4AfXaxmJus
         pcCX78Uh4a0+xqNPkY5yiRwsOaQfBATcwvX2XL8kq2aQkn5xXT0ESqE2s4sWnkM2XUP1
         lN0YUhWFEsDiU77d2rUZObTRDQeLPD96HT9QdyztVtB+kfc9jl7KnKnrsPBskzRSRVH/
         XRTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rPjVc+C4keVB9JNeySRKdiTbUPe13351AhOJe9TtZf8=;
        b=QrfrJjX6M3sV/dpdCiIAVFxNC7BpgLBiTROaNjAPapU1TpNkJD/GYQN5N197sgQCUO
         i7cDhj8nnOwdjssOMj0CvSYTfG7+y/wEgTWQIcmZcCKBeKcJPAjsYG28KespHLh/xLtV
         HBf8qkCTVkzP2hWXALNMBq9qvHo91PXDY6p4m9bIa6QC6CDKHIg6PXDyHjzBfT2Ssi3w
         KLr4VFMZinhD1miTSHsqyJl8Ebnt6PVxnLU8t/NhhM1FcNV7RZ8v+gA95j0nxj3rqEHj
         pwB8mFQTLouvVe6Zfb0nBdQq8ch1P1O1fmLrgYaudY/EyQWhzz6afqYKu4ncloKnSdPP
         nEqw==
X-Gm-Message-State: ACrzQf28J4mY/tKtpbwkQ4e6WIB+7xMkWCdxY8oTGAFCYFel7dDA7ks9
	3kNoZXHqTOOg83sjPdKQT7In0Q==
X-Google-Smtp-Source: AMsMyM7nQN/gdgW0z481CkQ/WjHrrL4d++/kzaSXhuKO9UuGt09a3AowKSZBoBJ0HDICWxNrCbdrGA==
X-Received: by 2002:a17:902:d50c:b0:187:460:bf9c with SMTP id b12-20020a170902d50c00b001870460bf9cmr65545589plg.4.1668098974180;
        Thu, 10 Nov 2022 08:49:34 -0800 (PST)
Received: from google.com (7.104.168.34.bc.googleusercontent.com. [34.168.104.7])
        by smtp.gmail.com with ESMTPSA id c3-20020a17090a020300b00205d85cfb30sm3288107pjc.20.2022.11.10.08.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 08:49:33 -0800 (PST)
Date: Thu, 10 Nov 2022 16:49:29 +0000
From: Sean Christopherson <seanjc@google.com>
To: Robert Hoo <robert.hu@linux.intel.com>
Subject: Re: [PATCH 37/44] KVM: Rename and move CPUHP_AP_KVM_STARTING to
 ONLINE section
Message-ID: <Y20rmaU14rZFFCZI@google.com>
References: <20221102231911.3107438-1-seanjc@google.com>
 <20221102231911.3107438-38-seanjc@google.com>
 <301a8a33a5cbe5b4fd3efe03b05bb8410a46e9f5.camel@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <301a8a33a5cbe5b4fd3efe03b05bb8410a46e9f5.camel@linux.intel.com>
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

On Thu, Nov 10, 2022, Robert Hoo wrote:
> > -static int kvm_starting_cpu(unsigned int cpu)
> > +static int kvm_online_cpu(unsigned int cpu)
> >  {
> > +	int ret = 0;
> > +
> >  	raw_spin_lock(&kvm_count_lock);
> > -	if (kvm_usage_count)
> > +	/*
> > +	 * Abort the CPU online process if hardware virtualization
> > cannot
> > +	 * be enabled. Otherwise running VMs would encounter
> > unrecoverable
> > +	 * errors when scheduled to this CPU.
> > +	 */
> > +	if (kvm_usage_count) {
> > +		WARN_ON_ONCE(atomic_read(&hardware_enable_failed));
> > +
> >  		hardware_enable_nolock(NULL);
> > +		if (atomic_read(&hardware_enable_failed)) {
> > +			atomic_set(&hardware_enable_failed, 0);
> 
> I see other places using this hardware_enable_failed with atomic_inc(),
> should here use atomic_dec() instead of straightly set to 0?

Meh, both options are flawed.  E.g. if hardware_enable_failed was left dangling
(the WARN above), then atomic_dec() won't remedy the problem and KVM will reject
onlining CPUs indefinitely.  Forcing the atomic back to '0' will remedy that
particular issue, but could lead to problems if there are other bugs.

> Though here is embraced by spin_lock, hardware_enable_nolock() can be
> invoked in other places in parallel?

Only because of a KVM bug, which gets fixed in the next patch:

  KVM: Disable CPU hotplug during hardware enabling
