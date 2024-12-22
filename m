Return-Path: <linuxppc-dev+bounces-4398-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 002659FA34F
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Dec 2024 03:13:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YG4Sz2qbyz2yVG;
	Sun, 22 Dec 2024 13:13:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.32.83.9
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734833619;
	cv=none; b=R7GLq0swBRtqauGI/VcqJ1VYz89nqRRr+TzMF5Nd5zwNfVLdSgDpJIXqV7UZMAP3dtgmycEWf8f4Je76PhSP25MX6dpVkjHM9diEksU6LrmGeDZU/bMwmn5aVlpBw7FEpV+oY34gW+467FVqBuLmVNVBIY4hDJdE5aIoR/kb5jVry+Cdx9Sb9CNQDowWUkfFejTqXQfbTO05Io9fNrZQrXOTj4+kMvs0e0Sr+nguF7PJLtLaW6Zwahep0/XDaS+l11p/htKdrGeegctBknVBqJYwAjqKfDwHqdMaE8BK+a2Z5SYMWYgAYoK9eiWiWynLqGXsgr28OY3UPJy0Av+iLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734833619; c=relaxed/relaxed;
	bh=UfNPNzbE3LB22VLu/FvH42h4lAPnp0exBQmKRx6Eu8g=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=NhKPNTdb6FxqQ9lheGZE33vSMMHmrZnPwBQZgxAY6SssKD6iJjwqsPrm8gtdB62U7/xbOFBzwWOTHgmzuYcQWOfhj51JaLi3I9+XUYC0oJrI5dtgV0xa5vbOtRd8g2lfhXnpdjkprAUzY+YNz+M4hoqjQfWSFNSv996QDMx0R9enEe/tIMFRYNHh+ENAGXuxhaKQRprUMY1gcd3qVreomEeajsfuKzjzsrz9bvqMFbW9RPNYDHqp9XoVMXKvu9PwgqYP6FZxvsRyqTTt9DCEfnnvL/Tp/J43+42AccB7r+P3w/wue73nl5MWSoIWG8O0fId4v4eCgFIcSs2D5+X64Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=Wilcox-Tech.com; spf=pass (client-ip=45.32.83.9; helo=mail.wilcox-tech.com; envelope-from=awilcox@wilcox-tech.com; receiver=lists.ozlabs.org) smtp.mailfrom=wilcox-tech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=Wilcox-Tech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wilcox-tech.com (client-ip=45.32.83.9; helo=mail.wilcox-tech.com; envelope-from=awilcox@wilcox-tech.com; receiver=lists.ozlabs.org)
Received: from mail.wilcox-tech.com (mail.wilcox-tech.com [45.32.83.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YG4Sx3sfPz2yDH
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Dec 2024 13:13:36 +1100 (AEDT)
Received: (qmail 18201 invoked from network); 22 Dec 2024 02:13:27 -0000
Received: from ip98-184-130-195.tu.ok.cox.net (HELO smtpclient.apple) (AWilcox@Wilcox-Tech.com@98.184.130.195)
  by mail.wilcox-tech.com with ESMTPA; 22 Dec 2024 02:13:27 -0000
Content-Type: text/plain;
	charset=utf-8
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.600.62\))
Subject: Re: [PATCH v2 4/5] powerpc: kvm: drop 32-bit book3s
From: "A. Wilcox" <AWilcox@Wilcox-Tech.com>
In-Reply-To: <20241221214223.3046298-5-arnd@kernel.org>
Date: Sat, 21 Dec 2024 20:13:12 -0600
Cc: kvm@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Huacai Chen <chenhuacai@kernel.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Alexander Graf <graf@amazon.com>,
 Crystal Wood <crwood@redhat.com>,
 Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@atishpatra.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Sean Christopherson <seanjc@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Paul Durrant <paul@xen.org>,
 Marc Zyngier <maz@kernel.org>,
 linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org,
 kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <9B9E07F0-3373-4F59-BE4C-E6C425B3C36D@Wilcox-Tech.com>
