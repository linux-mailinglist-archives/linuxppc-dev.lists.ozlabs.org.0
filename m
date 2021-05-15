Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C786738161B
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 May 2021 07:26:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fhv5W68m5z3cQY
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 May 2021 15:26:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.208.43; helo=mail-ed1-f43.google.com;
 envelope-from=kswilczynski@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fhv3K0lcQz2xvP
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 May 2021 15:24:44 +1000 (AEST)
Received: by mail-ed1-f43.google.com with SMTP id r11so817482edt.13
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 May 2021 22:24:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1ES7VTSt0mLOOOtyK1uMH/ESz61Of936G331zCp64LY=;
 b=ZyP1U3R892i7BLAxgHhmvTd7I9NMgi8cjyHtC5tQ19m7mntwN7hBKWV6kqNHJzy5/L
 +7c4tbbgIiK1RkIrc7jP14vwvhw+c1HZb3IlopzuL9gVVewSts7fAkuzQgAaPJ/bUo/n
 SmsEBtpV/t3sH4e9UHyZQahN2DUvp8StmCl8kjHfbss2aLlqZRx0VK5lNL5qMKSZhyo/
 c6Mg1/GKgSHbKD2T6roNLAV7zieNRks2KOzWPm3n3w10LNZf6669GnFIIHNnADcaPJmC
 +N2Um7WDqcT5Ft2tgnPCF5jfeTQcHmMY1lHrUkwYYBGC46M/T+Lqt+jfDWWEa7q4BpAQ
 BPPA==
X-Gm-Message-State: AOAM531NRurdWodBwTEiRBZiSuB45UKjQ8KIbxtNrsqHmsFurByUt0YE
 dAscKyoBdvkcgXYGSGuygEw=
X-Google-Smtp-Source: ABdhPJygPIcpBCKLUs50yfnaIlQr7YwzdjdoLmzwNRzphOsHpcVXycakggcgTJ5RAMyt0x096OU7mw==
X-Received: by 2002:aa7:d893:: with SMTP id u19mr15024467edq.258.1621056281879; 
 Fri, 14 May 2021 22:24:41 -0700 (PDT)
Received: from workstation.lan ([95.155.85.46])
 by smtp.gmail.com with ESMTPSA id kt21sm4821487ejb.5.2021.05.14.22.24.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 22:24:41 -0700 (PDT)
From: =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>
To: Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH v2 06/14] PCI/P2PDMA: Use sysfs_emit() and sysfs_emit_at() in
 "show" functions
Date: Sat, 15 May 2021 05:24:26 +0000
Message-Id: <20210515052434.1413236-6-kw@linux.com>
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

