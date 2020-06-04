Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A44D1EECC9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jun 2020 23:06:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49dJHX0hsmzDqHw
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jun 2020 07:06:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::344;
 helo=mail-wm1-x344.google.com; envelope-from=dje.gcc@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=uUGjDal4; dkim-atps=neutral
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49dFVf6ZypzDqRv
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Jun 2020 05:01:11 +1000 (AEST)
Received: by mail-wm1-x344.google.com with SMTP id r9so6263894wmh.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Jun 2020 12:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TAb2zqBpcbUaIxqO2cRqIQ8Nd9P8dVeR5qUMBkvA0ZM=;
 b=uUGjDal43dyrA26zYLLe6MHEFkmdu69YhdVSmtmTHwdRGoTYhuKz2NunjjjnC6VEPJ
 FiYZgohv2gN+b4ELnA4MHHD6SPUiDjH/0W1s8bld8Hr6uzo3GjECmexszkEB8oWOZeKc
 lFH0KC3sv7MbvSmgykShnOacknj1pqnyo/wQY7bIExzakJD74MrXUkXsSIwk2KfXm8OJ
 XZG4lh5mx6VONpORuhdImbfxK4GqUgTQcu2d4SyRyyGLCyEwZleW6WqnNzcPmNrBCW8a
 ajs9t78rtmtkm6NfBIAqxANV/xWO8Ki+nsxa/JcSbplwhWDmMVUYUe3qXPVh0CHmHfnV
 WqHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TAb2zqBpcbUaIxqO2cRqIQ8Nd9P8dVeR5qUMBkvA0ZM=;
 b=uXW2y7D2apOJ8CMFK++x8z6QiimBp3MFjmiVrFBmSrqZ4DggBg85sWlUtpIBmFdHrC
 PA2V1daG+sUud+i3GhlOwSIlZAmltvNkVgKRJkG9SwvmItuNaZsxmh17tQ8zAWARUhJH
 oA2BSkiFMZUf55eVhXVfILzonHzaHtDx/xKBEhJDBOu/WTvfGRR6o8srvqzhZPLfY+Ba
 Jab7J44isfVvSQ/eSvJrPbUnKVN+AiBaIeEC/6Wk3J7AGQold1uBGO4RnHNkvWdDPQ/A
 CZY5datvOf+81c+Xw9h+0/jbizp6sxR+Lq8TO8v8h1gXWV8/XSVNM/FJyQhYOHBdINTH
 M7bg==
X-Gm-Message-State: AOAM5334NAar7NAvcDfZkZBMD772SQ68bsmYW+k6KSaqets2hlT56kNS
 43GU7J2S6Q77Wfk8cCnQvXyj1+LXXh6e2pYPVo0=
X-Google-Smtp-Source: ABdhPJxSobRjBWVYP4ybjQ8tJ0/OsSfXgB1BTq2ITmnVFOU4tf/Vean/ZzTAWBtU1yczZ/kkf07zcqSCFyVoU0HetqA=
X-Received: by 2002:a1c:9d96:: with SMTP id g144mr5143394wme.126.1591297263142; 
 Thu, 04 Jun 2020 12:01:03 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.DEB.2.21.2006012119010.11121@digraph.polyomino.org.uk>
 <c821b608-f14f-4a68-bbec-b7b6c1d8bddc@www.fastmail.com>
 <alpine.DEB.2.21.2006012329420.11121@digraph.polyomino.org.uk>
 <b44b3aa7-f9cc-43e1-b2c4-0edb6ea06189@www.fastmail.com>
 <alpine.DEB.2.21.2006021334170.24059@digraph.polyomino.org.uk>
 <20200602142337.GS25173@kitsune.suse.cz>
 <3aeb6dfe-ae23-42f9-ac23-16be6b54a850@www.fastmail.com>
 <20200604171232.GG31009@gate.crashing.org>
 <20200604171844.GO1079@brightrain.aerifal.cx>
 <20200604173312.GI31009@gate.crashing.org>
 <20200604174613.GP1079@brightrain.aerifal.cx>
In-Reply-To: <20200604174613.GP1079@brightrain.aerifal.cx>
From: David Edelsohn <dje.gcc@gmail.com>
Date: Thu, 4 Jun 2020 15:00:51 -0400
Message-ID: <CAGWvnymiNUWSMeGNDvJk_uc=8OdS1Y_8uE=cd0s2BKCFFe7Dkg@mail.gmail.com>
Subject: Re: [musl] Re: ppc64le and 32-bit LE userland compatibility
To: musl@lists.openwall.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 05 Jun 2020 07:01:19 +1000
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
Cc: GNU C Library <libc-alpha@sourceware.org>, eery@paperfox.es,
 Daniel Kolesa <daniel@octaforge.org>,
 Will Springer <skirmisher@protonmail.com>,
 Palmer Dabbelt via binutils <binutils@sourceware.org>,
 via libc-dev <libc-dev@lists.llvm.org>,
 =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>,
 linuxppc-dev@lists.ozlabs.org, Joseph Myers <joseph@codesourcery.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 4, 2020 at 1:46 PM Rich Felker <dalias@libc.org> wrote:
>
> On Thu, Jun 04, 2020 at 12:33:12PM -0500, Segher Boessenkool wrote:
> > On Thu, Jun 04, 2020 at 01:18:44PM -0400, Rich Felker wrote:
> > > On Thu, Jun 04, 2020 at 12:12:32PM -0500, Segher Boessenkool wrote:
> > > > On Tue, Jun 02, 2020 at 05:13:25PM +0200, Daniel Kolesa wrote:
> > > > > well, ppc64le already cannot be run on those, as far as I know (I
> > > > > don't think it's possible to build ppc64le userland without VSX in
> > > > > any configuration)
> > > >
> > > > VSX is required by the ELFv2 ABI:
> > > >
> > > > """
> > > > Specifically, to use this ABI and ABI-compliant programs, OpenPOWER-
> > > > compliant processors must implement the following categories:
> > >
> > > This is not actually ABI but IBM policy laundered into an ABI
> > > document, which musl does not honor.
> >
> > It is the ABI.  If you think it should be different, make your own ABI,
> > don't pretend the existing ABI is different than what it is.  Thank you.
>
> Our ABI is as specified in the ELFv2 document, but with ld as ld64,
> and minus gratuitous requirements on ISA level that are not part of
> implementing linkage.

Rich,

If you are changing the Power ELFv2 ABI then it is not the Power ELFv2
ABI.  You can't cherry-pick what you like and claim that it is
compatible.  You are not conforming to the ABI.

Thanks, David
