Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C6594C488
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 20:37:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=x/0vRfTI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WfwlB1KQQz2y8f
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Aug 2024 04:37:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=x/0vRfTI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com; envelope-from=jeffxu@google.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WfwkT3ryHz2xfq
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Aug 2024 04:37:04 +1000 (AEST)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5a1b073d7cdso470a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Aug 2024 11:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723142215; x=1723747015; darn=lists.ozlabs.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AUiHQdGUYRTRZksaVvFbHULoWNzG0269iJwVT5/7aW0=;
        b=x/0vRfTIRrroSa/+cGu6JzyVf46S+txyQIua1GyDJ6YnSSxw7X2jED2xzEHMwCdH16
         KDkfrxKlMxaZH29kCJ6MrO8ANznCFYcJeB35sN6MscilCvLWIKfNjwPaE+djcue8Lpq1
         uEtzBRvZ8dpRGbthIXvNPkBm7xuxxwNADQebNBYAHlTePfC0gUVah92r2B6parF/Z6V1
         1zVe+8CxX3ENk6fiYlZF5buQR9U5WtGUIbzl6UUClvEhccIOGSy2VwXYbdHBEjxiC87f
         jh4afwEpHvrM2oUjCz55KN4aeJjenv8WAFaWu+RgvqPFI15WjEFQZx5r2K0ZfGkUy4A6
         sqfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723142215; x=1723747015;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AUiHQdGUYRTRZksaVvFbHULoWNzG0269iJwVT5/7aW0=;
        b=jGpdO3Gk7hQL6Z63C3Bl2DPXUkOX8bq0ZfqwHOxyiDz6T5zD0lB4rP9eSPa8AMHH8e
         PChpP2bvP7Bl70uugBv0VIywnIwG6Pf1zJuSVIZmjCbDBz7C7pOn/ExPpLlzIQMecuIq
         nGtiZ1mQ1Eaf/G4sI40KWjOXqhYsYj0rDhDtxTbExyADPmB0nnTTJ1N+A1Hno+dONdzF
         Z+QfuSt3a7sXBRm41JVtVERbbFZo2tSkN8bGleQ0v4/LnEy2BTkn8m2f2aXRup4fueVD
         CUodoxwXmdy4Cvyizvx0TN3RX0ZxwzrWQM+WLn0jCM6AvNV/KiUkWPyxITF6b8avzA06
         V1Xw==
X-Forwarded-Encrypted: i=1; AJvYcCVC1nKbxc4sxWbg9q4ZocJE3paHAlBxMPf+mWDGRH8Mxc0dfN63P9TgbC/FZxztuEQ1O9z5ysDdI3+SuWzSO1QdEBBiucFDQtJSQWbR5g==
X-Gm-Message-State: AOJu0YyUF/PE1EKyxUPmdx8LVbEhjf9v09rLchhOv58ckjunnRTL91e2
	W+cWvPH86hNAFXOAKI8Gw3REp8ivF4oMWJsVo4eXAlftfGQhj8sJp9Z4NG2mPRN/HAG1fV679hP
	DKDdVND55YVqfpSLVHzb6HdpcLGYIdAIFRel+
