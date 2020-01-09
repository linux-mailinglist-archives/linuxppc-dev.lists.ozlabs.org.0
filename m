Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0E41353C9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jan 2020 08:40:54 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47tdMR4VRrzDqZB
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jan 2020 18:40:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47tdKc2Z9CzDqWb
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jan 2020 18:39:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au
 header.a=rsa-sha256 header.s=201702 header.b=Apk3yLiO; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 47tdKZ2HD0z9sR0;
 Thu,  9 Jan 2020 18:39:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1578555554;
 bh=jQgCe2rWBbz1wWmLtYGxjDB1NY2hlasRFcbCGn/Bpwc=;
 h=Date:From:To:Cc:Subject:From;
 b=Apk3yLiOHhagAosAcbu/QPJFVEzyur/oJLN0AvcMjY+f3WTbyNEjatBc9k1YIuaW+
 bT5ESFkNPAnOUwZxJem4rX/YL1VP7waiKQwpXyB4ZiNdlsz2JGaLSTPHIww6wfxKp+
 aT8LmzqJS9r/rvDBTNSCXFaYK7KlXD+uuen6KY5vhlTnwFfZmJgA7DOR7snfkxxoO7
 xWc5GazEjiIT4RtarstY3a41go4ZGuKG8iiExItsIWMr6ZgmBiE08M9/wE/S4Z90S0
 OAdEWCg8lL5U4KAviqT6JavE90m52e2gamnpo/3qgDvcC2GbezBnQOEcLQXx+dcHl1
 zsmHsemRtPvsA==
Date: Thu, 9 Jan 2020 18:39:12 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jslaby@suse.com>
Subject: [PATCH] evh_bytechan: fix out of bounds accesses
Message-ID: <20200109183912.5fcb52aa@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/XLS5ab7Fy6TmB.haLEdrQGG";
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
Cc: PowerPC Mailing List <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/XLS5ab7Fy6TmB.haLEdrQGG
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

ev_byte_channel_send() assumes that its third argument is a 16 byte array.
Some places where it is called it may not be (or we can't easily tell
if it is).  Newer compilers have started producing warnings about this,
so make sure we actually pass a 16 byte array.

There may be more elegant solutions to this, but the driver is quite
old and hasn't been updated in many years.

The warnings (from a powerpc allyesconfig build) are:

In file included from include/linux/byteorder/big_endian.h:5,
                 from arch/powerpc/include/uapi/asm/byteorder.h:14,
                 from include/asm-generic/bitops/le.h:6,
                 from arch/powerpc/include/asm/bitops.h:250,
                 from include/linux/bitops.h:29,
                 from include/linux/kernel.h:12,
                 from include/asm-generic/bug.h:19,
                 from arch/powerpc/include/asm/bug.h:109,
                 from include/linux/bug.h:5,
                 from include/linux/mmdebug.h:5,
                 from include/linux/gfp.h:5,
                 from include/linux/slab.h:15,
                 from drivers/tty/ehv_bytechan.c:24:
drivers/tty/ehv_bytechan.c: In function =E2=80=98ehv_bc_udbg_putc=E2=80=99:
arch/powerpc/include/asm/epapr_hcalls.h:298:20: warning: array subscript 1 =
is outside array bounds of =E2=80=98const char[1]=E2=80=99 [-Warray-bounds]
  298 |  r6 =3D be32_to_cpu(p[1]);
include/uapi/linux/byteorder/big_endian.h:40:51: note: in definition of mac=
ro =E2=80=98__be32_to_cpu=E2=80=99
   40 | #define __be32_to_cpu(x) ((__force __u32)(__be32)(x))
      |                                                   ^
arch/powerpc/include/asm/epapr_hcalls.h:298:7: note: in expansion of macro =
=E2=80=98be32_to_cpu=E2=80=99
  298 |  r6 =3D be32_to_cpu(p[1]);
      |       ^~~~~~~~~~~
drivers/tty/ehv_bytechan.c:166:13: note: while referencing =E2=80=98data=E2=
=80=99
  166 | static void ehv_bc_udbg_putc(char c)
      |             ^~~~~~~~~~~~~~~~
