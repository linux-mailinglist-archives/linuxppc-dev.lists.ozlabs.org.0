Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 140D513A101
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jan 2020 07:33:44 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47xgdd3KYzzDqNS
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jan 2020 17:33:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47xgbL6FYKzDqM0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jan 2020 17:31:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au
 header.a=rsa-sha256 header.s=201702 header.b=GAZYQ3pg; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 47xgbK6LyTz9sP6;
 Tue, 14 Jan 2020 17:31:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1578983502;
 bh=iSHSSp1W1tl9xL4TF8w66KgCiV1RMJ0sHjys58fUdbw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=GAZYQ3pggx/lILYvbwPwEFfrlXeob910UesRSoLyBUlDwkH5fN6f8rHHjjpabal2B
 s7VUarLDRgF1s7vKGYy8fNshS6I8z7PIH7aAyfn6Wg/hiyeuDd00dp+1eh2eA4j9FK
 XEUIKkwRCUbcVn553/fJF9NYY6qe+c7hwPzUEHdjeqmj9B719T+DxqPkjyBSoUdlLI
 k4uIY5d5yL/1v+o/j/gYkT4XJFNYsoo9KTla50u1M5T5dIt22k1xyoAtloDs+7wP7A
 CKgBS5VkO2Vl58302UVx8ivc7T/XeU8/NpX4PTUEjTMag1XALhBirl7th8UDfr3ItX
 PkplkTpq0K9Nw==
Date: Tue, 14 Jan 2020 17:31:41 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Timur Tabi <timur@kernel.org>
Subject: Re: [PATCH] evh_bytechan: fix out of bounds accesses
Message-ID: <20200114173141.29564b25@canb.auug.org.au>
In-Reply-To: <6ec4bc30-0526-672c-4261-3ad2cf69dd94@kernel.org>
References: <20200109183912.5fcb52aa@canb.auug.org.au>
 <CAOZdJXXiKgz=hOoiaTrxgbnwzyvp1Zfn3aCz+0__i17vyFngRg@mail.gmail.com>
 <20200114072522.3cd57195@canb.auug.org.au>
 <6ec4bc30-0526-672c-4261-3ad2cf69dd94@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/UV1aQUgnPYyDpw0s2uSEumD";
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
Cc: b08248@gmail.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jslaby@suse.com>, york sun <york.sun@nxp.com>,
 PowerPC Mailing List <linuxppc-dev@lists.ozlabs.org>, swood@redhat.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/UV1aQUgnPYyDpw0s2uSEumD
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Timur,

On Mon, 13 Jan 2020 19:10:11 -0600 Timur Tabi <timur@kernel.org> wrote:
>
> On 1/13/20 2:25 PM, Stephen Rothwell wrote:
> > The problem is not really the declaration, the problem is that
> > ev_byte_channel_send always accesses 16 bytes from the buffer and it is
> > not always passed a buffer that long (in one case it is passed a
> > pointer to a single byte).  So the alternative to the memcpy approach I
> > have take is to complicate ev_byte_channel_send so that only accesses
> > count bytes from the buffer. =20
>=20
> Ah, I see now.  This is all coming back to me.
>=20
> I would prefer that ev_byte_channel_send() is updated to access only=20
> 'count' bytes.  If that means adding a memcpy to the=20
> ev_byte_channel_send() itself, then so be it.  Trying to figure out how=20
> to stuff n bytes into 4 32-bit registers is probably not worth the effort.

Like this (I have compile tested this):

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 9 Jan 2020 18:23:48 +1100
Subject: [PATCH v2] evh_bytechan: fix out of bounds accesses

ev_byte_channel_send() assumes that its third argument is a 16 byte array.
Some places where it is called it may not be (or we can't easily tell
if it is).  Newer compilers have started producing warnings about this,
so copy the bytes to send into a local array if the passed length is
to short.

Since all the calls of ev_byte_channel_send() are in one file, lets move
it there from the header file and let the compiler decide if it wants
to inline it.

The warnings are:

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

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/powerpc/include/asm/epapr_hcalls.h | 42 ----------------------
 drivers/tty/ehv_bytechan.c              | 48 +++++++++++++++++++++++++
 2 files changed, 48 insertions(+), 42 deletions(-)

diff --git a/arch/powerpc/include/asm/epapr_hcalls.h b/arch/powerpc/include=
/asm/epapr_hcalls.h
index d3a7e36f1402..75c5943c9f85 100644
--- a/arch/powerpc/include/asm/epapr_hcalls.h
+++ b/arch/powerpc/include/asm/epapr_hcalls.h
@@ -268,48 +268,6 @@ static inline unsigned int ev_int_eoi(unsigned int int=
errupt)
 	return r3;
 }