References: <20241221214223.3046298-1-arnd@kernel.org>
 <20241221214223.3046298-5-arnd@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
X-Mailer: Apple Mail (2.3774.600.62)
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Dec 21, 2024, at 3:42=E2=80=AFPM, Arnd Bergmann <arnd@kernel.org> =
wrote:
>=20
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> Support for KVM on 32-bit Book III-s implementations was added in 2010
> and supports PowerMac, CHRP, and embedded platforms using the =
Freescale G4
> (mpc74xx), e300 (mpc83xx) and e600 (mpc86xx) CPUs from 2003 to 2009.
>=20
> Earlier 603/604/750 machines might work but would be even more limited
> by their available memory.
>=20
> The only likely users of KVM on any of these were the final Apple
> PowerMac/PowerBook/iBook G4 models with 2GB of RAM that were at the =
high
> end 20 years ago but are just as obsolete as their x86-32 =
counterparts.
> The code has been orphaned since 2023.
>=20
> There is still a need to support 32-bit guests in order to better
> debug problems on ppc32 kernels. This should work in theory on both
> 64-bit booke and on 64-bit book3s hosts, but it would be good to
> confirm that this is still the case before the known working option
> gets removed.


I can confirm that running 6.12.5 on a P9 host, trying to boot a 6.6
32-bit kernel gave me:

Detected RAM kernel at 400000 (1330c8c bytes)=20
       Welcome to Open Firmware

  Copyright (c) 2004, 2017 IBM Corporation All rights reserved.
  This program and the accompanying materials are made available
  under the terms of the BSD License available at
  http://www.opensource.org/licenses/bsd-license.php

Booting from memory...
=20
( 380 ) Data Segment Exception [ -bfc00000 ]


    R0 .. R7           R8 .. R15         R16 .. R23         R24 .. R31
00000000014a1124   0000000000000000   000000000135b4ac   =
0000000000000000  =20
000000000dc70f30   ffffffffc0000000   000000000dc70fa4   =
000000000173600c  =20
0000000000000000   000000000e477010   0000000000000000   =
0000000000400000  =20
ffffffff0141be4c   000000000149ab74   00000000ffffffff   =
0000000000000008  =20
00000000c0014b6c   0000000020000402   0000000040400000   =
00000000016f2000  =20
ffffffff40400000   0000000000000000   0000000000000000   =
000000000dc70f60  =20
0000000000000000   0000000000000000   000000000e73d490   =
000000000149f000  =20
0000000000000000   000000000e756118   000000000dc70fa0   =
ffffffff40400000  =20

    CR / XER           LR / CTR          SRR0 / SRR1        DAR / DSISR
        80000402   00000000014a1124   00000000014a1128   =
ffffffff0141be4c  =20
0000000020040000   0000000000000000   8000000000003000           =
00000000  =20


2 >=20

Which is the same thing that happens if you boot a 32-bit Linux kernel
on a physical 64-bit Power machine.  This is probably because KVM is
so much more accurate than TCG for Power emulation :)

That said, I would like to keep the support alive for more than just
ppc32 kernel testing.  There are plenty of Power Macs with enough
memory to run some environments within KVM.  Ad=C3=A9lie=E2=80=99s new =
release
boots a full XFCE desktop in under 300 MB RAM, so even a 1 GB machine
has enough memory to run AmigaOS, Mac OS 9, or another XFCE in KVM.

I have found a few bugs in testing newer kernels, and one of them
affects all targets lower than Power7, which means 32-bit and 64-bit BE.
I am preparing to send those patches in.  I will continue shaking out
any remaining bugs on my 32-bit host.  I hope that these patches can
be useful, and possibly stimulate more interest so 32-bit support can
be maintained again.

In fairness, I do agree that there is very little value in keeping =
32-bit
MIPS or RISC-V support since the chips that support it are so limited.
32-bit Power however serves actual purposes.  32-bit x86 could be useful
to make sure =E2=80=9CKVM on 32-bit in general=E2=80=9D is easier to =
keep going,
but if it is causing maintenance issues then I suppose it can go.

Sincerely,
-Anna=

