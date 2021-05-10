Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 944B8377AF2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 May 2021 06:16:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FdnnK42LKz3bnR
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 May 2021 14:16:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.208.46; helo=mail-ed1-f46.google.com;
 envelope-from=kswilczynski@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fdnkf55b9z2yRX
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 May 2021 14:14:34 +1000 (AEST)
Received: by mail-ed1-f46.google.com with SMTP id v5so6018183edc.8
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 09 May 2021 21:14:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NDGawuhAJJmz73B7uj32A5EHuzQVuuXCnB1idlmDenc=;
 b=YumWkW9gfMLgwMCSWB9A9/wXHIsj2I0zIjWlxCrlpcqru+yVbMheyBixAfMTy/k5bg
 OuBKwJ3dR0ZclkeO+ZdbQJHvLbJmY37OwV7FObq0Z/J1VUfgmO99ZIpELgCW2Ec5tkkf
 EbKqPbv/IxToK4s7ObyiGCGzbew6pe6ZQlD8y4+0y/diwMKrQacpTTDuNk35RTUU2FPB
 l9dJllAmSJMowmpyI0Bi3Mt8mbzYDKH6nmeaRz6UaiBnMwcmhpH8AayvBs98jUPq9uyr
 suYGEl/m8brnI3wv31Ygmda3CKwFXbz/8dSvQw6NMQgOE0nc0SwjpPzx0hfMPWGuX9Mh
 t3iQ==
X-Gm-Message-State: AOAM531L+JdIrXjpzqW/7Eqy9c7cn4qOqds8BBtbrL5bon7TxnhW4Ytc
 sZv21a/L5yKnrT8xvqGSIgs=
X-Google-Smtp-Source: ABdhPJw8BjAeTOvXx1PzuicEvr2+9Hf6xbz/9p3ioUyMet+u4++O7hAY0Cmr1uZkz9NsrtS4fa+y9Q==
X-Received: by 2002:a05:6402:702:: with SMTP id
 w2mr12541384edx.85.1620620072032; 
 Sun, 09 May 2021 21:14:32 -0700 (PDT)
Received: from workstation.lan ([95.155.85.46])
 by smtp.gmail.com with ESMTPSA id e4sm8165006ejh.98.2021.05.09.21.14.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 May 2021 21:14:31 -0700 (PDT)
From: =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>
To: Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH 07/11] PCI/ASPM: Use sysfs_emit() and sysfs_emit_at() in
 "show" functions
Date: Mon, 10 May 2021 04:14:20 +0000
Message-Id: <20210510041424.233565-7-kw@linux.com>
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

