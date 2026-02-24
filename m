Return-Path: <linuxppc-dev+bounces-17103-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QEQyCAl5nWmAQAQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17103-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Feb 2026 11:10:17 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1C2185235
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Feb 2026 11:10:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fKtkV1w2mz3cP8;
	Tue, 24 Feb 2026 21:09:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771927794;
	cv=none; b=c6ZRXEQ4nHnd8EON+Ujl62ljtjtWgZNJM2gyek7CcsLYbqAVxhcyjeWxwu6ykVeEdM3eRoEUuebt97xD8Mednrx+2mliMMrjHF9IcrcHQrXYj5EYDZLEWV6c7Hk0gibEIMmQV2Vt3AGfQeiWhkD44qqoP+RNycp293/Hg2HGm5a/xqpd3JA38zc78TZciP84HU7bCzjUFzUd6Jk4djSowZ5Y9KqcXzZfNbDOVLmM12d5z/tnTfkzcmPyCXmTQ9V+qNhF1tsTHilXtoV81ESrjrKI9Up00bNCsbGGG7kYvzrbOi/AVYwjpExIkTCmHvnA6w/tLf1ORaNzZ6pvUeU42w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771927794; c=relaxed/relaxed;
	bh=g+XuFLR2vHR8fRdFxdM4nBK5CYAUy53Xf5sj3MMEcQY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=By5H9anAZ6qmxA7nhPSihxv/9YQpwEF6YzXF4eIoDIV40cVFI2yfvGpZbYmmXWPDzaQl3IheX14fQsq73lJJxm6rAyAGmIKcWuSAiNGsLfZpzYMcJ6nYtSIrChCk4mVCQEW0lBMZsoMgx3snjqXzjE/N7IL+qvobto+JIg3xbCM3K9iZ1CALCxVwdJoMNKmES5p9NKtKuTKwpPZB8Ogy4XKJB5hhUX7W01GU56AtGciANxfCGWSZMyAzPwkRqdhGlLlweDjiiT6MIneyoVjdGnVzjv0Lc6qnWPBkWbx0h1jEM1/av5waS7p6NuOFSMAb22OcUJR4W9TXsAC9EbjdkQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NoLxYcXT; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=maz@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NoLxYcXT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=maz@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fKtkR1R6Vz3cLV
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Feb 2026 21:09:51 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A1EB9445AD;
	Tue, 24 Feb 2026 10:09:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8132CC2BC9E;
	Tue, 24 Feb 2026 10:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771927788;
	bh=fmwZsFG2mQswj1CldtERGx0gFVuT8PrD6fuT1n1QemU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NoLxYcXTduxMnD3ZooqViNnlsEONuJq50yjwPk0tTRncHahzVysOljAseB1CKQRIk
	 oqwJ1hkig04D+WIwo8Muu17MfuSDJV6mXCX5421jci1Qw2LYqd1lUqFtShxvVJc4LI
	 zixlu6I2cs5OC/kPHuFl2U+B2hivY5OXREULVDbAImtY85VY3qhMbA0Iy3LrGsK2TK
	 BI9Frt6ABWCWr0LsLaxPJHw3knTlQLBarOvil7jA8GOa4m5mQaBhz/O0PuSaCJFWV7
	 7Nt2PZJp00f37BGBHKXn5wT91YbA/MHsPVq2AjiMh28PM/1pWleS00Q5B491ZZvnWQ
	 U4Od+RgQSviPA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vupMQ-0000000DIa5-27eJ;
	Tue, 24 Feb 2026 10:09:46 +0000
From: Marc Zyngier <maz@kernel.org>
To: Ioana Ciornei <ioana.ciornei@nxp.com>,
	Thomas Gleixner <tglx@kernel.org>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Sascha Bischoff <sascha.bischoff@arm.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 4/6] fsl-mc: Switch over to per-device platform MSI
Date: Tue, 24 Feb 2026 10:09:34 +0000
Message-ID: <20260224100936.3752303-5-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260224100936.3752303-1-maz@kernel.org>
References: <20260224100936.3752303-1-maz@kernel.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: ioana.ciornei@nxp.com, tglx@kernel.org, chleroy@kernel.org, sascha.bischoff@arm.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_FROM(0.00)[bounces-17103-lists,linuxppc-dev=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:ioana.ciornei@nxp.com,m:tglx@kernel.org,m:chleroy@kernel.org,m:sascha.bischoff@arm.com,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linuxppc-dev@lists.ozlabs.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[maz@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[maz@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,nxp.com:email]
X-Rspamd-Queue-Id: EA1C2185235
X-Rspamd-Action: no action

Obtain the msi-parent irqdomain instead of the fsl_mc domain,
which magically engages the per-device infrastructure.

Additionally, simplify the overly complicated error handling.

Reviewed-by: Ioana Ciornei <ioana.ciornei@nxp.com>
Tested-by: Ioana Ciornei <ioana.ciornei@nxp.com> # LX2160ARDB, LS2088ARDB
Tested-by: Sascha Bischoff <sascha.bischoff@arm.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/bus/fsl-mc/dprc-driver.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/bus/fsl-mc/dprc-driver.c b/drivers/bus/fsl-mc/dprc-driver.c
index db67442addad2..a85706826fa06 100644
--- a/drivers/bus/fsl-mc/dprc-driver.c
+++ b/drivers/bus/fsl-mc/dprc-driver.c
@@ -609,9 +609,8 @@ int dprc_setup(struct fsl_mc_device *mc_dev)
 {
 	struct device *parent_dev = mc_dev->dev.parent;
 	struct fsl_mc_bus *mc_bus = to_fsl_mc_bus(mc_dev);
-	struct irq_domain *mc_msi_domain;
+	struct irq_domain *mc_msi_domain = NULL;
 	bool mc_io_created = false;
-	bool msi_domain_set = false;
 	bool uapi_created = false;
 	u16 major_ver, minor_ver;
 	size_t region_size;
@@ -652,14 +651,12 @@ int dprc_setup(struct fsl_mc_device *mc_dev)
 		uapi_created = true;
 	}
 
-	mc_msi_domain = fsl_mc_find_msi_domain(&mc_dev->dev);
-	if (!mc_msi_domain) {
+	mc_msi_domain = fsl_mc_get_msi_parent(&mc_dev->dev);
+	if (!mc_msi_domain)
 		dev_warn(&mc_dev->dev,
 			 "WARNING: MC bus without interrupt support\n");
-	} else {
+	else
 		dev_set_msi_domain(&mc_dev->dev, mc_msi_domain);
-		msi_domain_set = true;
-	}
 
 	error = dprc_open(mc_dev->mc_io, 0, mc_dev->obj_desc.id,
 			  &mc_dev->mc_handle);
@@ -699,8 +696,7 @@ int dprc_setup(struct fsl_mc_device *mc_dev)
 	(void)dprc_close(mc_dev->mc_io, 0, mc_dev->mc_handle);
 
 error_cleanup_msi_domain:
-	if (msi_domain_set)
-		dev_set_msi_domain(&mc_dev->dev, NULL);
+	dev_set_msi_domain(&mc_dev->dev, NULL);
 
 	if (mc_io_created) {
 		fsl_destroy_mc_io(mc_dev->mc_io);
-- 
2.47.3


