Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 454FC94B5DE
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 06:20:11 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=WokKS4L0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WfYjj1M8Jz3dK3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 14:20:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=WokKS4L0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::535; helo=mail-ed1-x535.google.com; envelope-from=jeffxu@google.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WfYj203f3z3cRK
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Aug 2024 14:19:33 +1000 (AEST)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5b9fe5ea355so8947a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Aug 2024 21:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723090771; x=1723695571; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KZk32ybyfJysMKEtVNqzsqnpkLDPdzMxBTy2Khfhbdc=;
        b=WokKS4L0zDqfcupl1g72BdVgzwmX8tbY/az5LX3UxMDJscKj7uhVrv2+IdnTvkNms5
         7Fbci7ZXy19YyI+8LeakoJGaFgeffAjtUmA47J8YBOrTrRSFZG34SIY0aSSbOR6bp6iG
         RGuH5Sa6C4bqu/u+BPQa1SKJN5ujkcaWhjGDBwxKpXOwOJBjr2Dupf8x3bl5bOMkIkeF
         f5CoZkEw5qfnAlOX0vsEiHRzFW962BXBiJQrK1Y0N6KetIn9/KNaxZJ5gXr9m9Wz7Ps7
         8Ci/BvZUO74cKEznwQ5dsg6qsMa/SHPS/FvqRIM1jPgHMVunC0NoUB506PKrsjr6elUl
         AIdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723090771; x=1723695571;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KZk32ybyfJysMKEtVNqzsqnpkLDPdzMxBTy2Khfhbdc=;
        b=fVZLd3HS4nhda3ndgmtgeHI7+RbafrcA5ezBEMV9v7dRDuhQk76e/Hx9KvEiN0iWCx
         4ALe5FAMIW4bm3yk+8bIgYTYChleMSt7tRJ4Fgp/gcPGRcglmmqAm8zEG+2wtrelNRKn
         ZmsXNnHbMj+VNmjz29UQ89GaYioLuU1HSMY1iU7J9bIpgkTm7a/kINSxXnqGIcidgSsj
         8RXObovIJVrADzbup0vtd8mJLdqzOpiucTPbMLOm7COI5lf1wqvgRN0y9JrKpos/NjgM
         7m3rwGlSheUg3hGomQlCxs8S37Qp+TgHsd97zWyo8gnxv6tQPaXNICZ0YxnFHAj5HS8v
         dA3w==
X-Forwarded-Encrypted: i=1; AJvYcCWipoMBEWqypTecd3VoBTwDXaqdERnqgCmYdqqgMYdRQuo7Tzf6TMpfWk3bytwjAlMN4XH60bjOM4WkWE1Y8KnCZ7RiHHaeSxbXyDIpOw==
X-Gm-Message-State: AOJu0Yy/xWAAloryJAkL58adklDwZeTABDYfcMea3jobMuowYitEPa0K
	8Z7uG0abKr25Z6dKkACxoZ4WyuVQ8bDb87NNmwo8lNcf16Sz9RohP4r8b02vr3+QsETgGP8BDBw
	7/S2ZohsdpOgqww31spAykFPazAXeVI5/PTYp
X-Google-Smtp-Source: AGHT+IF9wTii9sNrIpFz5Knt/ZVxdahDtVUqVqQHwq/Pqk7lkKg6jGof3hX1jcw49iQTUZ6TDfAFMIp6ZsF+LfSrOK0=
X-Received: by 2002:a05:6402:51d0:b0:58b:90c6:c59e with SMTP id
 4fb4d7f45d1cf-5bbb179a00cmr59759a12.7.1723090770367; Wed, 07 Aug 2024
 21:19:30 -0700 (PDT)
