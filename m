Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 97359781E2
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Jul 2019 23:39:16 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45xbmx6wxwzDqQt
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2019 07:39:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.208.193; helo=mail-lj1-f193.google.com;
 envelope-from=yefremov.denis@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.com
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
 [209.85.208.193])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45xZ5J4zJ5zDqQf
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jul 2019 06:23:16 +1000 (AEST)
Received: by mail-lj1-f193.google.com with SMTP id m23so56399636lje.12
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Jul 2019 13:23:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=svIZnH3LFn3SCsAf3hZ7NcuCk5uSXQPw/o877w6XO80=;
 b=apqzKxWadJ+bSWR1MqO6EEgMGbP0uy2TpFcLs00z1y01uYXVQxnE2mNY/5uteUqM7u
 gyV2zfWuUQxjrQentmP1HoAH53noBxIa4R7mhrRFvKsfz1zE/V5vyS4G1+uoGxO4quLq
 yTN/HMdDyOEpX8GRKZkkhmr1/GB8sFasbV/Py2JlfXtzL4W17IXqcRFnQAwrS2QMwZ1K
 96DNXCXbrAvmtDmjP4fmai9jWZdrAcYeBCu2zHAhQ3JmR1hCuTgGJMolDt+zF7Bq3nDb
 45A6aKOAsjqmft4gy5UpGYgV59m/ooynGAGRdmYDarxGKH0YtXFdekljK099cEbdT0w2
 LNDA==
X-Gm-Message-State: APjAAAXqDn7uDW0oHcD2VzWthdGfvJBRr5Z4GHU/QNQ+J7lWNoDNy9PQ
 6lGe90nkn5dFCDXAPf2ebog=
X-Google-Smtp-Source: APXvYqwiuHhdBpv2paJX0RbGJe6B84YT/HQ+J9VmSQk0WANqERsY6PXq3IkxDXDz0lW7cj/3nr+4EA==
X-Received: by 2002:a2e:2993:: with SMTP id p19mr54104888ljp.202.1564345393166; 
 Sun, 28 Jul 2019 13:23:13 -0700 (PDT)
Received: from localhost.localdomain (broadband-188-32-48-208.ip.moscow.rt.ru.
 [188.32.48.208])
 by smtp.googlemail.com with ESMTPSA id z17sm12395917ljc.37.2019.07.28.13.23.12
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 28 Jul 2019 13:23:12 -0700 (PDT)
From: Denis Efremov <efremov@linux.com>
To: Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH 1/5] PCI: Convert pci_resource_to_user to a weak function
Date: Sun, 28 Jul 2019 23:22:09 +0300
Message-Id: <20190728202213.15550-2-efremov@linux.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190728202213.15550-1-efremov@linux.com>
References: <20190728202213.15550-1-efremov@linux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 29 Jul 2019 07:36:11 +1000
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
Cc: Michal Simek <monstr@monstr.eu>, linux-pci@vger.kernel.org,
 linux-mips@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>,
 linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org,
 Paul Burton <paul.burton@mips.com>, Paul Mackerras <paulus@samba.org>,
 Denis Efremov <efremov@linux.com>, James Hogan <jhogan@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The patch turns pci_resource_to_user() to a weak function. Thus,
architecture-specific versions will automatically override the generic
one. This allows to remove the HAVE_ARCH_PCI_RESOURCE_TO_USER macro and
avoid the conditional compilation for this single function.

Signed-off-by: Denis Efremov <efremov@linux.com>
---
 drivers/pci/pci.c   |  8 ++++++++
 include/linux/pci.h | 18 +++---------------
 2 files changed, 11 insertions(+), 15 deletions(-)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 29ed5ec1ac27..f9dc7563a8b9 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -5932,6 +5932,14 @@ resource_size_t __weak pcibios_default_alignment(void)
 	return 0;
 }
 
+void __weak pci_resource_to_user(const struct pci_dev *dev, int bar,
+		const struct resource *rsrc, resource_size_t *start,
+		resource_size_t *end)
+{
+	*start = rsrc->start;
+	*end = rsrc->end;
+}
+
 #define RESOURCE_ALIGNMENT_PARAM_SIZE COMMAND_LINE_SIZE
 static char resource_alignment_param[RESOURCE_ALIGNMENT_PARAM_SIZE] = {0};
 static DEFINE_SPINLOCK(resource_alignment_lock);
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 9e700d9f9f28..1a19d0151b0a 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -1870,25 +1870,13 @@ static inline const char *pci_name(const struct pci_dev *pdev)
 	return dev_name(&pdev->dev);
 }
 
-
 /*
  * Some archs don't want to expose struct resource to userland as-is
  * in sysfs and /proc
  */
-#ifdef HAVE_ARCH_PCI_RESOURCE_TO_USER
-void pci_resource_to_user(const struct pci_dev *dev, int bar,
-			  const struct resource *rsrc,
-			  resource_size_t *start, resource_size_t *end);
-#else
-static inline void pci_resource_to_user(const struct pci_dev *dev, int bar,
-		const struct resource *rsrc, resource_size_t *start,
-		resource_size_t *end)
-{
-	*start = rsrc->start;
-	*end = rsrc->end;
-}
-#endif /* HAVE_ARCH_PCI_RESOURCE_TO_USER */
-
+void __weak pci_resource_to_user(const struct pci_dev *dev, int bar,
+				 const struct resource *rsrc,
+				 resource_size_t *start, resource_size_t *end);
 
 /*
  * The world is not perfect and supplies us with broken PCI devices.
-- 
2.21.0

