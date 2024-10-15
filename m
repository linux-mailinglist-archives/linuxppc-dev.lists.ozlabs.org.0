Return-Path: <linuxppc-dev+bounces-2264-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E8499DC8D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Oct 2024 05:04:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XSJqG13t2z3c2v;
	Tue, 15 Oct 2024 14:04:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728961482;
	cv=none; b=DZoXeZKeY2uP2vcewJTBBT8Ltm35e6duj6XBrHpN6YcbXeM0mJ3as5BHJYUYmSy/nRRQWMNUfgXhQ/0879hc/Kkohpfjng9MavG/trJfVz4VlmZlqNTtEQXHZx2epmnrGsQr+pFWFiqdSkr7cRjyMAwmPhBHUtAMLfYReSa2/Q1LTVMBU2B1qcXa095MPZiCE/BggJ6ApW3aH0Pm1N/NoA3tM7I/x6IZCCVopDXunIOFaZ0YIDpQkMEdLI0xh5haALGCZym5ptSz9aLsXAb0OM33JBP4aB/20ztk1kko5vtqVbKQN5DEvUyvmrFQrI1hqEHY7COlSYXF23paufLAew==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728961482; c=relaxed/relaxed;
	bh=2LILJl12FRTprkZPDsnRty3i0K05AFLZzsWu9wwpXxI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CGdVha7w+teUHRR9PkDpeP3L0QqQd4+5jJKRgyvehTeqOLyCKKZahw87HIOD0xO2KryL4ej8MVcbKGFbCXswpA5iMRJYr9mubtGUE+0G4BH8OiUXHYf5uOa9TEanBXwVT5IePWHgcAb5LyRKCH6eJ4xgi0cmdBCe04vKroLi54RfLfldhyWUdf/S0hJa7SAsRCnrR7ebif3mKZGphZ4EDr3qWtcmqDpvjdjcA2oYpuTBRonVW3gwmpb6jF2hI7dFw9hyolLidMyhpjj4wzY0qf0x5AItYlB44i1MBUpdPLmIdArkUx45u6eFiFMAIWE911x77n8jXnG+gwvsvaWsWA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Him/c0js; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=W4vXV/mG; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=piliu@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Him/c0js;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=W4vXV/mG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=piliu@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XSJqD59gZz2yGY
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Oct 2024 14:04:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728961474;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2LILJl12FRTprkZPDsnRty3i0K05AFLZzsWu9wwpXxI=;
	b=Him/c0jsL8CUmV1MJxP6pba9WywmnC17cRbgZob/DKRUjJLioRs1rzGByjes37SgyCEBo4
	yHLjTcTjjVq0SoPOEdlK+EpG+DPEt5Za1V3BgUvO6szv3I6TmA1BUyqukJROjRlUrqgH3C
	X+NCdBRjxhPecXkXpzf5y3T3Keq8LAY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728961475;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2LILJl12FRTprkZPDsnRty3i0K05AFLZzsWu9wwpXxI=;
	b=W4vXV/mGqJdFIKM9c0I+acEbxUYOvAD18Cp9zN7xvHOXFiEgcHdO87Np1ea1kGd+8r3/7e
	tPP02gH33o/DctrNJS7xzJXpadgVcZ+z4PCjUqe6rKQcJI1euRYGT3auYoM9DOrb4XSjqD
	sT66jvG4sw0LsbWYh6rWGbXG1WubbKg=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-101-CpMKh6-sOD6oIOjy9jUxvQ-1; Mon, 14 Oct 2024 23:04:33 -0400
