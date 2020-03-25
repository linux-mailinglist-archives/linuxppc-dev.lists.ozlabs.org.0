Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 930D6192E4D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Mar 2020 17:36:35 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48nYfS25ZjzDqfL
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Mar 2020 03:36:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=maskray@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=ln7nrqHL; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48nYcS6j1NzDqWH
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Mar 2020 03:34:42 +1100 (AEDT)
Received: by mail-pf1-x441.google.com with SMTP id d25so1291115pfn.6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Mar 2020 09:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=53I1ZUmEkX7E7kUoNR7ym1JpMnqNwdwGnZNoPknk3Xw=;
 b=ln7nrqHLHy6dQu6F3HCJYejvXyWvZ89N7CRtDZpN6ntlu9MaP+NQ61i5ZnTLaY4pR2
 K5W+KmjYOtqEd5qt+6quDmRXfIfk3Wt6ovI0TjI81LJ8w2u37+085yw2frTX+Cah7VNb
 dPSfKK7Oibn+tltPQD0rLvS2Gp8pIEsBYob5GG1ySFvoPQly/qhIyCgW70+gNx4eUAs1
 4hXsP88cifwt3f2Abo0NGenqIirC3am4PNdqjvG5541OmwrPp00MGdRgI/lo793Ha4xx
 Ue97xLtx83lu94Na/JMZkVZsHtQ8+JY7/z+pv5j/6LY95M2PrQFhSe54vMQ+FNuKZ8Fl
 sKZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=53I1ZUmEkX7E7kUoNR7ym1JpMnqNwdwGnZNoPknk3Xw=;
 b=Wvk5DMNLs7wIeuApUHDiApm3VKv7IXg6PZNT/TiGEakr3tq/fpKi+BDF4W3nznGM+x
 LlNf1VqxcWSrKTtn8F7/NEdVMGcP2neDl3ZjFl5SPmQcwsb44cMywoLznXWtj7K+c/Go
 c+lgs7tlGgXkZpu0N4IXE5pkilds7xT0PQ0ldl4eF3/D27Bul3AnAUGz25NteW3GK8b7
 Axfk8twnuZWmMh/eu3EdR00SzOyrZmbwLtGj1LPsP3/mmJfniqxpFEY38p+IKLl1zH+t
 VxP3VbDwID99SEGZkFINfRDdYnB9wdR+sJGTHpD7BbWu61lSyyItM7eIQJUliMFRH7HL
 DZ/Q==
X-Gm-Message-State: ANhLgQ2evPZvBbQcdtoZ9nAT7u//rKcMaYnaOrX+wownjKWq+9Rju5mp
 e2efXJWPKh+Xk8Ljc0uRZdJYjw==
X-Google-Smtp-Source: ADFU+vsLYAo8klC7QlmicZX3EG3H1XzuXymz176S5+bMSHi/yRxFeuwxKu/bHHrzu/8+WVbJ54oq8A==
X-Received: by 2002:aa7:96c8:: with SMTP id h8mr4181269pfq.49.1585154078900;
 Wed, 25 Mar 2020 09:34:38 -0700 (PDT)
Received: from google.com ([2620:15c:2ce:0:9efe:9f1:9267:2b27])
 by smtp.gmail.com with ESMTPSA id g14sm18477470pfb.131.2020.03.25.09.34.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Mar 2020 09:34:38 -0700 (PDT)
Date: Wed, 25 Mar 2020 09:34:34 -0700
From: Fangrui Song <maskray@google.com>
To: Alan Modra <amodra@gmail.com>
Subject: Re: [PATCH] powerpc/boot: Delete unneeded .globl _zimage_start
Message-ID: <20200325163434.qvm3h57slivq52eu@google.com>
References: <20200325051820.163253-1-maskray@google.com>
 <CACPK8Xf70Yq2szW110G_2f2Q3J6inVqQY4Y-y0tggkVmT7tmfw@mail.gmail.com>
 <20200325083702.GE4583@bubble.grove.modra.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20200325083702.GE4583@bubble.grove.modra.org>
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
Cc: Nick Desaulniers <ndesaulniers@google.com>,
 clang-built-linux@googlegroups.com, Joel Stanley <joel@jms.id.au>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2020-03-25, Alan Modra wrote:
