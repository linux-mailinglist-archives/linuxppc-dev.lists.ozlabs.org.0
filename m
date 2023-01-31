Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 295756835CC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Jan 2023 19:56:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P5vQp0PHvz3cfP
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Feb 2023 05:56:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=p4r9YCVi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=conor@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=p4r9YCVi;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P5vPl2zD4z3cfG
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Feb 2023 05:55:23 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B440CB81E69;
	Tue, 31 Jan 2023 18:55:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 249B8C433EF;
	Tue, 31 Jan 2023 18:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675191318;
	bh=bIDjyyvdysd52cz3wo+R2FqIpQuhXwaSP+2JinM77Zs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p4r9YCVihzZrIRlizFq96lF4LsuRcYuXyit+cVXFPxJSxGfL99cms2/SSKpvkF2Pp
	 NgIawOhOvw555KfS+LAiMfG5/YT2a/THCQd4ucSFldwug8pgOxrs80vH+lCVDLHIZh
	 fh6CSOEpoCrswZLqAXRWz9pZ9CFIa58ZjTeMXFlgy8V6KmgUqFk322AZ/O2du+jfxI
	 cQP8VEptS2HT9jSp8zZqLDDlrzS+XSn+HUeeyHjnm0LO863o/QOiqT647VANwYetka
	 9TpahVOYB0s8YL82xibnQ7Ggye7lO/va5K0QbIxfYIjwKYESn8Y2//JUV74+mpgZ7e
	 krHdpZB95Rbtg==
Date: Tue, 31 Jan 2023 18:55:07 +0000
From: Conor Dooley <conor@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH v2 4/4] mm, arch: add generic implementation of
 pfn_valid() for FLATMEM
Message-ID: <Y9lkCz73v7/iyyLj@spud>
References: <20230129124235.209895-1-rppt@kernel.org>
 <20230129124235.209895-5-rppt@kernel.org>
 <Y9lULIIOneBUFE/E@spud>
 <Y9lg7R1Yd931C+y5@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hiaCFsst32mLBZni"
Content-Disposition: inline
In-Reply-To: <Y9lg7R1Yd931C+y5@kernel.org>
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, x86@kernel.org, linux-mips@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>, sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>, Greg Ungerer <gerg@linux-m68k.org>, linux-arch@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, Vineet Gupta <vgupta@kernel.org>, Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org, Arnd Bergmann <arnd@arndb.de>, linux-alpha@vger.kernel.org, linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org, loongarch@lists.linux.dev, Stafford Horne <shorne@gmail.com>, linux-arm-kernel@lists.infradead.org, Brian Cain <bcain@quicinc.com>, Mic
 hal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Richard Weinberger <richard@nod.at>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, Huacai Chen <chenhuacai@loongson.cn>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--hiaCFsst32mLBZni
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mike,

On Tue, Jan 31, 2023 at 08:41:49PM +0200, Mike Rapoport wrote:
> On Tue, Jan 31, 2023 at 05:47:24PM +0000, Conor Dooley wrote:
> > On Sun, Jan 29, 2023 at 02:42:35PM +0200, Mike Rapoport wrote:
> > > From: "Mike Rapoport (IBM)" <rppt@kernel.org>
> > >=20
> > > Every architecture that supports FLATMEM memory model defines its own
> > > version of pfn_valid() that essentially compares a pfn to max_mapnr.
> > >=20
> > > Use mips/powerpc version implemented as static inline as a generic
> > > implementation of pfn_valid() and drop its per-architecture definitio=
ns.
> > >=20
> > > Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
> > > Acked-by: Arnd Bergmann <arnd@arndb.de>
> > > Acked-by: Guo Ren <guoren@kernel.org>		# csky
> > > Acked-by: Huacai Chen <chenhuacai@loongson.cn>	# LoongArch
> > > Acked-by: Stafford Horne <shorne@gmail.com>	# OpenRISC
> >=20
> > Hmm, so this landed in linux-next today and I bisected a boot failure in
> > my CI to it. However, I am not really sure if it is a real issue worth
> > worrying about as the platform it triggered on is supposed to be using
> > SPARSEMEM, but isn't.
> > I had thought that my CI was using a config with SPARSEMEM since that
> > became required for riscv defconfig builds to boot in v6.1-rc1, but I
> > must have just forgotten to add it to my $platform_defconfig builds too.
> > However, those $platform_defconfig builds continued booting without
> > SPARSEMEM enabled until today.
>=20
> The issue seems to be that the generic pfn_valid() does not take into
> account pfn_offset when it compares it with max_mapnr.
> Can you please test with the patch below?
>=20
> diff --git a/include/asm-generic/memory_model.h b/include/asm-generic/mem=
ory_model.h
> index 13d2a844d928..6796abe1900e 100644
> --- a/include/asm-generic/memory_model.h
> +++ b/include/asm-generic/memory_model.h
> @@ -26,7 +26,7 @@ static inline int pfn_valid(unsigned long pfn)
>  	extern unsigned long max_mapnr;
>  	unsigned long pfn_offset =3D ARCH_PFN_OFFSET;
> =20
> -	return pfn >=3D pfn_offset && pfn < max_mapnr;
> +	return pfn >=3D pfn_offset && (pfn - pfn_offset) < max_mapnr;
>  }
>  #define pfn_valid pfn_valid
>  #endif

Gave that a go, board is booting properly again! Feel free to add a:
Tested-by: Conor Dooley <conor.dooley@microchip.com>

Thanks for the prompt fix!


--hiaCFsst32mLBZni
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY9lkCwAKCRB4tDGHoIJi
0pIDAP9nc8RsXGyfp84b29PfLE6bd1djEIZ71+YYWPrhRbOT0QEAs5hvd2Aq0mES
TzWIEs2xL7+wjwVIWLwPjr1kP0shHA0=
=AQg2
-----END PGP SIGNATURE-----

--hiaCFsst32mLBZni--
