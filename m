Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B936A6CE4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Mar 2023 14:18:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PRZY55jr4z3cf8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Mar 2023 00:18:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=thaison-nguyen.de header.i=@thaison-nguyen.de header.a=rsa-sha256 header.s=dkim header.b=XEdEkFyb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=thaison-nguyen.de (client-ip=5.45.104.163; helo=mail.thaison-nguyen.de; envelope-from=mail@thaison-nguyen.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=thaison-nguyen.de header.i=@thaison-nguyen.de header.a=rsa-sha256 header.s=dkim header.b=XEdEkFyb;
	dkim-atps=neutral
Received: from mail.thaison-nguyen.de (thaison-nguyen.de [5.45.104.163])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PRS9j6R9rz3bhY
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Mar 2023 19:30:49 +1100 (AEDT)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 303CBE392F;
	Wed,  1 Mar 2023 09:30:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thaison-nguyen.de;
	s=dkim; t=1677659443;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language;
	bh=oEWkW5wEYrzuuez8tZMMzh/jr7Rxp40QcWdWTz9fZqE=;
	b=XEdEkFybAl76IDPQgfL4LZy/C5Ej60jjDpNOC8NXdXVEd187snt7TQIXXwwFKmm6P9lF4n
	z4k2JqWf0GLrq60lAYitYIPprxPhzsqD2112ZhhGiWQbF6Cp5A8ThhNospDb/GFxC6nTyu
	ItaDeutSlYVBg78OVJKYuZTnRnVJfuY6xYqiG3jm+0I+xZYuWfVhmiLNakK7xVSf7Kk5SE
	VBCm1Bq8cQ2T5Hghteyx5R6WLQky8Qd1+epvJBiF9FhRBTaZMxTg6McNNzbnXo/GCY648E
	R/NewaYm87ZCeZ1uQ+/JwD9cD2Gl07PqiP1YtZQwTCci/GOLJFYi+r1BJF6k6g==
From: "Thaison Nguyen" <mail@thaison-nguyen.de>
To: <johannes@sipsolutions.net>
Subject: [Patch] sound/aoa: Add support for iBook G4 (powerbook6,5)
Date: Wed, 1 Mar 2023 09:30:39 +0100
Message-ID: <008801d94c18$1c7424c0$555c6e40$@thaison-nguyen.de>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
thread-index: AdlMFjpemFCBQa8GRkebkHE1IVtr+w==
Content-Language: de
X-Last-TLS-Session-Version: TLSv1.2
X-Mailman-Approved-At: Thu, 02 Mar 2023 00:14:32 +1100
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
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The audio on my iBook G4 (powerbook65) has not been working.
This is because the ids of the device were missing in the aoa audio =
driver.
With this patch, the IDs of Powerbook6,4 and Powerbook6,5 are added to =
the driver.

Signed-off-by: Thaison Nguyen <mail@thaison-nguyen.de>
---
 sound/aoa/fabrics/layout.c       | 15 +++++++++++++++
 sound/aoa/soundbus/i2sbus/core.c |  2 +-
 2 files changed, 16 insertions(+), 1 deletions(-)

diff a/sound/aoa/fabrics/layout.c b/sound/aoa/fabrics/layout.c
--- a/sound/aoa/fabrics/layout.c
+++ b/sound/aoa/fabrics/layout.c
@@ -111,7 +111,9 @@
 MODULE_ALIAS("aoa-device-id-14");
 MODULE_ALIAS("aoa-device-id-22");
 MODULE_ALIAS("aoa-device-id-31");
 MODULE_ALIAS("aoa-device-id-35");
+MODULE_ALIAS("aoa-device-id-38");
+MODULE_ALIAS("aoa-device-id-40");
 MODULE_ALIAS("aoa-device-id-44");
=20
 /* onyx with all but microphone connected */
@@ -368,7 +368,20 @@
 		.connections =3D tas_connections_nolineout,
 	  },
 	},
+	/* PowerBook6,4 */
+	{ .device_id =3D 40,
+	  .codecs[0] =3D {
+		.name =3D "tas",
+		.connections =3D tas_connections_all,
+	  },
+	},
 	/* PowerBook6,5 */
+	{ .device_id =3D 38,
+	  .codecs[0] =3D {
+		.name =3D "tas",
+		.connections =3D tas_connections_all,
+	  },
+	},
 	{ .device_id =3D 44,
 	  .codecs[0] =3D {
 		.name =3D "tas",
diff a/sound/aoa/soundbus/i2sbus/core.c =
b/sound/aoa/soundbus/i2sbus/core.c
--- a/sound/aoa/soundbus/i2sbus/core.c
+++ b/sound/aoa/soundbus/i2sbus/core.c
@@ -197,7 +197,7 @@
 			 * so restrict to those we do handle for now.
 			 */
 			if (id && (*id =3D=3D 22 || *id =3D=3D 14 || *id =3D=3D 35 ||
-				   *id =3D=3D 31 || *id =3D=3D 44)) {
+				   *id =3D=3D 31 || *id =3D=3D 44 || *id =3D=3D 40 || *id =3D=3D =
38)) {
 				snprintf(dev->sound.modalias, 32,
 					 "aoa-device-id-%d", *id);
 				ok =3D 1;


