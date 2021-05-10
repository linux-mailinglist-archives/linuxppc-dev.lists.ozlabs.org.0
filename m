Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74069377AF7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 May 2021 06:17:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FdnpQ35BKz3dYd
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 May 2021 14:17:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.218.41; helo=mail-ej1-f41.google.com;
 envelope-from=kswilczynski@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fdnkk0t7sz2ykQ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 May 2021 14:14:37 +1000 (AEST)
Received: by mail-ej1-f41.google.com with SMTP id t4so22489074ejo.0
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 09 May 2021 21:14:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DdJ+gi3kfx5UscQD8MEmkjatX64t7LAuyBsCWTQVyR4=;
 b=iCEV9fe83WwQ935COoPCOuk/PQytPElq9fXtXgTA8HZj4jOC1x6t+ixsPoPrdLbE+Q
 IryZfrO1V+8eeohLWRYqcqAE9Wnd/zvtC7VOh59+1Y20DmGxiDQ8Ss2Mzmsh1dpKR3Pi
 R28u+mugu3npnrmMBXGprVC6cgtRquR1APZ2fkeqIMLid5Ne0DH3O1moJ+JnAFZ3vZs9
 2cRb/ILcSGZVgUwbtTq5kfK44NiVTWVOgqPy8FNVykx41LohKHEx2UQvjhb3+29bnZZH
 zZ9jEvtsZZjs6ZX7xmBTXRHlMtXW6o0vaUY/b+2zm5RA5+Eut9wtAJi6UwhUo+1ywyeh
 AMDQ==
X-Gm-Message-State: AOAM532bNBgTJM74a18YP9GoFPJkrEoZ57kY78SyieiIZAcql54ZXtfm
 L+sYxJbqe6C1eT1rOSHVmo0=
X-Google-Smtp-Source: ABdhPJzQfHOmwxaUAAA/yt6AGTtGTnJzQboG84wpMWkla3kP1bDDdqnRsuymn/mXmRv8Z4Fc2V9tUw==
X-Received: by 2002:a17:906:e2d6:: with SMTP id
 gr22mr24241114ejb.356.1620620074968; 
 Sun, 09 May 2021 21:14:34 -0700 (PDT)
Received: from workstation.lan ([95.155.85.46])
 by smtp.gmail.com with ESMTPSA id e4sm8165006ejh.98.2021.05.09.21.14.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 May 2021 21:14:34 -0700 (PDT)
From: =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>
To: Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH 10/11] PCI: hotplug: Use sysfs_emit() and sysfs_emit_at() in
 "show" functions
Date: Mon, 10 May 2021 04:14:23 +0000
Message-Id: <20210510041424.233565-10-kw@linux.com>
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
 drivers/pci/hotplug/pci_hotplug_core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/hotplug/pci_hotplug_core.c b/drivers/pci/hotplug/pci_hotplug_core.c
index 5ac31f683b85..058d5937d8a9 100644
--- a/drivers/pci/hotplug/pci_hotplug_core.c
+++ b/drivers/pci/hotplug/pci_hotplug_core.c
@@ -73,7 +73,7 @@ static ssize_t power_read_file(struct pci_slot *pci_slot, char *buf)
 	if (retval)
 		return retval;
 
-	return sprintf(buf, "%d\n", value);
+	return sysfs_emit(buf, "%d\n", value);
 }
 
 static ssize_t power_write_file(struct pci_slot *pci_slot, const char *buf,
@@ -130,7 +130,7 @@ static ssize_t attention_read_file(struct pci_slot *pci_slot, char *buf)
 	if (retval)
 		return retval;
 
-	return sprintf(buf, "%d\n", value);
+	return sysfs_emit(buf, "%d\n", value);
 }
 
 static ssize_t attention_write_file(struct pci_slot *pci_slot, const char *buf,
@@ -175,7 +175,7 @@ static ssize_t latch_read_file(struct pci_slot *pci_slot, char *buf)
 	if (retval)
 		return retval;
 
-	return sprintf(buf, "%d\n", value);
+	return sysfs_emit(buf, "%d\n", value);
 }
 
 static struct pci_slot_attribute hotplug_slot_attr_latch = {
@@ -192,7 +192,7 @@ static ssize_t presence_read_file(struct pci_slot *pci_slot, char *buf)
 	if (retval)
 		return retval;
 
-	return sprintf(buf, "%d\n", value);
+	return sysfs_emit(buf, "%d\n", value);
 }
 
 static struct pci_slot_attribute hotplug_slot_attr_presence = {
-- 
2.31.1

