Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C5738161F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 May 2021 07:26:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fhv5s60cBz3bvT
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 May 2021 15:26:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.208.52; helo=mail-ed1-f52.google.com;
 envelope-from=kswilczynski@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fhv3K736Cz2yWr
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 May 2021 15:24:45 +1000 (AEST)
Received: by mail-ed1-f52.google.com with SMTP id di13so870838edb.2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 May 2021 22:24:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NDGawuhAJJmz73B7uj32A5EHuzQVuuXCnB1idlmDenc=;
 b=TvVlWAkUEkLcDcotYAbAHiKgQeEo6nXfj4W4MOaWJnpV6E01KfkRUuV6kL9jF1h0Wl
 zapOhlUN6/PmowdTfXcQysUqgNSj1ZlIQT6Bko50z2sUWc7RrBUYFEHAIxKH7+oLfpKb
 nG9HVIMmf+T573Z9XIRt3MbPfROA0xvXk2Rre3Wf4kJUZGWbzyeNbZa3YWrzRlBQOoAY
 r8PrMia1gZ99wj8FmP56sajQN7gEitplC0vs1yKeEGwIpyjcJ1qZAcrwo9QFma1NgR5R
 Ucy+UnuDTwKmX0aqoMlUoinrk0XZyAojYFMFCCU/tknYG2Uo1FzLRp24NO/lwEmPsPqk
 N0cA==
X-Gm-Message-State: AOAM531etf81a0EsqOQ2ZollHrtnKx4nMmQbJjMTzTuiLXNLJ4GwJbpb
 VouVBzzpv94/GQLTaddixvE=
X-Google-Smtp-Source: ABdhPJzcnqJKKGPYI8WdNfgX818BwDGlEuupjGLdvu+Xy2bDDyUqLFOB8dxZzlqJlTMV6KHDrrBVZQ==
X-Received: by 2002:a50:fe8c:: with SMTP id d12mr60525536edt.336.1621056282857; 
 Fri, 14 May 2021 22:24:42 -0700 (PDT)
Received: from workstation.lan ([95.155.85.46])
 by smtp.gmail.com with ESMTPSA id kt21sm4821487ejb.5.2021.05.14.22.24.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 22:24:42 -0700 (PDT)
From: =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>
To: Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH v2 07/14] PCI/ASPM: Use sysfs_emit() and sysfs_emit_at() in
 "show" functions
Date: Sat, 15 May 2021 05:24:27 +0000
Message-Id: <20210515052434.1413236-7-kw@linux.com>
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
 drivers/pci/pcie/aspm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/pcie/aspm.c b/drivers/pci/pcie/aspm.c
index ac0557a305af..013a47f587ce 100644
--- a/drivers/pci/pcie/aspm.c
+++ b/drivers/pci/pcie/aspm.c
@@ -1208,7 +1208,7 @@ static ssize_t aspm_attr_show_common(struct device *dev,
 	struct pci_dev *pdev = to_pci_dev(dev);
 	struct pcie_link_state *link = pcie_aspm_get_link(pdev);
 
-	return sprintf(buf, "%d\n", (link->aspm_enabled & state) ? 1 : 0);
+	return sysfs_emit(buf, "%d\n", (link->aspm_enabled & state) ? 1 : 0);
 }
 
 static ssize_t aspm_attr_store_common(struct device *dev,
@@ -1265,7 +1265,7 @@ static ssize_t clkpm_show(struct device *dev,
 	struct pci_dev *pdev = to_pci_dev(dev);
 	struct pcie_link_state *link = pcie_aspm_get_link(pdev);
 
-	return sprintf(buf, "%d\n", link->clkpm_enabled);
+	return sysfs_emit(buf, "%d\n", link->clkpm_enabled);
 }
 
 static ssize_t clkpm_store(struct device *dev,
-- 
2.31.1

