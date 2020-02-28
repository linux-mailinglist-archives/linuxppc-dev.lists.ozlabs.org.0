Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE741730AB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Feb 2020 06:57:17 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48TJhp3dCpzDrFj
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Feb 2020 16:57:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1041;
 helo=mail-pj1-x1041.google.com; envelope-from=kernelfans@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=nsDMz9ir; dkim-atps=neutral
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48TJg60qQQzDrFC
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Feb 2020 16:55:43 +1100 (AEDT)
Received: by mail-pj1-x1041.google.com with SMTP id q39so845230pjc.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2020 21:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=js3ysuQSDsSYYbfEOGdF/3rYxV/cA5m/4enBvEKdfJc=;
 b=nsDMz9irko9D9uF/HaJP8LL8b3cjxJKMpK/0DBlM2fKtF+Yq5wZRUsIP1vI8ED5Yls
 X+BPlP38eyS78C0M3PWW2elyuIXLZSaxmcO1RqTAYdyVo/eNs6V0WjD0rfXUMgxHUunz
 JBLzBdhbFDs8o6HLeyg5Ah2yCwiFFHVSnG4SXGUMCEmPrejKywXE/uk/ydD+uzE2Suhu
 1dALqwJw/tkBRqGgjqBUz5xcx83Q1T/mINnthdV40DM/pFKG/ItH76kgOcJKkCnoLshY
 HsaX63AjOlO1cfNkUlVzmqaqeqHLvUpeNu/LepoZYPVSQyHoUwl8aaHa3zr+LZMhw1yL
 wH9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=js3ysuQSDsSYYbfEOGdF/3rYxV/cA5m/4enBvEKdfJc=;
 b=oYXew9isizPVkSbojrxNPJscQ2cIrgLHfFOJMfkQaVdF8pc5dUwoWr9ohKk84o6h6f
 /B3Vh3tcUS/lAhwQuO+xmWXOf+E5yCoV3WI8uY/XU97EkE5/PFTJp0H1KsvTtUcbf6cn
 XvQ0Llt2351zhZmrNnIzR5ghrHLvGTx5rZlYcCKNoNEqKsL7DIjE3r0XwqJRYLCjXvnr
 E1HMcobkN49BmBKoVfHeoTGqZbUysP6MgMRJCdmiD80irOd8nnDy+d7lxlXgLCkzE6wl
 VS2tCIzloL9sRJrZ9lHo49jLHAzaiij8GAWWQBAPiG4IKFr09Z+XPsDY9mynmB7Zc+Ww
 F72A==
X-Gm-Message-State: APjAAAXnsGNzY6bIssF824vU8SQfEN38yxY3qN1U/iAwHrEFkYyPwCVJ
 xnYIJef7pEMJoxwv5ocZLUKLC3E=
X-Google-Smtp-Source: APXvYqw9dx4nL+ZTDAodzbq1zP/Airc7sfbRP/FGrPG51Phq6gTqkTbeKdFwbTIJcMIN8EbmOMhdww==
X-Received: by 2002:a17:902:b215:: with SMTP id
 t21mr2504611plr.190.1582869341422; 
 Thu, 27 Feb 2020 21:55:41 -0800 (PST)
Received: from mylaptop.redhat.com ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id h4sm4350370pgq.20.2020.02.27.21.55.37
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 27 Feb 2020 21:55:40 -0800 (PST)
From: Pingfan Liu <kernelfans@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/3] powerpc/of: split out new_property() for reusing
Date: Fri, 28 Feb 2020 13:53:10 +0800
Message-Id: <1582869192-9284-1-git-send-email-kernelfans@gmail.com>
X-Mailer: git-send-email 2.7.5
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
Cc: kexec@lists.infradead.org, Pingfan Liu <kernelfans@gmail.com>,
 Paul Mackerras <paulus@samba.org>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>, Dan Williams <dan.j.williams@intel.com>,
 Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Since new_property() is used in several calling sites, splitting it out for
reusing.

To ease the review, although the split out part has coding style issue,
keeping it untouched and fixed in next patch.

Signed-off-by: Pingfan Liu <kernelfans@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Hari Bathini <hbathini@linux.ibm.com>
Cc: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
Cc: Oliver O'Halloran <oohall@gmail.com>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: kexec@lists.infradead.org
---
 arch/powerpc/include/asm/prom.h           |  2 ++
 arch/powerpc/kernel/Makefile              |  2 +-
 arch/powerpc/kernel/of_property.c         | 32 +++++++++++++++++++++++++++++++
 arch/powerpc/mm/drmem.c                   | 26 -------------------------
 arch/powerpc/platforms/pseries/reconfig.c | 26 -------------------------
 5 files changed, 35 insertions(+), 53 deletions(-)
 create mode 100644 arch/powerpc/kernel/of_property.c

