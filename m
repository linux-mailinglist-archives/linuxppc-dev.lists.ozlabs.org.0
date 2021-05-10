Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 215D4377AF8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 May 2021 06:18:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fdnpq1X0dz3df5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 May 2021 14:18:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.218.50; helo=mail-ej1-f50.google.com;
 envelope-from=kswilczynski@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fdnkl0pdgz2yyF
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 May 2021 14:14:39 +1000 (AEST)
Received: by mail-ej1-f50.google.com with SMTP id a4so22442218ejk.1
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 09 May 2021 21:14:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O4j5vWKcpf1/fXayhp3JqEGpiyWg4HsxhuOtNpqA8wo=;
 b=a05q0gyiJEnlfy7BsYHfSLlF8xUGXE9+5QpMRTj0Bg0pDqkZGuRrOCr/k6QOOK/iWx
 R2vfx4AaqfFqZSxh8UuNOAvQzKk0idqJeA0iQgOW5HdgMQqjz+Osx9M0b8zBc7GiIUXI
 CxDBhAZqn8V6nKq/rRvzQQTAxIRE5b+dZ5xWN81YDvTFXDweBMMAJ6WRVHyAxCWJY4DI
 BTx5hW9H0qYBQyC7CcnCYwHjKdl2uhcxV+Y/lzWhaJsm7siUj1/9aexPJ8ioI4EHyzY1
 sR0L7bUN8Td+8ltu+egCzctTouhA14Sk/FN2RcDc5vDH1iPtdLx4wTNNWx5K1qAFM7/l
 p6aw==
X-Gm-Message-State: AOAM531j9LP1ff/rAH3y6GRQ4M0FvSDbMv/Bz3o33gV7B8ecu+YPkZ7o
 dkfDv6NhAVHOhMkt+ribaDw=
X-Google-Smtp-Source: ABdhPJxAMYMmdFA8LcrGyx+Esmofgetxmn7HIC4ymO123FV0i4E2XHOiD2QzhPJk97n5J1FaLHqY5A==
X-Received: by 2002:a17:907:100e:: with SMTP id
 ox14mr24169542ejb.484.1620620075998; 
 Sun, 09 May 2021 21:14:35 -0700 (PDT)
Received: from workstation.lan ([95.155.85.46])
 by smtp.gmail.com with ESMTPSA id e4sm8165006ejh.98.2021.05.09.21.14.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 May 2021 21:14:35 -0700 (PDT)
From: =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>
To: Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH 11/11] PCI: shpchp: Use sysfs_emit() and sysfs_emit_at() in
 "show" functions
Date: Mon, 10 May 2021 04:14:24 +0000
Message-Id: <20210510041424.233565-11-kw@linux.com>
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
 drivers/pci/hotplug/shpchp_sysfs.c | 38 +++++++++++++++++-------------
 1 file changed, 21 insertions(+), 17 deletions(-)

diff --git a/drivers/pci/hotplug/shpchp_sysfs.c b/drivers/pci/hotplug/shpchp_sysfs.c
index 45658bb5c554..64beed7a26be 100644
--- a/drivers/pci/hotplug/shpchp_sysfs.c
+++ b/drivers/pci/hotplug/shpchp_sysfs.c
@@ -24,50 +24,54 @@
 static ssize_t show_ctrl(struct device *dev, struct device_attribute *attr, char *buf)
 {
 	struct pci_dev *pdev;
-	char *out = buf;
 	int index, busnr;
 	struct resource *res;
 	struct pci_bus *bus;
+	size_t len = 0;
 
 	pdev = to_pci_dev(dev);
 	bus = pdev->subordinate;
 
-	out += sprintf(buf, "Free resources: memory\n");
+	len += sysfs_emit_at(buf, len, "Free resources: memory\n");
 	pci_bus_for_each_resource(bus, res, index) {
 		if (res && (res->flags & IORESOURCE_MEM) &&
 				!(res->flags & IORESOURCE_PREFETCH)) {
-			out += sprintf(out, "start = %8.8llx, length = %8.8llx\n",
-				       (unsigned long long)res->start,
-				       (unsigned long long)resource_size(res));
+			len += sysfs_emit_at(buf, len,
+					     "start = %8.8llx, length = %8.8llx\n",
+					     (unsigned long long)res->start,
+					     (unsigned long long)resource_size(res));
 		}
 	}
-	out += sprintf(out, "Free resources: prefetchable memory\n");
+	len += sysfs_emit_at(buf, len, "Free resources: prefetchable memory\n");
 	pci_bus_for_each_resource(bus, res, index) {
 		if (res && (res->flags & IORESOURCE_MEM) &&
 			       (res->flags & IORESOURCE_PREFETCH)) {
-			out += sprintf(out, "start = %8.8llx, length = %8.8llx\n",
-				       (unsigned long long)res->start,
-				       (unsigned long long)resource_size(res));
+			len += sysfs_emit_at(buf, len,
+					     "start = %8.8llx, length = %8.8llx\n",
+					     (unsigned long long)res->start,
+					     (unsigned long long)resource_size(res));
 		}
 	}
-	out += sprintf(out, "Free resources: IO\n");
+	len += sysfs_emit_at(buf, len, "Free resources: IO\n");
 	pci_bus_for_each_resource(bus, res, index) {
 		if (res && (res->flags & IORESOURCE_IO)) {
-			out += sprintf(out, "start = %8.8llx, length = %8.8llx\n",
-				       (unsigned long long)res->start,
-				       (unsigned long long)resource_size(res));
+			len += sysfs_emit_at(buf, len,
+					     "start = %8.8llx, length = %8.8llx\n",
+					     (unsigned long long)res->start,
+					     (unsigned long long)resource_size(res));
 		}
 	}
-	out += sprintf(out, "Free resources: bus numbers\n");
+	len += sysfs_emit_at(buf, len, "Free resources: bus numbers\n");
 	for (busnr = bus->busn_res.start; busnr <= bus->busn_res.end; busnr++) {
 		if (!pci_find_bus(pci_domain_nr(bus), busnr))
 			break;
 	}
 	if (busnr < bus->busn_res.end)
-		out += sprintf(out, "start = %8.8x, length = %8.8x\n",
-				busnr, (int)(bus->busn_res.end - busnr));
+		len += sysfs_emit_at(buf, len,
+				     "start = %8.8x, length = %8.8x\n",
+				     busnr, (int)(bus->busn_res.end - busnr));
 
-	return out - buf;
+	return len;
 }
 static DEVICE_ATTR(ctrl, S_IRUGO, show_ctrl, NULL);
 
-- 
2.31.1