=20
-/**
- * ev_byte_channel_send - send characters to a byte stream
- * @handle: byte stream handle
- * @count: (input) num of chars to send, (output) num chars sent
- * @buffer: pointer to a 16-byte buffer
- *
- * @buffer must be at least 16 bytes long, because all 16 bytes will be
- * read from memory into registers, even if count < 16.
- *
- * Returns 0 for success, or an error code.
- */
-static inline unsigned int ev_byte_channel_send(unsigned int handle,
-	unsigned int *count, const char buffer[EV_BYTE_CHANNEL_MAX_BYTES])
-{
-	register uintptr_t r11 __asm__("r11");
-	register uintptr_t r3 __asm__("r3");
-	register uintptr_t r4 __asm__("r4");
-	register uintptr_t r5 __asm__("r5");
-	register uintptr_t r6 __asm__("r6");
-	register uintptr_t r7 __asm__("r7");
-	register uintptr_t r8 __asm__("r8");
-	const uint32_t *p =3D (const uint32_t *) buffer;
-
-	r11 =3D EV_HCALL_TOKEN(EV_BYTE_CHANNEL_SEND);
-	r3 =3D handle;
-	r4 =3D *count;
-	r5 =3D be32_to_cpu(p[0]);
-	r6 =3D be32_to_cpu(p[1]);
-	r7 =3D be32_to_cpu(p[2]);
-	r8 =3D be32_to_cpu(p[3]);
-
-	asm volatile("bl	epapr_hypercall_start"
-		: "+r" (r11), "+r" (r3),
-		  "+r" (r4), "+r" (r5), "+r" (r6), "+r" (r7), "+r" (r8)
-		: : EV_HCALL_CLOBBERS6
-	);
-
-	*count =3D r4;
-
-	return r3;
-}
-
 /**
  * ev_byte_channel_receive - fetch characters from a byte channel
  * @handle: byte channel handle
diff --git a/drivers/tty/ehv_bytechan.c b/drivers/tty/ehv_bytechan.c
index 769e0a5d1dfc..a5512745d0f9 100644
--- a/drivers/tty/ehv_bytechan.c
+++ b/drivers/tty/ehv_bytechan.c
@@ -136,6 +136,54 @@ static int find_console_handle(void)
 	return 1;
 }
=20
+/**
+ * ev_byte_channel_send - send characters to a byte stream
+ * @handle: byte stream handle
+ * @count: (input) num of chars to send, (output) num chars sent
+ * @bp: pointer to chars to send
+ *
+ * Returns 0 for success, or an error code.
+ */
+static unsigned int ev_byte_channel_send(unsigned int handle,
+	unsigned int *count, const char *bp)
+{
+	register uintptr_t r11 __asm__("r11");
+	register uintptr_t r3 __asm__("r3");
+	register uintptr_t r4 __asm__("r4");
+	register uintptr_t r5 __asm__("r5");
+	register uintptr_t r6 __asm__("r6");
+	register uintptr_t r7 __asm__("r7");
+	register uintptr_t r8 __asm__("r8");
+	const uint32_t *p;
+	char buffer[EV_BYTE_CHANNEL_MAX_BYTES];
+	unsigned int c =3D *count;
+
+	if (c < sizeof(buffer)) {
+		memcpy(buffer, bp, c);
+		memset(&buffer[c], 0, sizeof(buffer) - c);
+		p =3D (const uint32_t *)buffer;
+	} else {
+		p =3D (const uint32_t *)bp;
+	}
+	r11 =3D EV_HCALL_TOKEN(EV_BYTE_CHANNEL_SEND);
+	r3 =3D handle;
+	r4 =3D *count;
+	r5 =3D be32_to_cpu(p[0]);
+	r6 =3D be32_to_cpu(p[1]);
+	r7 =3D be32_to_cpu(p[2]);
+	r8 =3D be32_to_cpu(p[3]);
+
+	asm volatile("bl	epapr_hypercall_start"
+		: "+r" (r11), "+r" (r3),
+		  "+r" (r4), "+r" (r5), "+r" (r6), "+r" (r7), "+r" (r8)
+		: : EV_HCALL_CLOBBERS6
+	);
+
+	*count =3D r4;
+
+	return r3;
+}
+
 /*************************** EARLY CONSOLE DRIVER ************************=
***/
=20
 #ifdef CONFIG_PPC_EARLY_DEBUG_EHV_BC
--=20
2.25.0.rc2

--=20
Cheers,
Stephen Rothwell

--Sig_/UV1aQUgnPYyDpw0s2uSEumD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4dYE0ACgkQAVBC80lX
0Gw5Vwf+LZ/bXdm3lKLH4g7lqkmzw4yqyEl2j0xTTme/xhXCntsKJ77vydzko6MQ
10/qp92M7vKtVAgJI0MutthbBN3nTq8YvafPq9FrRx5UKJOISqM0QHHda+p0T3J/
+wkcmnXu85eURpJoh0pemkNNzTljYoJW4h9K1Ff1yJ9Qlt0Nv1z3ELVj4jHuS/g3
3HB6Zyy8lQ7k5g2W6uizh6ajkuI+IwqSz2piWuhfPaTRcnDMofKuhMUd9xXV0ZN4
Lh8h1SfcTMVcp/r/OEjUjGR+Cf7TpZYoDidEgLyZn9QLYhfEkFrCVYSoov9NSNSq
s6kY1eTlhh2tnKJVKukjFlAfhSIQGA==
=frXf
-----END PGP SIGNATURE-----

--Sig_/UV1aQUgnPYyDpw0s2uSEumD--
