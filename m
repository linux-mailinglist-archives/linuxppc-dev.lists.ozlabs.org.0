Return-Path: <linuxppc-dev+bounces-9448-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6198DADF316
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jun 2025 18:54:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bMqbJ2180z30T9;
	Thu, 19 Jun 2025 02:54:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=23.155.224.40
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750265676;
	cv=none; b=P7Omh2sSiOG/A+8WzWakQ6hxcFUVCp6KSNekPc3AKm1wYOY9Z8e+reN3Qs7kU1mIBXL+QgQVEo2yTAch20TGYoJh7IaJ3X1DEVabNDPwIvbBYnAOtoqBAVfgwLBgrvzfU4zIBYomk5eyXkUC88nDTS/zt4Qw2fnYEXRhr3I4NEAEEPHoqXRWYaznkB7NQ68XRAOsw/6uhN8go6A9gV1U49qsjXNbpcFlsedA7ZOhdxCY6sPzBgl8dSgAgUD2ddtC5f5+DYt3GBcfso8uz2abAGMNREP13lNuWPX5yg86m5sxWDummCxBFJcBjD1WjRVdmtHGxCf0prydtPdFr9qRUA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750265676; c=relaxed/relaxed;
	bh=TXK4nvk3hVRfTyVxrU16zW6M8nI8oDPJzdJIGj8kYsc=;
	h=Date:From:To:Cc:Message-ID:Subject:MIME-Version:Content-Type; b=R1Sd30BGVjhkOKV5s++CVzAOQuItm/Aj/zv97wNIeQOEJVsHfcekyXamWxCaDgUFQ9jE0BSsUrV9dqXPGrBSHQWrv8uwDNEMR1KWGt4xpFY/ErJuIYs0Cw65+IUIeomvfD9nPauTzi5zpw2VJXNrLUonN10RssZDudPb2VG67Zp2dw0Leht4YRnHEgX5rFW/pRGmZVYPzkGC8iIo9xuqf59PuktTT7PLhSl+AC7QqI99f3+HptAKZELPqTfUCWH6aS27m/JGCWuP/U1T8JmqPW/K87N4ENPdknKwTxUutUdxRzVC8s3xzhBj0Ht1E6IKSFYJQq1os9qYnbP2B3kQLQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com; dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=B0EFl+B5; dkim-atps=neutral; spf=pass (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=lists.ozlabs.org) smtp.mailfrom=raptorengineering.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=B0EFl+B5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=raptorengineering.com (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=lists.ozlabs.org)
Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bMqbH1m4Dz30DP
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jun 2025 02:54:35 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 0AE7282879F3;
	Wed, 18 Jun 2025 11:54:33 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id ueuYGyDCQRzD; Wed, 18 Jun 2025 11:54:31 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id F0DEF8286F81;
	Wed, 18 Jun 2025 11:54:30 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com F0DEF8286F81
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1750265671; bh=TXK4nvk3hVRfTyVxrU16zW6M8nI8oDPJzdJIGj8kYsc=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=B0EFl+B5U0qK16MIf1a72t4z5arjFFgr3ibazQtLKE8gz+ZjP6wwrA/8vIGSqI4UP
	 mZCG4AypeO9Wf+/6bCjH9n4uNcUxoWWLVwzwXXl1AKJjeRkR6miLLoBO2HDO6Biki7
	 tc1l1CTz7SIzYj7E9r78PlC6LjhfcgP8N3f4BC6k=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id sxi47ZWzGdik; Wed, 18 Jun 2025 11:54:30 -0500 (CDT)
Received: from vali.starlink.edu (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id A84778286AE2;
	Wed, 18 Jun 2025 11:54:30 -0500 (CDT)
Date: Wed, 18 Jun 2025 11:54:28 -0500 (CDT)
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
Message-ID: <581463409.1310624.1750265668004.JavaMail.zimbra@raptorengineeringinc.com>
Subject: [PATCH v2 0/6] PowerNV PCIe Hotplug Driver Fixes
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
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC137 (Linux)/8.5.0_GA_3042)
Thread-Index: 7ViWVrejj338yZQm64sXoMCfdWvE4A==
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
  pci/hotplug/pnv_php: Properly clean up allocated IRQs on unplug
  pci/hotplug/pnv_php: Work around switches with broken presence
    detection

Timothy Pearson (5):
  powerpc/pseries/eeh: Export eeh_unfreeze_pe() and eeh_ops
  powerpc/eeh: Make EEH driver device hotplug safe
  pci/hotplug/pnv_php: Fix surprise plug detection and recovery
  pci/hotplug/pnv_php: Enable third atetntion indicator state

 arch/powerpc/kernel/eeh.c                    |   2 +
 arch/powerpc/kernel/eeh_driver.c             |  48 ++++--
 arch/powerpc/kernel/eeh_pe.c                 |  10 +-
 arch/powerpc/kernel/pci-hotplug.c            |   3 +
 arch/powerpc/platforms/powernv/eeh-powernv.c |   1 +
 drivers/pci/hotplug/pciehp.h                 |   1 -
 drivers/pci/hotplug/pciehp_ctrl.c            |   2 +-
 drivers/pci/hotplug/pciehp_hpc.c             |  33 +---
 drivers/pci/hotplug/pnv_php.c                | 172 ++++++++++++++++---
 drivers/pci/pci.c                            |  31 +++-
 drivers/pci/pci.h                            |   1 +
 11 files changed, 228 insertions(+), 76 deletions(-)

-- 
2.39.5