In file included from include/linux/byteorder/big_endian.h:5,
                 from arch/powerpc/include/uapi/asm/byteorder.h:14,
                 from include/asm-generic/bitops/le.h:6,
                 from arch/powerpc/include/asm/bitops.h:250,
                 from include/linux/bitops.h:29,
                 from include/linux/kernel.h:12,
                 from include/asm-generic/bug.h:19,
                 from arch/powerpc/include/asm/bug.h:109,
                 from include/linux/bug.h:5,
                 from include/linux/mmdebug.h:5,
                 from include/linux/gfp.h:5,
                 from include/linux/slab.h:15,
                 from drivers/tty/ehv_bytechan.c:24:
arch/powerpc/include/asm/epapr_hcalls.h:299:20: warning: array subscript 2 =
is outside array bounds of =E2=80=98const char[1]=E2=80=99 [-Warray-bounds]
  299 |  r7 =3D be32_to_cpu(p[2]);
include/uapi/linux/byteorder/big_endian.h:40:51: note: in definition of mac=
ro =E2=80=98__be32_to_cpu=E2=80=99
   40 | #define __be32_to_cpu(x) ((__force __u32)(__be32)(x))
      |                                                   ^
arch/powerpc/include/asm/epapr_hcalls.h:299:7: note: in expansion of macro =
=E2=80=98be32_to_cpu=E2=80=99
  299 |  r7 =3D be32_to_cpu(p[2]);
      |       ^~~~~~~~~~~
drivers/tty/ehv_bytechan.c:166:13: note: while referencing =E2=80=98data=E2=
=80=99
  166 | static void ehv_bc_udbg_putc(char c)
      |             ^~~~~~~~~~~~~~~~
In file included from include/linux/byteorder/big_endian.h:5,
                 from arch/powerpc/include/uapi/asm/byteorder.h:14,
                 from include/asm-generic/bitops/le.h:6,
                 from arch/powerpc/include/asm/bitops.h:250,
                 from include/linux/bitops.h:29,
                 from include/linux/kernel.h:12,
                 from include/asm-generic/bug.h:19,
                 from arch/powerpc/include/asm/bug.h:109,
                 from include/linux/bug.h:5,
                 from include/linux/mmdebug.h:5,
                 from include/linux/gfp.h:5,
                 from include/linux/slab.h:15,
                 from drivers/tty/ehv_bytechan.c:24:
arch/powerpc/include/asm/epapr_hcalls.h:300:20: warning: array subscript 3 =
is outside array bounds of =E2=80=98const char[1]=E2=80=99 [-Warray-bounds]
  300 |  r8 =3D be32_to_cpu(p[3]);
include/uapi/linux/byteorder/big_endian.h:40:51: note: in definition of mac=
ro =E2=80=98__be32_to_cpu=E2=80=99
   40 | #define __be32_to_cpu(x) ((__force __u32)(__be32)(x))
      |                                                   ^
arch/powerpc/include/asm/epapr_hcalls.h:300:7: note: in expansion of macro =
=E2=80=98be32_to_cpu=E2=80=99
  300 |  r8 =3D be32_to_cpu(p[3]);
      |       ^~~~~~~~~~~
drivers/tty/ehv_bytechan.c:166:13: note: while referencing =E2=80=98data=E2=
=80=99
  166 | static void ehv_bc_udbg_putc(char c)
      |             ^~~~~~~~~~~~~~~~
In file included from include/linux/byteorder/big_endian.h:5,
                 from arch/powerpc/include/uapi/asm/byteorder.h:14,
                 from include/asm-generic/bitops/le.h:6,
                 from arch/powerpc/include/asm/bitops.h:250,
                 from include/linux/bitops.h:29,
                 from include/linux/kernel.h:12,
                 from include/asm-generic/bug.h:19,
                 from arch/powerpc/include/asm/bug.h:109,
                 from include/linux/bug.h:5,
                 from include/linux/mmdebug.h:5,
                 from include/linux/gfp.h:5,
                 from include/linux/slab.h:15,
                 from drivers/tty/ehv_bytechan.c:24:
arch/powerpc/include/asm/epapr_hcalls.h:298:20: warning: array subscript 1 =
is outside array bounds of =E2=80=98const char[1]=E2=80=99 [-Warray-bounds]
  298 |  r6 =3D be32_to_cpu(p[1]);
