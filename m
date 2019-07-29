Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 259BF78984
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2019 12:18:29 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45xwcx3tP9zDqHw
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2019 20:18:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.208.196; helo=mail-lj1-f196.google.com;
 envelope-from=yefremov.denis@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.com
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
 [209.85.208.196])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45xwXQ3pHKzDqJk
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jul 2019 20:14:30 +1000 (AEST)
Received: by mail-lj1-f196.google.com with SMTP id k18so57989611ljc.11
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jul 2019 03:14:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Dpd4bG4LMHeAuXOdMrtoCn/QAeMyQrruUgZF75ZQCJ8=;
 b=h5a9EA8SKeckVKSfU4mxr2qtRDmZfJxkq9o+kI1u5q93qV8IqMNdyonKTlZWXsN3Go
 gqZatlzKm/v4bo816gyE8ZWCwpPHZqYV/KjveJARRNUPr2j9/+RmrtiFJKXx53y1Llax
 1qZgTsH8dJZ7SFdmw/WO548SQjlMvnWkuomWIfpmxoftDOAzd01L6LhiKLlpp+ma5Ycv
 6y4UehpKeVzS23+ebZ18NiwkmUwrirMr3SDNq1Ptri3sWSY94uPXhf2YODB9aRJWnxIS
 jG6hJqHTc8T2l30Cfmt4JY36Qj5Mc7ggRFTKk3nM1fx+PRNia5nYaJtSIuND4QXT378W
 pbRg==
X-Gm-Message-State: APjAAAVGJHqw57kdm2NTAqoJXy+bzn8exrBHvmkDnzpU9LXFepR3bT+1
 kHexEskbk1e9yA5bFExHN34=
X-Google-Smtp-Source: APXvYqwEk2DknbB7kclA3P32EP96BIIMax8pcdBk+oaWSWKN8ffIkF+Ld5QCSkXWovB+komF1DZEFA==
X-Received: by 2002:a2e:b4c9:: with SMTP id r9mr57348496ljm.196.1564395267211; 
 Mon, 29 Jul 2019 03:14:27 -0700 (PDT)
Received: from localhost.localdomain (broadband-188-32-48-208.ip.moscow.rt.ru.
 [188.32.48.208])
 by smtp.googlemail.com with ESMTPSA id y12sm11814834lfy.36.2019.07.29.03.14.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 29 Jul 2019 03:14:26 -0700 (PDT)
From: Denis Efremov <efremov@linux.com>
To: Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH v2 1/5] PCI: Convert pci_resource_to_user to a weak function
Date: Mon, 29 Jul 2019 13:13:57 +0300
Message-Id: <20190729101401.28068-2-efremov@linux.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190729101401.28068-1-efremov@linux.com>
References: <20190729101401.28068-1-efremov@linux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
 include/linux/pci.h | 12 ------------
 2 files changed, 8 insertions(+), 12 deletions(-)

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
index 9e700d9f9f28..dbdfdab1027b 100644
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
 void pci_resource_to_user(const struct pci_dev *dev, int bar,
 			  const struct resource *rsrc,
 			  resource_size_t *start, resource_size_t *end);
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
 
 /*
  * The world is not perfect and supplies us with broken PCI devices.
-- 
2.21.0

