Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5C542643A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Oct 2021 07:48:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HQcfp6Q6hz2yX8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Oct 2021 16:48:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=XpyXzMin;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HQcfB3xKSz2yHH
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Oct 2021 16:47:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au
 header.a=rsa-sha256 header.s=201702 header.b=XpyXzMin; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HQcf93ct9z4xbR;
 Fri,  8 Oct 2021 16:47:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1633672049;
 bh=U17KFfh/lVCjqArE6dEYZBHZFpmg+ajrOeLK3EhRQQo=;
 h=Date:From:To:Cc:Subject:From;
 b=XpyXzMinRoJbQ97ACLhntFAvRN40RMDjj4zkh1ksJgBg0RBQvfaWSrV5cNMsCpeG0
 cWF1pITleJW4GVSAkVCOL0hkfXD0nMqMXtv8Dxh0YOwXzIljK9mWaz8cJcuLl5BtP/
 c1DTp/u6cXy2tIAnI4qku/RRywMq+3jSbYCPTruikAyt5Q/lDt9Uh8i9QgLbxY8dU3
 so+3dFAAS52v/Hfc6/QB32Y5EFGiiBhIZBOTRrkWpqMj5WJUjyNC5YYys+oLmQOe8V
 DCsm4w2jxyj6z/aVCpQFv8F9GzI5xkH8i3do1Z7/xyvbNImtKH6QeFiVzJiLg1VVSZ
 3FruARCwyKqKg==
Date: Fri, 8 Oct 2021 16:47:28 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Michael Ellerman <mpe@ellerman.id.au>, PowerPC
 <linuxppc-dev@lists.ozlabs.org>
Subject: linux-next: build warnings in Linus' tree
Message-ID: <20211008164728.30e3d3a3@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/lFGGsKOdKiBlptVO7HeVFbX";
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/lFGGsKOdKiBlptVO7HeVFbX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the origin tree, today's linux-next build (powerpc
allyesconfig) produced these warnings (along with many others):

arch/powerpc/boot/dts/mpc5200b.dtsi:267.20-280.4: Warning (pci_bridge): /pc=
i@f0000d00: missing ranges for PCI bridge (or not a bridge)
arch/powerpc/boot/dts/mpc5200b.dtsi:267.20-280.4: Warning (pci_bridge): /pc=
i@f0000d00: missing ranges for PCI bridge (or not a bridge)
arch/powerpc/boot/dts/mpc5200b.dtsi:267.20-280.4: Warning (pci_bridge): /pc=
i@f0000d00: missing ranges for PCI bridge (or not a bridge)
arch/powerpc/boot/dts/mpc5200b.dtsi:267.20-280.4: Warning (pci_bridge): /pc=
i@f0000d00: missing ranges for PCI bridge (or not a bridge)
arch/powerpc/boot/dts/mpc5200b.dtsi:182.18-186.5: Warning (spi_bus_bridge):=
 /soc5200@f0000000/psc@2000: node name for SPI buses should be 'spi'
arch/powerpc/boot/dts/mpc5200b.dtsi:267.20-280.4: Warning (pci_bridge): /pc=
i@f0000d00: missing ranges for PCI bridge (or not a bridge)
arch/powerpc/boot/dts/mpc5200b.dtsi:182.18-186.5: Warning (spi_bus_bridge):=
 /soc5200@f0000000/psc@2000: node name for SPI buses should be 'spi'
arch/powerpc/boot/dts/mpc5200b.dtsi:267.20-280.4: Warning (pci_bridge): /pc=
i@f0000d00: missing ranges for PCI bridge (or not a bridge)
arch/powerpc/boot/dts/mpc5200b.dtsi:182.18-186.5: Warning (spi_bus_bridge):=
 /soc5200@f0000000/psc@2000: node name for SPI buses should be 'spi'
arch/powerpc/boot/dts/mpc5200b.dtsi:267.20-280.4: Warning (pci_bridge): /pc=
i@f0000d00: missing ranges for PCI bridge (or not a bridge)
arch/powerpc/boot/dts/mpc5200b.dtsi:182.18-186.5: Warning (spi_bus_bridge):=
 /soc5200@f0000000/psc@2000: node name for SPI buses should be 'spi'
arch/powerpc/boot/dts/mpc5200b.dtsi:267.20-280.4: Warning (pci_bridge): /pc=
i@f0000d00: missing ranges for PCI bridge (or not a bridge)
arch/powerpc/boot/dts/mpc5200b.dtsi:182.18-186.5: Warning (spi_bus_bridge):=
 /soc5200@f0000000/psc@2000: node name for SPI buses should be 'spi'
arch/powerpc/boot/dts/mpc5200b.dtsi:267.20-280.4: Warning (pci_bridge): /pc=
i@f0000d00: missing ranges for PCI bridge (or not a bridge)
arch/powerpc/boot/dts/mpc5200b.dtsi:182.18-186.5: Warning (spi_bus_bridge):=
 /soc5200@f0000000/psc@2000: node name for SPI buses should be 'spi'
arch/powerpc/boot/dts/mpc5200b.dtsi:267.20-280.4: Warning (pci_bridge): /pc=
i@f0000d00: missing ranges for PCI bridge (or not a bridge)

Given that arch/powerpc/boot/dts/mpc5200b.dtsi is oncluded by several
other dts files, fixing this one file would go quite a long way to
silencing our allyesoncig build.  Unfotunatley, I have no idea how to
fix this file (ad maybe some fo the interactions it has with other files).

--=20
Cheers,
Stephen Rothwell

--Sig_/lFGGsKOdKiBlptVO7HeVFbX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFf23AACgkQAVBC80lX
0GyiaQgAkIu26Mo/xDN8vIDzAja0d9yMJhmH4hbeTVWJInd9127E7rJcqZxMdjQb
G7EC3zBbs/dttnbsfR0cOxxmN0OkyHHxcYfW+MnLesH0M1bCe2Gy5lB10mtEtP9p
L/f2jrPepH6CeyEUkeu7TcKX9Pg20EgPwCqehkl4S9A8E+K3ndSGjLuYfijfQVOx
BJNTUoJCmAQVy0/tQgV0E9/47P962ol1Kd+avV9S0rb/HyY+fKt+WCxTT6anmJpl
cya8MxkQmOzDQMwN1HjFjq/k7aRr8hUWh4ABUCO3Sl/bOGQIZlYYkcbiAmiHFPjp
FpldIPHqYQDS9Hp+0p1w6AzPbeEvZA==
=7yck
-----END PGP SIGNATURE-----

--Sig_/lFGGsKOdKiBlptVO7HeVFbX--
