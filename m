Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4918325A74A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Sep 2020 10:02:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BhGcz3QyJzDqRJ
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Sep 2020 18:02:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::344;
 helo=mail-ot1-x344.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=WdhcQ80b; dkim-atps=neutral
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BhGZx034tzDqby
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Sep 2020 18:00:40 +1000 (AEST)
Received: by mail-ot1-x344.google.com with SMTP id 37so3526955oto.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 02 Sep 2020 01:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zpnjn6f8oeFbP2O+Jv7aUIl6F5Bk24aTxxfcp1ZBfPQ=;
 b=WdhcQ80bdf8jjmBasboFEWb4emxu3yEKjvw629iQqu1e34rp5yDFGGOtEXVuv2AAAk
 LeVcKSX3onUojPc867KHrhEsyNhoQpZp58cVZNJJT3nGvckpQr+lNcTKWNuyj8R7OIh6
 lANv1VU4e6nCjwj10b+f+Nz/O6Lj2taQcN8mqxqwjDGlw5NUjWZAj149oC/5AQffwlkc
 hlHA72T39lK4LnRYYelh+4vClvHo1SXx8YXU0dmi+TOBPjMHI4fhP7OITVA/mBAAZ9W3
 BKc1SBhadVu4z/8sUoH1gK+xROyjkbMbCBYLH37UVsg7LAeQaPKKQsLj1Yg0i3CJmJDF
 +LWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zpnjn6f8oeFbP2O+Jv7aUIl6F5Bk24aTxxfcp1ZBfPQ=;
 b=JJ+MfuICG9WVWfdLIznmRSUpHbbCgs+YEdkFCvUPzf5g1zu5o5kgrfv8R5i6hAPRed
 69+dkxOmxrQxqw+YRKKrmFD6u3PNel6O9qsGuo6qtHPW1z2ZbJwk+4Vi9qhv88PX/rwI
 EuM718XETWDGtWD8Qp8OMF5bc/lqJ9sv4rH+5uLHGDfm/7oPqlXqdEyYUmJoNIuyAxDq
 Ojt559Bez6Dcfx9puIfFpak7zkPJSTf/a4P1Wgv5rcd/XPmtIigIEfdSEFiTV++uPdVm
 KUMdYU+j3VsCfBn0J/vhzzSzeJ0Rfqi6X4bIJhLUXFgPfKHdeYErbmbw08+hxNrF3I3s
 FFTw==
X-Gm-Message-State: AOAM531F5KNvgOIUutqmAbL4EtPJFhKurAgmYE+QbgvyVre1VWrUhD4j
 4MDpwFipCMCA1874JuKC+SHJMuTnh5XUHtT3enc=
X-Google-Smtp-Source: ABdhPJx0WBNr9W1Nwgn0liQdUfM1taDwLxQD9fexgGLSMjFOjxOuNtFcfvzrxV80VGe+mFpQDmezLwJQXUj41yLgsGQ=
X-Received: by 2002:a05:6830:1283:: with SMTP id
 z3mr4244875otp.51.1599033636102; 
 Wed, 02 Sep 2020 01:00:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200820033922.32311-1-jniethe5@gmail.com>
 <20200902061318.GE272502@thinks.paulus.ozlabs.org>
In-Reply-To: <20200902061318.GE272502@thinks.paulus.ozlabs.org>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Wed, 2 Sep 2020 18:00:24 +1000
Message-ID: <CACzsE9qrgs8ujQ7HeHVo-8oyY2bdwFVnVxR5dEZns5V7qK7Cbg@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] KVM: PPC: Use the ppc_inst type
To: Paul Mackerras <paulus@ozlabs.org>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Nicholas Piggin <npiggin@gmail.com>, kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Sep 2, 2020 at 4:18 PM Paul Mackerras <paulus@ozlabs.org> wrote:
>
> On Thu, Aug 20, 2020 at 01:39:21PM +1000, Jordan Niethe wrote:
> > The ppc_inst type was added to help cope with the addition of prefixed
> > instructions to the ISA. Convert KVM to use this new type for dealing
> > wiht instructions. For now do not try to add further support for
> > prefixed instructions.
>
> This change does seem to splatter itself across a lot of code that
> mostly or exclusively runs on machines which are not POWER10 and will
> never need to handle prefixed instructions, unfortunately.  I wonder
> if there is a less invasive way to approach this.
Something less invasive would be good.
>
> In particular we are inflicting this 64-bit struct on 32-bit platforms
> unnecessarily (I assume, correct me if I am wrong here).
No, that is something that I wanted to to avoid, on 32 bit platforms
it is a 32bit struct:

