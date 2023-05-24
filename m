Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C766A710240
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 May 2023 03:18:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QRVYr54Bsz3cCW
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 May 2023 11:18:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Oyc7VO+I;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::130; helo=mail-lf1-x130.google.com; envelope-from=doru.iorgulescu1@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Oyc7VO+I;
	dkim-atps=neutral
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QRF8Q6FQkz3bcv
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 May 2023 01:14:14 +1000 (AEST)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-4f3a99b9177so1068175e87.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 May 2023 08:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684941245; x=1687533245;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=u1K+UlFLN01myeQ16ErMnsg0Xg53+3BwWP9ANS2dQpk=;
        b=Oyc7VO+IVo96U/3R6Cvccq+1e4cHs0PMXxYqS++8mmF9v5Jt/h9vFoGEuDO7RfPHqV
         dypx6DJFpgk6oY7HgL4XmZ2OKqYJjPJSb8xJy2ty1b5oneO1iiCvbZBZSM5XJ/GUCZ4n
         LuFk9gt1DHQU+hdKJgyzyvJV7Uw1PjHH1XVLAvwqG1OTOR1+k5YdtybchVbKGb9EUyTy
         RnM+i7RUtv6lREViDjQx3vFXtR3qfCVv/s7LVFnLCFAmCrAQ4e4uC3BZFljjWNvR/3u1
         0gUj4a1ix6DoMZqnN9d6n2KdJBl/goA3i3mJynQ4vyA4VB1CEiy887EGF6Kz4dw90+Wz
         oIjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684941246; x=1687533246;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u1K+UlFLN01myeQ16ErMnsg0Xg53+3BwWP9ANS2dQpk=;
        b=QaaKqXQ0mQUMUOxToF6p8sykGwLQBP8xzc1WcLufnIXHr0IC5IHBdPmqjR98GxfeCk
         0Rk9v15FSHil6N0OQ9hH6VGKNzBLFku0DBFO90mYOlfoQfZsfs3RS6Vje6CdxFiFbaxl
         PNj/9Cubgxzg7sz0EYq6l5YjP3XWUk9nVm5ah9YpoPcdIsmU3/uxPTgYEzjOHNsg45Kp
         Kvmpk6pLzS506SXps76Qo0CM0y2d5YRUc65Dt48E/0jTSCk3QycvRdhrFBbEi2bmwQE5
         JuMmPLm/LGZwCcGQgEZ5uCn7E61x8a5teelXmqaNtA1ZDI974QW5qpcl+0MRpz3GMsKw
         KcDw==
X-Gm-Message-State: AC+VfDySP8R3t5jVSYvCjgafkdgBhFf2TEtQBh4NC4NyTjLuspIqE18l
	LqamBs7uK5MKaACKYy6sgv/Qvho4ksW9hDGnkTg=
X-Google-Smtp-Source: ACHHUZ4PshyxkR9bCGCE/ATs/SAyScU3Lg8X7XlN49gWYJyNhV8OxQJuISFfi5K5ZGvDk1Wk/W5JAPlI5oWms0HJmTI=
X-Received: by 2002:a2e:b007:0:b0:298:acea:d261 with SMTP id
 y7-20020a2eb007000000b00298acead261mr37564ljk.21.1684941245162; Wed, 24 May
 2023 08:14:05 -0700 (PDT)
MIME-Version: 1.0
References: <2a1cd5e6-01f7-66f9-1f9d-c655cc3f919b@gmail.com>
 <5d22e1e9-0307-3664-8b4a-99caaaaa4315@gmail.com> <87bki9ai11.fsf@mail.lhotse>
In-Reply-To: <87bki9ai11.fsf@mail.lhotse>
From: Doru Iorgulescu <doru.iorgulescu1@gmail.com>
Date: Wed, 24 May 2023 18:13:52 +0300
Message-ID: <CA+39qUjP48n=EwqHzwdGkBE8SC-nTNZHZxEfG4r4hWC-5Bg4HA@mail.gmail.com>
Subject: Re: Fwd: ./include/linux/mmzone.h:1735:2: error: #error Allocator
 MAX_ORDER exceeds SECTION_SIZE (v6.4-rc3 build regression)