>On Wed, Mar 25, 2020 at 05:22:31AM +0000, Joel Stanley wrote:
>> On Wed, 25 Mar 2020 at 05:19, Fangrui Song <maskray@google.com> wrote:
>> >
>> > .globl sets the symbol binding to STB_GLOBAL while .weak sets the
>> > binding to STB_WEAK. They should not be used together. It is accidetal
>> > rather then intentional that GNU as let .weak override .globl while
>> > clang integrated assembler let the last win.
>
>No, it isn't accidental.  gas deliberately lets .weak override .globl.
>Since 1996-07-26, git commit 5ca547dc239

Fair. I am sadded by this commit.

% sed -n 'N;/.globl.*\n.*.weak/p;D' binutils-gdb/gas/testsuite/**/*(.)

I checked all occurrences and none is a real test excercising the behavior (.weak override .globl).
All seem accidental.


It is unclear that clang integrated assembler should copy this
behavior, though. For the record, I asked on binutils@sourceware.org
whether the assembler should error when .weak/.local can override a
previous binding directive. It was rejected
https://sourceware.org/pipermail/binutils/2020-March/110376.html

On the clang integrated assembler side, we may try building things with
an error or leave the overriding behavior as is.

>I'm fine with the patch so far as it is true that there is no need for
>both .globl and .weak (and it looks silly to have both), but the
>explanation isn't true.  The patch is needed because the clang
>assembler is incompatible with gas in this detail.

Since using one of .weak|.globl is nearly well-known, I'll send PATCH v2 with
the description updated.

On 2020-03-25, Segher Boessenkool wrote:
>Nothing is "overridden".
>
>The as manual says (.weak):
>
>  This directive sets the weak attribute on the comma separated list of
>  symbol 'names'.  If the symbols do not already exist, they will be
>  created.
>
>so this behaviour is obviously as intended (or was later documented in
>any case), so LLVM has a bug to fix (whether you like this (much saner)
>behaviour or not).

I will probably not call this a bug. I have recently discovered other
discrepancy for which I think copying gas behaviors can just clutter up the
code. We may need our own assembler documentation at some point.

>> > Fixes: cd197ffcf10b "[POWERPC] zImage: Cleanup and improve zImage entry point"
>> > Fixes: ee9d21b3b358 "powerpc/boot: Ensure _zimage_start is a weak symbol"
>> > Link: https://github.com/ClangBuiltLinux/linux/issues/937
>> > Signed-off-by: Fangrui Song <maskray@google.com>
>> > Cc: Joel Stanley <joel@jms.id.au>
>> > Cc: Michael Ellerman <mpe@ellerman.id.au>
>> > Cc: Nick Desaulniers <ndesaulniers@google.com>
>> > Cc: clang-built-linux@googlegroups.com
>> > ---
>> >  arch/powerpc/boot/crt0.S | 3 ---
>> >  1 file changed, 3 deletions(-)
>> >
>> > diff --git a/arch/powerpc/boot/crt0.S b/arch/powerpc/boot/crt0.S
>> > index 92608f34d312..1d83966f5ef6 100644
>> > --- a/arch/powerpc/boot/crt0.S
>> > +++ b/arch/powerpc/boot/crt0.S
>> > @@ -44,9 +44,6 @@ p_end:                .long   _end
>> >  p_pstack:      .long   _platform_stack_top
>> >  #endif
>> >
>> > -       .globl  _zimage_start
>> > -       /* Clang appears to require the .weak directive to be after the symbol
>> > -        * is defined. See https://bugs.llvm.org/show_bug.cgi?id=38921  */
>> >         .weak   _zimage_start
>> >  _zimage_start:
>>
>> Your explanation makes sense to me. I've added Alan to cc for his review.
>>
>> Reviewed-by: Joel Stanley <joel@jms.id.au>
>>
>> Thanks for the patch.
>>
>> Cheers,
>>
>> Joel
>>
>> >         .globl  _zimage_start_lib
>> > --
>> > 2.25.1.696.g5e7596f4ac-goog
>
>-- 
>Alan Modra
>Australia Development Lab, IBM