X-MC-Unique: CpMKh6-sOD6oIOjy9jUxvQ-1
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7b111381632so940882785a.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2024 20:04:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728961472; x=1729566272;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2LILJl12FRTprkZPDsnRty3i0K05AFLZzsWu9wwpXxI=;
        b=IZNukmcM9iKvi3QLY2jSf50g/HdZJhYR5MHoRupTia4TEYdBghBItyGtOOCQzQb+fC
         LgryFdVg9fyl3W5j7IzH4eyWEBjo2VMW89O+oBVRGjyLamVlxr8CusGR0qeqGwzssTMu
         9iuAoDs3gvX5orTWBUzT5owTxZ8IGT5KqwleLNSjuIHpeCAG+xnMGjeKgyLT0bzhmCpZ
         T3gFI8q90FofDq9gRx6QnRG/HvJ9Mz2qSdETGujG2JjMLMPyZKr9EoX0vemjDjmjmaey
         AtMlMgFlEz0/jw1UGHNv3JTTyhoie+KheKwLb2gBaIKl7ERN4OVhqnfk6zuoAyOVUgdc
         8wpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEUPoqZQw41akrhpRtsAflWxnU0dKXQQ3T/KJu7/3ehq9YS0Z4XGfMdNeJybxQScVVBV/onuTFKuEfH60=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxf4nRlsTSCcdoxFJjSaL+XX6YqtYAgimO7D75mgi695QPWpORt
	pjmHfzpR/u6J91b/UaB2NEg8bYKCIiWkh2JIjhQMaRl9z5AFaWqpVcZwocZa/xsVPewtEM0YI/4
	KO/QMaLZdwXSAD/64IinW1m3Ch8mEBA/yXtDquCmON27X9YGpd5FAXqWuEaLkiu9Qz4a1OCnSf/
	kB3DhKbVZsTDQ+BrYOexJT3z7FzhUux5ThsNJ7cw==
X-Received: by 2002:a05:6214:5347:b0:6cb:e9eb:1b24 with SMTP id 6a1803df08f44-6cbeff63948mr208010486d6.24.1728961472404;
        Mon, 14 Oct 2024 20:04:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGp3T4Yepy5h5DQueUeaIl2hWfHF7EpApBAxl9jBnWIq5Z+upYe1XYSqd8+UMzLGOwXgyDg2kobb+ggSdFvo7w=
X-Received: by 2002:a05:6214:5347:b0:6cb:e9eb:1b24 with SMTP id
 6a1803df08f44-6cbeff63948mr208010076d6.24.1728961472016; Mon, 14 Oct 2024
 20:04:32 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <20241014105514.3206191-1-ryan.roberts@arm.com>
 <20241014105912.3207374-1-ryan.roberts@arm.com> <Zw0iegwMp5ZVGypy@fedora> <9b7e4f65-a171-4574-bd53-580e79527fbc@arm.com>
In-Reply-To: <9b7e4f65-a171-4574-bd53-580e79527fbc@arm.com>
From: Pingfan Liu <piliu@redhat.com>
Date: Tue, 15 Oct 2024 11:04:21 +0800
Message-ID: <CAF+s44QbdPBN-8EcPiWiZgYgZY4v8RK-wA0VEaVXbfnc9_HQ9Q@mail.gmail.com>
Subject: Re: [RFC PATCH v1 01/57] mm: Add macros ahead of supporting boot-time
 page size selection
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: "David S. Miller" <davem@davemloft.net>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	Andreas Larsson <andreas@gaisler.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Chris Zankel <chris@zankel.net>, 
	Dave Hansen <dave.hansen@linux.intel.com>, David Hildenbrand <david@redhat.com>, 
	Dinh Nguyen <dinguyen@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Greg Marsden <greg.marsden@oracle.com>, Helge Deller <deller@gmx.de>, 
	Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Ivan Ivanov <ivan.ivanov@suse.com>, Johannes Berg <johannes@sipsolutions.net>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Jonas Bonn <jonas@southpole.se>, 
	Kalesh Singh <kaleshsingh@google.com>, Marc Zyngier <maz@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <mbrugger@suse.com>, 
	Max Filippov <jcmvbkbc@gmail.com>, Miroslav Benes <mbenes@suse.cz>, Rich Felker <dalias@libc.org>, 
	Richard Weinberger <richard@nod.at>, Stafford Horne <shorne@gmail.com>, 
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Thomas Gleixner <tglx@linutronix.de>, 
	Will Deacon <will@kernel.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, x86@kernel.org, 
	linux-alpha@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
	linux-hexagon@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-mm@kvack.org, linux-openrisc@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
	sparclinux@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Oct 14, 2024 at 10:07=E2=80=AFPM Ryan Roberts <ryan.roberts@arm.com=
