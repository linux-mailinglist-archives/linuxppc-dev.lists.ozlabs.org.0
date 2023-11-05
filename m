Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B787E148C
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Nov 2023 17:20:59 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GIFXajrq;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GIFXajrq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SNfq45SMMz3byP
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Nov 2023 03:20:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GIFXajrq;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GIFXajrq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SNfp91Sdtz2xpx
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Nov 2023 03:19:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699201194;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5S45DCFEET4FUlleAs+X25SSP8exRtkoxGaiIZR36AY=;
	b=GIFXajrqm/ULsy1Olv8nSw+qy6pTHQDi6LF0IHzUOTjwt5taiG65RjGqrE9NCr6POVy6Ba
	crP26QRpr6wp29snVzITIettqV+Ny+qHTCSFO4w1w58RGIkgnsaIed3UEkaMJywJLxl3w7
	7SC5QJ7qCa55AeaSXl8RPex8tSmM5C0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699201194;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5S45DCFEET4FUlleAs+X25SSP8exRtkoxGaiIZR36AY=;
	b=GIFXajrqm/ULsy1Olv8nSw+qy6pTHQDi6LF0IHzUOTjwt5taiG65RjGqrE9NCr6POVy6Ba
	crP26QRpr6wp29snVzITIettqV+Ny+qHTCSFO4w1w58RGIkgnsaIed3UEkaMJywJLxl3w7
	7SC5QJ7qCa55AeaSXl8RPex8tSmM5C0=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-623-Zugk040eNPu4C9f1dqfNjQ-1; Sun, 05 Nov 2023 11:19:50 -0500
X-MC-Unique: Zugk040eNPu4C9f1dqfNjQ-1
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-4ac2ffa81f1so312117e0c.0
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 05 Nov 2023 08:19:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699201190; x=1699805990;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5S45DCFEET4FUlleAs+X25SSP8exRtkoxGaiIZR36AY=;
        b=VYbgkxPn/GKSQ/kk22VP1VTBLZ5C6I3ZklhjfybqmrwEsmPVxQ9yCn2DVPXMv6pQkN
         EH3MJtnIuGbZSSXB0icI++vXVPcFZBU+S7Oz5awgEhe6jk0GHC9lLLmDNbyoq5QOZ5Ef
         R+GOjouDTBBusNLQUFbYa/pfYCg+UKJ/6uJU3/K3EC1rLmWcAWNBMnPIafjLM5AJcV2q
         R2PEmQIIAeSnzYZSsZpYIhuOHXHTbXl/tAnWoC5Nzdsafv93IS15lQdauTn6/0fy5G0I
         AttfPdQWFOTH+Eq/ucSIbSLeNkG+UsfuAabVCyggzWYE9JybgEZlTa9WzNXWDq8AAySi
         58XA==
X-Gm-Message-State: AOJu0YzsqLUW3zDzkJdqnJDTwNtAoDwPWwhaQDAd2d9EvXIBzMK0hb78
	fNmgaSwcvaQ9glPtRzw6NS7DKfAKdbPLX+6+GFxWs7CLVeKeCeHjjeApbiI/yqbt2bnAjsRvHsq
	MeA9pkD/uAEYS/mr5HY5gpUuVOUtUYZJR4IEycIuq+g==
X-Received: by 2002:a05:6102:4743:b0:45d:8f83:e10f with SMTP id ej3-20020a056102474300b0045d8f83e10fmr5351494vsb.4.1699201189799;
        Sun, 05 Nov 2023 08:19:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG9PY/ps/exIZhJtEiBPcrHL5I4MFvN3fWtoZJg4K/o1jMHEXmGlTLfpUZIUzDcxTZUf1dOb3c60KPU/ucxafo=
X-Received: by 2002:a05:6102:4743:b0:45d:8f83:e10f with SMTP id
 ej3-20020a056102474300b0045d8f83e10fmr5351461vsb.4.1699201189503; Sun, 05 Nov
 2023 08:19:49 -0800 (PST)
MIME-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-21-seanjc@google.com>
 <ZUeSaAKRemlSRQpO@yilunxu-OptiPlex-7050>
In-Reply-To: <ZUeSaAKRemlSRQpO@yilunxu-OptiPlex-7050>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Sun, 5 Nov 2023 17:19:36 +0100
Message-ID: <CABgObfb1Wf2ptitGhJPM6VcmkCG9haMoQj2BsttjeoV=9F0O9Q@mail.gmail.com>
Subject: Re: [PATCH v13 20/35] KVM: x86/mmu: Handle page fault for private memory
To: Xu Yilun <yilun.xu@linux.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Albert Ou <aou@eecs.berkeley.edu>, Vlastimil Babka <vbabka@suse.cz>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, Isaku Yamahata <isaku.yamahata@intel.com>, Christian Brauner <brauner@kernel.org>, Quen
 tin Perret <qperret@google.com>, Sean Christopherson <seanjc@google.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, David Matlack <dmatlack@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, kvm-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org, Liam Merwick <liam.merwick@oracle.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, Xu Yilun <yilun.xu@intel.com>, Anish Moorthy <amoorthy@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Nov 5, 2023 at 2:04=E2=80=AFPM Xu Yilun <yilun.xu@linux.intel.com> =
wrote:
>
> > +static void kvm_mmu_prepare_memory_fault_exit(struct kvm_vcpu *vcpu,
> > +                                           struct kvm_page_fault *faul=
t)
> > +{
> > +     kvm_prepare_memory_fault_exit(vcpu, fault->gfn << PAGE_SHIFT,
> > +                                   PAGE_SIZE, fault->write, fault->exe=
c,
> > +                                   fault->is_private);
> > +}
> > +
> > +static int kvm_faultin_pfn_private(struct kvm_vcpu *vcpu,
> > +                                struct kvm_page_fault *fault)
> > +{
> > +     int max_order, r;
> > +
> > +     if (!kvm_slot_can_be_private(fault->slot)) {
> > +             kvm_mmu_prepare_memory_fault_exit(vcpu, fault);
> > +             return -EFAULT;
> > +     }
> > +
> > +     r =3D kvm_gmem_get_pfn(vcpu->kvm, fault->slot, fault->gfn, &fault=
->pfn,
> > +                          &max_order);
> > +     if (r) {
> > +             kvm_mmu_prepare_memory_fault_exit(vcpu, fault);
> > +             return r;
>
> Why report KVM_EXIT_MEMORY_FAULT here? even with a ret !=3D -EFAULT?

The cases are EFAULT, EHWPOISON (which can report
KVM_EXIT_MEMORY_FAULT) and ENOMEM. I think it's fine
that even -ENOMEM can return KVM_EXIT_MEMORY_FAULT,
and it doesn't violate the documentation.  The docs tell you "what
can you do if error if EFAULT or EHWPOISON?"; they don't
exclude that other errnos result in KVM_EXIT_MEMORY_FAULT,
it's just that you're not supposed to look at it

Paolo

