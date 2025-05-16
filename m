Return-Path: <linuxppc-dev+bounces-8611-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89783ABA143
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 May 2025 18:56:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZzYBH6qPQz2xGY;
	Sat, 17 May 2025 02:56:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=220.197.31.4
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747414567;
	cv=none; b=HhSR/OD4iijudOyFhPoc3Mx4hKupVbM1IBoNLU950U6CGs1swZElGfnkuSgpcMD8/kXrY811e1/d0z1vO6cd5FnZpSh0ldNnpNuqyTUJG2bTkzeYjahBBODQ/kXwkomwtD2HqRsrZxvyPm0zikCw4svt/olsGam7aZxM6FZGj3COiabFjhRyCdHhLYn7bsELK1LI6R1OpC037YvVvyTcJei7TAm0rJ4l3gLxmtFEUG2kjbeZ5Yn2c0wvXv0mTTuQx3PLdy61ZEpjdJbShQzXFcFP1aGe4Scloi9RH5165jIlbyjSdSXMThQIdH5gXwvnOPhf3PacE1pSVMdGkktFtg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747414567; c=relaxed/relaxed;
	bh=8QnkpC7DXTTaoBj8cG/gGZoH/93W5gjIXcCK742TD6s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PnPTID2ySUBCzz5+kZiNGMNoUCGHYVWXA0gC0YIma4qAVzBd6NrLK76mLL6T5e69KZ6ZXdz4j5drTbtSgAhMdqyCZdI+UQ/5hl/ci6ib0J2m+JUUBTJcpmlYSr9kuYmk74+ZGuHeqn2tmxV6tMo6RbxovAM1a8Sas5OsyDQ+7MxjIVu7pZC/s5mjdeUhS286j/fJQkEtvVvp8+TsyzxEQCxtFa/DhGuFqoTPkasjQfOgKHFYonIXPUmRHur/oe323tBiQH5X0jRxks/qyRqILSLjaO98WG2btqSDHiXt+7WB4SZQdk7ch4Kllwi7AIkqVusS2oJKTCSwmYpHkAWSIw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=163.com; dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=HwewPV4V; dkim-atps=neutral; spf=pass (client-ip=220.197.31.4; helo=m16.mail.163.com; envelope-from=18255117159@163.com; receiver=lists.ozlabs.org) smtp.mailfrom=163.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=HwewPV4V;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=163.com (client-ip=220.197.31.4; helo=m16.mail.163.com; envelope-from=18255117159@163.com; receiver=lists.ozlabs.org)
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZzYBG1dS1z2xHX
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 May 2025 02:56:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=8Q
	nkpC7DXTTaoBj8cG/gGZoH/93W5gjIXcCK742TD6s=; b=HwewPV4VfITRmslAMM
	3rjbozB+mhgs+Jcyz+QrF3aXobswi55iDa2sQX9YFmqBPfXa5gXrBgImjwC28McD
	Q62RCrs9Le2YFwa3Ta8AzBkum8/jVL7Z74ZAzJcSoV95SBMp+pbinzh5xzbaEhNv
	Xl5ork5AIz7XUMaNMSQ2v/vhQ=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wB3lOX6bSdoVElgBw--.64634S3;
	Sat, 17 May 2025 00:55:23 +0800 (CST)
From: Hans Zhang <18255117159@163.com>
To: bhelgaas@google.com,
	tglx@linutronix.de,
	kw@linux.com,
	manivannan.sadhasivam@linaro.org,
	mahesh@linux.ibm.com
Cc: oohall@gmail.com,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	Hans Zhang <18255117159@163.com>
Subject: [PATCH 1/4] pci: implement "pci=aer_panic"
Date: Sat, 17 May 2025 00:55:15 +0800
Message-Id: <20250516165518.125495-2-18255117159@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250516165518.125495-1-18255117159@163.com>
References: <20250516165518.125495-1-18255117159@163.com>
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
X-CM-TRANSID:_____wB3lOX6bSdoVElgBw--.64634S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7tw18uw48XFW7Aw18XF1kXwb_yoW8Wr48pr
	4DK39Iga93Jw1Yk3WDAFWIga4jva93C34rG3ykJw1Fq3s0kFyjqw4aqr43uFWkW3409F45
	AFZIqa4jkw1xAFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pixuc_UUUUU=
X-Originating-IP: [124.79.128.52]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbBDwpPo2gnaDaNOAAAsN
X-Spam-Status: No, score=0.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	FROM_LOCAL_DIGITS,FROM_LOCAL_HEX,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Add a new "aer_panic" parameter to force kernel panic on unrecoverable
PCIe Advanced Error Reporting (AER) errors. This is designed for systems
where unresolved PCIe bus hangs require immediate reboot to maintain
service availability.

The option can be enabled via "pci=aer_panic" on the kernel command line.
It prepares for safer error handling in mission-critical environments
by bypassing indefinite hangs and triggering controlled panic.

Signed-off-by: Hans Zhang <18255117159@163.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 8f75ec177399..a4a221bb1636 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -4679,6 +4679,13 @@
 		noaer		[PCIE] If the PCIEAER kernel config parameter is
 				enabled, this kernel boot option can be used to
 				disable the use of PCIE advanced error reporting.
+		aer_panic	[PCIE] Force kernel panic on unrecoverable
+				PCIe Advanced Error Reporting (AER) errors when
+				device recovery fails. This is recommended for
+				systems where bus hangs from unresolved errors
+				require immediate reboot. Use with caution as
+				this bypasses normal error recovery procedures.
+				Requires CONFIG_PCIEAER.
 		nodomains	[PCI] Disable support for multiple PCI
 				root domains (aka PCI segments, in ACPI-speak).
 		nommconf	[X86] Disable use of MMCONFIG for PCI
-- 
2.25.1