include/uapi/linux/byteorder/big_endian.h:40:51: note: in definition of mac=
ro =E2=80=98__be32_to_cpu=E2=80=99
   40 | #define __be32_to_cpu(x) ((__force __u32)(__be32)(x))
      |                                                   ^
arch/powerpc/include/asm/epapr_hcalls.h:298:7: note: in expansion of macro =
=E2=80=98be32_to_cpu=E2=80=99
  298 |  r6 =3D be32_to_cpu(p[1]);
      |       ^~~~~~~~~~~
drivers/tty/ehv_bytechan.c:166:13: note: while referencing =E2=80=98data=E2=
=80=99
  166 | static void ehv_bc_udbg_putc(char c)
      |             ^~~~~~~~~~~~~~~~
In file included from include/linux/byteorder/big_endian.h:5,
                 from arch/powerpc/include/uapi/asm/byteorder.h:14,
                 from include/asm-generic/bitops/le.h:6,
                 from arch/powerpc/include/asm/bitops.h:250,
                 from include/linux/bitops.h:29,
                 from include/linux/kernel.h:12,
                 from include/asm-generic/bug.h:19,
                 from arch/powerpc/include/asm/bug.h:109,
                 from include/linux/bug.h:5,
                 from include/linux/mmdebug.h:5,
                 from include/linux/gfp.h:5,
                 from include/linux/slab.h:15,
                 from drivers/tty/ehv_bytechan.c:24:
arch/powerpc/include/asm/epapr_hcalls.h:299:20: warning: array subscript 2 =
is outside array bounds of =E2=80=98const char[1]=E2=80=99 [-Warray-bounds]
  299 |  r7 =3D be32_to_cpu(p[2]);
include/uapi/linux/byteorder/big_endian.h:40:51: note: in definition of mac=
ro =E2=80=98__be32_to_cpu=E2=80=99
   40 | #define __be32_to_cpu(x) ((__force __u32)(__be32)(x))
      |                                                   ^
arch/powerpc/include/asm/epapr_hcalls.h:299:7: note: in expansion of macro =
=E2=80=98be32_to_cpu=E2=80=99
  299 |  r7 =3D be32_to_cpu(p[2]);
      |       ^~~~~~~~~~~
drivers/tty/ehv_bytechan.c:166:13: note: while referencing =E2=80=98data=E2=
=80=99
  166 | static void ehv_bc_udbg_putc(char c)
      |             ^~~~~~~~~~~~~~~~
In file included from include/linux/byteorder/big_endian.h:5,
                 from arch/powerpc/include/uapi/asm/byteorder.h:14,
                 from include/asm-generic/bitops/le.h:6,
                 from arch/powerpc/include/asm/bitops.h:250,
                 from include/linux/bitops.h:29,
                 from include/linux/kernel.h:12,
                 from include/asm-generic/bug.h:19,
                 from arch/powerpc/include/asm/bug.h:109,
                 from include/linux/bug.h:5,
                 from include/linux/mmdebug.h:5,
                 from include/linux/gfp.h:5,
                 from include/linux/slab.h:15,
                 from drivers/tty/ehv_bytechan.c:24:
arch/powerpc/include/asm/epapr_hcalls.h:300:20: warning: array subscript 3 =
is outside array bounds of =E2=80=98const char[1]=E2=80=99 [-Warray-bounds]
  300 |  r8 =3D be32_to_cpu(p[3]);
include/uapi/linux/byteorder/big_endian.h:40:51: note: in definition of mac=
ro =E2=80=98__be32_to_cpu=E2=80=99
   40 | #define __be32_to_cpu(x) ((__force __u32)(__be32)(x))
      |                                                   ^
arch/powerpc/include/asm/epapr_hcalls.h:300:7: note: in expansion of macro =
=E2=80=98be32_to_cpu=E2=80=99
  300 |  r8 =3D be32_to_cpu(p[3]);
      |       ^~~~~~~~~~~
drivers/tty/ehv_bytechan.c:166:13: note: while referencing =E2=80=98data=E2=
=80=99
  166 | static void ehv_bc_udbg_putc(char c)
      |             ^~~~~~~~~~~~~~~~

