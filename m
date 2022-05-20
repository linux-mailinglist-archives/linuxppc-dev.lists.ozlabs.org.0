Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 400D752ED40
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 15:36:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L4SS91HPQz3bmF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 23:36:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=DA+qh8ed;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L4SRW5jsSz3bkX
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 May 2022 23:36:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au
 header.a=rsa-sha256 header.s=201702 header.b=DA+qh8ed; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4L4SRR0KlNz4xYC;
 Fri, 20 May 2022 23:36:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1653053764;
 bh=rv1y2V0j2hffLl77o/ijD0s40MZpKA7qrdB4T1/IDzs=;
 h=Date:From:To:Cc:Subject:From;
 b=DA+qh8edn8yS1GBay0R5VWOjpa6Lipy99y9HOILQTztbIVLgr7WW/GPFvdzeDtyxJ
 L0bhR1sPSiVJHawzCWl2QiFCdJedAWwsOlzOpO8sk6gV+NbNJYjz3E+UZ0SkKDchmT
 90bzdvhRmCKgc3SvNFI5sr53uhQZ8+06289JryPrhafHU5hS5B+q35kY2KLkVx07up
 AFg4v9c8K94FaVO86vjapluavZHPH7WyfjzZhzBMb22zjOa1mHCYyj5anaIyExfPYB
 0GHK9jWP1iS0AFGbYoS6u/tC1Q+q8Si1dUzqeeP1KlG70wSS+6UzvM8qhBPuVnMpvJ
 0oWZIHoGbbppA==
Date: Fri, 20 May 2022 23:36:02 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: linux-next: changed messages in qemu boot
Message-ID: <20220520233602.2738d87c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/fUjO3JqV/cTb15Tx6/q9Ay3";
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
Cc: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 PowerPC <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/fUjO3JqV/cTb15Tx6/q9Ay3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next bboot of the powerpc pseries_le_defconfig build
produced these different kernel messages (diff from yesterday's tree):

- ftrace: allocating 33658 entries in 13 pages
- ftrace: allocated 13 pages with 3 groups
+ ftrace-powerpc: Address of ftrace_regs_caller out of range of kernel_toc.

I am not sure what caused this.

--=20
Cheers,
Stephen Rothwell

--Sig_/fUjO3JqV/cTb15Tx6/q9Ay3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmKHmUIACgkQAVBC80lX
0GzcrAf/Ru8QL632jWscLmwjX6IVBqTFPdIpCEWCqrxblq0BBzBAexYJg1DPu/B+
XVp0lF5GiAjqrzrW8sNryi0y1pHJVZ+drhW0l/2Z/vs/WEycAds+58XMHOIiMXMc
L2WgYQYXcbljMrV3XWIorzyLUlDGQuSG+zAIJnJs0CwbAzq4MBiGdqKYC+lBJQCu
njvmwsJMz13J46nLWYb98iWpXjxDylsOXLx506vBOubp/4+H54tYGertlBGJo/Y8
kvVjRsoUpPnaxuSN5cAmqXK9KUFmKr7nwzHRLv1mWqoRuLQNsckXFBmowxD2+UIN
kr5pBQfQDh7rjQu54F4RRo8ToCvxIA==
=9ugd
-----END PGP SIGNATURE-----

--Sig_/fUjO3JqV/cTb15Tx6/q9Ay3--