X-Google-Smtp-Source: AGHT+IF76YCRlol+VaBff83BpYeNuFvu+aIiNuVvaKlOiVPlqg9lL9OA9dYb+7cLVxCzSEDJLygo9YoZhUgovQLCQ1E=
X-Received: by 2002:a05:6402:27d4:b0:57d:436b:68d6 with SMTP id
 4fb4d7f45d1cf-5bbbc8a8c0dmr16476a12.7.1723142214918; Thu, 08 Aug 2024
 11:36:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240807124103.85644-1-mpe@ellerman.id.au> <20240807124103.85644-2-mpe@ellerman.id.au>
 <CALmYWFsCrMxkA1v58fJxtyGR15ZGxmSP8x7QC=oeKwzcwGL76A@mail.gmail.com>
 <gtz7s4eyzydaomh2msvfhpemhiruexy53nutd3fwumqfpos7v5@4fnqun2olore>
 <CALmYWFvqoxyBf4iP7WPTU_Oxq_zpRzvaBOWoHc4n4EwQTYhyBA@mail.gmail.com>
 <babup6k7qh5ii5avcvtz2rqo4n2mzh2wjbbgk5xeuivfypqnuc@2gydsfao3w7b>
 <CALmYWFsAT+Cb37-cSTykc_P7bJDHmFa7mWD5+B1pEz73thchcQ@mail.gmail.com>
 <lhe2mky6ahlk2jzvvfjyongqiseelyx2uy7sbyuso6jcy3b2dq@7ju6cea62jgk>
 <CAHk-=wgTXVMBRuya5J0peujSrtunehRtzk=WVrm6njPhHrpTJw@mail.gmail.com>
 <CALmYWFtAenAQmUCSrW8Pu6eNYMcfDe9R4f87XgUxaO4gsfzVQg@mail.gmail.com> <6i3f5bvcppm4bkpphcb7sxsopmeani5mg5irytc3nr464p24ka@jpno77j7cgyd>
In-Reply-To: <6i3f5bvcppm4bkpphcb7sxsopmeani5mg5irytc3nr464p24ka@jpno77j7cgyd>
From: Jeff Xu <jeffxu@google.com>
Date: Thu, 8 Aug 2024 11:36:16 -0700
Message-ID: <CALmYWFvXKdfyvZTfu9D4GdBgeVHzLR2rXshqZMFPjU+FuAHJkQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] powerpc/mm: Handle VDSO unmapping via close() rather
 than arch_unmap()
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Jeff Xu <jeffxu@google.com>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Michael Ellerman <mpe@ellerman.id.au>, linux-mm@kvack.org, 
	linuxppc-dev@lists.ozlabs.org, akpm@linux-foundation.org, 
	christophe.leroy@csgroup.eu, jeffxu@chromium.org, 
	linux-kernel@vger.kernel.org, npiggin@gmail.com, oliver.sang@intel.com, 
	pedro.falcato@gmail.com, Kees Cook <keescook@chromium.org>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Aug 8, 2024 at 11:08=E2=80=AFAM Liam R. Howlett <Liam.Howlett@oracl=
e.com> wrote:
>
> * Jeff Xu <jeffxu@google.com> [240807 23:37]:
> > On Wed, Aug 7, 2024 at 8:21=E2=80=AFPM Linus Torvalds
> > <torvalds@linux-foundation.org> wrote:
> > >
> > > On Wed, 7 Aug 2024 at 16:20, Liam R. Howlett <Liam.Howlett@oracle.com=
> wrote:
> > > >
> > > > Okay, I'm going to try one more time here.  You are suggesting to h=
ave a
> > > > conf flag to leave the vdso pointer unchanged when it is unmapped.
> > > > Having the close behind the conf option will not prevent it from be=
ing
> > > > unmapped or mapped over, so what you are suggesting is have a
> > > > configuration option that leaves a pointer, mm->context.vdso, to be
> > > > unsafe if it is unmapped if you disable checkpoint restore.
> > >
> > This is a new point that I didn't realize before, if we are going to ha=
ndle
> > unmap vdso safely, yes, this is a bugfix that should be applied everywh=
ere
> > for all arch, without CHECKPOINT_RESTORE config.
> >
> > Do we need to worry about mmap(fixed) ? which can have the same effect
> > as mremap.
>
> Yes, but it should be handled by vm_ops->close() when MAP_FIXED unmaps
> the vdso.  Note that you cannot MAP_FIXED over half of the vma as the
> vm_ops->may_split() is special_mapping_split(), which just returns
> -EINVAL.
>
The may_split() failure logic is specific to vm_special_mapping, right ?

Do we still need to keep vm_special_mapping struct , if we are going to
treat  special vma as normal vma ?


> Thanks,
> Liam
