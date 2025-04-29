Return-Path: <linuxppc-dev+bounces-8138-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD16AA065E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Apr 2025 10:57:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZmvN305mzz2xs7;
	Tue, 29 Apr 2025 18:57:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745917058;
	cv=none; b=odaombzCFJnNM/GZSpVbFPweevGpwZIUKuPolBqUffJwlbezM+9tJWmGWE4PljNDoiB86s/GUK8dcr4vV3cjYqCPshHswOEskyMa/h1hH9R2L0fRNY6PNmNbm6PjWFqzkORzy8lcoM/x6VfxhBQBUfpio853IqpuXdCeS3iL7BKvfTFFuUL6NAbXdf0hEltup8r4aLaynziFrsXJw8AAFgshQo2jtDzbhJYweIV786TE5uGxFnjXtmIyZ8ZI3W3/gPv5GHb2SI/U4BhE8DHeho1Shcg3lSYBLQXmrggpreBQYb+p1amrstJd0q4IO6apocdyEv8a10ZDIHzWIn070Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745917058; c=relaxed/relaxed;
	bh=ZMnqol9b7L6ELEKe7hfrlsdsRW7rIxKvx54BuTFo/Dc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=nBZsRpK1KQ6Ez11SJjEQ19Ie/c2WrEZOcnHTputhRhVkFt1SGDpKYlU33dMS7CNayhkRhiQUYAS/tJNoJAiJ+rz8W3BMfgjgPdIyNi5mI53wcEEDgPSOn2xYuk19Dzy7hNzrsfx9i8k2joQmtPXJX3EgBXQhAmoS5Fe2+gCyDAfXdAqea/3E2hG+e0tVdHj5CBEAYB095PeZeL6xDXDoHL1KyLelW+dTO43u5nLTi36r6PO+q9s+nleG7PbUrpVMyIhALflO/sk2rD8but+y0Jf0UQYjjcd7nsA05qNm9laAC1vjaxUoOCj+ad5CFt0AC8moel1JxHUPiZIny0Y8Ew==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=202503 header.b=MycuiMEn; dkim-atps=neutral; spf=pass (client-ip=2404:9400:2221:ea00::3; helo=mail.ozlabs.org; envelope-from=sfr@canb.auug.org.au; receiver=lists.ozlabs.org) smtp.mailfrom=canb.auug.org.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=202503 header.b=MycuiMEn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=canb.auug.org.au (client-ip=2404:9400:2221:ea00::3; helo=mail.ozlabs.org; envelope-from=sfr@canb.auug.org.au; receiver=lists.ozlabs.org)
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZmvN126lqz2xk5
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Apr 2025 18:57:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1745917056;
	bh=ZMnqol9b7L6ELEKe7hfrlsdsRW7rIxKvx54BuTFo/Dc=;
	h=Date:From:To:Cc:Subject:From;
	b=MycuiMEnnNmmyK0uWAdp4N2vf3AdO0t0PXNQ2B/e9Re/n9yFyqFdTXr3JeJnJdmLC
	 21lTXIHyXcjr6wsjCyWxUqFKPm59N7+klUYHGFP6TjZhbCmm1Abu0cbDlXwOj010IE
	 ujqGDWtuzD6e0S9+EDi5AvPzt/CKyiFb3aSVBItIIobK+N9vAVxGJNK3NZNubsEKsj
	 ULp1RQzQCmK0K73V1Xz4E421Frkw/TvE5TZem0FhLR1kibinWFNxYGB+dXHPTxQXts
	 oEqfqIxt0gWlIKnz2lancLQWXfZYHl4yaM/V/aGhJfgybBnXX7nSfSoxdfnvj8IhjY
	 M0GmWxk4K3u9A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZmvN02yjLz4wcd;
	Tue, 29 Apr 2025 18:57:36 +1000 (AEST)
Date: Tue, 29 Apr 2025 18:57:35 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman
 <mpe@ellerman.id.au>, PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc: Haren Myneni <haren@linux.ibm.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the powerpc tree
Message-ID: <20250429185735.034ba678@canb.auug.org.au>
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
Content-Type: multipart/signed; boundary="Sig_//N6AO2owJxb3GsK2hxv6UU1";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

--Sig_//N6AO2owJxb3GsK2hxv6UU1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the powerpc tree, today's linux-next build (powerpc
allyesconfig) produced this warning:

usr/include/asm/papr-platform-dump.h:12: found __[us]{8,16,32,64} type with=
out #include <linux/types.h>

Introduced by commit

  8aa9efc0be66 ("powerpc/pseries: Add papr-platform-dump character driver f=
or dump retrieval")

--=20
Cheers,
Stephen Rothwell

--Sig_//N6AO2owJxb3GsK2hxv6UU1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgQlH8ACgkQAVBC80lX
0Gx/0gf/Yy9h/2ZxLOZuig8KsLaudX9eCxKcCBh0VWk6h3B0AV/cxaNfihM5wtfk
+IWiW8EfWs32fmvFp7swLiUGZwYcaU6RRZcmHqhKlDsgSigGL98/yROPnNOhksWv
kfNiMSgC3vWJIATPsyCdsTUc2gQDOBybyxUIXOvALixuh54j444eiLy0WRP5ACnP
08k4QLpXzs25OerPT0yHHtclwGFL0s85jdTA/I5JO3tpgCsy5caLiPp8xls6agO3
JkU0NUswLg5Ci7fT3C+tzcIV/NU7EZo3Y2bJ9QLbrrore4D5wjjd0WSpEvuajDlJ
JwPQaxdYnI4PG9ClNNeM1C7YouMIPA==
=AcDN
-----END PGP SIGNATURE-----

--Sig_//N6AO2owJxb3GsK2hxv6UU1--

