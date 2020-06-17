Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D2C1FCAB1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jun 2020 12:22:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49n1Mh59p8zDqws
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jun 2020 20:22:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49n1Kv1Cg3zDqHf
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Jun 2020 20:20:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=lbRHhw/n; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49n1Kt37Xcz9sSn;
 Wed, 17 Jun 2020 20:20:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1592389234;
 bh=oW+aFhY14nVcErSZ1Yr17+EOjunMNqELZDGyY/r4C/Y=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=lbRHhw/nhzDMFxl8iYyc5SrpaxVTXQMRUwQKKZSfAxRKKg93xAROFcATq8H3RsSlC
 d75MOAO59PYtsjMkRYUuwMccPf/naGXDi7Reovhr+UDv9sNU7cnuv/AkILZM5wAEsl
 DE6LfbKp25olwBXMRK+AIfoc5thMBq8rTbbYDu9koN53rpuo8TeUgpiK+41RGya2TX
 tjxqKJMypuZ4jrp64FsddFqF9ZBwFLH3whXX4fmBOlq42X0kM4SMf/rhbPHTi6cVbE
 E2nYkuH8p0QpOTzjUx4pnJW1FPJozgD8d4kyh6HuZrnwGscvnvdx0OO6Zckpz+V/St
 B4rcbwJyPaNOQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Michal Simek <michal.simek@xilinx.com>,
 Nathan Chancellor <natechancellor@gmail.com>,
 Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH v5 01/13] powerpc: Remove Xilinx PPC405/PPC440 support
In-Reply-To: <87bllidmk4.fsf@mpe.ellerman.id.au>
References: <cover.1590079968.git.christophe.leroy@csgroup.eu>
 <8c593895e2cb57d232d85ce4d8c3a1aa7f0869cc.1590079968.git.christophe.leroy@csgroup.eu>
 <20200616002720.GA1307277@ubuntu-n2-xlarge-x86>
 <68503e5e-7456-b81c-e43d-27cb331a4b72@xilinx.com>
 <20200616181630.GA3403678@ubuntu-n2-xlarge-x86>
 <50fb2dd6-4e8f-a550-6eda-073beb86f2ff@xilinx.com>
 <87bllidmk4.fsf@mpe.ellerman.id.au>
Date: Wed, 17 Jun 2020 20:21:04 +1000
Message-ID: <878sgmdmcv.fsf@mpe.ellerman.id.au>
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
Cc: arnd@arndb.de, linux-kernel@vger.kernel.org,
 clang-built-linux@googlegroups.com, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman <mpe@ellerman.id.au> writes:
> Michal Simek <michal.simek@xilinx.com> writes:
<snip>

>> Or if bamboo requires uImage to be built by default you can do it via
>> Kconfig.
>>
>> diff --git a/arch/powerpc/platforms/44x/Kconfig
>> b/arch/powerpc/platforms/44x/Kconfig
>> index 39e93d23fb38..300864d7b8c9 100644
>> --- a/arch/powerpc/platforms/44x/Kconfig
>> +++ b/arch/powerpc/platforms/44x/Kconfig
>> @@ -13,6 +13,7 @@ config BAMBOO
>>         select PPC44x_SIMPLE
>>         select 440EP
>>         select FORCE_PCI
>> +       select DEFAULT_UIMAGE
>>         help
>>           This option enables support for the IBM PPC440EP evaluation board.
>
> Who knows what the actual bamboo board used. But I'd be happy to take a
> SOB'ed patch to do the above, because these days the qemu emulation is
> much more likely to be used than the actual board.

I just went to see why my CI boot of 44x didn't catch this, and it's
because I don't use the uImage, I just boot the vmlinux directly:

  $ qemu-system-ppc -M bamboo -m 128m -display none -kernel build~/vmlinux -append "console=ttyS0" -display none -nodefaults -serial mon:stdio
  Linux version 5.8.0-rc1-00118-g69119673bd50 (michael@alpine1-p1) (gcc (Ubuntu 9.3.0-10ubuntu2) 9.3.0, GNU ld (GNU Binutils for Ubuntu) 2.34) #4 Wed Jun 17 20:19:22 AEST 2020
  Using PowerPC 44x Platform machine description
  ioremap() called early from find_legacy_serial_ports+0x690/0x770. Use early_ioremap() instead
  printk: bootconsole [udbg0] enabled


So that's probably the simplest solution?

cheers
