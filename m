Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 060E31FEA7E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jun 2020 06:57:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49nV6F2SlfzDrBZ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jun 2020 14:57:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1041;
 helo=mail-pj1-x1041.google.com; envelope-from=natechancellor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=qqUUsVQ2; dkim-atps=neutral
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49nRt54CTQzDqHG
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jun 2020 13:16:29 +1000 (AEST)
Received: by mail-pj1-x1041.google.com with SMTP id d6so2007790pjs.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Jun 2020 20:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=BQ6+gpUp0LDm306U72ZZjOm3CRXIXZhyD96bzGv7Trs=;
 b=qqUUsVQ27Wr3RSWWeIuxq+vOUb3yQy0jEJMER/HF4our6EKbACz5wNRGb1nGwtJgpW
 IZ0oQW8wuLO3tlCwkoGfSK7V/1NJ8Odxc2vmB1fOsKQQSjMVtooJT0s67O8pfGFz67dF
 Hxc/l5vuvJAd5NGXJwNO26/I0cdgJij2vOEHPSkVkquD7xDmFcIJNdF14yUEkrtAsDSp
 2dp3knP8DyuuKTZ4D2D4mVJL5LgFJYb7Gujz4WknXXjv/iW5TSCKfvbgNKbRRpCC9Eym
 hlGZmmLSFwwhCyHEUZpQLLWxHqYbS4EVOUhJfHDCk60oNXp/hC2ldyJt2+cuqUgQmnvM
 9VgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BQ6+gpUp0LDm306U72ZZjOm3CRXIXZhyD96bzGv7Trs=;
 b=I8agVUByBFvpy/I7x1fh4A7QScTu25DHH03PFYX4ifg2ckXx25tnfk0OY7Q295LEEg
 wRHCsSEJrybKpNidvRFd2BYFjoPJMnM/mZt7AcwacYSi/eIvfpOfMvRcTag+UBlamZSS
 azwpJfqta4y2A/VafbrWIGw/+0Qh1xqBtjJ/ZV7xGXKfAKGaTSuPODHqrdncWT5La4lR
 5NXUxZmXE9IQzWiOhbsutDel9Yeemaob6IbGQJEdQUwEZ+cSMIjhWUwtKYU5W6b66HU6
 QyX4/kdSEc0FzZyJe+ClIbFKDOlSxzc/RHyTsyG8NLQ/1daRLYaLnLh0Pu+WRVVrxG9/
 /WGA==
X-Gm-Message-State: AOAM53176MxcMA8wH003FXx09Eu3ZlVTtAu6fNbMpcAMgRa5wQo9mabL
 vSWUemnSHqukxJy31XeTkiA=
X-Google-Smtp-Source: ABdhPJzucOhKEzBF+sfQPGWmraO9UIK7gK+Ok0b4VTWLnJdk2MtX0vpyUe42k79e9V833o+kB/KE6Q==
X-Received: by 2002:a17:90a:a405:: with SMTP id
 y5mr2092260pjp.15.1592450185243; 
 Wed, 17 Jun 2020 20:16:25 -0700 (PDT)
Received: from Ryzen-9-3900X.localdomain ([89.46.114.134])
 by smtp.gmail.com with ESMTPSA id r2sm1031469pgg.23.2020.06.17.20.16.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 20:16:24 -0700 (PDT)
Date: Wed, 17 Jun 2020 20:16:22 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v5 01/13] powerpc: Remove Xilinx PPC405/PPC440 support
Message-ID: <20200618031622.GA195@Ryzen-9-3900X.localdomain>
References: <cover.1590079968.git.christophe.leroy@csgroup.eu>
 <8c593895e2cb57d232d85ce4d8c3a1aa7f0869cc.1590079968.git.christophe.leroy@csgroup.eu>
 <20200616002720.GA1307277@ubuntu-n2-xlarge-x86>
 <68503e5e-7456-b81c-e43d-27cb331a4b72@xilinx.com>
 <20200616181630.GA3403678@ubuntu-n2-xlarge-x86>
 <50fb2dd6-4e8f-a550-6eda-073beb86f2ff@xilinx.com>
 <87bllidmk4.fsf@mpe.ellerman.id.au>
 <878sgmdmcv.fsf@mpe.ellerman.id.au>
 <CAKwvOdnkcjLGay0jdQ77kHTmKhE56F9jvzh01XWwEE8rjbhLAA@mail.gmail.com>
 <87tuz9ci7e.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87tuz9ci7e.fsf@mpe.ellerman.id.au>
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
Cc: Arnd Bergmann <arnd@arndb.de>, Nick Desaulniers <ndesaulniers@google.com>,
 Michal Simek <michal.simek@xilinx.com>, LKML <linux-kernel@vger.kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 18, 2020 at 10:48:21AM +1000, Michael Ellerman wrote:
> Nick Desaulniers <ndesaulniers@google.com> writes:
> > On Wed, Jun 17, 2020 at 3:20 AM Michael Ellerman <mpe@ellerman.id.au> wrote:
> >> Michael Ellerman <mpe@ellerman.id.au> writes:
> >> > Michal Simek <michal.simek@xilinx.com> writes:
> >> <snip>
> >>
> >> >> Or if bamboo requires uImage to be built by default you can do it via
> >> >> Kconfig.
> >> >>
> >> >> diff --git a/arch/powerpc/platforms/44x/Kconfig
> >> >> b/arch/powerpc/platforms/44x/Kconfig
> >> >> index 39e93d23fb38..300864d7b8c9 100644
> >> >> --- a/arch/powerpc/platforms/44x/Kconfig
> >> >> +++ b/arch/powerpc/platforms/44x/Kconfig
> >> >> @@ -13,6 +13,7 @@ config BAMBOO
> >> >>         select PPC44x_SIMPLE
> >> >>         select 440EP
> >> >>         select FORCE_PCI
> >> >> +       select DEFAULT_UIMAGE
> >> >>         help
> >> >>           This option enables support for the IBM PPC440EP evaluation board.
> >> >
> >> > Who knows what the actual bamboo board used. But I'd be happy to take a
> >> > SOB'ed patch to do the above, because these days the qemu emulation is
> >> > much more likely to be used than the actual board.
> >>
> >> I just went to see why my CI boot of 44x didn't catch this, and it's
> >> because I don't use the uImage, I just boot the vmlinux directly:
> >>
> >>   $ qemu-system-ppc -M bamboo -m 128m -display none -kernel build~/vmlinux -append "console=ttyS0" -display none -nodefaults -serial mon:stdio
> >>   Linux version 5.8.0-rc1-00118-g69119673bd50 (michael@alpine1-p1) (gcc (Ubuntu 9.3.0-10ubuntu2) 9.3.0, GNU ld (GNU Binutils for Ubuntu) 2.34) #4 Wed Jun 17 20:19:22 AEST 2020
> >>   Using PowerPC 44x Platform machine description
> >>   ioremap() called early from find_legacy_serial_ports+0x690/0x770. Use early_ioremap() instead
> >>   printk: bootconsole [udbg0] enabled
> >>
> >>
> >> So that's probably the simplest solution?
> >
> > If the uImage or zImage self decompresses, I would prefer to test that as well.
> 
> The uImage is decompressed by qemu AIUI.
> 
> >> That means previously arch/powerpc/boot/zImage was just a hardlink to
> >> the uImage:
> >
> > It sounds like we can just boot the zImage, or is that no longer
> > created with the uImage?
> 
> The zImage won't boot on bamboo.
> 
> Because of the vagaries of the arch/powerpc/boot/Makefile the zImage
> ends up pointing to treeImage.ebony, which is for a different board.
> 
> The zImage link is made to the first item in $(image-y):
> 
> $(obj)/zImage:		$(addprefix $(obj)/, $(image-y))
> 	$(Q)rm -f $@; ln $< $@
>                          ^
>                          first preqrequisite
> 
> Which for this defconfig happens to be:
> 
> image-$(CONFIG_EBONY)			+= treeImage.ebony cuImage.ebony
> 
> If you turned off CONFIG_EBONY then the zImage will be a link to
> treeImage.bamboo, but qemu can't boot that either.
> 
> It's kind of nuts that the zImage points to some arbitrary image
> depending on what's configured and the order of things in the Makefile.
> But I'm not sure how we make it less nuts without risking breaking
> people's existing setups.
> 
> cheers

Hi Michael,

For what it's worth, this is squared this away in terms of our CI by
just building and booting the uImage directly, rather than implicitly
using the zImage:

https://github.com/ClangBuiltLinux/continuous-integration/pull/282
https://github.com/ClangBuiltLinux/boot-utils/pull/22

We were only using the zImage because that is what Joel Stanley intially
set us up with when PowerPC 32-bit was added to our CI:

https://github.com/ClangBuiltLinux/continuous-integration/pull/100

Admittedly, we really do not have many PowerPC experts in our
organization so we are supporting it on a "best effort" basis, which
often involves using whatever knowledge is floating around or can be
gained from interactions such as this :) so thank you for that!

Cheers,
Nathan
