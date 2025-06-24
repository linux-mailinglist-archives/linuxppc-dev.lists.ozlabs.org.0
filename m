Return-Path: <linuxppc-dev+bounces-9678-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F12FFAE69CC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jun 2025 16:57:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bRSj149ylz2xlK;
	Wed, 25 Jun 2025 00:57:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=212.227.17.11
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750777029;
	cv=none; b=dc9n7S9x3dXTxA/0Gvsb07dggrAnB1Pd92qeMyWdPuIu/jzWEzSl393VI7pcoYslF//ZVb2q/1B9i0FzsgpC57+futlJMsenojgBNDhfpcesa/oK05pDaGCyssrE1lwwpQ0i9SXz7QY0sXfi2D/TdsQT8c4XUofI9A41i8xf8eA6gJv0abpeR01Vh4vEp5U6o3Kvee4zTl4UP+JCL0jpy7zD0lZI5rGKFl4ZQUYR8Q/jaEU4h/xMrGZyOvit8jj1lKAKtbw7Zqumx7zjcBVtPBLV6V3vW2Ffodg1iDlfoDAqGule+jaG9m0AQAJNCyUHyRKXOx/80zd0uojG3I/dkA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750777029; c=relaxed/relaxed;
	bh=slW1HY6NogLYGpkBA3UndyleR92HTWdOgcZcNz1CxfI=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=H1zo8vKXYP7jUhSyrn73WETpUtFjwuyxKIw6Kb8dn2aQ17qYtRLvtjVeyAUgvwnHnqpafrdqY1/rUBgRGMKD17PnGo2aK6Sj5idzjsatkhrB8N46S5cgtLLTC/oZnSnpRJiHVJOLedqbFOC8kbuhltScfAsmo80gD/+o4vSs5uaA441vISI1hbx6Mdl0LFO2rJEzVcqUhbL0xztZqzkFFPwbqsy0lcMTEI62+wnZKbmj35JtoaWhLCWsgXZ9rMGtGU8350RSGnCUAPQksZj3zCJVQNSXK4T94Tks3h0YQiNWbwlpBuU7M/BzLwBEVOwfygZskJMhZPYWaKcphRdY/g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=FIRz18Gp; dkim-atps=neutral; spf=pass (client-ip=212.227.17.11; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org) smtp.mailfrom=web.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=FIRz18Gp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=web.de (client-ip=212.227.17.11; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 480 seconds by postgrey-1.37 at boromir; Wed, 25 Jun 2025 00:57:06 AEST
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bRShy41Nmz2xk5
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jun 2025 00:57:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1750777022; x=1751381822; i=markus.elfring@web.de;
	bh=slW1HY6NogLYGpkBA3UndyleR92HTWdOgcZcNz1CxfI=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=FIRz18Gpx91hAhX11BpIpFzl7y5P4jcLscJ1RT5YKXwAny0GM4nqxIOecdIp+gRH
	 Nj7vfDYs0Hdv0z4LhofbVoNBcQK9qW8Ds+KzQ5BGAgwTply3srHJPrPp2zIrm8QcM
	 2cue7Ub9BAukkDsKdLSs3yKoQd5UeE5k/iMRggVIvT/WmqsC5wtLLKhWw91oqEz/F
	 8BCfQQZXUA6A3MMRk7bcK5PryXo7uAoqO7B0DKNjgJzKwYEudndGv5Kjfhx8GSzIP
	 N+GjHpKLywcSCgUA8ob6YEyNZ63rUzXYBkMIrH00mIqJqXODsqDJN6NbtxUpVemPZ
	 zD3zZxP8mAlTHTh2+Q==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.200]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MWi5i-1uEggu28gy-00Q4GN; Tue, 24
 Jun 2025 16:43:16 +0200
