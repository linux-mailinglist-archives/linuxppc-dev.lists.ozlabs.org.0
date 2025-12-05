Return-Path: <linuxppc-dev+bounces-14655-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8CDCA8A50
	for <lists+linuxppc-dev@lfdr.de>; Fri, 05 Dec 2025 18:39:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dNJXL1Sn2z2y7b;
	Sat, 06 Dec 2025 04:39:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=176.9.10.151
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764956354;
	cv=none; b=aMDp4tetIsgbHIh3rduGLHrJupGMTH+NbTU290gv68/ZtONnLSscld6BSgHoGI3dKJ60qruFajN1zhtEdS9jUyXpNAgcmIkdcwllrMVjkBlvWgSU962RLHnfM4llEU289/XKe1LNByxs29CZSToSF8HeVuX5tEv9WQ+GCL0KBngskuX5aWiJJzOa/slFVXJKx2VD0rSwPJ8Gf1tlL/+QiUFiNr6DucOS1klBh8JAQV3xgbwaRJsAIQ8dJQ/suvEeYyAbUl18RSDG8BbU2inZg7MoMY12oqIHlFLsDPptzWsahuqaNfsdElHNbVyoQen3tUL8XEpM9NP2Ie0l51qFzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764956354; c=relaxed/relaxed;
	bh=BiZjWHGVTZkiLt/oBUkcA92jtPsUF52FgIJPLJ8sXiA=;
	h=Date:Message-Id:To:Cc:Subject:From:Mime-Version:Content-Type; b=darBLBZGm/gSw8mQaJXA7ToSjo1xEgaXAcDYt6PmKOV4gQyVISlmIA5g0smpxgdETBsURoocT85tiTLZR5JRPpkbuRjAubp3s/jbrLm4djpZyFzj42zmnbIxCw2Y7cW6Yg10yFmwZkyX1VcYiOOGDWTWYwnWonot5JMo215iJ26ScWDGqgyJ0XSSg6M0STGJ3Uk0AqLLe7j/EfqLy+jkqQb09v8zjcDFo7oYD/OD9kYz2Omt8OxgvpmlYWg0VQ3TGef//YlT2JUsAZ9Pt6SF0f9FwOUA0GJgu/IkCn+iRFp+A9sujGAcRXej7OTGpm/r7hW7a4WlrQEigJldWpR5ag==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=exactco.de; dkim=pass (2048-bit key; unprotected) header.d=exactco.de header.i=@exactco.de header.a=rsa-sha256 header.s=x header.b=YULVbqji; dkim-atps=neutral; spf=pass (client-ip=176.9.10.151; helo=exactco.de; envelope-from=rene@exactco.de; receiver=lists.ozlabs.org) smtp.mailfrom=exactco.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=exactco.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=exactco.de header.i=@exactco.de header.a=rsa-sha256 header.s=x header.b=YULVbqji;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=exactco.de (client-ip=176.9.10.151; helo=exactco.de; envelope-from=rene@exactco.de; receiver=lists.ozlabs.org)
Received: from exactco.de (exactco.de [176.9.10.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dNJXH3Qkfz2xs1
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 06 Dec 2025 04:39:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=exactco.de;
	s=x; h=Content-Transfer-Encoding:Content-Type:Mime-Version:From:Subject:Cc:To
	:Message-Id:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
	List-Owner:List-Archive; bh=BiZjWHGVTZkiLt/oBUkcA92jtPsUF52FgIJPLJ8sXiA=; b=Y
	ULVbqjiej4g/xwVbkMX6yFHVERUSIGjWcOAntHEboFUNp8cb0aPcke8Xz/Ce3DwfCt4wBt1jU9Z2o
	V1tuYrCkqkAqpaxz69BtlpDzNlb0jQTBM71K2dwlgurSOKMq/212PzanINA/3Mi5bEHvH4Pvhu3ng
	860uYHzL9QxyF9Pscttk6cmUV4SoU4o9HmkdrTcKYwxOLEck1awm3EMBbxpWv9xdfRDZ6bs1EIsPi
	si/dKxz9pFP3RfyQvtT9NsMZMEr/4rB8oxsAT0Tj/U3azz74UZtKRZjLHqRHn4iWYM2fs18uA8T3P
	JE+yXKEAhw5lDdUym8rmdmWTEuo3s78aw==;
Date: Fri, 05 Dec 2025 18:39:08 +0100 (CET)
Message-Id: <20251205.183908.516147854993297802.rene@exactco.de>
To: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman
 <mpe@ellerman.id.au>
Subject: [PATCH] drivers: Add missing MODULE_DESCRIPTION to PowerMac drivers
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

