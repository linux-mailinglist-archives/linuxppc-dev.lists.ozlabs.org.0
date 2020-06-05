Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E541EF17B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jun 2020 08:43:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49dY4w4XTTzDqcn
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jun 2020 16:43:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49dY354zZMzDqQs
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Jun 2020 16:41:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=gibson.dropbear.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au
 header.a=rsa-sha256 header.s=201602 header.b=IrxIHTOt; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1007)
 id 49dY336tn3z9sT8; Fri,  5 Jun 2020 16:41:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1591339311;
 bh=4xfwcfWg3fYDkvoSshyHr3xzme+hp4xxgCEBnrJPiQA=;
 h=From:To:Cc:Subject:Date:From;
 b=IrxIHTOtq36n7hL5oemlz8t7GEAZpF+h8mTGZWroOBqSOJhlOm51dSAX5GS8JjdQw
 WHPJOGd2sMRNJx6TszW1g1u49Df8BhbVSg50aDEDD0Kr11VDFLFtDyVVb6LQh/IizZ
 9MyDft/8Rp9JAU6KU9KeE06jCzBBToAxZF9pO1V4=
From: David Gibson <david@gibson.dropbear.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, Peter Huewe <peterhuewe@gmx.de>,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Stefan Berger <stefanb@linux.ibm.com>,
 Nayna Jain <nayna@linux.ibm.com>
Subject: [PATCH] tpm: ibmvtpm: Wait for ready buffer before probing for TPM2
 attributes
Date: Fri,  5 Jun 2020 16:37:19 +1000
Message-Id: <20200605063719.456277-1-david@gibson.dropbear.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-integrity@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, linux-kernel@vger.kernel.org,
 David Gibson <david@gibson.dropbear.id.au>
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

Fixes: 18b3670d79ae9 "tpm: ibmvtpm: Add support for TPM2"
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 drivers/char/tpm/tpm_ibmvtpm.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/char/tpm/tpm_ibmvtpm.c b/drivers/char/tpm/tpm_ibmvtpm.c
index 09fe45246b8c..994385bf37c0 100644
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