> wrote:
>
> On 14/10/2024 14:54, Pingfan Liu wrote:
> > Hello Ryan,
> >
> > On Mon, Oct 14, 2024 at 11:58:08AM +0100, Ryan Roberts wrote:
> >> arm64 can support multiple base page sizes. Instead of selecting a pag=
e
> >> size at compile time, as is done today, we will make it possible to
> >> select the desired page size on the command line.
> >>
> >> In this case PAGE_SHIFT and it's derivatives, PAGE_SIZE and PAGE_MASK
> >> (as well as a number of other macros related to or derived from
> >> PAGE_SHIFT, but I'm not worrying about those yet), are no longer
> >> compile-time constants. So the code base needs to cope with that.
> >>
> >> As a first step, introduce MIN and MAX variants of these macros, which
> >> express the range of possible page sizes. These are always compile-tim=
e
> >> constants and can be used in many places where PAGE_[SHIFT|SIZE|MASK]
> >> were previously used where a compile-time constant is required.
> >> (Subsequent patches will do that conversion work). When the arch/build
> >> doesn't support boot-time page size selection, the MIN and MAX variant=
s
> >> are equal and everything resolves as it did previously.
> >>
> >
> > MIN and MAX appear to construct a boundary, but it may be not enough.
> > Please see the following comment inline.
> >
> >> Additionally, introduce DEFINE_GLOBAL_PAGE_SIZE_VAR[_CONST]() which wr=
ap
> >> global variable defintions so that for boot-time page size selection
> >> builds, the variable being wrapped is initialized at boot-time, instea=
d
> >> of compile-time. This is done by defining a function to do the
> >> assignment, which has the "constructor" attribute. Constructor is
> >> preferred over initcall, because when compiling a module, the module i=
s
> >> limited to a single initcall but constructors are unlimited. For
> >> built-in code, constructors are now called earlier to guarrantee that
> >> the variables are initialized by the time they are used. Any arch that
> >> wants to enable boot-time page size selection will need to select
> >> CONFIG_CONSTRUCTORS.
> >>
> >> These new macros need to be available anywhere PAGE_SHIFT and friends
> >> are available. Those are defined via asm/page.h (although some arches
> >> have a sub-include that defines them). Unfortunately there is no
> >> reliable asm-generic header we can easily piggy-back on, so let's defi=
ne
> >> a new one, pgtable-geometry.h, which we include near where each arch
> >> defines PAGE_SHIFT. Ugh.
> >>
> >> -------
> >>
> >> Most of the problems that need to be solved over the next few patches
> >> fall into these broad categories, which are all solved with the help o=
f
> >> these new macros:
> >>
> >> 1. Assignment of values derived from PAGE_SIZE in global variables
> >>
> >>   For boot-time page size builds, we must defer the initialization of
> >>   these variables until boot-time, when the page size is known. See
> >>   DEFINE_GLOBAL_PAGE_SIZE_VAR[_CONST]() as described above.
> >>
> >> 2. Define static storage in units related to PAGE_SIZE
> >>
> >>   This static storage will be defined according to PAGE_SIZE_MAX.
> >>
> >> 3. Define size of struct so that it is related to PAGE_SIZE
> >>
> >>   The struct often contains an array that is sized to fill the page. I=
n
> >>   this case, use a flexible array with dynamic allocation. In other
> >>   cases, the struct fits exactly over a page, which is a header (e.g.
> >>   swap file header). In this case, remove the padding, and manually
> >>   determine the struct pointer within the page.
> >>
> >
> > About two years ago, I tried to do similar thing in your series, but ra=
n
> > into problem at this point, or maybe not exactly as the point you list
> > here. I consider this as the most challenged part.
> >
> > The scenario is
> > struct X {
> >       a[size_a];
> >       b[size_b];
> >       c;
> > };
> >
> > Where size_a =3D f(PAGE_SHIFT), size_b=3Dg(PAGE_SHIFT). One of f() and =
g()
> > is proportional to PAGE_SHIFT, the other is inversely proportional.
> >
> > How can you fix the reference of X.a and X.b?
>
> If you need to allocate static memory, then in this scenario, assuming f(=
) is
> proportional and g() is inversely-proportional, then I guess you need
> size_a=3Df(PAGE_SIZE_MAX) and size_b=3Dg(PAGE_SIZE_MIN). Or if you can al=
locate the

My point is that such stuff can not be handled by scripts
automatically and needs manual intervention.

> memory dynamically, then make a and b pointers to dynamically allocated b=
uffers.
>

This seems a better way out.

> Is there a specific place in the source where this pattern is used today?=
 It
> might be easier to discuss in the context of the code if so.
>

No such code at hand. Just throw out the potential issue and be
curious about it which frustrates me.
I hope people can reach an agreement on it and turn this useful series
into reality.

Thanks,

Pingfan


