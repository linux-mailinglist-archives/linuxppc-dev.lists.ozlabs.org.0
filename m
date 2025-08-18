Return-Path: <linuxppc-dev+bounces-11095-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BFB6B2ADE3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Aug 2025 18:15:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c5HrM1c2Pz3ccS;
	Tue, 19 Aug 2025 02:15:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=220.197.31.3
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755533747;
	cv=none; b=BzvF7VFjBAKSA0QrXRRFz1TjtBEZhXy1OlM/T5sHR4BZA5uC7f7oRT/JEmqQ4mCed07MLf8SeWM0uKP93/8iU+NxQy2Exrhpwz3q0mjD1KCsYPU9/3k+Z7sk/ChXBRD0lR3JWmcO9g3AqXTiWrrX+gIdJtjDXhXAm+7FrEA+V8FcCGIa/EbLV+BCFQ26bcPHbeyJXdWVgYsafe+2dzlxeRJ4zDHY2egYirJVcPMMY82Bpqi2lrH3oN1s4MUD3nnkxaPIlFzdcSbA2VXKdeLcDyEtb4ARZ3SuupPi2LeznVn/jk6QBIx3I8GrzVS9Vc6VO/vRICAAnPXIDJrBFA5izQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755533747; c=relaxed/relaxed;
	bh=9tP1LLYdRr/BqHbJev6RqyxqZPPW7NhIMvgXJosQ1o8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QXuNae8Tal+rmrQCDsI1zg3smQIABw1+CqVtE1OM6Kfa9fj5a/dGu3GMHyoNE987WmTOHaowWPeTUQkdX5I0Z6+u97eNMvJl9B8zgjL7kAO0nrq3hTuuLKK6BK+g3N1cQkAi5V/fCp4Ws5fefU7MzjmN84tFrh88JODIyvo4ppu5vXtAtCN7OZh9hXtkxMJaKl1ZqrBXShHVGjKp16YFMA0uaaM6+CK9wwgLyIKND4kURBg4bCWVgOyX386MW97QpY5X/Om5XsLLoPaDSVFmkBuTk2q/q0MXNCVdo0NjoBzbdCMieuuYJ2llTNFEkbh+yMiWVxcFr2mht07XCHjHyg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=163.com; dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=KHnEZ0ly; dkim-atps=neutral; spf=pass (client-ip=220.197.31.3; helo=m16.mail.163.com; envelope-from=18255117159@163.com; receiver=lists.ozlabs.org) smtp.mailfrom=163.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=KHnEZ0ly;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=163.com (client-ip=220.197.31.3; helo=m16.mail.163.com; envelope-from=18255117159@163.com; receiver=lists.ozlabs.org)
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c5HrL1H36z3cbL
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Aug 2025 02:15:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=9t
	P1LLYdRr/BqHbJev6RqyxqZPPW7NhIMvgXJosQ1o8=; b=KHnEZ0lyVwzwdPNgVe
	Hyqi1jQNreJC1tNc25uUCxdOXYkUEW0iN6cYN+awwpff7+O0pk/mYlyMro4+r9ak
	2NRIE7ZNLc+KfErfpp6hZcHHxNiadaa4eM3x3kCSXMv9aZXHgwZZeQVG78gr1Z0C
	gNaGTsuyOc8pPqMTwh/RzVb44=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3b8FtUaNopYAWCw--.8667S2;
	Tue, 19 Aug 2025 00:14:38 +0800 (CST)
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
Subject: [PATCH v4 0/2] PCI: Introduce pci_clear/set_config_dword()
Date: Tue, 19 Aug 2025 00:14:29 +0800
Message-Id: <20250818161431.372590-1-18255117159@163.com>
X-Mailer: git-send-email 2.25.1
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
X-CM-TRANSID:_____wD3b8FtUaNopYAWCw--.8667S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxJrW3Zr17tFykJFyUCw1fCrg_yoW8XrWUpr
	WfZry3Xr47GFya9FW7WF12ka45Wan7AFWrGr13K34rZr43ZrW7XF9YqryrAF9rJrW8Jw4a
	9rs7WF109w1qkFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUjQ6dUUUUU=
X-Originating-IP: [240e:b8f:919b:3100:3980:6173:5059:2d2a]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/1tbiOhCto2ijSkC+8gACsr
X-Spam-Status: No, score=0.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	FROM_LOCAL_DIGITS,FROM_LOCAL_HEX,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY autolearn=disabled
	version=4.0.1 OzLabs 8
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


