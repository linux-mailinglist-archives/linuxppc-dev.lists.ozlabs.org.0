Return-Path: <linuxppc-dev+bounces-13779-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C8CC33DF4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 05 Nov 2025 04:45:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d1WRr60pKz3btd;
	Wed,  5 Nov 2025 14:45:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762314312;
	cv=none; b=Uu4nfPeJ8S7XK0F9jElaBzB/2g+2PYkXF//pxMPNDpmQCkExaNoFeWzgRSEs53agDrv65VxYzUUFwOgD1tK/FK6eiYRZ7i8Uy5Rbu9CmcluN/YnF/1Bo4JhwF9R/mCAcnDYus6i1wkRF0fZMhToo3iu505iaIFv/qePKxvb23P48iUZ+tWpO07E9SL4ex0rLakVFLy3lskrDlutxt+jVEmIXcvRyf5xabSzKFPazPyz8qxitof49E9HPLM6+IgriyBwO/uoDx/7wqTQB9Ot6EJrm7Y/Q/Rx9uFNCexTsffCRpW2NYieObTzp1+0maOn1qONbO4xCfwiawmTEccfEnA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762314312; c=relaxed/relaxed;
	bh=u4a8kzakFPj8vNRJV1Rd0XvaxUsFNMpjZbVNQGFPFD8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L4bPb42vGqec/6stHgnotMcQYCqFuwfKwucikThag3ueZ3pUO/aUBKqOZyY+ks+k17iAmfUZQMPBTdcQ0jiXuHN6Ao1LQ0lBo0b7SZ2V9E/nPKlDBRde/j8yxr4uAcgK1RxAA1ZOICmSMGJk4Al+rDXNWRRjsP+O5IWKoHzYYV0vdC2tQgcB2fJlURBTBOK++/r6FcdPyrS+BMu5CCloGCMlTqN5zAREAg7Zl/+EtUY0ZyXlbHtR54DDy9dyg66qz/5FMLKbomGuwD7AsanzGM59Oo5olrx78LteBPsX4gPXSR7x5hvZdib9Fi399ZyAqhx1n13ALdyguQzE1Kr4Qw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=202503 header.b=mfXp85mM; dkim-atps=neutral; spf=pass (client-ip=150.107.74.76; helo=mail.ozlabs.org; envelope-from=sfr@canb.auug.org.au; receiver=lists.ozlabs.org) smtp.mailfrom=canb.auug.org.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=202503 header.b=mfXp85mM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=canb.auug.org.au (client-ip=150.107.74.76; helo=mail.ozlabs.org; envelope-from=sfr@canb.auug.org.au; receiver=lists.ozlabs.org)
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d1WRp1GRYz2yVP
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Nov 2025 14:45:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1762314307;
	bh=u4a8kzakFPj8vNRJV1Rd0XvaxUsFNMpjZbVNQGFPFD8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=mfXp85mMKWeIafO1zauT/CzEiNstAPwrVl2SSTLn6fPr8xpC249CiwGOkVIEul3Rc
	 HE7tAM35WiQCCwda8nBKlZ7zOP7WRLu/+mVRzdPvg9hoVfGMsBAuVnUd29A7T1SV+z
	 WzczxJLd04qrGsmXz/Uth3+r+J6XADoFcGhXyUgtgYqzMv3Zjy95b5hOtSiZxBkW4K
	 mF7vcnnDPF6N0uetnjcJFx8nUk+TdNZE8n+kZKU3N7DGEpnoQGdjCPtwdQEM4j6SXQ
	 V2rEKUNUdwy7HpthAs/RXgY7ai8/6QPGjFFJ53Rr0kZxTx5t06RkN3n4YUsqqRwctX
	 DD+gP/nkBa6qw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d1WRk6GDzz4w1h;
	Wed, 05 Nov 2025 14:45:06 +1100 (AEDT)
Date: Wed, 5 Nov 2025 14:45:06 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Cc: Venkat Rao Bagalkote <venkat88@linux.ibm.com>, Madhavan Srinivasan
 <maddy@linux.ibm.com>, LKML <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, linuxppc-dev
 <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [linux-next20251103] Boot Fail on IBM Power Server
Message-ID: <20251105144506.01ba08c8@canb.auug.org.au>
In-Reply-To: <87seet45z0.ritesh.list@gmail.com>
References: <5fb6199f-7077-45a2-9a54-2ef731d8a606@linux.ibm.com>
	<87seet45z0.ritesh.list@gmail.com>
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
Content-Type: multipart/signed; boundary="Sig_/l+UQhk=DxnBs257YrwYF89e";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

--Sig_/l+UQhk=DxnBs257YrwYF89e
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 05 Nov 2025 07:04:59 +0530 Ritesh Harjani (IBM) <ritesh.list@gmail.=
com> wrote:
>
> Since you must have the previous linux-next tag which was working for
> you - do you think you can git bisect to identify the problem patch
> (which if reverted boots fine?)

You are better off bisecting from Linus' tree (which was SHA
6146a0f1dfae for next-20251103) to the linux-next tag - assuming that
Linus' tree is OK.

Also, please cut down on what you quote in replies.
--=20
Cheers,
Stephen Rothwell

--Sig_/l+UQhk=DxnBs257YrwYF89e
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkKyEIACgkQAVBC80lX
0Gz04Qf/bIlXkSw/IRoCLGG/j6ZOLEYV6DYftSarKyl+Gq3+j8Azzyc5rqLEeV/C
Oqf//MUhzlCfnLtCYclSFBfDYr/w3pf8dSkzi3hOMXF/wqGfAHR++FC6cXNYyIj3
3y3KTISr9kd7QUfYmsa3BVD6o1ozmvjGFXMr+YsQ5EOUujg4iC6js6W/ZvZ8Pj4o
80XcL/+UTQGO4mCY+OMth3KvIFlIdi8UZQQ8c+KEaAka5tJJVXAzMekchUH39pwT
6LgUaDYJ1wrAxKzsaK9mUdJxjaqwPb+neL0BVBVQ+kBfgKWGzUNZJJyRXNHVFXHQ
nQXcSoAYWUIzKEbIiwZI7KqSW1vghg==
=1fvF
-----END PGP SIGNATURE-----

--Sig_/l+UQhk=DxnBs257YrwYF89e--

