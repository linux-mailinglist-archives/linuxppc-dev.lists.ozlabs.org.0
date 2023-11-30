Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A2297FE675
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Nov 2023 03:03:03 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=nZ9XVw0K;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sgfbm5D9yz3cC3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Nov 2023 13:03:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=nZ9XVw0K;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3iu1nzqykdm0bxt62vz77z4x.v75416dg88v-wxe41bcb.7i4tub.7az@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SgfZt1D9dz2yDS
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Nov 2023 13:02:12 +1100 (AEDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-5cef61289fdso8216347b3.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Nov 2023 18:02:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701309730; x=1701914530; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=p5qGWsyuSpyUxVCjDr7Vtr3DU5QXEtFZRiCX/LhUA7Q=;
        b=nZ9XVw0KMvJkmJ00XwuQPLZ263li0bz3ZRUvPd1kJVdLRQusZYRPlkoAafJjbaGoYp
         I+11OWa9FPDOkxBrlha2e+VGcsFAougCR/KyHfmfvnS6b8EpTiJgT2LW0JxDiL7g416h
         gq82UJZfDdyTskKp+M8fnhpfAmhouT79JWuvO8rQ2BKO2znejU8Z5L77fnFFSyk77wOL
         gqbgxK6zodxV+DlFrbpqsccJnxAXKGpBwhImq4R9GsvhGIqJ+WQmXWEvIVaQsTWGbSxF
         XPtOG1p2P1oKigy6jfe6z865YmoVJwbWdo5jJ8qx4uExd5ol7CSlJX76tBWNt9MpD2Hm
         VD3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701309730; x=1701914530;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p5qGWsyuSpyUxVCjDr7Vtr3DU5QXEtFZRiCX/LhUA7Q=;
        b=pd7G8YX5CmNes/CQMZUm9M4E6/T58wN6HM15K5BGtzHQRKhbKPDFI+bpcoREpjzMs9
         IXyYHeBMT9mONZPrBzzsUJFO+eVndJ/Mu4jpJoTP8BoWzDkv6RULiJgBeeQ+4la8fHgb
         RtNesBMteTYW456OyyqZRVzu2c1IQX8A0wRYjl5iJ8FzFH3OjLXdcuFrUlTVDSzVmqGa
         h9LWoShCTne0Ejx19ru0Iu8stX3dbohtJhQ5IC2JaaDUhIatr3M38cCoRSddFTXoR9Wl
         TUz5Aq51GR4P0AJEIgHl8RoBKdS8DA6SbdzMUrqwEv3DlWjqli35FPwD9NA+kIRGnG13
         jI0w==
X-Gm-Message-State: AOJu0YyWa3sQaizvERxE4o00RUQSlO4J3kj0VSFc90K0+/TRcrZXNJXG
	0Uq+QbjqegDMj5sqaCFb2lZGl5WGtNU=
X-Google-Smtp-Source: AGHT+IFFDXNizpZ3vuH6xJBBRUPvzbuvqFOYFoh+t1YBbvxwcXUL+r5zJu2BpTJXrcb2S71zCUhlon51++M=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:690c:ec5:b0:5ca:321f:a368 with SMTP id
 cs5-20020a05690c0ec500b005ca321fa368mr767996ywb.7.1701309730213; Wed, 29 Nov
 2023 18:02:10 -0800 (PST)
Date: Wed, 29 Nov 2023 18:02:08 -0800
In-Reply-To: <20231130011650.GD1389974@nvidia.com>
Mime-Version: 1.0
References: <0-v1-08396538817d+13c5-vfio_kvm_kconfig_jgg@nvidia.com>
 <87edgy87ig.fsf@mail.lhotse> <ZWagNsu1XQIqk5z9@google.com>
 <875y1k3nm9.fsf@mail.lhotse> <ZWfgYdSoJAZqL2Gx@google.com> <20231130011650.GD1389974@nvidia.com>
Message-ID: <ZWftIIEpbLP2xF5H@google.com>
Subject: Re: Ping? Re: [PATCH rc] kvm: Prevent compiling virt/kvm/vfio.c
 unless VFIO is selected
From: Sean Christopherson <seanjc@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-s390@vger.kernel.org, Janosch Frank <frankja@linux.ibm.com>, x86@kernel.org, Ingo Molnar <mingo@redhat.com>, Zenghui Yu <yuzenghui@huawei.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, kvmarm@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, Sven Schnelle <svens@linux.ibm.com>, Marc Zyngier <maz@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Nov 29, 2023, Jason Gunthorpe wrote:
> On Wed, Nov 29, 2023 at 05:07:45PM -0800, Sean Christopherson wrote:
> > On Wed, Nov 29, 2023, Michael Ellerman wrote:
> > > Sean Christopherson <seanjc@google.com> writes:
> > > > On Fri, Nov 10, 2023, Michael Ellerman wrote:
> > > >> Jason Gunthorpe <jgg@nvidia.com> writes:
> > > >> > There are a bunch of reported randconfig failures now because of this,
> > > >> > something like:
> > > >> >
> > > >> >>> arch/powerpc/kvm/../../../virt/kvm/vfio.c:89:7: warning: attribute declaration must precede definition [-Wignored-attributes]
> > > >> >            fn = symbol_get(vfio_file_iommu_group);
> > > >> >                 ^
> > > >> >    include/linux/module.h:805:60: note: expanded from macro 'symbol_get'
> > > >> >    #define symbol_get(x) ({ extern typeof(x) x __attribute__((weak,visibility("hidden"))); &(x); })
> > > >> >
> > > >> > It happens because the arch forces KVM_VFIO without knowing if VFIO is
> > > >> > even enabled.
> > > >> 
> > > >> This is still breaking some builds. Can we get this fix in please?
> > > >> 
> > > >> cheers
> > > >> 
> > > >> > Split the kconfig so the arch selects the usual HAVE_KVM_ARCH_VFIO and
> > > >> > then KVM_VFIO is only enabled if the arch wants it and VFIO is turned on.
> > > >
> > > > Heh, so I was trying to figure out why things like vfio_file_set_kvm() aren't
> > > > problematic, i.e. why the existing mess didn't cause failures.  I can't repro the
> > > > warning (requires clang-16?), but IIUC the reason only the group code is problematic
> > > > is that vfio.h creates a stub for vfio_file_iommu_group() and thus there's no symbol,
> > > > whereas vfio.h declares vfio_file_set_kvm() unconditionally.
> > > 
> > > That warning I'm unsure about.
> > 
> > Ah, it's the same warning, I just missed the CONFIG_MODULES=n requirement.
> 
> Oh, wait, doesn't that mean the approach won't work? IIRC doesn't
> symbol_get turn into just &fn when non-modular turning this into a
> link failure without the kconfig part?

Yes, but it doesn't cause linker errors.  IIUC, because the extern declaration
is tagged "weak", a dummy default is used.  E.g. on x86, this is what is generated
with VFIO=y

                fn = symbol_get(vfio_file_is_valid);
                if (!fn)
   0xffffffff810396c5 <+5>:	mov    $0xffffffff81829230,%rax
   0xffffffff810396cc <+12>:	test   %rax,%rax

whereas VFIO=n gets

                fn = symbol_get(vfio_file_is_valid);
                if (!fn)
   0xffffffff810396c5 <+5>:	mov    $0x0,%rax
   0xffffffff810396cc <+12>:	test   %rax,%rax

I have no idea if the fact that symbol_get() generates '0', i.e. the !NULL checks
work as expected, is intentional or if KVM works by sheer dumb luck.  I'm not
entirely sure I want to find out, though it's definitely extra motiviation to get
the KVM mess fixed sooner than later. 
