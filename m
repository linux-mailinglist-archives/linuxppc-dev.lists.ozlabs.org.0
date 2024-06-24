Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C38914297
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jun 2024 08:15:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fu-berlin.de header.i=@fu-berlin.de header.a=rsa-sha256 header.s=fub01 header.b=ZVOcJnF0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W6yPm33HHz30VX
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jun 2024 16:15:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fu-berlin.de header.i=@fu-berlin.de header.a=rsa-sha256 header.s=fub01 header.b=ZVOcJnF0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=zedat.fu-berlin.de (client-ip=130.133.4.66; helo=outpost1.zedat.fu-berlin.de; envelope-from=glaubitz@zedat.fu-berlin.de; receiver=lists.ozlabs.org)
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W6yP01vStz30VF
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jun 2024 16:14:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ew1xoLiUEpaRO/Rd2+BU3bX5mn9fF1xUB9iaO1b3Vho=; t=1719209701; x=1719814501; 
	b=ZVOcJnF0dMblzyH4RK3avv4D9orfkLgW8DHDWLx+njFcqhgEEDMyILyX178qIeZ46rqhDuTWckj
	j5h51mTGpqa0OGUTR8v037X/5e8Xwlc3dKL5dcZH/FMaauv6fZ0SsaSnv0aOitER4bBS7YoP1Bz8E
	8gho3e6Aw1Da/eip2a6MSOy2N/CmfLqf5zVKR3SGcG02iCO75yOEu5sudMdWb0CNigOOLn7ebK7E5
	JhIProbuO1swFUTZU/lGKcN6qPJQuT4ebguP/Z1Mv/7FmMp8qgtkXVBFaxL+76tGVnO0TdFYHHrxS
	y+G47VFQiALiokYBlVPcM9+Z2jbiT3a2poqA==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.97)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1sLcyL-00000003SnY-21KD; Mon, 24 Jun 2024 08:14:37 +0200
Received: from dynamic-077-191-015-086.77.191.pool.telefonica.de ([77.191.15.86] helo=[192.168.178.20])
          by inpost2.zedat.fu-berlin.de (Exim 4.97)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1sLcyL-00000002KF0-2nE0; Mon, 24 Jun 2024 08:14:37 +0200
Message-ID: <e0e373fa13636a403322fd0ba96915fd25dbbefa.camel@physik.fu-berlin.de>
Subject: Re: [PATCH 09/15] sh: rework sync_file_range ABI
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>,
 Linux-Arch <linux-arch@vger.kernel.org>, linux-kernel@vger.kernel.org
Date: Mon, 24 Jun 2024 08:14:36 +0200
In-Reply-To: <9d4ba5e5-bb7f-432e-9354-47cc84eaa9e1@app.fastmail.com>
References: <20240620162316.3674955-1-arnd@kernel.org>
	 <20240620162316.3674955-10-arnd@kernel.org>
	 <366548c1a0d9749e42c0d0c993414a353c9b0b02.camel@physik.fu-berlin.de>
	 <9d4ba5e5-bb7f-432e-9354-47cc84eaa9e1@app.fastmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 77.191.15.86
X-ZEDAT-Hint: PO
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
Cc: Rich Felker <dalias@libc.org>, Andreas Larsson <andreas@gaisler.com>, guoren <guoren@kernel.org>, "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, linux-s390@vger.kernel.org, linux-hexagon@vger.kernel.org, Helge Deller <deller@gmx.de>, linux-sh@vger.kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, "musl@lists.openwall.com" <musl@lists.openwall.com>, Nicholas Piggin <npiggin@gmail.com>, Alexander Viro <viro@zeniv.linux.org.uk>, LTP List <ltp@lists.linux.it>, Brian Cain <bcain@quicinc.com>, Christian Brauner <brauner@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Xi Ruoyao <libc-alpha@sourceware.org>, linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org, stable@vger.kernel.org, linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Arnd,

