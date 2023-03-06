Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2702B6ACAE1
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Mar 2023 18:42:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PVm9l09npz3cjH
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Mar 2023 04:42:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=uHoulabi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=raptorengineering.com (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=uHoulabi;
	dkim-atps=neutral
Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PVm8r085fz3c9x
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Mar 2023 04:41:31 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 73F0C37E2D6066;
	Mon,  6 Mar 2023 11:29:54 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id D7rELOLGaTDI; Mon,  6 Mar 2023 11:29:54 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 0548C37E2D6063;
	Mon,  6 Mar 2023 11:29:54 -0600 (CST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 0548C37E2D6063
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1678123794; bh=UblfvVqy9JNKkVyg/QuZ/+8/xeR2o4hFr+a9TaQPCgY=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=uHoulabi+TH0mWyAwgoNubPmUcb33a10FRzDDSZPtMCTu4FxE8PB/cSfNfzyGK3rE
	 Z3BAGJ6KYPl6nvCWd1eH69hJa1SVQxoulF06TB37Qm/H2LQxaQR0h3ku2vaW2lh8h5
	 XKbfRDoAVUfin1LEht5L8wWJ7ZgJefa+Z7h6C9sI=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id vkFWYm9eZgZS; Mon,  6 Mar 2023 11:29:53 -0600 (CST)
Received: from vali.starlink.edu (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id D4B1537E2D6060;
	Mon,  6 Mar 2023 11:29:53 -0600 (CST)
Date: Mon, 6 Mar 2023 11:29:53 -0600 (CST)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: kvm <kvm@vger.kernel.org>
Message-ID: <8398361.16996856.1678123793664.JavaMail.zimbra@raptorengineeringinc.com>
Subject: [PATCH v2 0/4] Reenable VFIO support on POWER systems
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC110 (Linux)/8.5.0_GA_3042)
Thread-Index: uScuXMMJXypW8VSpxfj7HiX7Gk0vWQ==
Thread-Topic: Reenable VFIO support on POWER systems
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patch series reenables VFIO support on POWER systems.  It
is based on Alexey Kardashevskiys's patch series, rebased and
successfully tested under QEMU with a Marvell PCIe SATA controller
on a POWER9 Blackbird host.

Alexey Kardashevskiy (3):
  powerpc/iommu: Add "borrowing" iommu_table_group_ops
  powerpc/pci_64: Init pcibios subsys a bit later
  powerpc/iommu: Add iommu_ops to report capabilities and allow blocking
    domains

Timothy Pearson (1):
  Add myself to MAINTAINERS for Power VFIO support

 MAINTAINERS                               |   5 +
 arch/powerpc/include/asm/iommu.h          |   6 +-
 arch/powerpc/include/asm/pci-bridge.h     |   7 +
 arch/powerpc/kernel/iommu.c               | 246 +++++++++++++++++++++-
 arch/powerpc/kernel/pci_64.c              |   2 +-
 arch/powerpc/platforms/powernv/pci-ioda.c |  36 +++-
 arch/powerpc/platforms/pseries/iommu.c    |  27 +++
 arch/powerpc/platforms/pseries/pseries.h  |   4 +
 arch/powerpc/platforms/pseries/setup.c    |   3 +
 drivers/vfio/vfio_iommu_spapr_tce.c       |  96 ++-------
 10 files changed, 338 insertions(+), 94 deletions(-)

-- 
2.30.2
