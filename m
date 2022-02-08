Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C46F24AD54D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Feb 2022 11:09:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JtJfD3Bbcz3bWG
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Feb 2022 21:09:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=TVpfDjy5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JtJdY3tRnz2y7J
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Feb 2022 21:09:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=TVpfDjy5; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4JtJdY3sdhz4xPv;
 Tue,  8 Feb 2022 21:09:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1644314961;
 bh=yXl3AZYQrZw7s0aZ+eXOJCs/xZwv0TDb10KVrRwKODQ=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=TVpfDjy5jul5ib8mSA4h72sf6YI/NtL03fJM0sCVMh/ly3qtkU0Ci/IvFKMM2R0QS
 Xa0ssQO5Y1fT8rjdBVzdB5gLkDB4SwJktxcXIqYnbgw/NPBPgTADxUPqNGOVx540vd
 jz6Br5lRCM3hczXqnVE51xC54zswEDRWg6dXeDdjWZ7tsunqATFsxOUBMPOftapOfN
 w1uBuBMeo1yuGsv+6SKIH7Gf8fkmRvkK61IwNZAiC6hbz2dLIru+EfCPtZgqAX62sU
 TSKqxo74XXCbZqgI9JQx8JKi0taIAafwQRnoQftTbO3U9KozfbdpfZKxhMDGq9YNvq
 vd0FjngpX++nw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Paul Menzel <pmenzel@molgen.mpg.de>, "Paul E. McKenney"
 <paulmck@kernel.org>
Subject: Re: =?utf-8?Q?rcutorture=E2=80=99s?= init segfaults in ppc64le VM
In-Reply-To: <565038d7-7374-1005-31bf-df2f051845ff@molgen.mpg.de>
References: <565038d7-7374-1005-31bf-df2f051845ff@molgen.mpg.de>
Date: Tue, 08 Feb 2022 21:09:17 +1100
Message-ID: <871r0dmzzm.fsf@mpe.ellerman.id.au>
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
Cc: rcu@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Paul Menzel <pmenzel@molgen.mpg.de> writes:
> Dear Linux folks,

Hi Paul,

> On the POWER8 server IBM S822LC running Ubuntu 21.10, building Linux 
> 5.17-rc2+ with rcutorture tests

I'm not sure if that's the host kernel version or the version you're
using of rcutorture? Can you tell us the sha1 of your host kernel and of
the tree you're running rcutorture from?

>      $ tools/testing/selftests/rcutorture/bin/torture.sh --duration 10
>
> the built init
>
>      $ file tools/testing/selftests/rcutorture/initrd/init
>      tools/testing/selftests/rcutorture/initrd/init: ELF 64-bit LSB 
> executable, 64-bit PowerPC or cisco 7500, version 1 (SYSV), statically 
> linked, BuildID[sha1]=0ded0e45649184a296f30d611f7a03cc51ecb616, for 
> GNU/Linux 3.10.0, stripped

Mine looks pretty much identical:

  $ file tools/testing/selftests/rcutorture/initrd/init
  tools/testing/selftests/rcutorture/initrd/init: ELF 64-bit LSB
  executable, 64-bit PowerPC or cisco 7500, version 1 (SYSV), statically
  linked, BuildID[sha1]=86078bf6e5d54ab0860d36aa9a65d52818b972c8, for
  GNU/Linux 3.10.0, stripped


> segfaults in QEMU. From one of the log files

But mine doesn't segfault, it runs fine and the test completes.

What qemu version are you using?

I tried 4.2.1 and 6.2.0, both worked.


> /dev/shm/linux/tools/testing/selftests/rcutorture/res/2022.02.01-21.52.37-torture/results-rcutorture/TREE03/console.log
>
>      [    1.119803][    T1] Run /init as init process
>      [    1.122011][    T1] init[1]: segfault (11) at f0656d90 nip 10000a18 lr 0 code 1 in init[10000000+d0000]
>      [    1.124863][    T1] init[1]: code: 2c2903e7 f9210030 4081ff84 4bffff58 00000000 01000000 00000580 3c40100f
>      [    1.128823][    T1] init[1]: code: 38427c00 7c290b78 782106e4 38000000 <f821ff81> 7c0803a6 f8010000 e9028010

The disassembly from 3c40100f is:
  lis     r2,4111
  addi    r2,r2,31744
  mr      r9,r1
  rldicr  r1,r1,0,59
  li      r0,0
  stdu    r1,-128(r1)		<- fault
  mtlr    r0
  std     r0,0(r1)
  ld      r8,-32752(r2)


I think you'll find that's the code at the ELF entry point. You can
check with:

 $ readelf -e tools/testing/selftests/rcutorture/initrd/init | grep Entry
   Entry point address:               0x10000c0c

 $ objdump -d tools/testing/selftests/rcutorture/initrd/init | grep -m 1 -A 8 10000c0c
    10000c0c:   0e 10 40 3c     lis     r2,4110
    10000c10:   00 7b 42 38     addi    r2,r2,31488
    10000c14:   78 0b 29 7c     mr      r9,r1
    10000c18:   e4 06 21 78     rldicr  r1,r1,0,59
    10000c1c:   00 00 00 38     li      r0,0
    10000c20:   81 ff 21 f8     stdu    r1,-128(r1)
    10000c24:   a6 03 08 7c     mtlr    r0
    10000c28:   00 00 01 f8     std     r0,0(r1)
    10000c2c:   10 80 02 e9     ld      r8,-32752(r2)


The fault you're seeing is the first store using the stack pointer (r1),
which is setup by the kernel.

The fault address f0656d90 is weirdly low, the stack should be up near 128TB.

I'm not sure how we end up with a bad r1.

Can you dump some info about the kernel that was built, something like:

$ file /dev/shm/linux/tools/testing/selftests/rcutorture/res/2022.02.01-21.52.37-torture/results-rcutorture/TREE03/vmlinux

And maybe paste/attach the full log, maybe there's a clue somewhere.

cheers