diff --git a/arch/powerpc/include/asm/prom.h b/arch/powerpc/include/asm/prom.h
index 94e3fd5..02f7b1b 100644
--- a/arch/powerpc/include/asm/prom.h
+++ b/arch/powerpc/include/asm/prom.h
@@ -90,6 +90,8 @@ struct of_drc_info {
 extern int of_read_drc_info_cell(struct property **prop,
 			const __be32 **curval, struct of_drc_info *data);
 
+extern struct property *new_property(const char *name, const int length,
+		const unsigned char *value, struct property *last);
 
 /*
  * There are two methods for telling firmware what our capabilities are.
diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
index 157b014..23375fd 100644
--- a/arch/powerpc/kernel/Makefile
+++ b/arch/powerpc/kernel/Makefile
@@ -47,7 +47,7 @@ obj-y				:= cputable.o ptrace.o syscalls.o \
 				   signal.o sysfs.o cacheinfo.o time.o \
 				   prom.o traps.o setup-common.o \
 				   udbg.o misc.o io.o misc_$(BITS).o \
-				   of_platform.o prom_parse.o
+				   of_platform.o prom_parse.o of_property.o
 obj-$(CONFIG_PPC64)		+= setup_64.o sys_ppc32.o \
 				   signal_64.o ptrace32.o \
 				   paca.o nvram_64.o firmware.o note.o
diff --git a/arch/powerpc/kernel/of_property.c b/arch/powerpc/kernel/of_property.c
new file mode 100644
index 0000000..e56c832
--- /dev/null
+++ b/arch/powerpc/kernel/of_property.c
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include <linux/of.h>
+#include <linux/string.h>
+#include <linux/kernel.h>
+#include <linux/slab.h>
+
+struct property *new_property(const char *name, const int length,
+				     const unsigned char *value, struct property *last)
+{
+	struct property *new = kzalloc(sizeof(*new), GFP_KERNEL);
+
+	if (!new)
+		return NULL;
+
+	if (!(new->name = kstrdup(name, GFP_KERNEL)))
+		goto cleanup;
+	if (!(new->value = kmalloc(length + 1, GFP_KERNEL)))
+		goto cleanup;
+
+	memcpy(new->value, value, length);
+	*(((char *)new->value) + length) = 0;
+	new->length = length;
+	new->next = last;
+	return new;
+
+cleanup:
+	kfree(new->name);
+	kfree(new->value);
+	kfree(new);
+	return NULL;
+}
+
diff --git a/arch/powerpc/mm/drmem.c b/arch/powerpc/mm/drmem.c
index 85b088a..888227e 100644
--- a/arch/powerpc/mm/drmem.c
+++ b/arch/powerpc/mm/drmem.c
@@ -99,32 +99,6 @@ static void init_drconf_v2_cell(struct of_drconf_cell_v2 *dr_cell,
 
 extern int test_hotplug;
 
-static struct property *new_property(const char *name, const int length,
-				     const unsigned char *value, struct property *last)
-{
-	struct property *new = kzalloc(sizeof(*new), GFP_KERNEL);
-
-	if (!new)
-		return NULL;
-
-	if (!(new->name = kstrdup(name, GFP_KERNEL)))
-		goto cleanup;
-	if (!(new->value = kmalloc(length + 1, GFP_KERNEL)))
-		goto cleanup;
-
-	memcpy(new->value, value, length);
-	*(((char *)new->value) + length) = 0;
-	new->length = length;
-	new->next = last;
-	return new;
-
-cleanup:
-	kfree(new->name);
-	kfree(new->value);
-	kfree(new);
-	return NULL;
-}
-
 static int drmem_update_dt_v2(struct device_node *memory,
 			      struct property *prop)
 {
diff --git a/arch/powerpc/platforms/pseries/reconfig.c b/arch/powerpc/platforms/pseries/reconfig.c
index 7f7369f..8e5a2ba 100644
--- a/arch/powerpc/platforms/pseries/reconfig.c
+++ b/arch/powerpc/platforms/pseries/reconfig.c
@@ -165,32 +165,6 @@ static char * parse_next_property(char *buf, char *end, char **name, int *length
 	return tmp;
 }
 
-static struct property *new_property(const char *name, const int length,
-				     const unsigned char *value, struct property *last)
-{
-	struct property *new = kzalloc(sizeof(*new), GFP_KERNEL);
-
-	if (!new)
-		return NULL;
-
-	if (!(new->name = kstrdup(name, GFP_KERNEL)))
-		goto cleanup;
-	if (!(new->value = kmalloc(length + 1, GFP_KERNEL)))
-		goto cleanup;
-
-	memcpy(new->value, value, length);
-	*(((char *)new->value) + length) = 0;
-	new->length = length;
-	new->next = last;
-	return new;
-
-cleanup:
-	kfree(new->name);
-	kfree(new->value);
-	kfree(new);
-	return NULL;
-}
-
 static int do_add_node(char *buf, size_t bufsize)
 {
 	char *path, *end, *name;
-- 
2.7.5

