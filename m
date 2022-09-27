Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2B85EB666
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Sep 2022 02:41:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mc15r2bYGz3bxC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Sep 2022 10:41:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=FTCMFRmQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=isaku.yamahata@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=FTCMFRmQ;
	dkim-atps=neutral
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mc15B1SB9z3bXg
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Sep 2022 10:40:59 +1000 (AEST)
Received: by mail-pl1-x62c.google.com with SMTP id x1so7709588plv.5
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Sep 2022 17:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=8xobog+QYukwZVnSxEr7+7WqxBnwEIa9rhAbHRvLuc0=;
        b=FTCMFRmQQyCukqL2hxWYCxKVenu9ShL50Yamg226yHwQtpyuDdPtGQPzXO/k1rYqWq
         kpc2VrBXq8xqNic4OqxT4fAyTdTUyb81ViwXcqIWHthuzOgp7A33k5MTIpiJ/mMQpPhA
         6eMBZccoaglWqBm+WdqkktjAdyy6SGAn4tCKEmQA3ZjpPfCL0FILKRgWRkoSRGCE4gC+
         7ldMIkIMU4dHHAJ7fORc8bubpbNKM9jjI4OFwNwoWsYZJUI7Zt9UDrxcCoeuS6xfmi1M
         tSOqrp6yZVxQEtcdRZdoPwXBp01Y9N3cE3zt0LabBjPooc0427RdfI08Clap3VSZQnxP
         xOTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=8xobog+QYukwZVnSxEr7+7WqxBnwEIa9rhAbHRvLuc0=;
        b=2V58jlwpucYAY4OGlNO3tDo86AOriaG/g/dCk/gBbZ5lBWmXyUlVyMWxmWMksVf3yL
         CL2K3oCboReoXZx2yBeqVQ4tcLhDAdzhi5b115miXcIcvRToXnC2F3m1Atoaq8uzFkuq
         LKRYDSTHjw7hmiuViqAGYv1P9OOYcbrkmFt2C1bS4YoNiAFCPCjhksWyb6fbdccNT6kC
         +gcsys7C7jtZqVQUZ+RxQlrF5MxQNAgWMAumwqo79DgoWhEN6q5LTl9SZTPZgSk8dkox
         rGUe7jDPASwDkQRkT7U4OKXzL3Mb508Eaq2icVCJed6b+HmjR1Hah17Nr2VNgx9HirBm
         cu2g==
X-Gm-Message-State: ACrzQf0CoceaRCKTph1X+cU/Rcr1Yye3LYyXnGpFV9sBbhs4LUY8hs1W
	/EHYlpMVGnvdQewwX3KoTKI=
X-Google-Smtp-Source: AMsMyM5ncLCON7H69CwN1h2mFJChlFCT/tOjvv+vDzOyTbAYe4LWup3DROUOLB0qK9ZqLDTMs+Q+/w==
X-Received: by 2002:a17:902:7e42:b0:178:489:86ac with SMTP id a2-20020a1709027e4200b00178048986acmr24950551pln.68.1664239256857;
        Mon, 26 Sep 2022 17:40:56 -0700 (PDT)
Received: from localhost ([192.55.54.55])
        by smtp.gmail.com with ESMTPSA id d14-20020a17090a3b0e00b002009db534d1sm68572pjc.24.2022.09.26.17.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Sep 2022 17:40:56 -0700 (PDT)
Date: Mon, 26 Sep 2022 17:40:54 -0700
From: Isaku Yamahata <isaku.yamahata@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v5 27/30] RFC: KVM: powerpc: Move processor compatibility
 check to hardware setup
Message-ID: <20220927004054.GA1508394@ls.amr.corp.intel.com>
References: <cover.1663869838.git.isaku.yamahata@intel.com>
 <574ca90fdaec0f37c197d9600d47d48a74f324bd.1663869838.git.isaku.yamahata@intel.com>
 <8735ci1sri.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8735ci1sri.fsf@mpe.ellerman.id.au>
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
Cc: isaku.yamahata@intel.com, Huang Ying <ying.huang@intel.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, kvm@vger.kernel.org, Fabiano Rosas <farosas@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, Shaokun Zhang <zhangshaokun@hisilicon.com>, linuxppc-dev@lists.ozlabs.org, Kai Huang <kai.huang@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, Marc Zyngier <maz@kernel.org>, Borislav Petkov <bp@alien8.de>, Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Huacai Chen <chenhuacai@kernel.org>, Will Deacon <will@kernel.org>, isaku.yamahata@gmail.com, Chao Gao <chao.gao@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Sep 23, 2022 at 04:58:41PM +1000,
Michael Ellerman <mpe@ellerman.id.au> wrote:

> isaku.yamahata@intel.com writes:
> > From: Isaku Yamahata <isaku.yamahata@intel.com>
> >
> > Move processor compatibility check from kvm_arch_processor_compat() into
>                                           ^ 
>                                           kvm_arch_check_processor_compat()
> 
> > kvm_arch_hardware_setup().  The check does model name comparison with a
> > global variable, cur_cpu_spec.  There is no point to check it at run time
> > on all processors.
> 
> A key detail I had to look up is that both kvm_arch_hardware_setup() and
> kvm_arch_check_processor_compat() are called from kvm_init(), one after
> the other. But the latter is called on each CPU.
> 
> And because the powerpc implementation of kvm_arch_check_processor_compat()
> just checks a global, there's no need to call it on every CPU.
> 
> > kvmppc_core_check_processor_compat() checks the global variable.  There are
> > five implementation for it as follows.
> 
> There are three implementations not five.

Thanks. I'll update the commit message.

> >   arch/powerpc/include/asm/cputable.h: extern struct cpu_spec *cur_cpu_spec;
> >   arch/powerpc/kvm/book3s.c: return 0
> >   arch/powerpc/kvm/e500.c: strcmp(cur_cpu_spec->cpu_name, "e500v2")
> >   arch/powerpc/kvm/e500mc.c: strcmp(cur_cpu_spec->cpu_name, "e500mc")
> >                              strcmp(cur_cpu_spec->cpu_name, "e5500")
> >                              strcmp(cur_cpu_spec->cpu_name, "e6500")
> >
> > Suggested-by: Sean Christopherson <seanjc@google.com>
> > Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
> > Cc: linuxppc-dev@lists.ozlabs.org
> > Cc: Fabiano Rosas <farosas@linux.ibm.com>
> > ---
> >  arch/powerpc/kvm/powerpc.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
> > index 7b56d6ccfdfb..31dc4f231e9d 100644
> > --- a/arch/powerpc/kvm/powerpc.c
> > +++ b/arch/powerpc/kvm/powerpc.c
> > @@ -444,12 +444,12 @@ int kvm_arch_hardware_enable(void)
> >  
> >  int kvm_arch_hardware_setup(void *opaque)
> >  {
> > -	return 0;
> > +	return kvmppc_core_check_processor_compat();
> >  }
> >  
> >  int kvm_arch_check_processor_compat(void)
> >  {
> > -	return kvmppc_core_check_processor_compat();
> > +	return 0;
> >  }
> 
> The actual change seems OK. I gave it a quick test boot and ran some
> VMs, everything seems to work as before.
> 
> Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

Thanks so much for testing. I'll remove RFC.
-- 
Isaku Yamahata <isaku.yamahata@gmail.com>
