Return-Path: <linuxppc-dev+bounces-6603-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DFFF3A4B29C
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Mar 2025 16:33:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z5QvM6x4Jz303B;
	Mon,  3 Mar 2025 02:33:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=80.12.242.25
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740929599;
	cv=none; b=TNux2fM6N+nS2foDktXOa1wJhC+8OyCP4Xh2mXq9vismy+OWFyMOelS3Ng3tbgYXv5Bbz+gFG1v31i4V1KCGF/MdIjYOGCyw3herW2YyA8qNAzSA7Mn854TovfjblVfeSOISJxn1A4gRkJ0dhpyhYjDsWM0t+Xo2IeItjta9nj1cRsqnJUXv2zMdYXiIhCndX1RxbIlFfA2VT1ysL7kTSJINQPej+BsqIIpeYL+onDOPxP6M8NyFol0tHn32VFHFrswQoLTk4d5hBV1XI7vM8bdj1Wj7J16GC1mjt9xpzd2H9hX7QjKEHAIxUmsRXIcUQTMekz8CC/1rCKIT9cUcYA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740929599; c=relaxed/relaxed;
	bh=7m8X2HCaZAYsFWSmtyiQM+IwxWQ2FTT2RuVDQw5Wmz8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M+Dy04rl0AJ4UUJf0zR1FQhaod0TBjdh+rR1SXEXAYP9H4Jp8DTxYdze5RaRVH0ODm4+PM8u12TDhqsx8m5Oktfk80DIuQJ4hl6ecZuUlJ9Xak70bgqokYfZrM1DERlRaL9H4FHxMsz9rhUG61uTBXxvCFZLZOAgtbpD++fq5x6DLbeVx6/7Pf/Mt/Z3+UdiPZlonGaItVG6iJVomcrfd40lphnEf55IptlUrkFwxRTfMZNYd8FMqFzoq8LftKqzibVbwYdhDiBZU8Y5JJ5qnKNE1wWs8f+HyIM/Epy3x51bsocBPVd7eumZDBHqCeg5hYMS9+BPy9E5ezFDFcxRQw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256 header.s=t20230301 header.b=MBsne84T; dkim-atps=neutral; spf=pass (client-ip=80.12.242.25; helo=smtp.smtpout.orange.fr; envelope-from=christophe.jaillet@wanadoo.fr; receiver=lists.ozlabs.org) smtp.mailfrom=wanadoo.fr
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256 header.s=t20230301 header.b=MBsne84T;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wanadoo.fr (client-ip=80.12.242.25; helo=smtp.smtpout.orange.fr; envelope-from=christophe.jaillet@wanadoo.fr; receiver=lists.ozlabs.org)
Received: from smtp.smtpout.orange.fr (smtp-25.smtpout.orange.fr [80.12.242.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z5QvM1FPQz2xGF
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Mar 2025 02:33:19 +1100 (AEDT)
Received: from fedora.home ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id okmqtJVk70yWRokn4t9OHq; Sun, 02 Mar 2025 15:59:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1740927579;
	bh=7m8X2HCaZAYsFWSmtyiQM+IwxWQ2FTT2RuVDQw5Wmz8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=MBsne84TkdsRHqfUbFe5BPJjnldQEWEA9Xqy7Wj9R4KQIbAr0rCx+jYiaYT7AxYNX
	 Z0GJnimiD/aK+L0gL5zooz1nui+83vDbVo3Nigiw1VpJdLi81Uc7hVzUBjHWyMBNtR
	 6e9SKa2/dbQQ0kwBex9GVNIjf8gJav/HFX+feV8ydI5pUULz1piZ9Gk8jAuLcbDeii
	 /cTrSbyjlD5/QmVKVd+BmjTlneUUTcjDw7vBjlFfR7jMq649WE2fuvM+DjX1zsmN63
	 zLJKvpSWLyLMrGhm87gKpNC+22QrfbBUl8lPYnLAtoEB95Vcqt4fm6ywQ385Pul4D5
	 4G/gkDfIBzcyw==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 02 Mar 2025 15:59:39 +0100
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	naveen@kernel.org
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 1/2] powerpc: gpio_mdio: Use devm_mdiobus_alloc_size()
Date: Sun,  2 Mar 2025 15:59:15 +0100
Message-ID: <2d02da3bebb2273782e535201cc9512f3cdbccab.1740926808.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1740926808.git.christophe.jaillet@wanadoo.fr>
References: <cover.1740926808.git.christophe.jaillet@wanadoo.fr>
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
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Use mdiobus_alloc_size() instead of a hand written mdiobus_alloc() +
kzalloc().

This is less verbose and more robust. It also reduces memory fragmentation
and saves a few bytes of memory.

While at it, switch to devm_mdiobus_alloc_size() for extra simplification.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
This patch is compile tested only.

Some memory is saved because pahole states, on a x86_64,  that:

struct mii_bus {
	...
	/* size: 3640, cachelines: 57, members: 23 */
	/* sum members: 3633, holes: 2, sum holes: 7 */
	/* member types with holes: 3, total: 4, bit paddings: 1, total: 1 bit */
	/* paddings: 1, sum paddings: 3 */
	/* forced alignments: 1, forced holes: 1, sum forced holes: 4 */
	/* last cacheline: 56 bytes */
}

Because of the way allocation works, 4096 bytes are allocated. When
mdiobus_alloc_size() is used, struct gpio_priv fits in this "wasted" space
and so is available "for free".
---
 arch/powerpc/platforms/pasemi/gpio_mdio.c | 26 +++++------------------
 1 file changed, 5 insertions(+), 21 deletions(-)

diff --git a/arch/powerpc/platforms/pasemi/gpio_mdio.c b/arch/powerpc/platforms/pasemi/gpio_mdio.c
index e4538d471256..2c54f5f063b7 100644
--- a/arch/powerpc/platforms/pasemi/gpio_mdio.c
+++ b/arch/powerpc/platforms/pasemi/gpio_mdio.c
@@ -213,15 +213,11 @@ static int gpio_mdio_probe(struct platform_device *ofdev)
 	const unsigned int *prop;
 	int err;
 
-	err = -ENOMEM;
-	priv = kzalloc(sizeof(struct gpio_priv), GFP_KERNEL);
-	if (!priv)
-		goto out;
-
-	new_bus = mdiobus_alloc();
-
+	new_bus = devm_mdiobus_alloc_size(dev, sizeof(*priv));
 	if (!new_bus)
-		goto out_free_priv;
+		return -ENOMEM;
+
+	priv = new_bus->priv;
 
 	new_bus->name = "pasemi gpio mdio bus";
 	new_bus->read = &gpio_mdio_read;
@@ -230,7 +226,6 @@ static int gpio_mdio_probe(struct platform_device *ofdev)
 
 	prop = of_get_property(np, "reg", NULL);
 	snprintf(new_bus->id, MII_BUS_ID_SIZE, "%x", *prop);
-	new_bus->priv = priv;
 
 	prop = of_get_property(np, "mdc-pin", NULL);
 	priv->mdc_pin = *prop;
@@ -246,17 +241,10 @@ static int gpio_mdio_probe(struct platform_device *ofdev)
 	if (err != 0) {
 		pr_err("%s: Cannot register as MDIO bus, err %d\n",
 				new_bus->name, err);
-		goto out_free_irq;
+		return err;
 	}
 
 	return 0;
-
-out_free_irq:
-	kfree(new_bus);
-out_free_priv:
-	kfree(priv);
-out:
-	return err;
 }
 
 
@@ -267,10 +255,6 @@ static void gpio_mdio_remove(struct platform_device *dev)
 	mdiobus_unregister(bus);
 
 	dev_set_drvdata(&dev->dev, NULL);
-
-	kfree(bus->priv);
-	bus->priv = NULL;
-	mdiobus_free(bus);
 }
 
 static const struct of_device_id gpio_mdio_match[] =
-- 
2.48.1


