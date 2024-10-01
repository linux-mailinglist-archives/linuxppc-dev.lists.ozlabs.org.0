Return-Path: <linuxppc-dev+bounces-1716-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A687B98C0CE
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Oct 2024 16:54:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XJ1D83Lc0z2y7M;
	Wed,  2 Oct 2024 00:54:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::432"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727794439;
	cv=none; b=GdGJ2RZwQv7uOnfVAAGL4OSacKifXvaSDlK4eTQOKTdyqJ44PfVQUS5x3vTwN3cl00xCCD1nLEs0g5HprZiWU8M7CjEScq4el2f8ksLUFXn6X7z4br8pCWm5q9400mWdMJ21IVqE/hdO6sczHPOh2ZPFOUvmKbDpCIuLLuCMje7Nkz8i4g+z61c5Z5m8b4fk47c+L8naxdEz4MmQFGxmE47p5rLmp4ye/ZmMvkungdQth5tm7z75iIBV4zpXOh1l/QjRKKUhDXl+4gLIUF8mNTMz73f3ndznaHRnKBtjTRbdDxUww93oMKhRjH/jk8br6N1thsx8fhL1NRGZAiQ/SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727794439; c=relaxed/relaxed;
	bh=FSTnPU9v6H2GxBsNTOAiZzPo6DZqtIPh6ogHLJkD69Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a7c3U8ARYaKToBvsC6TXyENUVusN/jvcelnMUyMjgWtZDPzNg2kD58wE29Al0n4d3UwuYE0whVnlhMmZfmjylAnDQ1ciTo9PJvlgl0OtbuII2Ih4ouwH2RyoFzqhkT8pa9G+j3nEnmxo7kbG5AsrfKAgaf3eOGnlamg8fI225yewwHwtqoAnIlxuzTiCUkcHS+UgfSC+sWLQ7qT25MpAxV+8trLy1crqvoWsXNVPanWoZe/rjcBBGsgSb3M7GCRt34/j2yARMFJR0kS9knoFgGTfqsBcXvIClfP/drV+uGyPef12OgCBeCjren5UrUtOkZpZBTxIAbg098oIzjtvkw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=G9ZdfvVx; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com; envelope-from=alexei.starovoitov@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=G9ZdfvVx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com; envelope-from=alexei.starovoitov@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XJ1D701Yyz2xYl
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Oct 2024 00:53:57 +1000 (AEST)
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-37cca239886so3223422f8f.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Oct 2024 07:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727794433; x=1728399233; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FSTnPU9v6H2GxBsNTOAiZzPo6DZqtIPh6ogHLJkD69Y=;
        b=G9ZdfvVxeDehVgzy68KTbFFPa+qy1w+5oTwvuOEehs6Ot2e3hNAk/NCyk++1Nryx0J
         N0hXWXSBDHmDXwpJ0wfhc2rIP9XqBWwZdqbSZ6aYfu9dxM0viS1pkZaVbW2nBwR+DDmI
         luePUmFn4Z3WJr+NviCcT5lJZLUjSXXT7TuYg27p/j5s1R8cAHWZX0DhGQ1rrCr5MS3b
         dWWvMzz5XoujEiGjKX0MAWG5f5HLRktpv2k0jqdrpXbMDbICYLZksV+4yol9cvwoNACG
         R334J2Ub9v5EMNEqHx77+2v7M6bHWAGz9lfhx3wgdoZM7E4b+pE7YKuLWC3oB0JUopLX
         TPUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727794433; x=1728399233;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FSTnPU9v6H2GxBsNTOAiZzPo6DZqtIPh6ogHLJkD69Y=;
        b=OjwLOkYSVAd3e6dJZVfkptkqcGqVm5MNgtqCPa1NDtJ3G3NxTSRENjvV0AgZFINsvZ
         PDjWzoqkK6XqDIFsXNKmpY/ZA2E8l8nd+Y0Ro05Yb5NfNebOBstABWpIQLOCDt9rPYnC
         M1W1Uu/gKe56M9yUTLXewQEcke9OrrC0AMeLSUyEpDYAW9p9X5ZWglkVFTqEQ8SySbDe
         GKQBJJSrKf0ZA2ncXUT0EUtlnsFsm5K8Va9hg8xHSrqHvey9Q69JwVdhnnFbRdfXugU1
         3U5YSU2cbnsHIMAo3hRp7VbyzIzAOOZ/kMvOi+8NuT1BUeVV0O3y7frX0q6fleEyz6T7
         O5/Q==
X-Gm-Message-State: AOJu0Yxt1crAvoRKKjRoilR0oYKa7A5LXWXXivbMaNvPvSv2GYu4yUXF
	jCHikqtAy6DNlr+UnIH+ExHa/KTJ/6JWNgetGSzuLLB3kC/FRwYpWp+zbyOtQVjwMieTE3hDfdd
	gdR/CAn1MSeYWfdlXbxELlR26kn8=
