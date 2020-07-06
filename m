Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE2F2155A8
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jul 2020 12:35:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B0hmP0SgHzDqZm
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jul 2020 20:35:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::343;
 helo=mail-wm1-x343.google.com; envelope-from=refactormyself@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=OlFSHDDG; dkim-atps=neutral
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B0hhQ60FYzDqRD
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Jul 2020 20:32:06 +1000 (AEST)
Received: by mail-wm1-x343.google.com with SMTP id f139so41343141wmf.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Jul 2020 03:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=y2WTHkWkBXP6KtKrUoVpSxGPEmpKkWatEbS8g3/VmJo=;
 b=OlFSHDDGHR404dT/3kL3jkvo2plJxDWWyyh5OnhIzyStXIKsAN3fusRdId3t/uXxuk
 XkBKy46pRsqU9PQkmDYPUyW8cJKpws5VFHqPD21/g3auLB1fAe91aftmO1NROt+5rX9/
 HnFtbi9p7NE4O17V0BYdylfx8t4JmC46/pRqy0igdV/JuNkj0dZ5wMRNC5vE/vq9O7aS
 ZvAdxzPQ2I5W3j5JcwPdaenpq5X+kqHA1cZZBbqg9q51oDlMu8zUb7JS77ZpJTG5+Io+
 /I+rP8ZSMqUOV2RgSJaXEdwuzTVT9r5YZUN17vJrVUi2fRWLzT09/JPl5mlw67YcYpdb
 fAKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=y2WTHkWkBXP6KtKrUoVpSxGPEmpKkWatEbS8g3/VmJo=;
 b=V3BmKVr/wZP4pd5F97b9cJAjjjkDIEjMrmd150VMW2xvsg31EMFFoU5UQak1HXPTRR
 Rz7/yoSoGtGsJIqkV1BS6C8cy+S3jWucE2kr8Sy6+HZejQiXBt7+UBURS5LeHNkJa0GF
 kL+mrLMM63JdwTCtEDvotgTDJi4hXJ7LAzfGPFZ/Z2duebSwvlhuQet1hTAJS1mJzjIP
 YI1ZJiHH8XRpE3qfUYjUBko68zv2SM6CyqaICmhBzIHTDWMn975KXwYO3at/O8FzUmAM
 +Pmc/jXlCzNkn8xYPj0bPFqprONWmEIsb3AAmBf0pZCqyYDGdyJmp5IAlztoNINQUuwV
 DYZA==
X-Gm-Message-State: AOAM531ByKw7c+i44EmidfX50QGujMVOVDUQsHKTG18CpBlstilg2hIu
 JyidWgAYHzjQTGOnM19i67M=
X-Google-Smtp-Source: ABdhPJxxifR3mv9mSzpOkdU4f8tnrsoDL5lEYmVLzuSjsTXhcamBJ4SbMlRPvrxl21FVX2sNVimeLg==
X-Received: by 2002:a05:600c:2295:: with SMTP id
 21mr47188051wmf.87.1594031523459; 
 Mon, 06 Jul 2020 03:32:03 -0700 (PDT)
Received: from net.saheed (51B7C2DF.dsl.pool.telekom.hu. [81.183.194.223])
 by smtp.gmail.com with ESMTPSA id 22sm24216859wmb.11.2020.07.06.03.32.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2020 03:32:02 -0700 (PDT)
From: Saheed Olayemi Bolarinwa <refactormyself@gmail.com>
To: helgaas@kernel.org
Subject: [PATCH 11/11 RFC] PCI: Remove "*val = 0" from pcie_capability_read_*()
Date: Mon,  6 Jul 2020 11:31:21 +0200
Message-Id: <20200706093121.9731-12-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.2
In-Reply-To: <20200706093121.9731-1-refactormyself@gmail.com>
References: <20200706093121.9731-1-refactormyself@gmail.com>
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
Cc: , Mike Marciniszyn <mike.marciniszyn@intel.com>,
	linuxppc-dev@lists.ozlabs.org,
	"Greg Kroah-Hartman linux-rdma @ vger . kernel . org" <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>, Jason Gunthorpe <jgg@ziepe.ca>,
	Sam Bobroff <sbobroff@linux.ibm.com>,
	Bolarinwa Olayemi Saheed <refactormyself@gmail.com>,
	Dennis Dalessandro <dennis.dalessandro@intel.com>,
	skhan@linuxfoundation.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
	linux-kernel@vger.kernel.org, wunner.de@lists.ozlabs.org,
	linux-acpi@vger.kernel.org, Doug Ledford <dledford@redhat.com>,
	linux-pci@vger.kernel.org, bjorn@helgaas.com,
	Oliver O'Halloran <oohall@gmail.com>,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-rdma@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Bolarinwa Olayemi Saheed <refactormyself@gmail.com>

 **TODO**

Suggested-by: Bjorn Helgaas <bjorn@helgaas.com>
Signed-off-by: Bolarinwa Olayemi Saheed <refactormyself@gmail.com>
---
This patch  depends on all of the preceeding patches in this series,
otherwise it will introduce bugs as pointed out in the commit message
of each.
 drivers/pci/access.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/drivers/pci/access.c b/drivers/pci/access.c
index 79c4a2ef269a..ec95edbb1ac8 100644
--- a/drivers/pci/access.c
+++ b/drivers/pci/access.c
@@ -413,13 +413,6 @@ int pcie_capability_read_word(struct pci_dev *dev, int pos, u16 *val)
 
 	if (pcie_capability_reg_implemented(dev, pos)) {
 		ret = pci_read_config_word(dev, pci_pcie_cap(dev) + pos, val);
-		/*
-		 * Reset *val to 0 if pci_read_config_word() fails, it may
-		 * have been written as 0xFFFF if hardware error happens
-		 * during pci_read_config_word().
-		 */
-		if (ret)
-			*val = 0;
 		return ret;
 	}
 
@@ -448,13 +441,6 @@ int pcie_capability_read_dword(struct pci_dev *dev, int pos, u32 *val)
 
 	if (pcie_capability_reg_implemented(dev, pos)) {
 		ret = pci_read_config_dword(dev, pci_pcie_cap(dev) + pos, val);
-		/*
-		 * Reset *val to 0 if pci_read_config_dword() fails, it may
-		 * have been written as 0xFFFFFFFF if hardware error happens
-		 * during pci_read_config_dword().
-		 */
-		if (ret)
-			*val = 0;
 		return ret;
 	}
 
-- 
2.18.2

