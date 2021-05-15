Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1431C381611
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 May 2021 07:26:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fhv5B0S4fz3cBs
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 May 2021 15:26:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.208.44; helo=mail-ed1-f44.google.com;
 envelope-from=kswilczynski@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fhv3J0FHlz2xvP
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 May 2021 15:24:43 +1000 (AEST)
Received: by mail-ed1-f44.google.com with SMTP id t15so828167edr.11
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 May 2021 22:24:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XaBjjWzOw5dvTDC+qJZK86V8BlRmiuqHS5dgLumUkUo=;
 b=inAVWLoOV895EekYGg3YvR1cdfblweYAbU1tzOnLC1hhwX8KIYvVBMlHkxSfzwGHLU
 mTUldGmlXHcrkdaJgxfwD2T6IXEe2Fb4e9LZStSTq9KfLTs8W/LBCGm/IHes5LGX4nAP
 cFq0Ie440STpJEf/HNPptvUyc26MvCAH5bKGBlqIVbEXhLNTiCgW3ujjyGyJPUIfpu4b
 FycH2uAVlWPOldGK75BgzhXvP0/hwZOW3jP9iNEaOBSVvyJuQVmyhiFC3ioDNFLvjuIr
 xVd/MXhOb2vA6iT3HnYvzmYu+Scfjo05dwXGp+6tE00zKb9hGMoFxG++NJWcA2rTut2x
 l32A==
X-Gm-Message-State: AOAM532nzdM+K2ptSgRtc45OyO+0o2Ixn51ofl+Zi7c3p+M5l3pYmwgV
 7fJslrNYofhXpFTal13OsNo=
X-Google-Smtp-Source: ABdhPJyAvW2Dm++VEmuqwcgqr9Jm9cUso1ruNLB2gDuMwnIl6aOLUg/209jLCyYGsCqG4kFGPH3syQ==
X-Received: by 2002:a05:6402:4392:: with SMTP id
 o18mr20003141edc.58.1621056280892; 
 Fri, 14 May 2021 22:24:40 -0700 (PDT)
Received: from workstation.lan ([95.155.85.46])
 by smtp.gmail.com with ESMTPSA id kt21sm4821487ejb.5.2021.05.14.22.24.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 22:24:40 -0700 (PDT)
From: =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>
To: Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH v2 05/14] PCI/IOV: Use sysfs_emit() and sysfs_emit_at() in
 "show" functions
Date: Sat, 15 May 2021 05:24:25 +0000
Message-Id: <20210515052434.1413236-5-kw@linux.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210515052434.1413236-1-kw@linux.com>
References: <20210515052434.1413236-1-kw@linux.com>
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
 linuxppc-dev@lists.ozlabs.org, Vidya Sagar <vidyas@nvidia.com>,
 Oliver O'Halloran <oohall@gmail.com>, Joe Perches <joe@perches.com>,
 Paul Mackerras <paulus@samba.org>,
 Kurt Schwemmer <kurt.schwemmer@microsemi.com>,
 Logan Gunthorpe <logang@deltatee.com>,
 Xiongfeng Wang <wangxiongfeng2@huawei.com>
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

