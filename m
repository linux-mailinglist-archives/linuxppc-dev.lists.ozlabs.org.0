Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45239381623
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 May 2021 07:28:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fhv7Q1bvxz3dgg
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 May 2021 15:28:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.218.46; helo=mail-ej1-f46.google.com;
 envelope-from=kswilczynski@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fhv3Q12Vvz3099
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 May 2021 15:24:49 +1000 (AEST)
Received: by mail-ej1-f46.google.com with SMTP id l4so1554019ejc.10
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 May 2021 22:24:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O4j5vWKcpf1/fXayhp3JqEGpiyWg4HsxhuOtNpqA8wo=;
 b=VeTMxDL1Bu5gxtGwATYhMcRAGSv7bKWZf+u8/gL/O5Ffp66z68hv6CWe+E+7s7ga1M
 La8drgY8fpEz88hstxBmXS1+yl7MhqPSIePnRZnndjpjLCPVemZVFqXg/l48eJIgP31m
 yRAvWJGERRKfA76865bc6q7zYoYMwK3ZrcrDXG7ljov93EvW2kEwyEu6fiKj3SG5KfUF
 X0fYMHCOhNemPNt7csRBhnsYVGUk6TrK6hgqLKFl6VP6GcyfVifdip6RPf0hOmrY4NOj
 akWsFd49WddZL4kKQ4yihqcJcuMrQKT5p95U2BZdB8PyE0qA9Qgv6BS2tEoHelg+EMBT
 GGEQ==
X-Gm-Message-State: AOAM532v8SrCpGuqkajdFGF+ozXLMGfY6CqdnSdJmTTicF916XDvfGHr
 z+73udN/BqOzKl4PbxhroY6PFNSsGU7tAqu7
X-Google-Smtp-Source: ABdhPJzLfDPuTOgIrRqYiui9dXEh/ZAVy0flFmqCN22LEo3CBQNC7QrZjxzGfkQ+eGOXwrKfmjn3Vg==
X-Received: by 2002:a17:906:dc4c:: with SMTP id
 yz12mr2396563ejb.364.1621056286994; 
 Fri, 14 May 2021 22:24:46 -0700 (PDT)
Received: from workstation.lan ([95.155.85.46])
 by smtp.gmail.com with ESMTPSA id kt21sm4821487ejb.5.2021.05.14.22.24.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 22:24:46 -0700 (PDT)
From: =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>
To: Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH v2 11/14] PCI: shpchp: Use sysfs_emit() and sysfs_emit_at() in
 "show" functions
Date: Sat, 15 May 2021 05:24:31 +0000
Message-Id: <20210515052434.1413236-11-kw@linux.com>
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

