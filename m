Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A931464369F
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Dec 2022 22:13:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NQx9X4CGvz3bgP
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Dec 2022 08:13:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Ujio/I//;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com; envelope-from=seanjc@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Ujio/I//;
	dkim-atps=neutral
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NQx8Z5VRwz2xbC
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Dec 2022 08:12:45 +1100 (AEDT)
Received: by mail-pf1-x42a.google.com with SMTP id n3so8376899pfq.10
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Dec 2022 13:12:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9BS9+Fk77r2sqEaU7XwhOF5T7uvKSgLeTZbiEXUGcMo=;
        b=Ujio/I//LxFB/K3sVL9gmNsGJ2wTNbSjKjPUCByX11FEgdEzOgOqiXg/gRqfeGF7s+
         BRBVYIHZsjiCW+mopZZqJtOFx8R72OQ+lxd1rMhvvBVaCHky62qMT42W7ann/KH4QVEi
         7RDo5VhBRC8pzm08UnWL1v8bR/cRgCAMAHzAeJOZ77ZAJGj5jTiVT2fPdcmD7+sDDe5A
         MCK85CoektbMIOfXCT03EXGqxDh77jznAXbuGFlYRgsEHGnbyTN0uldNNg+81eLCMpdy
         485zxEh+YV7agkZEO9zh/Zlc6/uD1mmvMxm2NZPEwpELq6RwwxuABQO2pRIN5lh3pL9X
         0pWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9BS9+Fk77r2sqEaU7XwhOF5T7uvKSgLeTZbiEXUGcMo=;
        b=l0oIiww/69zJnSj2lUvTlv8s1c2VyP7ysNXjV0K6caa5K+TdFBAVQkkxHjAdssaEOL
         lpXo/NYZBN+jxaueEYnz+kjBDQgWLyDgtSu3kafAEMSRJLnP7ThB6/ybhlKQ0HQHfbtP
         JDZO2K0rUdj6pV3OTSs+1dtGNMndDSmOdIxsBCWHY5cnzrF/TXAjmBJ+XGHdYqdVsFnL
         YqUEcprxqy/qL2gc0DOaySS/kEeVjiBDbTnBi9hQnElvMRqP8tdvvzdgN65qCOheihiZ
         1teuEcEHvygONe9zPaeCSxCEbnOPXOe6Zzu0fVKYWbIZSuZmwPCJUtApEmcJ6OmQsOk/
         toMQ==
X-Gm-Message-State: ANoB5pm1XWEjwgpR0dwnAU5Mz+kQnp07SvqtZORqIQ6LtI/tyYvoVi+i
	6X7F+5tDDon7+PEaRr91Ep+nFw==
X-Google-Smtp-Source: AA0mqf7NtaiQFi9maqoCvGoM6sFH0HgJLUnKLXrzCG7pSHOZoyGtCDF0ZU4oxE1QMNHHmHHaqhNDEw==
X-Received: by 2002:aa7:91d6:0:b0:574:c543:f804 with SMTP id z22-20020aa791d6000000b00574c543f804mr49454104pfa.51.1670274763510;
        Mon, 05 Dec 2022 13:12:43 -0800 (PST)
Received: from google.com (7.104.168.34.bc.googleusercontent.com. [34.168.104.7])
        by smtp.gmail.com with ESMTPSA id nn6-20020a17090b38c600b00219f8eb271fsm131413pjb.5.2022.12.05.13.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 13:12:43 -0800 (PST)
Date: Mon, 5 Dec 2022 21:12:39 +0000
From: Sean Christopherson <seanjc@google.com>
To: Isaku Yamahata <isaku.yamahata@gmail.com>
Subject: Re: [PATCH v2 31/50] KVM: x86: Do CPU compatibility checks in x86
 code
Message-ID: <Y45ex/CyTY7jYa5D@google.com>
References: <20221130230934.1014142-1-seanjc@google.com>
 <20221130230934.1014142-32-seanjc@google.com>
 <20221205205246.GA3630770@ls.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221205205246.GA3630770@ls.amr.corp.intel.com>
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
Cc: Matthew Rosato <mjrosato@linux.ibm.com>, Paul Durrant <paul@xen.org>, Yuan Yao <yuan.yao@intel.com>, Paul Walmsley <paul.walmsley@sifive.com>, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, Kai Huang <kai.huang@intel.com>, linux-riscv@lists.infradead.org, Claudio Imbrenda <imbrenda@linux.ibm.com>, kvmarm@lists.cs.columbia.edu, linux-s390@vger.kernel.org, Janosch Frank <frankja@linux.ibm.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, James Morse <james.morse@arm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Chao Gao <chao.gao@intel.com>, Eric Farman <farman@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org, Atish Patra <atishp@atishpatra.org>, kvmarm@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, Alexandru Elisei <alexandru.elisei@arm.com>, linux-arm-kernel@lists.infradead.org, Isaku Yamahata <isak
 u.yamahata@intel.com>, Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>, Fabiano Rosas <farosas@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Cornelia Huck <cohuck@redhat.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, Palmer Dabbelt <palmer@dabbelt.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, David Woodhouse <dwmw2@infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Dec 05, 2022, Isaku Yamahata wrote:
> On Wed, Nov 30, 2022 at 11:09:15PM +0000,
> > index 66f16458aa97..3571bc968cf8 100644
> > --- a/arch/x86/kvm/x86.c
> > +++ b/arch/x86/kvm/x86.c
> > @@ -9277,10 +9277,36 @@ static inline void kvm_ops_update(struct kvm_x86_init_ops *ops)
> >  	kvm_pmu_ops_update(ops->pmu_ops);
> >  }
> >  
> > +struct kvm_cpu_compat_check {
> > +	struct kvm_x86_init_ops *ops;
> > +	int *ret;
> 
> minor nitpick: just int ret. I don't see the necessity of the pointer.
> Anyway overall it looks good to me.

...

> > @@ -9360,6 +9386,14 @@ static int __kvm_x86_vendor_init(struct kvm_x86_init_ops *ops)
> >  	if (r != 0)
> >  		goto out_mmu_exit;
> >  
> > +	c.ret = &r;
> > +	c.ops = ops;
> > +	for_each_online_cpu(cpu) {
> > +		smp_call_function_single(cpu, kvm_x86_check_cpu_compat, &c, 1);
> > +		if (r < 0)
> 
> Here it can be "c.ret < 0".

No, because the below goto leads to "return r", i.e. "c.ret" needs to be propagated
to "r".  That's why the code does the admittedly funky "int *ret" thing.

FWIW, this gets cleanup in the end.  "struct kvm_cpu_compat_check" goes away and
"&r" is passed directly to kvm_x86_check_cpu_compat.

> > +			goto out_hardware_unsetup;
