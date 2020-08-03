Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B62323A27E
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Aug 2020 12:08:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BKtr74zbgzDqVx
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Aug 2020 20:08:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.67; helo=mail-ot1-f67.google.com;
 envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-m68k.org
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BKtpL2rLBzDqTv
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Aug 2020 20:06:48 +1000 (AEST)
Received: by mail-ot1-f67.google.com with SMTP id 93so17334788otx.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 Aug 2020 03:06:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OpbEohH8OUi/epyUcg1f5tBFIW7tKev1cp8OSm9Qyi4=;
 b=UiBjv01Od+4TIo0WdzPOWkvPFbkUxbgV4EgLX1u8LtkJAONXG5ToTxfd/07EytASNK
 F7JAONVR80z/6fnIGGG22tJssOaLa65EjFXZLoI2WNgVmPtSG3I8n4exJlgclcDbtQTr
 L4vRGimDKXvxAcrMsYzJaSiuUGlkm92XSLpVozlhOoTc5Lg99lfmGcKyi8LkPgUt7SO8
 mJaPjSxYC/XngNIydYQUT+pPLuU8bXMopgcHwUweQmcI9qDUPMy+k79Z/tm5axUk2fL4
 vGVwHMZwYR7Z/Lze/bNFFxaKtaEdto3Yo7V6F17L0bv2XEYcHqBYi+PJEIMHIfji9idF
 TqXg==
X-Gm-Message-State: AOAM530EFwEpBWSzPbPcOo5U6BnyPA2XeLfOa9Zp7L3V5OImK9UUDH4t
 AZPILhftQfHczMnufYyux28Cj3xrXYPYigw8pW8=
X-Google-Smtp-Source: ABdhPJx6E8jYekM61xWgh5QG5QIcwianLym1nuVniubEPeWhR5+9U4zRKDcBThxt+YKKXL5S6joXDgPgsop9nM33pkg=
X-Received: by 2002:a9d:7d8c:: with SMTP id j12mr13074211otn.250.1596449205821; 
 Mon, 03 Aug 2020 03:06:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200624035920.835571-1-natechancellor@gmail.com>
 <CAMuHMdU_KfQ-RT_nev5LgN=Vj_P97Fn=nwRoC6ZREFLa3Ysj7w@mail.gmail.com>
 <20200720210252.GO30544@gate.crashing.org>
In-Reply-To: <20200720210252.GO30544@gate.crashing.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 3 Aug 2020 12:06:34 +0200
Message-ID: <CAMuHMdUmHE-KVQuo=b2rn9EPgmnqSDi4i16NPbL5rXLLSCoyKg@mail.gmail.com>
Subject: Re: [PATCH] powerpc/boot: Use address-of operator on section symbols
To: Segher Boessenkool <segher@kernel.crashing.org>
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
Cc: Arnd Bergmann <arnd@arndb.de>, Geoff Levand <geoff@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Paul Mackerras <paulus@samba.org>, Joel Stanley <joel@jms.id.au>,
 Nathan Chancellor <natechancellor@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Segher,

On Mon, Jul 20, 2020 at 11:03 PM Segher Boessenkool
<segher@kernel.crashing.org> wrote:
> On Sat, Jul 18, 2020 at 09:50:50AM +0200, Geert Uytterhoeven wrote:
> > On Wed, Jun 24, 2020 at 6:02 AM Nathan Chancellor
> > <natechancellor@gmail.com> wrote:
> > >         /* If we have an image attached to us, it overrides anything
> > >          * supplied by the loader. */
> > > -       if (_initrd_end > _initrd_start) {
> > > +       if (&_initrd_end > &_initrd_start) {
> >
> > Are you sure that fix is correct?
> >
> >     extern char _initrd_start[];
> >     extern char _initrd_end[];
> >     extern char _esm_blob_start[];
> >     extern char _esm_blob_end[];
> >
> > Of course the result of their comparison is a constant, as the addresses
> > are constant.  If clangs warns about it, perhaps that warning should be moved
> > to W=1?
> >
> > But adding "&" is not correct, according to C.
>
> Why not?
>
> 6.5.3.2/3
> The unary & operator yields the address of its operand.  [...]
> Otherwise, the result is a pointer to the object or function designated
> by its operand.
>
> This is the same as using the name of an array without anything else,
> yes.  It is a bit clearer if it would not be declared as array, perhaps,
> but it is correct just fine like this.

Thanks, I stand corrected.

Regardless, the comparison is still a comparison between two constant
addresses, so my fear is that the compiler will start generating
warnings for that in the near or distant future, making this change
futile.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
