Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E2394B58D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 05:38:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=vSlY1AM5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WfXnP0Mg8z3dKb
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 13:38:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=vSlY1AM5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::535; helo=mail-ed1-x535.google.com; envelope-from=jeffxu@google.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WfXmj05C7z2y8l
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Aug 2024 13:37:40 +1000 (AEST)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5a18a5dbb23so5446a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Aug 2024 20:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723088256; x=1723693056; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Em4gw4SlTGWJuwGRtZ6+lH6AITpuWoqignfU36p6K4E=;
        b=vSlY1AM5/vF35hGAnV2J+BeE3wMCltggonmpw/b0vT24dJb0oFuhyWMvAah6RM0iiS
         VBdqa9F9Z1eZdqXU75sICndrBFedD8GOWDpuz8hls9UNWLngrS9BWQ0aiHFJNWrJkVkS
         DvDHQU1XSByrV+UMgTXvvApilgOGHNxDwHG9oS/xM6bFTLrans282/gdW6zl5Am+p+Ne
         jO+nsBHg7Lyo+lEtpFTAv/IwXZBvZ+SdkGVjnhz64B374ZhKhOBPYlBPNW9sPoMaG6zS
         UI33uUmXyGGOzuky8zoULEQPjLvoIDpTYk5SqBy19YJtEOSdtDmWnvpcPTCnrUmmOg52
         JJ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723088256; x=1723693056;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Em4gw4SlTGWJuwGRtZ6+lH6AITpuWoqignfU36p6K4E=;
        b=rKsgsRtci6tbcdgfLNHWpsPKasKGDdndRZ8r7A4EMEcypn5hGZZZ228xxPT2RJDIP1
         U/fgMDcvC60QwVeyz+DHzso8ZhXoozV2WEP14a4ZxcO95UX5vtSFiZuNiyQsKXa8+TAZ
         yuCVtNHwDLvdO9kpmeIyfvPygzH6VGZGUT9CVN9y+mZLnKbfc70QjGQSW3Df0gABAgdl
         5zYRplHz4hgRX0AcnGwBhDPmVwe6XbJNWjhs8ewq9UKnQ6W3+cRAdRND4Mf4KQmbwKtR
         R1fQXMc5lXct8U2FxFrx2EniEpzPEPqQFelo5YD7VPZ0vCo7ZpBe3RCDEJRsAm0tMqjh
         9rbw==
X-Forwarded-Encrypted: i=1; AJvYcCW7qHSidJ74P485xPSvwDZRaBpsLCA5mfpdfNnRp6j2j0Z22MbkM6Bp+JCza+Bva0YbFBTxM8n5gAVWms8F7ZJhjjYYMCXx6oLd/JW7AQ==
X-Gm-Message-State: AOJu0Yw34OS8tWzUfQ8JxiIA+vICv/tj1+bioxdMZyshikjQ2yZzWFOk
	HhgW9nVjKBljVjvGyCX/4MeRc5r03STIj5gR4DGSCNkctYU9ORXICS6W9+vuNR7GBo1xpqurGVL
	SKzZvYjD6wjoIfAUjN54QWtMDtaPtBdvOI03K
X-Google-Smtp-Source: AGHT+IHvPKAgFj7UtvldEt4ITF86VCiiBhRZdL6zWiBOsFr6trO34b/kfhbvaMoPCV6QykXhGOz9WfKoQGbW6ssubds=
X-Received: by 2002:a05:6402:3593:b0:57c:c5e2:2c37 with SMTP id
 4fb4d7f45d1cf-5bbb1779ce9mr57823a12.3.1723088255210; Wed, 07 Aug 2024
 20:37:35 -0700 (PDT)
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
Date: Wed, 7 Aug 2024 20:36:56 -0700
Message-ID: <CALmYWFtAenAQmUCSrW8Pu6eNYMcfDe9R4f87XgUxaO4gsfzVQg@mail.gmail.com>
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
This is a new point that I didn't realize before, if we are going to handle
unmap vdso safely, yes, this is a bugfix that should be applied everywhere
for all arch, without CHECKPOINT_RESTORE config.

Do we need to worry about mmap(fixed) ? which can have the same effect
as mremap.

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
>
>          Linus
