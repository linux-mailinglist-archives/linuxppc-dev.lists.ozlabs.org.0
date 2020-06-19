Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5659B200774
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jun 2020 13:04:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49pGCL251czDrNt
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jun 2020 21:04:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49pG9G4rnRzDrN0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jun 2020 21:02:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=hUvsuHH5; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49pG9F1Hymz9sNR;
 Fri, 19 Jun 2020 21:02:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1592564546;
 bh=rAqfkxmj6miJ3CdT8VIZQ0jD0mt69z6oFkgb4VkM+nY=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=hUvsuHH5zg5MocG6lzLJUaAKWnDpXsp2BPw0cRbwBaGO1Fn6oezy66yxwASCm8T5x
 osaTYp3QrtnE2Ykbh7/w6JxL3vnqsSfk+KgGSbCGsBH/evnydr9q/sAjbeqTlxyhMb
 QCrfQiN89P2uMjuKC80eNU0caqS/dCUEm5JEtmeYHwYsdOI4ABGXmlKgmZG8UU0Uxa
 RrIedFQ2RuKhfY4eVjwyjQ0BqnzcoMR3g3X+6XQTukvZDfpCgXB/qJ/bQUmUwOl0Oq
 RrYzGRmTZho7O8Cg/gFkcCdQ5ZvbxOO2cbkSrMLy917NBAvwP6ccLR2HRidkRDxjGR
 U4Bu9ryECzzmA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nathan Chancellor <natechancellor@gmail.com>
Subject: Re: [PATCH v5 01/13] powerpc: Remove Xilinx PPC405/PPC440 support
In-Reply-To: <20200618031622.GA195@Ryzen-9-3900X.localdomain>
References: <cover.1590079968.git.christophe.leroy@csgroup.eu>
 <8c593895e2cb57d232d85ce4d8c3a1aa7f0869cc.1590079968.git.christophe.leroy@csgroup.eu>
 <20200616002720.GA1307277@ubuntu-n2-xlarge-x86>
 <68503e5e-7456-b81c-e43d-27cb331a4b72@xilinx.com>
 <20200616181630.GA3403678@ubuntu-n2-xlarge-x86>
 <50fb2dd6-4e8f-a550-6eda-073beb86f2ff@xilinx.com>
 <87bllidmk4.fsf@mpe.ellerman.id.au> <878sgmdmcv.fsf@mpe.ellerman.id.au>
 <CAKwvOdnkcjLGay0jdQ77kHTmKhE56F9jvzh01XWwEE8rjbhLAA@mail.gmail.com>
 <87tuz9ci7e.fsf@mpe.ellerman.id.au>
 <20200618031622.GA195@Ryzen-9-3900X.localdomain>
Date: Fri, 19 Jun 2020 21:02:53 +1000
Message-ID: <87eeqbco82.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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

Nathan Chancellor <natechancellor@gmail.com> writes:
> On Thu, Jun 18, 2020 at 10:48:21AM +1000, Michael Ellerman wrote:
>> Nick Desaulniers <ndesaulniers@google.com> writes:
>> > On Wed, Jun 17, 2020 at 3:20 AM Michael Ellerman <mpe@ellerman.id.au> wrote:
>> >> Michael Ellerman <mpe@ellerman.id.au> writes:
>> >> > Michal Simek <michal.simek@xilinx.com> writes:
>> >> <snip>
>> >>
>> >> >> Or if bamboo requires uImage to be built by default you can do it via
>> >> >> Kconfig.
>> >> >>
>> >> >> diff --git a/arch/powerpc/platforms/44x/Kconfig
>> >> >> b/arch/powerpc/platforms/44x/Kconfig
>> >> >> index 39e93d23fb38..300864d7b8c9 100644
>> >> >> --- a/arch/powerpc/platforms/44x/Kconfig
>> >> >> +++ b/arch/powerpc/platforms/44x/Kconfig
>> >> >> @@ -13,6 +13,7 @@ config BAMBOO
>> >> >>         select PPC44x_SIMPLE
>> >> >>         select 440EP
>> >> >>         select FORCE_PCI
>> >> >> +       select DEFAULT_UIMAGE
>> >> >>         help
>> >> >>           This option enables support for the IBM PPC440EP evaluation board.
>> >> >
>> >> > Who knows what the actual bamboo board used. But I'd be happy to take a
>> >> > SOB'ed patch to do the above, because these days the qemu emulation is
>> >> > much more likely to be used than the actual board.
>> >>
>> >> I just went to see why my CI boot of 44x didn't catch this, and it's
>> >> because I don't use the uImage, I just boot the vmlinux directly:
>> >>
>> >>   $ qemu-system-ppc -M bamboo -m 128m -display none -kernel build~/vmlinux -append "console=ttyS0" -display none -nodefaults -serial mon:stdio
>> >>   Linux version 5.8.0-rc1-00118-g69119673bd50 (michael@alpine1-p1) (gcc (Ubuntu 9.3.0-10ubuntu2) 9.3.0, GNU ld (GNU Binutils for Ubuntu) 2.34) #4 Wed Jun 17 20:19:22 AEST 2020
>> >>   Using PowerPC 44x Platform machine description
>> >>   ioremap() called early from find_legacy_serial_ports+0x690/0x770. Use early_ioremap() instead
>> >>   printk: bootconsole [udbg0] enabled
>> >>
>> >>
>> >> So that's probably the simplest solution?
>> >
>> > If the uImage or zImage self decompresses, I would prefer to test that as well.
>> 
>> The uImage is decompressed by qemu AIUI.
>> 
>> >> That means previously arch/powerpc/boot/zImage was just a hardlink to
>> >> the uImage:
>> >
>> > It sounds like we can just boot the zImage, or is that no longer
>> > created with the uImage?
>> 
>> The zImage won't boot on bamboo.
>> 
>> Because of the vagaries of the arch/powerpc/boot/Makefile the zImage
>> ends up pointing to treeImage.ebony, which is for a different board.
>> 
>> The zImage link is made to the first item in $(image-y):
>> 
>> $(obj)/zImage:		$(addprefix $(obj)/, $(image-y))
>> 	$(Q)rm -f $@; ln $< $@
>>                          ^
>>                          first preqrequisite
>> 
>> Which for this defconfig happens to be:
>> 
>> image-$(CONFIG_EBONY)			+= treeImage.ebony cuImage.ebony
>> 
>> If you turned off CONFIG_EBONY then the zImage will be a link to
>> treeImage.bamboo, but qemu can't boot that either.
>> 
>> It's kind of nuts that the zImage points to some arbitrary image
>> depending on what's configured and the order of things in the Makefile.
>> But I'm not sure how we make it less nuts without risking breaking
>> people's existing setups.
>
> Hi Michael,
>
> For what it's worth, this is squared this away in terms of our CI by
> just building and booting the uImage directly, rather than implicitly
> using the zImage:
>
> https://github.com/ClangBuiltLinux/continuous-integration/pull/282
> https://github.com/ClangBuiltLinux/boot-utils/pull/22

Great.

> We were only using the zImage because that is what Joel Stanley intially
> set us up with when PowerPC 32-bit was added to our CI:
>
> https://github.com/ClangBuiltLinux/continuous-integration/pull/100

Ah, so Joel owes us all beers then ;)

> Admittedly, we really do not have many PowerPC experts in our
> organization so we are supporting it on a "best effort" basis, which
> often involves using whatever knowledge is floating around or can be
> gained from interactions such as this :) so thank you for that!

No worries. I definitely don't expect you folks to invest much effort in
powerpc, especially the old 32-bit stuff, so always happy to help debug
things, and really appreciate the testing you do.

cheers
