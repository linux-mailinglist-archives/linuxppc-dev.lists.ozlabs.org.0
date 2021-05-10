Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F3E377AF0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 May 2021 06:16:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fdnmb5Vt6z3cFk
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 May 2021 14:16:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.218.45; helo=mail-ej1-f45.google.com;
 envelope-from=kswilczynski@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fdnkd2kNYz2yRX
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 May 2021 14:14:32 +1000 (AEST)
Received: by mail-ej1-f45.google.com with SMTP id m12so22437774eja.2
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 09 May 2021 21:14:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XaBjjWzOw5dvTDC+qJZK86V8BlRmiuqHS5dgLumUkUo=;
 b=Wbf1aKBdykWQEbxOllZBszdh8/izpSwV4cKLqSLvhzvnymXsuJMxxbODbUU3EWJoCQ
 HgN+x26uJDyJP51E/57e1ORHc8dO0AuU72e7yYwDnCNzGeVrRAVQhT3YXOd5TpK1aVgu
 6XR5JTO0nbc9gifeMkaMfsouRCZtAlFnD83e5XsDYuouYg+W9A6VqN+MrJqhp7PVH3tL
 dDexJ/8jGaJjHvY4hs/yqqnu46oB/voBOcCagQXhh9fY9gYSV4wLp9GV2WXEqdCqMbM9
 2a2fRF2RjZZI+nwNV0Kx5DHCkkCLBalUh+IuWsV5uf5rnpnKPM1upJoVWTiPdR1GM7hr
 tBmA==
X-Gm-Message-State: AOAM530nztpiUFq5bNt8dQJ/fQLZ96+Bka0raoe1V9wvx56L3HAvor8g
 jg0UCKfBFxsyZt1SvpjV/SY=
X-Google-Smtp-Source: ABdhPJyVN7OmrxmLXunnm+i/g7DrV7L4eUJP8vMwGRDaV0dhHNlOxv65JKYxSA9NZu4UydDdD9JbhQ==
X-Received: by 2002:a17:906:5791:: with SMTP id
 k17mr23090058ejq.296.1620620069892; 
 Sun, 09 May 2021 21:14:29 -0700 (PDT)
Received: from workstation.lan ([95.155.85.46])
 by smtp.gmail.com with ESMTPSA id e4sm8165006ejh.98.2021.05.09.21.14.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 May 2021 21:14:29 -0700 (PDT)
From: =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>
To: Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH 05/11] PCI/IOV: Use sysfs_emit() and sysfs_emit_at() in "show"
 functions
Date: Mon, 10 May 2021 04:14:18 +0000
Message-Id: <20210510041424.233565-5-kw@linux.com>
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
 drivers/pci/iov.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/pci/iov.c b/drivers/pci/iov.c
index afc06e6ce115..a71258347323 100644
--- a/drivers/pci/iov.c
+++ b/drivers/pci/iov.c
@@ -346,7 +346,7 @@ static ssize_t sriov_totalvfs_show(struct device *dev,
 {
 	struct pci_dev *pdev = to_pci_dev(dev);
 
-	return sprintf(buf, "%u\n", pci_sriov_get_totalvfs(pdev));
+	return sysfs_emit(buf, "%u\n", pci_sriov_get_totalvfs(pdev));
 }
 
 static ssize_t sriov_numvfs_show(struct device *dev,
@@ -361,7 +361,7 @@ static ssize_t sriov_numvfs_show(struct device *dev,
 	num_vfs = pdev->sriov->num_VFs;
 	device_unlock(&pdev->dev);
 
-	return sprintf(buf, "%u\n", num_vfs);
+	return sysfs_emit(buf, "%u\n", num_vfs);
 }
 
 /*
@@ -435,7 +435,7 @@ static ssize_t sriov_offset_show(struct device *dev,
 {
 	struct pci_dev *pdev = to_pci_dev(dev);
 
-	return sprintf(buf, "%u\n", pdev->sriov->offset);
+	return sysfs_emit(buf, "%u\n", pdev->sriov->offset);
 }
 
 static ssize_t sriov_stride_show(struct device *dev,
@@ -444,7 +444,7 @@ static ssize_t sriov_stride_show(struct device *dev,
 {
 	struct pci_dev *pdev = to_pci_dev(dev);
 
-	return sprintf(buf, "%u\n", pdev->sriov->stride);
+	return sysfs_emit(buf, "%u\n", pdev->sriov->stride);
 }
 
 static ssize_t sriov_vf_device_show(struct device *dev,
@@ -453,7 +453,7 @@ static ssize_t sriov_vf_device_show(struct device *dev,
 {
 	struct pci_dev *pdev = to_pci_dev(dev);
 
-	return sprintf(buf, "%x\n", pdev->sriov->vf_device);
+	return sysfs_emit(buf, "%x\n", pdev->sriov->vf_device);
 }
 
 static ssize_t sriov_drivers_autoprobe_show(struct device *dev,
@@ -462,7 +462,7 @@ static ssize_t sriov_drivers_autoprobe_show(struct device *dev,
 {
 	struct pci_dev *pdev = to_pci_dev(dev);
 
-	return sprintf(buf, "%u\n", pdev->sriov->drivers_autoprobe);
+	return sysfs_emit(buf, "%u\n", pdev->sriov->drivers_autoprobe);
 }
 
 static ssize_t sriov_drivers_autoprobe_store(struct device *dev,
-- 
2.31.1

