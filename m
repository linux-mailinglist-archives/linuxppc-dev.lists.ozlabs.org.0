Return-Path: <linuxppc-dev+bounces-10443-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0CDB1567B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Jul 2025 02:29:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bsClQ3tZZz30WT;
	Wed, 30 Jul 2025 10:29:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753835378;
	cv=none; b=FpNwaBYxPK9drrPAT4Rqwp6Nl89YLUUkBHUxQ3N7Juf1g9BpJazaRHNpxSueXiXqUa51L3HQ4V3tPk0BlHPOAyJYdNzc/kKO9795crInTrFCvv+OGw6fIakqrg4115GxLl6Qptp6oZHMUTC3OeDEOZv4pDnY704QZOvp7aVo2od8gPz73bsO2BwZE5lId28/r1pzTgszJyOisxM6Ntil73qPlwi6JklEnOQnjtoLcEdFYk7BR66dpZlPhIZuuI+uhDjp3/rDvlspgH8yQ13XjuRr/35O7cUBoH/IgPh0sLxuJjHX4h0XDwQ2XgP7a7Ogl+sARqu7rsJsEW5U/SEZfA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753835378; c=relaxed/relaxed;
	bh=MSlCwx1gEE9AsSIwltpcL7wIUH0dl9DJ7I/zv5IelgI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=UrCNLU18fEsEdIjhTn4ulCQDQ7SbsIIDdZQ8LgYCxZ5Utmn1/bO0VJOM+EDKz3xPfaUDqpG9mTeqIffTU5AtuYx1kgN5VmNkV1UxI/OAQFA5qA4XqCzCHphPMgxslseT/ENhlkVUImOc/A6xdhkAAQLnWxR9DY33FcNX+pYe0SrHbBR6eO028Otx5UWSkUP3yT6HDB21jc/u8pncxVO+p3iGQ4orkRvmEKRgsfoVf0cIPLtDLk5r/uTLYw3ADLiQ5qXA2cEdgUfG6c1Qkwmhn/f7ZSHzKCTQ9k512k2BTJSQGCbFa7ovIE8tCD3NF3v4Y2tl7UgLVej49zbj+oGckQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=202503 header.b=RE0Nqw9k; dkim-atps=neutral; spf=pass (client-ip=2404:9400:2221:ea00::3; helo=mail.ozlabs.org; envelope-from=sfr@canb.auug.org.au; receiver=lists.ozlabs.org) smtp.mailfrom=canb.auug.org.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=202503 header.b=RE0Nqw9k;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=canb.auug.org.au (client-ip=2404:9400:2221:ea00::3; helo=mail.ozlabs.org; envelope-from=sfr@canb.auug.org.au; receiver=lists.ozlabs.org)
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bsClP0DbJz2yFK
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Jul 2025 10:29:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1753835159;
	bh=MSlCwx1gEE9AsSIwltpcL7wIUH0dl9DJ7I/zv5IelgI=;
	h=Date:From:To:Cc:Subject:From;
	b=RE0Nqw9kcjufROkpz27ymZSMU+o4YUvSdd5R0TITTjByUgYfAPi3OUeh6mgXylH6v
	 hQHLyXYFnjFMJkPaOYv69n93Mf86PCSoqJEKCM0fhz9DIAoUKU/ZgeafN7/w9IXXyk
	 mCo7L9n+iB7DctQRQNzeOk/vxasTcVpNlX1ecdgvPen54wbhIhVYIoCW4eWhEQ8UEr
	 MIOxA86hqrL4icnFTcbB3CO0GbeKAJpYkuknhCz4NnF2b2qd1qYfbJSLZLpCahjza4
	 Aj6tYTHckacQamGDdJ4bSogzbHWnXJVCPvlaqaehdydZhAMmZn+YcS9aG6rz3T+Xij
	 oeT+Q6CDpcI+Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bsCgC1r9Vz4wbY;
	Wed, 30 Jul 2025 10:25:58 +1000 (AEST)
Date: Wed, 30 Jul 2025 10:29:31 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jonathan Corbet <corbet@lwn.net>, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>
Cc: PowerPC <linuxppc-dev@lists.ozlabs.org>, Vishal Parmar
 <vishistriker@gmail.com>, Brigham Campbell <me@brighamcampbell.com>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the jc_docs tree
Message-ID: <20250730102931.6334022c@canb.auug.org.au>
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
Content-Type: multipart/signed; boundary="Sig_/+/tkyWy/rkEDMHrJaY+v0_9";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

--Sig_/+/tkyWy/rkEDMHrJaY+v0_9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the jc_docs tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/arch/powerpc/index.rst:7: WARNING: duplicated entry found in =
toctree: arch/powerpc/htm

Introduced by commit

  c361f76da696 ("docs: powerpc: Add htm.rst to table of contents")

interacting with commit

  19122a7c28ed ("docs: powerpc: add htm.rst to toctree")

from the powerpc tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/+/tkyWy/rkEDMHrJaY+v0_9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiJZ2wACgkQAVBC80lX
0GyFgAf/e8O/qM6WHKkMC0MFGF2+dwbIDoaQrTn+Gz9GVqE/w/+4A3ObPaxNLivb
OilnG1b0HtuXqwfhMZ02wD2SpkaqNqs4a7HPVLFRaNjLoul4EjQcEcsYBXyYcwJU
mXz5ZLBMPuut5MJUrLHF3HnTIKp6ajtTgnJ3H54AnFVMo8cjI5G3lkTjaE2jspzI
CZNjygQA1QBNYyn8YGgVhf2eQBl+XunHkb0kSY7J/9/saoRyAPHYOz3EAzD4hsP9
cdCmAchh7JxheeJvvTjM6ju3ZIBff+u/Ff+zJmsfwEfAbZYU2IVFuFAg4b8Qenmx
QC53XTdsOIRtrvXZLpqybDZSUuf59g==
=zwVq
-----END PGP SIGNATURE-----

--Sig_/+/tkyWy/rkEDMHrJaY+v0_9--

