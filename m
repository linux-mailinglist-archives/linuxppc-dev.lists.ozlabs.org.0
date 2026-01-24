Return-Path: <linuxppc-dev+bounces-16260-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +LhdMv14dGnU5wAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16260-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Jan 2026 08:47:09 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC347CDBA
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Jan 2026 08:47:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dyn1W284jz3c5f;
	Sat, 24 Jan 2026 18:46:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=115.124.30.111
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769240799;
	cv=none; b=MJPAzam0aUyASDAEZ49/F20iuz80ZhRKIvTRM/FY4kA/ZDUSZrJK50Sc7GGciipnb+de3OsAGYE75G/uE9QS+X+mL6qUKbdsZW93qFxx+N1VwzBcufFZc8JWu36r489g8MHsuUSywygKFANvSry3EETvGuClouyY9QJ9HPLVKmmHlac5gvrcMTMFSccnPmou/g9mC8mxdR6Ghm5fpCCvtqX7tV28wZc7BDiZcRdggw99LGFmJM5uiA0/P9Y76+kDKZmkkqocvmog/I272MfYEE/yGGmZJwYBRqOiF47QsQkT+qBaQJucITHjbcG7FptAWShOqaoA2YV9/48nLDtU1A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769240799; c=relaxed/relaxed;
	bh=sBSDEixm4+8FCCTYQu1UeCBdF+LTdyt08Svk7uwlzxo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hcGjyFZrPhrAtN1AOi8GtC+viTKK987JxQoshUi0RsF8AqZExxYzfXy4YbnCU5qDOS8FbH9Kps+VaF4sMIswVc9pQXunaSlSbpbs4iPvW1ohHNVjJrwh5e6nHMnfzEHVBSYmpKZVwlBZJtncwqzXn7yL9xgXiuUVNfrpPsR3Bs5l7xbtUiFahaVA8SPEs3n10Jj94jsALhpaxhvxnEfFzZ6hpz3pcknmjjtYtTVOv9wDJJAwbNt20LkMB1QSy3o94U+C5QrBettwQM83/R15jm7ILYDTVFU016Qg775VQynA+tkVnDakeY5BclbJw8A4XTeF3HbviO8aLbpPAqUOPA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=g3fYPWAd; dkim-atps=neutral; spf=pass (client-ip=115.124.30.111; helo=out30-111.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.alibaba.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=g3fYPWAd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.111; helo=out30-111.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org)
Received: from out30-111.freemail.mail.aliyun.com (out30-111.freemail.mail.aliyun.com [115.124.30.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dyn1S5sjzz309H
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Jan 2026 18:46:36 +1100 (AEDT)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1769240791; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=sBSDEixm4+8FCCTYQu1UeCBdF+LTdyt08Svk7uwlzxo=;
	b=g3fYPWAd+9E9ggFd5VzgTCHMz4rj5cxaSirV4TPwb9mtGLNANb0/vohSdEGxuq8V2FRgpPOBUQEq7rGS2mHF2mVIXuczNvbkLOzLksa794b1xlQj+LIHaZkwfD8XQ0W0q+PS0a5jkVZPZCe52YTAo1pw9anyZy54qTFXTW3CK2U=
Received: from localhost.localdomain(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0WxiIIC1_1769240788 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sat, 24 Jan 2026 15:46:28 +0800
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
Subject: [PATCH v7 5/5] PCI/AER: Only clear error bits in pcie_clear_device_status()
Date: Sat, 24 Jan 2026 15:45:57 +0800
Message-Id: <20260124074557.73961-6-xueshuai@linux.alibaba.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260124074557.73961-1-xueshuai@linux.alibaba.com>
References: <20260124074557.73961-1-xueshuai@linux.alibaba.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-7.71 / 15.00];
	WHITELIST_DMARC(-7.00)[alibaba.com:D:+];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linux.alibaba.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	R_DKIM_ALLOW(-0.20)[linux.alibaba.com:s=default];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux.ibm.com,gmail.com,linux.alibaba.com,huawei.com,amd.com,wunner.de];
	TAGGED_FROM(0.00)[bounces-16260-lists,linuxppc-dev=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[xueshuai@linux.alibaba.com,linuxppc-dev@lists.ozlabs.org];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS(0.00)[m:linux-pci@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:bhelgaas@google.com,m:kbusch@kernel.org,m:sathyanarayanan.kuppuswamy@linux.intel.com,m:mahesh@linux.ibm.com,m:oohall@gmail.com,m:xueshuai@linux.alibaba.com,m:Jonathan.Cameron@huawei.com,m:terry.bowman@amd.com,m:tianruidong@linux.alibaba.com,m:lukas@wunner.de,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xueshuai@linux.alibaba.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linux.alibaba.com:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.988];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.alibaba.com:mid,linux.alibaba.com:dkim,alibaba.com:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns,wunner.de:email]
X-Rspamd-Queue-Id: EAC347CDBA
X-Rspamd-Action: no action

Currently, pcie_clear_device_status() clears the entire PCIe Device
Status register (PCI_EXP_DEVSTA), which includes both error status bits
and other status bits such as AUX Power Detected (AUXPD) and
Transactions Pending (TRPND).

Clearing non-error status bits can interfere with other drivers or
subsystems that may rely on these bits. To fix it, only clear the error
bits (0xf) while preserving other status bits.

Fixes: ec752f5d54d7 ("PCI/AER: Clear device status bits during ERR_FATAL and ERR_NONFATAL")
Cc: stable@vger.kernel.org
Suggested-by: Lukas Wunner <lukas@wunner.de>
Signed-off-by: Shuai Xue <xueshuai@linux.alibaba.com>
---
 drivers/pci/pci.c             | 2 +-
 include/uapi/linux/pci_regs.h | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 13dbb405dc31..0b947f90c333 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -2246,7 +2246,7 @@ void pcie_clear_device_status(struct pci_dev *dev)
 	u16 sta;
 
 	pcie_capability_read_word(dev, PCI_EXP_DEVSTA, &sta);
-	pcie_capability_write_word(dev, PCI_EXP_DEVSTA, sta);
+	pcie_capability_write_word(dev, PCI_EXP_DEVSTA, sta & PCI_EXP_DEVSTA_ERR);
 }
 #endif
 
diff --git a/include/uapi/linux/pci_regs.h b/include/uapi/linux/pci_regs.h
index 3add74ae2594..f4b68203bc4e 100644
--- a/include/uapi/linux/pci_regs.h
+++ b/include/uapi/linux/pci_regs.h
@@ -534,6 +534,7 @@
 #define  PCI_EXP_DEVSTA_NFED	0x0002	/* Non-Fatal Error Detected */
 #define  PCI_EXP_DEVSTA_FED	0x0004	/* Fatal Error Detected */
 #define  PCI_EXP_DEVSTA_URD	0x0008	/* Unsupported Request Detected */
+#define  PCI_EXP_DEVSTA_ERR	0xf	/* Error bits */
 #define  PCI_EXP_DEVSTA_AUXPD	0x0010	/* AUX Power Detected */
 #define  PCI_EXP_DEVSTA_TRPND	0x0020	/* Transactions Pending */
 #define PCI_CAP_EXP_RC_ENDPOINT_SIZEOF_V1	12	/* v1 endpoints without link end here */
-- 
2.39.3


