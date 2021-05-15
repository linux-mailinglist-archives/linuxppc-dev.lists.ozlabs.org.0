Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 89300381626
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 May 2021 07:29:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fhv8b4PsRz3dwk
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 May 2021 15:29:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.208.41; helo=mail-ed1-f41.google.com;
 envelope-from=kswilczynski@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fhv3T0vgdz3063
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 May 2021 15:24:52 +1000 (AEST)
Received: by mail-ed1-f41.google.com with SMTP id i13so838927edb.9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 May 2021 22:24:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l65J0VP8+dF+CzFmmf34XzBwKUAccEC4aN+sTYjEOtI=;
 b=KvxLsIIaWi0Jqn/6MKy8ZNgtOOny90lx1EnsVjhrYmTqhJJoO/embesJn/AFCV5kR2
 3bf29MFqan8qwAbD7+TS7ncBGbGqaoxl3WPSa9OrxkMNG4BoyeSg8h5V6zlQQXA0+25r
 IGZiOBNSOds9UfwYR9XARm/pZUgwNQoVNrTuT5oDHpwpwC6PhSz0TYebttO3zXmRw5s6
 /+5oUZr6YNjpgH5qxqx3k2kpHbjLFoCwXCPszwodBsVw0ef+usKrJ069PqM5WDfor/je
 TXMBFEPee8LOhcbivnvoIKjIMGUBfMrPkTStCRA/Rdm+MWC2xgjrgp6u6b+d90+vvLM/
 ynYQ==
X-Gm-Message-State: AOAM531lJaBZwb57EHT7+PzcUGnW0j0a/gnLGLKJvac0wtAaQTsvTnvN
 azMrw3RNx8ChGApHd/DQugs=
X-Google-Smtp-Source: ABdhPJxKOWt67s3c4arbmA4eCFVxbLX2nJU5TzBTB1JhkMEU3nW9uORpfOz85iSHSHEdXWViuNcVeA==
X-Received: by 2002:a50:fc0b:: with SMTP id i11mr61231380edr.259.1621056289994; 
 Fri, 14 May 2021 22:24:49 -0700 (PDT)
Received: from workstation.lan ([95.155.85.46])
 by smtp.gmail.com with ESMTPSA id kt21sm4821487ejb.5.2021.05.14.22.24.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 22:24:49 -0700 (PDT)
From: =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>
To: Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH v2 14/14] PCI/sysfs: Only show value when driver_override is
 not NULL
Date: Sat, 15 May 2021 05:24:34 +0000
Message-Id: <20210515052434.1413236-14-kw@linux.com>
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

Only expose the value of the "driver_override" variable through the
corresponding sysfs object when a value is actually set.

Signed-off-by: Krzysztof Wilczyński <kw@linux.com>
---
 drivers/pci/pci-sysfs.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
index 5d63df7c1820..4e9f582ca10f 100644
--- a/drivers/pci/pci-sysfs.c
+++ b/drivers/pci/pci-sysfs.c
@@ -580,10 +580,11 @@ static ssize_t driver_override_show(struct device *dev,
 				    struct device_attribute *attr, char *buf)
 {
 	struct pci_dev *pdev = to_pci_dev(dev);
-	ssize_t len;
+	ssize_t len = 0;
 
 	device_lock(dev);
-	len = sysfs_emit(buf, "%s\n", pdev->driver_override);
+	if (pdev->driver_override)
+		len = sysfs_emit(buf, "%s\n", pdev->driver_override);
 	device_unlock(dev);
 	return len;
 }
-- 
2.31.1

