Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 796F17B1EA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2019 20:26:41 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45ylPn3gxgzDqWs
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2019 04:26:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.222.196; helo=mail-qk1-f196.google.com;
 envelope-from=arndbergmann@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
 [209.85.222.196])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45ylMT1yh5zDqWH
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jul 2019 04:24:34 +1000 (AEST)
Received: by mail-qk1-f196.google.com with SMTP id a27so47327978qkk.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2019 11:24:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ELs8WXXvt2Nkvxci62TT76ZUPbF4S3pMgT3/gsD16Yg=;
 b=bCiQgcPcHWAB2JxZ20+m0p1QV83y9GDe3EkfXwZSnpEk1+5S7IxBK2KAXswXMFGAL/
 NZOfpYiy6E6/xogbOymfjtw5CnYlKsPQalVasrkbyWQtj5pJEHfXuuJYm4I1vwquH3zz
 yU1X4NXlDPly/LMOW7VKpe9MLRMINzPIrNtVWgCQWl6Q410CkU7ipFKGizj554dAiqyU
 7W0JF6W5ftNjAUvlYF6sEtZ1E5TYzWIUz/2K2tA0VOdzSDw8yndMwpUar9bWV5yzUgT/
 EY+5OKfJyz3kyFXDlH1MONxH8qQObhh9KhmCk5k2sTusTTmPvlZjwh0S47r6FcF8ED2d
 8Icw==
X-Gm-Message-State: APjAAAV6v3BaKTkVonrQ9r4QHdIvBN9yQZVEVyF4K9SmMA/egFixBTws
 ltaD9r6g/id69v7ixmUMjxuEa4KB1xLvzAkTm1w=
X-Google-Smtp-Source: APXvYqw0YE69zRoJRlHpqf+lgOqtR/yc+lKsnQOITZmISxo4fV9UOHAPi3cwNRHYae2yNSx6QOkQGDl/06JVPF1xutQ=
X-Received: by 2002:a37:ad12:: with SMTP id f18mr32660393qkm.3.1564511071739; 
 Tue, 30 Jul 2019 11:24:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190729202542.205309-1-ndesaulniers@google.com>
 <20190729203246.GA117371@archlinux-threadripper>
 <20190729215200.GN31406@gate.crashing.org>
 <CAK8P3a1GQSyCj1L8fFG4Pah8dr5Lanw=1yuimX1o+53ARzOX+Q@mail.gmail.com>
 <20190730134856.GO31406@gate.crashing.org>
 <CAK8P3a2755_6xq453C2AePLW8BeQk_Jg=HfjB_F-zyVMnQDfdg@mail.gmail.com>
 <20190730161637.GP31406@gate.crashing.org>
In-Reply-To: <20190730161637.GP31406@gate.crashing.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 30 Jul 2019 20:24:14 +0200
Message-ID: <CAK8P3a0_ovcX9tOo1UQ3_1UmM=+A2X=yErw27i2pHOj4XD40-A@mail.gmail.com>
Subject: Re: [PATCH] powerpc: workaround clang codegen bug in dcbz
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
Cc: kbuild test robot <lkp@intel.com>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Paul Mackerras <paulus@samba.org>,
 Nathan Chancellor <natechancellor@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 30, 2019 at 6:16 PM Segher Boessenkool
<segher@kernel.crashing.org> wrote:
>
> On Tue, Jul 30, 2019 at 04:30:29PM +0200, Arnd Bergmann wrote:
> > On Tue, Jul 30, 2019 at 3:49 PM Segher Boessenkool
> > <segher@kernel.crashing.org> wrote:
> > >
> > > On Tue, Jul 30, 2019 at 09:34:28AM +0200, Arnd Bergmann wrote:
> > > > Upon a second look, I think the issue is that the "Z" is an input argument
> > > > when it should be an output. clang decides that it can make a copy of the
> > > > input and pass that into the inline asm. This is not the most efficient
> > > > way, but it seems entirely correct according to the constraints.
> > >
> > > Most dcb* (and all icb*) do not change the memory pointed to.  The
> > > memory is an input here, logically as well, and that is obvious.
> >
> > Ah, right. I had only thought of dcbz here, but you are right that using
> > an output makes little sense for the others.
> >
> > readl() is another example where powerpc currently uses "Z" for an
> > input, which illustrates this even better.
>
> in_le32 and friends?  Yeah, huh.  If LLVM copies that to the stack as
> well, its (not byte reversing) read will be atomic just fine, so things
> will still work correctly.

byteorder is fine, the problem I was thinking of is when moving the load/store
instructions around the barriers that synchronize with DMA, or turning
them into different-size accesses. Changing two consecutive 16-bit mmio reads
into an unaligned 32-bit read will rarely have the intended effect ;-)

       Arnd
