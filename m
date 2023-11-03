Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E34F17E0014
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Nov 2023 10:43:51 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=YYC6k1n9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SMG5x669Rz3cl9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Nov 2023 20:43:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=YYC6k1n9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::f29; helo=mail-qv1-xf29.google.com; envelope-from=tabba@google.com; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com [IPv6:2607:f8b0:4864:20::f29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SMG526dNqz30P0
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Nov 2023 20:43:01 +1100 (AEDT)
Received: by mail-qv1-xf29.google.com with SMTP id 6a1803df08f44-6754b4091b6so10453636d6.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 Nov 2023 02:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1699004575; x=1699609375; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KR3uUy+lpOtuK74sFvr5LpDDKafluOWW+OG46f9Hrzo=;
        b=YYC6k1n9msarbRMiDeKwo4hsVn/mkPeUtKwUjzD0swwD7rRPJtxwTQ8hskORQY3vid
         FjlFabMxWD/lshCT1AlFD+lOiIaSYNewKxZH1WCOew8eb891TZwnqgM+fAyOfmYp6oE8
         Jkf/rog91jgUmIwZXOhW2+GMlYWKZ0JGG5trROk1VAVe34I16QCmFudHYZ/yA3n5SSDq
         x0gz0X1nfb4fnxLIyd529c5pT+SnxZvxRaIEYfQ7rZoOPa5mFne/ARI2wkigWbfo/i3g
         0Dn5d7mTdBrzaNZim7FNq3/H7+jFHhakH74BcXbTu61LegqSl3vopxa6gWRh11tJYyIy
         h9UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699004575; x=1699609375;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KR3uUy+lpOtuK74sFvr5LpDDKafluOWW+OG46f9Hrzo=;
        b=SMFhXhzrGU8CpPJlvGw1ZLjGCDmDYyMJZs//tRI3sIevcXa+MuMT6GJRQYl+mvQtwL
         PIWMN/KKl7ClFYGLpXbyd3YK+Slrc0g/wleAhwnp9ZiKQCeE/U/tIY3qJDX6+fSaObAl
         k55varCv/Z+oJ6POsq06hlWjw9cmTd/NgyzUESXVDBryMUxUaf9YHa8KHCxD5r2GtQ4h
         vMatWsFp1bggV52GWaTUeAQfVORxMO0N/RDKkea0wskotyDziYX2so1UYPPMTUCbJCKY
         SK3bddbHYTTsSyT5fGHMuD1xr0uZOoOcVvyFwyi74l23Hny5F+eJYON3jctjEv6XGI38
         hT/Q==
X-Gm-Message-State: AOJu0YwyLCWKeK4wrbsScO5eYQCVzU1X0SoNYZaisoJFX60q8FKzoipv
	dC7D2cWmukosv3DMIY4l+f2d4LmrI06fZsxbuD35RQ==
X-Google-Smtp-Source: AGHT+IHMtnnuJ+fshc7oeOwDt21mO974uTwKm6avpjixqQMFQPk6nu4AOneq997yl+dXgdaxeuVP+cu76MznLmTOvmQ=
X-Received: by 2002:a05:6214:401c:b0:66d:34a8:3ed0 with SMTP id
 kd28-20020a056214401c00b0066d34a83ed0mr22048546qvb.26.1699004574544; Fri, 03
 Nov 2023 02:42:54 -0700 (PDT)
MIME-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-17-seanjc@google.com>
In-Reply-To: <20231027182217.3615211-17-seanjc@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 3 Nov 2023 09:42:17 +0000
Message-ID: <CA+EHjTxEvJpfA7urRj6EbbuwTGWAw6ZYu6NmX9sLT5Cdp5p3eA@mail.gmail.com>
Subject: Re: [PATCH v13 16/35] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Wang <wei.w.wang@intel.com>, Vlastimil Babka <vbabka@suse.cz>, Yu Zhang <yu.c.zhang@linux.intel.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Albert Ou <aou@eecs.berkeley.edu>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, Isaku Yamahata <isaku.yamahata@intel.com>, Christian Brauner <brauner@kernel.org>, Quentin Perret <qperret@google.com>, Liam Merwick <liam.merwick@oracl
 e.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, David Matlack <dmatlack@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, Xu Yilun <yilun.xu@intel.com>, Anish Moorthy <amoorthy@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

...

> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> index e2252c748fd6..e82c69d5e755 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst

...

> +4.141 KVM_CREATE_GUEST_MEMFD
> +----------------------------
> +
> +:Capability: KVM_CAP_GUEST_MEMFD
> +:Architectures: none
> +:Type: vm ioctl
> +:Parameters: struct struct kvm_create_guest_memfd(in)

One struct too many.

Cheers,
/fuad
