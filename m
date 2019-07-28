Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 71189781E4
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Jul 2019 23:40:45 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45xbpf6s9SzDqTl
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2019 07:40:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.167.65; helo=mail-lf1-f65.google.com;
 envelope-from=yefremov.denis@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.com
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
 [209.85.167.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45xZ5y3zH6zDqQf
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jul 2019 06:23:50 +1000 (AEST)
Received: by mail-lf1-f65.google.com with SMTP id c9so40517094lfh.4
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Jul 2019 13:23:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BsIPSvfzLwnhnLKtcEHLG5y6k186GA8GW/6JbbfPnA4=;
 b=SXoz9nwOB45Q57ON5PVe31VTqIa4IaqwA4IZfdTm+bfDXQs7Tq4HTYXhAOPjhxTlTj
 7ptWkZYIS9SqpvX1FjGLRui/ybPEP841MTySLeAYZxlczmLHpllIEgTI/KpDB9kqy9pH
 SgzoQrCQj20hIzWhHAU3re39hyJtPePodHPEoiHKETuu2y+JSrqdFg6T0nuStRl7mSlT
 hiO0+U08LMDVsoLPxLv+18oZ0tZNx0eavWneQWjml7mTEerORF3SiAB3vAvTbkkId14I
 j49O5iYFK5ByyltrtI0zf6Mc/rDFrnl12JyiVdT9Bli6QJEjiEpXOmisu42VJao9OzY+
 ioMA==
X-Gm-Message-State: APjAAAVkiQGg4P5bLtw0AqNhDThiCpJq/3gH7fxu8WnJu0+utrSacVJ5
 FBvbFNIwVbORTIvucGGJS+c=
X-Google-Smtp-Source: APXvYqw+FfN4FqOrzqV25HilzNIKewdHvXu1E1uzSsxYeRi5FpYLNX73c0xiyl7PEEJ+jfoA5/3UQA==
X-Received: by 2002:ac2:4202:: with SMTP id y2mr15335884lfh.178.1564345426848; 
 Sun, 28 Jul 2019 13:23:46 -0700 (PDT)
Received: from localhost.localdomain (broadband-188-32-48-208.ip.moscow.rt.ru.
 [188.32.48.208])
 by smtp.googlemail.com with ESMTPSA id z17sm12395917ljc.37.2019.07.28.13.23.46
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 28 Jul 2019 13:23:46 -0700 (PDT)
From: Denis Efremov <efremov@linux.com>
To: Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH 4/5] powerpc/PCI: Remove HAVE_ARCH_PCI_RESOURCE_TO_USER
Date: Sun, 28 Jul 2019 23:22:12 +0300
Message-Id: <20190728202213.15550-5-efremov@linux.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190728202213.15550-1-efremov@linux.com>
References: <20190728202213.15550-1-efremov@linux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 29 Jul 2019 07:36:11 +1000
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
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 Denis Efremov <efremov@linux.com>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The function pci_resource_to_user() was turned to a weak one. Thus,
powerpc-specific version will automatically override the generic one
and the HAVE_ARCH_PCI_RESOURCE_TO_USER macro should be removed.

Signed-off-by: Denis Efremov <efremov@linux.com>
---
 arch/powerpc/include/asm/pci.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/powerpc/include/asm/pci.h b/arch/powerpc/include/asm/pci.h
index 2372d35533ad..327567b8f7d6 100644
--- a/arch/powerpc/include/asm/pci.h
+++ b/arch/powerpc/include/asm/pci.h
@@ -112,8 +112,6 @@ extern pgprot_t	pci_phys_mem_access_prot(struct file *file,
 					 unsigned long size,
 					 pgprot_t prot);
 
-#define HAVE_ARCH_PCI_RESOURCE_TO_USER
-
 extern resource_size_t pcibios_io_space_offset(struct pci_controller *hose);
 extern void pcibios_setup_bus_devices(struct pci_bus *bus);
 extern void pcibios_setup_bus_self(struct pci_bus *bus);
-- 
2.21.0

