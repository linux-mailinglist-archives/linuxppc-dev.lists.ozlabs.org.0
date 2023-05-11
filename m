Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1CB86FE9C8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 May 2023 04:17:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QGwX74Jzzz3fPJ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 May 2023 12:17:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=WfIeaA7S;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QGwWH1M1pz3bcT
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 May 2023 12:16:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=WfIeaA7S;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QGwW95y8Nz4x3r;
	Thu, 11 May 2023 12:16:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1683771397;
	bh=GHeX8XHYRuOhQoQKqkiFaNsusHVH2YKoZhPZH1BYuuI=;
	h=Date:From:To:Cc:Subject:From;
	b=WfIeaA7S6YuOLLHAx1et/Zn6Crfn6S/3J5UdNRZRQrHsnTs7uGTFK+DvvOiupSICv
	 F3ox9QA88ZWcJ+Gsf2ffoTZ7CVQmLgGcCfJA0/2AkvGuGEBivmreaG781M8OOYZ+To
	 FYhrcrlTrYvW8KLdPpOAI4lKNwAeNx5cR1k+lhaYCdU8QR5Pxt+AxlTTA+H+j718WL
	 3O3Dc6k1Ue5LAuJaqTFYdxGHUeaI6knHhjzfOYk4HEwbhd5IqJj58Kv0HkNw1LmD4R
	 G22lQf68ewCamMXiYwnCH2ROm35x8FOiEfE4jA8QFy2ko/wrb0DXZkLWZ3LgDh5GIw
	 LodzWYtUrIiGw==
Date: Thu, 11 May 2023 12:16:35 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Michael Ellerman <mpe@ellerman.id.au>, PowerPC
 <linuxppc-dev@lists.ozlabs.org>
Subject: linux-next: build warnings in powercp build
Message-ID: <20230511121635.0a6764a0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+9ffUtm.EyILFy5cWQg4miV";
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/+9ffUtm.EyILFy5cWQg4miV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's (and a few before) linux-next build (powerpc pseries_le_defconfig)
produced these warnings:

Building: powerpc pseries_le_defconfig
Using /home/sfr/next/next/arch/powerpc/configs/ppc64_defconfig as base
Merging /home/sfr/next/next/arch/powerpc/configs/le.config
Merging /home/sfr/next/next/arch/powerpc/configs/guest.config
Value of CONFIG_VIRTIO_BLK is redefined by fragment /home/sfr/next/next/arc=
h/powerpc/configs/guest.config:
Previous value: CONFIG_VIRTIO_BLK=3Dm
New value: CONFIG_VIRTIO_BLK=3Dy

Value of CONFIG_SCSI_VIRTIO is redefined by fragment /home/sfr/next/next/ar=
ch/powerpc/configs/guest.config:
Previous value: CONFIG_SCSI_VIRTIO=3Dm
New value: CONFIG_SCSI_VIRTIO=3Dy

Value of CONFIG_VIRTIO_NET is redefined by fragment /home/sfr/next/next/arc=
h/powerpc/configs/guest.config:
Previous value: CONFIG_VIRTIO_NET=3Dm
New value: CONFIG_VIRTIO_NET=3Dy

Value of CONFIG_VIRTIO_CONSOLE is redefined by fragment /home/sfr/next/next=
/arch/powerpc/configs/guest.config:
Previous value: CONFIG_VIRTIO_CONSOLE=3Dm
New value: CONFIG_VIRTIO_CONSOLE=3Dy

Value of CONFIG_VIRTIO_PCI is redefined by fragment /home/sfr/next/next/arc=
h/powerpc/configs/guest.config:
Previous value: CONFIG_VIRTIO_PCI=3Dm
New value: CONFIG_VIRTIO_PCI=3Dy

Value of CONFIG_VIRTIO_BALLOON is redefined by fragment /home/sfr/next/next=
/arch/powerpc/configs/guest.config:
Previous value: CONFIG_VIRTIO_BALLOON=3Dm
New value: CONFIG_VIRTIO_BALLOON=3Dy

Value of CONFIG_VHOST_NET is redefined by fragment /home/sfr/next/next/arch=
/powerpc/configs/guest.config:
Previous value: CONFIG_VHOST_NET=3Dm
New value: CONFIG_VHOST_NET=3Dy

Value of CONFIG_IBMVETH is redefined by fragment /home/sfr/next/next/arch/p=
owerpc/configs/guest.config:
Previous value: CONFIG_IBMVETH=3Dm
New value: CONFIG_IBMVETH=3Dy

Value of CONFIG_IBMVNIC is redefined by fragment /home/sfr/next/next/arch/p=
owerpc/configs/guest.config:
Previous value: CONFIG_IBMVNIC=3Dm
New value: CONFIG_IBMVNIC=3Dy

I am not sure exactly which change(s) introduced these warnings.

--=20
Cheers,
Stephen Rothwell

--Sig_/+9ffUtm.EyILFy5cWQg4miV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmRcUAQACgkQAVBC80lX
0Gy9KQf9GUZWVHlmfc2HT7kK21mwaSSr6gmP/VHH9Y0QK1AYpre6aQZXg3wimnuW
iuZHsQk4Heto0gXX4Co/aqfVGE1HRDCigJL3Wc70xGxyZV0ui+QjV7Lk5j3rQIJK
9/8/hkO1eBeVSwn9eOCepCy3jB+mivWJdGSbdTXWqJZpR0AcBo04OTBJVQBYEyPg
uu8F4mMFzHeuIW9SpsVY3mVrVs1KMG9IrYPwk+lMO+CJ1jIEo8RDDM00VVoKhz7w
+qDwKwOhFbcLFLB2/azEK1XQhiWGgcnhZoEnHOMsnLlDn3qLsSgWTPdIZybSpcz5
5oiwOUZaWWOz/SNx2486RQ1tmIkZhQ==
=dPow
-----END PGP SIGNATURE-----

--Sig_/+9ffUtm.EyILFy5cWQg4miV--