struct ppc_inst {
        u32 val;
#ifdef CONFIG_PPC64
        u32 suffix;
#endif
} __packed;
>
> How would it be to do something like:
>
> typedef unsigned long ppc_inst_t;
>
> so it is 32 bits on 32-bit platforms and 64 bits on 64-bit platforms,
> and then use that instead of 'struct ppc_inst'?  You would still need
> to change the function declarations but I think most of the function
> bodies would not need to be changed.  In particular you would avoid a
> lot of the churn related to having to add ppc_inst_val() and suchlike.

Would the idea be to get rid of `struct ppc_inst` entirely or just not
use it in kvm?
In an earlier series I did something similar (at least code shared
between 32bit and 64bit would need helpers, but 32bit only code need
not change):

#ifdef __powerpc64__

typedef struct ppc_inst {
    union {
        struct {
            u32 word;
            u32 pad;
        } __packed;
        struct {
            u32 prefix;
            u32 suffix;
        } __packed;
    };
} ppc_inst;

#else /* !__powerpc64__ */

typedef u32 ppc_inst;
#endif

However mpe wanted to avoid using a typedef
(https://patchwork.ozlabs.org/comment/2391845/)

We did also talk about just using a u64 for instructions
(https://lore.kernel.org/linuxppc-dev/1585028462.t27rstc2uf.astroid@bobo.none/)
but the concern was that as prefixed instructions act as two separate
u32s (prefix is always before the suffix regardless of endianess)
keeping it as a u64 would lead to lot of macros and potential
confusion.
But it does seem if that can avoid a lot of needless churn it might
worth the trade off.
>
> > -static inline unsigned make_dsisr(unsigned instr)
> > +static inline unsigned make_dsisr(struct ppc_inst instr)
> >  {
> >       unsigned dsisr;
> > +     u32 word = ppc_inst_val(instr);
> >
> >
> >       /* bits  6:15 --> 22:31 */
> > -     dsisr = (instr & 0x03ff0000) >> 16;
> > +     dsisr = (word & 0x03ff0000) >> 16;
> >
> >       if (IS_XFORM(instr)) {
> >               /* bits 29:30 --> 15:16 */
> > -             dsisr |= (instr & 0x00000006) << 14;
> > +             dsisr |= (word & 0x00000006) << 14;
> >               /* bit     25 -->    17 */
> > -             dsisr |= (instr & 0x00000040) << 8;
> > +             dsisr |= (word & 0x00000040) << 8;
> >               /* bits 21:24 --> 18:21 */
> > -             dsisr |= (instr & 0x00000780) << 3;
> > +             dsisr |= (word & 0x00000780) << 3;
> >       } else {
> >               /* bit      5 -->    17 */
> > -             dsisr |= (instr & 0x04000000) >> 12;
> > +             dsisr |= (word & 0x04000000) >> 12;
> >               /* bits  1: 4 --> 18:21 */
> > -             dsisr |= (instr & 0x78000000) >> 17;
> > +             dsisr |= (word & 0x78000000) >> 17;
> >               /* bits 30:31 --> 12:13 */
> >               if (IS_DSFORM(instr))
> > -                     dsisr |= (instr & 0x00000003) << 18;
> > +                     dsisr |= (word & 0x00000003) << 18;
>
> Here I would have done something like:
>
> > -static inline unsigned make_dsisr(unsigned instr)
> > +static inline unsigned make_dsisr(struct ppc_inst pi)
> >  {
> >       unsigned dsisr;
> > +     u32 instr = ppc_inst_val(pi);
>
> and left the rest of the function unchanged.
That is better.
>
> At first I wondered why we still had that function, since IBM Power
> CPUs have not set DSISR on an alignment interrupt since POWER3 days.
> It turns out it this function is used by PR KVM when it is emulating
> one of the old 32-bit PowerPC CPUs (601, 603, 604, 750, 7450 etc.).
>
> > diff --git a/arch/powerpc/kernel/kvm.c b/arch/powerpc/kernel/kvm.c
>
> Despite the file name, this code is not used on IBM Power servers.
> It is for platforms which run under an ePAPR (not server PAPR)
> hypervisor (which would be a KVM variant, but generally book E KVM not
> book 3S).
>
> Paul.
