Return-Path: <linuxppc-dev+bounces-7880-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 26EE4A95DE1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Apr 2025 08:15:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZhX5m0bZpz3bqy;
	Tue, 22 Apr 2025 16:15:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745302507;
	cv=none; b=gmPgOdWU5raZwNCtrfJW+jU3XXYrh2Y1mu41d+D78cTn+4DsN9zLkSrN7rPi7/Mr+Nvg3KjLln9Kwx6WbRMWWoopsULh+KcLOZxX6D9ADSgiCfiGfip8OGa80zPA0gKzXnreHPd8XKwKdXFb7FWwxl46tOmFKOTcE8mpppbYJZWejvJqm0dKBBro1+6Wa3jQgmBSet6wCrmHHiuAzhqBhaXSPCviPJ2xJ6tkdj2S3zJcPZg+p52/k8QXTpk1zHZpN98baZYnF5hQdN3JxTSIo3+SCP75MSU/dZsov9kTU/qTF6jGGW4SR+VjLJm60XoZafB+E3Jh1BQn/aUadSlCcg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745302507; c=relaxed/relaxed;
	bh=QVMRFF0HnMuDauG9BiETyBoIinlRhjQP+PxMeCLIYbI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=deJC1vrOOmkjYPzTK3vZEB07W+RSXmbAy4CMCZirCrmo2wZMKd8Mhs5XxYBn3evH7kxcMPf9I643UDBJ61Y0yBdwK39L8t3fgQrVJVJ/hjvfl30J6Cs/njSOj8blLySEn5bMetys/beEVYJdFNS6GeEaiXlMKd4n5lfOpT9PqTGAtkLoSo+uMEEoXof9TNiFjQNk8ajZwhhZGtXSdVkdzIyPhg2m5q1NBMRwQCfS5fEgOG1SseRyPqKYhqcJ6WainoeLeXDitIs0uxbvFaE8Qek1TH9lCShuiqDsCGt7HFfBnlap8JFqaiiqJaGWrx5J79gtNkFLegxMxNrojyZo0A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=202503 header.b=RXZXDkJC; dkim-atps=neutral; spf=pass (client-ip=2404:9400:2221:ea00::3; helo=mail.ozlabs.org; envelope-from=sfr@canb.auug.org.au; receiver=lists.ozlabs.org) smtp.mailfrom=canb.auug.org.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=202503 header.b=RXZXDkJC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=canb.auug.org.au (client-ip=2404:9400:2221:ea00::3; helo=mail.ozlabs.org; envelope-from=sfr@canb.auug.org.au; receiver=lists.ozlabs.org)
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZhX5j6SlLz3bqW
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Apr 2025 16:15:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1745302502;
	bh=QVMRFF0HnMuDauG9BiETyBoIinlRhjQP+PxMeCLIYbI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=RXZXDkJCnkxwhFREEgoM2mg/PU1Pi/fAuGIKjAwNXwuPu3L4atBbJuZV7OdQtYhyz
	 2o44gNrYrEmG5fBVXq+ccO2Dd8SpMgK/1TQzJWoYMh26K21q4M5En/fR50S3PKsDDV
	 QMxwH5Z+3duIJSyh9OLAR7nuqEnturc22mciADKXO7npoPuT/SkN03snfvI/NXrnLL
	 xFHPGplB83pQQv6oh6zuxFXU9puKO32S/1GHHQ0KrJkuUdBbhBaD1FpHQ3N6mlZ4Tf
	 NTlMYGG9Parf1oW4gT6qv9Ex+BD341XrM5Pn7F06NebIqf4Pjghlk2ULQlUYPA8OEv
	 rQKe+6TLG+5Qw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZhX5f24ycz4wcj;
	Tue, 22 Apr 2025 16:15:02 +1000 (AEST)
Date: Tue, 22 Apr 2025 16:15:01 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>, PowerPC
 <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warnings after merge of the powerpc-fixes
 tree
Message-ID: <20250422161501.306c2712@canb.auug.org.au>
In-Reply-To: <157256be-d77d-427e-8feb-77d1373b0c00@linux.ibm.com>
References: <20250422114720.480cea29@canb.auug.org.au>
	<157256be-d77d-427e-8feb-77d1373b0c00@linux.ibm.com>
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
Content-Type: multipart/signed; boundary="Sig_/+i4FXKqrriw4fU2=CB0IMrR";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

--Sig_/+i4FXKqrriw4fU2=CB0IMrR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Madhavan,

On Tue, 22 Apr 2025 11:20:38 +0530 Madhavan Srinivasan <maddy@linux.ibm.com=
> wrote:
>
> I cant recreate this in both my x86_64 cross build and ppc64 build with d=
ash.
> I tried both ppc64_defconfig and pseries_le_defconfig compilation.
>=20
> x86_64 dash version : dash-0.5.12-3.fc40.x86_64
> powerpc dash version : dash-0.5.12-4.fc41.ppc64le
>=20
> Can you share the dash version=20

I am running Debian Testing on ppc64el and the dash version is
0.5.12-12.

Try this:

$ make -p 2>/dev/null | grep -w SHELL
SHELL =3D /bin/sh
$ ls -l /bin/sh
lrwxrwxrwx 1 root root 4 Feb  5 00:14 /bin/sh -> dash
$ dash -c '[ $(ld -v --no-warn-rwx-segments &>/dev/null; echo $?) -eq 0 ]'
dash: 1: [: 0: unexpected operator
$ dash -c 'x=3D$(ld -v --no-warn-rwx-segments &>/dev/null; echo $?); echo "=
$x"'
0
GNU ld (GNU Binutils for Debian) 2.44

i.e. the $( ... ) returns 2 lines of output because the "ld ..." part is
backgrounded by the '&'.

--=20
Cheers,
Stephen Rothwell

--Sig_/+i4FXKqrriw4fU2=CB0IMrR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgHM+UACgkQAVBC80lX
0Gz/IQf/SN+x+1J7VFJkonKWzmhQA5zThWUQzzAs+Cm+Xn83+RnwmmInYBhzYJK8
vywIDDEUsGgyreJJyhb9PP8Je6g2vMi1pXCGkaXv5ZbttJUL2QIvVKCkgrVExrvN
YUPJe/JmG7s+Oao97lFoqI5bEgI1ITfGO4MnyNmr5QQjgt4O49UQCNwzepTDtfco
1dXANjEFpcPEz2YvrzZW/7XUWY+WvnfRXN0Gy6iRW4JuUhPGKAWIi1yhH2C9W0sa
+IAa7W5rWVO8yyBXXvGtCoRjIEuRZRTZ/r32v+lLqAfcAw2ppBJxRAbLLFXxWr3p
m1wcbdFi5Is799Ju2kXaDo9V2XOuPQ==
=xhpS
-----END PGP SIGNATURE-----

--Sig_/+i4FXKqrriw4fU2=CB0IMrR--

