Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B10C66186AE
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 18:54:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N3BGV4HlDz3cck
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Nov 2022 04:54:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=gjqnoLy1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::52b; helo=mail-pg1-x52b.google.com; envelope-from=seanjc@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=gjqnoLy1;
	dkim-atps=neutral
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N3BFb71sVz2xH6
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Nov 2022 04:53:38 +1100 (AEDT)
Received: by mail-pg1-x52b.google.com with SMTP id e129so2307697pgc.9
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 03 Nov 2022 10:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3tXwq1v6tJCedr2VtV8ELYd8BpIXTKwmGjuY8weIxs8=;
        b=gjqnoLy192oz/Zxvag+BlBreQGGSfkeJOmpmCEx7rtJpm2GzAgZsoDzOerCZhLAwiY
         s4s7ScvfoZl8zwg6HI1Ymb7QpOkn2NxzwKs5NTcMl1wbeFQ/hmv3VmCXwSollG4iohk8
         ZfCLF4UOQot0TZFoB2ZSgy0wzT2PFfm47J97NCOCE8O1C25eIzJzc1jTDAryWTakKtb6
         +QR4ykcFsYtONZVST62uH0g9I4NSfzwB8k/a9JLQz8I+tNs7JhVckzNuFRTBv1+mgFsk
         IdkM799qrsruF4xx+MeYDtb4Sd8Y4cxbHh++70LJo94wIuv8aLLKYeYlUVyl7mOC3bBK
         Ww4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3tXwq1v6tJCedr2VtV8ELYd8BpIXTKwmGjuY8weIxs8=;
        b=MbwAtlzfQktMk/VHx7v/544jnH5Zg+prDVpxEfvYYLIbm97WgKBlMq4ohrYC9JU1l2
         XADz42wNgxu9KePOgiHx01PALRJvdtc+Vqd9muE6nj/Iy+Q4weL2VrKAsNUG9dDQ6/he
         sjO3l2B0E59BOycqN/7N48GqCCJCOTlx44SBhpUysp00kLrn8dZkfwg3MP6eXAWLyFh4
         CgfShdFA+i5wL1i3Mk7d6dOLWgzr/R1RpH2rVYtU/PJpetLpXKOWQg2sXn9wwT0CyheY
         hSgerXOnCQJY7fnkkfgicRGIvMxVrO2JDEu+AwXGEQMoCtin+h+pmdh+W6YEB9Ly/b1p
         LUCg==
X-Gm-Message-State: ACrzQf2tSz2jwwKCMpFjk3/dRg/PqxyWrGPxKSaatnzEmyWgoeWCSyL+
	eiOfj9QeGuJNKjtvgs7jm+01sQ==
X-Google-Smtp-Source: AMsMyM5pSkjZTiut6RFho0StQnuo7qAiklz26C63x768BJpOt4UV7sKT8fcspUYyR/B7P1xdFXKPhA==
X-Received: by 2002:a05:6a00:999:b0:56c:3d0d:96fe with SMTP id u25-20020a056a00099900b0056c3d0d96femr31657100pfg.12.1667498015565;
        Thu, 03 Nov 2022 10:53:35 -0700 (PDT)
Received: from google.com (7.104.168.34.bc.googleusercontent.com. [34.168.104.7])
        by smtp.gmail.com with ESMTPSA id e20-20020a63e014000000b0045ff216a0casm1080329pgh.3.2022.11.03.10.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 10:53:35 -0700 (PDT)
Date: Thu, 3 Nov 2022 17:53:31 +0000
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 39/44] KVM: Drop kvm_count_lock and instead protect
 kvm_usage_count with kvm_lock
Message-ID: <Y2QAG0wCPNv7atC/@google.com>
References: <20221102231911.3107438-1-seanjc@google.com>
 <20221102231911.3107438-40-seanjc@google.com>
 <7b6ce80e-7f1f-11cd-8bde-8d8fa9fd7e1d@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7b6ce80e-7f1f-11cd-8bde-8d8fa9fd7e1d@redhat.com>
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
 linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, Palmer Dabbelt <palmer@dabbelt.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, Vitaly Kuznetsov <vkuznets@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Nov 03, 2022, Paolo Bonzini wrote:
> On 11/3/22 00:19, Sean Christopherson wrote:
> > +- kvm_lock is taken outside kvm->mmu_lock
> 
> Not surprising since one is a mutex and one is an rwlock. :)

Heh, 

  Signed-off-by: Captain Obvious <seanjc@google.com>

> You can drop this hunk as well as the "Opportunistically update KVM's locking
> documentation" sentence in the commit message.

Will do.

> >   - vcpu->mutex is taken outside kvm->arch.hyperv.hv_lock
> >   - kvm->arch.mmu_lock is an rwlock.  kvm->arch.tdp_mmu_pages_lock and
> > @@ -216,15 +220,11 @@ time it will be set using the Dirty tracking mechanism described above.
> >   :Type:		mutex
> >   :Arch:		any
> >   :Protects:	- vm_list
> > -
> > -``kvm_count_lock``
> > -^^^^^^^^^^^^^^^^^^
> > -
> > -:Type:		raw_spinlock_t
> > -:Arch:		any
> > -:Protects:	- hardware virtualization enable/disable
> > -:Comment:	'raw' because hardware enabling/disabling must be atomic /wrt
> > -		migration.
> > +		- kvm_usage_count
> > +		- hardware virtualization enable/disable
> > +		- module probing (x86 only)
> 
> What do you mean exactly by "module probing"?  Is it anything else than what
> is serialized by vendor_module_lock?

Ooh, I forgot to update this patch after switching to vendor_module_lock.  I
added the above after fixing the first deadlock between kvm_lock and cpu_hotplug_lock,
but later gave up on trying to use kvm_lock after deadlock #2, which is when I
when I realized piggybacking kvm_lock was going to be a maintainance nightmare due.
