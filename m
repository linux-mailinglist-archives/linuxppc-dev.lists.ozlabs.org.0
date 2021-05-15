Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F0938160D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 May 2021 07:26:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fhv4q4gdhz3090
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 May 2021 15:26:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.208.45; helo=mail-ed1-f45.google.com;
 envelope-from=kswilczynski@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fhv3G3TWGz2xvP
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 May 2021 15:24:42 +1000 (AEST)
Received: by mail-ed1-f45.google.com with SMTP id f1so861147edt.4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 May 2021 22:24:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EQ3R2W3kyD0ic+vfu4svsuSqjX5xIeVtIEqsI3c2288=;
 b=TfZMKNx6gjgkg6XUHyQZ6HEOVGnstsKHo6O1b5VK4N2lKbV+/V+6gk4icMMNI8IN8N
 X7jJoi2PpVx5ypl9n2mbua60QIf5jk3qp5ecPn/7q3/s5r+6NCCwQbSCM6uU6g6RSpGG
 xHo8xJIIEPpLlg6WEkp6fyEbKO7GKlzPxdVqTep9hhASOGL5+ozoNadtiMemZlR2SGca
 LejPAhZZjoMS/u9O5JluiPbZNCFvNUw1XG80tRZina6+if4lnybss2mkJLGV42nCzI3M
 eTrkrIgXb2xeaV8HVEtWGbVwQAxHI57dOTb5MXmwAiRneXpcNPcQpVEnq0Cv2ASqwPmp
 hY9g==
X-Gm-Message-State: AOAM53139v+QCQBVkHvzXm7+/bbJb+gKeLdIOplJQgJG68n+v1Sr94wb
 jskMRzE1ldgWD7Xy8nU1xe8=
X-Google-Smtp-Source: ABdhPJxnsAptxOx/HBJpYKJDCOzTTrrz2+pFB3BqgI1f0hBvz5p50K52vu7dJoKs7QYOOJjk4VYp9w==
X-Received: by 2002:a05:6402:100c:: with SMTP id
 c12mr42219916edu.165.1621056279708; 
 Fri, 14 May 2021 22:24:39 -0700 (PDT)
Received: from workstation.lan ([95.155.85.46])
 by smtp.gmail.com with ESMTPSA id kt21sm4821487ejb.5.2021.05.14.22.24.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 22:24:39 -0700 (PDT)
From: =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>
To: Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH v2 04/14] PCI/MSI: Use sysfs_emit() and sysfs_emit_at() in
 "show" functions
Date: Sat, 15 May 2021 05:24:24 +0000
Message-Id: <20210515052434.1413236-4-kw@linux.com>
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
 drivers/pci/msi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/msi.c b/drivers/pci/msi.c
index 217dc9f0231f..dbfec59dfe41 100644
--- a/drivers/pci/msi.c
+++ b/drivers/pci/msi.c
@@ -465,8 +465,8 @@ static ssize_t msi_mode_show(struct device *dev, struct device_attribute *attr,
 
 	entry = irq_get_msi_desc(irq);
 	if (entry)
-		return sprintf(buf, "%s\n",
-				entry->msi_attrib.is_msix ? "msix" : "msi");
+		return sysfs_emit(buf, "%s\n",
+				  entry->msi_attrib.is_msix ? "msix" : "msi");
 
 	return -ENODEV;
 }
-- 
2.31.1

