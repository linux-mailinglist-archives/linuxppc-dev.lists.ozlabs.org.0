Return-Path: <linuxppc-dev+bounces-12874-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A30BDC2CE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Oct 2025 04:42:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cmb2t0wYRz3chn;
	Wed, 15 Oct 2025 13:42:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=115.124.30.97
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760496133;
	cv=none; b=kW+9aHKWFn5RyGVvZ8zK+htfFcgl0SzDUGnIRCXzDyrqmRcfXiW7NQjC9hCbIwnqdX0NQXP8JZHPKlcOsJNlY/wGwS2JjhLShEUhByGPXc8jlxYhaALLXsIRqWihp+AFIoUlyN6EACoV1tdVZtR8ZOSAO5gtFaQ9Cqw8B3DbxSTkhGn78gTWYEVzw20ABcUbTJCyD3zTkVL74rUS8qczdqr95+0x8+stzT/biAXKpdunttU5KJ1HLwiwqcZ/RBGDe6/mskfHIKd/8BJsGTASzk9uK0NF7lP5y1hNde5ODPybG4WQpouTaOXN+AA1jK1Tfa6UJiVBkpNwid0h/rRBGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760496133; c=relaxed/relaxed;
	bh=puzbyrksJ6Ibr4OiaAvXhPRXIfrNu8KphJ6x82nMuQc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UvFD2yWF+hr7S6l/g5jQoN8p6BqcWTlpAMPWQ2vRiHHCtjfP0rD5lmGMwrRmYBGaz5+Uy0fB87lpyYe2vp2z+jbdo4An2gt4eKzzPbpYbpZEg0BZfZK5wvLzWAy86kpzfmUMoEferPIHsnKNaJIqzhSDgo7ezxvHkJwRTVnw2Fhf2b69hz4Sj5UIsRUW1n7ZRLRpYN18lA3JzOr6nHgJv7kgfXylsQmaAwFFLDx9IoKGChxl/+dDJxbdWgz3zKdtdZGR+5bo45m0H3CEcthoccPhdQLo8MkOFKa6bL8v/DG2ySzsJlnwsO52vzCUlWLwQgms53wdUQjAG4G6IpEvrw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=FPiggzUB; dkim-atps=neutral; spf=pass (client-ip=115.124.30.97; helo=out30-97.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.alibaba.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=FPiggzUB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.97; helo=out30-97.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org)
Received: from out30-97.freemail.mail.aliyun.com (out30-97.freemail.mail.aliyun.com [115.124.30.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cmb2r5HFbz3cdR
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Oct 2025 13:42:11 +1100 (AEDT)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1760496127; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=puzbyrksJ6Ibr4OiaAvXhPRXIfrNu8KphJ6x82nMuQc=;
	b=FPiggzUBYLJBCmZJnEg31JsaylxZko8PxSXHmaCjgtJw4fsnl8LK2sBTSHCDNNo8fEGzKXFq91XBJ9h4GhqEKyENGniwK5RMBsdYHxdpAR60koonIDBPfOMHsUCh+TL+34W29Q+9dNjwYadb+rZQOLgNIrmQ51E4gK8THq7UxTA=
Received: from localhost.localdomain(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0WqEYD7h_1760496124 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 15 Oct 2025 10:42:04 +0800
From: Shuai Xue <xueshuai@linux.alibaba.com>
To: linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	bhelgaas@google.com,
	kbusch@kernel.org,
	sathyanarayanan.kuppuswamy@linux.intel.com
Cc: mahesh@linux.ibm.com,
	oohall@gmail.com,
	xueshuai@linux.alibaba.com,
	Jonathan.Cameron@huawei.com,
	terry.bowman@amd.com,
	tianruidong@linux.alibaba.com,
	lukas@wunner.de
Subject: [PATCH v6 4/5] PCI/ERR: Use pcie_aer_is_native() to check for native AER control
Date: Wed, 15 Oct 2025 10:41:58 +0800
Message-Id: <20251015024159.56414-5-xueshuai@linux.alibaba.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20251015024159.56414-1-xueshuai@linux.alibaba.com>
References: <20251015024159.56414-1-xueshuai@linux.alibaba.com>
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
X-Spam-Status: No, score=-15.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Replace the manual checks for native AER control with the
pcie_aer_is_native() helper, which provides a more robust way
to determine if we have native control of AER.

No functional changes intended.

Signed-off-by: Shuai Xue <xueshuai@linux.alibaba.com>
---
 drivers/pci/pcie/err.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/pci/pcie/err.c b/drivers/pci/pcie/err.c
index 4e65eac809d1..097990094b71 100644
--- a/drivers/pci/pcie/err.c
+++ b/drivers/pci/pcie/err.c
@@ -214,7 +214,6 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
 	int type = pci_pcie_type(dev);
 	struct pci_dev *bridge;
 	pci_ers_result_t status = PCI_ERS_RESULT_CAN_RECOVER;
-	struct pci_host_bridge *host = pci_find_host_bridge(dev->bus);
 	struct aer_err_info info;
 
 	/*
@@ -289,7 +288,7 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
 	 * it is responsible for clearing this status.  In that case, the
 	 * signaling device may not even be visible to the OS.
 	 */
-	if (host->native_aer || pcie_ports_native) {
+	if (pcie_aer_is_native(dev)) {
 		pcie_clear_device_status(dev);
 		pci_aer_clear_nonfatal_status(dev);
 	}
-- 
2.39.3


