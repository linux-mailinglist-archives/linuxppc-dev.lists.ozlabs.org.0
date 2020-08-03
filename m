Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2AA23A569
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Aug 2020 14:37:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BKy7p6pn1zDqVm
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Aug 2020 22:37:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BKy1g0Nh1zDqQf
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Aug 2020 22:31:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au
 header.a=rsa-sha256 header.s=201702 header.b=RN7w1oMw; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BKy1c3Stbz9sWK;
 Mon,  3 Aug 2020 22:31:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1596457908;
 bh=A1RYpQrdZ8SRLEMPPRLnaD8brc08MDwIZqWIqkU3Rgs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=RN7w1oMw6XcjGMfR7TB4ijQsBlMR4XTWWlqQHCYWI7rPdKDuhVf3mf1xJH4dCKvK6
 XAUtVLQllopcGiL1O5+K1/IoVxLu33I9uEPX/WECRZZLPtqkrBSmwEwmEgKPRaYMpR
 csm68F1yGYLkkrHJ2OJZCCprywMrMslVUR1CxGCPNHxDhEQXlfMy4GvK7+2HaqF/tF
 21yOmkkoWKvsoA4S/1widX/fK8PYJonub0DKeP4aGVBQSoQQFYDFi13mTvLzDus7Sj
 HKDARDhm3x4eo17XHW8Wf34v3DzLTPtyeJhvmzLQV8di/snc2cUriJhVE3j3GQj1LB
 K0eZD5WjF8Zlg==
Date: Mon, 3 Aug 2020 22:31:47 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: powerpc: build failures in Linus' tree
Message-ID: <20200803223147.28adac79@canb.auug.org.au>
In-Reply-To: <87v9i0yo47.fsf@mpe.ellerman.id.au>
References: <20200802204842.36bca162@canb.auug.org.au>
 <20200802172019.GB26677@1wt.eu> <20200803034547.GA15501@1wt.eu>
 <87v9i0yo47.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/gTzTE=0PurNyae0JTgphoQ1";
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
Cc: Linux-kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Paul Mackerras <paulus@samba.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>,
 Willy Tarreau <w@1wt.eu>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/gTzTE=0PurNyae0JTgphoQ1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Michael,

On Mon, 03 Aug 2020 21:18:00 +1000 Michael Ellerman <mpe@ellerman.id.au> wr=
ote:
>
> If we just move the include of asm/paca.h below asm-generic/percpu.h
> then it avoids the bad circular dependency and we still have paca.h
> included from percpu.h as before.
>=20
> eg:
>=20
> diff --git a/arch/powerpc/include/asm/percpu.h b/arch/powerpc/include/asm=
/percpu.h
> index dce863a7635c..8e5b7d0b851c 100644
> --- a/arch/powerpc/include/asm/percpu.h
> +++ b/arch/powerpc/include/asm/percpu.h
> @@ -10,8 +10,6 @@
> =20
>  #ifdef CONFIG_SMP
> =20
> -#include <asm/paca.h>
> -
>  #define __my_cpu_offset local_paca->data_offset
> =20
>  #endif /* CONFIG_SMP */
> @@ -19,4 +17,6 @@
> =20
>  #include <asm-generic/percpu.h>
> =20
> +#include <asm/paca.h>
> +
>  #endif /* _ASM_POWERPC_PERCPU_H_ */
>=20
>=20
> So I think I'm inclined to merge that as a minimal fix that's easy to
> backport.
>=20
> cheers

Looks ok, except does it matter that the include used to be only done
if __powerpc64__ and CONFIG_SMP are defined?

--=20
Cheers,
Stephen Rothwell

--Sig_/gTzTE=0PurNyae0JTgphoQ1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8oA7MACgkQAVBC80lX
0Gy0nggAjW0dxUlsqRQt/TwQPBQCCz/n8vIcBBuDcNL80vLeduZpiEP5v+/OEb+G
nmf5Usmxk7VkODd5OUKIVkU2+q3BET5QBwxQ/BjtOhTGFfxoWzz1Ki1Q4z8fr6gl
T8c0lwl2c9W4AUsaWIgroQR/KqVBkaPRhcEVcChBwdv1V4mqC61Xf6tsLouzEo8G
q3ymOVn8kA1UKG4A7Ivk6JI00SYy1nZvEKaN0YRKaZzLmyCkaLa2UVToaRx5fXJ2
LCTER0c4eNURY4AmGOulxANO2og1MGlU+n9J6zM7fiDb4lFCd5gI3IVQ9De6NAec
p/fzXpVwEMgp7J+aZ3CLNHrOgTsmzw==
=eLgV
-----END PGP SIGNATURE-----

--Sig_/gTzTE=0PurNyae0JTgphoQ1--
