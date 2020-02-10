Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 51EED1582DE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Feb 2020 19:43:36 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48GZYK52xzzDqL2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Feb 2020 05:43:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1041;
 helo=mail-pj1-x1041.google.com; envelope-from=maskray@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=nb46eOhf; dkim-atps=neutral
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48GZWF0D0WzDqKh
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Feb 2020 05:41:44 +1100 (AEDT)
Received: by mail-pj1-x1041.google.com with SMTP id 12so117133pjb.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Feb 2020 10:41:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+26oPPURci8wbc/keQwshEFpG87fhSfKC1I6X00Ei/g=;
 b=nb46eOhf0uPuVxDEnQQ+dlrG6ZI2ZouyYiBGEeZcFhP2SftY4CSzNODxjZNHIQSlZU
 8i18MaYxcYi9kjKt+cOH4khaS2dpGCvPZziGoNzxwAcyGOj/7kVfKJQ8Mfacn3T0kbdK
 BRBkMHXzePcBR/pzBT0i7H6qscwVpWANQQnjKW38w+c4LW0gq8oBmcxyqat2MlK3XtTB
 mzs40jDY+1uqgRfyOtMFCprNqypmMZbE8Cx2pNeKsYQnOXP5EcrA5LIb3AzGunoqBa04
 bEiyY+eDKSFFcVI9aUCjqUQLQk4dwSVyA9eZumEVeIfJCms1gQ+ljy8RtPApg0AMgoVN
 Secg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+26oPPURci8wbc/keQwshEFpG87fhSfKC1I6X00Ei/g=;
 b=h2TnZ+04IKUA6kMfxQlty+paYYFXIad1W2XlC91Xw8Na2NS6rkmQbYNytdeKk8+vF3
 5y/ke/UVaICIeUYS2YB4pn+JoXEnKgfIud8lSz3lrXy+MIphcWeBJRr+NEneaDsTUxPg
 F+IvIFw+r1iV0r3pXiQNd9LmWCj03ttMdUPfsFO1uu3MaebIE8VLSYbMrHHiMgP14dbK
 p28cRuRyT77A2iTHY+hwZPnRXIx7VlZWh37HID3HrU7BhbQi1Wzy10sZ+7DKXjMLET89
 jq4Q5Q01XxiuivKVUzWI0FSZhux2DMVli/sNyP3I/uanwqzb7ot6u0jYL6siQXnJi07u
 Xrqg==
X-Gm-Message-State: APjAAAWSPUMfQGsy4D4DjY6BFjIfZkshDUaOHq5WmEsf1jd0sedhn2wY
 Pe3Off6LVBxJvHCte4mnzPasQqqmIBkheG8hSdVQcqDKRmM=
X-Google-Smtp-Source: APXvYqx+Bi4Z5XLl5nC2IIbRR3gLrxNJoVDnPGzCuEIPY6OrPR1pC6+IcFhiYlhbBmf1UPlY6S57jAQeNQyXWhsDNGw=
X-Received: by 2002:a17:90a:98d:: with SMTP id 13mr487964pjo.102.1581360100932; 
 Mon, 10 Feb 2020 10:41:40 -0800 (PST)
MIME-Version: 1.0
References: <20200205005054.k72fuikf6rwrgfe4@google.com>
 <87pnemzoxa.fsf@mpe.ellerman.id.au>
In-Reply-To: <87pnemzoxa.fsf@mpe.ellerman.id.au>
From: =?UTF-8?B?RsSBbmctcnXDrCBTw7JuZw==?= <maskray@google.com>
Date: Mon, 10 Feb 2020 10:41:29 -0800
Message-ID: <CAFP8O3JPJvnQhAcF+DWQQGPNOj9vF-nLovzi5uSQ4zrUP1DvtQ@mail.gmail.com>
Subject: Re: [PATCH] powerpc/vdso32: mark __kernel_datapage_offset as
 STV_PROTECTED
To: Michael Ellerman <mpe@ellerman.id.au>
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
Cc: linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Feb 10, 2020 at 3:01 AM Michael Ellerman <mpe@ellerman.id.au> wrote=
:
>
> Fangrui Song <maskray@google.com> writes:
> > A PC-relative relocation (R_PPC_REL16_LO in this case) referencing a
> > preemptible symbol in a -shared link is not allowed.  GNU ld's powerpc
> > port is permissive and allows it [1], but lld will report an error afte=
r
> > https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/commi=
t/?id=3Dec0895f08f99515194e9fcfe1338becf6f759d38
> >
> > Make the symbol protected so that it is non-preemptible but still
> > exported.
>
> "preemptible" means something different to me, and I assume we're not
> using it to mean the same thing.
>
> Can you explain it using small words that a kernel developer can
> understand? :)
>
> cheers

The term used in the ELF specification is "preemptable". I heard from
Roland McGrathr that "preemptable" was a typo. The correct term is
"preemptible".
On a random article I found, it mentions that "preemptible" is used
more than "preemptable". So now I stick with "preemptible".

The word is overloaded and has a different meaning in the kernel, but
here we refer to within the ELF binary format context.

From http://www.sco.com/developers/gabi/latest/ch4.symtab.html
"The visibility of symbols with the STV_DEFAULT attribute is as
specified by the symbol's binding type. That is, global and weak
symbols are visible outside of their defining component (executable
file or shared object). Local symbols are hidden, as described below.
Global and weak symbols are also preemptable, that is, they may by
preempted by definitions of the same name in another component."

__kernel_datapage_offset is a STB_GLOBAL STV_DEFAULT symbol. In a
-shared link, it is considered preemptible. There are some methods
that make such symbols non-preemptible but none is used in this
context.

* -Bsymbolic
* -Bsymbolic-functions if STT_FUNC
* --dynamic-list is specified but the dynamic list does not name this symbo=
l
* A --version-script makes the symbol local

__kernel_datapage_offset is accessed via some mechanism similar to
dlsym, so it has to be exported.

Given all the above, I chose STV_PROTECTED, which is the simplest and
least intrusive approach.

> > [1]: https://sourceware.org/bugzilla/show_bug.cgi?id=3D25500
> >
> > Link: https://github.com/ClangBuiltLinux/linux/issues/851
> > Signed-off-by: Fangrui Song <maskray@google.com>
>
> > ---
> >  arch/powerpc/kernel/vdso32/datapage.S | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/powerpc/kernel/vdso32/datapage.S b/arch/powerpc/kerne=
l/vdso32/datapage.S
> > index 217bb630f8f9..2831a8676365 100644
> > --- a/arch/powerpc/kernel/vdso32/datapage.S
> > +++ b/arch/powerpc/kernel/vdso32/datapage.S
> > @@ -13,7 +13,8 @@
> >  #include <asm/vdso_datapage.h>
> >
> >       .text
> > -     .global __kernel_datapage_offset;
> > +     .global __kernel_datapage_offset
> > +     .protected      __kernel_datapage_offset
> >  __kernel_datapage_offset:
> >       .long   0
> >
> > --
> > 2.25.0.341.g760bfbb309-goog



--=20
=E5=AE=8B=E6=96=B9=E7=9D=BF
