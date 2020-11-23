Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BCD12C1587
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Nov 2020 21:20:31 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cfz6j0BXYzDqR1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Nov 2020 07:20:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::542;
 helo=mail-ed1-x542.google.com; envelope-from=morbo@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=FUGUHj5R; dkim-atps=neutral
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cfz3t2J8JzDq96
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Nov 2020 07:18:00 +1100 (AEDT)
Received: by mail-ed1-x542.google.com with SMTP id k1so5521405eds.13
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Nov 2020 12:18:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iXxt3rp0D8OGOC0pTBYny5fylLOP0Y+Y9XYFsSl+cKM=;
 b=FUGUHj5RsAlY009rSELINsCOQFXHx8mffC/fiFjGbvXCvma2fNnA9ristxXqQLrYzU
 8j1m5BLqwFnuaM2pR7f2LfUmneVoGIrUBCuZeUIkxbCTY8Yi6Dbdm+rLfQ7IAoTrqEpp
 74bCQ5yqJIYUYugkL45rY8Jk5q2bT8TWfT6K5t+ZYVggn+qvhu34CTSFNgRE+6ytZWGU
 xm8CwI/dPfBCwfL7T9kxd/IAK6u+5f3zungQmB+qruhYQC5spTngah2+hl09duaxXAL/
 ruccBGsvfoNcdQI/Oq6V6ryP7B4Vqt2ax7JMCTLdMYiTdVSr8EcZ50Df+RdEidtU6/wS
 FyZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iXxt3rp0D8OGOC0pTBYny5fylLOP0Y+Y9XYFsSl+cKM=;
 b=Dh3qhgZnxOghUnwpD9S5wDYR44ugxWcCOovsWK3zicqk79pwGrjuZLcuGlxn1AY8cM
 cADTzs7h001zt7HRyapJP1k+MYBn27q42rpr+KGjFe+qsGWe8AQpBazFYjkK/FjFJcI3
 GwLcuknbkq6Xif0muofMdKV0QC5iIPUC6JBVNlPQpvbmRiCrPWZ5w4ACiSaEWCkEOmsa
 kV1c/sh8ksHiZRluuFFDTF/qBUF3YL6CJQNMwqEQPGr5PLq9n2ua8xJRL/0HQ/bvDsnt
 emRKRRksE+muYsuh36LnNUHw9uFE4SoazaThlXNMYNBX58cR7sOn5475W8Y0jhqBCKOk
 jL1w==
X-Gm-Message-State: AOAM532esvaWOEIHgtjCfekBLmWZ3ph1KEzoUsZjh+F4AFPljMKVfdPN
 11BTM8DDStHeTpJjHEq5Uw171Wl0IVccptwTi5uiMi9J50V+W1U=
X-Google-Smtp-Source: ABdhPJwbOu4mpzJUirGdLeWIdXLnWv1mNuElv6A4BjvHz3fP/hy5DR/Oxijs+Ic26HS+FP4LCvImMpZRzDd4dYGnPZE=
X-Received: by 2002:a50:951e:: with SMTP id u30mr884814eda.197.1606162675659; 
 Mon, 23 Nov 2020 12:17:55 -0800 (PST)
MIME-Version: 1.0
References: <20201118223513.2704722-1-morbo@google.com>
 <20201120224034.191382-1-morbo@google.com>
 <20201120224034.191382-4-morbo@google.com> <87d0041vaf.fsf@mpe.ellerman.id.au>
 <20201123063432.GG2672@gate.crashing.org>
 <CAGG=3QVjSAwU+ebvH=Lk5YVMxW7=ThvkJXGPw+95nYxxuurMig@mail.gmail.com>
 <20201123195622.GI2672@gate.crashing.org>
 <CAGG=3QXR=Yfh8PNa4m-kQLTBP4YKD8OGm_6fSUgeasQ1ar9b2g@mail.gmail.com>
 <20201123200846.GJ2672@gate.crashing.org>
In-Reply-To: <20201123200846.GJ2672@gate.crashing.org>
From: Bill Wendling <morbo@google.com>
Date: Mon, 23 Nov 2020 12:17:44 -0800
Message-ID: <CAGG=3QUeXTU+8jqw40W_rhatsHCRiuTboL3enz9bpt_jaJC3TA@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] powerpc/64s: feature: Work around inline asm issues
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
Cc: Nick Desaulniers <ndesaulniers@google.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Nov 23, 2020 at 12:10 PM Segher Boessenkool
<segher@kernel.crashing.org> wrote:
> On Mon, Nov 23, 2020 at 12:01:01PM -0800, Bill Wendling wrote:
> > On Mon, Nov 23, 2020 at 11:58 AM Segher Boessenkool
> > <segher@kernel.crashing.org> wrote:
> > > > On Sun, Nov 22, 2020 at 10:36 PM Segher Boessenkool
> > > > <segher@kernel.crashing.org> wrote:
> > > > > "true" (as a result of a comparison) in as is -1, not 1.
> > >
> > > On Mon, Nov 23, 2020 at 11:43:11AM -0800, Bill Wendling wrote:
> > > > What Segher said. :-) Also, if you reverse the comparison, you'll get
> > > > a build error.
> > >
> > > But that means your patch is the wrong way around?
> > >
> > > -       .ifgt (label##4b- label##3b)-(label##2b- label##1b);    \
> > > -       .error "Feature section else case larger than body";    \
> > > -       .endif;                                                 \
> > > +       .org . - ((label##4b-label##3b) > (label##2b-label##1b)); \
> > >
> > > It should be a + in that last line, not a -.
> >
> > I said so in a follow up email.
>
> Yeah, and that arrived a second after I pressed "send" :-)
>
Michael, I apologize for the churn with these patches. I believe the
policy is to resend the match as "v4", correct?

I ran tests with the change above. It compiled with no error. If I
switch the labels around to ".org . + ((label##2b-label##1b) >
(label##4b-label##3b))", then it fails as expected.

-bw