On Fri, 2024-06-21 at 11:41 +0200, Arnd Bergmann wrote:
> On Fri, Jun 21, 2024, at 10:44, John Paul Adrian Glaubitz wrote:
> > On Thu, 2024-06-20 at 18:23 +0200, Arnd Bergmann wrote:
> > > From: Arnd Bergmann <arnd@arndb.de>
> > >=20
> > > The unusual function calling conventions on superh ended up causing
> >                                               ^^^^^^
> >                                        It's spelled SuperH
>=20
> Fixed now.
>=20
> > > diff --git a/arch/sh/kernel/sys_sh32.c b/arch/sh/kernel/sys_sh32.c
> > > index 9dca568509a5..d5a4f7c697d8 100644
> > > --- a/arch/sh/kernel/sys_sh32.c
> > > +++ b/arch/sh/kernel/sys_sh32.c
> > > @@ -59,3 +59,14 @@ asmlinkage int sys_fadvise64_64_wrapper(int fd, u3=
2 offset0, u32 offset1,
> > >  				 (u64)len0 << 32 | len1, advice);
> > >  #endif
> > >  }
> > > +
> > > +/*
> > > + * swap the arguments the way that libc wants it instead of
> >=20
> > I think "swap the arguments to the order that libc wants them" would
> > be easier to understand here.
>=20
> Done

Thanks for the two improvements!

> > > diff --git a/arch/sh/kernel/syscalls/syscall.tbl b/arch/sh/kernel/sys=
calls/syscall.tbl
> > > index bbf83a2db986..c55fd7696d40 100644
> > > --- a/arch/sh/kernel/syscalls/syscall.tbl
> > > +++ b/arch/sh/kernel/syscalls/syscall.tbl
> > > @@ -321,7 +321,7 @@
> > >  311	common	set_robust_list			sys_set_robust_list
> > >  312	common	get_robust_list			sys_get_robust_list
> > >  313	common	splice				sys_splice
> > > -314	common	sync_file_range			sys_sync_file_range
> > > +314	common	sync_file_range			sys_sh_sync_file_range6
> >                                                                  ^^^^^^=
=20
> > Why the suffix 6 here?
>=20
> In a later part of my cleanup, I'm consolidating all the
> copies of this function (arm64, mips, parisc, powerpc,
> s390, sh, sparc, x86) and picked the name
> sys_sync_file_range6() for common implementation.
>=20
> I end up with four entry points here, so the naming is a bit
> confusing:
>=20
> - sys_sync_file_range() is only used on 64-bit architectures,
>   on x32 and on mips-n32. This uses four arguments, including
>   two 64-bit wide ones.
>=20
> - sys_sync_file_range2() continues to be used on arm, powerpc,
>   xtensa and now on sh, hexagon and csky. I change the
>   implementation to take six 32-bit arguments, but the ABI
>   remains the same as before, with the flags before offset.
>=20
> - sys_sync_file_range6() is used for most other 32-bit ABIs:
>   arc, m68k, microblaze, nios2, openrisc, parisc, s390, sh, sparc
>   and x86. This also has six 32-bit arguments but in the
>   default order (fd, offset, nbytes, flags).
>=20
> - sys_sync_file_range7() is exclusive to mips-o32, this one
>   has an unused argument and is otherwise the same as
>   sys_sync_file_range6().
>=20
> My plan is to then have some infrastructure to ensure
> userspace tools (libc, strace, qemu, rust, ...) use the
> same calling conventions as the kernel. I'm doing the
> same thing for all other syscalls that have architecture
> specific calling conventions, so far I'm using
>=20
> fadvise64_64_7
> fanotify_mark6
> truncate3
> truncate4
> ftruncate3
> ftruncate4
> fallocate6
> pread5
> pread6
> pwrite5
> pwrite6
> preadv5
> preadv6
> pwritev5
> pwritev6
> sync_file_range6
> fadvise64_64_2
> fadvise64_64_6
> fadvise64_5
> fadvise64_6
> readahead4
> readahead5
>=20
> The last number here is usually the number of 32-bit
> arguments, except for fadvise64_64_2 that uses the
> same argument reordering trick as sync_file_range2.
>=20
> I'm not too happy with the naming but couldn't come up with
> anything clearer either, so let me know if you have any
> ideas there.

OK, gotcha. I thought the 6 suffix was for SH only. I'm fine
with the naming scheme.

> > >  315	common	tee				sys_tee
> > >  316	common	vmsplice			sys_vmsplice
> > >  317	common	move_pages			sys_move_pages
> > > @@ -395,6 +395,7 @@
> > >  385	common	pkey_alloc			sys_pkey_alloc
> > >  386	common	pkey_free			sys_pkey_free
> > >  387	common	rseq				sys_rseq
> > > +388	common	sync_file_range2		sys_sync_file_range2
> > >  # room for arch specific syscalls
> > >  393	common	semget				sys_semget
> > >  394	common	semctl				sys_semctl
> >=20
> > I wonder how you discovered this bug. Did you look up the calling=20
> > convention on SuperH
> > and compare the argument order for the sys_sync_file_range system call=
=20
> > documented there
> > with the order in the kernel?
>=20
> I had to categorize all architectures based on their calling
> conventions to see if 64-bit arguments need aligned pairs or
> not, so I wrote a set of simple C files that I compiled for
> all architectures to see in which cases they insert unused
> arguments or swap the order of the upper and lower halves.
>=20
> SuperH, parisc and s390 are each slightly different from all the
> others here, so I ended up reading the ELF psABI docs and/or
> the compiler sources to be sure.
> I also a lot of git history.

Great job, thanks for doing the extra work to verify the ABI.

> > Did you also check what order libc uses? I would expect libc on SuperH=
=20
> > misordering the
> > arguments as well unless I am missing something. Or do we know that the=
=20
> > code is actually
> > currently broken?
>=20
> Yes, I checked glibc, musl and uclibc-ng for all the cases in
> which the ABI made no sense, as well as to check that my analysis
> of the kernel sources matches the expectations of the libc.

OK, awesome.

Will you send a v2 so I can ack the updated version of the patch?

I'm also fine with the patch going through your tree, as I would
like to start with the changes for v6.11 this week.

Thanks,
Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
