Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F00C133DB6A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 18:51:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F0LT709Pjz3btQ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Mar 2021 04:51:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=merlin.20170209 header.b=zbcX7sKZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1234::107; helo=merlin.infradead.org;
 envelope-from=geoff@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=merlin.20170209 header.b=zbcX7sKZ; 
 dkim-atps=neutral
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1234::107])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F0LSK347Nz30Dj
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Mar 2021 04:51:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Date:Cc:To:Subject:From:References:
 In-Reply-To:Message-Id:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=x6hWPRl0+0M3Ou5Emh4Gg2yIVHa8v6X3La+5p0A4C/4=; b=zbcX7sKZ3DC/WMmp6IPF1etMqB
 Xycum6g6rtrSWJU/m1xSEdvNKTilZhwEi4DFkgPXNbhfJw5xKd/TqpPLFfvvgCJ2xrDVY5USGNboY
 IEgxUCYGoxvlpSLSQxXqWu178zsGz3J1yhGWsWNA8C3mvDN9etUs6cch4pcPCGetbz7DYiZmQCrep
 viw8rVkn5rc3oK00ogvwt4092reUw5dbsgixCuXutKphAK3/BswjxwrGZUXNjLIeKEPgNIddSik8z
 1L9YRvlToauG8DjV20cW1UOsaofKzglVux12QX3cTuac2Lkp5mg5U58yrrs+n1Hik+rvYOBQqOLtk
 Ffzafz6g==;
Received: from geoff by merlin.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1lMDqV-001UqX-5c; Tue, 16 Mar 2021 17:51:07 +0000
Message-Id: <f5d02dfc1d9f73d2344b7661707a3efe94c06362.1615916650.git.geoff@infradead.org>
In-Reply-To: <cover.1615916650.git.geoff@infradead.org>
References: <cover.1615916650.git.geoff@infradead.org>
From: Geoff Levand <geoff@infradead.org>
Patch-Date: Sat, 13 Mar 2021 18:43:16 -0800
Subject: [PATCH v1 1/2] powerpc/ps3: Add firmware version to proc
To: Michael Ellerman <mpe@ellerman.id.au>
Date: Tue, 16 Mar 2021 17:51:07 +0000
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add a new proc FS entry /proc/ps3/firmware-version that exports the
PS3's firmware version.

The firmware version is available through an LV1 hypercall, and we've
been printing it to the boot log, but haven't provided an easy way for
user utilities to get it.

Signed-off-by: Geoff Levand <geoff@infradead.org>
---
 arch/powerpc/platforms/ps3/setup.c | 62 ++++++++++++++++++++++++++++--
 1 file changed, 59 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/ps3/setup.c b/arch/powerpc/platforms/ps3/setup.c
index e9ae5dd03593..c3c4cbf16632 100644
--- a/arch/powerpc/platforms/ps3/setup.c
+++ b/arch/powerpc/platforms/ps3/setup.c
@@ -13,6 +13,7 @@
 #include <linux/console.h>
 #include <linux/export.h>
 #include <linux/memblock.h>
+#include <linux/proc_fs.h>
 
 #include <asm/machdep.h>
 #include <asm/firmware.h>
@@ -36,6 +37,7 @@ DEFINE_MUTEX(ps3_gpu_mutex);
 EXPORT_SYMBOL_GPL(ps3_gpu_mutex);
 
 static union ps3_firmware_version ps3_firmware_version;
+static char ps3_firmware_version_str[16];
 
 void ps3_get_firmware_version(union ps3_firmware_version *v)
 {
@@ -182,6 +184,58 @@ static int ps3_set_dabr(unsigned long dabr, unsigned long dabrx)
 	return lv1_set_dabr(dabr, dabrx) ? -1 : 0;
 }
 
+static ssize_t ps3_fw_ver_read(struct file *file, char __user *buf, size_t size,
+	loff_t *ppos)
+{
+	ssize_t bytes = simple_read_from_buffer(buf, size, ppos,
+		ps3_firmware_version_str, strlen(ps3_firmware_version_str));
+
+	pr_debug("%s:%d: %zd bytes '%s'\n", __func__, __LINE__, bytes,
+	       ps3_firmware_version_str);
+
+	if (bytes < 0) {
+		pr_err("%s:%d: failed: %zd\n", __func__, __LINE__, bytes);
+		return bytes;
+	}
+
+	buf += bytes;
+	size -= bytes;
+
+	return bytes;
+}
+
+static int __init ps3_setup_proc(void)
+{
+	static const struct proc_ops proc_ops = {
+		.proc_read = ps3_fw_ver_read,
+		.proc_lseek = default_llseek,
+	};
+	struct proc_dir_entry *entry;
+
+	entry = proc_mkdir("ps3", NULL);
+
+	if (!entry) {
+		pr_err("%s:%d: failed.\n", __func__, __LINE__);
+		return 1;
+	}
+
+	entry = proc_create_data("ps3/firmware-version", S_IFREG | 0444, NULL,
+		&proc_ops, NULL);
+
+	if (!entry) {
+		pr_err("%s:%d: failed.\n", __func__, __LINE__);
+		return 1;
+	}
+
+	proc_set_size(entry, strlen(ps3_firmware_version_str));
+
+	pr_debug("%s:%d: '%s' = %zd bytes\n", __func__, __LINE__,
+		ps3_firmware_version_str, strlen(ps3_firmware_version_str));
+
+	return 0;
+}
+core_initcall(ps3_setup_proc);
+
 static void __init ps3_setup_arch(void)
 {
 	u64 tmp;
@@ -190,9 +244,11 @@ static void __init ps3_setup_arch(void)
 
 	lv1_get_version_info(&ps3_firmware_version.raw, &tmp);
 
-	printk(KERN_INFO "PS3 firmware version %u.%u.%u\n",
-	       ps3_firmware_version.major, ps3_firmware_version.minor,
-	       ps3_firmware_version.rev);
+	snprintf(ps3_firmware_version_str, sizeof(ps3_firmware_version_str),
+		"%u.%u.%u", ps3_firmware_version.major,
+		ps3_firmware_version.minor, ps3_firmware_version.rev);
+
+	printk(KERN_INFO "PS3 firmware version %s\n", ps3_firmware_version_str);
 
 	ps3_spu_set_platform();
 
-- 
2.25.1