Message-ID: <b4544835-2cac-4501-bcf4-6f105e3667d4@web.de>
Date: Tue, 24 Jun 2025 16:43:10 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-usb@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Al Viro <viro@zeniv.linux.org.uk>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Yan Zhen <yanzhen@vivo.com>
Content-Language: en-GB, de-DE
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Chen Ni <nichen@iscas.ac.cn>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] usb: gadget: fsl: Use usb_endpoint_type() rather than
 duplicating its implementation
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:I7qV3JknpoGbkjG1a5NsvY0sDnSX3fJTGBJC1TXjonrd3RCs2Zw
 cgUYPHMBS312n6EAGFi+WxAGdCU8b/AI9G7I1f6f1tuAS4GPbJf9Zn3XWmiY8qKVYzl+2PK
 3uTr6yXTta/Fv3xqoGqaGkiAiaTgv9kRBS1BfrW7exkDhhJWEQQGVZnjZc84HSzczaYc1m/
 kCE/33R8XfEtc8b3YOwwg==
UI-OutboundReport: notjunk:1;M01:P0:o4E4RkgB+Bs=;M7jgwefA12W9e4zFJHkx9JLQIWQ
 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
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 24 Jun 2025 16:33:53 +0200

Reuse existing functionality from usb_endpoint_type() instead of keeping
duplicate source code.

The source code was transformed by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/usb/gadget/udc/fsl_qe_udc.c   | 4 ++--
 drivers/usb/gadget/udc/fsl_udc_core.c | 6 ++----
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/gadget/udc/fsl_qe_udc.c b/drivers/usb/gadget/udc/=
fsl_qe_udc.c
index aacfde06387c..6ee3da32cc4e 100644
=2D-- a/drivers/usb/gadget/udc/fsl_qe_udc.c
+++ b/drivers/usb/gadget/udc/fsl_qe_udc.c
@@ -533,7 +533,7 @@ static int qe_ep_init(struct qe_udc *udc,
 	/* Refer to USB2.0 spec table 9-13,
 	*/
 	if (pipe_num !=3D 0) {
-		switch (desc->bmAttributes & USB_ENDPOINT_XFERTYPE_MASK) {
+		switch (usb_endpoint_type(desc)) {
 		case USB_ENDPOINT_XFER_BULK:
 			if (strstr(ep->ep.name, "-iso")
 					|| strstr(ep->ep.name, "-int"))
@@ -636,7 +636,7 @@ static int qe_ep_init(struct qe_udc *udc,
=20
 	/* initialize ep structure */
 	ep->ep.maxpacket =3D max;
-	ep->tm =3D (u8)(desc->bmAttributes & USB_ENDPOINT_XFERTYPE_MASK);
+	ep->tm =3D (u8) usb_endpoint_type(desc);
 	ep->ep.desc =3D desc;
 	ep->stopped =3D 0;
 	ep->init =3D 1;
diff --git a/drivers/usb/gadget/udc/fsl_udc_core.c b/drivers/usb/gadget/ud=
c/fsl_udc_core.c
index 4dea8bc30cf6..19c74ba82e16 100644
=2D-- a/drivers/usb/gadget/udc/fsl_udc_core.c
+++ b/drivers/usb/gadget/udc/fsl_udc_core.c
@@ -599,16 +599,14 @@ static int fsl_ep_enable(struct usb_ep *_ep,
 	struct_ep_qh_setup(udc, (unsigned char) ep_index(ep),
 			(unsigned char) ((desc->bEndpointAddress & USB_DIR_IN)
 					?  USB_SEND : USB_RECV),
-			(unsigned char) (desc->bmAttributes
-					& USB_ENDPOINT_XFERTYPE_MASK),
+			(unsigned char) usb_endpoint_type(desc),
 			max, zlt, mult);
=20
 	/* Init endpoint ctrl register */
 	dr_ep_setup((unsigned char) ep_index(ep),
 			(unsigned char) ((desc->bEndpointAddress & USB_DIR_IN)
 					? USB_SEND : USB_RECV),
-			(unsigned char) (desc->bmAttributes
-					& USB_ENDPOINT_XFERTYPE_MASK));
+			(unsigned char) usb_endpoint_type(desc));
=20
 	spin_unlock_irqrestore(&udc->lock, flags);
 	retval =3D 0;
=2D-=20
2.50.0


