Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F24607FE52B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Nov 2023 02:08:34 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=TK+09sR+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SgdNw38Bfz3cVV
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Nov 2023 12:08:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=TK+09sR+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3yubnzqykdpmnzviexbjjbgz.xjhgdipskkx-yzqgdnon.jugvwn.jmb@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SgdN63bCqz2yDM
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Nov 2023 12:07:49 +1100 (AEDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-5d2f58660d4so6193027b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Nov 2023 17:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701306466; x=1701911266; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=6N0wFvlno3kNCM+277a2S5UNbGmqd2ft4cb10DJm/tw=;
        b=TK+09sR+TVqoI+6aALGN9bo9aHX2S8PLVXGnOW06ub7v3q7ISBZhIlDRQLHi+57Umm
         fRA7Gn8Y/DI0ibkd/6WC+g7cVv+GXP6NWJldHI5Ah7OUUZEntTeJAPUTAvayxHx/Y637
         E0458w46dGzahcS4me+4Z6UyQjjU5WYSFo7Yr6Rxp7oK055+y2lrKYD64FN3jZ/DUXgq
         Ty8vcnAvkRIUkV3oz010obke5Mjxl43TTqSr0fufRe5cwYZ/Oy2KFpzVBwt/RlsPmEXh
         0h+HE75gjvMiGE/RisK1dL7Ew04zPQgZ1fPlrhmwp7Zp4NCmGcUGbIdi0xASNaQ12F36
         wS1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701306466; x=1701911266;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6N0wFvlno3kNCM+277a2S5UNbGmqd2ft4cb10DJm/tw=;
        b=L8bg7md6q4tF5lZBPIR4xztEd8EKd/PZkhLEXipJXXgRh3rwoEvfuv02VSSMTWnPQv
         9Y0lq5fQItkvw2GTXpNrMsUW+0ks3VoPflk1xtUG9+zh0hVH95QmtSH+9wFuZtwgyZN+
         5fg7pBlpwUn0/6yC66vEFNceae7RgffYFIe2KHJFk9BqWK5cd3UYafw7lVapX73gDzy+
         iZpQ1GaISKgeHuxCRRErZT10Xhh5/wyaLJ8N2c+qm/KJo26YKe0QA//qW1XEwLe+v0Cm
         rnGom3YQLtcCU7BQFVcKs02ta21R0VdDF2NpreWcMZ9JSwGAcGB10oHb3fO1PDfBMv7A
         BsrQ==
X-Gm-Message-State: AOJu0YyGSxBVy6+zBj8HVzwL2XCi9AO1V3L9elvG40m87hipCnpKtYTl
	ThRhIP/gCgG24JInq7q+tJRfZT+EqEE=
X-Google-Smtp-Source: AGHT+IFI+jDPj/rF774qvoJ2qWoHyFZGCHN96iaq8+b2ScA3/i76IDoNcSAJtId/pe2rL3s2OfV75Y20vgc=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:ca02:0:b0:db3:fc48:35f0 with SMTP id
 a2-20020a25ca02000000b00db3fc4835f0mr615843ybg.6.1701306466524; Wed, 29 Nov
 2023 17:07:46 -0800 (PST)
Date: Wed, 29 Nov 2023 17:07:45 -0800
In-Reply-To: <875y1k3nm9.fsf@mail.lhotse>
Mime-Version: 1.0
References: <0-v1-08396538817d+13c5-vfio_kvm_kconfig_jgg@nvidia.com>
 <87edgy87ig.fsf@mail.lhotse> <ZWagNsu1XQIqk5z9@google.com> <875y1k3nm9.fsf@mail.lhotse>
Message-ID: <ZWfgYdSoJAZqL2Gx@google.com>
Subject: Re: Ping? Re: [PATCH rc] kvm: Prevent compiling virt/kvm/vfio.c
 unless VFIO is selected
From: Sean Christopherson <seanjc@google.com>
To: Michael Ellerman <mpe@ellerman.id.au>
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-s390@vger.kernel.org, Janosch Frank <frankja@linux.ibm.com>, Marc Zyngier <maz@kernel.org>, x86@kernel.org, Ingo Molnar <mingo@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>, Zenghui Yu <yuzenghui@huawei.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, kvmarm@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, Sven Schnelle <svens@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Nov 29, 2023, Michael Ellerman wrote:
> Sean Christopherson <seanjc@google.com> writes:
> > On Fri, Nov 10, 2023, Michael Ellerman wrote:
> >> Jason Gunthorpe <jgg@nvidia.com> writes:
> >> > There are a bunch of reported randconfig failures now because of this,
> >> > something like:
> >> >
> >> >>> arch/powerpc/kvm/../../../virt/kvm/vfio.c:89:7: warning: attribute declaration must precede definition [-Wignored-attributes]
> >> >            fn = symbol_get(vfio_file_iommu_group);
> >> >                 ^
> >> >    include/linux/module.h:805:60: note: expanded from macro 'symbol_get'
> >> >    #define symbol_get(x) ({ extern typeof(x) x __attribute__((weak,visibility("hidden"))); &(x); })
> >> >
> >> > It happens because the arch forces KVM_VFIO without knowing if VFIO is
> >> > even enabled.
> >> 
> >> This is still breaking some builds. Can we get this fix in please?
> >> 
> >> cheers
> >> 
> >> > Split the kconfig so the arch selects the usual HAVE_KVM_ARCH_VFIO and
> >> > then KVM_VFIO is only enabled if the arch wants it and VFIO is turned on.
> >
> > Heh, so I was trying to figure out why things like vfio_file_set_kvm() aren't
> > problematic, i.e. why the existing mess didn't cause failures.  I can't repro the
> > warning (requires clang-16?), but IIUC the reason only the group code is problematic
> > is that vfio.h creates a stub for vfio_file_iommu_group() and thus there's no symbol,
> > whereas vfio.h declares vfio_file_set_kvm() unconditionally.
> 
> That warning I'm unsure about.

Ah, it's the same warning, I just missed the CONFIG_MODULES=n requirement.
