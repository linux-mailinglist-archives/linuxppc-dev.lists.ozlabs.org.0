Return-Path: <linuxppc-dev+bounces-8610-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 52083ABA141
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 May 2025 18:56:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZzYBH2dxtz2xKN;
	Sat, 17 May 2025 02:56:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=220.197.31.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747414567;
	cv=none; b=Af1Vm6QCBeWOhMgJ+5B5u6Of0jxPaYV0OV+BQLn0hcOMGS0ESJdgKsgiySPHIAmtdwBRKfs+ewOnExhQbA94PIm3T8djIJq/uhV9EAyUtdqjyxeMR5EUvcf+HHK+vR+8lmdBcEq3UIbABr/S34ggvL36r8Yt1ciMyWSPFikVfPC2PnLmiRGyj6SEqJzLX8CaaEt06yTVQQ2sonWRZrEfxKeLwg0AnycAVusIf26ZRcbUKXJ5XV0F1Chnn0ZJWlQZ4Q3MqB+67OrdAS4+pObZoEQ3+mVQcVipXvNyuTK+VQ11IFE7psvJTcP/7n6QOfL3AktQLUWF+naHF7/+jX7f2w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747414567; c=relaxed/relaxed;
	bh=74e2ez+NMjSxbCJcFI3DWZZ4H948dIsFZZ+N5kavxho=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NMCE9+xepRKsX23XwUA/T5uaH14zrZJ1FBxi7YMLoamXSdhwjqrSzwOtr2pC4D7Ra2PR9510TQFmRZM10egs1WFOCyNWch/C+/HPpuw8yKPh7id5Xo5W7equOBSgCk1mO+WU1NTJ2nW4wdwyultjK7+0fI7J3uXHyNcaVFFinxaJ7atBNPI8oW8TTPVa8FmyNSK9JUh+G6s+lstI8CyzhAg4v5H5cbke5CyXcYZxfJxUsuVS7MNdgrqJBxSGlFdLTIuGnKWs+L9BOvGBmhurTTFUT3L61zdySnFQw4K/3GmwGX2uL/h91QOLFKcnWPHUW9nJYTWxkWn8ss3HGZAq3w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=163.com; dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=mUGyHCPE; dkim-atps=neutral; spf=pass (client-ip=220.197.31.5; helo=m16.mail.163.com; envelope-from=18255117159@163.com; receiver=lists.ozlabs.org) smtp.mailfrom=163.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=mUGyHCPE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=163.com (client-ip=220.197.31.5; helo=m16.mail.163.com; envelope-from=18255117159@163.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 179 seconds by postgrey-1.37 at boromir; Sat, 17 May 2025 02:56:05 AEST
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZzYBF74Qwz2xGY
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 May 2025 02:56:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=74
	e2ez+NMjSxbCJcFI3DWZZ4H948dIsFZZ+N5kavxho=; b=mUGyHCPEgDfrXMi0jq
	P2CB3/AWyH8hJCzTLolqMhI0e4V4IGviCBt0At2utWdBLd65FOARJWRL4mrtOOY/
	CrakLOCLKCbBxFEtyBNBgi8NAGpwjMfyLR2HY01PNkx664iLsdRP/tI6JAQbqiaT
	kU54I8xefzQvnVO28rXejKLAo=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wB3lOX6bSdoVElgBw--.64634S6;
	Sat, 17 May 2025 00:55:25 +0800 (CST)
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
	Hans Zhang <hans.zhang@cixtech.com>
Subject: [PATCH 4/4] PCI/AER: Trigger kernel panic on recovery failure if aer_panic is set
Date: Sat, 17 May 2025 00:55:18 +0800
Message-Id: <20250516165518.125495-5-18255117159@163.com>
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
X-CM-TRANSID:_____wB3lOX6bSdoVElgBw--.64634S6
X-Coremail-Antispam: 1Uf129KBjvdXoWrZFy8JF47WrW3ZF48Ww17Wrg_yoWDurb_Za
	y0vr97JrW0vF95Aa1Yvr15Zryjk3Z2g3y8uw10qFyrJFWayrnFga4DXFyayr98CrsYyFyD
	Awn8Zr1rAr18CjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8_cTJUUUUU==
X-Originating-IP: [124.79.128.52]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbBDwlPo2gnaDaNVQABsi
X-Spam-Status: No, score=0.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	FROM_LOCAL_DIGITS,FROM_LOCAL_HEX,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Hans Zhang <hans.zhang@cixtech.com>

Modify pcie_do_recovery() to panic the system when device recovery fails
and aer_panic is enabled via kernel command-line. This addresses scenarios
where PCIe link errors cause bus hangs requiring forced reboots.

Signed-off-by: Hans Zhang <hans.zhang@cixtech.com>
---
 drivers/pci/pcie/err.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/pcie/err.c b/drivers/pci/pcie/err.c
index 31090770fffc..f0994f66d462 100644
--- a/drivers/pci/pcie/err.c
+++ b/drivers/pci/pcie/err.c
@@ -271,8 +271,12 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
 
 	pci_uevent_ers(bridge, PCI_ERS_RESULT_DISCONNECT);
 
-	/* TODO: Should kernel panic here? */
-	pci_info(bridge, "device recovery failed\n");
+	if (!pci_aer_panic_enabled())
+		pci_info(bridge, "%s: device recovery failed\n",
+			 pci_name(bridge));
+	else
+		panic("Kernel panic: %s: device recovery failed\n",
+		      pci_name(bridge));
 
 	return status;
 }
-- 
2.25.1


