Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1DA234620
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jul 2020 14:50:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BJ6ZC318JzDqg1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jul 2020 22:50:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::644;
 helo=mail-ej1-x644.google.com; envelope-from=refactormyself@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Boub8lNC; dkim-atps=neutral
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BJ6QJ1jzyzDqVv
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Jul 2020 22:43:18 +1000 (AEST)
Received: by mail-ej1-x644.google.com with SMTP id w9so31265383ejc.8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Jul 2020 05:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Z7WaVDyC31Xqp9aG4vaiaHbvwp6b775oA7lj7CzrKBo=;
 b=Boub8lNC8OOZzaDP7HakRmCigQ9s+TmAZKT/FvTXISovow+eY1+3iv9s7tVr5dADQb
 tIF5zqqI08ULoL0yyrXmhoapYfXxmRW0lyX2RCJXcewDU1EB9xdyPBrZABXn08aJJ28c
 Ix6TlonWfWSChmEA3cZnWfApy3SwFu1s8TocFkM7yBDwtH78cBXTAF1xTDgYs+VIg8UE
 kcTAWODekL0CEEpa/XJHHc7Z1xM6Zm5QjgRxMYhQQz3mO4eSz2plfe9QNw1SAJHLLj1J
 ZA6BNEbFTnFQK6vaB1h+hfyveE/uv2QDJ4RmDfBaoT3ERtSvXRg9SGL9BruBwod71w3x
 jyzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Z7WaVDyC31Xqp9aG4vaiaHbvwp6b775oA7lj7CzrKBo=;
 b=QNeyIYazNHd/NMo3yeXve+0uobuA9icR0wVprb9/LFIkg0ha/oSyf/yeb+ghmU+pl1
 beCRsv5oeF6YfMecQGJEXJBtew3G2AuswnXQZtM04+A7rygcCFzjAKu9XZAF6JtuA78o
 FLLttz1XQjrwswhsY2OXDXNp42By9CQafj5zUEfnM5vOj6HGHZtxWIOPjh/grS5XtDYs
 WOmXkjOm18nnTjIdneXIkY0VON3IyaHoW/dckx+STttUQvNccbr52fqx9uRb7kKPHJhP
 k652E6/AuQ/JOphKjGpCdIyJSS3JNgR9GUnNmG8meFEABvC42W+KCQRLPI9Uq9WiVS96
 szmw==
X-Gm-Message-State: AOAM530iF21Ciks10h1u8Z/bMBAnyPU0fbkebceptQI4cTc29y4q1PSv
 HPBuIkpL8lz/0Zer9X3/1eY=
X-Google-Smtp-Source: ABdhPJz2I4wMlXEMP6P1KRM4mmo8+jpv64fXNEUIP720yCcVBp2o7uTyVYR6ab20bRx5VLVhSw6mFA==
X-Received: by 2002:a17:906:3281:: with SMTP id
 1mr3932259ejw.132.1596199394967; 
 Fri, 31 Jul 2020 05:43:14 -0700 (PDT)
Received: from net.saheed (95C84E0A.dsl.pool.telekom.hu. [149.200.78.10])
 by smtp.gmail.com with ESMTPSA id g23sm8668514ejb.24.2020.07.31.05.43.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2020 05:43:14 -0700 (PDT)
From: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
To: helgaas@kernel.org
Subject: [PATCH v4 12/12] PCI: Remove '*val = 0' from pcie_capability_read_*()
Date: Fri, 31 Jul 2020 13:43:29 +0200
Message-Id: <20200731114329.100848-5-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20200731114329.100848-1-refactormyself@gmail.com>
References: <20200731114329.100848-1-refactormyself@gmail.com>
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-wireless@vger.kernel.org,
 QCA ath9k Development <ath9k-devel@qca.qualcomm.com>,
 Oliver O'Halloran <oohall@gmail.com>, linux-acpi@vger.kernel.org,
 linux-rdma@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>,
 Doug Ledford <dledford@redhat.com>, linux-pci@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org, Len Brown <lenb@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, skhan@linuxfoundation.org, bjorn@helgaas.com,
 Kalle Valo <kvalo@codeaurora.org>,
 Mike Marciniszyn <mike.marciniszyn@intel.com>,
 Sam Bobroff <sbobroff@linux.ibm.com>,
 "Saheed O. Bolarinwa" <refactormyself@gmail.com>,
 Dennis Dalessandro <dennis.dalessandro@intel.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There are several reasons why a PCI capability read may fail whether the
device is present or not. If this happens, pcie_capability_read_*() will
return -EINVAL/PCIBIOS_BAD_REGISTER_NUMBER or PCIBIOS_DEVICE_NOT_FOUND
and *val is set to 0.

This behaviour if further ensured by this code inside
pcie_capability_read_*()

 ret = pci_read_config_dword(dev, pci_pcie_cap(dev) + pos, val);
 /*
  * Reset *val to 0 if pci_read_config_dword() fails, it may
  * have been written as 0xFFFFFFFF if hardware error happens
  * during pci_read_config_dword().
  */
 if (ret)
	 *val = 0;
 return ret;

a) Since all pci_generic_config_read() does is read a register value,
it may return success after reading a ~0 which *may* have been fabricated
by the PCI host bridge due to a read timeout. Hence pci_read_config_*()
will return success with a fabricated ~0 in *val, indicating a problem.
In this case, the assumed behaviour of  pcie_capability_read_*() will be
wrong. To avoid error slipping through, more checks are necessary.

b) pci_read_config_*() will return PCIBIOS_DEVICE_NOT_FOUND only if
dev->error_state = pci_channel_io_perm_failure (i.e.
pci_dev_is_disconnected()) or if pci_generic_config_read() can't find the
device. In both cases *val is initially set to ~0 but as shown in the code
above pcie_capability_read_*() resets it back to 0. Even with this effort,
drivers still have to perform validation checks more so if 0 is a valid
value.

Most drivers only consider the case (b) and in some cases, there is the
expectation that on timeout *val has a fabricated value of ~0, which *may*
not always be true as explained in (a).

In any case, checks need to be done to validate the value read and maybe
confirm which error has occurred. It is better left to the drivers to do.

Remove the reset of *val to 0 when pci_read_config_*() fails.

Suggested-by: Bjorn Helgaas <bjorn@helgaas.com>
Signed-off-by: Saheed O. Bolarinwa <refactormyself@gmail.com>
---
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
2.18.4

