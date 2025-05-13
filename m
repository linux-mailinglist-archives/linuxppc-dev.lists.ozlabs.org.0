Return-Path: <linuxppc-dev+bounces-8536-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4912FAB5272
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 May 2025 12:29:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZxXl66MmJz2yMh;
	Tue, 13 May 2025 20:29:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747132146;
	cv=none; b=Tf5KHEbudM3NHByviXth6EduTMmF3Q6LTHLxtwRPJx6xL9d9e0USuJv5Ewx4z/CCMhJZ7ntheYyx5CDd3LUZ/GNxXpRF4A2lrVCooKX1tQmRlZMBNc9LJsY9hgX50KDG6XLtZoc+kuXzxBe2ZyyJ/WL01HYvcuKrXuVGkGiZ7NwqtEvEjWupFHmyABzhuQWtOVnQnV+pU8Jvijje6vOJKhDONbWIMsw36AQMfowjrDiPLZyWl4OxxH8uocJ8QDzscj+k73iJ18WgYJHlYyv3UV7JA/Ef+JlsudNwAyuaBWAcFDj7qyefpfIBZ0vPqWEJ6lF1yVRnICbXVvptOWVMbA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747132146; c=relaxed/relaxed;
	bh=EbhkY8PhCgGNIawYBN1G+sNXIoc1IZNTK+xP9oFp1Xk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=m8jVv6/cOyf9bzSYlECasM/3k/Zyaxlw2rTIEAHVCD5oPqCFGaFRoBsTlH9F0HiW4Sd0YTk2LMNAYcEWVGXbWRiwfaI2MoNtNB/RIdXeENsUatstLpIDN65MKP1h3Noyzq5lgxeG5h/dbT4YeLwfUngeEjKRI0PoMbIwrQFUowPUNx6uH6EMabAaK5yt/t/fCATF8impBY2y/1P4OCV/MKgYzWm7rQQucugcvlvH6BDWJZC/H9DPuLan7/5AO1z31I0pn+Wu2EL0Q7Wc73iS2DCD+r+Yvu9FOpt3hwo7j0cFpidX7tZuQjHMpbO8jJGntwTqP6mxzSUcq4TjYFKz4g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=202503 header.b=kMkCYK9p; dkim-atps=neutral; spf=pass (client-ip=150.107.74.76; helo=mail.ozlabs.org; envelope-from=sfr@canb.auug.org.au; receiver=lists.ozlabs.org) smtp.mailfrom=canb.auug.org.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=202503 header.b=kMkCYK9p;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=canb.auug.org.au (client-ip=150.107.74.76; helo=mail.ozlabs.org; envelope-from=sfr@canb.auug.org.au; receiver=lists.ozlabs.org)
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZxXl45S8Cz2xBb
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 May 2025 20:29:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747132139;
	bh=EbhkY8PhCgGNIawYBN1G+sNXIoc1IZNTK+xP9oFp1Xk=;
	h=Date:From:To:Cc:Subject:From;
	b=kMkCYK9ppAgMcYQXkBtnP0Kl1apPIgd/0PIsInlwakklmCMTZmPTGyk4x9Gpuwgyb
	 qTPrWkyq9p8nFHNJOPdGFscbJLR+s6vpY9+h35AOMks1ULUvVAdYyYyK5a4uu6ZHQX
	 i7qDjotE/rbo1ZzqZnrxhrrst7qP645xzuHegN4u6Tq7K7CL2xzk23Q2U3IXAUIXfW
	 +ppDwjLKfW2NZUelzSxE91DAz09GQ8tWehT8XzeVPOvBeoBXjBcPdgTYpY7XczKzfd
	 Vr/HMQP/Q/eyWVy4zU3EN0s8YCgZio+cd5L2gPpjC0IB0Mmq0IadO0BO44HWiS6otd
	 j7QPXR45HJVBw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZxXkz2cQqz4xQ0;
	Tue, 13 May 2025 20:28:59 +1000 (AEST)
Date: Tue, 13 May 2025 20:28:09 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman
 <mpe@ellerman.id.au>
Cc: Athira Rajeev <atrajeev@linux.ibm.com>, PowerPC
 <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the powerpc tree
Message-ID: <20250513202809.7e23ed2d@canb.auug.org.au>
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
Content-Type: multipart/signed; boundary="Sig_/UyvRZZ+3eWJAk/nH2_YL=_N";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

--Sig_/UyvRZZ+3eWJAk/nH2_YL=_N
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the powerpc tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/arch/powerpc/htm.rst: WARNING: document isn't included in any=
 toctree

Introduced by commit

  ab1456c5aa7a ("powerpc/pseries/htmdump: Add documentation for H_HTM debug=
fs interface")

--=20
Cheers,
Stephen Rothwell

--Sig_/UyvRZZ+3eWJAk/nH2_YL=_N
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgjHrkACgkQAVBC80lX
0GxDjAf/YJ7nYC/NWAAMY07hMWZRfNhuioB/w/XVb/HqNISKb2ZRshUR2RMhQoEk
6Dil1SV4kjwB5kQ8m15ax+FvGd4h21CkBTiyGPq2x66RDfIV8nOgJxxHWXvx1M0l
CEVFdkfgHvo+XPfBHVaX6d2BWPjaUGZ0jnFUyU/hLUzRIkAETgj/f7ZnRjrwDi/Q
Wn08ScttL6VQme+hdJKCbvW881/z36ylEQuObgccd8odVZXXTEqGIn4r1nbuZU1n
tYklFLgFK+4/699BM6PLl7HpuCfIEmKImMIp3j8ASBp47OPW8LNOKfl40TOfnjHU
F51Jc8pm7pHJG1g6XVv8FFikhqHYWg==
=n+Gw
-----END PGP SIGNATURE-----

--Sig_/UyvRZZ+3eWJAk/nH2_YL=_N--

