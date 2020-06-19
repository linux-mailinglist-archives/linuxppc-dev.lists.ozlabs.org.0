Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B69AC2000C7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jun 2020 05:32:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49p49d6zrhzDrNV
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jun 2020 13:32:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49p4851j2vzDrM2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jun 2020 13:30:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=gibson.dropbear.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au
 header.a=rsa-sha256 header.s=201602 header.b=RWj1rESw; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1007)
 id 49p4841Nvrz9sRk; Fri, 19 Jun 2020 13:30:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1592537444;
 bh=Z1znwFCrCzh+F1jGYnmAR0Tyf0EyfbusOiN3r/JH274=;
 h=From:To:Cc:Subject:Date:From;
 b=RWj1rESwwED1Om1JkEYHeCzam7cyKUIKly+0faRqHG717UTanjkbwH5ElVDAqko9S
 OSHLW0NYSO1vvGNnD+SG0fWsNczuNKaGJLTBQQwPrxM7Tt4gGT0w+wTMc6aLpD6lIX
 cRw1em/kjjIBENV9rY+9U7ezQNwhgEPwfi8vFwQE=
From: David Gibson <david@gibson.dropbear.id.au>
To: jarkko.sakkinen@linux.intel.com,
	stefanb@linux.ibm.com
Subject: [PATCHv2] tpm: ibmvtpm: Wait for ready buffer before probing for TPM2
 attributes
Date: Fri, 19 Jun 2020 13:30:40 +1000
Message-Id: <20200619033040.121412-1-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.26.2
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
Cc: nayna@linux.ibm.com, linux-kernel@vger.kernel.org, jgg@ziepe.ca,
 paulus@samba.org, peterhuewe@gmx.de, linuxppc-dev@lists.ozlabs.org,
 linux-integrity@vger.kernel.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The tpm2_get_cc_attrs_tbl() call will result in TPM commands being issued,
which will need the use of the internal command/response buffer.  But,
we're issuing this *before* we've waited to make sure that buffer is
allocated.

This can result in intermittent failures to probe if the hypervisor / TPM
implementation doesn't respond quickly enough.  I find it fails almost
every time with an 8 vcpu guest under KVM with software emulated TPM.

To fix it, just move the tpm2_get_cc_attrs_tlb() call after the
existing code to wait for initialization, which will ensure the buffer
is allocated.

Fixes: 18b3670d79ae9 ("tpm: ibmvtpm: Add support for TPM2")
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---

Changes from v1:
 * Fixed a formatting error in the commit message
 * Added some more detail to the commit message
 
drivers/char/tpm/tpm_ibmvtpm.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/char/tpm/tpm_ibmvtpm.c b/drivers/char/tpm/tpm_ibmvtpm.c
index 09fe45246b8cc..994385bf37c0c 100644
--- a/drivers/char/tpm/tpm_ibmvtpm.c
+++ b/drivers/char/tpm/tpm_ibmvtpm.c
@@ -683,13 +683,6 @@ static int tpm_ibmvtpm_probe(struct vio_dev *vio_dev,
 	if (rc)
 		goto init_irq_cleanup;
 
-	if (!strcmp(id->compat, "IBM,vtpm20")) {
-		chip->flags |= TPM_CHIP_FLAG_TPM2;
-		rc = tpm2_get_cc_attrs_tbl(chip);
-		if (rc)
-			goto init_irq_cleanup;
-	}
-
 	if (!wait_event_timeout(ibmvtpm->crq_queue.wq,
 				ibmvtpm->rtce_buf != NULL,
 				HZ)) {
@@ -697,6 +690,13 @@ static int tpm_ibmvtpm_probe(struct vio_dev *vio_dev,
 		goto init_irq_cleanup;
 	}
 
+	if (!strcmp(id->compat, "IBM,vtpm20")) {
+		chip->flags |= TPM_CHIP_FLAG_TPM2;
+		rc = tpm2_get_cc_attrs_tbl(chip);
+		if (rc)
+			goto init_irq_cleanup;
+	}
+
 	return tpm_chip_register(chip);
 init_irq_cleanup:
 	do {
-- 
2.26.2

