Return-Path: <linuxppc-dev+bounces-11094-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 72FC6B2ADDE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Aug 2025 18:15:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c5Hqm0vscz3cbW;
	Tue, 19 Aug 2025 02:15:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=117.135.210.2
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755533716;
	cv=none; b=FuM0CJD9dKDF3jmTcPgg28sFK+8XPNyS39FawhuZ29ph50EGG3VvwStdEcZuWge6PuYrykCoZtv+MAym04JWV6ro3dVx8P34A+aQbB6Z0m2jLqyLHyHixJtQo76KHp9TfiZ/h3B29391CwgB4hQBKYS7O3wbzQRFlvR9MXT72+WfV6xBycVRt42K17F6YGHRoLsA0Yk1FL5Fr8LWD48K/qcsTQsTxvoIwnckOX2oWck63t88i32rOk5HIvKLw7qDW9Kbk8+/iG8UHyee2gUt6JN0IjrSiTcScMy+WtAsXzQYAEGySVM2GO0HFkXFdK9w9mVHqY1IjARivSKacmgIpw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755533716; c=relaxed/relaxed;
	bh=3VQIEWJRrZqUWBIlYJxpy6ioV+MlB2SKV2d469TV62M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VSKLXHYKaPSLa7ZN3Ol/bYBCUtmbI/hh2NZLE1Pl7sM1DMT3/KPE0dw3XxTdOvmcHzGlrHb+hompxFLctAxvBk9JkWZLZwY5yrCXoYBj0qPiF2QOkEbBDsPFtUbAFacZ8gQGMih4zp/LYUr4fuMZi2lzYVGT/SDWlgz5eFvSN0LPOv/su5AZcOU33k7Lju0221JoBm1SP6SPYyROo9gLsuKdMG9s5/4sFrQsxCXoeoFNjRVmPK8eaYx4paW5OFVyM05nYx9/fXCpv3eOef7tzFuZwmoFahb/3IpLg3UlfzWAr2iLlBpsgQjkwcXl9Wlh74jKP25Ug7pzdzEUzajWtQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=163.com; dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=nyVfvql5; dkim-atps=neutral; spf=pass (client-ip=117.135.210.2; helo=m16.mail.163.com; envelope-from=18255117159@163.com; receiver=lists.ozlabs.org) smtp.mailfrom=163.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=nyVfvql5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=163.com (client-ip=117.135.210.2; helo=m16.mail.163.com; envelope-from=18255117159@163.com; receiver=lists.ozlabs.org)
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c5Hqg4Y2Wz3cbL
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Aug 2025 02:15:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=3V
	QIEWJRrZqUWBIlYJxpy6ioV+MlB2SKV2d469TV62M=; b=nyVfvql5VzH3VYcRvZ
	HkByrzNJt+wvtJLajSfmebqiaWrMCh+O1OhoMshxkui7bwmRW8C37rdAdQLG3CHc
	ErE9jMHHVtQZRysrgFi4w0XpKv4u7/H7j/zL1I9HXRHnrkW6V/t4B+axJGkompxS
	bdlMw+1Tx6z08riI6+hCCouAg=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3b8FtUaNopYAWCw--.8667S3;
	Tue, 19 Aug 2025 00:14:41 +0800 (CST)
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
Subject: [PATCH v4 1/2] PCI: Introduce pci_clear/set_config_dword()
Date: Tue, 19 Aug 2025 00:14:30 +0800
Message-Id: <20250818161431.372590-2-18255117159@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250818161431.372590-1-18255117159@163.com>
References: <20250818161431.372590-1-18255117159@163.com>
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
X-CM-TRANSID:_____wD3b8FtUaNopYAWCw--.8667S3
X-Coremail-Antispam: 1Uf129KBjvJXoWrKw4rWrWxKrWxAFykCry7Awb_yoW8Jr15pF
	Z8CFyfGFyxGFnIk3WDXay8Aw18WrWkXFWIgrW3K3s8ZFW2ya4vvF909r17Jwn3GrWvvr45
	A393KFZY9r4qya7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pR5rcfUUUUU=
X-Originating-IP: [240e:b8f:919b:3100:3980:6173:5059:2d2a]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/1tbiWw6to2ijSyq4ngAAsX
X-Spam-Status: No, score=0.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	FROM_LOCAL_DIGITS,FROM_LOCAL_HEX,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY autolearn=disabled
	version=4.0.1 OzLabs 8
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


