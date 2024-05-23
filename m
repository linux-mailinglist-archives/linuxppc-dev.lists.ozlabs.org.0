Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id CAF108CD0EF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2024 13:11:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VlQMx615Bz78nq
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2024 21:06:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wunner.de (client-ip=176.9.242.54; helo=mailout3.hostsharing.net; envelope-from=lukas@wunner.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 343 seconds by postgrey-1.37 at boromir; Thu, 23 May 2024 21:05:57 AEST
Received: from mailout3.hostsharing.net (mailout3.hostsharing.net [176.9.242.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VlQMT0QqGz3vYc
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 May 2024 21:05:57 +1000 (AEST)
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by mailout3.hostsharing.net (Postfix) with ESMTPS id BFDF41029124C;
	Thu, 23 May 2024 13:00:02 +0200 (CEST)
Received: from localhost (unknown [89.246.108.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by h08.hostsharing.net (Postfix) with ESMTPSA id 6AD8F603EE84;
	Thu, 23 May 2024 13:00:02 +0200 (CEST)
X-Mailbox-Line: From 05f4290439a58730738a15b0c99cd8576c4aa0d9 Mon Sep 17 00:00:00 2001
Message-ID: <05f4290439a58730738a15b0c99cd8576c4aa0d9.1716461752.git.lukas@wunner.de>
In-Reply-To: <2024052334-nape-wanting-0a2a@gregkh>
References: <2024052334-nape-wanting-0a2a@gregkh>
From: Lukas Wunner <lukas@wunner.de>
Date: Thu, 23 May 2024 13:00:00 +0200
Subject: [PATCH] sysfs: Unbreak the build around sysfs_bin_attr_simple_read()
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>
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
Cc: intel-gvt-dev@lists.freedesktop.org, linux-efi@vger.kernel.org, Zhi Wang <zhi.wang.linux@gmail.com>, linux-pm@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>, Zhenyu Wang <zhenyuw@linux.intel.com>, linux-acpi@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>, Jean Delvare <jdelvare@suse.com>, linuxppc-dev@lists.ozlabs.org, Ard Biesheuvel <ardb@kernel.org>, linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Günter reports build breakage for m68k "m5208evb_defconfig" plus
CONFIG_BLK_DEV_INITRD=y caused by commit 66bc1a173328 ("treewide:
Use sysfs_bin_attr_simple_read() helper").

The defconfig disables CONFIG_SYSFS, so sysfs_bin_attr_simple_read()
is not compiled into the kernel.  But init/initramfs.c references
that function in the initializer of a struct bin_attribute.

Add an empty static inline to avoid the build breakage.

Fixes: 66bc1a173328 ("treewide: Use sysfs_bin_attr_simple_read() helper")
Reported-by: Guenter Roeck <linux@roeck-us.net>
Closes: https://lore.kernel.org/r/e12b0027-b199-4de7-b83d-668171447ccc@roeck-us.net
Signed-off-by: Lukas Wunner <lukas@wunner.de>
---
 include/linux/sysfs.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/linux/sysfs.h b/include/linux/sysfs.h
index a7d725fbf739..c4e64dc11206 100644
--- a/include/linux/sysfs.h
+++ b/include/linux/sysfs.h
@@ -750,6 +750,15 @@ static inline int sysfs_emit_at(char *buf, int at, const char *fmt, ...)
 {
 	return 0;
 }
+
+static inline ssize_t sysfs_bin_attr_simple_read(struct file *file,
+						 struct kobject *kobj,
+						 struct bin_attribute *attr,
+						 char *buf, loff_t off,
+						 size_t count)
+{
+	return 0;
+}
 #endif /* CONFIG_SYSFS */
 
 static inline int __must_check sysfs_create_file(struct kobject *kobj,
-- 
2.43.0

