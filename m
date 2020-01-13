Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA26139AB5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jan 2020 21:27:19 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47xQ9w2zQ4zDqPn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jan 2020 07:27:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47xQ7q4vQLzDqKw
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jan 2020 07:25:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au
 header.a=rsa-sha256 header.s=201702 header.b=Kld2iNtf; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 47xQ7p406Gz9sP3;
 Tue, 14 Jan 2020 07:25:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1578947127;
 bh=nLApqXKvpxFLIqB6m180eMqYhL0XvZt7//S7vdCLXCE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Kld2iNtfH81jj1J7QN3TX9k3KiBIXXHgRI7q5OXHVJao4ZcNgpg7zgpt93bHNsxgy
 OeJjqBD0qSULyKAprZxQ9r3dCJjQFAN74aeyPQ7Et3ygrXQNCP7NBJZInobDoxum0t
 SxsX4S5cjdQLzrLxQuaL/jI2H/nOE698ZdbJzvY4OjMVGx21ON1KK8erU3gJqKue5O
 Kq4lgt2PMewr/OJGmoDD/Onkrq68Us0Z7WpBFWkJz4AllL5tLOh1Rx4jsQBCCeC4an
 443naodCbVRP8QifR5dqsyDBEYovQ3e1Biqs+J8gLPaWsrQxjRtEYyMwL/Yfw3+J3p
 hNYMrW9BTLt1g==
Date: Tue, 14 Jan 2020 07:25:22 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Timur Tabi <timur@kernel.org>
Subject: Re: [PATCH] evh_bytechan: fix out of bounds accesses
Message-ID: <20200114072522.3cd57195@canb.auug.org.au>
In-Reply-To: <CAOZdJXXiKgz=hOoiaTrxgbnwzyvp1Zfn3aCz+0__i17vyFngRg@mail.gmail.com>
References: <20200109183912.5fcb52aa@canb.auug.org.au>
 <CAOZdJXXiKgz=hOoiaTrxgbnwzyvp1Zfn3aCz+0__i17vyFngRg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/m.Xv=dzyfmtgXLS8PuqzcmW";
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
Cc: b08248@gmail.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jslaby@suse.com>, york sun <york.sun@nxp.com>,
 PowerPC Mailing List <linuxppc-dev@lists.ozlabs.org>, swood@redhat.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/m.Xv=dzyfmtgXLS8PuqzcmW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Timur,

On Mon, 13 Jan 2020 10:03:18 -0600 Timur Tabi <timur@kernel.org> wrote:
>
> Why not simply correct the parameters of ev_byte_channel_send?
>=20
> static inline unsigned int ev_byte_channel_send(unsigned int handle,
> -unsigned int *count, const char buffer[EV_BYTE_CHANNEL_MAX_BYTES])
> +unsigned int *count, const char *buffer)
>=20
> Back then, I probably thought I was just being clever with this code,
> but I realize now that it doesn't make sense to do the way I did.

The problem is not really the declaration, the problem is that
ev_byte_channel_send always accesses 16 bytes from the buffer and it is
not always passed a buffer that long (in one case it is passed a
pointer to a single byte).  So the alternative to the memcpy approach I
have take is to complicate ev_byte_channel_send so that only accesses
count bytes from the buffer.

--=20
Cheers,
Stephen Rothwell

--Sig_/m.Xv=dzyfmtgXLS8PuqzcmW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4c0jIACgkQAVBC80lX
0Gzs/wgAiMuLzS+N+nnqiZYy1lcteHXcr04SuJFVz2ya6Y4GGGwHfjyWz5FCUjWF
xfZJ2toDo7yB2o8gVSPSaEIvAePfem6JIXJzuN93FLsyBoSgEDwjQ6XcaHqmwkNf
Ab7OKydvbMay9vSXGu6ObM/Z5giODhxScqqPwrxd5i7NEsQ2bVWnDAYzSFMAKnem
7E9gaVcmaShSVlkEwNlWvxTe07hyWJLgGiqmr2P8JezKAdq+pDlW6sRvkvY4cBwv
pcIDeuLYOzPsXdI/x0dW4oKzoo2Ax22XGBLB4ENldUnfr9gGdA5m8Pl/VnZvTIC3
nb6Cc272qlLjakqKMPuZthR2E9GqBA==
=h8uo
-----END PGP SIGNATURE-----

--Sig_/m.Xv=dzyfmtgXLS8PuqzcmW--
