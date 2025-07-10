Return-Path: <linuxppc-dev+bounces-10173-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D63AFFF1A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Jul 2025 12:22:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bd9s54kdRz2yGM;
	Thu, 10 Jul 2025 20:22:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752142969;
	cv=none; b=f8tz7KgqoYVqjy1sCHZfmUm3JO9icp/7rxR14UJpPrLhGCM00KjmezlF2ynvDDkVcVEu8lKhzfRxJsIzVLlATyLSjgay1KPPknAlFhNnapV9VZvSAFh8DqtGdTS9KJLduhXyAubOq3X3H8YkBaN0UKZtOSeSRE05dbe/oqEcCZaoP0L1oytgqgiSAs9jg8NPpjN1w3/uxMEDt4A3sYg88Rj987gp7JGeQDOMIDGFtMIRf8lFDeaS6K9DrU3HHktF+wcZeb7DLOQTA0/aylg9JOKdEZLoFrswmFQF/LycxOGt+2LFZ8KC2KwHZAGCtDkmRCg366uFBbuiYWXohhbI+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752142969; c=relaxed/relaxed;
	bh=aIIZQ1CXQ1yODxoyueZTb2QQqz00XYiPBjdu2QjjfpU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DEm5zbCyPEWCDfaansqY/VLJxBKJPNKAdIUXzDeMeXbLjnz1RjIykFAvjeXQ+KHhYdVbiRC6zHwYOq8XtktZwJrZEvQfqQeIIdnDbdOVTFAWVDKMWlHmlUdzXyYQGtgUq9yiCMzbt0n1KVFhxEvVHzFnAs7271OdYUz3JIyg04HAymfZryigdHv/aRHDfiU1zQRV9C6kAZq6479jVLpwntEcGx3kfpXROvbyPoiHi5e0Xmz1lSDEC+ENcP9nVeEkNVA3DbFROvZsvm+gCcu2VwQXVV0p6wthI8V+xrCRj2ufzHlUf9FQdW6kOqE7SiGR9pKsNTTjgQ+DGAUfodMMRA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=202503 header.b=AAcNKBuW; dkim-atps=neutral; spf=pass (client-ip=150.107.74.76; helo=mail.ozlabs.org; envelope-from=sfr@canb.auug.org.au; receiver=lists.ozlabs.org) smtp.mailfrom=canb.auug.org.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=202503 header.b=AAcNKBuW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=canb.auug.org.au (client-ip=150.107.74.76; helo=mail.ozlabs.org; envelope-from=sfr@canb.auug.org.au; receiver=lists.ozlabs.org)
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bd9s30FNlz2xsW
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Jul 2025 20:22:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1752142891;
	bh=aIIZQ1CXQ1yODxoyueZTb2QQqz00XYiPBjdu2QjjfpU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=AAcNKBuW5cQWLR7QggFxaLjOYLfOaVs7uXdReVQ5S/qpEDsi9EPVFS41cJ/WJahJ/
	 QKTd0aYlbnIT/TbgNgQTuQ7j2QtjB8Nb0othu0t+r+e4GBmEnjhFJqEmckKEcY4+AV
	 lMojff8uOBqzDKRuOWmay6KppqGaBj5WtNza9s5GJzizls81F8OrSZLZxK0tkdiAgU
	 KJx5cPr9HTObaQToTUql+clG2DAMyJ34Apx04/pyI5MqDmtpxQ/KY/JcHjb5NnrS0R
	 zhRTS+61kOm/dvxlnS3qjtMbg6CODERmfkEmumPopZSZlB71fEqkjs6Lq38azXS4sB
	 fgQG6MRFZHjUQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bd9qb65zRz4wcd;
	Thu, 10 Jul 2025 20:21:31 +1000 (AEST)
Date: Thu, 10 Jul 2025 20:22:34 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, LKML
 <linux-kernel@vger.kernel.org>, linuxppc-dev
 <linuxppc-dev@lists.ozlabs.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: [next-20250709] Fails to boot on IBM Power Server
Message-ID: <20250710202234.7fd45cd1@canb.auug.org.au>
In-Reply-To: <fe13e9e2-8ac5-46c7-b925-b61d35104ed1@linux.ibm.com>
References: <fe13e9e2-8ac5-46c7-b925-b61d35104ed1@linux.ibm.com>
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
Content-Type: multipart/signed; boundary="Sig_/l8d0fWJRapxz1o6JFJg5qXT";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

--Sig_/l8d0fWJRapxz1o6JFJg5qXT
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Venkat,

On Thu, 10 Jul 2025 14:56:38 +0530 Venkat Rao Bagalkote <venkat88@linux.ibm=
.com> wrote:
>
> Greetings!!!
>=20
>=20
> IBM CI has reported a boot issue on the latest linux-next(20250709) kerne=
l fails on IBM Power servers.
>=20
> System entering to emergency mode.
>=20
>=20
> Error:
>=20
>=20
> [=C2=A0=C2=A0=C2=A0 1.071678] ibmveth 30000002 net0: renamed from eth0
> [=C2=A0=C2=A0=C2=A0 1.074227] ibmvscsi 30000069: SRP_VERSION: 16.a
> [=C2=A0=C2=A0=C2=A0 1.074238] ibmvscsi 30000069: Error -4 opening adapter
> [=C2=A0=C2=A0=C2=A0 1.074255] ibmvscsi 30000069: couldn't initialize crq.=
 rc=3D-1
> [=C2=A0=C2=A0=C2=A0 1.181132] ibmvscsi 30000069: probe with driver ibmvsc=
si failed with error -1

This has been fixed in next-20250710, just released.

See: https://lore.kernel.org/linux-next/20250709233953.7afb7a8a@canb.auug.o=
rg.au/

--=20
Cheers,
Stephen Rothwell

--Sig_/l8d0fWJRapxz1o6JFJg5qXT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhvlGoACgkQAVBC80lX
0Gw2QAf/eDZwYL+6yOtKX23a7y+ngUbVR35WAHoP6wLSCXCEywvQbBkier9Fdewy
DguGV05OBY145Ea/tEz+j7iY2TfM+qaM2MRAmJWMh9uBRQ4TfMyuGFiHZwcms5RF
gJezTBZtdDXsZQdMH9xiEIPmjptwY2Ki1WV5YdmFKvz8h7fwvbV50kYSF0/RqdTW
f8RziQafqx0fhlHoHyRFyHcESAFxklZukyIsLHcE49xanAVXtLSCdqDB7Xr5cCSk
l7LmN4/b7N/KERk1IwdKT8nfdrOYgsavAQWFUES/wwT1uzSBBtx1BLEAf0j8O4rr
DLF4iZ/JxhPZ6laIhpQvlJ8SSxfWog==
=d49c
-----END PGP SIGNATURE-----

--Sig_/l8d0fWJRapxz1o6JFJg5qXT--