To: Michael Ellerman <mpe@ellerman.id.au>
Content-Type: multipart/alternative; boundary="00000000000062aa8e05fc71f4cb"
X-Mailman-Approved-At: Thu, 25 May 2023 11:17:11 +1000
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
Cc: Disha Goel <disgoel@linux.vnet.ibm.com>, Athira Rajeev <atrajeev@linux.vnet.ibm.com>, Linux Regressions <regressions@lists.linux.dev>, Fabiano Rosas <farosas@linux.ibm.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Linux Memory Management List <linux-mm@kvack.org>, Bagas Sanjaya <bagasdotme@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Zi Yan <ziy@nvidia.com>, Linux PowerPC <linuxppc-dev@lists.ozlabs.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--00000000000062aa8e05fc71f4cb
Content-Type: text/plain; charset="UTF-8"

Awesome, thanks!

On Wed, May 24, 2023, 6:03 PM Michael Ellerman <mpe@ellerman.id.au> wrote:

> Bagas Sanjaya <bagasdotme@gmail.com> writes:
> > On 5/24/23 17:58, Bagas Sanjaya wrote:
> >> Anyway, I'm adding it to regzbot:
> >>
> >> #regzbot introduced: 23baf831a32c04f
> https://bugzilla.kernel.org/show_bug.cgi?id=217477
> >> #regzbot title: Allocator MAX_ORDER exceeds SECTION_SIZE caused by
> MAX_ORDER redefinition
> >>
> >
> > From bugzilla [1], the reporter had successfully tried the proposed
> > kernel config fix, so:
> >
> > #regzbot resolve: reducing CONFIG_ARCH_FORCE_MAX_ORDER to 8 resolves the
> regression
>
> Should be fixed properly by:
>
>
> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20230519113806.370635-1-mpe@ellerman.id.au/
>
> Which is in powerpc-fixes as 358e526a1648.
>
> cheers
>

--00000000000062aa8e05fc71f4cb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Awesome, thanks!=C2=A0</div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, May 24, 2023, 6:03 PM Micha=
el Ellerman &lt;<a href=3D"mailto:mpe@ellerman.id.au">mpe@ellerman.id.au</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Bagas Sanjaya &lt;<a h=
ref=3D"mailto:bagasdotme@gmail.com" target=3D"_blank" rel=3D"noreferrer">ba=
gasdotme@gmail.com</a>&gt; writes:<br>
&gt; On 5/24/23 17:58, Bagas Sanjaya wrote:<br>
&gt;&gt; Anyway, I&#39;m adding it to regzbot:<br>
&gt;&gt; <br>
&gt;&gt; #regzbot introduced: 23baf831a32c04f <a href=3D"https://bugzilla.k=
ernel.org/show_bug.cgi?id=3D217477" rel=3D"noreferrer noreferrer" target=3D=
"_blank">https://bugzilla.kernel.org/show_bug.cgi?id=3D217477</a><br>
&gt;&gt; #regzbot title: Allocator MAX_ORDER exceeds SECTION_SIZE caused by=
 MAX_ORDER redefinition<br>
&gt;&gt; <br>
&gt;<br>
&gt; From bugzilla [1], the reporter had successfully tried the proposed<br=
>
&gt; kernel config fix, so:<br>
&gt;<br>
&gt; #regzbot resolve: reducing CONFIG_ARCH_FORCE_MAX_ORDER to 8 resolves t=
he regression<br>
<br>
Should be fixed properly by:<br>
<br>
<a href=3D"https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20230519=
113806.370635-1-mpe@ellerman.id.au/" rel=3D"noreferrer noreferrer" target=
=3D"_blank">https://patchwork.ozlabs.org/project/linuxppc-dev/patch/2023051=
9113806.370635-1-mpe@ellerman.id.au/</a><br>
<br>
Which is in powerpc-fixes as 358e526a1648.<br>
<br>
cheers<br>
</blockquote></div>

--00000000000062aa8e05fc71f4cb--
