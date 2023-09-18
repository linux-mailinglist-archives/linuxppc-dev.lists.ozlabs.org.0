Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4B87A4D8E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Sep 2023 17:53:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=YOHxziA2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rq8Tl3hcjz3c18
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Sep 2023 01:53:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=YOHxziA2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::54a; helo=mail-pg1-x54a.google.com; envelope-from=3sxiizqykdh4ugcpleiqqing.eqonkpwzrre-fgxnkuvu.q1ncdu.qti@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com [IPv6:2607:f8b0:4864:20::54a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rq8Sr3hBdz3bYc
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Sep 2023 01:52:44 +1000 (AEST)
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-56fb25fdf06so3096579a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Sep 2023 08:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695052362; x=1695657162; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=2U3xsG0fg5xdFpPmP8zowhEzmg+gfxwbZh9hlXMaF+c=;
        b=YOHxziA2kFNU2U0t9GSRRy7R+URP2IXjfTFWNhT0E0jOv2oc5iQfhZ3OxsXQeVAZIr
         3yrGR5X7TG9A5JaRYcX013PYc9Zq4vnEU29M98ZYJsJS2s71gEQ1GWjak80TUTsOYjCU
         HpfOfehT/zAEygfr2laicMJM7vhVLDCWmzldIhVE1rGyq5SIxKXwqdHl7npycIqeUvK5
         Mct0SDJhk0oG6Vow3kHk+dwF0XFNhL1ZbKQDACqrPNLUK+p3JmTIg8tzW2S1yPyz4QhO
         NSpYKzwVVxh14fypGgMLpVXv1+yJaewKI9qX4ZjpZdkuLnHrZcdnHA7YSRCZas2+54Zx
         CHFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695052362; x=1695657162;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2U3xsG0fg5xdFpPmP8zowhEzmg+gfxwbZh9hlXMaF+c=;
        b=ndy5Q8LEcGp83ar7doxkqmL5giW4IPH7rNNLy6enPS4DwQPxqRMekPdbLyAvK/EJiJ
         YsmgtxBLkfiRysc3NS6flUbEZ27Ahu/2zJvjGmAWXodK8t9k5L6udbP0Bp4F+ikLpJc/
         G/u4sjsSPLj8R1zyYp12igj48Fus0mut+XphRf08hvljLlnMIUbIaiGrjVi7OdnCTH+S
         SsmxuLPwsnj3pqctmLwm/JI87XBm6CPXlutEj6tut0Ml10WT2PUYWFeniSspDcXo5m/Y
         u0MUQckE7BrZNy+wItFwf5HfC5LBKwsshkGCwYNlMouaKFgB5+T0KoLLWuLc6W1nw76p
         3okA==
X-Gm-Message-State: AOJu0YxQcjLWWhmEh3mB0CiYiwoKoLozND5fZDd3zhWfZJIlqY6s1xkL
	8TOl4Hk1BaLSQcqDaAZlzuoqESksOQk=
X-Google-Smtp-Source: AGHT+IGgNS2Vz9a89mB0wnbmpqOo9ipRBHkgWDp+LBnX1+UB/D0eQmGLqC9so7UJgprSn2d6kzcCXv9BIzw=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:903:41c2:b0:1c1:fbec:bc39 with SMTP id
 u2-20020a17090341c200b001c1fbecbc39mr210522ple.4.1695052361665; Mon, 18 Sep
 2023 08:52:41 -0700 (PDT)
Date: Mon, 18 Sep 2023 08:52:40 -0700
In-Reply-To: <20230918152946.GJ13795@ziepe.ca>
Mime-Version: 1.0
References: <20230916003118.2540661-1-seanjc@google.com> <20230916003118.2540661-7-seanjc@google.com>
 <20230918152946.GJ13795@ziepe.ca>
Message-ID: <ZQhySMjmuyW2Czas@google.com>
Subject: Re: [PATCH 06/26] KVM: Drop CONFIG_KVM_VFIO and just look at KVM+VFIO
From: Sean Christopherson <seanjc@google.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Content-Type: text/plain; charset="us-ascii"
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
Cc: x86@kernel.org, kvm@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, Janosch Frank <frankja@linux.ibm.com>, Harald Freudenberger <freude@linux.ibm.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Halil Pasic <pasic@linux.ibm.com>, Andrew Thornton <andrewth@google.com>, Ingo Molnar <mingo@redhat.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Jason Herne <jjherne@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>, Venkatesh Srinivas <venkateshs@chromium.org>, Heiko Carstens <hca@linux.ibm.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Alex Williamson <alex.williamson@redhat.com>, Borislav Petkov <bp@alien8.de>, And
 y Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Tony Krowiak <akrowiak@linux.ibm.com>, Anish Ghulati <aghulati@google.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, linux-perf-users@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Sep 18, 2023, Jason Gunthorpe wrote:
> On Fri, Sep 15, 2023 at 05:30:58PM -0700, Sean Christopherson wrote:
> > Drop KVM's KVM_VFIO Kconfig, and instead compile in VFIO support if
> > and only if VFIO itself is enabled.  Similar to the recent change to have
> > VFIO stop looking at HAVE_KVM, compiling in support for talking to VFIO
> > just because the architecture supports VFIO is nonsensical.
> > 
> > This fixes a bug where RISC-V doesn't select KVM_VFIO, i.e. would silently
> > fail to do connect KVM and VFIO, even though RISC-V supports VFIO.  The
> > bug is benign as the only driver in all of Linux that actually uses the
> > KVM reference provided by VFIO is KVM-GT, which is x86/Intel specific.
> 
> Hmm, I recall that all the S390 drivers need it as well.
> 
> static int vfio_ap_mdev_open_device(struct vfio_device *vdev)
> {
>         struct ap_matrix_mdev *matrix_mdev =
>                 container_of(vdev, struct ap_matrix_mdev, vdev);
> 
>         if (!vdev->kvm)
>                 return -EINVAL;
> 
>         return vfio_ap_mdev_set_kvm(matrix_mdev, vdev->kvm);

Ah, I missed that the KVM reference was routed through VFIO in that case.

> I wonder if we should be making the VFIO drivers that need the kvm to
> ask for it? 'select CONFIG_NEED_VFIO_KVM' or something?

I wondered the same thing, if only to make it easier to track which drivers actually
end up interacting directly with KVM.

> Regardless, I fully agree with getting rid of the arch flag.
> 
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> 
> > --- a/virt/kvm/Makefile.kvm
> > +++ b/virt/kvm/Makefile.kvm
> > @@ -6,7 +6,9 @@
> >  KVM ?= ../../../virt/kvm
> >  
> >  kvm-y := $(KVM)/kvm_main.o $(KVM)/eventfd.o $(KVM)/binary_stats.o
> > -kvm-$(CONFIG_KVM_VFIO) += $(KVM)/vfio.o
> > +ifdef CONFIG_VFIO
> > +kvm-y += $(KVM)/vfio.o
> > +endif
> 
> I wonder if kvm-m magically works in kbuild so you don't need the ifdef?

Yeah, that should work, no idea why I added the ifdef.