Fixes: dcd83aaff1c8 ("tty/powerpc: introduce the ePAPR embedded hypervisor =
byte channel driver")
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: PowerPC Mailing List <linuxppc-dev@lists.ozlabs.org>
Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/tty/ehv_bytechan.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

I have only build tested this change so it would be good to get some
response from the PowerPC maintainers/developers.

diff --git a/drivers/tty/ehv_bytechan.c b/drivers/tty/ehv_bytechan.c
index 769e0a5d1dfc..546f80c49ae6 100644
--- a/drivers/tty/ehv_bytechan.c
+++ b/drivers/tty/ehv_bytechan.c
@@ -136,6 +136,20 @@ static int find_console_handle(void)
 	return 1;
 }
=20
+static unsigned int local_ev_byte_channel_send(unsigned int handle,
+        unsigned int *count, const char *p)
+{
+	char buffer[EV_BYTE_CHANNEL_MAX_BYTES];
+	unsigned int c =3D *count;
+
+	if (c < sizeof(buffer)) {
+		memcpy(buffer, p, c);
+		memset(&buffer[c], 0, sizeof(buffer) - c);
+		p =3D buffer;
+	}
+	return ev_byte_channel_send(handle, count, p);
+}
+
 /*************************** EARLY CONSOLE DRIVER ************************=
***/
=20
 #ifdef CONFIG_PPC_EARLY_DEBUG_EHV_BC
@@ -154,7 +168,7 @@ static void byte_channel_spin_send(const char data)
=20
 	do {
 		count =3D 1;
-		ret =3D ev_byte_channel_send(CONFIG_PPC_EARLY_DEBUG_EHV_BC_HANDLE,
+		ret =3D local_ev_byte_channel_send(CONFIG_PPC_EARLY_DEBUG_EHV_BC_HANDLE,
 					   &count, &data);
 	} while (ret =3D=3D EV_EAGAIN);
 }
@@ -221,7 +235,7 @@ static int ehv_bc_console_byte_channel_send(unsigned in=
t handle, const char *s,
 	while (count) {
 		len =3D min_t(unsigned int, count, EV_BYTE_CHANNEL_MAX_BYTES);
 		do {
-			ret =3D ev_byte_channel_send(handle, &len, s);
+			ret =3D local_ev_byte_channel_send(handle, &len, s);
 		} while (ret =3D=3D EV_EAGAIN);
 		count -=3D len;
 		s +=3D len;
@@ -401,7 +415,7 @@ static void ehv_bc_tx_dequeue(struct ehv_bc_data *bc)
 			    CIRC_CNT_TO_END(bc->head, bc->tail, BUF_SIZE),
 			    EV_BYTE_CHANNEL_MAX_BYTES);
=20
-		ret =3D ev_byte_channel_send(bc->handle, &len, bc->buf + bc->tail);
+		ret =3D local_ev_byte_channel_send(bc->handle, &len, bc->buf + bc->tail);
=20
 		/* 'len' is valid only if the return code is 0 or EV_EAGAIN */
 		if (!ret || (ret =3D=3D EV_EAGAIN))
--=20
2.25.0.rc1

--=20
Cheers,
Stephen Rothwell

--Sig_/XLS5ab7Fy6TmB.haLEdrQGG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4W2KAACgkQAVBC80lX
0Gz5Mgf6AiMzkgvfydhGuagTpNGUz7a+IzOualfEfSpm0SahxEJf23BxO8iYV3oF
M13LQfDXL/g3EWjMC46xH/eUlFOIQhvSO+JLdEG8+695B0mTZhrrvpi1EwTOIyBt
n/Kq+Xez34A8gIfBJpWssZfe/xg1GVoDcY1veZPqcOh9Pu2OP4MmmctQ53K8+Y0d
ixV3L4+5HXRtxkH8UQjtzTHfO/UB8kHnmKh1/noapepA2xh9t4stwhzwsxO7GCgv
vMpSnzHMwY6tWw6dY34Pi9cSNWEFz4wXaWN3Ts44Vbf6JZxnrg07l4ux8iv6oLbe
lK7/QEOKky0QF0hHyLN30XPw0DQSfQ==
=pkuX
-----END PGP SIGNATURE-----

--Sig_/XLS5ab7Fy6TmB.haLEdrQGG--
