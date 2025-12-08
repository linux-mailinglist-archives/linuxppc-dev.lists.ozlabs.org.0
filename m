Return-Path: <linuxppc-dev+bounces-14686-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 95370CAD2FE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 08 Dec 2025 13:44:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dQ1rC3WGPz2yTH;
	Mon, 08 Dec 2025 23:43:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=176.9.10.151
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765197835;
	cv=none; b=gRey4YAVu6qCpcq7/rAMM7fJPLY7/nzUx9WkZLvluDEwwmSQwPqx2SVIuvQxxCw1cTQjW0eWK18wJvubdqiGN3Igo+iOGbJdOJwrjG2qv9IzJsao8a/BS0/n8rmsCL8JNArkrxtVLPQA+QYmCq6QmHEIulurnd04u9r8TNZMWltjsHcqGdXsMjMEJfnVlkMiuOxDkETAS0RcJ8cd5KFnyM8E6QNCvyB7jR06JTTaVcwtE9urubcyNr3yxWfqQGfgfzZBDBhQIhah2kzOyyaIoihc+fSJT5tN7MGjoB/HymVIh+DnNZYNEA8iFiRwsGGtyO+0QPk0wpnI6SvNx+Y2+w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765197835; c=relaxed/relaxed;
	bh=VyMnHMLigeJSl7gdbsKnzHstHtVolnjGqq5HWVtQk40=;
	h=Date:Message-Id:To:Cc:Subject:From:Mime-Version:Content-Type; b=lRzUhi3VrILBru1GuYIrVmIo7kutfnhWQbhdwvjWlszaxNLVuhpz/yUy/HychqKjtRw3TXMkeZCqmkAHu8N4pyu4pPqZunVBRwMSFn8OrzW3vnS9Gegw475hCWPTS44J2hl5gct6qc1G3C2BCBVnApDu7SWx4S2RGtfH/0oBRxmsofzwFVBGaMJ85vh7UKndHydlQdm4nIId+UhEhv17frtZa4ANl+tKAKH+gs4XkwjlSKRNmryqwqkPoWRCBItcg1XFBw9uAjxtDuhLC3WF5wC7+n/4buWnvzojy+BEbH7j9A+7rLigeU9dksrWTgxWVvxzBo3htwMi+J4GSwktLw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=exactco.de; dkim=pass (2048-bit key; unprotected) header.d=exactco.de header.i=@exactco.de header.a=rsa-sha256 header.s=x header.b=fLgsf9FN; dkim-atps=neutral; spf=pass (client-ip=176.9.10.151; helo=exactco.de; envelope-from=rene@exactco.de; receiver=lists.ozlabs.org) smtp.mailfrom=exactco.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=exactco.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=exactco.de header.i=@exactco.de header.a=rsa-sha256 header.s=x header.b=fLgsf9FN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=exactco.de (client-ip=176.9.10.151; helo=exactco.de; envelope-from=rene@exactco.de; receiver=lists.ozlabs.org)
Received: from exactco.de (exactco.de [176.9.10.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dQ1r71fPdz2yRC
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Dec 2025 23:43:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=exactco.de;
	s=x; h=Content-Transfer-Encoding:Content-Type:Mime-Version:From:Subject:Cc:To
	:Message-Id:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
	List-Owner:List-Archive; bh=VyMnHMLigeJSl7gdbsKnzHstHtVolnjGqq5HWVtQk40=; b=f
	Lgsf9FNjEYZo89e4Btd1E2KDsQ0o20PPm2PIfFCppesj181yCwTdto1KOYDUibgMqHcV9qPYRD1bP
	qT0OuBpdzD916uSnKtRElod/tlN4e49f4Dmmr7HYcchbXcvMM/LP9COKTHBS9XyltdXyJMl3vLHQD
	S277R9e3jn9sLoj+zKsymTrfy+h4c97kx74PhofWFczNKWfTd1kIRxKVX6LwTbyy4qjM08pawvlct
	vRyurQlPkV0GsCE76JT17K7ZQi6ZmQVA0P5a+0A1OJZmeKnopMu5ZNWmC55PIF+jspXEz3ns56VJE
	HklDj9KjYOxO60fkrO8hoqbI+GUpM2s3g==;
Date: Mon, 08 Dec 2025 13:43:49 +0100 (CET)
Message-Id: <20251208.134349.455605632609082340.rene@exactco.de>
To: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman
 <mpe@ellerman.id.au>
Subject: [PATCH RESEND] drivers: Add missing MODULE_DESCRIPTION to PowerMac
 drivers
From: =?iso-8859-1?Q?Ren=E9?= Rebe <rene@exactco.de>
X-Mailer: Mew version 6.10 on Emacs 30.2
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
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Noticing modpost: missing MODULE_DESCRIPTION() in our PPC T2/Linux CI:

MODPOST Module.symvers
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/block/swim3.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/macintosh/ans-lcd.o

Fix by adding missing MODULE_DESCRIPTION().

Signed-off-by: René Rebe <rene@exactco.de>
---
RESEND w/ forgotten Signed-off-by
---
 drivers/block/swim3.c       | 1 +
 drivers/macintosh/ans-lcd.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/block/swim3.c b/drivers/block/swim3.c
index 01f7aef3fcfb..6f986ef62b94 100644
--- a/drivers/block/swim3.c
+++ b/drivers/block/swim3.c
@@ -1290,4 +1290,5 @@ module_init(swim3_init)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Paul Mackerras");
+MODULE_DESCRIPTION("SWIM3 PowerMac floppy driver");
 MODULE_ALIAS_BLOCKDEV_MAJOR(FLOPPY_MAJOR);
diff --git a/drivers/macintosh/ans-lcd.c b/drivers/macintosh/ans-lcd.c
index fa904b24a600..10921b41e684 100644
--- a/drivers/macintosh/ans-lcd.c
+++ b/drivers/macintosh/ans-lcd.c
@@ -203,3 +203,4 @@ anslcd_exit(void)
 module_init(anslcd_init);
 module_exit(anslcd_exit);
 MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("Apple Network Servers LCD driver");
-- 
2.52.0

-- 
René Rebe, ExactCODE GmbH, Berlin, Germany
https://exactco.de • https://t2linux.com • https://patreon.com/renerebe

