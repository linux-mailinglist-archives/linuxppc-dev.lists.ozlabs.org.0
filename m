Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F40907E2980
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Nov 2023 17:13:57 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=tHAiY/1D;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SPGcg6M9kz3cHT
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Nov 2023 03:13:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=tHAiY/1D;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3jxbjzqykdayykgtpimuumrk.iusrot03vvi-jk1royzy.u5rghy.uxm@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SPGbm3tPMz3bZN
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Nov 2023 03:13:06 +1100 (AEDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-5a7d261a84bso63745997b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Nov 2023 08:13:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1699287183; x=1699891983; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mmoUoGnC/t23H3IPxV2qsT2AAyd7sUSE5gGiJgJlDX0=;
        b=tHAiY/1DHSqo0zro2RMf/hdyBo7g7VYizA8SHi0nOuPrAGeWgAKtTu8yt3j0lj791i
         yOUyYyzWM0nMLsfjJKuC5cNyNGaTcVvX5PlnOL3RXR6+5hj17iryRI26pjxQFdF9LWVK
         zfQ57Deune8U+MEslShOHs5vVp3cDRA7aUVKEgk+/GJJyA68sB50i9zdwK5ljWaaBLWF
         OgoItKyeBI1XdY29zUUrB3NIqWQrDgXDxGv22dStw2WB9A7SbE7u1BQUOU4GSBvuIRSO
         D5F0XFcCrJ507611EY9QFUSBy3gRwz05uR3US+6B9A9rPI5nZBpEsGvK4M3f77aEX60q
         LCKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699287183; x=1699891983;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mmoUoGnC/t23H3IPxV2qsT2AAyd7sUSE5gGiJgJlDX0=;
        b=QBT3GCZpWnaox65Kw+S+AWpLVT7Vja+7JmXLNvUWLbtMQ9zzIv6MOJKEXw0Z9ezt5R
         Ro4yYY7J0SdMVyeEu017+EjeDV7oish6eWNn8BVzjJxYG6mZOVBxm+8cbQ/sqhU7XKKx
         /mgeJ1eOTVMb0J0o5UbCmmg8M2fOGLOdPPn0vgr/xZCBKVTzpqIyGWV7MvD5Ngo5WqVQ
         9wU8CYSFa9PpRBhWjZDGMRMRH7EXlc89lmuJHp+FFH+XDRuLl0QJSxEU1qOH4KU9g7KW
         UYNNEP/XCe3IAgeIPMw3RLPC4fgIxoHjn7BQc2fYTB0nA/ycATc1Y94oH95Oe9kkmmfX
         NMOA==
X-Gm-Message-State: AOJu0YxYjezlBi6HMsCtzOCz1knRbmRDM68jqXr0QKFzKuLIQiSBNpb6
	BC/KIlep3OkAJywrgcInHuy/RAMD9Z0=
X-Google-Smtp-Source: AGHT+IEuz2kxbbqGFRlRrYjmJAAmCd5YL62xYCCumvx9nTcHzja2SicRUTSCOZ5GtJw0RknzXE1Az5YHDFw=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a0d:d5d2:0:b0:5a7:ad67:b4b6 with SMTP id
 x201-20020a0dd5d2000000b005a7ad67b4b6mr228755ywd.2.1699287183068; Mon, 06 Nov
 2023 08:13:03 -0800 (PST)
Date: Mon, 6 Nov 2023 08:13:01 -0800
In-Reply-To: <CA+EHjTxy6TWM3oBG0Q6v5090XTrs+M8_m5=6Z2E1P-HyTkrGWg@mail.gmail.com>
Mime-Version: 1.0
References: <20231105163040.14904-1-pbonzini@redhat.com> <20231105163040.14904-26-pbonzini@redhat.com>
 <CA+EHjTxy6TWM3oBG0Q6v5090XTrs+M8_m5=6Z2E1P-HyTkrGWg@mail.gmail.com>
Message-ID: <ZUkQjW-yMnLfD7XW@google.com>
Subject: Re: [PATCH 25/34] KVM: selftests: Add helpers to convert guest memory
 b/w private and shared
From: Sean Christopherson <seanjc@google.com>
To: Fuad Tabba <tabba@google.com>
Content-Type: text/plain; charset="utf-8"
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Wang <wei.w.wang@intel.com>, Vlastimil Babka <vbabka@suse.cz>, Yu Zhang <yu.c.zhang@linux.intel.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Albert Ou <aou@eecs.berkeley.edu>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, Isaku Yamahata <isaku.yamahata@intel.com>, Christian Brauner <brauner@kernel.org>, Quentin Perret <qperret@google.com>, Liam Merwick <liam.merwick@oracl
 e.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, David Matlack <dmatlack@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, Xu Yilun <yilun.xu@intel.com>, Anish Moorthy <amoorthy@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Nov 06, 2023, Fuad Tabba wrote:
> On Sun, Nov 5, 2023 at 4:34=E2=80=AFPM Paolo Bonzini <pbonzini@redhat.com=
> wrote:
> > +void vm_guest_mem_fallocate(struct kvm_vm *vm, uint64_t base, uint64_t=
 size,
> > +                           bool punch_hole)
> > +{
> > +       const int mode =3D FALLOC_FL_KEEP_SIZE | (punch_hole ? FALLOC_F=
L_PUNCH_HOLE : 0);
> > +       struct userspace_mem_region *region;
> > +       uint64_t end =3D base + size;
> > +       uint64_t gpa, len;
> > +       off_t fd_offset;
> > +       int ret;
> > +
> > +       for (gpa =3D base; gpa < end; gpa +=3D len) {
> > +               uint64_t offset;
> > +
> > +               region =3D userspace_mem_region_find(vm, gpa, gpa);
> > +               TEST_ASSERT(region && region->region.flags & KVM_MEM_GU=
EST_MEMFD,
> > +                           "Private memory region not found for GPA 0x=
%lx", gpa);
> > +
> > +               offset =3D (gpa - region->region.guest_phys_addr);
>=20
> nit: why the parentheses?

I simply forgot to remove them when I changed the function to support spann=
ing
multiple memslots, i.e. when the code went from this

	fd_offset =3D region->region.gmem_offset +
		    (gpa - region->region.guest_phys_addr);

to what you see above.
