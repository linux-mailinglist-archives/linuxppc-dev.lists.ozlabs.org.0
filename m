Return-Path: <linuxppc-dev+bounces-11521-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B10B3C7F4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Aug 2025 06:45:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cDMyd42y9z2yN2;
	Sat, 30 Aug 2025 14:45:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756529145;
	cv=none; b=JTunWTZ/+mr96sBt3K6oTDhDoIft2OeE4CbfXWmUHRxxegkx7Rkd2SlLIIVutHTkgPZoJGAlqlgaKMXgrYBDq11KhJNuyoR1D9cWFCGTksq4XzkbfsGhhXVAuXWigCV2W4Hpb5ZAunPhwmQYKs8Hs3m0AiTBPs/82ehV+PBRU0SQPxX/N5joeKJB+ID7T19AckLko/L2yiHwYNvBc9QwI/Pd3XALuFvvuhH3NKyW+X/7zJOguYCodHXLngdCgzfY+qzsrg3YvCplMOtw/TsZtXrbdAJpC2wrUB1dzheY88wlr6eyVYUJMG1vs+b4ix+jUB8+T1Lpu+UR7ZeZUnAX6w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756529145; c=relaxed/relaxed;
	bh=pt3u/3dhlv3xp9vGi7l7QuBrLsn5dvfeg+GgVr0aTXI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O7vtLXpXG26KPIlhfW2/Nf3dznXqUZkz3Mjg6+rI8NoeLKB/1NpkbrwW9fJ0SKIhYhdRJONBFORUvyVy9a3aEtBMa/iD1BtCp/6c43cyUmD9jKlAGWKMjXkTREWu7SD8I2kgtH8QLSVZD1DwSrn5epqduvTYBQYrocEJVhT4MdHb5apFcYayhwNqhpmUDU5rYvj26FthdzixUfcy/0QXGhRWrKo+wxFd0xOj2oaVCW4JD+Y/J0ZRAHg1qEiR4Bv/ElufgSPAQBr/ByvJn0I01+a7fjBxkGdpGGMn5SQ9qXDdMsglZqbsUacyuLy7C/DjzSuuT0HsHqZjRuZQPzLvmw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=202503 header.b=nI9sURvm; dkim-atps=neutral; spf=pass (client-ip=2404:9400:2221:ea00::3; helo=mail.ozlabs.org; envelope-from=sfr@canb.auug.org.au; receiver=lists.ozlabs.org) smtp.mailfrom=canb.auug.org.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=202503 header.b=nI9sURvm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=canb.auug.org.au (client-ip=2404:9400:2221:ea00::3; helo=mail.ozlabs.org; envelope-from=sfr@canb.auug.org.au; receiver=lists.ozlabs.org)
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cDMyd02KCz2xgX
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Aug 2025 14:45:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1756529144;
	bh=pt3u/3dhlv3xp9vGi7l7QuBrLsn5dvfeg+GgVr0aTXI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=nI9sURvmPiBdyeT59pgCA4MQNUS93LYOQ/HVFYC26qyeyL2UX4B4GL3V6PNc5t86x
	 NgxLgK3fLChvRbEQwxirv4wuomxruaelO8l8UwumVA42VQGf4QsqqfeAuJn5wC37UO
	 z8SlawpKnMogSGqKMJZEWnc/Ikv/+1BOnFRgWcjgsSTqIJrEzSX2H6JdLcT8GYeTdE
	 DTs0D1dN848t2+HCYr/BTAkGcr38hDt/lnb73sKkOvpPu7FK1EO0FibhUBqFwjD920
	 gRCxBihmv8xz5Vxh2y5cqK1Kg3UD9HuaaLOjGjGTNqImA9ozmfnJZVnw8cLwNUF9WM
	 G6T16XnUTFzDw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cDMyc0RkSz4wbY;
	Sat, 30 Aug 2025 14:45:43 +1000 (AEST)
Date: Sat, 30 Aug 2025 14:45:42 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas
 Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Donet Tom <donettom@linux.ibm.com>, Andrew Morton
 <akpm@linux-foundation.org>, David Hildenbrand <david@redhat.com>, Lorenzo
 Stoakes <lorenzo.stoakes@oracle.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
Subject: Re: [RFC 8/8] powerpc/book3s64/slb: Add slb faults to vmstat
Message-ID: <20250830144542.6ba0e774@canb.auug.org.au>
In-Reply-To: <e05ac86618d8a52feccf5bac99da44b11871382c.1756522067.git.ritesh.list@gmail.com>
References: <cover.1756522067.git.ritesh.list@gmail.com>
	<e05ac86618d8a52feccf5bac99da44b11871382c.1756522067.git.ritesh.list@gmail.com>
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
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//+ny8ES+6FQIgltakmfkGeI";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

--Sig_//+ny8ES+6FQIgltakmfkGeI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Ritesh,

On Sat, 30 Aug 2025 09:21:47 +0530 "Ritesh Harjani (IBM)" <ritesh.list@gmai=
l.com> wrote:
>
> diff --git a/mm/vmstat.c b/mm/vmstat.c
> index 71cd1ceba191..8cd17a5fc72b 100644
> --- a/mm/vmstat.c
> +++ b/mm/vmstat.c
> @@ -1464,6 +1464,11 @@ const char * const vmstat_text[] =3D {
>  	[I(DIRECT_MAP_LEVEL2_COLLAPSE)]		=3D "direct_map_level2_collapses",
>  	[I(DIRECT_MAP_LEVEL3_COLLAPSE)]		=3D "direct_map_level3_collapses",
>  #endif
> +#ifdef CONFIG_PPC_BOOK3S_64
> +	"slb_kernel_faults",
> +	"slb_user_faults",
> +#endif
> +
>  #ifdef CONFIG_PER_VMA_LOCK_STATS
>  	[I(VMA_LOCK_SUCCESS)]			=3D "vma_lock_success",
>  	[I(VMA_LOCK_ABORT)]			=3D "vma_lock_abort",

Should you be using explicit indexes and the I() macro?

--=20
Cheers,
Stephen Rothwell

--Sig_//+ny8ES+6FQIgltakmfkGeI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiygfYACgkQAVBC80lX
0Gw49Af/UHUgpgla969YKk5hog5zPrUt/pqZeUpeCBxUuq7MPlxJcsYXGimAWpRt
0t3emvmvxMn44bEq8pWIIMC/I0zQs5ot02U2idYBNrms/QOyZUPtMOqh8GoqC12R
ZaLygol/LLHTQNnSPKQvTby9VIi+x65d89xiAaaP011YM3Ely6npbON2M/GSAp2e
QxGPXnTyweD8LuTfg5WO42gfR0tZT4kmiYXenIKitwq+etMK2a1aRW363/qDl8JB
hDdJ5MsslmTyrgEIWGZf+oU7KQaW3tDpyVi2G47z3jC4yvoFAM3Zb5aRvaT5Z5/P
ruWRI29KJGH69tamurCkQo92a+Bo8w==
=fKMP
-----END PGP SIGNATURE-----

--Sig_//+ny8ES+6FQIgltakmfkGeI--

