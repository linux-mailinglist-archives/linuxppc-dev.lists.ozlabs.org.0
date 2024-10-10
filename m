Return-Path: <linuxppc-dev+bounces-1953-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E35A997E82
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 09:22:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPLnG0ZKZz3bnm;
	Thu, 10 Oct 2024 18:22:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.219.181
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728544962;
	cv=none; b=Ai18RAcKhjTy460zTURXiobWPUEU2ZsqD/cPRQxwbxx+w8OKFml4kQJKsO803RmJ6nW2odnSM0+Hb2G6PDGtgAHkdbDSeUWOpNAMdxq8PYtGV9Faa7nbSi7w/ZvM1pGNQTOPRjP279DtMO6cMXqqW8ZgPzj5X0Z49tc6Z9WVHkYb3pzudbu6HBokIiDu2zfYd7Xa5S3NHEILQIqFb3kLCb9takx9SzuaTbHoKI8aCqpWivtsFsy6Zueav91LPLYrsy8EmtnCsLXs4w5hkq9YEEbI7DO7gOe6KhCux6EMKjJHrHutN9alMBe3NLtlOrfRy0xKvyJ1pUXEMizxlxD8Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728544962; c=relaxed/relaxed;
	bh=7cEkDPRbXErPkgoWEGdbZCw32b468GFBk0qa08gpGWY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kO80y7kN3siIf4/EaCYei7DkadKgczpD3FG/o47djmgKp5npRxzU02d3jr5uvx66tRXoUB2lQdZbYzMeJcTBeg4Tf2/gRlckddS6g9s19QOZt3xWEIOUlijKJ6vtgBU4vuuQwP/Y7dU9Ar5hI4jnDafkbDDYMo04f/x3rZy8Y23Y+8R2/gSgoHK9/hLhaOKoNBWjLkJFsJrBqWu1das8AupzbLnEBAHLFBnbKykdT/rS0+oIcwjkhtAd1gh6iGKAhDhavOUVRWBbREkZ3I3gkQtuNUwIHXGltFzMIu26zqyNDuC6IxEpC0rFevqjSrotUhXrF6FZcvpWByCBFnasrA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass (client-ip=209.85.219.181; helo=mail-yb1-f181.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.219.181; helo=mail-yb1-f181.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPLnC6sRQz3bmY
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 18:22:39 +1100 (AEDT)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e02c4983bfaso587931276.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 00:22:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728544956; x=1729149756;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7cEkDPRbXErPkgoWEGdbZCw32b468GFBk0qa08gpGWY=;
        b=w1/YkErwAEZyvWjZOtv/lYwxxUjN3mxPiJ6d3M29sMlUr4qcMpEWo1XsqLmbF32MD6
         DV5UU7rUDSBBjdESqY3aQuVPFRDXq0Aqq2grMMabx2KHJC4/0kQvPR2jTCaXjDtvYXFI
         dcNgKp21r2D74YwvF+0SpZw7D3BlQMhCSEGUuIyQjnwZCEZYlY+fKGyuKDmMpiQhQZTu
         LdCgtPpVF9p7pm31dtaLrYovz7rFsZCBzKwXSut76chWTLxCjtC8ve7aHRzPwkdCs6Uv
         ahJsKtx4qVW+thYvKXhblA9eboasIG0z8TsCElcDZsSiOuKZ6oFYeE2AIYCOdCuf/DWf
         DCIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVN3kvVWU3LlYPX45wuhHyURtvXW+Vdqiw4VyHRc9752NE7oaL4zqlvdAiCeCpqHXChQrGtuyGMNzRWnFE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyJq86j/z1yMc7kL0PDFTpUOxbNHPR1iKbv+ruxIDPo4xBZQOr0
	mqc0kyjNCZNm09p/LXDlXaJ4KfdbUopk/cxqTogNXI/Ex4WoXOYKo7JvgmLd
X-Google-Smtp-Source: AGHT+IGm114rS75q/nqFixFUu7JmapQaKIJdCsv07VMZ1juuyUcQn2UWak4QjNV+DxfjMXvn/8G66w==
X-Received: by 2002:a05:6902:1109:b0:e29:fef:cf20 with SMTP id 3f1490d57ef6-e290fefd9b1mr494763276.29.1728544956421;
        Thu, 10 Oct 2024 00:22:36 -0700 (PDT)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e290ef5df1csm185621276.50.2024.10.10.00.22.35
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Oct 2024 00:22:35 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6e2346f164cso5962937b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 00:22:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXKLtc4HBwSHSfpkLYSm/DYNRuy0Ug3gPP0KvGgaZG1mYCAO8EQ2/EMERCubpg2dTzY8jGG2lMBvnOWIp8=@lists.ozlabs.org
X-Received: by 2002:a05:690c:60c2:b0:6b3:a6ff:7676 with SMTP id
 00721157ae682-6e3221867cemr55553697b3.3.1728544955686; Thu, 10 Oct 2024
 00:22:35 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <20241009180816.83591-1-rppt@kernel.org> <20241009180816.83591-4-rppt@kernel.org>
In-Reply-To: <20241009180816.83591-4-rppt@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 10 Oct 2024 09:22:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV9TPH+mDJvvuRO3RBYfgWRwvv1kwyr_iLNju+iumb96Q@mail.gmail.com>
Message-ID: <CAMuHMdV9TPH+mDJvvuRO3RBYfgWRwvv1kwyr_iLNju+iumb96Q@mail.gmail.com>
Subject: Re: [PATCH v5 3/8] asm-generic: introduce text-patching.h
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Andreas Larsson <andreas@gaisler.com>, 
	Andy Lutomirski <luto@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Borislav Petkov <bp@alien8.de>, Brian Cain <bcain@quicinc.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Christoph Hellwig <hch@infradead.org>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Dinh Nguyen <dinguyen@kernel.org>, Guo Ren <guoren@kernel.org>, Helge Deller <deller@gmx.de>, 
	Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Johannes Berg <johannes@sipsolutions.net>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Kent Overstreet <kent.overstreet@linux.dev>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Luis Chamberlain <mcgrof@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Michal Simek <monstr@monstr.eu>, Oleg Nesterov <oleg@redhat.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Peter Zijlstra <peterz@infradead.org>, 
	Richard Weinberger <richard@nod.at>, Russell King <linux@armlinux.org.uk>, Song Liu <song@kernel.org>, 
	Stafford Horne <shorne@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Thomas Gleixner <tglx@linutronix.de>, 
	Uladzislau Rezki <urezki@gmail.com>, Vineet Gupta <vgupta@kernel.org>, Will Deacon <will@kernel.org>, 
	bpf@vger.kernel.org, linux-alpha@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
	linux-hexagon@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-mm@kvack.org, linux-modules@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-trace-kernel@vger.kernel.org, 
	linux-um@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	loongarch@lists.linux.dev, sparclinux@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.3 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Oct 9, 2024 at 8:09=E2=80=AFPM Mike Rapoport <rppt@kernel.org> wrot=
e:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
>
> Several architectures support text patching, but they name the header
> files that declare patching functions differently.
>
> Make all such headers consistently named text-patching.h and add an empty
> header in asm-generic for architectures that do not support text patching=
.
>
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

>  arch/m68k/include/asm/Kbuild                      |  1 +

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> # m68k

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

