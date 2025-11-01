Return-Path: <linuxppc-dev+bounces-13661-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E301EC282E8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 01 Nov 2025 17:34:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4czNjc0X5tz3bf2;
	Sun,  2 Nov 2025 03:34:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=220.197.31.4
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762014883;
	cv=none; b=ACFg93mC59c52D+jx0ispJLBDBc8oK9EL/jco4vBS6+oa5qP3Vd730by08DJidwTnCLMkdQWxI0DJbw/zlrZcADD3yUqUhiL1sSRYCQi1ABFiegcgVVPyyYBaL/bLhlkRtNxKfj5Cina4UXplaIWoC6rdcTLGxC01XYDzjCE0fT04k/PyuUxHvMzTpWSTxq6kIn1MgOHnJyIdomoJgQMl2yWcWT5hTfLh2wHrpjtmvse/5BY1OphDYy4TxDcsPNkgBgr30FZK3EGIeezACb6OBXxj610wgroU5605OAgJCn52l+wMi8CK+Ehq9WCvp6lJJy5NiE9I4CMYwLjKOWXKg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762014883; c=relaxed/relaxed;
	bh=3VQIEWJRrZqUWBIlYJxpy6ioV+MlB2SKV2d469TV62M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kkgldLcpeHWyLSPjqHawlIj2w5a+ZZP0DyRH4Au1y55LD6jkGpbgoJmGPbcfqSTtM5qzlh0um2T1rAyG7KwbvcpId94aQOtIcne06+fzQh/edAJFJYXGeYmLbzqOkCwiFZqfCxXpqV7SJeh+lS/jNc05Cxw98ILDCNSsC1XXv8IT8kj8CAKmxfmzOCJOWu3ei2H2GPtHyQkRc6SUfMf2x/gamm+yGt1BxdUj1pUXs71oljByYh0H49walIbphI8qsYEUuLXqa82WCcjkLP99MBQheOFhEmBWKfZ4rBp9fmpQRm/ScHvNcpbSbW+CZHbog93FOYp1GCFrM2AD5VkpLw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=163.com; dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=TtEq1vpD; dkim-atps=neutral; spf=pass (client-ip=220.197.31.4; helo=m16.mail.163.com; envelope-from=18255117159@163.com; receiver=lists.ozlabs.org) smtp.mailfrom=163.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=TtEq1vpD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=163.com (client-ip=220.197.31.4; helo=m16.mail.163.com; envelope-from=18255117159@163.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 630 seconds by postgrey-1.37 at boromir; Sun, 02 Nov 2025 03:34:42 AEDT
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4czNjZ6GYXz2xnh
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  2 Nov 2025 03:34:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=3V
	QIEWJRrZqUWBIlYJxpy6ioV+MlB2SKV2d469TV62M=; b=TtEq1vpDhxs+q/92BZ
	xkUuxYPlpDFf25bJsffU+uROyvaSorqXGl9WnzgmfkTVimFjkYX6Y5Kya7oj3jVb
	4lNS8IlxoijbYUzhUe0rYnMIXrbdUUIcUBHZIn6jYTjrRb6GLfZdM+UG7uFqWQ/e
	X1tU0zJzAwgjeu/ilXAywoEyY=
Received: from zhb.. (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wCHBDkQNAZpNmGwAw--.59274S3;
	Sun, 02 Nov 2025 00:23:47 +0800 (CST)
From: Hans Zhang <18255117159@163.com>
To: mahesh@linux.ibm.com,
	bhelgaas@google.com
Cc: oohall@gmail.com,
	mani@kernel.org,
	lukas@wunner.de,
	linuxppc-dev@lists.ozlabs.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hans Zhang <18255117159@163.com>
Subject: [RESEND PATCH v4 1/2] PCI: Introduce pci_clear/set_config_dword()
Date: Sun,  2 Nov 2025 00:22:18 +0800
Message-Id: <20251101162219.12016-2-18255117159@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251101162219.12016-1-18255117159@163.com>
References: <20251101162219.12016-1-18255117159@163.com>
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
X-CM-TRANSID:_____wCHBDkQNAZpNmGwAw--.59274S3
X-Coremail-Antispam: 1Uf129KBjvJXoWrKw4rWrWxKrWxAFykCry7Awb_yoW8Jr15pF
	Z8CFyfGFyxGFnIk3WDXay8Aw18WrWkXFWIgrW3K3s8ZFW2ya4vvF909r17Jwn3GrWvvr45
	A393KFZY9r4qya7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pipBT5UUUUU=
X-Originating-IP: [240e:b8f:927e:1000:3c54:eb11:a795:c9c9]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/1tbiFR-4o2kGMU41FgAAsi
X-Spam-Status: No, score=0.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	FROM_LOCAL_DIGITS,FROM_LOCAL_HEX,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Add helper functions to clear or set bits in PCI config space.
These helpers reduce code duplication and improve readability for config
space modifications by encapsulating common read-modify-write patterns.

Signed-off-by: Hans Zhang <18255117159@163.com>
---
 include/linux/pci.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/linux/pci.h b/include/linux/pci.h
index 59876de13860..bb0dba2b7aee 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -1341,6 +1341,18 @@ static inline int pcie_capability_clear_dword(struct pci_dev *dev, int pos,
 	return pcie_capability_clear_and_set_dword(dev, pos, clear, 0);
 }
 
+static inline void pci_clear_config_dword(const struct pci_dev *dev, int pos,
+					  u32 clear)
+{
+	pci_clear_and_set_config_dword(dev, pos, clear, 0);
+}
+
+static inline void pci_set_config_dword(const struct pci_dev *dev, int pos,
+					u32 set)
+{
+	pci_clear_and_set_config_dword(dev, pos, 0, set);
+}
+
 /* User-space driven config access */
 int pci_user_read_config_byte(struct pci_dev *dev, int where, u8 *val);
 int pci_user_read_config_word(struct pci_dev *dev, int where, u16 *val);
-- 
2.25.1


