Return-Path: <linuxppc-dev+bounces-3684-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9D29E0B74
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Dec 2024 20:01:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y2CmP34Ztz2yyy;
	Tue,  3 Dec 2024 06:00:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=159.69.126.157
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733166053;
	cv=none; b=J2jaiOrH3RaS420U8Afc2iacLIobsaF9becc0rhGrApg3/0agttLJO+jTl1FTq6lHqVB+wp2ZzTaQdfj8BEBfxAi7M3dLvdn7bRAlTMvSKbJwB+koCRaq6KIJ78W6dE7/tTKaLCxTH8cH5m4UrpTD9PaAyjXvWweN3C0hGqlLKQzRXvLlmRzCm16sNWbBxQJEwueFr4MkEAIyBz1VlJVHI7C84xU1pQIsr7xEWokhFX7yJABqeT38iW2Z59PvHy+Yv8uq/fGEGdxCNdW68ZGKpMj4rwf7y2Lksqt30BgnQRWheBarjgoebbDZtt2cPQg3MY4HuHDR9BIIOekYiQJ1g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733166053; c=relaxed/relaxed;
	bh=vRq6CiWGAFbQJlRrPCTE/kgEA5h6JZK3TIFIKsqRf3E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M7F+GecVHEZ822VmqoWxdOUiryNABbFe1QHvQdZ1ky22YEUhdpYfR6QzoXvIvARLAz1rcKIj8uwqFac2D4zWcY/cfPQWWA6gmVx3k8p6y5ympTEHf3uaQzLS+oI9nOPz5E0JLdzdADRNrWeMwRNJ5+CyMu23dIIM2JaOszafjRIJTSstYEmsmEt5fMPt+JE8JGgH4V4TG99ifBJgm3FAQpL3Mm2Lg/GbVUAuqcDdEDAQ0IdKyfN5NLT4KY3OcQcMm0OndnR7jkQkkdCArF1mlBXTmIfiLOGEkKjXsaEC3vk+oq3GXBqEDF9Id3Fr3c0MO8u/8SzwVzYWOkPSV9itbw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=ThF6iULN; dkim-atps=neutral; spf=pass (client-ip=159.69.126.157; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org) smtp.mailfrom=weissschuh.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=ThF6iULN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=weissschuh.net (client-ip=159.69.126.157; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org)
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y2CmG67B5z2ypD
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Dec 2024 06:00:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1733166037;
	bh=+arb4UAMXaf51SIDs7YdZ7RZB12zGnsK5LernLVB4+0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ThF6iULNZ7DQJIv5R4Hc+nABWuz2CXsroKR2IL96Lww5yAzqcqyOFzP2KUPsddAzL
	 6VPpbB9bQcdgMtx9kcgoMZO6ezbbY8jljpLWK+GEHv5+4v3OD9ZFn/Ho5WSfPUmpqx
	 UwDl45hT0Cmsv5u/Vj5Ui4aPXAfVpX/KxBsIVbgE=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 02 Dec 2024 20:00:39 +0100
Subject: [PATCH 4/5] firmware: google: gsmi: Use BIN_ATTR_ADMIN_WO() for
 bin_attribute definition
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241202-sysfs-const-bin_attr-admin_wo-v1-4-f489116210bf@weissschuh.net>
References: <20241202-sysfs-const-bin_attr-admin_wo-v1-0-f489116210bf@weissschuh.net>
In-Reply-To: <20241202-sysfs-const-bin_attr-admin_wo-v1-0-f489116210bf@weissschuh.net>
To: Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Tzung-Bi Shih <tzungbi@kernel.org>, Brian Norris <briannorris@chromium.org>, 
 Julius Werner <jwerner@chromium.org>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, chrome-platform@lists.linux.dev, 
 linux-scsi@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733166036; l=2521;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=+arb4UAMXaf51SIDs7YdZ7RZB12zGnsK5LernLVB4+0=;
 b=vs/2qmzMQ2i0kyAzZ0xLNPY2RWbz1iPcaFTdxlz5AdVN+D//QkatZ10EMOrH1vwujAOmcl20z
 TfIbn4l+sK0Cyv5rUwyZivbShgztDbnhu1XZhF5TMYQdLbZA2Ek09Ca
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Using the macro saves some lines of code and prepares the attribute for
the general constifications of struct bin_attributes.

While at it also constify the callback parameter.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/firmware/google/gsmi.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/firmware/google/gsmi.c b/drivers/firmware/google/gsmi.c
index 24e666d5c3d1a231d611ad3c20816c1d223a0dc5..cd946633ef727e826449a7b307a15a2c9f07d655 100644
--- a/drivers/firmware/google/gsmi.c
+++ b/drivers/firmware/google/gsmi.c
@@ -487,9 +487,9 @@ static const struct efivar_operations efivar_ops = {
 
 #endif /* CONFIG_EFI */
 
-static ssize_t eventlog_write(struct file *filp, struct kobject *kobj,
-			       struct bin_attribute *bin_attr,
-			       char *buf, loff_t pos, size_t count)
+static ssize_t append_to_eventlog_write(struct file *filp, struct kobject *kobj,
+					const struct bin_attribute *bin_attr,
+					char *buf, loff_t pos, size_t count)
 {
 	struct gsmi_set_eventlog_param param = {
 		.data_ptr = gsmi_dev.data_buf->address,
@@ -528,10 +528,7 @@ static ssize_t eventlog_write(struct file *filp, struct kobject *kobj,
 
 }
 
-static struct bin_attribute eventlog_bin_attr = {
-	.attr = {.name = "append_to_eventlog", .mode = 0200},
-	.write = eventlog_write,
-};
+static const BIN_ATTR_ADMIN_WO(append_to_eventlog, 0);
 
 static ssize_t gsmi_clear_eventlog_store(struct kobject *kobj,
 					 struct kobj_attribute *attr,
@@ -1017,7 +1014,7 @@ static __init int gsmi_init(void)
 	}
 
 	/* Setup eventlog access */
-	ret = sysfs_create_bin_file(gsmi_kobj, &eventlog_bin_attr);
+	ret = sysfs_create_bin_file(gsmi_kobj, &bin_attr_append_to_eventlog);
 	if (ret) {
 		printk(KERN_INFO "gsmi: Failed to setup eventlog");
 		goto out_err;
@@ -1049,7 +1046,7 @@ static __init int gsmi_init(void)
 	return 0;
 
 out_remove_bin_file:
-	sysfs_remove_bin_file(gsmi_kobj, &eventlog_bin_attr);
+	sysfs_remove_bin_file(gsmi_kobj, &bin_attr_append_to_eventlog);
 out_err:
 	kobject_put(gsmi_kobj);
 	gsmi_buf_free(gsmi_dev.param_buf);
@@ -1076,7 +1073,7 @@ static void __exit gsmi_exit(void)
 #endif
 
 	sysfs_remove_files(gsmi_kobj, gsmi_attrs);
-	sysfs_remove_bin_file(gsmi_kobj, &eventlog_bin_attr);
+	sysfs_remove_bin_file(gsmi_kobj, &bin_attr_append_to_eventlog);
 	kobject_put(gsmi_kobj);
 	gsmi_buf_free(gsmi_dev.param_buf);
 	gsmi_buf_free(gsmi_dev.data_buf);

-- 
2.47.1


