Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E7439BC6D
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Jun 2021 17:59:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FxSBl6BRxz3bnn
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Jun 2021 01:59:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=merlin.20170209 header.b=p+0DeuMi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1234::107; helo=merlin.infradead.org;
 envelope-from=geoff@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=merlin.20170209 header.b=p+0DeuMi; 
 dkim-atps=neutral
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1234::107])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FxS9T4jRDz2yx2
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Jun 2021 01:58:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Date:Cc:To:Subject:From:References:
 In-Reply-To:Message-Id:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=DjliIZ4KNATRPcNKRTDcoYLO3XlB9lnfFLbkU6XUyQA=; b=p+0DeuMibFCjZv9RqyRjhikZsV
 c6w/hHUjSHbSAlwkfK2i0a760RRqfX9YJbXQQ2NDlFgMciV2DvRu2eWbXxHtVNkhGd0HtSuVhsOKl
 02wICKR3sz6XcT9LMu49Sd9XeG9J0+RBGV1CQOrn23g/rw+DdDEl1wtdyo09UZnSPlfVSL3u7TFrh
 IrSFMt8uu5zqKs7UQBU84GK2mcFvdPk5KX9+lWZKxwfnloOTlHgqO64+JwNYspa6uUlmxulnUZoWb
 c7je41X8YXxfyx4BApvJb39RJyPa6eNBI0c7bRtwipMOzR1R6D96MEHFLe2bgQaxNkSLBTI8diBeC
 qBsKAPMQ==;
Received: from geoff by merlin.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1lpCDJ-001R9K-Ir; Fri, 04 Jun 2021 15:58:25 +0000
Message-Id: <41509b2da647cd34b1331cc4756c8774b1e284eb.1622822173.git.geoff@infradead.org>
In-Reply-To: <cover.1622822173.git.geoff@infradead.org>
References: <cover.1622822173.git.geoff@infradead.org>
From: Geoff Levand <geoff@infradead.org>
Patch-Date: Fri, 4 Jun 2021 08:35:45 -0700
Subject: [PATCH v2 1/2] powerpc/ps3: Add firmware version to sysfs
To: Michael Ellerman <mpe@ellerman.id.au>
Date: Fri, 04 Jun 2021 15:58:25 +0000
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

Add a new sysfs entry /sys/firmware/ps3/fw-version that exports
the PS3's firmware version.

The firmware version is available through an LV1 hypercall, and we've
been printing it to the boot log, but haven't provided an easy way for
user utilities to get it.

Signed-off-by: Geoff Levand <geoff@infradead.org>
---
 arch/powerpc/platforms/ps3/setup.c | 43 +++++++++++++++++++++++++++---
 1 file changed, 40 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/ps3/setup.c b/arch/powerpc/platforms/ps3/setup.c
index e9ae5dd03593..3de9145c20bc 100644
--- a/arch/powerpc/platforms/ps3/setup.c
+++ b/arch/powerpc/platforms/ps3/setup.c
@@ -36,6 +36,7 @@ DEFINE_MUTEX(ps3_gpu_mutex);
 EXPORT_SYMBOL_GPL(ps3_gpu_mutex);
 
 static union ps3_firmware_version ps3_firmware_version;
+static char ps3_firmware_version_str[16];
 
 void ps3_get_firmware_version(union ps3_firmware_version *v)
 {
@@ -182,6 +183,40 @@ static int ps3_set_dabr(unsigned long dabr, unsigned long dabrx)
 	return lv1_set_dabr(dabr, dabrx) ? -1 : 0;
 }
 
+static ssize_t ps3_fw_version_show(struct kobject *kobj,
+	struct kobj_attribute *attr, char *buf)
+{
+	return sprintf(buf, "%s", ps3_firmware_version_str);
+}
+
+static int __init ps3_setup_sysfs(void)
+{
+	static struct kobj_attribute attr = __ATTR(fw-version, S_IRUGO,
+		ps3_fw_version_show, NULL);
+	static struct kobject *kobj;
+	int result;
+
+	kobj = kobject_create_and_add("ps3", firmware_kobj);
+
+	if (!kobj) {
+		pr_warn("%s:%d: kobject_create_and_add failed.\n", __func__,
+			__LINE__);
+		return -ENOMEM;
+	}
+
+	result = sysfs_create_file(kobj, &attr.attr);
+
+	if (result) {
+		pr_warn("%s:%d: sysfs_create_file failed.\n", __func__,
+			__LINE__);
+		kobject_put(kobj);
+		return -ENOMEM;
+	}
+
+	return 0;
+}
+core_initcall(ps3_setup_sysfs);
+
 static void __init ps3_setup_arch(void)
 {
 	u64 tmp;
@@ -190,9 +225,11 @@ static void __init ps3_setup_arch(void)
 
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


