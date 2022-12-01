Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A477863FAEC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 23:50:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NNWVj4C5tz3bg1
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Dec 2022 09:50:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Lo1VVBU0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1029; helo=mail-pj1-x1029.google.com; envelope-from=seanjc@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Lo1VVBU0;
	dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NNWTl4qp7z3bPR
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Dec 2022 09:49:14 +1100 (AEDT)
Received: by mail-pj1-x1029.google.com with SMTP id l22-20020a17090a3f1600b00212fbbcfb78so6599780pjc.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Dec 2022 14:49:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mKF7ACqUicTgwRFQrz4oBsMFvmn+mRrenbI3VwK9VtA=;
        b=Lo1VVBU0quIBqwSjUL/IX6jsQ3Rcbq3kNXFx1b09LmjnR9bQqqs8Qnjl452IWYkBSY
         P1KTyvwrHEdLgoshrms0r4SI8z1ngo83OqCHRxrURyBE+yArcM+Cs5TCeq44GobVkF0m
         IuDj+iWRP2zVVwjI1HJslgwJO64iafu01Owc+4A3/mvkEjyzFr8iFAR19fNs0LBLJTf3
         Kg1ZIMc5fZ0ipGhmHdhLOXnD8uVTRyQX02DQttBjsyjAKjRvEJFav2gCuZ5FSQ6cpVhK
         zD3GLCkmoDFgDHZV7t7XBqH0jElTPRdTcydGeJqtHoccQFH5HqfiAwKx6tg04wXmDFCc
         QADQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mKF7ACqUicTgwRFQrz4oBsMFvmn+mRrenbI3VwK9VtA=;
        b=flxS9u4Vg0uyPFXK3lQPRcvhB8fMVn4IRQeP1xsUrwo/qJ0p10YXxRh2hm8HRIb8G9
         whaTPRhKyM6L/C/8GsSeUFYJqbtTVLQ1MMmINwrHt7ZX7jdsx/hIh06ENIj239gusOfT
         geQQ/g4cGdENP/8x66BUZOwyS0ZR+6fy/swm+7oefepkWmxBJ+hYNVR4K8CkdfEhPqdb
         WhZ9jJzQj3SGDc/qgSf3ziiBVSOrZaSBUsFynmxa+Gy1luDUysFuaAcRYsgjJyXBVuWW
         Mjc/A6iIbsCyJdZw0FKe5xQK7e03mvgoIsIMy5E4sElPdQ9OtFVPA774R169s4TA4wjO
         /DCg==
X-Gm-Message-State: ANoB5plIjc+gLaE7EmYNtQcSmeFJOVEvWpeh6v1hQyiK8Wtoze9facA2
	FSWJxjGBP81qrsTg2EQ26xKhjg==
X-Google-Smtp-Source: AA0mqf4Wt8uYV/bEa16p+0WrrISPwxZH3fHAX4g+Oh8a2UKzOEMh4LEyPBB3ZTgiAtA3/myS/mdVQA==
X-Received: by 2002:a17:903:32ce:b0:189:a0eb:4a26 with SMTP id i14-20020a17090332ce00b00189a0eb4a26mr13829305plr.162.1669934951343;
        Thu, 01 Dec 2022 14:49:11 -0800 (PST)
Received: from google.com (7.104.168.34.bc.googleusercontent.com. [34.168.104.7])
        by smtp.gmail.com with ESMTPSA id c73-20020a624e4c000000b0056bc742d21esm3854175pfb.176.2022.12.01.14.49.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 14:49:10 -0800 (PST)
Date: Thu, 1 Dec 2022 22:49:06 +0000
From: Sean Christopherson <seanjc@google.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Subject: Re: [PATCH v2 21/50] KVM: MIPS: Hardcode callbacks to hardware
 virtualization extensions
Message-ID: <Y4kvYlCbhj87rceF@google.com>
References: <20221130230934.1014142-1-seanjc@google.com>
 <20221130230934.1014142-22-seanjc@google.com>
 <beb697c2-dfad-780e-4638-76b229f28731@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <beb697c2-dfad-780e-4638-76b229f28731@linaro.org>
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
 u.yamahata@intel.com>, Fabiano Rosas <farosas@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Cornelia Huck <cohuck@redhat.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, Palmer Dabbelt <palmer@dabbelt.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, David Woodhouse <dwmw2@infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Dec 01, 2022, Philippe Mathieu-Daudé wrote:
> On 1/12/22 00:09, Sean Christopherson wrote:
> > Now that KVM no longer supports trap-and-emulate (see commit 45c7e8af4a5e
> > "MIPS: Remove KVM_TE support"), hardcode the MIPS callbacks to the
> > virtualization callbacks.
> > 
> > Harcoding the callbacks eliminates the technically-unnecessary check on
> > non-NULL kvm_mips_callbacks in kvm_arch_init().  MIPS has never supported
> > multiple in-tree modules, i.e. barring an out-of-tree module, where
> > copying and renaming kvm.ko counts as "out-of-tree", KVM could never
> > encounter a non-NULL set of callbacks during module init.
> > 
> > The callback check is also subtly broken, as it is not thread safe,
> > i.e. if there were multiple modules, loading both concurrently would
> > create a race between checking and setting kvm_mips_callbacks.
> > 
> > Given that out-of-tree shenanigans are not the kernel's responsibility,
> > hardcode the callbacks to simplify the code.
> > 
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > ---
> >   arch/mips/include/asm/kvm_host.h |  2 +-
> >   arch/mips/kvm/Makefile           |  2 +-
> >   arch/mips/kvm/callback.c         | 14 --------------
> >   arch/mips/kvm/mips.c             |  9 ++-------
> >   arch/mips/kvm/vz.c               |  7 ++++---
> >   5 files changed, 8 insertions(+), 26 deletions(-)
> >   delete mode 100644 arch/mips/kvm/callback.c
> > 
> > diff --git a/arch/mips/include/asm/kvm_host.h b/arch/mips/include/asm/kvm_host.h
> > index 28f0ba97db71..2803c9c21ef9 100644
> > --- a/arch/mips/include/asm/kvm_host.h
> > +++ b/arch/mips/include/asm/kvm_host.h
> > @@ -758,7 +758,7 @@ struct kvm_mips_callbacks {
> >   	void (*vcpu_reenter)(struct kvm_vcpu *vcpu);
> >   };
> >   extern struct kvm_mips_callbacks *kvm_mips_callbacks;
> 
> IIUC we could even constify this pointer.

Good point.  Protecting the pointer itself is a bit gross, but it is a nice
stopgap until the callbacks are gone.  I'll fold this in.  Thanks!

  extern const struct kvm_mips_callbacks * const kvm_mips_callbacks;
