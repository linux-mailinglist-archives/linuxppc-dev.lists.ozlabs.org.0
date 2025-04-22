Return-Path: <linuxppc-dev+bounces-7908-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C03DCA96D53
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Apr 2025 15:46:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zhk700zxPz3brT;
	Tue, 22 Apr 2025 23:46:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745329612;
	cv=none; b=G6RBc/iasDPdtF4FOHRU6DLbDzB/+vohoVSOZhZc2ez5tVtdQse0SU9gTxj/Cm9Lw6SIuHfb3O81M9Nu4xTRdV3TDbDijiWiuCNPQvOwjc6EdZIt6dSOlG4AUpoYQwSPE0jBFAFTh2wleNn7in/AOFTQp1q3kP76bAOO6V8N2nC3sCaQiKgZEW8UuElPcWNFX6J8sVKqRpEZO1vdVhza3V6rNE1qQ6pYlsnGXCQUodJOenDfNBwfdtMP73Jq1OHWm+GIclSq4ckxmvBgQtMfb9Ci0BcxXUoFbjrOwBuYnFbuBXIFa6GVvKZ8InXty5vf32dvOtFgRRIQgQvq+ACbSA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745329612; c=relaxed/relaxed;
	bh=rupwQYzZbHXDNwOWv0/Msz6Y99/wWP3z3SqBJEjeHtA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UonWYHqCUel2vG6n0ORflvvhKaT5UZUSm2VSZ8ywf0UCVqktZ119Dr62+3xM63XK9T7JLamoo/v4H6IRTh31CMgSElsSx8P1oRMp9N2ho6InUec6/A/TOridh18CAAogrb7x98P55Rv8puom3D/x+FnXMeiNe/wRLOzEbM3Aeu5z0MxrjKDchRwcC7oPGBx7UAaFsRmyg+ZbdFGsTmTLdXYSSxRun/QR2DPiSFzWcydlxDW7uPytIqgMKgUHL28l+koh0gywXf7cH1s4wt7admqhkdDGyscwUSKEEgM9kwhR5+xGsV8PTrkPonSY5qVdZ0WXyyfKRouhdbEwpeKr0Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=202503 header.b=Z+mHwhXp; dkim-atps=neutral; spf=pass (client-ip=150.107.74.76; helo=mail.ozlabs.org; envelope-from=sfr@canb.auug.org.au; receiver=lists.ozlabs.org) smtp.mailfrom=canb.auug.org.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=202503 header.b=Z+mHwhXp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=canb.auug.org.au (client-ip=150.107.74.76; helo=mail.ozlabs.org; envelope-from=sfr@canb.auug.org.au; receiver=lists.ozlabs.org)
X-Greylist: delayed 2304 seconds by postgrey-1.37 at boromir; Tue, 22 Apr 2025 23:46:51 AEST
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zhk6z2p0lz30WR
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Apr 2025 23:46:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1745329611;
	bh=rupwQYzZbHXDNwOWv0/Msz6Y99/wWP3z3SqBJEjeHtA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Z+mHwhXpDSXYP6mQcHP3yIVuoXZFdVeV5TxMOA7gT7E11GuKban9fIH4Dwf2tMfzE
	 ThzkcZFC4dpfclNOXzVschccM/AIX+sQlFb2sRGZipU2FnCROWpvyyAK5IUy8v69sc
	 +iQpKu3Sou7/24Q40kQUyrKNDPEYYg3X/NBOQxmmH8BQFiKvA+35rnaVYgfeDhbpsx
	 Emz26k8ZccyKJElTx3KGrhurnohkyJnK+RvMKQdt6JdjC21/EO+iHgFhELEQz29PRu
	 w53NZwWOtlj5dCZudR2OYzfWoYjZBC4UqgOK02iHLT5JwonIBYpj7Ux3bDHXLpfTZh
	 DBKzGcNr+y3OQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Zhk6y6NPwz4x1w;
	Tue, 22 Apr 2025 23:46:50 +1000 (AEST)
Date: Tue, 22 Apr 2025 23:46:49 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: mpe@ellerman.id.au, christophe.leroy@csgroup.eu, npiggin@gmail.com,
 naveen@kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 6/6] powerpc/boot/install.sh: Fix shellcheck warnings
Message-ID: <20250422234649.1313cb3b@canb.auug.org.au>
In-Reply-To: <20250422131040.374427-7-maddy@linux.ibm.com>
References: <20250422131040.374427-1-maddy@linux.ibm.com>
	<20250422131040.374427-7-maddy@linux.ibm.com>
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
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7ZOSCiPqIqQ_aEZzRjn1U0u";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

--Sig_/7ZOSCiPqIqQ_aEZzRjn1U0u
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Madhavan,

On Tue, 22 Apr 2025 18:40:40 +0530 Madhavan Srinivasan <maddy@linux.ibm.com=
> wrote:
>
> -if [ -f $4/$image_name-$1 ]; then
> -	mv $4/$image_name-$1 $4/$image_name-$1.old
> +if [ -f "$4"/"$image_name"-"$1" ]; then
> +	mv "$4"/"$image_name"-"$1" "$4"/"$image_name"-"$1".old

"$4/$image_name-$1" is just as correct (and similar elsewhere).

>  fi
> =20
> -if [ -f $4/System.map-$1 ]; then
> -	mv $4/System.map-$1 $4/System-$1.old
> +if [ -f "$4"/System.map-"$1" ]; then
> +	mv "$4"/System.map-"$1" "$4"/System-"$1".old
>  fi
> =20
> -cat $2 > $4/$image_name-$1
> -cp $3 $4/System.map-$1
> +cat "$2" > "$4"/"$image_name"-"$1"
> +cp "$3" "$4"/System.map-"$1"


--=20
Cheers,
Stephen Rothwell

--Sig_/7ZOSCiPqIqQ_aEZzRjn1U0u
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgHnckACgkQAVBC80lX
0Gz4dgf/bpN0Ikh6ALhA2DnF9lP1sK5wiByZFYACVzIrzFmKSO/qhlkz544XhLma
qt77bLerANe4HA/ODbHNA7Ayvp5fVx6HupP6AfPbKB9aVSxSoZIFsPlC54aK2xQj
z4VHM4VvMRj1Rrf5hCUiwghfSTqNwba0dcCmMwK3z+mhHhbEVKzIFPixeifOiw8Q
i/6qnRXoPgRqlmgOakK5zDR/QkUfC4F3zC7Vn5qBLlYiQ6/LYy8x3ouxZ4NjKF9j
SWWvF01ILsdZukFH91gFW675ZRuildTRZkkVPsK5+w/O9pX3P/VGIg/ubfs1amqj
QiM07jD++joQc3W+WYe1fCrV+GNlKQ==
=9D8E
-----END PGP SIGNATURE-----

--Sig_/7ZOSCiPqIqQ_aEZzRjn1U0u--

