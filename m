Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 72FA0227750
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jul 2020 06:02:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B9lKr5B9qzDqVd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jul 2020 14:02:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=telegraphics.com.au (client-ip=98.124.60.144;
 helo=kvm5.telegraphics.com.au; envelope-from=fthain@telegraphics.com.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=telegraphics.com.au
Received: from kvm5.telegraphics.com.au (kvm5.telegraphics.com.au
 [98.124.60.144])
 by lists.ozlabs.org (Postfix) with ESMTP id 4B9lJ02YjXzDqVR
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jul 2020 14:00:47 +1000 (AEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by kvm5.telegraphics.com.au (Postfix) with ESMTP id E0F9D29AFB;
 Tue, 21 Jul 2020 00:00:37 -0400 (EDT)
Date: Tue, 21 Jul 2020 14:00:33 +1000 (AEST)
From: Finn Thain <fthain@telegraphics.com.au>
To: Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH v2 13/16] scripts/kallsyms: move ignored symbol types to
 is_ignored_symbol()
In-Reply-To: <CAK7LNATVDfHJG=+G6DqkR-vSyVhb8KmxcT0ae+ukdi_otthi8A@mail.gmail.com>
Message-ID: <alpine.LNX.2.23.453.2007211312530.8@nippy.intranet>
References: <20191123160444.11251-1-yamada.masahiro@socionext.com>
 <20191123160444.11251-14-yamada.masahiro@socionext.com>
 <alpine.LNX.2.23.453.2007201132240.8@nippy.intranet>
 <CAK7LNATVDfHJG=+G6DqkR-vSyVhb8KmxcT0ae+ukdi_otthi8A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 20 Jul 2020, Masahiro Yamada wrote:

> 
> I got a similar report before.
> 
> I'd like to know whether or not
> this is the same issue as fixed by
> 7883a14339299773b2ce08dcfd97c63c199a9289
> 

The problem can be observed with 3d77e6a8804ab ("Linux 5.7").
So it appears that 7883a14339299 ("scripts/kallsyms: fix wrong 
kallsyms_relative_base") is not sufficient to fix it.

> 
> Does your problem happen on the latest kernel?

Unfortunately this cross compiler (gcc 4.6.4) is too old to build 
v5.8-rc1 or later. I will have to upgrade.

> Which version of binutils are you using?
> 

This toolchain uses binutils 2.22.

In case it helps,

$ powerpc-linux-gnu-nm -n vmlinux |head                  
         w mach_chrp
00000005 a LG_CACHELINE_BYTES
00000005 a LG_CACHELINE_BYTES
00000005 a LG_CACHELINE_BYTES
0000000c a Hash_bits
0000001f a CACHELINE_MASK
0000001f a CACHELINE_MASK
0000001f a CACHELINE_MASK
00000020 a CACHELINE_BYTES
00000020 a CACHELINE_BYTES
00000020 a CACHELINE_BYTES
00000020 a reg
0003ffc0 a Hash_msk
c0000000 T _start
c0000000 A _stext
c0000000 A _text
c000000c T __start
c0000054 t __after_mmu_off
c0000090 t turn_on_mmu
c00000c4 T __secondary_hold
c00000dc T __secondary_hold_spinloop
c00000e0 T __secondary_hold_acknowledge
c0000100 t Reset
