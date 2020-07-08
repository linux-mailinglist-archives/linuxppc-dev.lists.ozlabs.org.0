Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF26217C24
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jul 2020 02:16:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B1fxR6CXNzDqgV
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jul 2020 10:16:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=BVZTu0mM; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B1ftW1xgtzDr09
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jul 2020 10:14:11 +1000 (AEST)
Received: from localhost (mobile-166-175-191-139.mycingular.net
 [166.175.191.139])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7081820771;
 Wed,  8 Jul 2020 00:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594167248;
 bh=DN3iHDNuntnbnmz3uN4swyGc0jqn5mJ14MJNiYTaZao=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BVZTu0mMGT6MjYBicHaKCgG+eidNn7SG3rRrARO/ycC1BN7ewoPVW5PT2qMBXVa0D
 WcQPWS2HI+wqy83xmcS5PSFNsvOn5PbH/SSzk63dm3j2R/1uJ2D6X+woyb7GEHzr0a
 oHSQ1Bd6K5MPMBMPBUOr6Am2wpNtsRriFjy4QFLg=
From: Bjorn Helgaas <helgaas@kernel.org>
To: Matt Jolly <Kangie@footclan.ninja>
Subject: [PATCH 1/2] PCI/AER: Simplify __aer_print_error()
Date: Tue,  7 Jul 2020 19:14:00 -0500
Message-Id: <20200708001401.405749-1-helgaas@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618155511.16009-1-Kangie@footclan.ninja>
References: <20200618155511.16009-1-Kangie@footclan.ninja>
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
Cc: Sam Bobroff <sbobroff@linux.ibm.com>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, Oliver O'Halloran <oohall@gmail.com>,
 Bjorn Helgaas <bhelgaas@google.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Bjorn Helgaas <bhelgaas@google.com>

aer_correctable_error_string[] and aer_uncorrectable_error_string[] have
descriptions of AER error status bits.  Add NULL entries to these tables so
all entries for bits 0-31 are defined.  Then we don't have to check for
ARRAY_SIZE() when decoding a status word, which simplifies
__aer_print_error().

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/pci/pcie/aer.c | 48 ++++++++++++++++++++++++++++++------------
 1 file changed, 34 insertions(+), 14 deletions(-)

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index 3acf56683915..9176c8a968b9 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -447,7 +447,7 @@ static const char *aer_error_layer[] = {
 	"Transaction Layer"
 };
 
-static const char *aer_correctable_error_string[AER_MAX_TYPEOF_COR_ERRS] = {
+static const char *aer_correctable_error_string[] = {
 	"RxErr",			/* Bit Position 0	*/
 	NULL,
 	NULL,
@@ -464,9 +464,25 @@ static const char *aer_correctable_error_string[AER_MAX_TYPEOF_COR_ERRS] = {
 	"NonFatalErr",			/* Bit Position 13	*/
 	"CorrIntErr",			/* Bit Position 14	*/
 	"HeaderOF",			/* Bit Position 15	*/
+	NULL,				/* Bit Position 16	*/
+	NULL,				/* Bit Position 17	*/
+	NULL,				/* Bit Position 18	*/
+	NULL,				/* Bit Position 19	*/
+	NULL,				/* Bit Position 20	*/
+	NULL,				/* Bit Position 21	*/
+	NULL,				/* Bit Position 22	*/
+	NULL,				/* Bit Position 23	*/
+	NULL,				/* Bit Position 24	*/
+	NULL,				/* Bit Position 25	*/
+	NULL,				/* Bit Position 26	*/
+	NULL,				/* Bit Position 27	*/
+	NULL,				/* Bit Position 28	*/
+	NULL,				/* Bit Position 29	*/
+	NULL,				/* Bit Position 30	*/
+	NULL,				/* Bit Position 31	*/
 };
 
-static const char *aer_uncorrectable_error_string[AER_MAX_TYPEOF_UNCOR_ERRS] = {
+static const char *aer_uncorrectable_error_string[] = {
 	"Undefined",			/* Bit Position 0	*/
 	NULL,
 	NULL,
@@ -494,6 +510,11 @@ static const char *aer_uncorrectable_error_string[AER_MAX_TYPEOF_UNCOR_ERRS] = {
 	"AtomicOpBlocked",		/* Bit Position 24	*/
 	"TLPBlockedErr",		/* Bit Position 25	*/
 	"PoisonTLPBlocked",		/* Bit Position 26	*/
+	NULL,				/* Bit Position 27	*/
+	NULL,				/* Bit Position 28	*/
+	NULL,				/* Bit Position 29	*/
+	NULL,				/* Bit Position 30	*/
+	NULL,				/* Bit Position 31	*/
 };
 
 static const char *aer_agent_string[] = {
@@ -650,24 +671,23 @@ static void __print_tlp_header(struct pci_dev *dev,
 static void __aer_print_error(struct pci_dev *dev,
 			      struct aer_err_info *info)
 {
+	const char **strings;
 	unsigned long status = info->status & ~info->mask;
-	const char *errmsg = NULL;
+	const char *errmsg;
 	int i;
 
+	if (info->severity == AER_CORRECTABLE)
+		strings = aer_correctable_error_string;
+	else
+		strings = aer_uncorrectable_error_string;
+
 	for_each_set_bit(i, &status, 32) {
-		if (info->severity == AER_CORRECTABLE)
-			errmsg = i < ARRAY_SIZE(aer_correctable_error_string) ?
-				aer_correctable_error_string[i] : NULL;
-		else
-			errmsg = i < ARRAY_SIZE(aer_uncorrectable_error_string) ?
-				aer_uncorrectable_error_string[i] : NULL;
+		errmsg = strings[i];
+		if (!errmsg)
+			errmsg = "Unknown Error Bit";
 
-		if (errmsg)
-			pci_err(dev, "   [%2d] %-22s%s\n", i, errmsg,
+		pci_err(dev, "   [%2d] %-22s%s\n", i, errmsg,
 				info->first_error == i ? " (First)" : "");
-		else
-			pci_err(dev, "   [%2d] Unknown Error Bit%s\n",
-				i, info->first_error == i ? " (First)" : "");
 	}
 	pci_dev_aer_stats_incr(dev, info);
 }
-- 
2.25.1

