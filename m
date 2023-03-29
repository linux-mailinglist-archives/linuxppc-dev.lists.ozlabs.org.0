Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26DF86CF4B9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Mar 2023 22:49:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PmzDb6tNHz3fFY
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Mar 2023 07:49:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=boCWhpdB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=conor@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=boCWhpdB;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PmzCn2Lwxz3c6y
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Mar 2023 07:48:21 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 57B1161E31;
	Wed, 29 Mar 2023 20:48:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0B6DC433D2;
	Wed, 29 Mar 2023 20:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680122898;
	bh=1FYJm+9Wk+njTFrcUWRvLdevGIDr+W6Tthp7LWzQkuU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=boCWhpdBtoliUn63FbbfND/v9Mp/RWyo9JXf+EnIrqGcts24RG6WSsaX8OyyMGpmR
	 OMhsdzI6wjHZ9L9dRgyM81y9GcdEGjJbQ79P89OVt+ES0GP7Dab665WOCD3VG6YGrA
	 QdNC7Z/6qjDNQcC72DoCALVe17ZlH3sMsJ8P/IOLvgrMuYTNGz+ml1q07Ok7jWvsWU
	 B3at/aLp5IMLfrV1PTn7Moz0cGHMllPHtGc4hbYxsce+5WQaL0vhZbd/zaOLetW4Wx
	 Xp1CXJmoO48d6OQNzqYx6AfUxQeMqIO245DQTnKIpDIYzxX7MyaWN5fbqCYcz99XKE
	 SxWP3/q/5qgvQ==
Date: Wed, 29 Mar 2023 21:48:08 +0100
From: Conor Dooley <conor@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH 08/21] riscv: dma-mapping: only invalidate after DMA, not
 flush
Message-ID: <2668e232-ae83-4576-beaa-08e420236996@spud>
References: <20230327121317.4081816-1-arnd@kernel.org>
 <20230327121317.4081816-9-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kOOpdYQXwAfFVnAo"
Content-Disposition: inline
In-Reply-To: <20230327121317.4081816-9-arnd@kernel.org>
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
Cc: Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Linus Walleij <linus.walleij@linaro.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-mips@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>, samuel@sholland.org, Helge Deller <deller@gmx.de>, Russell King <linux@armlinux.org.uk>, Geert Uytterhoeven <geert@linux-m68k.org>, Vineet Gupta <vgupta@kernel.org>, linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org, Arnd Bergmann <arnd@arndb.de>, Brian Cain <bcain@quicinc.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-m68k@lists.linux-m68k.org, Paul Walmsley <paul.walmsley@sifive.com>, Stafford Horne <shorne@gmail.com>, linux-arm-kernel@lists.infradead.org, Neil A
 rmstrong <neil.armstrong@linaro.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-openrisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-hexagon@vger.kernel.org, linux-oxnas@groups.io, Robin Murphy <robin.murphy@arm.com>, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--kOOpdYQXwAfFVnAo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 27, 2023 at 02:13:04PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> No other architecture intentionally writes back dirty cache lines into
> a buffer that a device has just finished writing into. If the cache is
> clean, this has no effect at all, but

> if a cacheline in the buffer has
> actually been written by the CPU,  there is a drive bug that is likely
> made worse by overwriting that buffer.

So does this need a
Fixes: 1631ba1259d6 ("riscv: Add support for non-coherent devices using zic=
bom extension")
then, even if the cacheline really should not have been touched by the
CPU?
Also, minor typo, s/drive/driver/.

In the thread we had that sparked this, I went digging for the source of
the flushes, and it came from a review comment:
https://lore.kernel.org/linux-riscv/342e3c12-ebb0-badf-7d4c-c444a2b842b2@sh=
olland.org/
But *surely* if no other arch needs to do that, then we are safe to also
not do it... Your logic seems right by me at least, especially given the
lack of flushes elsewhere.
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/riscv/mm/dma-noncoherent.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/riscv/mm/dma-noncoherent.c b/arch/riscv/mm/dma-noncoher=
ent.c
> index d919efab6eba..640f4c496d26 100644
> --- a/arch/riscv/mm/dma-noncoherent.c
> +++ b/arch/riscv/mm/dma-noncoherent.c
> @@ -42,7 +42,7 @@ void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t si=
ze,
>  		break;
>  	case DMA_FROM_DEVICE:
>  	case DMA_BIDIRECTIONAL:
> -		ALT_CMO_OP(flush, vaddr, size, riscv_cbom_block_size);
> +		ALT_CMO_OP(inval, vaddr, size, riscv_cbom_block_size);
>  		break;
>  	default:
>  		break;
> --=20
> 2.39.2
>=20

--kOOpdYQXwAfFVnAo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZCSkCAAKCRB4tDGHoIJi
0pCKAQCFyZKqUabYSSJXqqHCLgZcuhg7cae4P41SpPSV+c3z5gEA/c0XOLzsLOMI
IgRP+ghvnIZnEAVO3yHmHKYu0MBqmQM=
=36EO
-----END PGP SIGNATURE-----

--kOOpdYQXwAfFVnAo--
