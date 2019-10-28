Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B52E6A48
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Oct 2019 01:04:39 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 471Zhg6mv0zDqNQ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Oct 2019 11:04:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 471Zfq41hqzDqLH
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Oct 2019 11:02:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au
 header.b="H/UDoxo7"; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 471Zfp4Wykz9sP4;
 Mon, 28 Oct 2019 11:02:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1572220979;
 bh=az2zydEzQ1rf9pqzia427KFZ7Y/igSD/dWXuoPvZSEk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=H/UDoxo73yXK4v7F0hcgaERxxh1rF/3iKa9cKb3y5shsLqJpAcxn9S6Pc1l05Imwa
 nkQJe/1f4MkoWj8VKnQ8RbiTTsxp9QvQp7dBb8dnMZhRWYevnXbJNVP0zHF2Swne2n
 oG9RdH4WTDXwq6fPHDNR8aAhxI19lLhKi9bVjBg0PPIxpN9UwRSUV0uvts0jGbshsb
 WV6eqYGCZleliuHEWCwSX18ImZyHSpFe/z3Mmn4n1AnQLDrxp97XpkdYA8oXosq5km
 +CSHCJJkoG2EwjQ2U5KKpiGKlNMKZ8DiQ4AX9hGURM54rKc+rmdYpa0rONN9OcY6gC
 XHiMIWA6MUerw==
Date: Mon, 28 Oct 2019 11:02:57 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov
 <ast@kernel.org>, Networking <netdev@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the bpf-next tree
Message-ID: <20191028110257.6d6dba6e@canb.auug.org.au>
In-Reply-To: <20191018105657.4584ec67@canb.auug.org.au>
References: <20191018105657.4584ec67@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ZXSJx2c+WO+1Z=QY9pD2xO_";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 ppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/ZXSJx2c+WO+1Z=QY9pD2xO_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 18 Oct 2019 10:56:57 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Hi all,
>=20
> After merging the bpf-next tree, today's linux-next build (powerpc
> ppc64_defconfig) produced this warning:
>=20
> WARNING: 2 bad relocations
> c000000001998a48 R_PPC64_ADDR64    _binary__btf_vmlinux_bin_start
> c000000001998a50 R_PPC64_ADDR64    _binary__btf_vmlinux_bin_end
>=20
> Introduced by commit
>=20
>   8580ac9404f6 ("bpf: Process in-kernel BTF")

This warning now appears in the net-next tree build.

--=20
Cheers,
Stephen Rothwell

--Sig_/ZXSJx2c+WO+1Z=QY9pD2xO_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl22MDEACgkQAVBC80lX
0GzzfQf/Q0QnAHV72bYNUdkgcSH9LOJ9t/6p+aRr+4vw5frSUMgwlpL/dqzwXlPi
ubGCbcVoaDWDXBCcAXj6IZx8Ki0jwZmkGHhvMCktOg3IpMDRZJqdtrqJzSGnYYlx
k4R3yiW2Eag+I2/3sBkTfStBFU8sd04Ae5YqnTb3RtFMwEVR3BQg8wvQ2uRKF4DY
JPR6f55s0av6kVF8pQ/ySnAMguJim+J/tyAcC4kxRlBOaxXiwVmaHH1pRs8gWQ/e
enkPaJcIdJW36+UKNVqbLNSWuTV0InP4B3OBknRt+1ea/TrfM3ejYuGcjRRcwAvu
D23+98uAKiuQpg7EyUd34X+rRy9ZkA==
=CUKK
-----END PGP SIGNATURE-----

--Sig_/ZXSJx2c+WO+1Z=QY9pD2xO_--
