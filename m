Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2B95B442D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Sep 2022 06:52:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MPgTD0v7Jz3bls
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Sep 2022 14:52:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=oYfb1vg+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=isaku.yamahata@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=oYfb1vg+;
	dkim-atps=neutral
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MPbBk67pXz2ypV
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Sep 2022 11:39:40 +1000 (AEST)
Received: by mail-pl1-x630.google.com with SMTP id d12so3336340plr.6
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Sep 2022 18:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date;
        bh=+HyY6MoZcN0FsKJ3qyqHucj5l+tGou55KVTzAQ3Bdi8=;
        b=oYfb1vg+Kct23PhbzI75hD7wq0paEq8bOjhP7a39L3EHazFeRyHJdcOXIAqxCEsMvA
         8PxFjgViFtOxjlQcHRC3NW7z3rO81TfLCVEbRJk/Kr55PCDZcjoPZkzC4OdpfkbXb7nj
         cQgkdRqQYPWte2dIA8jQUFYWrm/jHWOyrE4kJQexSc0WO2hlU8+11LwohMJNbWhY3Cur
         Vw6KdvjKfOwJPiUYfWJ5p+pOOdQc+zs23J0sodSQCKivoJ4+I0NSxBam9yHej9t/kbVh
         V6AYVCQrdoQUC15Tr58FdCocNJHPkNQf30U6Xxr0b9A1YVvdATGDJ7DaTrbvIVdZxQV6
         /1iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date;
        bh=+HyY6MoZcN0FsKJ3qyqHucj5l+tGou55KVTzAQ3Bdi8=;
        b=zxAu+jMDvn5iZ6wsKHo6Zn4ahwitNmX/Ng/lK6WexHvPZWKx9CoZxRMhsj/N899DH5
         s6ZXhhnCh/R7zKDS64+4i+OklBkXJ529FTvpwl9F0CrJBtDx0ffiG3AUnBnh1A5FND7a
         YuRyP7MLfWTvYwIrQWpgHs1rJr1F+40mCF+7+rlh/QwMn/ypj1gjkFyPaggvtjUoI1KC
         W+QSz/2IVKdgMNqQ93u2rEFM4ZwzkaBba3JfQMOeTOHXZOC21/fjMco6Ru5ZnFJR+D5h
         NTI9+uu0VcBi7AbY3JaheEqsmbSwL4D8cxtRXqBwSQ8UW8Re1hcJfRZuT539fXJXYNnT
         jelA==
X-Gm-Message-State: ACgBeo2HVko1r0ZP4nYsBsvO2r3Mo0IoJb0/pFOqoQE/ej3GtHrY1Hy4
	jFhutXJhfjFHXD0nXogk8tU=
X-Google-Smtp-Source: AA6agR6lRSG1wvLOOC+rgQ59lwfkWh29IBcT8P0r1RooVwxOiv+zbZOqCwoOHzL0TLU/D2WrTFA+2A==
X-Received: by 2002:a17:90a:1f49:b0:202:7a55:558f with SMTP id y9-20020a17090a1f4900b002027a55558fmr8501511pjy.108.1662773977401;
        Fri, 09 Sep 2022 18:39:37 -0700 (PDT)
Received: from localhost ([192.55.55.56])
        by smtp.gmail.com with ESMTPSA id n10-20020a65488a000000b0041a6638b357sm1149185pgs.72.2022.09.09.18.39.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 18:39:36 -0700 (PDT)
Date: Fri, 9 Sep 2022 18:39:35 -0700
From: Isaku Yamahata <isaku.yamahata@gmail.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v4 23/26] RFC: KVM: powerpc: Move processor compatibility
 check to hardware setup
Message-ID: <20220910013935.GA699006@ls.amr.corp.intel.com>
References: <cover.1662679124.git.isaku.yamahata@intel.com>
 <b348201517333f52c570f359e0d94bc9d5afc4f2.1662679124.git.isaku.yamahata@intel.com>
 <ee18616b-e657-7c10-5224-d9b18dbb9ea7@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ee18616b-e657-7c10-5224-d9b18dbb9ea7@csgroup.eu>
X-Mailman-Approved-At: Sat, 10 Sep 2022 14:51:59 +1000
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
Cc: "isaku.yamahata@intel.com" <isaku.yamahata@intel.com>, Huacai Chen <chenhuacai@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Atish Patra <atishp@atishpatra.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, Fabiano Rosas <farosas@linux.ibm.com>, Marc Zyngier <maz@kernel.org>, Huang Ying <ying.huang@intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Qi Liu <liuqi115@huawei.com>, Shaokun Zhang <zhangshaokun@hisilicon.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Kai Huang <kai.huang@intel.com>, Yuan Yao <yuan.yao@linux.intel.com>, Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, John Garry <john.garry@huawei.com>, Will Deacon <will@kernel.org>, "isaku.yamahata@gmail.com" <isaku.yamahata@gmail.com>, Chao Gao <chao.gao@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Sep 09, 2022 at 05:55:14AM +0000,
Christophe Leroy <christophe.leroy@csgroup.eu> wrote:

> 
> 
> Le 09/09/2022 à 01:25, isaku.yamahata@intel.com a écrit :
> > [Vous ne recevez pas souvent de courriers de isaku.yamahata@intel.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> > 
> > From: Isaku Yamahata <isaku.yamahata@intel.com>
> > 
> > Move processor compatibility check from kvm_arch_processor_compat() into
> > kvm_arch_hardware_setup().  The check does model name comparison with a
> > global variable, cur_cpu_spec.  There is no point to check it at run time
> > on all processors.
> > 
> > Suggested-by: Sean Christopherson <seanjc@google.com>
> > Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
> > Cc: linuxppc-dev@lists.ozlabs.org
> > Cc: Fabiano Rosas <farosas@linux.ibm.com>
> > ---
> >   arch/powerpc/kvm/powerpc.c | 13 +++++++++++--
> >   1 file changed, 11 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
> > index 7b56d6ccfdfb..7e3a6659f107 100644
> > --- a/arch/powerpc/kvm/powerpc.c
> > +++ b/arch/powerpc/kvm/powerpc.c
> > @@ -444,12 +444,21 @@ int kvm_arch_hardware_enable(void)
> > 
> >   int kvm_arch_hardware_setup(void *opaque)
> >   {
> > -       return 0;
> > +       /*
> > +        * kvmppc_core_check_processor_compat() checks the global variable.
> > +        * No point to check on all processors or at runtime.
> > +        * arch/powerpc/kvm/book3s.c: return 0
> > +        * arch/powerpc/kvm/e500.c: strcmp(cur_cpu_spec->cpu_name, "e500v2")
> > +        * arch/powerpc/kvm/e500mc.c: strcmp(cur_cpu_spec->cpu_name, "e500mc")
> > +        *                            strcmp(cur_cpu_spec->cpu_name, "e5500")
> > +        *                            strcmp(cur_cpu_spec->cpu_name, "e6500")
> > +        */
> 
> This explanation shouldn't be in the code. The content of other file may 
> change in the future, the files may be renamed or deleted, new files may 
> be added. And there is no added value with that comment.
> 
> That detailed explanation should go in the commit message.

Ok, will move the comment into the commit message.
-- 
Isaku Yamahata <isaku.yamahata@gmail.com>
