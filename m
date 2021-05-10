Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 166AD377AEF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 May 2021 06:15:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FdnmD0Zhyz303M
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 May 2021 14:15:56 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fdnkc3Sdgz2yRX
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 May 2021 14:14:31 +1000 (AEST)
Received: by mail-ed1-f46.google.com with SMTP id v5so6018072edc.8
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 09 May 2021 21:14:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EQ3R2W3kyD0ic+vfu4svsuSqjX5xIeVtIEqsI3c2288=;
 b=Yhe7gn7VkDNGlyZ4G6AZbXMXdaBg2HHld64AmG79Yb+VO6wG+AqvWw++enixtjXdza
 zCjx/RYaqXNvKduNmqc1cMWmyWxpOBGjso0vB0YlQE3kL3ag+d/rVj8eGHgVd01alQXf
 N6sMRH6A9mjxQAhJEgGo8SC9JjuaYRP9uZ0IkbFJk0y0/q5NSGXshxtfmTBZZlckH9uz
 ojTkvdpGJcGL+4ltOQV0coRoRg3b8v8dMRhd+lBSs+wEvBaSwzeMDpHIL1Ag853fL3LI
 bUE7u3NHrRlNPmt7ZFt73Tcszu1UxBxKnzguGhvSk5nYOP0EDznzk++74DkgD1JUFYIU
 x6ng==
X-Gm-Message-State: AOAM530Snx1IvSnXNJl7VUsNYLLhPTmj/xoa2EJpcsx76ooGjufY4dmU
 fMTQvYp+EoIKvDaqQxdR1Jc=
X-Google-Smtp-Source: ABdhPJxGPbzkNuqWvwE3N4swgt2IrBy7ztOMGWEg6AahkUY/MTcyDs1wVMEnZE8H2UTysbwnShbl9w==
X-Received: by 2002:a05:6402:1547:: with SMTP id
 p7mr27230413edx.319.1620620068876; 
 Sun, 09 May 2021 21:14:28 -0700 (PDT)
Received: from workstation.lan ([95.155.85.46])
 by smtp.gmail.com with ESMTPSA id e4sm8165006ejh.98.2021.05.09.21.14.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 May 2021 21:14:28 -0700 (PDT)
From: =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>
To: Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH 04/11] PCI/MSI: Use sysfs_emit() and sysfs_emit_at() in "show"
 functions
Date: Mon, 10 May 2021 04:14:17 +0000
Message-Id: <20210510041424.233565-4-kw@linux.com>
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

