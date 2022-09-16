Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 651D45BA697
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 08:08:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MTNt11fDWz3bcF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 16:08:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (4096-bit key; unprotected) header.d=nabijaczleweli.xyz header.i=@nabijaczleweli.xyz header.a=rsa-sha256 header.s=202205 header.b=Bh3hgchM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nabijaczleweli.xyz (client-ip=139.28.40.42; helo=tarta.nabijaczleweli.xyz; envelope-from=nabijaczleweli@nabijaczleweli.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (4096-bit key; unprotected) header.d=nabijaczleweli.xyz header.i=@nabijaczleweli.xyz header.a=rsa-sha256 header.s=202205 header.b=Bh3hgchM;
	dkim-atps=neutral
X-Greylist: delayed 543 seconds by postgrey-1.36 at boromir; Fri, 16 Sep 2022 12:04:27 AEST
Received: from tarta.nabijaczleweli.xyz (unknown [139.28.40.42])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MTHSW63pBz302x
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Sep 2022 12:04:27 +1000 (AEST)
Received: from tarta.nabijaczleweli.xyz (unknown [192.168.1.250])
	by tarta.nabijaczleweli.xyz (Postfix) with ESMTPSA id AC81C1622;
	Fri, 16 Sep 2022 03:55:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nabijaczleweli.xyz;
	s=202205; t=1663293319;
	bh=l9k1DbKKiMqSObU43xu0T2mj2fDjr0VeGS9y7PQ8jPg=;
	h=Date:From:Cc:Subject:References:In-Reply-To:From;
	b=Bh3hgchMAnvrp8bHQhJt5ll2yDO/+vXV/PUUx6r4R+oSztvKmgVg6zmhk1reW27iR
	 tGgu+5AArFJ8BMWtNZOBlFN/xKI6UMzevCjKMdwjvUKkADW6jw9LH4TAlxiR1Pr2uC
	 vqIRxtSJpEin6x0ieLy4JnCiuGmZ82z7x8K6c3YkMjRDEIODeYnFELjz/6RsS6uoEO
	 43P2rKBBYFDaIindRFHhwGAgbUcUnD56GjiHI7MQJjEsL0taLBYivPj+e+tfwaRMA6
	 528fQa+lcNqqG2BQCA6SMH47Rna1pl2Pwh0BN4Ep+wLLH0zeqSMPkLsm7JPT9ekkZv
	 cm3IkFBEe3IyX0G3lju5NOUQcuuqrIXM94p8jtRorKVAP3CEXd7M8gjQtHIxTAz48y
	 6dIiMJIdaSxubjwDQFOJ4tZRq3tfCHPbRzAbjiQiijrWN6bJ6BOy1wsCG1TLmpdBWY
	 jxS/9lxv2XJ8v54q4SsOyQKjzfmO4HTM2v6uEx82JZWfbjHna2tAnHPn4DVddx1VeD
	 2sRGDCalWHHcFtdQpZ1qW52POJR8AOg0vMGllLfyfc3F3p4Pv5V9pDZcMIGRJludDO
	 h17KsS2yhrx4PezduKSiPiXkGFjFKoiBm678TNzejofOtgtLHmLgXi9kdQ2jJAyBZS
	 GVIh7rR8oWKmadMT9PLmn7eQ=
Date: Fri, 16 Sep 2022 03:55:18 +0200
From: =?utf-8?B?0L3QsNCx?= <nabijaczleweli@nabijaczleweli.xyz>
Subject: [PATCH 5/5] tty: hvc: remove HVC_IUCV_MAGIC
Message-ID: <8c8a2c9dfc1bfbe6ef3f3237368e483865fc1c29.1663288066.git.nabijaczleweli@nabijaczleweli.xyz>
References: <476d024cd6b04160a5de381ea2b9856b60088cbd.1663288066.git.nabijaczleweli@nabijaczleweli.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rnftti7pthqkpnuy"
Content-Disposition: inline
In-Reply-To: <476d024cd6b04160a5de381ea2b9856b60088cbd.1663288066.git.nabijaczleweli@nabijaczleweli.xyz>
User-Agent: NeoMutt/20220429
X-Mailman-Approved-At: Fri, 16 Sep 2022 16:07:55 +1000
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, Jiri Slaby <jirislaby@kernel.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--rnftti7pthqkpnuy
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

According to Greg, in the context of magic numbers as defined in
magic-number.rst, "the tty layer should not need this and I'll gladly
take patches"

This stretches that definition slightly, since it multiplexes it with
the terminal number as a constant offset, but is equivalent

Ref: https://lore.kernel.org/linux-doc/YyMlovoskUcHLEb7@kroah.com/
Signed-off-by: Ahelenia Ziemia=C5=84ska <nabijaczleweli@nabijaczleweli.xyz>
---
 drivers/tty/hvc/hvc_iucv.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/tty/hvc/hvc_iucv.c b/drivers/tty/hvc/hvc_iucv.c
index 32366caca662..7d49a872de48 100644
--- a/drivers/tty/hvc/hvc_iucv.c
+++ b/drivers/tty/hvc/hvc_iucv.c
@@ -29,7 +29,6 @@
=20
=20
 /* General device driver settings */
-#define HVC_IUCV_MAGIC		0xc9e4c3e5
 #define MAX_HVC_IUCV_LINES	HVC_ALLOC_TTY_ADAPTERS
 #define MEMPOOL_MIN_NR		(PAGE_SIZE / sizeof(struct iucv_tty_buffer)/4)
=20
@@ -131,9 +130,9 @@ static struct iucv_handler hvc_iucv_handler =3D {
  */
 static struct hvc_iucv_private *hvc_iucv_get_private(uint32_t num)
 {
-	if ((num < HVC_IUCV_MAGIC) || (num - HVC_IUCV_MAGIC > hvc_iucv_devices))
+	if (num > hvc_iucv_devices)
 		return NULL;
-	return hvc_iucv_table[num - HVC_IUCV_MAGIC];
+	return hvc_iucv_table[num];
 }
=20
 /**
@@ -1072,8 +1071,8 @@ static int __init hvc_iucv_alloc(int id, unsigned int=
 is_console)
 	priv->is_console =3D is_console;
=20
 	/* allocate hvc device */
-	priv->hvc =3D hvc_alloc(HVC_IUCV_MAGIC + id, /*		  PAGE_SIZE */
-			      HVC_IUCV_MAGIC + id, &hvc_iucv_ops, 256);
+	priv->hvc =3D hvc_alloc(id, /*		 PAGE_SIZE */
+			      id, &hvc_iucv_ops, 256);
 	if (IS_ERR(priv->hvc)) {
 		rc =3D PTR_ERR(priv->hvc);
 		goto out_error_hvc;
@@ -1371,7 +1370,7 @@ static int __init hvc_iucv_init(void)
=20
 	/* register the first terminal device as console
 	 * (must be done before allocating hvc terminal devices) */
-	rc =3D hvc_instantiate(HVC_IUCV_MAGIC, IUCV_HVC_CON_IDX, &hvc_iucv_ops);
+	rc =3D hvc_instantiate(0, IUCV_HVC_CON_IDX, &hvc_iucv_ops);
 	if (rc) {
 		pr_err("Registering HVC terminal device as "
 		       "Linux console failed\n");
--=20
2.30.2

--rnftti7pthqkpnuy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEfWlHToQCjFzAxEFjvP0LAY0mWPEFAmMj14YACgkQvP0LAY0m
WPGDlRAAmOsQ96hFk4wbrrr1tz6fBYeA1H7oPGYFhSIPjx2XstzizMg/6MCaYq6K
wakN5iXs9GFmmpxoX+9MCt7tGbHP5pACaCRb+r/F8wTHFjHe7gAdVuGcVDnhhA1K
6az+jDCnCHSFpimfjACDEbvzkN7io62V1y0NndI7xDOfzIgr11j5OKTHhKY0e5Em
yj/SOQ1yIDoNQHJrx1IYK8x18QhLdK8CZWEiQ/HqlO79jQiM3y/TuT3yVJC9hu2v
gHXLL5bg4M4MwZ9QkKizGcSnFXp3Wg2VwVBsFUdtHAs9df3YOV6CzPlTdGQABcJ4
RJ68qx0W0o0tVy6obQqyZRP1LJTHbt+Dicw1fdAXMgrcXBhEnEOZzWjSA713MEqZ
8uYKPle3Tz6wnf0NluBFKOUq0y5eov/GF1YLBWt8jSwa/5YmixHXz4YigCcZ/+1X
9IMbwiFWXzoDIzO3xwcvHEK/MGMCPgB3a32Fzdx6wwpVVaAm7JKEhDpIMH0zxOor
/2nJ4pwrtQ3fQI8QsUmZ0h1ylgWM+nBnYvucX/QANC+ihVAUN9WXSfz2Mo2RenAr
99PAehuHK5wCWApyjgWrJi/8fvzAavjRuCj2sPK5X/HBXIn5gm5q6yClU1BD/0z7
YjS8CTHUf+eAnvpC8zzY8NpBJJ2C48sBpY/7Kj09Nqbvlc+J1EY=
=xgyf
-----END PGP SIGNATURE-----

--rnftti7pthqkpnuy--
