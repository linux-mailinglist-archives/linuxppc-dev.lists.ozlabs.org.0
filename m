Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63AF87E65CD
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Nov 2023 09:56:27 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=OYyYjvj5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SQwmT2L7Gz3cHH
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Nov 2023 19:56:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=OYyYjvj5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::92f; helo=mail-ua1-x92f.google.com; envelope-from=tabba@google.com; receiver=lists.ozlabs.org)
Received: from mail-ua1-x92f.google.com (mail-ua1-x92f.google.com [IPv6:2607:f8b0:4864:20::92f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SQwld4g4Qz2yVZ
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Nov 2023 19:55:40 +1100 (AEDT)
Received: by mail-ua1-x92f.google.com with SMTP id a1e0cc1a2514c-7b625ed7208so224696241.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Nov 2023 00:55:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1699520132; x=1700124932; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LW/Fx883nWIRZKyM7HAb/UStNZnvbG60FpXDwf7xK7Y=;
        b=OYyYjvj5i8PTXtTHrv6zw9HyTqA2FVpegal8BP9XrRYHohLOSGZTQBw28jT6cI9di2
         LFb5S85GMFCnIcTBLptLPdmYDXZ2ML6GYgNMJIX6Iwq0TDylbT5Rt8vBsSmb1WC5bbTA
         jK3jplCUdKUX3x1jQZVb3ZkhuFbKNJ+Dn6QWOryzLE5nMXDn27Pcupv4IXxK6naqNixb
         1MYs/7YjZzVV2vtFGNEuj+d9V03nfhHwL6rw4KYj3/kynT89LNov2QIs0wpS+AkIyql/
         9t1s4qad0MGM05YxADN6DdItBQ95uhJZoNV9zIT9ohcILOudDEKs+RPoZ01hQEY+Istg
         BgGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699520132; x=1700124932;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LW/Fx883nWIRZKyM7HAb/UStNZnvbG60FpXDwf7xK7Y=;
        b=jf+XQhRPDd7QNk3TS4dmxvJLqJCt+08Yo7D7rG67jTVa/z7Mypea9V6QPItLx+ESUh
         hcxcG0MronBa/GuUBs5J4D+qVWu9TrcFmo8BzYJGTzCtGsM42fHwjLJOr8jv87cA3N02
         HsykSMUCT3P7gHZKDnWDCmCq4lW0aMMOL3qrOsQ+pnR21NMWZp8dvH0pTM+0++0FunSG
         eGm25thPxSxoaFWkVVH2kMlIWTFjy3UC3raDnP+ohnxxBfhmibqxluRNuarXmneAfeEY
         FmSKh68apGTlERXlbIX6YahGFeEa7IGRHMQ3dC/PkEzl6y97JnUNC0wvD6PpvGwthF9Z
         bFbw==
X-Gm-Message-State: AOJu0YzWldfvxh3aT5rl9jt1hODIRL5NtVLKX8Rrzjmj1J8iNDSDc8wB
	/j0OiwWzPRHCKj0litZ8mCkcNqwEML2oO+J5NLVsBQ==
X-Google-Smtp-Source: AGHT+IFw1OMfZ7dogx5GHZ5PY3FJDFYi1Xj9fX4uGT6v90sIMw1YGf7XiATC8vKEmYII9um0nqZKnx8f2F+kXqvVgVE=
X-Received: by 2002:a67:c282:0:b0:45f:65e9:f070 with SMTP id
 k2-20020a67c282000000b0045f65e9f070mr3952209vsj.12.1699520132149; Thu, 09 Nov
 2023 00:55:32 -0800 (PST)
MIME-Version: 1.0
References: <20231105163040.14904-1-pbonzini@redhat.com> <20231105163040.14904-35-pbonzini@redhat.com>
 <CAF7b7mpmuYLTY6OQfRRoOryfO-2e1ZumQ6SCQDHHPD5XFyhFTQ@mail.gmail.com>
In-Reply-To: <CAF7b7mpmuYLTY6OQfRRoOryfO-2e1ZumQ6SCQDHHPD5XFyhFTQ@mail.gmail.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 9 Nov 2023 08:54:55 +0000
Message-ID: <CA+EHjTxxBUHX9Rg=vZ-UTWHUPKf0ujTsOsynueG7JAMt=GZQ0A@mail.gmail.com>
Subject: Re: [PATCH 34/34] KVM: selftests: Add a memory region subtest to
 validate invalid flags
To: Anish Moorthy <amoorthy@google.com>
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Wang <wei.w.wang@intel.com>, Vlastimil Babka <vbabka@suse.cz>, Yu Zhang <yu.c.zhang@linux.intel.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Albert Ou <aou@eecs.berkeley.edu>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, Isaku Yamahata <isaku.yamahata@intel.com>, Christian Brauner <brauner@kernel.org>, Quentin Perret <qperret@google.com>, Sean Christopherson <seanjc@goog
 le.com>, Liam Merwick <liam.merwick@oracle.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, David Matlack <dmatlack@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, Xu Yilun <yilun.xu@intel.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Anish,

On Thu, Nov 9, 2023 at 1:08=E2=80=AFAM Anish Moorthy <amoorthy@google.com> =
wrote:
>
> Applying [1] and [2] reveals that this also breaks non-x86 builds- the
> MEM_REGION_GPA/SLOT definitions are guarded behind an #ifdef
> __x86_64__, while the usages introduced here aren't.
>
> Should
>
> On Sun, Nov 5, 2023 at 8:35=E2=80=AFAM Paolo Bonzini <pbonzini@redhat.com=
> wrote:
> >
> > +       test_invalid_memory_region_flags();
>
> be #ifdef'd, perhaps? I'm not quite sure what the intent is.
>
> Side note: I wasn't able to get [2] to apply by copy-pasting the diff
> and trying "git apply", and that was after checking out the relevant
> commit. Eventually I just did it manually. If anyone can successfully
> apply it, please let me know what you did so I can see what I was
> doing wrong :)

For me I applied the whole series as follows:

Checkout kvm-x86-next-2023.11.01 (45b890f7689e) from
https://github.com/kvm-x86/linux.git . Then use b4:
b4 am -o -  20231105163040.14904-1-pbonzini@redhat.com  | git am -3

Cheers,
/fuad

>
> [1] https://lore.kernel.org/kvm/20231108233723.3380042-1-amoorthy@google.=
com/
> [2] https://lore.kernel.org/kvm/affca7a8-116e-4b0f-9edf-6cdc05ba65ca@redh=
at.com/
