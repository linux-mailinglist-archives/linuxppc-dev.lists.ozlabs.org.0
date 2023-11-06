Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC467E29AB
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Nov 2023 17:26:15 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=lRYMIDBO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SPGts1gFjz3cTF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Nov 2023 03:26:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=lRYMIDBO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::229; helo=mail-oi1-x229.google.com; envelope-from=tabba@google.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SPGsv4Y5Jz3bWH
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Nov 2023 03:25:22 +1100 (AEDT)
Received: by mail-oi1-x229.google.com with SMTP id 5614622812f47-3b3f55e1bbbso3000898b6e.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Nov 2023 08:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1699287918; x=1699892718; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5xnGb8Sp7Bw2ldCk3b7+mm/bKINtcTCgeZ/KDZ+GW64=;
        b=lRYMIDBOpZyljFO2RvNThLgD5wNa3HOuESobzjPSVYXrazoAy44Qh7oocUFwsC8P1s
         dxCjBIjMpIq4wQHkSvuYdo3rxIjn1W/3DqYDOYteiqurXv6dh206OB1ex9oP/kIBeA4S
         amfILxb0nrJfh9r2wkAQjMDiK0HwfRSIDwC25diJsSaH8isSY8M+9zuDZ1wGmxs2KLvN
         FINnn2r2JmoVxJsUKumMzDWHU7GvXcdVBbtH1XTG1XQuOYzjx/sRDmNVZwTxi6Ce9VPA
         zlwxRjs9FrX4f0vxVXUK6+1HY7X288l1RRBEZf0ZkPlksAC5FjNelM5VLa6gXFUawLhZ
         E6YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699287918; x=1699892718;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5xnGb8Sp7Bw2ldCk3b7+mm/bKINtcTCgeZ/KDZ+GW64=;
        b=uPhbeLP6qyOcYsu35nzQkepE9jewwIvcAqFV7OClFO/T1KEQfM9yh/pCneQegRAicX
         LnB9QmfwiS35f2FTUXMAn48MRXAl/hz8hYIps5S2KtDgbb21Hbwxoauk8YDRrbcbkuuX
         bJOvpGLVPDWz8AldwPFz5NFETlMttUXtHc0Gon6CFdpDM6JHRJei1gLNna4GtW5SLMpL
         JuRtuChWp5ILzBKkdD8Kj8TCAwLdxw1NY2ZutvZxZKef3foxmaiQG1PG6nZUcChdcI36
         oJY36fzOdQJaZiFVngeXpYDF5qzGEwkFaVzjRmz+i/S/voCP5KUMxxyh5Ze6G48KtZ/T
         OEoQ==
X-Gm-Message-State: AOJu0Yw5AxXYetXdMejBabsJbEfMpfvqtj+UzHKqBp25XbDZUUHLk+sf
	N31ttwLmd6gZ1jlhquja7jzOTUH8DdysNZ4dgoMpJQ==
X-Google-Smtp-Source: AGHT+IEz2M905daE9adgBPAvjj9bLaNYp4EiTefEe+KnfTT86zKFKrzhkzHGJH5RS/f9fNDUudL2BwXAULrnwcO9LCk=
X-Received: by 2002:a05:6808:28c:b0:3af:a107:cf68 with SMTP id
 z12-20020a056808028c00b003afa107cf68mr28980109oic.40.1699287918292; Mon, 06
 Nov 2023 08:25:18 -0800 (PST)
MIME-Version: 1.0
References: <20231105163040.14904-1-pbonzini@redhat.com> <20231105163040.14904-26-pbonzini@redhat.com>
 <CA+EHjTxy6TWM3oBG0Q6v5090XTrs+M8_m5=6Z2E1P-HyTkrGWg@mail.gmail.com> <ZUkQjW-yMnLfD7XW@google.com>
In-Reply-To: <ZUkQjW-yMnLfD7XW@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 6 Nov 2023 16:24:42 +0000
Message-ID: <CA+EHjTw8Om6DGatxGhLJHpUb4RY_ma1pidd=mYxTQseE7vDB4A@mail.gmail.com>
Subject: Re: [PATCH 25/34] KVM: selftests: Add helpers to convert guest memory
 b/w private and shared
To: Sean Christopherson <seanjc@google.com>
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Wang <wei.w.wang@intel.com>, Vlastimil Babka <vbabka@suse.cz>, Yu Zhang <yu.c.zhang@linux.intel.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Albert Ou <aou@eecs.berkeley.edu>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, Isaku Yamahata <isaku.yamahata@intel.com>, Christian Brauner <brauner@kernel.org>, Quentin Perret <qperret@google.com>, Liam Merwick <liam.merwick@oracl
 e.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, David Matlack <dmatlack@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, Xu Yilun <yilun.xu@intel.com>, Anish Moorthy <amoorthy@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Nov 6, 2023 at 4:13=E2=80=AFPM Sean Christopherson <seanjc@google.c=
om> wrote:
>
> On Mon, Nov 06, 2023, Fuad Tabba wrote:
> > On Sun, Nov 5, 2023 at 4:34=E2=80=AFPM Paolo Bonzini <pbonzini@redhat.c=
om> wrote:
> > > +void vm_guest_mem_fallocate(struct kvm_vm *vm, uint64_t base, uint64=
_t size,
> > > +                           bool punch_hole)
> > > +{
> > > +       const int mode =3D FALLOC_FL_KEEP_SIZE | (punch_hole ? FALLOC=
_FL_PUNCH_HOLE : 0);
> > > +       struct userspace_mem_region *region;
> > > +       uint64_t end =3D base + size;
> > > +       uint64_t gpa, len;
> > > +       off_t fd_offset;
> > > +       int ret;
> > > +
> > > +       for (gpa =3D base; gpa < end; gpa +=3D len) {
> > > +               uint64_t offset;
> > > +
> > > +               region =3D userspace_mem_region_find(vm, gpa, gpa);
> > > +               TEST_ASSERT(region && region->region.flags & KVM_MEM_=
GUEST_MEMFD,
> > > +                           "Private memory region not found for GPA =
0x%lx", gpa);
> > > +
> > > +               offset =3D (gpa - region->region.guest_phys_addr);
> >
> > nit: why the parentheses?
>
> I simply forgot to remove them when I changed the function to support spa=
nning
> multiple memslots, i.e. when the code went from this
>
>         fd_offset =3D region->region.gmem_offset +
>                     (gpa - region->region.guest_phys_addr);
>
> to what you see above.

I wasn't actually expecting an answer, but I literally _did_ ask for it :)

Thanks,
/fuad
