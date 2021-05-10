Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9D2377AF1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 May 2021 06:16:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fdnmz0SK9z3bnR
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 May 2021 14:16:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.218.53; helo=mail-ej1-f53.google.com;
 envelope-from=kswilczynski@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fdnkf1FGLz2yRX
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 May 2021 14:14:33 +1000 (AEST)
Received: by mail-ej1-f53.google.com with SMTP id m12so22437805eja.2
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 09 May 2021 21:14:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1ES7VTSt0mLOOOtyK1uMH/ESz61Of936G331zCp64LY=;
 b=HoJjrp2ViVZbRZAU44i7HKifwFakcCqHL+vysnRFsWrKXFIC7FmmghrdoLUogoYcCA
 FP4Je9EowHA15Z5pBc/plV7T0KDj1fKtraz1L0nylUAcJe70pGfeWGS3FCEHF1yUL/uN
 dKm4YUh6LokrKrA5V51othRjw4RokZ2+ouwppNxhtkUNBX4FhbvQtmnX8fZFcxJS+tmX
 QFCyAwVMETOG+2vvz0busFRlRb/cRSMFjPLSxRFWq0HcLx6qpOcqTC7Cf9O4zGgtwMP7
 fqttdTE2pNyVeKQEGgguv9BP4ryOZ29NzTIpFqLV/OYOTXBNi+Xbsy173Ea+VVJSj1+W
 6AJQ==
X-Gm-Message-State: AOAM530OcblCz9ObwI03msgPDGYFE+EqZkEfNI9hpxAr+O21IVmGkX4a
 Fy37I29O6BoBG2Ikwn+PItw=
X-Google-Smtp-Source: ABdhPJzvYeZB0gJ8Hd40URzIwWVyTAi3VNFUZmxcR/jxN5TjnMZNduHfimEhYp/9YuEV8weCphuT1w==
X-Received: by 2002:a17:906:35d2:: with SMTP id
 p18mr23354318ejb.339.1620620070916; 
 Sun, 09 May 2021 21:14:30 -0700 (PDT)
Received: from workstation.lan ([95.155.85.46])
 by smtp.gmail.com with ESMTPSA id e4sm8165006ejh.98.2021.05.09.21.14.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 May 2021 21:14:30 -0700 (PDT)
From: =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>
To: Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH 06/11] PCI/P2PDMA: Use sysfs_emit() and sysfs_emit_at() in
 "show" functions
Date: Mon, 10 May 2021 04:14:19 +0000
Message-Id: <20210510041424.233565-6-kw@linux.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210510041424.233565-1-kw@linux.com>
References: <20210510041424.233565-1-kw@linux.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, linux-pci@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Oliver O'Halloran <oohall@gmail.com>,
 Paul Mackerras <paulus@samba.org>,
 Kurt Schwemmer <kurt.schwemmer@microsemi.com>,
 Logan Gunthorpe <logang@deltatee.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The sysfs_emit() and sysfs_emit_at() functions were introduced to make
it less ambiguous which function is preferred when writing to the output
buffer in a device attribute's "show" callback [1].

Convert the PCI sysfs object "show" functions from sprintf(), snprintf()
and scnprintf() to sysfs_emit() and sysfs_emit_at() accordingly, as the
latter is aware of the PAGE_SIZE buffer and correctly returns the number
of bytes written into the buffer.

No functional change intended.

[1] Documentation/filesystems/sysfs.rst

Related to:
  commit ad025f8e46f3 ("PCI/sysfs: Use sysfs_emit() and sysfs_emit_at() in "show" functions")

Signed-off-by: Krzysztof Wilczyński <kw@linux.com>
---
 drivers/pci/p2pdma.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/p2pdma.c b/drivers/pci/p2pdma.c
index 196382630363..a1351b3e2c4c 100644
--- a/drivers/pci/p2pdma.c
+++ b/drivers/pci/p2pdma.c
@@ -53,7 +53,7 @@ static ssize_t size_show(struct device *dev, struct device_attribute *attr,
 	if (pdev->p2pdma->pool)
 		size = gen_pool_size(pdev->p2pdma->pool);
 
-	return scnprintf(buf, PAGE_SIZE, "%zd\n", size);
+	return sysfs_emit(buf, "%zd\n", size);
 }
 static DEVICE_ATTR_RO(size);
 
@@ -66,7 +66,7 @@ static ssize_t available_show(struct device *dev, struct device_attribute *attr,
 	if (pdev->p2pdma->pool)
 		avail = gen_pool_avail(pdev->p2pdma->pool);
 
-	return scnprintf(buf, PAGE_SIZE, "%zd\n", avail);
+	return sysfs_emit(buf, "%zd\n", avail);
 }
 static DEVICE_ATTR_RO(available);
 
@@ -75,8 +75,7 @@ static ssize_t published_show(struct device *dev, struct device_attribute *attr,
 {
 	struct pci_dev *pdev = to_pci_dev(dev);
 
-	return scnprintf(buf, PAGE_SIZE, "%d\n",
-			 pdev->p2pdma->p2pmem_published);
+	return sysfs_emit(buf, "%d\n", pdev->p2pdma->p2pmem_published);
 }
 static DEVICE_ATTR_RO(published);
 
-- 
2.31.1

