Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D0A2D90A7
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Dec 2020 21:47:12 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CvGmF085MzDqPk
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Dec 2020 07:47:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=laposte.net (client-ip=160.92.124.102;
 helo=smtp-outgoing.laposte.net; envelope-from=vincent.stehle@laposte.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=laposte.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=laposte.net header.i=@laposte.net header.a=rsa-sha256
 header.s=lpn-wlmd header.b=eqPlee6n; dkim-atps=neutral
X-Greylist: delayed 7239 seconds by postgrey-1.36 at bilbo;
 Mon, 14 Dec 2020 07:28:31 AEDT
Received: from smtp-outgoing.laposte.net (smtp-outgoing.laposte.net
 [160.92.124.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CvGLl5Kf0zDqQK
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Dec 2020 07:28:21 +1100 (AEDT)
X-mail-filterd: {"version":"1.2.0", "queueID":"4CvCg925zrz10MQY",
 "contextId":"65b9d905-9a9e-4f5c-9967-0d45e91ce3a2"}
Received: from outgoing-mail.laposte.net (localhost.localdomain [127.0.0.1])
 by mlpnf0103.laposte.net (SMTP Server) with ESMTP id 4CvCg925zrz10MQY;
 Sun, 13 Dec 2020 19:27:33 +0100 (CET)
X-mail-filterd: {"version":"1.2.0", "queueID":"4CvCf7035Dz10MQV",
 "contextId":"b7eefe2d-5cd9-468a-9753-f7e7ca878663"}
X-lpn-mailing: LEGIT
X-lpn-spamrating: 36
X-lpn-spamlevel: not-spam
X-lpn-spamcause: OK,
 (-100)(0000)gggruggvucftvghtrhhoucdtuddrgedujedrudekiedguddufecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfntefrqffuvffgpdfqfgfvpdggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeggihhntggvnhhtucfuthgvhhhlrocuoehvihhntggvnhhtrdhsthgvhhhlvgeslhgrphhoshhtvgdrnhgvtheqnecuggftrfgrthhtvghrnhepteeivdehieejtdfgledvgffhvedtveejhefftdeukeeuieduudetjeektdeuffetnecukfhppeekkedruddvuddrudegledrgeelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehhvghloheprhhomhhurghlugdrsggvrhhgvghrihgvpdhinhgvthepkeekrdduvddurddugeelrdegledpmhgrihhlfhhrohhmpehvihhntggvnhhtrdhsthgvhhhlvgeslhgrphhoshhtvgdrnhgvthdprhgtphhtthhopehgvghofhhfsehinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepvhhinhgtvghnthdrshhtvghhlhgvsehlrghpohhsthgvrdhnvghtpdhrtghpthhtoheplhhinhhugihpphgtqdguvghvsehlihhsthhsrdhoiihlrggsshdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
Received: from romuald.bergerie (unknown [88.121.149.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mlpnf0103.laposte.net (SMTP Server) with ESMTPSA id 4CvCf7035Dz10MQV;
 Sun, 13 Dec 2020 19:26:36 +0100 (CET)
Received: from radicelle.bergerie (radicelle.bergerie [192.168.124.12])
 by romuald.bergerie (Postfix) with ESMTPS id 1BD413DF32AF;
 Sun, 13 Dec 2020 19:26:36 +0100 (CET)
Received: from vincent by radicelle.bergerie with local (Exim 4.94)
 (envelope-from <vincent@radicelle.bergerie>)
 id 1koW4p-00060T-P4; Sun, 13 Dec 2020 19:26:35 +0100
From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@laposte.net>
To: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc/ps3: use dma_mapping_error()
Date: Sun, 13 Dec 2020 19:26:22 +0100
Message-Id: <20201213182622.23047-1-vincent.stehle@laposte.net>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=laposte.net; s=lpn-wlmd;
 t=1607891296; bh=YIAg0xdLhTfsQSKbEzRITi543Hxi26DWrI5pNv7EPQE=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding;
 b=eqPlee6n1jjiOK8BI6U4pdPfCdtwMul3SDeBCp2YLo4qOdB4uw4nvN2jOwAHcB3EoOFbB1+/XGq01mEvTjH4WmECLwLJeMzwiarvY9Zwb4pYCRzvTiZdagJgkDSSZ79SLNqj+eiyhq03n+Nm3eFow3DShNmF2WFYXSbFiizoPv4QyqaSHu4Syn2T3kdL6gOKx6cgp1/OAHNx5aYLfo8ZjMXc5XVANh0Bg8Vu86pNmIrKWVe1inlpWdV+jDP8TUuJJWh4W3wO4CA2+bL68roW7iE1GGlzL25tNz6Yab8sv+nRLJYr3p3RdeFK5k/H1pXOSuyREGTJBTZr1xpbYogwGA==;
X-Mailman-Approved-At: Mon, 14 Dec 2020 07:43:52 +1100
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
Cc: Geoff Levand <geoff@infradead.org>,
 Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>,
 =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@laposte.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The DMA address returned by dma_map_single() should be checked with
dma_mapping_error(). Fix the ps3stor_setup() function accordingly.

Fixes: 80071802cb9c ("[POWERPC] PS3: Storage Driver Core")
Signed-off-by: Vincent Stehl=C3=A9 <vincent.stehle@laposte.net>
Cc: Geoff Levand <geoff@infradead.org>
Cc: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
---
 drivers/ps3/ps3stor_lib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ps3/ps3stor_lib.c b/drivers/ps3/ps3stor_lib.c
index 333ba83006e48..a12a1ad9b5fe3 100644
--- a/drivers/ps3/ps3stor_lib.c
+++ b/drivers/ps3/ps3stor_lib.c
@@ -189,7 +189,7 @@ int ps3stor_setup(struct ps3_storage_device *dev, irq=
_handler_t handler)
 	dev->bounce_lpar =3D ps3_mm_phys_to_lpar(__pa(dev->bounce_buf));
 	dev->bounce_dma =3D dma_map_single(&dev->sbd.core, dev->bounce_buf,
 					 dev->bounce_size, DMA_BIDIRECTIONAL);
-	if (!dev->bounce_dma) {
+	if (dma_mapping_error(&dev->sbd.core, dev->bounce_dma)) {
 		dev_err(&dev->sbd.core, "%s:%u: map DMA region failed\n",
 			__func__, __LINE__);
 		error =3D -ENODEV;
--=20
2.29.2