X-Google-Smtp-Source: AGHT+IEm8GKzd4fqUPp6LAzM4CsjfnUSOgffnLlYkAgZo42PyQhxjWYeeN/iWESnCrPx+63wt9+U+2OjWQ/iO36f9Zg=
X-Received: by 2002:a05:6000:e42:b0:37c:d2d2:7f5a with SMTP id
 ffacd0b85a97d-37cd5aef979mr6359211f8f.32.1727794433399; Tue, 01 Oct 2024
 07:53:53 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <20240915205648.830121-1-hbathini@linux.ibm.com>
 <20240915205648.830121-18-hbathini@linux.ibm.com> <CAADnVQL60XXW95tgwKn3kVgSQAN7gr1STy=APuO1xQD7mz-aXA@mail.gmail.com>
 <32249e74-633d-4757-8931-742b682a63d3@linux.ibm.com> <CAADnVQKfSH_zkP0-TwOB_BLxCBH9efot9mk03uRuooCTMmWnWA@mail.gmail.com>
 <7afc9cc7-95cd-45c7-b748-28040206d9a0@linux.ibm.com>
In-Reply-To: <7afc9cc7-95cd-45c7-b748-28040206d9a0@linux.ibm.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 1 Oct 2024 07:53:42 -0700
Message-ID: <CAADnVQJjqnSVqq2n70-uqfrYRHH3n=5s9=t3D2AMooxxAHYfJQ@mail.gmail.com>
Subject: Re: [PATCH v5 17/17] powerpc64/bpf: Add support for bpf trampolines
To: Hari Bathini <hbathini@linux.ibm.com>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, bpf <bpf@vger.kernel.org>, 
	linux-trace-kernel <linux-trace-kernel@vger.kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	"Naveen N. Rao" <naveen@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Daniel Borkmann <daniel@iogearbox.net>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nicholas Piggin <npiggin@gmail.com>, Alexei Starovoitov <ast@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Andrii Nakryiko <andrii@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Vishal Chourasia <vishalc@linux.ibm.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Oct 1, 2024 at 12:18=E2=80=AFAM Hari Bathini <hbathini@linux.ibm.co=
m> wrote:
>
>
>
> On 30/09/24 6:25 pm, Alexei Starovoitov wrote:
> > On Sun, Sep 29, 2024 at 10:33=E2=80=AFPM Hari Bathini <hbathini@linux.i=
bm.com> wrote:
> >>
> >>
> >>
> >> On 17/09/24 1:20 pm, Alexei Starovoitov wrote:
> >>> On Sun, Sep 15, 2024 at 10:58=E2=80=AFPM Hari Bathini <hbathini@linux=
.ibm.com> wrote:
> >>>>
> >>>> +
> >>>> +       /*
> >>>> +        * Generated stack layout:
> >>>> +        *
> >>>> +        * func prev back chain         [ back chain        ]
> >>>> +        *                              [                   ]
> >>>> +        * bpf prog redzone/tailcallcnt [ ...               ] 64 byt=
es (64-bit powerpc)
> >>>> +        *                              [                   ] --
> >>> ...
> >>>> +
> >>>> +       /* Dummy frame size for proper unwind - includes 64-bytes re=
d zone for 64-bit powerpc */
> >>>> +       bpf_dummy_frame_size =3D STACK_FRAME_MIN_SIZE + 64;
> >>>
> >>> What is the goal of such a large "red zone" ?
> >>> The kernel stack is a limited resource.
> >>> Why reserve 64 bytes ?
> >>> tail call cnt can probably be optional as well.
> >>
> >> Hi Alexei, thanks for reviewing.
> >> FWIW, the redzone on ppc64 is 288 bytes. BPF JIT for ppc64 was using
> >> a redzone of 80 bytes since tailcall support was introduced [1].
> >> It came down to 64 bytes thanks to [2]. The red zone is being used
> >> to save NVRs and tail call count when a stack is not setup. I do
> >> agree that we should look at optimizing it further. Do you think
> >> the optimization should go as part of PPC64 trampoline enablement
> >> being done here or should that be taken up as a separate item, maybe?
> >
> > The follow up is fine.
> > It just odd to me that we currently have:
> >
> > [   unused red zone ] 208 bytes protected
> >
> > I simply don't understand why we need to waste this much stack space.
> > Why can't it be zero today ?
> >
>
> The ABI for ppc64 has a redzone of 288 bytes below the current
> stack pointer that can be used as a scratch area until a new
> stack frame is created. So, no wastage of stack space as such.
> It is just red zone that can be used before a new stack frame
> is created. The comment there is only to show how redzone is
> being used in ppc64 BPF JIT. I think the confusion is with the
> mention of "208 bytes" as protected. As not all of that scratch
> area is used, it mentions the remaining as unused. Essentially
> 288 bytes below current stack pointer is protected from debuggers
> and interrupt code (red zone). Note that it should be 224 bytes
> of unused red zone instead of 208 bytes as red zone usage in
> ppc64 BPF JIT come down from 80 bytes to 64 bytes since [2].
> Hope that clears the misunderstanding..

I see. That makes sense. So it's similar to amd64 red zone,
but there we have an issue with irqs, hence the kernel is
compiled with -mno-red-zone.

I guess ppc always has a different interrupt stack and
it's not an issue?

