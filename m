Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23100807BA3
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Dec 2023 23:45:52 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YlZfUNOq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Slsv14J9Lz2yVb
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Dec 2023 09:45:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YlZfUNOq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SlsqW6lj2z3cGW
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Dec 2023 09:42:47 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5ADC861EDC;
	Wed,  6 Dec 2023 22:42:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF022C433C7;
	Wed,  6 Dec 2023 22:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701902564;
	bh=hxM1IqtzAU7BiNojl8vsj+19zxebOt7Ey++poguftDo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YlZfUNOqCiUR8pGApkpmaP+V44at9k1507c7BwV1zzncNfobRNhMLfI2WyMjUsFjm
	 27edqPyiJttSwkBvUmXNIaEiSlUQLZDNi6dGcHoTt4+/iMJc7Z3pN3AdyzK1zEl/dY
	 l6aYfjIBlCD9YxyUXPda6iUwJeXv1ef416UqPeo0hsYVEIDuG9u8qapWg+ERkCLjsN
	 WZeBQ/QyLvH9kTPQXUEv9C4lKmteraeqZWaFw67/H0/7BgS9tHkz7DJ/930BWt2oS6
	 v8mZD24D/av/nEW17SjCkp9BhfQtZMNFvljb2ftgqs2V3MBDD6+LCJRLU2Ntoxg5gm
	 X8QGZxeMAOjUg==
From: Bjorn Helgaas <helgaas@kernel.org>
To: linux-pci@vger.kernel.org
Subject: [PATCH 3/3] PCI/AER: Use explicit register sizes for struct members
Date: Wed,  6 Dec 2023 16:42:31 -0600
Message-Id: <20231206224231.732765-4-helgaas@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231206224231.732765-1-helgaas@kernel.org>
References: <20231206224231.732765-1-helgaas@kernel.org>
MIME-Version: 1.0
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
Cc: Robert Richter <rrichter@amd.com>, Terry Bowman <terry.bowman@amd.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, linux-kernel@vger.kernel.org, Kai-Heng Feng <kai.heng.feng@canonical.com>, Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Bjorn Helgaas <bhelgaas@google.com>

aer_irq() reads the AER Root Error Status and Error Source Identification
(PCI_ERR_ROOT_STATUS and PCI_ERR_ROOT_ERR_SRC) registers directly into
struct aer_err_source.  Both registers are 32 bits, so declare the members
explicitly as "u32" instead of "unsigned int".

Similarly, aer_get_device_error_info() reads the AER Header Log
(PCI_ERR_HEADER_LOG) registers, which are also 32 bits, into struct
aer_header_log_regs.  Declare those members as "u32" as well.

No functional changes intended.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/pci/pcie/aer.c | 4 ++--
 include/linux/aer.h    | 8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index 2ff6bac9979f..60f84414ec2a 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -41,8 +41,8 @@
 #define AER_MAX_TYPEOF_UNCOR_ERRS	27	/* as per PCI_ERR_UNCOR_STATUS*/
 
 struct aer_err_source {
-	unsigned int status;
-	unsigned int id;
+	u32 status;			/* PCI_ERR_ROOT_STATUS */
+	u32 id;				/* PCI_ERR_ROOT_ERR_SRC */
 };
 
 struct aer_rpc {
diff --git a/include/linux/aer.h b/include/linux/aer.h
index f6ea2f57d808..ae0fae70d4bd 100644
--- a/include/linux/aer.h
+++ b/include/linux/aer.h
@@ -19,10 +19,10 @@
 struct pci_dev;
 
 struct aer_header_log_regs {
-	unsigned int dw0;
-	unsigned int dw1;
-	unsigned int dw2;
-	unsigned int dw3;
+	u32 dw0;
+	u32 dw1;
+	u32 dw2;
+	u32 dw3;
 };
 
 struct aer_capability_regs {
-- 
2.34.1

