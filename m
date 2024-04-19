Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E848AB058
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Apr 2024 16:10:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=BXrL+qy7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VLc3g3b82z3cgB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Apr 2024 00:10:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=BXrL+qy7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=web.de (client-ip=212.227.15.3; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org)
Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VLc2x3B3Gz3cR2
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Apr 2024 00:09:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1713535720; x=1714140520; i=markus.elfring@web.de;
	bh=lAS9mTVpLnalSm5EePWLAsejXsUvIKNzzANCk7Zyh88=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=BXrL+qy7fKZKSy7vXMNGYc7EmhjKtAJ5OjAQginqikx1Pp94g+yz7C0WAZW9POva
	 Phxn9z46+j3Trvz4xkZp/TchUKQBgINAmCUBTZB+BL6CUaMbReuXDBfAYww1gAvQi
	 vikPRSBVxbCDVZ0Yo9nXMUkFSOQxukR69hLSZ1zsEzsJv6FPZKVuIs5xifpuhx1HJ
	 8YMZ1EuE2YG1fzH0RtxH9ZAOxUW8w3MI6gy42wSOvh9a09uId+uKykhFOI2qelq65
	 KucGTGQtZjtz/vvI6G7xgUMt/zpB1E0RvYkOoIHqnPUNmTGmFJG+xWTuUNyH6XXQl
	 fQakCVTh9NuX0nmHNw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Mo6O7-1sUcQV2IAN-00mvrD; Fri, 19
 Apr 2024 16:08:40 +0200
Message-ID: <4cff158d-b5ac-4dca-9fbb-626237c1eafe@web.de>
Date: Fri, 19 Apr 2024 16:08:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linuxppc-dev@lists.ozlabs.org, netdev@vger.kernel.org,
 kernel-janitors@vger.kernel.org, "Aneesh Kumar K.V"
 <aneesh.kumar@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Haren Myneni <haren@linux.ibm.com>, Jakub Kicinski <kuba@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Nick Child <nnac123@linux.ibm.com>,
 Paolo Abeni <pabeni@redhat.com>, Rick Lindsley <ricklind@linux.ibm.com>,
 Thomas Falcon <tlfalcon@linux.ibm.com>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] ibmvnic: Use -EBUSY in __ibmvnic_reset()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:wHaYprIvoklgpYvLAHaNj+zV2sUobvP/1+QGxB/jpFxwfLQ3/qn
 32vCTsyWO3nPL2VCwhbpCMJR8j7UPW1FscxEpo8oGbSL/aAgV/PX6Vpr+VEtuUd39Fl9Wwi
 C04dNziBBise3+TfaEabuRF7AP8kexSpDRo+9sw4iZ7FlHoVp7pytc0thcBAO/GXLQfi2ot
 HsTWBbbb3UTXqwH16qzxw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:J02Z7QBpCOg=;z+trVArPa8/FGsp1KNJLJcillff
 hRcWIsH8BcyVEgycHUM44aOJtRmtzAwN6ouXaz79v3pTmbM9d7GSKWrRZ6wnWy6i+vKj0djKA
 mU+vnmEikbKvaQBqUWsRZzp1MQxOLxf9psQ01whhYma8tGSY7u92a50OvXBn1IlRsngOvttjY
 qBUZP7pjSVzwwhd3h5QEpCyYQjDC3yDZbs32q8+6WrY7LJcSy7MoDCugO+FpXK/445fvX0Wv5
 2qc1FLNzJac7LHzXbyXOSf6AC54e03yo3XF6qf0YXl1xswPXZQ9D/tt/a8upC9tzNlGm30GxY
 zmJLGtljbL+2GCEzBazjBrhIMvYfEMhTMEury3fLz/7Cef/6VJaNEkTf1H7PfxNMwmxrCSWAN
 SKexmvUTmcZt233uMeQcGmc5S3BroHa9QxNTKot1ydzi6RdYzJxnuv/5DJN8UFa1T3IFXTyyX
 aksxT0fyEwkmLDaB0MRhIhhsYteo88NDd2hIJS9LER0OsRgK0J0HSy0lWELkQmF1NNmxNUSGS
 umUOZ7XUzok6jX+BtbH7DAVIHqgy/IyLQXqBcThg6uHSizSVvXWpbqbztrVByJ1mCyz0bYHWi
 AtAIYC8SQS5xVRj5E33RR/+BT3xkqVBZSvioSSa25LrG2MHLROt0CAPteRYW0nnZAZHDeZVzN
 8WfcVE+jXneHVHX9SGaL5GEHcFNxv6jK1W5TUTD8uqrFnuyRMg81483evRi2wy48cRdUjrbh7
 NW6pVBHGE6UvKCOYRhyE6xE2mjRUg20S+N3bC0houl+NYlZy9c5Gv9/oRUIrvK/w3mR3+VXbs
 CyioRbpVKMsnV52g2zH3aKGPSwPO3629RXSYANKTwAWbE=
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
Cc: LKML <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 19 Apr 2024 15:46:17 +0200

Add a minus sign before the error code =E2=80=9CEBUSY=E2=80=9D
so that a negative value will be used as in other cases.

This issue was transformed by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/net/ethernet/ibm/ibmvnic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/ibm/ibmvnic.c b/drivers/net/ethernet/ibm=
/ibmvnic.c
index 5e9a93bdb518..737ae83a836a 100644
=2D-- a/drivers/net/ethernet/ibm/ibmvnic.c
+++ b/drivers/net/ethernet/ibm/ibmvnic.c
@@ -3212,7 +3212,7 @@ static void __ibmvnic_reset(struct work_struct *work=
)
 		    adapter->state =3D=3D VNIC_REMOVED) {
 			spin_unlock_irqrestore(&adapter->state_lock, flags);
 			kfree(rwi);
-			rc =3D EBUSY;
+			rc =3D -EBUSY;
 			break;
 		}

=2D-
2.44.0

