Return-Path: <linuxppc-dev+bounces-8608-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C9CABA10E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 May 2025 18:53:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZzY6r4xsnz2y8l;
	Sat, 17 May 2025 02:53:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=117.135.210.4
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747414388;
	cv=none; b=MkWLO53q+1YwLgZY3a8yzsnKshLKA2dy+iTe1sR6aEd17kr1iqpfzUnhfH0BIM389AMYUd5Ea0ijdgDFsYKOCyqViGOLwoePcQEyjLcg/VuZSFUZOev7mdQJyKeFkVomkh4W6rM3ldjlpzj8dbtfpjuDzhLRUEvtiUm18MPzY9eqjTScnrd0ax3j6tRU63GYihP7qNH5vEjOi3uBFi5kolwlZx35gsXVgkU7Qn/jBmwMBI0eLMaSBFH2sSB/ZuHcqOmkx2euYBKijxt7eQtG1B/DG7bPjmB0O3pvzJ98sIc1CEd71bKVXIPhWh0JiSMQybe7pVu5R3jmfczwNhZxXg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747414388; c=relaxed/relaxed;
	bh=zKfG+U01Noy/xyIUU1fu+yTBbwmBMuvCo8WgyfdyiDc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ae5yUqtikO0uznTlnWVCjMchdFc7wJaAGtwTsAve6A0Nextema86Eti41R93UATsjuRTbn3dBXBuDplel64JsnfytepvYJD/tirtopCnHBI4J9VZOzvFTXVVTaBpTxM97asn6taBMnkkre1VIGYqL0Jli+Mg2vcDxdC4s2tX9aeBP1AyVqsp2/bZ/2WubVKrdl3jZeX+bKbxFxnobz7D1B5KUUlaNxStVbjCZ00QGEuswmYRFGOO5iyCsZrfyf0wtaZgvUKmkIxwEd5/Pdn02TKeUboDCVuwEA6BF23I2ab8P8LdDVn5yTX+cbS2Eca3ANM2TMVI2J9V4TWvigecVA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=163.com; dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=gMbhFKJI; dkim-atps=neutral; spf=pass (client-ip=117.135.210.4; helo=m16.mail.163.com; envelope-from=18255117159@163.com; receiver=lists.ozlabs.org) smtp.mailfrom=163.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=gMbhFKJI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=163.com (client-ip=117.135.210.4; helo=m16.mail.163.com; envelope-from=18255117159@163.com; receiver=lists.ozlabs.org)
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZzY6n6fCcz2xsW
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 May 2025 02:53:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=zK
	fG+U01Noy/xyIUU1fu+yTBbwmBMuvCo8WgyfdyiDc=; b=gMbhFKJIKu4t8s7/p3
	eqajkqTxi554DWlCWATYq+kVV5RUkdC/681MyiNLS8opTY5mlvfmUzcVRQ2lJZI0
	wlIzI7sy+tOXKlu0xoR4Lm8xir2Ojo/avIKy5WE0BYXbMh6xDnbfXi0t1kroGiXa
	yB8DKgMt/jMKKR8/tFVGsuC+k=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wDn1+RLbSdo12CoBw--.59952S2;
	Sat, 17 May 2025 00:52:28 +0800 (CST)
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
Subject: [PATCH 0/2] PCI: Convert MSI and AER state tracking variables to bool type
Date: Sat, 17 May 2025 00:52:21 +0800
Message-Id: <20250516165223.125083-1-18255117159@163.com>
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
X-CM-TRANSID:_____wDn1+RLbSdo12CoBw--.59952S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7XFWxAw17tw4rtFWrtryxXwb_yoWftrg_u3
	4kXrW7Kr4j9rsrAF1Fvr4fZryY93y0vF1kXw1Fvryayas7Zw1UXFWUXr95u3WfWFn3tFyY
	9wnrArnFyr1xujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRuzuWtUUUUU==
X-Originating-IP: [124.79.128.52]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/1tbiWx1Po2gnaWRfNwAAsA
X-Spam-Status: No, score=0.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	FROM_LOCAL_DIGITS,FROM_LOCAL_HEX,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This patch series converts MSI/AER state tracking variables from int to
bool type to improve code clarity and align with kernel coding standards.

These variables inherently represent boolean states (enabled/disabled).
Existing code already treats them as truth values in condition checks.
Explicit bool type eliminates ambiguity between integer 1/0 and
true/false. Follows modern kernel practices for state tracking with proper
type semantics.

No functional changes - pure code cleanup to enhance readability and
maintainability.

Hans Zhang (2):
  PCI/MSI: Use bool for MSI enable state tracking
  PCI/AER: Use bool for AER disable state tracking

 drivers/pci/msi/api.c  | 2 +-
 drivers/pci/msi/msi.c  | 4 ++--
 drivers/pci/msi/msi.h  | 2 +-
 drivers/pci/pcie/aer.c | 4 ++--
 include/linux/pci.h    | 4 ++--
 5 files changed, 8 insertions(+), 8 deletions(-)


base-commit: fee3e843b309444f48157e2188efa6818bae85cf
-- 
2.25.1


