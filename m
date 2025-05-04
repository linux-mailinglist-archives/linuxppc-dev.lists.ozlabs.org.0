Return-Path: <linuxppc-dev+bounces-8276-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F842AA896D
	for <lists+linuxppc-dev@lfdr.de>; Sun,  4 May 2025 23:20:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZrHcl4y0Nz2xfB;
	Mon,  5 May 2025 07:20:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=117.135.210.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746374390;
	cv=none; b=RyPBJKsPjpEHY/SEOHzX5PD06WWL0ynZJUFzR9mWKGg3utyd9J2l7hPMIxpqV+Bg69vBsE+B6X5K0LLbbOrE5amI8Uv+4ILNek+Nqd3q4WArnH8PN3iafH01Sp3e4+3FnBXfep6LWsW450VG3svNGJFJbQQPUzWNGm7N+B6weRvQ6838c7aSfJXW6vRBF47o6+K4aUtCPcOW/6pI/vRB1/zdVRovtn15Zf8l213MUuv+lH48+Hefr84hU5ZkvBFdi916vHUZKVBgKKfHnAwLM0QB150H0SDSI5AQtGUGIw23UhuJHmuC+WhYD25y2e/h0XyI3t9ccTp6v2CvwVOggw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746374390; c=relaxed/relaxed;
	bh=iZJH32h/nY81Ou36LPNReN8OUgsRTOeKJQp89h9i674=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FYdyqysv9qXL5GmXm1OZg681qpRb/b12CHYwWG/k20XIFV96iEO30uj1caitjQ06J4MT/jUxaDYD5KF8W5lij9FU3vgrt/6KTFXWCL71W3y2/gzVb5DyIEqbPGiwu9XR1nHYZeY862bb1djOLnkeYwQvViDL90jKUwWH1t5/akkmwwOPA6XsCXisi7d3NMDgwhjWY2y+56bXvniuA364W9PsBSs+SLt8drx6soZsR/oIYXqJ9DFiAkXy5HOOK43caWP7ZRwf/Ywr/nzkFOwTQEW6w0pNN6QJx3D4E2R7Cqmh+2b3SxwWZVn+dDdtnyPRHzMNSM3DC505wuxhC3+Faw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=163.com; dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=d/ttsc9l; dkim-atps=neutral; spf=pass (client-ip=117.135.210.5; helo=m16.mail.163.com; envelope-from=18255117159@163.com; receiver=lists.ozlabs.org) smtp.mailfrom=163.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=d/ttsc9l;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=163.com (client-ip=117.135.210.5; helo=m16.mail.163.com; envelope-from=18255117159@163.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 926 seconds by postgrey-1.37 at boromir; Mon, 05 May 2025 01:59:47 AEST
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zr8Vq4SGvz2xgp
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 May 2025 01:59:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=iZJH3
	2h/nY81Ou36LPNReN8OUgsRTOeKJQp89h9i674=; b=d/ttsc9lYiDA8NMzyl89q
	ySKoYflxeMqwgisxmNc/BVipBDxkrGD49MIigHPfvkhcYcRqidjIzTlqfziKFDTi
	hWRKK60ylDV7sFwDoTu42gawnEq5mvCA8pLnGI8DG2bYlJa2wo708vtVp+s2tszI
	7tfColQKtOGeE6Uoi17mG0=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wAXIWtAixdo8td6Eg--.52915S2;
	Sun, 04 May 2025 23:44:01 +0800 (CST)
From: Hans Zhang <18255117159@163.com>
To: mahesh@linux.ibm.com,
	bhelgaas@google.com
Cc: oohall@gmail.com,
	manivannan.sadhasivam@linaro.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hans Zhang <18255117159@163.com>
Subject: [PATCH] PCI/AER: Use pci_clear_and_set_config_dword() to simplify mask updates
Date: Sun,  4 May 2025 23:43:53 +0800
Message-Id: <20250504154353.180844-1-18255117159@163.com>
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
X-CM-TRANSID:_____wAXIWtAixdo8td6Eg--.52915S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Cr1fCw1xCr4fGw4UWrWrAFb_yoW8GFyxpF
	W3AFy5Gr48Jr1YvrWDXayktFn8Gas7t3y8KrW3Gas3ZF43ZFZrtryavr1UJ345tFZ0qr45
	Xw1rKa18XF45taUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zt-e58UUUUU=
X-Originating-IP: [124.79.128.52]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbBDwVDo2gXf9nrMQAAsp
X-Spam-Status: No, score=0.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	FROM_LOCAL_DIGITS,FROM_LOCAL_HEX,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H5,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Replace the manual read-modify-write sequences in
pci_aer_unmask_internal_errors()with pci_clear_and_set_config_dword().
This function performs the read/write operations atomically and reduces
code duplication.

Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/pci/pcie/aer.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index a1cf8c7ef628..20d2d7419fa4 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -953,15 +953,12 @@ static bool find_source_device(struct pci_dev *parent,
 static void pci_aer_unmask_internal_errors(struct pci_dev *dev)
 {
 	int aer = dev->aer_cap;
-	u32 mask;
 
-	pci_read_config_dword(dev, aer + PCI_ERR_UNCOR_MASK, &mask);
-	mask &= ~PCI_ERR_UNC_INTN;
-	pci_write_config_dword(dev, aer + PCI_ERR_UNCOR_MASK, mask);
+	pci_clear_and_set_config_dword(dev, aer + PCI_ERR_UNCOR_MASK,
+				       PCI_ERR_UNC_INTN, 0);
 
-	pci_read_config_dword(dev, aer + PCI_ERR_COR_MASK, &mask);
-	mask &= ~PCI_ERR_COR_INTERNAL;
-	pci_write_config_dword(dev, aer + PCI_ERR_COR_MASK, mask);
+	pci_clear_and_set_config_dword(dev, aer + PCI_ERR_COR_MASK,
+				       PCI_ERR_COR_INTERNAL, 0);
 }
 
 static bool is_cxl_mem_dev(struct pci_dev *dev)

base-commit: ca91b9500108d4cf083a635c2e11c884d5dd20ea
-- 
2.25.1


