Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C827B97D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2019 08:09:33 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45z30p1jpBzDqS1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2019 16:09:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45z2wr0bMbzDqWj
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jul 2019 16:06:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au
 header.b="ULZcEMP1"; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45z2wk3Zllz9sBF;
 Wed, 31 Jul 2019 16:05:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1564553158;
 bh=G789WvqxZoZpdQOOwYke+JrWvQfQevv9ZWAFnS+sSZA=;
 h=Date:From:To:Cc:Subject:From;
 b=ULZcEMP1hbsL5PEMQRd9ipkccZJUqRzkZp64i6ZQ5vtXe2QcvKUtekLFQPvAolbo9
 oJvGVBUic1MX6EU2caJ4j9lymGFyd9dAcu+3zr64qlojxOe+0uTj4dVyzsAKC7LZ5p
 DLwhp+HJS6GxDvZUOMzIlII0ZqBkf9wB/M1WYj66OIilpxUxip10vbZrXrK5Ld4RS/
 myT81Db2yteC5mvo+gSefQYdNh1Q7ZLNrqY93qw8gt//QKVreCMM7g8DL3u/BhFxWd
 Gd2Rrq1lFAWoD36Kg18Iqp3GJ2ejlNRwNA/AQKJz3bxsRuKhy3fOHXFtuFeeSVjo9p
 bOhNMiTTv6mOQ==
Date: Wed, 31 Jul 2019 16:05:57 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: xilinx_uartps.c: suppress "may be used uninitialised" warning
Message-ID: <20190731160557.6a09c3e1@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/oMq6rKwzq4yIYumawKzTc/R";
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
Cc: Michal Simek <michal.simek@xilinx.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Serial List <linux-serial@vger.kernel.org>, Jiri Slaby <jslaby@suse.com>,
 Linux PPC Development List <linuxppc-dev@lists.ozlabs.org>,
 Linus ARM List <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/oMq6rKwzq4yIYumawKzTc/R
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

=46rom 31753a44c62c4fdf6e8a72994ae6861dbde49c11 Mon Sep 17 00:00:00 2001
From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 31 Jul 2019 16:00:52 +1000
Subject: [PATCH] xilinx_uartps.c: suppress "may be used uninitialised" warn=
ing

A powerpc allyesconfig build produces this warning:

In file included from include/linux/radix-tree.h:16,
                 from include/linux/idr.h:15,
                 from include/linux/kernfs.h:13,
                 from include/linux/sysfs.h:16,
                 from include/linux/kobject.h:20,
                 from include/linux/device.h:16,
                 from include/linux/platform_device.h:13,
                 from drivers/tty/serial/xilinx_uartps.c:16:
drivers/tty/serial/xilinx_uartps.c: In function 'cdns_uart_console_write':
include/linux/spinlock.h:288:3: warning: 'flags' may be used uninitialized =
in this function [-Wmaybe-uninitialized]
   _raw_spin_unlock_irqrestore(lock, flags); \
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/tty/serial/xilinx_uartps.c:1197:16: note: 'flags' was declared here
  unsigned long flags;
                ^~~~~

It looks like gcc just can't track the relationship between "locked"
and "flags", and it is obvious that "flags" won't be used when "locked"
is zero, so the simplest thing is to initialise flags.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jslaby@suse.com>
Cc: Michal Simek <michal.simek@xilinx.com>
Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/tty/serial/xilinx_uartps.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

This has been like this for a very long time, but this is now one of
the few remaining warnings produced by the powerpc allyesconfig build,
so it would be good to get rid of it.

diff --git a/drivers/tty/serial/xilinx_uartps.c b/drivers/tty/serial/xilinx=
_uartps.c
index f145946f659b..da4563aaaf5c 100644
--- a/drivers/tty/serial/xilinx_uartps.c
+++ b/drivers/tty/serial/xilinx_uartps.c
@@ -1194,7 +1194,7 @@ static void cdns_uart_console_write(struct console *c=
o, const char *s,
 				unsigned int count)
 {
 	struct uart_port *port =3D console_port;
-	unsigned long flags;
+	unsigned long flags =3D 0;
 	unsigned int imr, ctrl;
 	int locked =3D 1;
=20
--=20
2.22.0

--=20
Cheers,
Stephen Rothwell

--Sig_/oMq6rKwzq4yIYumawKzTc/R
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1BL8UACgkQAVBC80lX
0Gx3MAf+NgUfGWvdNoyBkiRwgAqA7uddSSYmPi/mZ/JfJp7uN+yVTM4AAaDJmkaI
lu52irRBVHp6J20zZjIrF0Nm1taHmDxNoyJacpkM1Za5klHa8DOxvLx01xLUGd7G
91gq2/j2oJYC+pJ3CBkRgt9Vj5GpOwiH+Sirmt71H+Hyno3pyQhQKasUXByHiMtr
RHLewYnj6OgEiU7aVh1Zy+w4JBpnycEETfeONFrI/WWDBsMupTBgeyhqilPsTh9C
hqZx4uJmKwmVsuxOc8We0+HTNCGPEbDV6GrX4hHCzn0EguoAyMjKNOCY11ZSy6SV
esnxLc4sHMDqCMAE4EWD5niCLtNxuQ==
=M6BN
-----END PGP SIGNATURE-----

--Sig_/oMq6rKwzq4yIYumawKzTc/R--
