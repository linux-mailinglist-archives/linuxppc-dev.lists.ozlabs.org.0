Return-Path: <linuxppc-dev+bounces-1757-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC35898FA1E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Oct 2024 00:53:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XKRmJ5JtLz3bb2;
	Fri,  4 Oct 2024 08:53:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.72.192.78
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727982977;
	cv=none; b=KXraYxwDAL7XxQOmXdnR+wmSKyIzbPLc/GpHMQW25RaOTKsTDDso29a7SShAqSrmLoOi7Lgw5f+Wst3CbI8CqoU/xn5AAB7v5VKK5GcZQOROcKF44X1gWr6ufMZUNXJj0UJxo1cxZi7Ty3QbO9eAhfgCAP6qluSiUhorsW/jJ5umR7RX+EqSJM7HYAQy3ELtysTdoHBZlm7QPuH/xzjM1HzfYxDu/gY+DmKSUL93RtUvQyqJONx25s8I2HYnq7kTwWJya8AoCYjFpp1edkIrnmSm3OLW4V2mCqZhSOBns6sfKHLwoiPeJFFApSuFo3c14tYl3/dRACFnF/zwwIwcAA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727982977; c=relaxed/relaxed;
	bh=AaP0qWhGGgqVyRMzRZmYOxh81E6npbjdyrfjXu/1pB8=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=jkY0O54SZk4nWaLoC8w/rAg2BBwJWvbsZVyYLaEGgYmVnqU1bu7v+LwZSyQkGyQ1Lz5N7rVIdH+k+yr024XLP49gPUmhuOWsEgQfFzLA5JKlv17J52wJSDEDalqkHOMZEhP7Cgt/D84GqhHD7kdU2Xslrf+fVZTZ6UTc5kXNuVnQqSIE6CpSWE7svIyB+klUilYOaqpWXGWyt7W91guVXEvjVvNLeG9tSEkW20y5yKSxnD51dFVreVP9F9XusCTHgo29At9T6svsjT1dHpb91CSTH5J6ajxWZk4QeNOJl0atm9tjl2N12ee+xw3Bwie0FCiOneOZgGpwr/MymbleOw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=SJ2Pq8Z7; dkim-atps=neutral; spf=pass (client-ip=217.72.192.78; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org) smtp.mailfrom=web.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=SJ2Pq8Z7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=web.de (client-ip=217.72.192.78; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org)
Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XKLxn3Xy8z2xxp
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Oct 2024 05:16:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1727982947; x=1728587747; i=markus.elfring@web.de;
	bh=AaP0qWhGGgqVyRMzRZmYOxh81E6npbjdyrfjXu/1pB8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=SJ2Pq8Z76afHD93q40L/p58/ED5FLkoHuS4k3BYHQt2ASJlB+8pP3rDAD+yQDGJP
	 mgmvPnv4yD/hwzhSvDjYRFOJBeWdw0RMsowfiCUA6rB3WtP/hguqQqZmtN1hfVMQC
	 1+rTVi8/e6+5wvyFA/s9IQcGXn+xmGC33aQx2Vny3Ql2O5ejDOJM7QbSelIDv4ZX7
	 YP/vY9HyKc78IbNRWj95jWEsc7FdpH3pSwLnh1tKoZmdxSoffxEPbQOW2WNM+OCsU
	 6wJUirOZ/BR2FJoYwETQkKhTYJ573VCD+HB1C0bh3vJgve7HXDY4IKd1cUYDtjjdi
	 Nt6jbjmGZMkJpA1cMw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.87.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Mmhjw-1sCcQ11fOw-00kOTx; Thu, 03
 Oct 2024 21:15:47 +0200
Message-ID: <189b93e2-4e81-438d-9c77-cbe4d9d7a0d9@web.de>
Date: Thu, 3 Oct 2024 21:15:45 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linuxppc-dev@lists.ozlabs.org,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Johannes Berg <johannes@sipsolutions.net>,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>
Content-Language: en-GB
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] macintosh: Use common error handling code in
 via_pmu_led_init()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:xF2I4rW6AIKfWOc/S3lQWWNGf0PtzYaiK1MvvYtpD8mYytLpCm7
 OMzdbD/ZVw8qOeweyX6aLZ0/oOH1BX9xPTfu9SZVnieWGUGzXfqpyPvsGr8Gz1/sC71P4/J
 eMnn9EFTJ7HB1FXqVjPIXLVgfYVJKO948lmgZpxa8uinsbzNNV1NMe1T932S+gedPxEGWpu
 WkLgPXkiCx9LxlpqECP5w==
