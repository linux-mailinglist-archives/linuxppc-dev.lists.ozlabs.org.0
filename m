Return-Path: <linuxppc-dev+bounces-5353-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB6B2A149C3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jan 2025 07:41:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YZ99Q5XPRz3bgf;
	Fri, 17 Jan 2025 17:40:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737096058;
	cv=none; b=PtTXp6KLw/ZTjY+JGKuHTYewnl+KyaeFjegD1zLYn/hwDCCFZVkV1c0V6jDJaO6CDpN66VEK4Wd8/J0YIfcDY7YDqCfVM3yH2BlEPhw8wD0vBsfYyvFFpYcJtmfnLWInJ+zXEVVnOV98YrWeypmdylFiasLPNQ1lRiUdDwtor53s+IUeIF0Mn7LRjgLCrkcwyS644Ovv2J6/IovPHoYsYe4HH6oxSJ9Qua+M7EIGMyArei6a2e7Qdz6R5hB1c76SEK/cxbYa++d8dDdDD7MrH9lmqDnuued5YUs80vVrF+vlPA8+nIlDRAyCavutWpCz+DX3m0sHmIabraJrN0ornA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737096058; c=relaxed/relaxed;
	bh=zdXuDVUI7CyF8Bo3jd9Jqbh/sm7uJdr2kFF1bV8j7ZM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=mubqYReveKJyTNPaR3ROJKIv1wYnGN/WvOWuCDC0FAbu3WOeMFrlvlMkNC8hDiUWQyTzeuiTBx0lyLkB0SjddbhgREsaN48U+hjbUArSVuU9TZOBKkNHgdpW43HQ23XMQoJnySy+6NGZmjMKTsdvRO8iwImDCVB86ox+1A90n+H2LcVnWSh/jZGnLo7VYckIpjD24Aylhq0D3DIufW4tjfi3tELt9uTRtqcy9zmX3lCKAZAh7uImzF7B62EH8nyLRjS2RJEoXYHCnmEvpBKtBos7sZ4Dz1Hmb2BGL7WdTTpwmB5V+A57ChJ4NJusUE7/8AexXetrRwV4lj4YIjPlbg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=HtX9vNx0; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=HtX9vNx0;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YZ99M0wdfz3bSR
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jan 2025 17:40:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1737096045;
	bh=zdXuDVUI7CyF8Bo3jd9Jqbh/sm7uJdr2kFF1bV8j7ZM=;
	h=Date:From:To:Cc:Subject:From;
	b=HtX9vNx0+sg2k7Fq3UvUGn3+dRu8qJBfE8kBhoh3DlHZDef3F/X2vfowhxEGOHerg
	 S5ITPuVbZyw4LKFAKQSFofu1i/D0OnqWOGBR9xnA8dVqOpaxzeAzmY2a7zKv6XBfEy
	 xAInxkTrgqk3CBL4WJ3hi73y//L67eH47lTEeXz9Od+kMlQU/qE/8SVLgt+l0w4lmc
	 E21TZSaMJXck38Grxb5Z1guef8wUdixLeJ9rJLIIrRim/L3+JGdF91uEstT1+MwG0n
	 wHOqFmV5Ly0paommXSrceYU3p3WgEcG2pW57/rihwWxkAEygm65MTem71RP9609z+r
	 NLmx9K7xkmzvQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YZ9990z9Sz4xQZ;
	Fri, 17 Jan 2025 17:40:45 +1100 (AEDT)
Date: Fri, 17 Jan 2025 17:40:51 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman
 <mpe@ellerman.id.au>
Cc: PowerPC <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the powerpc tree
Message-ID: <20250117174051.532c5772@canb.auug.org.au>
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
Content-Type: multipart/signed; boundary="Sig_/SRU59EaH/GQymPt.eeeIr/L";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

--Sig_/SRU59EaH/GQymPt.eeeIr/L
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in Linus Torvalds' tree as a different commit
(but the same patch):

  7fee0217538a ("MAINTAINERS: powerpc: Update my status")

This is commit

  77a903cd8e5a ("MAINTAINERS: powerpc: Update my status")

in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/SRU59EaH/GQymPt.eeeIr/L
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeJ+3MACgkQAVBC80lX
0Gx0Jgf/dlzQ1JQyarmjHUmRSbjDzNF3bz/p+KDagVrlmLMGzmS2Dy2cWn6/wGC8
bB9MWj91OqnP7AQVh42qPRsN4ANWAKLxz4L/SQPIyAy3WIYuH3G4PseBrUEdi+hX
DUDu+ei1XZWJkWEd2vBA8FttmL9VKSQBsGTBbp+/ZCg9i83FDfFDGG8424gMIS3F
JD/P96OZdl4cO6IWPZaDHkqns8yZAOK+fB87C8VVs5xoTd6Od9dloFB1PqverkPU
IpP/lkEXGMyyEurk63oYIiv3gdnPHA9fSfJNrVJE8VxMMjGdWgjCY0KbJtcHdnvl
zYNU2S0XEpF5aWYc0lnl0vjcypRe6g==
=ebah
-----END PGP SIGNATURE-----

--Sig_/SRU59EaH/GQymPt.eeeIr/L--

