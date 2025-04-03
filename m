Return-Path: <linuxppc-dev+bounces-7432-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F949A79BF5
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Apr 2025 08:29:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZSsKQ5jTmz300B;
	Thu,  3 Apr 2025 17:29:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743661786;
	cv=none; b=mdnDA02O6QtWZPiUvWyQO3NSOZ/ZurFPUYb5kDYpW0cMnOe2GgUP7Y2pCOvVP8IYQ+H7RKu+YGGnOpkqo1jQxizRHZkarpmpFdlU+XeAVdG2JHPisknQP/KjZIbmE2CXAvVt1fSiyzT56Z63rGYSyC/4I78GmlYFlP6J7ThxVrc/JAg7KVNouqwJApZBIypet8JEZE2an6xSr/FADSwWAwl68aOkB34FNPp2l9LRe9ID/fslx8UPu8vTfgXvVa0iySOUVWLq/4j8mgC8h0yL4UjPHvcyl4Bx9mHcdjSS41IeOGANrTzHxtGASdIrPVuS38zKx6c8AfcDhf2uBagRUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743661786; c=relaxed/relaxed;
	bh=3VMJD9M4qwwCZAnuMeXC+JixiDn1kJwilDGaeSamM6M=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=COZKJ/I14NbryJS9jX9ZVxycASJ2CaqrLcNNsvG8gY7j5C6DHiiMH/apTE2g+2z6HcY80pgIVZ0/Se+ya7QY9IfksXTIWDHbbpNcN1Ux1fcdB/9/rLQjalhi6KlVICJULVCAn5jOlXikmBeIZYU8Multby7NccceGc4CVOSOX8fwzGWMkKfEedzEtS7OTYiHfwBiV2i4dN4Zl/X5qJF31bQhFf9r63s07dktRCAISQq74r5/9vrapzPFgVX1KSsO188iEmryx2PQFUOaISrTaV/NlA7UUoms9doKLl7CSkrdqGMgsclegdgoRCJIMHuq9kt4NuTsGpWsinci/oVhXg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=202503 header.b=c6mDfxlh; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=202503 header.b=c6mDfxlh;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZSsKP0d1jz2yrF
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Apr 2025 17:29:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1743661781;
	bh=3VMJD9M4qwwCZAnuMeXC+JixiDn1kJwilDGaeSamM6M=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=c6mDfxlhkscF/au++bbbYVWEDfE5JmC9IBB9JnPw2pd3+sQ3TBByr5mPJhTBJdnBp
	 vQfoab64e5gEfywL1z/4GVsdK9tLkIrAQixkWOfrFbUZgmdo6beyJcbQGmhgNhm+XR
	 /gwkLGwSd11+VLjo18vpzjSg6mki2liBpJqVHSNrJPio8Cr9ZHWCny8kh+5f58PamH
	 v8iTWSlbpc5vGN1baFhtSjPWLLbMGFU35z+WZoDjALY/HX5HI98SYeECpsq0zYGpXg
	 KFVEuTNy+cynEJyw0fxfGjvRJmnZUyxkDnPvyc53iSbW06jzYwhJRcqzP42xr4M/gy
	 gCSH/vVEnqNBw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZSsKJ5899z4x3p;
	Thu,  3 Apr 2025 17:29:40 +1100 (AEDT)
Date: Thu, 3 Apr 2025 17:29:40 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, Linux Next Mailing
 List <linux-next@vger.kernel.org>, Andrew Donnellan <ajd@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>
Subject: Re: Please add powerpc topic/cxl branch to linux-next
Message-ID: <20250403172940.3224efe9@canb.auug.org.au>
In-Reply-To: <878qoiht4k.fsf@mpe.ellerman.id.au>
References: <87y0x3dibs.fsf@mpe.ellerman.id.au>
	<20250318002643.71ef29f1@canb.auug.org.au>
	<878qoiht4k.fsf@mpe.ellerman.id.au>
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
Content-Type: multipart/signed; boundary="Sig_/=VNAbOBBRZ0a4lxNf0yen0j";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

--Sig_/=VNAbOBBRZ0a4lxNf0yen0j
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Michael,

On Thu, 03 Apr 2025 13:32:43 +1100 Michael Ellerman <mpe@ellerman.id.au> wr=
ote:
>
> This branch has been merged intoo mainline, you can drop it from
> linux-next. Thanks.

Done.

--=20
Cheers,
Stephen Rothwell

--Sig_/=VNAbOBBRZ0a4lxNf0yen0j
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfuKtQACgkQAVBC80lX
0Gy2+Af/YKjP118KuxHZJ5MQag78XZYte7irr12ssyoYNvksOz93QaTMZ/pFWo3G
J5o+Wn2CNWficMbtfZaFJhtnt3vIwZ9gMeoySj77MP5w70SnIGxOXPKDZIusbira
qZsMmLFC/dsVOqoCjaCc+2fPMCo/aAOHjeEU0ku9s8uwbCAUFKJA9ocMrTqQkev+
X82RKu9+J3tfb/Ahs+pKzKA8PBZpLO3+HZs+UqwgmW32FxZQB2I+SP8HtHwvg/ew
mDpluCEAxxh3Px6qQ1caA22D/iu47kqSsSUVKdWP3825rYCutd13a0+dCK4HRABs
D29wbveCEMCup3R1yOLHEmoWabcd1Q==
=/p0+
-----END PGP SIGNATURE-----

--Sig_/=VNAbOBBRZ0a4lxNf0yen0j--

