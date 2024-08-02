Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E995945682
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2024 05:04:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=d00kIUzC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WZrK81zjSz3dTx
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2024 13:04:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=d00kIUzC;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WZrJP6vKMz3c44
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Aug 2024 13:03:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1722567828;
	bh=epnw07M9RB8tBBcBHAGSao7Y0PVLvwTTu/LZBKjRBdw=;
	h=Date:From:To:Cc:Subject:From;
	b=d00kIUzC1bdyvGW03I30/bGzaIt18sX3NGarIb/S0A5uzvxMoTSJedASNoGMCH3Lr
	 7XuMIswl15HLUDOL9xuO6+9KLLutrNweAMT7ICOzx4/B9zS0aOuWVnRJFXqUh2i4nk
	 hO+484v17UJUiKpWw+h3C5/XRA3ids1ZD4qvvQBm8HcFYiPaP9iOVoFWe4ozE/bpXx
	 FRTuOYXxWqwfkp+mXlkgpy/Lmn27pY24KFZll8/yFM6PZOzRmMuf44CNtPUeJQaRid
	 Rtn0Ik20sAaIg3XoxR8rpcBTcx3C05D9lpx4K/cswvD6/KyeaQN3v94VSlL/lJHdYu
	 wRSTnMlwgP2hg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WZrJM6Ysrz4x3r;
	Fri,  2 Aug 2024 13:03:47 +1000 (AEST)
Date: Fri, 2 Aug 2024 13:03:47 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: ppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: List change - munging for From addresses
Message-ID: <20240802130347.383a1b49@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/erHXY=h/WskJ2L6GgsW+O2J";
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
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/erHXY=h/WskJ2L6GgsW+O2J
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

As more and more sites are using DKIM signing or emails (and DMARC),
more and more of the list traffic is not being delivered due to Mailman
altering messages in subtle ways (so the DKIM signature is no longer
valid).  The easiest thing to do is to tell Mailman to munge the From:
address so that the messages come from the mailing list itself.  It
also adds a Reply-To: header with the original sender's address.

So a message from me to the list will now have

From: Stephen Rothwell via Linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Reply-To: Stephen Rothwell <sfr@canb.auug.org.au>

The only real downside to this (I think) is that if you take a message
from the list containing a patch and apply that to a git tree you will
have to fix up the Author appropriately.

Konstantin, I assume (hope?) that b4 may have some way of fixing the
authorship up?
--=20
Cheers,
Stephen Rothwell

--Sig_/erHXY=h/WskJ2L6GgsW+O2J
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmasTJMACgkQAVBC80lX
0GwSJQgAhcOxEoKvh5/fz0on55yKnDxBsGSiv1ZEaDJMNjt++qa4wZNFJpulgYBG
Npnw3EK3Ob4YZM2khzRF/uXmQhKzNhJON+djS9DGZtasIMo871wyvbZkoZhX9/rK
ibudcMInDT90VWLJliIxMV7QmROUYkBwjpMZXNMVU9L8mHfqdqyFBruQFQSJMf/i
pHxgaJEoL/gov+zKie5mPNKPK3xYLtukcuyyCTRzMaKCrLEfPWP3pYybx3do4L7N
S26Ol/pM+gPCUH32IMmZkYjqOBv5FQs+/fGHEDO8PUrrOEfvjfksA6/77tBAWcN3
WhAsXzSHg15sM9t5b/BfPVbjnAqeBg==
=C7oQ
-----END PGP SIGNATURE-----

--Sig_/erHXY=h/WskJ2L6GgsW+O2J--