UI-OutboundReport: notjunk:1;M01:P0:Q9w2VK3Frdg=;TCpeb/UB/P4yquJ0czLNBRasXX3
 C6QTxf007WG66fhad2u5iiJUsp81HPEDTAom+/9zHjUpvF/j1UsMynR26V7BLBqPhRd3Iz31Y
 foE5533Ue4O8jqVLK3kbBr1YEUvugNTCkORQ6lSN3LPSv74n9FAETg3NXnnGEri9VkH/CH7Ga
 bEvy36kr70igJbVU4/vRdGmG2c01yr2baQ01r8tpTjywpla5F9xHVPSK+Idclx2uws/MFi8nX
 6RfcK+h8VZQO5hikb32Yhurw+SVNw4j4v0IWYdg+dOJK/DaCOHbywajJlNxByce6pfxdOGNE/
 6Tm4YPVaMf6K6BCsWxDWtn6BsXiGjzhwcQ80ot1lYNlYS+QMD8p+M2izXZX6CIue8JiAsPMww
 2CEmO0teyN6aDzaomwIDqVw7AQZPT2AyRFYoM46WwKAkFzSCOMxdz+5+oQvMB1BS4fUbdIjrv
 gYWJvklyR5tvRYdt/u8LFgVYJUAk3ZA/wog1V5Fy5K5V0spfRIKFgjTpVgs+rx28z/ntfKtOg
 5enN47GIsBEFxqXz2XZr1Dcedr6hZTGznVm8rywJYIoDy84mSRZf4VCIH+V1p4knPAgTTBV4M
 zSwXT9ERquWwwULCjfk0mmVRk14etXLVuIGhrJm/nb76umGK0qSej+fAUUa97/yuUkzbShS86
 oQ6FgkJkSCWcfkcYujCe1ER6NII8f/EDaSt6i0ZeoAq4R/rtgxmShPvKaJQzfeB0vAtElQwWn
 cBoIJHF2vRpRMuCv5xjj3fNgPbYSAVpJWt5iqD4n8wyHCTHtDdCmocE60tFDuYGcRQaGzwcdn
 pYmTwKKTZCFYyFVjTk27pA3A==
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 3 Oct 2024 21:06:42 +0200

Add a jump target so that a bit of exception handling can be better reused
at the end of this function implementation.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/macintosh/via-pmu-led.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/macintosh/via-pmu-led.c b/drivers/macintosh/via-pmu-l=
ed.c
index a4fb16d7db3c..fc1af74b6596 100644
=2D-- a/drivers/macintosh/via-pmu-led.c
+++ b/drivers/macintosh/via-pmu-led.c
@@ -92,18 +92,15 @@ static int __init via_pmu_led_init(void)
 	if (dt =3D=3D NULL)
 		return -ENODEV;
 	model =3D of_get_property(dt, "model", NULL);
-	if (model =3D=3D NULL) {
-		of_node_put(dt);
-		return -ENODEV;
-	}
+	if (!model)
+		goto put_node;
+
 	if (strncmp(model, "PowerBook", strlen("PowerBook")) !=3D 0 &&
 	    strncmp(model, "iBook", strlen("iBook")) !=3D 0 &&
 	    strcmp(model, "PowerMac7,2") !=3D 0 &&
-	    strcmp(model, "PowerMac7,3") !=3D 0) {
-		of_node_put(dt);
-		/* ignore */
-		return -ENODEV;
-	}
+	    strcmp(model, "PowerMac7,3") !=3D 0)
+		goto put_node;
+
 	of_node_put(dt);

 	spin_lock_init(&pmu_blink_lock);
@@ -112,6 +109,10 @@ static int __init via_pmu_led_init(void)
 	pmu_blink_req.done =3D pmu_req_done;

 	return led_classdev_register(NULL, &pmu_led);
+
+put_node:
+	of_node_put(dt);
+	return -ENODEV;
 }

 late_initcall(via_pmu_led_init);
=2D-
2.46.1


