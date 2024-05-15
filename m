Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A811D8C60D9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2024 08:38:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=VOfzYxkU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VfNp73Bklz3cWD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2024 16:38:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=VOfzYxkU;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VfNnG5s4gz30Vf
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2024 16:37:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1715755034;
	bh=APVgJNHkw0GoLhqndKWu3Ob2mj6Ex2bkWrznWolFk9I=;
	h=Date:From:To:Cc:Subject:From;
	b=VOfzYxkU9QsPDnTAGPXwpAfe7vwu78Gb/aJSI8aJq00t536XlyBsOOvr4P3Btg3j0
	 89gHmbFlZ8uhm3SQ7Hsrjl7MgB185+6GqryyarVPHgoSCcgnTTVucJR7XMLp9SdyfU
	 UMxrqKSXkcLdeLfFQHhi7n4hyk+j+QPQ5n63RCqUDHv19Yj/5rKD8tqtvi6u35qPrC
	 B5WHQfEa8v2IZY/aort8uG7qZdNLNgQxlQRNi1vKxQidE1CjFOo0WHR4q3/rf1Q5AB
	 TsU1oSaVIaINYa2Z2qxz56KgJtU9G/q1p7LIRj14oxKm92QFC8yxBusMw3Mro9UHLw
	 fI7hrdrySdLpw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VfNn563BFz4x1C;
	Wed, 15 May 2024 16:37:13 +1000 (AEST)
Date: Wed, 15 May 2024 16:37:08 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Michael Ellerman <mpe@ellerman.id.au>, PowerPC
 <linuxppc-dev@lists.ozlabs.org>
Subject: linux-next: build warning after merge of the powerpc tree
Message-ID: <20240515163708.3380c4d1@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/zfARr8Q8f9AC2zPVlVguGjo";
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/zfARr8Q8f9AC2zPVlVguGjo
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the powerpc tree, today's (it may have been yesterday's)
linux-next build (powerpc allyesconfig) produced this warning:

WARNING: modpost: vmlinux: section mismatch in reference: fadump_setup_para=
m_area+0x200 (section: .text.fadump_setup_param_area) -> memblock_phys_allo=
c_range (section: .init.text)

Introduced by commit

  683eab94da75 ("powerpc/fadump: setup additional parameters for dump captu=
re kernel")

--=20
Cheers,
Stephen Rothwell

--Sig_/zfARr8Q8f9AC2zPVlVguGjo
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZEWBQACgkQAVBC80lX
0GxS1Af/bFHD2LbuYbe9OcFIUFDiT1c4qaIJtvj5nf8ARrtDwlnxoW5GI4SintL2
ZYIdWZnvw/RrWob7XRUIg6PcK6IDXhwh30a1jz6aEyv+m/MojjIeJpOH4wominkz
tAqSiic+yThBgF0AQQ4tKvlabR1ObtiPd053OkvKiQHuuZBpSkTbG6QgK+3LeV+s
AUZLJe549U7xwnLz1f9ToSvt/qNewXiOy9jBF4uu5q/zuzUkq5wAQdNU01VlqGmS
ADUXyiNLTnUJxwnwoe/itnqlgdFl4tB28KXr7zv6T0IKfFwOK2KovnL/wAZLd/bj
Ih9EZ1K/MhyqVmEX04xjz2/r8+eFRw==
=oatL
-----END PGP SIGNATURE-----

--Sig_/zfARr8Q8f9AC2zPVlVguGjo--
