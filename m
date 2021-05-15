Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF81A38160B
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 May 2021 07:25:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fhv454h9nz3c0K
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 May 2021 15:25:25 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fhv3F1f6Sz2xvP
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 May 2021 15:24:40 +1000 (AEST)
Received: by mail-ed1-f45.google.com with SMTP id i13so838672edb.9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 May 2021 22:24:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3ZSUDlxK2gpwJ+aSZRfjJrhrQ1Sy5cBzVVlZ7n5R5NA=;
 b=COokUfYnYFMlQ3ak/fL3/QT3+aluWMVK3LESt8gLFD8L6kxOdCn4eqOxKDG9D2tt/k
 U41UjNo/oo/MrA2/SUfU8vxSC9/OmFp5MIoUP0+wWFh24eoinhcrAVQ0KoGy8yceCfWY
 wd3jPti1zKLr9tH/HPzMxkPCaMC6q9/ACSvAoGb5TXd28LIf0nUC2PjNB3clIubcG1s5
 zX7Srf12qz79YAHTaVH/cyiWc5fTIC4hGyT4ZGAyyIEhr0EHqmTQNHX+6r3YSNr5YXEl
 GymuZlzL2vUKSCOGcFan+SEo+SazGh9pNiLUae4Y7QiG7r4cjhpEMGscqeiprO1XMqvp
 togw==
X-Gm-Message-State: AOAM531RT4OWZk5MLMgKbSmoc9Hhj1ddzLgT5yFiXVlbVhV02JYkHL9E
 fJJWzJHYwDRJXEt8TtHISTc=
X-Google-Smtp-Source: ABdhPJyJzte6sbq66cNBekFBaDvvmVsrMqZqq1jO2TycXOtmpJpIHsRHKWSWGExUVijx0zjm8m/GsA==
X-Received: by 2002:a05:6402:2750:: with SMTP id
 z16mr61413471edd.355.1621056277499; 
 Fri, 14 May 2021 22:24:37 -0700 (PDT)
Received: from workstation.lan ([95.155.85.46])
 by smtp.gmail.com with ESMTPSA id kt21sm4821487ejb.5.2021.05.14.22.24.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 22:24:37 -0700 (PDT)
From: =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>
To: Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH v2 02/14] PCI/AER: Use sysfs_emit() and sysfs_emit_at() in
 "show" functions
Date: Sat, 15 May 2021 05:24:22 +0000
Message-Id: <20210515052434.1413236-2-kw@linux.com>
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
 drivers/pci/pcie/aer.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index ec943cee5ecc..40ef7bed7a77 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -529,21 +529,23 @@ static const char *aer_agent_string[] = {
 		     char *buf)						\
 {									\
 	unsigned int i;							\
-	char *str = buf;						\
 	struct pci_dev *pdev = to_pci_dev(dev);				\
 	u64 *stats = pdev->aer_stats->stats_array;			\
+	size_t len = 0;							\
 									\
 	for (i = 0; i < ARRAY_SIZE(strings_array); i++) {		\
 		if (strings_array[i])					\
-			str += sprintf(str, "%s %llu\n",		\
-				       strings_array[i], stats[i]);	\
+			len += sysfs_emit_at(buf, len, "%s %llu\n",	\
+					     strings_array[i],		\
+					     stats[i]);			\
 		else if (stats[i])					\
-			str += sprintf(str, #stats_array "_bit[%d] %llu\n",\
-				       i, stats[i]);			\
+			len += sysfs_emit_at(buf, len,			\
+					     #stats_array "_bit[%d] %llu\n",\
+					     i, stats[i]);		\
 	}								\
-	str += sprintf(str, "TOTAL_%s %llu\n", total_string,		\
-		       pdev->aer_stats->total_field);			\
-	return str-buf;							\
+	len += sysfs_emit_at(buf, len, "TOTAL_%s %llu\n", total_string,	\
+			     pdev->aer_stats->total_field);		\
+	return len;							\
 }									\
 static DEVICE_ATTR_RO(name)
 
@@ -563,7 +565,7 @@ aer_stats_dev_attr(aer_dev_nonfatal, dev_nonfatal_errs,
 		     char *buf)						\
 {									\
 	struct pci_dev *pdev = to_pci_dev(dev);				\
-	return sprintf(buf, "%llu\n", pdev->aer_stats->field);		\
+	return sysfs_emit(buf, "%llu\n", pdev->aer_stats->field);	\
 }									\
 static DEVICE_ATTR_RO(name)
 
-- 
2.31.1

