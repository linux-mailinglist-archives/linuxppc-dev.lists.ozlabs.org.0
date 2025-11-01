Return-Path: <linuxppc-dev+bounces-13662-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B3BC282EB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 01 Nov 2025 17:35:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4czNjd62Llz3btM;
	Sun,  2 Nov 2025 03:34:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=117.135.210.4
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762014885;
	cv=none; b=VKSSSqPmx6v9d9bGbc3nJkBZGq4xSbIhyjNYigsC6WxwfStSaPDZgLppUOkqWR7Am2bs8+8LMQ5CgMQfdGH7dlyLAnuuDk2Lq30fnh6tQGs1/p0McXvBmel3GW2HlaS0iuc1PfElhr7Z9UmLhiz3xHIPz4M0GcyYV9tfjO2ziDoDBfB7dAyF1LI1WLBe/PZJOF/Y7J3NrFnUeTfKtWrS8HgOVYb2LXEjy+7bYsjghP4QpqDIqfhhiodVXdQjaig/uM9ylg9bdGrfoKMjUHvBSFdJK2NajWZi73GwJSTj/OPeQwGEICStOSnUQqd8PEUr3XMWJpSbXB8Mtjewi0U7ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762014885; c=relaxed/relaxed;
	bh=9tP1LLYdRr/BqHbJev6RqyxqZPPW7NhIMvgXJosQ1o8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kfQAvZikMZwdtfNKaviInpHWidKuW1pdm0zGdVlC2/96/uyGLDsVnq1Ij/QfVD48GLK2R9H9C6q2OVojfmBqThFX6F28bSLEpfR5Jitm4g1EmqyhVInCh7ISO/3qM3wo8+kkrkERClYJhMRZx5sgJkaLJP+6X7y/pZg6yp8sz4Pw6mbhBV6F79qn1y+aCJx0zfe3gf45B+6deB6K1AW6/5fEA7DooJNvN8fEQlII4UC1BYQMqvdb07oEZF+uAYuveLVQ4Kc/zwJYPeGVofqnTduMU8crpWTWSllLk00miyNmxYC/RqGw4vP2JPMTsmVyL8W0WDmtwkzHHXgt4HXSDA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=163.com; dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=WlW5KisV; dkim-atps=neutral; spf=pass (client-ip=117.135.210.4; helo=m16.mail.163.com; envelope-from=18255117159@163.com; receiver=lists.ozlabs.org) smtp.mailfrom=163.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=WlW5KisV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=163.com (client-ip=117.135.210.4; helo=m16.mail.163.com; envelope-from=18255117159@163.com; receiver=lists.ozlabs.org)
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4czNjc26Dbz3bfZ
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  2 Nov 2025 03:34:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=9t
	P1LLYdRr/BqHbJev6RqyxqZPPW7NhIMvgXJosQ1o8=; b=WlW5KisVw+/w/PZOId
	7TL1828mg4ukbv3DgW8Z+zOiugVKyLpRGtWvuPxBCeBL7QNR8S6TuntuNlPfLyH7
	SHhxqrwwL39bcbFt4xGjIa2kqrk8SAqNSDA07MAOzZsjtCO8Gsjedgdbu/CXavXv
	MJqbec2Gcpw7otVWbsp66TbdM=
Received: from zhb.. (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wCHBDkQNAZpNmGwAw--.59274S2;
	Sun, 02 Nov 2025 00:23:45 +0800 (CST)
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
Subject: [RESEND PATCH v4 0/2] PCI: Introduce pci_clear/set_config_dword()
Date: Sun,  2 Nov 2025 00:22:17 +0800
Message-Id: <20251101162219.12016-1-18255117159@163.com>
X-Mailer: git-send-email 2.34.1
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
X-CM-TRANSID:_____wCHBDkQNAZpNmGwAw--.59274S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxJrW3Zr17tFykJFyUCw1fCrg_yoW8XrWUpr
	WfZry3Xr47GFya9FW7WF12ka45Wan7AFWrGr13K34rZr43ZrW7XF9YqryrAF9rJrW8Jw4a
	9rs7WF109w1qkFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRX_-DUUUUU=
X-Originating-IP: [240e:b8f:927e:1000:3c54:eb11:a795:c9c9]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/1tbiDw74o2kGMDUqJQABs+
X-Spam-Status: No, score=0.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	FROM_LOCAL_DIGITS,FROM_LOCAL_HEX,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This series introduces auxiliary functions for the PCI configuration space
and simplifies the read and write operations of the AER driver, reducing a
lot of repetitive code.

Patch 1 adds pci_clear_config_dword() and pci_set_config_dword() helpers
to reduce repetitive read-modify-write sequences when modifying PCI config
space. These helpers improve code readability and maintainability.

Patch 2 refactors the PCIe AER driver to use these new helpers,
eliminating manual read-modify-write patterns and intermediate variable
in several functions. This results in cleaner and more concise code.

---
Changes for v4:
- Introduce pci_clear/set_config_dword()

Changes for v3:
https://patchwork.kernel.org/project/linux-pci/patch/20250816161743.340684-1-18255117159@163.com/

- Rebase to v6.17-rc1.
- The patch commit message were modified.
- Add Acked-by: Manivannan Sadhasivam <mani@kernel.org>

Changes for v2:
- The patch commit message were modified.
- New optimizations for the functions disable_ecrc_checking, aer_enable_irq, and aer_disable_irq have been added.
---

Hans Zhang (2):
  PCI: Introduce pci_clear/set_config_dword()
  PCI/AER: Use pci_clear/set_config_dword to simplify code

 drivers/pci/pcie/aer.c | 29 ++++++++++-------------------
 include/linux/pci.h    | 12 ++++++++++++
 2 files changed, 22 insertions(+), 19 deletions(-)


base-commit: 8742b2d8935f476449ef37e263bc4da3295c7b58
-- 
2.25.1


