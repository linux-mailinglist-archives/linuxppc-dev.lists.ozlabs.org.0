Return-Path: <linuxppc-dev+bounces-10278-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 180EEB08451
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jul 2025 07:37:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bjMBt0GfCz2yF1;
	Thu, 17 Jul 2025 15:37:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752730661;
	cv=none; b=ZU5Cg0/Q4QGiX3HbPPEeVuHYqDM1sjE3iFNzN6UNwdRG8fZ6kxb5fHksW36c9MRx8Cm9cNniL/5HkiCJgWH19bUybWtYXImw5LRml/FF43b37MhfRtew718Q3EUP45lV6LuEnRvyGAzxYhywKgGc0VTjpUYcM2efVqp1J+/3sZYj6v9w11ZG6QFO2lpoIJSudESeyl4Yo3IbNDU88m1aoJMtSKNc77KZ7W5wK/S4NS8nX5SUKQMxiXDTyhTf2FucI8TJrQhhiOqSKC/JZFQ0KkVZQ3EW4Up0KEBP7vujsf3Es/05scqMpD+lZ+GjkEwbUl29Dr5v5ihAQDzJ9TTl5A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752730661; c=relaxed/relaxed;
	bh=WMWW7mmLlUo41cQzp0qfs2H388c0LiKcPKeAkVcGtYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=afdXMj5CE2uKdg1XO4FYKPEt4lX1y9lHuGY+e0Hleu8mW3GZza4iuGg8aRiNCkVOpsuKpWkDWaq54jobisBN0hRIhBD3k+ZSj6DRYby3zu4DB0y7lyfmL8PAlWxePNpvBi53mL8MHMQqZvkMSptuQGTxo2pWWe5Thjk7CgfaVsQoMZQyvDeOMlpQ0H6sZfV3wNEoAHHBav32EBw0/xIN/S6RrVoEGcLnaGELVRTUZ7/WdSow9waI6pXUtC+clbwnDo4lyU3tiz0cW1V44wcKBJIV53Q0saBFwEiX58ckp/jGeAwUmXnQlBhP647rxc5Z1j6gEh322+F8Vszror4WgQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=202503 header.b=X0B1oaLs; dkim-atps=neutral; spf=pass (client-ip=150.107.74.76; helo=mail.ozlabs.org; envelope-from=sfr@canb.auug.org.au; receiver=lists.ozlabs.org) smtp.mailfrom=canb.auug.org.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=202503 header.b=X0B1oaLs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=canb.auug.org.au (client-ip=150.107.74.76; helo=mail.ozlabs.org; envelope-from=sfr@canb.auug.org.au; receiver=lists.ozlabs.org)
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bjMBp3qRvz2xlM
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jul 2025 15:37:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1752730533;
	bh=WMWW7mmLlUo41cQzp0qfs2H388c0LiKcPKeAkVcGtYQ=;
	h=Date:From:To:Cc:Subject:From;
	b=X0B1oaLshnYx4gmEoC7GxA5cZoPgGs7evsmo9kNNVj/Cjj/hj0lfQ1cfafYr6ohls
	 BJKO53+5/pXEw8XaVhFheptLmb1Gg4xZRA4IFXGTfhCXSapoXh2JtOajEQQR+MSduv
	 j6+5BH2IGHLwlwaDU+j9n4WdZIMbOiNUo6kBaqu2rQ8f8kKmMTJ7E0P8Iu0urDGjMG
	 tzuwk9r1XbfCvFN5+iyZJc5TAvdb4/wSozZ4K5w1BvoT9GXlJCodshX5+sZjLEznYa
	 hFTYpCUXoIHidqQLsOaVAF86CIgMWQlPhHRWn5zt+HBRukbM9oFbfp63iNenJvNtmI
	 SHc4bH+JRU25Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bjM8P14QGz4x7W;
	Thu, 17 Jul 2025 15:35:32 +1000 (AEST)
Date: Thu, 17 Jul 2025 15:37:33 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>, Madhavan
 Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>
Cc: PowerPC <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the char-misc tree
Message-ID: <20250717153733.068c3fc3@canb.auug.org.au>
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
Content-Type: multipart/signed; boundary="Sig_/0yA+q2mtECuF9mq2nl4bW.Y";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

--Sig_/0yA+q2mtECuF9mq2nl4bW.Y
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the powerpc tree as a different commit
(but the same patch):

  01c6d1df98cb ("misc: ocxl: Replace scnprintf() with sysfs_emit() in sysfs=
 show functions")

This is commit

  e82fff08327e ("misc: ocxl: Replace scnprintf() with sysfs_emit() in sysfs=
 show functions")

in the powerpc tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/0yA+q2mtECuF9mq2nl4bW.Y
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmh4jB0ACgkQAVBC80lX
0Gwwrwf9FEYtPFKJurgxZ300g6dsUNdEGRP+WqU8+g8CgBCY6mf4PzsgwQ9CcWOe
AX+8bCc+KKx4n+gu7KpbsT1EOQtBgbImugEUm6lUyHOWHxTVMuYwUQYHNVj9+HFR
LVQYOiIHADDYvQCplzxOjO+mz1CPxoBuGgju5THvXBVfJx5isd6e40823PjwSm71
zEhgyXdKwDP0GV695G0VpsPxy1PWbBzO4CeIHiphCW6o/RShmAMiJKOU3h+koZaJ
mK4QC8QYCYH3rXlgdm8AKznrHaz+qd/f0A2s2SetZykKI9xBg2KYWs02ODqAQPaJ
RT6SlczW9GJEWEZqdapn9eRSnNzIzg==
=VXmE
-----END PGP SIGNATURE-----

--Sig_/0yA+q2mtECuF9mq2nl4bW.Y--

