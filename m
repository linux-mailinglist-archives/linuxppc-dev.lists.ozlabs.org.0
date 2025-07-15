Return-Path: <linuxppc-dev+bounces-10256-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 682A5B06892
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jul 2025 23:32:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bhXSw1g9pz2xgQ;
	Wed, 16 Jul 2025 07:32:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=23.155.224.40
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752615120;
	cv=none; b=fW6FCgka1UMLnwS58AnUJSjf/3X32dsF9qLPEWr1yA/hTPtUhBkciw+BAFynmv2eWeA08pm2ood0+UQ3DUsaVoWPog5ZF1zxROdJwjFAzzeeL6QMZO/N2WCpGjhSpm3ZbuEsohJVeyOmjAQwkqXOpnmKZiZ7X/n04S5rb7EdiZI+7Q/dlQWlnBw0L/NWt5unvPxD+h+Occ0P+2ceORHR/WgnmocBbKvNJ5Uo07Aw628k0hJU5AgNVJrMBaDmsC2ERbxPWZhf9TshgT241KvOMNi8KRcHyrg2FsCdIxGBGPQRUy9ETD1loCd/1qZ4hCXQnozf1Fjr5SAQI/5X6kiKqw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752615120; c=relaxed/relaxed;
	bh=pCmOltlEYd6S50ZKZ9a1KSNaWOyP6XSx2ggNDbtS3qY=;
	h=Date:From:To:Cc:Message-ID:Subject:MIME-Version:Content-Type; b=OyIyfDWmGNp14ewP7EPNeCgBNrWG9V7RGR8Uso0/gc87QX2gW37RMcHKqn9BbAaH0UAhmT1nLViUqOd21Z9a73y0XbXTHqq1sVU+0Ir2EQ2RzCG/Tgs+5Xyg/uOwgKkVIv7da5y+HN1d9N7uUESQoVFDo7s8Yljaaz8w83+IognbjtFzUqtIgTWEagy/6LF3nJCK4Px7FOQGQqoEHcx0ruf+VFbHBjWTBOf2IbFU9cMjCyNIPu7L9/siJfZ8mGGPZgWKkC8vCFNUIMBoXx5TxPKAW9y85hDWaKkmLWsuDdClvr/RHhzF3h8yw43obdDFJnSZUQHUhg4LBN+mpZ9qwA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com; dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=Vg3Bzzfm; dkim-atps=neutral; spf=pass (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=lists.ozlabs.org) smtp.mailfrom=raptorengineering.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=Vg3Bzzfm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=raptorengineering.com (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=lists.ozlabs.org)
Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bhXSs4gB9z2xfR
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Jul 2025 07:31:57 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 431558287698;
	Tue, 15 Jul 2025 16:31:54 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id HoGop4iZv_d7; Tue, 15 Jul 2025 16:31:53 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 79A28828832D;
	Tue, 15 Jul 2025 16:31:53 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 79A28828832D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1752615113; bh=pCmOltlEYd6S50ZKZ9a1KSNaWOyP6XSx2ggNDbtS3qY=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=Vg3Bzzfm5Xh1QPI3DWetWQCB1+4tffLZ9HAlb5Dfyu/JuU172d23HcSwwIp3xtrq8
	 eMGZ145VKXy2v62+pZ96KzelnKgbIOSvbmuzc3BkwOOAgAIgfQbIYmZXywI0fbMCcM
	 d001tj2jbFpckzg2w7fSLFhZSctJMKoD4XS80jdI=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id svjTAW6EvY7k; Tue, 15 Jul 2025 16:31:53 -0500 (CDT)
Received: from vali.starlink.edu (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 2BC788287698;
	Tue, 15 Jul 2025 16:31:53 -0500 (CDT)
Date: Tue, 15 Jul 2025 16:31:49 -0500 (CDT)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-pci <linux-pci@vger.kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, 
	christophe leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, 
	Shawn Anastasio <sanastasio@raptorengineering.com>
Message-ID: <1268570622.1359844.1752615109932.JavaMail.zimbra@raptorengineeringinc.com>
Subject: [PATCH v3 0/6] PowerNV PCIe Hotplug Driver Fixes
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
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC138 (Linux)/8.5.0_GA_3042)
Thread-Index: XyF2OaMn/3q+H+nwsGaxXLVF4U4PFw==
Thread-Topic: PowerNV PCIe Hotplug Driver Fixes
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hello all,

This series includes several fixes for bugs in the PowerNV PCIe hotplug
driver that were discovered in testing with a Microsemi Switchtec PM8533
PFX 48xG3 PCIe switch on a PowerNV system, as well as one workaround for
PCIe switches that don't correctly implement slot presence detection
such as the aforementioned one. Without the workaround, the switch works
and downstream devices can be hot-unplugged, but the devices never come
back online after being plugged in again until the system is rebooted.
Other hotplug drivers (like pciehp_hpc) use a similar workaround.

Also included are fixes for the EEH driver to make it hotplug safe,
and a small patch to enable all three attention indicator states per
the PCIe specification.

Thanks,

Shawn Anastasio (2):
  PCI: pnv_php: Properly clean up allocated IRQs on unplug
  PCI: pnv_php: Work around switches with broken presence detection

Timothy Pearson (4):
  powerpc/eeh: Export eeh_unfreeze_pe()
  powerpc/eeh: Make EEH driver device hotplug safe
  PCI: pnv_php: Fix surprise plug detection and recovery
  PCI: pnv_php: Enable third attention indicator state

 arch/powerpc/kernel/eeh.c         |   1 +
 arch/powerpc/kernel/eeh_driver.c  |  48 ++++--
 arch/powerpc/kernel/eeh_pe.c      |  10 +-
 arch/powerpc/kernel/pci-hotplug.c |   3 +
 drivers/pci/hotplug/pnv_php.c     | 244 +++++++++++++++++++++++++++---
 5 files changed, 263 insertions(+), 43 deletions(-)

-- 
2.39.5

