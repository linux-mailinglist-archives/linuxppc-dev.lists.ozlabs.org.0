Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BABE9533B54
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 May 2022 13:10:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L7SzQ1kQ3z3cfJ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 May 2022 21:10:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=sntech.de
 (client-ip=185.11.138.130; helo=gloria.sntech.de;
 envelope-from=heiko@sntech.de; receiver=<UNKNOWN>)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L7Sz110PLz2y7V
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 May 2022 21:10:18 +1000 (AEST)
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1ntou5-0005Nh-BQ; Wed, 25 May 2022 13:10:13 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Guo Ren <guoren@kernel.org>, Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH V9 20/20] riscv: compat: Add COMPAT Kbuild skeletal support
Date: Wed, 25 May 2022 13:10:12 +0200
Message-ID: <3418219.V25eIC5XRa@diego>
In-Reply-To: <6435704.4vTCxPXJkl@diego>
References: <20220322144003.2357128-1-guoren@kernel.org>
 <20220524220646.GA3990738@roeck-us.net> <6435704.4vTCxPXJkl@diego>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
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
Cc: linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Guo Ren <guoren@linux.alibaba.com>,
 Parisc List <linux-parisc@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christoph Hellwig <hch@lst.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Am Mittwoch, 25. Mai 2022, 12:57:30 CEST schrieb Heiko St=FCbner:
> Am Mittwoch, 25. Mai 2022, 00:06:46 CEST schrieb Guenter Roeck:
> > On Wed, May 25, 2022 at 01:46:38AM +0800, Guo Ren wrote:
> > [ ... ]
> >=20
> > > > The problem is come from "__dls3's vdso decode part in musl's
> > > > ldso/dynlink.c". The ehdr->e_phnum & ehdr->e_phentsize are wrong.
> > > >
> > > > I think the root cause is from musl's implementation with the wrong
> > > > elf parser. I would fix that soon.
> > > Not elf parser, it's "aux vector just past environ[]". I think I could
> > > solve this, but anyone who could help dig in is welcome.
> > >=20
> >=20
> > I am not sure I understand what you are saying here. Point is that my
> > root file system, generated with musl a year or so ago, crashes with
> > your patch set applied. That is a regression, even if there is a bug
> > in musl.
>=20
> Also as I said in the other part of the thread, the rootfs seems innocent,
> as my completely-standard Debian riscv64 rootfs is also affected.
>=20
> The merged version seems to be v12 [0] - not sure how we this discussion
> ended up in v9, but I just tested this revision in two variants:
>=20
> - v5.17 + this v9 -> works nicely

I take that back ... now going back to that build I somehow also run into
that issue here ... will investigate more.


> - v5.18-rc6 + this v9 (rebased onto it) -> breaks the boot
>   The only rebase-conflict was with the introduction of restartable
>   sequences and removal of the tracehook include, but turning CONFIG_RSEQ
>   off doesn't seem to affect the breakage.
>=20
> So it looks like something changed between 5.17 and 5.18 that causes the =
issue.
>=20
>=20
> Heiko
>=20
>=20
> [0] https://lore.kernel.org/all/20220405071314.3225832-1-guoren@kernel.or=
g/
>=20




