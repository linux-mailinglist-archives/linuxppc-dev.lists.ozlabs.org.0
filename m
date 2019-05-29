Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD6B2DEF8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 May 2019 15:57:08 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45DXMQ0RjQzDq9L
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 May 2019 23:57:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45DXKM2GvKzDqFv
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 May 2019 23:55:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 45DXKL4YXPz9s3l; Wed, 29 May 2019 23:55:18 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45DXKL1HWpz9s3Z;
 Wed, 29 May 2019 23:55:17 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Masahiro Yamada <yamada.masahiro@socionext.com>,
 Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH] powerpc/configs: Rename foo_basic_defconfig to
 foo_base.config
In-Reply-To: <CAK7LNAS3iTOeX5b2F7E9PeWqma1_hx7Tbrt2V=3fvrqhSk5Zug@mail.gmail.com>
References: <20190528081614.26096-1-mpe@ellerman.id.au>
 <20190528121009.GA11901@infradead.org>
 <CAK7LNAS3iTOeX5b2F7E9PeWqma1_hx7Tbrt2V=3fvrqhSk5Zug@mail.gmail.com>
Date: Wed, 29 May 2019 23:55:16 +1000
Message-ID: <87zhn5nz5n.fsf@concordia.ellerman.id.au>
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
Cc: linuxppc-dev@ozlabs.org,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Masahiro Yamada <yamada.masahiro@socionext.com> writes:
> On Tue, May 28, 2019 at 9:10 PM Christoph Hellwig <hch@infradead.org> wrote:
>>
>> On Tue, May 28, 2019 at 06:16:14PM +1000, Michael Ellerman wrote:
>> > We have several "defconfigs" that are not actually full defconfigs
>> > they are just a base set of options which are then merged with other
>> > fragments to produce a working defconfig.
>
> The default values from Kconfig files are used
> where CONFIG options are not specified by the defconfig.
>
> So, I think corenet_basic_defconfig is a full defconfig
> even if it contains a single CONFIG option.

That's technically true, but it's not a full defconfig in the sense that
it doesn't define a meaningful set of options for building for a
specific machine. In fact if you build it you get a .config that doesn't
include the one option it defines, CONFIG_CORENET_GENERIC=y.

> Since the difference between "*_defconfig" and "*.config"
> is ambiguous in some cases, it depends on the intended usage.

I'm pretty sure all the existing foo.config files are fragments that are
intended to be merged with an existing .config or other fragments.

ie:

These are fragments:
  arch/arm/configs/dram_0x00000000.config
  arch/arm/configs/dram_0xc0000000.config
  arch/arm/configs/dram_0xd0000000.config

These are all fragments:
  arch/powerpc/configs/be.config
  arch/powerpc/configs/book3s_32.config
  arch/powerpc/configs/altivec.config
  arch/powerpc/configs/85xx-hw.config
  arch/powerpc/configs/guest.config
  arch/powerpc/configs/85xx-smp.config
  arch/powerpc/configs/85xx-64bit.config
  arch/powerpc/configs/dpaa.config
  arch/powerpc/configs/85xx-32bit.config
  arch/powerpc/configs/fsl-emb-nonhw.config
  arch/powerpc/configs/86xx-smp.config
  arch/powerpc/configs/le.config
  arch/powerpc/configs/86xx-hw.config

Pretty sure these all are, they're used in gen_generic_defconfigs in arch/mips/Makefile:
  arch/mips/configs/generic/board-xilfpga.config
  arch/mips/configs/generic/board-ocelot.config
  arch/mips/configs/generic/board-ni169445.config
  arch/mips/configs/generic/32r6.config
  arch/mips/configs/generic/64r1.config
  arch/mips/configs/generic/32r1.config
  arch/mips/configs/generic/64r6.config
  arch/mips/configs/generic/eb.config
  arch/mips/configs/generic/micro32r2.config
  arch/mips/configs/generic/32r2.config
  arch/mips/configs/generic/board-boston.config
  arch/mips/configs/generic/el.config
  arch/mips/configs/generic/board-ranchu.config
  arch/mips/configs/generic/64r2.config
  arch/mips/configs/generic/board-sead-3.config

These are also both fragments:
  arch/x86/configs/tiny.config
  arch/x86/configs/xen.config


>> > The most obvious example is corenet_basic_defconfig which only
>> > contains one symbol CONFIG_CORENET_GENERIC=y. But there is also
>> > mpc85xx_base_defconfig which doesn't actually enable CONFIG_PPC_85xx.
>> >
>> > To avoid confusion, rename these config fragments to "foo_base.config"
>> > to make it clearer that they are not full defconfigs.
>>
>> Adding linux-kbuild, maybe we can make the handling of these fragments
>> generic and actually document it..
>
> I do not know how it should be documented.

Me either.

cheers
