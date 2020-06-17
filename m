Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB311FD43C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jun 2020 20:18:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49nCxK3fq2zDq72
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jun 2020 04:18:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::442;
 helo=mail-pf1-x442.google.com; envelope-from=ndesaulniers@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=gMJvLtSi; dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49nCvZ3G9lzDqwC
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jun 2020 04:16:58 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id b5so1524645pfp.9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Jun 2020 11:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9iHpdxTSsJV8Zk3XZ13SNgoX2KXs00CS5Ze28gN8oq4=;
 b=gMJvLtSibvq67YGso8XYpxFnSmLZoRjXPPUqyKDRwnWdCpcHeBmiNXdCbfKIchRtS/
 hSrhpIY5G7Y545ckpnYuA0wk9iqFRhMBkVDUmF6WUUfqekbbOSIevevUjfvYN4Ajzg10
 JOlCYV4rfTaZeQjmKY2lxB1ix82WlXrDuFdOrFqYvVFVv3+83qGR6eAk+PqJSucsnE25
 Hb99nFfaWuFRgy0aSWVLAUOlzrVOWXFzx8nqFIvPjvOLp+sIB6Wbbbt3E2kymty5XyHK
 uuj9vWZadGn6o20m/C7bRAb/vv7JfEx3QnVGPygvY0Qm7ipcvW5t+9VJoz8Au7Mkpd0O
 nRqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9iHpdxTSsJV8Zk3XZ13SNgoX2KXs00CS5Ze28gN8oq4=;
 b=guADhnUDpe1wgBnnd1xfQO/W6AsAXsp2Pq8PUFzt4V7ckEHzUv6X3hy1ZKVNNKmpE7
 xphdNQ0ZfVrNJxSKmksfdqR2yRvPesDcGf0+VAfBAQj45XG8IMTPw9+alhLLh3kYL84k
 P2pmcKR1U84/y3T2xZ+8f2cwHPCfxG7rqwxCOJfWam6kSBwlbf5C3CNmgfnszeqGqzi4
 C2pMRZIpGFsrHZPl44PU4CFMl3cqUdEODFpqqcWM8zEHbn//VA8CY9a6cjP+LM562fSB
 FSUD6KRH/Tffx6KB7m5uQNQ7+S4iqaTl5alepIh+PLWpy4W++jpkcNpiNALcu3HmUWmU
 FnrA==
X-Gm-Message-State: AOAM532LPsDzS0E4wkdlRTEkL/Ns8aUdVIMbX/J3RX94y1Fu7SVxDyAN
 EX04zqQC+XexJlRSSL+9WM4VEHn3HvwJ85J7kp1NnQ==
X-Google-Smtp-Source: ABdhPJzfTBWS0aJ5XI2zVM6jazuKCFG/ugBxDHwAZofS2hb3/+lnVHVZ9XQKA3bIEz+6O/pqZK+UEL1W9pWZ+PUEU/4=
X-Received: by 2002:a05:6a00:15ca:: with SMTP id o10mr247pfu.169.1592417814250; 
 Wed, 17 Jun 2020 11:16:54 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1590079968.git.christophe.leroy@csgroup.eu>
 <8c593895e2cb57d232d85ce4d8c3a1aa7f0869cc.1590079968.git.christophe.leroy@csgroup.eu>
 <20200616002720.GA1307277@ubuntu-n2-xlarge-x86>
 <68503e5e-7456-b81c-e43d-27cb331a4b72@xilinx.com>
 <20200616181630.GA3403678@ubuntu-n2-xlarge-x86>
 <50fb2dd6-4e8f-a550-6eda-073beb86f2ff@xilinx.com>
 <87bllidmk4.fsf@mpe.ellerman.id.au> <878sgmdmcv.fsf@mpe.ellerman.id.au>
In-Reply-To: <878sgmdmcv.fsf@mpe.ellerman.id.au>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 17 Jun 2020 11:16:42 -0700
Message-ID: <CAKwvOdnkcjLGay0jdQ77kHTmKhE56F9jvzh01XWwEE8rjbhLAA@mail.gmail.com>
Subject: Re: [PATCH v5 01/13] powerpc: Remove Xilinx PPC405/PPC440 support
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
Cc: Arnd Bergmann <arnd@arndb.de>, Michal Simek <michal.simek@xilinx.com>,
 LKML <linux-kernel@vger.kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Paul Mackerras <paulus@samba.org>,
 Nathan Chancellor <natechancellor@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 17, 2020 at 3:20 AM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Michael Ellerman <mpe@ellerman.id.au> writes:
> > Michal Simek <michal.simek@xilinx.com> writes:
> <snip>
>
> >> Or if bamboo requires uImage to be built by default you can do it via
> >> Kconfig.
> >>
> >> diff --git a/arch/powerpc/platforms/44x/Kconfig
> >> b/arch/powerpc/platforms/44x/Kconfig
> >> index 39e93d23fb38..300864d7b8c9 100644
> >> --- a/arch/powerpc/platforms/44x/Kconfig
> >> +++ b/arch/powerpc/platforms/44x/Kconfig
> >> @@ -13,6 +13,7 @@ config BAMBOO
> >>         select PPC44x_SIMPLE
> >>         select 440EP
> >>         select FORCE_PCI
> >> +       select DEFAULT_UIMAGE
> >>         help
> >>           This option enables support for the IBM PPC440EP evaluation board.
> >
> > Who knows what the actual bamboo board used. But I'd be happy to take a
> > SOB'ed patch to do the above, because these days the qemu emulation is
> > much more likely to be used than the actual board.
>
> I just went to see why my CI boot of 44x didn't catch this, and it's
> because I don't use the uImage, I just boot the vmlinux directly:
>
>   $ qemu-system-ppc -M bamboo -m 128m -display none -kernel build~/vmlinux -append "console=ttyS0" -display none -nodefaults -serial mon:stdio
>   Linux version 5.8.0-rc1-00118-g69119673bd50 (michael@alpine1-p1) (gcc (Ubuntu 9.3.0-10ubuntu2) 9.3.0, GNU ld (GNU Binutils for Ubuntu) 2.34) #4 Wed Jun 17 20:19:22 AEST 2020
>   Using PowerPC 44x Platform machine description
>   ioremap() called early from find_legacy_serial_ports+0x690/0x770. Use early_ioremap() instead
>   printk: bootconsole [udbg0] enabled
>
>
> So that's probably the simplest solution?

If the uImage or zImage self decompresses, I would prefer to test that as well.

> That means previously arch/powerpc/boot/zImage was just a hardlink to
> the uImage:

It sounds like we can just boot the zImage, or is that no longer
created with the uImage?
-- 
Thanks,
~Nick Desaulniers