MIME-Version: 1.0
References: <20240807124103.85644-1-mpe@ellerman.id.au> <20240807124103.85644-2-mpe@ellerman.id.au>
 <CALmYWFsCrMxkA1v58fJxtyGR15ZGxmSP8x7QC=oeKwzcwGL76A@mail.gmail.com>
 <gtz7s4eyzydaomh2msvfhpemhiruexy53nutd3fwumqfpos7v5@4fnqun2olore>
 <CALmYWFvqoxyBf4iP7WPTU_Oxq_zpRzvaBOWoHc4n4EwQTYhyBA@mail.gmail.com>
 <babup6k7qh5ii5avcvtz2rqo4n2mzh2wjbbgk5xeuivfypqnuc@2gydsfao3w7b>
 <CALmYWFsAT+Cb37-cSTykc_P7bJDHmFa7mWD5+B1pEz73thchcQ@mail.gmail.com>
 <lhe2mky6ahlk2jzvvfjyongqiseelyx2uy7sbyuso6jcy3b2dq@7ju6cea62jgk> <CAHk-=wgTXVMBRuya5J0peujSrtunehRtzk=WVrm6njPhHrpTJw@mail.gmail.com>
In-Reply-To: <CAHk-=wgTXVMBRuya5J0peujSrtunehRtzk=WVrm6njPhHrpTJw@mail.gmail.com>
From: Jeff Xu <jeffxu@google.com>
Date: Wed, 7 Aug 2024 21:18:52 -0700
Message-ID: <CALmYWFvtXXi9YMH8jwyWcOwPwZ0+PeCrP2QyJBBK8ExXiYa+Tw@mail.gmail.com>
Subject: Re: [PATCH 2/4] powerpc/mm: Handle VDSO unmapping via close() rather
 than arch_unmap()
To: Linus Torvalds <torvalds@linux-foundation.org>
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
Cc: Kees Cook <keescook@chromium.org>, jeffxu@chromium.org, npiggin@gmail.com, linux-kernel@vger.kernel.org, christophe.leroy@csgroup.eu, linux-mm@kvack.org, oliver.sang@intel.com, "Liam R. Howlett" <Liam.Howlett@oracle.com>, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, pedro.falcato@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Aug 7, 2024 at 8:21=E2=80=AFPM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Wed, 7 Aug 2024 at 16:20, Liam R. Howlett <Liam.Howlett@oracle.com> wr=
ote:
> >
> > Okay, I'm going to try one more time here.  You are suggesting to have =
a
> > conf flag to leave the vdso pointer unchanged when it is unmapped.
> > Having the close behind the conf option will not prevent it from being
> > unmapped or mapped over, so what you are suggesting is have a
> > configuration option that leaves a pointer, mm->context.vdso, to be
> > unsafe if it is unmapped if you disable checkpoint restore.
>
> We definitely do not want that kind of complexity. It makes the kernel
> just more complicated to have to deal with both cases.
>
> That said, I don't love how special powerpc is here.
>
> What we could do is to is
>
>  - stop calling these things "special mappings", and just admit that
> it's for different vdso mappings and nothing else (for some odd reason
> arm and nios2 calls it a "kuser helper" rather than vdso, but it's the
> exact same thing)
>
>  - don't do this whole indirect function pointer thing with mremap and
> close at all, and just do this all unapologetically and for all
> architectures in the generic VM layer together with "if (vma->vm_start
> =3D=3D mm->context.vdso)" etc.
>
> that would get rid of the conceptual complexity of having different
> architectures doing different things (and the unnecessary overhead of
> having an indirect function pointer that just points to one single
> thing).
>
> But I think the current "clean up the existing mess" is probably the
> less invasive one over "make the existing mess be explicitly about
> vdso and avoid unnecessary per-architecture differences".
>
> If people want to, we can do the unification (and stop pretending the
> "special mappings" could be something else) later.

OK. Now this is clear to me (at last).

Treating vdso mapping, (maybe all the special mappings) as normal
mapping and handling mmap/mremap/munmap properly from userspace will
indeed make things clear conceptually. I'm OK with doing this later
since it is a big change.

Thanks
-Jeff

>
>          Linus
