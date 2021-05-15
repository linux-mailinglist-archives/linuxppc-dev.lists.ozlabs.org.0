Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1517438160C
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 May 2021 07:25:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fhv4S0TxBz3c1R
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 May 2021 15:25:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.218.42; helo=mail-ej1-f42.google.com;
 envelope-from=kswilczynski@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fhv3F74LGz2xvP
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 May 2021 15:24:41 +1000 (AEST)
Received: by mail-ej1-f42.google.com with SMTP id c20so1616062ejm.3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 May 2021 22:24:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VehsfxGHIqUkGXhHVF4getgAan5RIFGHUznH7GSNZdM=;
 b=rSiun98cQv1D6XXxbv7KJJtmWt+G4reeIWDWXv1JK/V0d6lPZsOqEQjNiENMQtwK9e
 ZGOWfi4VdPvu9GIzom+wrY1KpPrgGx0T0rZRyQT+O03Ufb2ycR41b/3i+tVDeLui0DLN
 6HEJccxBR08P9c3IA7aeSbCo9OZ+ISiBZsajC35sGelBwYwsQ4t78XKgppSRgbSz20Lu
 40AI0Y3YUOZvuuRCOPJPG3+7yfSD+McHmU+BH3We3zZEkdtj2qlCRDtnmyEc8KtGatcx
 YOK5HEQO/ihTuPCOKPf8kZgarVZAWTg7AcBSP/+iq0SezPk26FttZTd9ms1b+d6EZhbr
 k9tg==
X-Gm-Message-State: AOAM530NSkkrwoi9Vd1CUuD+yIyFxNfwG3t3x9yLFyt+6qmtRUA3I0MY
 zE1j+8oH72Zk2wa43SxOgx0=
X-Google-Smtp-Source: ABdhPJwCurKgC4IBTGpqO+Gv2xy5ReWjXsrDNYecNqjtR6Zj3eLiKAoAhFpYC0Pf+g0hsN/rgQPdOg==
X-Received: by 2002:a17:906:d145:: with SMTP id
 br5mr50562471ejb.452.1621056278643; 
 Fri, 14 May 2021 22:24:38 -0700 (PDT)
Received: from workstation.lan ([95.155.85.46])
 by smtp.gmail.com with ESMTPSA id kt21sm4821487ejb.5.2021.05.14.22.24.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 22:24:38 -0700 (PDT)
From: =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>
To: Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH v2 03/14] PCI: Use sysfs_emit() and sysfs_emit_at() in "show"
 functions
Date: Sat, 15 May 2021 05:24:23 +0000
Message-Id: <20210515052434.1413236-3-kw@linux.com>
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

Modify the function dsm_label_utf16s_to_utf8s() to directly return the
number of bytes written into the buffer so that the strlen() used later
to calculate the length of the buffer can be removed as it would no
longer be needed.

No functional change intended.

[1] Documentation/filesystems/sysfs.rst

Related to:
  commit ad025f8e46f3 ("PCI/sysfs: Use sysfs_emit() and sysfs_emit_at() in "show" functions")

Signed-off-by: Krzysztof Wilczyński <kw@linux.com>
---
 drivers/pci/pci-label.c | 18 ++++++++++--------
 drivers/pci/slot.c      | 16 ++++++++--------
 2 files changed, 18 insertions(+), 16 deletions(-)

diff --git a/drivers/pci/pci-label.c b/drivers/pci/pci-label.c
index c32f3b7540e8..000e169c7197 100644
--- a/drivers/pci/pci-label.c
+++ b/drivers/pci/pci-label.c
@@ -139,14 +139,17 @@ enum acpi_attr_enum {
 	ACPI_ATTR_INDEX_SHOW,
 };
 
-static void dsm_label_utf16s_to_utf8s(union acpi_object *obj, char *buf)
+static int dsm_label_utf16s_to_utf8s(union acpi_object *obj, char *buf)
 {
 	int len;
+
 	len = utf16s_to_utf8s((const wchar_t *)obj->buffer.pointer,
 			      obj->buffer.length,
 			      UTF16_LITTLE_ENDIAN,
 			      buf, PAGE_SIZE);
 	buf[len] = '\n';
+
+	return len;
 }
 
 static int dsm_get_label(struct device *dev, char *buf,
@@ -154,7 +157,7 @@ static int dsm_get_label(struct device *dev, char *buf,
 {
 	acpi_handle handle = ACPI_HANDLE(dev);
 	union acpi_object *obj, *tmp;
-	int len = -1;
+	int len = 0;
 
 	if (!handle)
 		return -1;
@@ -175,20 +178,19 @@ static int dsm_get_label(struct device *dev, char *buf,
 		 * this entry must return a null string.
 		 */
 		if (attr == ACPI_ATTR_INDEX_SHOW) {
-			scnprintf(buf, PAGE_SIZE, "%llu\n", tmp->integer.value);
+			len = sysfs_emit(buf, "%llu\n", tmp->integer.value);
 		} else if (attr == ACPI_ATTR_LABEL_SHOW) {
 			if (tmp[1].type == ACPI_TYPE_STRING)
-				scnprintf(buf, PAGE_SIZE, "%s\n",
-					  tmp[1].string.pointer);
+				len = sysfs_emit(buf, "%s\n",
+						 tmp[1].string.pointer);
 			else if (tmp[1].type == ACPI_TYPE_BUFFER)
-				dsm_label_utf16s_to_utf8s(tmp + 1, buf);
+				len = dsm_label_utf16s_to_utf8s(tmp + 1, buf);
 		}
-		len = strlen(buf) > 0 ? strlen(buf) : -1;
 	}
 
 	ACPI_FREE(obj);
 
-	return len;
+	return len > 0 ? len : -1;
 }
 
 static ssize_t label_show(struct device *dev, struct device_attribute *attr,
diff --git a/drivers/pci/slot.c b/drivers/pci/slot.c
index d627dd9179b4..7487e8f8f13f 100644
--- a/drivers/pci/slot.c
+++ b/drivers/pci/slot.c
@@ -39,19 +39,19 @@ static const struct sysfs_ops pci_slot_sysfs_ops = {
 static ssize_t address_read_file(struct pci_slot *slot, char *buf)
 {
 	if (slot->number == 0xff)
-		return sprintf(buf, "%04x:%02x\n",
-				pci_domain_nr(slot->bus),
-				slot->bus->number);
+		return sysfs_emit(buf, "%04x:%02x\n",
+				  pci_domain_nr(slot->bus),
+				  slot->bus->number);
 	else
-		return sprintf(buf, "%04x:%02x:%02x\n",
-				pci_domain_nr(slot->bus),
-				slot->bus->number,
-				slot->number);
+		return sysfs_emit(buf, "%04x:%02x:%02x\n",
+				  pci_domain_nr(slot->bus),
+				  slot->bus->number,
+				  slot->number);
 }
 
 static ssize_t bus_speed_read(enum pci_bus_speed speed, char *buf)
 {
-	return sprintf(buf, "%s\n", pci_speed_string(speed));
+	return sysfs_emit(buf, "%s\n", pci_speed_string(speed));
 }
 
 static ssize_t max_speed_read_file(struct pci_slot *slot, char *buf)
-- 
2.31.1

