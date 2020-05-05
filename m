Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7C11C502B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 May 2020 10:23:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49GXmY5HkLzDqP4
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 May 2020 18:23:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::243;
 helo=mail-oi1-x243.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=azveeUto; dkim-atps=neutral
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49GWcc54m1zDqPR
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 May 2020 17:31:28 +1000 (AEST)
Received: by mail-oi1-x243.google.com with SMTP id o24so1210276oic.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 05 May 2020 00:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CROAVDaphBM0ZvcTotPO5LP8zXi9erwYvjqaiwQBdCc=;
 b=azveeUtoX4pP8ZWnShgr5SkcJtC3Od1a+71aTA+0QoQVF78YPy3a7odXu6V2Zl+Xxz
 z5zTJNqOr1kiGd7FixG9hRgdVXrIls5ZDEuH7p07Wg8yf5+jprSI1SMTkLU2b8yc9DES
 Kik5Ror8dlev9YWRqEUqGhws4BwD9PLknkxEN72yk0MHmCe70UBM/fDlh9EqZjmkx1zW
 x8P/PFpcPRR1FZQl5TDboUAzhndRwEPoC6PDx6jA8Fk/uHUvPbUDB9DFJa62grVgmhTa
 OhjZ1CBQdS56G/g+XbQGPOaXX/hzAdaxT547bsGNroOUenktNx577jFNVJF7uD2TGzA/
 t32Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CROAVDaphBM0ZvcTotPO5LP8zXi9erwYvjqaiwQBdCc=;
 b=M6kzRyVXdk3myHpzVpgRgaEfqhi2/kBN3WRGjuZQZLfHVdo+zOdlzVZfuPtynPA5QW
 koIOAx8nxjlcdJ72od9IuuOuy1HE2hU5z09rW88lqkNc4n3z6ytE89xpGxtofQwFq9S9
 3xglsz6/hI4Tnv4qBu5U05NWpYS0ENewQHjew7wyDPwxoAGeQ4hbBiUeG0vf+S/JLUHY
 PyOE6hUV63Oc8Nv8xj5j5B2HAYBM4gkKvkQzBq0QC5vZxEK09Fw+RTLzIv3paKxCqASq
 vA24o8NaXa6waN1z4TeZI+oqGkZpyM5SEOyhUjE0f5Z8aoauHBDCLKtKpw6Wl98cyDhr
 Rn3A==
X-Gm-Message-State: AGi0Pub4x1CezpSUMEpHigBovjDL4UH71KNzI7BtS0O4cwm2BjqVk7/p
 6wOvjvtX2x5HE7TsrRQ6VzlnwmbJRHxNPm4VpXM=
X-Google-Smtp-Source: APiQypJ8sv0f+PkX17mg8iM9yX/nAib2VCOmKtD6DIHGxHrrK0WIq4Fc6ZOhZTqoR0Ei0Nl+h4InSc7p//fBR64Ecaw=
X-Received: by 2002:aca:d6c1:: with SMTP id n184mr1521808oig.126.1588663884884; 
 Tue, 05 May 2020 00:31:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200501034220.8982-1-jniethe5@gmail.com>
 <20200501034220.8982-5-jniethe5@gmail.com>
 <871rnyeu4t.fsf@mpe.ellerman.id.au>
In-Reply-To: <871rnyeu4t.fsf@mpe.ellerman.id.au>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Tue, 5 May 2020 17:31:13 +1000
Message-ID: <CACzsE9qJDyNPGFw3wffx50U8V8q-bFbYFrEWLv9vkjm1nh2NYg@mail.gmail.com>
Subject: Re: [PATCH v7 04/28] powerpc/xmon: Use bitwise calculations
 in_breakpoint_table()
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
Cc: Alistair Popple <alistair@popple.id.au>,
 Nicholas Piggin <npiggin@gmail.com>, Balamuruhan S <bala24@linux.ibm.com>,
 naveen.n.rao@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 5, 2020 at 5:08 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Jordan Niethe <jniethe5@gmail.com> writes:
> > A modulo operation is used for calculating the current offset from a
> > breakpoint within the breakpoint table. As instruction lengths are
> > always a power of 2, this can be replaced with a bitwise 'and'. The
> > current check for word alignment can be replaced with checking that the
> > lower 2 bits are not set.
> >
> > Suggested-by: Christophe Leroy <christophe.leroy@c-s.fr>
> > Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> > ---
> > v6: New to series
> > ---
> >  arch/powerpc/xmon/xmon.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
> > index bbfea22f4a96..e122f0c8a044 100644
> > --- a/arch/powerpc/xmon/xmon.c
> > +++ b/arch/powerpc/xmon/xmon.c
> > @@ -857,8 +857,8 @@ static struct bpt *in_breakpoint_table(unsigned long nip, unsigned long *offp)
> >       off = nip - (unsigned long) bpt_table;
> >       if (off >= sizeof(bpt_table))
> >               return NULL;
> > -     *offp = off % BPT_SIZE;
> > -     if (*offp != 0 && *offp != 4)
> > +     *offp = off & (BPT_SIZE - 1);
> > +     if (off & 3)
> >               return NULL;
>
> It would be even better if you didn't hard code the 3 wouldn't it?
>
The three is just checking word alignment, which I think was the
intention of the previous
-     if (*offp != 0 && *offp != 4)
But using BPT_SIZE is is a different calculation.
BPT_SIZE == 2 * sizeof(unsigned int) == 8
Which would mean the trap of the breakpoint pair of instructions would
return NULL.

> eg:
>
> +       *offp = off & (BPT_SIZE - 1);
> +       if (off & (BPT_SIZE - 1))
>                 return NULL;

>
> cheers
