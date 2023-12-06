Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C77E807B9E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Dec 2023 23:44:15 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=udeflMBF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Slss85LJFz3cbW
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Dec 2023 09:44:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=udeflMBF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SlsqR0LJzz2yVb
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Dec 2023 09:42:42 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CA09A61EDD;
	Wed,  6 Dec 2023 22:42:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C6D5C433C9;
	Wed,  6 Dec 2023 22:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701902560;
	bh=7cHmMbybKrcpsaIuCFsEGmwf1pycx3Ksk6fyQJF+zME=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=udeflMBF4LfGQE+1gMmco53gECNUhwPIYb1EpsGpaa9OW+4tQlZc2nhTHNReQ2ioE
	 TLF+CbG4qCR+Ql1SjfAyEuKy5Zy1CqoNYH7lcRMrVs8i47VgeYd6ZzYhQyKe1KTqzC
	 XnT9Jvzqv9HNvZLqeXPiHUX64Q1UxNKS3itjy9tqr8+/kXzP/EQ2uS9UpxWzKd+N9E
	 8qO8vyGDdOaywN7EkOuRMhW6IW6cJk05deGN2H3isCvCsJQ/H4a/KeprlRygSVV1AP
	 CQdJ70a3h5C+DW11ZdbfdG6euahmWVRG71FQs3KvHUaQ6Q/KETtNACDb9wfZsIfb3j
	 KdFaqqi5nItfw==
From: Bjorn Helgaas <helgaas@kernel.org>
To: linux-pci@vger.kernel.org
Subject: [PATCH 1/3] PCI/AER: Use 'Correctable' and 'Uncorrectable' spec terms for errors
Date: Wed,  6 Dec 2023 16:42:29 -0600
Message-Id: <20231206224231.732765-2-helgaas@kernel.org>
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

The PCIe spec classifies errors as either "Correctable" or "Uncorrectable".
Previously we printed these as "Corrected" or "Uncorrected".  To avoid
confusion, use the same terms as the spec.

One confusing situation is when one agent detects an error, but another
agent is responsible for recovery, e.g., by re-attempting the operation.
The first agent may log a "correctable" error but it has not yet been
corrected.  The recovery agent must report an uncorrectable error if it is
unable to recover.  If we print the first agent's error as "Corrected", it
gives the false impression that it has already been resolved.

Sample message change:

  - pcieport 0000:00:1c.5: AER: Corrected error received: 0000:00:1c.5
  + pcieport 0000:00:1c.5: AER: Correctable error received: 0000:00:1c.5

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/pci/pcie/aer.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index 42a3bd35a3e1..20db80018b5d 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -436,9 +436,9 @@ void pci_aer_exit(struct pci_dev *dev)
  * AER error strings
  */
 static const char *aer_error_severity_string[] = {
-	"Uncorrected (Non-Fatal)",
-	"Uncorrected (Fatal)",
-	"Corrected"
+	"Uncorrectable (Non-Fatal)",
+	"Uncorrectable (Fatal)",
+	"Correctable"
 };
 
 static const char *aer_error_layer[] = {
-- 
2.34.1

