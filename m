Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E343663A7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Apr 2021 04:35:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FQ4RQ0SQqz302p
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Apr 2021 12:35:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=AfP2Y28l;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b2c;
 helo=mail-yb1-xb2c.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=AfP2Y28l; dkim-atps=neutral
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FQ4R11qYyz2xZj
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Apr 2021 12:35:22 +1000 (AEST)
Received: by mail-yb1-xb2c.google.com with SMTP id p3so24812985ybk.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Apr 2021 19:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=d0rVbtvpHHNRAK2+dBk3sgYQRVyXiZILBCyxN4HtT2o=;
 b=AfP2Y28lzRYq5mIUrMEQZH+EUi3TAolULghhMW3NOjo1aihXjEqlZfcrIzMnKxB9Ss
 cANrd8Q/TA9esek+lNYuNtFDyQMtqhDsKRg64leIQVufn6HEZQCiKB088NFnJkYjnPLI
 JK8MBJf0+s3LyDclWK7rZ2liXkq6RY9egMQ/co4BHZxn4FbmKMp8hDzo17SLb922cnbp
 VNbWhCTkop0HsN33l6KA8JeEE8C6a08C9ry+nnWzulQk8+gaL9l9jLMNd2EaVSliQ+RH
 eeV0D3DuhjXvzPgTsJQ3ie023JlqTMamtW+NcNUaPmMyHCMl2P80dWwzV/KLdDFYSnlx
 DxAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d0rVbtvpHHNRAK2+dBk3sgYQRVyXiZILBCyxN4HtT2o=;
 b=IsErMx04OjzEJipIGrhAcgYHYKCmF+JMqBDY921bfHvpzSKUdpdqnHYUx9uWkvPuXN
 PzUqPE39tNqXNWW97f7O2CgZLMvjXwiNeAZc6w/CIXGsJkYOrJKphrlul3V8QGxskTm9
 CrJC6m4GORxOj6dOwxF6L7wvuUoJdsT71Rsjg0B47zXe4ydaL4BppLbOD6Cyxg8/tINa
 4pk0iKrUoTQS/ijh1e7GCbToFztqrsKoU3s4oqZ8pLJk4Tw8SE383cgRT09y8BAfVIRX
 AKDkMzHrhdnTygFN7V+oJZewKw/V+RGsYvvcxGB42z6QxQqf/tlMJ31SU1oKeypyuvqg
 AHXA==
X-Gm-Message-State: AOAM530T9UyVYoKyQLJmskncGsngWpNCz9GnDdyuySBckyUFj6uQeQrA
 Fk7Jlc6+0KnY3GeQa00XBUQpqEkiiK4Fs7VRsbs=
X-Google-Smtp-Source: ABdhPJywxFZhZSiClVJRkE29U7cQGz44poQgPJeGv6FJKG7WKuOD8P/Z6Rc1Jr8ys84KHL160S/IbuMIXAYoEOZsPz8=
X-Received: by 2002:a25:aa2d:: with SMTP id s42mr29558831ybi.265.1618972519296; 
 Tue, 20 Apr 2021 19:35:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210330045132.722243-1-jniethe5@gmail.com>
 <20210330045132.722243-6-jniethe5@gmail.com>
 <87wntnwqw9.fsf@mpe.ellerman.id.au>
In-Reply-To: <87wntnwqw9.fsf@mpe.ellerman.id.au>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Wed, 21 Apr 2021 12:35:08 +1000
Message-ID: <CACzsE9oERR+KKBe=+eQU1skwTOpDAmi8=_rOMAwM8+LtfBqRKA@mail.gmail.com>
Subject: Re: [PATCH v10 05/10] powerpc/bpf: Write protect JIT code
To: Michael Ellerman <mpe@ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
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
Cc: ajd@linux.ibm.com, cmr@codefail.de, Nicholas Piggin <npiggin@gmail.com>,
 naveen.n.rao@linux.ibm.com, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Mar 31, 2021 at 9:37 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Jordan Niethe <jniethe5@gmail.com> writes:
>
> > Once CONFIG_STRICT_MODULE_RWX is enabled there will be no need to
> > override bpf_jit_free() because it is now possible to set images
> > read-only. So use the default implementation.
> >
> > Also add the necessary call to bpf_jit_binary_lock_ro() which will
> > remove write protection and add exec protection to the JIT image after
> > it has finished being written.
> >
> > Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> > ---
> > v10: New to series
> > ---
> >  arch/powerpc/net/bpf_jit_comp.c   | 5 ++++-
> >  arch/powerpc/net/bpf_jit_comp64.c | 4 ++++
> >  2 files changed, 8 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c
> > index e809cb5a1631..8015e4a7d2d4 100644
> > --- a/arch/powerpc/net/bpf_jit_comp.c
> > +++ b/arch/powerpc/net/bpf_jit_comp.c
> > @@ -659,12 +659,15 @@ void bpf_jit_compile(struct bpf_prog *fp)
> >               bpf_jit_dump(flen, proglen, pass, code_base);
> >
> >       bpf_flush_icache(code_base, code_base + (proglen/4));
> > -
> >  #ifdef CONFIG_PPC64
> >       /* Function descriptor nastiness: Address + TOC */
> >       ((u64 *)image)[0] = (u64)code_base;
> >       ((u64 *)image)[1] = local_paca->kernel_toc;
> >  #endif
> > +     if (IS_ENABLED(CONFIG_STRICT_MODULE_RWX)) {
> > +             set_memory_ro((unsigned long)image, alloclen >> PAGE_SHIFT);
> > +             set_memory_x((unsigned long)image, alloclen >> PAGE_SHIFT);
> > +     }
>
> You don't need to check the ifdef in a caller, there are stubs that
> compile to nothing when CONFIG_ARCH_HAS_SET_MEMORY=n.
As Christophe pointed out we could have !CONFIG_STRICT_MODULE_RWX and
CONFIG_ARCH_HAS_SET_MEMORY which would then be wrong here.
Probably we could make CONFIG_ARCH_HAS_SET_MEMORY depend on
CONFIG_STRICT_MODULE_RWX?
>
> > diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
> > index aaf1a887f653..1484ad588685 100644
> > --- a/arch/powerpc/net/bpf_jit_comp64.c
> > +++ b/arch/powerpc/net/bpf_jit_comp64.c
> > @@ -1240,6 +1240,8 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
> >       fp->jited_len = alloclen;
> >
> >       bpf_flush_icache(bpf_hdr, (u8 *)bpf_hdr + (bpf_hdr->pages * PAGE_SIZE));
> > +     if (IS_ENABLED(CONFIG_STRICT_MODULE_RWX))
> > +             bpf_jit_binary_lock_ro(bpf_hdr);
>
> Do we need the ifdef here either? Looks like it should be safe to call
> due to the stubs.
>
> > @@ -1262,6 +1264,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
> >  }
> >
> >  /* Overriding bpf_jit_free() as we don't set images read-only. */
> > +#ifndef CONFIG_STRICT_MODULE_RWX
>
> Did you test without this and notice something broken?
>
> Looking at the generic version I can't tell why we need to override
> this. Maybe we don't (anymore?) ?
Yeah we don't.
>
> cheers
>
> >  void bpf_jit_free(struct bpf_prog *fp)
> >  {
> >       unsigned long addr = (unsigned long)fp->bpf_func & PAGE_MASK;
> > @@ -1272,3 +1275,4 @@ void bpf_jit_free(struct bpf_prog *fp)
> >
> >       bpf_prog_unlock_free(fp);
> >  }
> > +#endif
> > --
> > 2.25.1
