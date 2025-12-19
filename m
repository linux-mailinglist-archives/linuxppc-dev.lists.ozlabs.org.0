Return-Path: <linuxppc-dev+bounces-14916-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7738CD2262
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Dec 2025 23:57:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dY2wk4268z2xrk;
	Sat, 20 Dec 2025 09:57:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=159.226.251.84
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766153455;
	cv=none; b=BP8PLC/Wm7sFoRrqaihKCq7ssvsh4wm3sVwa4IcqwuycPrrUJ4tabYLzxGJ8hl28Uhn6rNuvxFhodEyJEomaESYhvVAptbhu7+RQusBRS0AzMGImsFuoPftd1+w1XsQeLgFK3i4ynDf2qRKdFrxKADf4AqhZmwhEFrxbM817JIhj7JX5wg2l6/vsl0BYdUE/kxAgbU/f2LHMQly5loCC3RBSCMNSIXEGwqa5hZbgY3Cr7w6dvzrszBf3DIlZ0wT6MlaiVfjdJnV1wDH5UC3cuK4S/QZIsfZqVo1UN56i+MS9ja2ErMXz9PaUqkI1C6C5uJkmP7j8Vn20bKZUD/gpPA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766153455; c=relaxed/relaxed;
	bh=Ja5pwKVXFbX6smam+cJccw9/HDc005YJI6VlCvR+q+I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UBXs/OZcMKXXcI1v3VFqOqqMH6opfDTz5blCsyRIsSvPHbMFjSF//t+o5PMwOiLuo2YUF1sPN6MftgLYTApuVB2wOUey81cv6B3fuD1ROfLKH0i1ngrCjIcGK0rrfyLioc88N3eGjeLyuyvQz/9rDXg/IroIfp1EQe23ae7Baz1hiGniWBtrFeoCaq8PW3zFrsilqUvt9x+XV5H29YJ6+VIiI1upnYxXRul4xzmT4VvQUfwKfTKHMOmGphU1P/fo2s8ZJ3msJeDXR7uLA0jBLHTnkhDl3ZX253ZE0JxT9aFQ24MihyHvAHDfjVObzViOu5FET4ABMlYyvTiHyM0y5A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn; spf=pass (client-ip=159.226.251.84; helo=cstnet.cn; envelope-from=lihaoxiang@isrc.iscas.ac.cn; receiver=lists.ozlabs.org) smtp.mailfrom=isrc.iscas.ac.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=isrc.iscas.ac.cn (client-ip=159.226.251.84; helo=cstnet.cn; envelope-from=lihaoxiang@isrc.iscas.ac.cn; receiver=lists.ozlabs.org)
Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dXqFV3Mxsz2yFW
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Dec 2025 01:10:52 +1100 (AEDT)
Received: from localhost.localdomain (unknown [36.112.3.209])
	by APP-05 (Coremail) with SMTP id zQCowACnOQ3dXEVpn+ovAQ--.16674S2;
	Fri, 19 Dec 2025 22:10:37 +0800 (CST)
From: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
To: maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
	mporter@kernel.crashing.org,
	alex.bou9@gmail.com
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
Subject: [PATCH] powerpc/fsl_rio: fix a improper release in fsl_rio_setup()
Date: Fri, 19 Dec 2025 22:10:33 +0800
Message-Id: <20251219141033.632153-1-lihaoxiang@isrc.iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
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
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowACnOQ3dXEVpn+ovAQ--.16674S2
X-Coremail-Antispam: 1UD129KBjvJXoW7AF4kZF45Aw1UtrWDuF1rJFb_yoW8CF1rpa
	1DKFyFkry0gr4IgFyjvFy0qF1vqa92y3yFkry8C3sakrs8Zry0vr1xAF97XFyUXFykAFyY
	qr9xJrWUWa18JF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkG14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWUuVWrJwAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j
	6r4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
	4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	tVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
	v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkG
	c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4U
	MIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUd-B_UUU
	UU=
X-Originating-IP: [36.112.3.209]
X-CM-SenderInfo: 5olkt0x0ld0ww6lv2u4olvutnvoduhdfq/1tbiCQ4BE2lFN99AuwACso
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

If rio_register_mport() fails, put_device() is the correct way
to drop the device reference.
To prevent a double free, remove put_device() in rio_register_mport()
Also, add a put_device() in tsi721_setup_mport() to prevent reference
leak.

Found by code review.

Signed-off-by: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
---
 arch/powerpc/sysdev/fsl_rio.c    | 2 +-
 drivers/rapidio/devices/tsi721.c | 1 +
 drivers/rapidio/rio.c            | 1 -
 3 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/sysdev/fsl_rio.c b/arch/powerpc/sysdev/fsl_rio.c
index f9b214b299e7..f6226b2619ed 100644
--- a/arch/powerpc/sysdev/fsl_rio.c
+++ b/arch/powerpc/sysdev/fsl_rio.c
@@ -697,7 +697,7 @@ static int fsl_rio_setup(struct platform_device *dev)
 		if (rio_register_mport(port)) {
 			release_resource(&port->iores);
 			kfree(priv);
-			kfree(port);
+			put_device(&port->dev);
 			continue;
 		}
 		active_ports++;
diff --git a/drivers/rapidio/devices/tsi721.c b/drivers/rapidio/devices/tsi721.c
index 4b84270a8906..17c2bcf29c5c 100644
--- a/drivers/rapidio/devices/tsi721.c
+++ b/drivers/rapidio/devices/tsi721.c
@@ -2758,6 +2758,7 @@ static int tsi721_setup_mport(struct tsi721_device *priv)
 	err = rio_register_mport(mport);
 	if (err) {
 		tsi721_unregister_dma(priv);
+		put_device(&mport->dev);
 		goto err_exit;
 	}
 
diff --git a/drivers/rapidio/rio.c b/drivers/rapidio/rio.c
index 46daf32ea13b..026b2328afd7 100644
--- a/drivers/rapidio/rio.c
+++ b/drivers/rapidio/rio.c
@@ -2089,7 +2089,6 @@ int rio_register_mport(struct rio_mport *port)
 		mutex_lock(&rio_mport_list_lock);
 		list_del(&port->node);
 		mutex_unlock(&rio_mport_list_lock);
-		put_device(&port->dev);
 	} else {
 		dev_dbg(&port->dev, "RIO: registered mport%d\n", port->id);
 	}
-- 
2.25.1


