Return-Path: <linuxppc-dev+bounces-7444-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 396DBA7B6D7
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Apr 2025 06:26:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZTQXy5fLzz30Ns;
	Fri,  4 Apr 2025 15:26:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=23.155.224.40
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743740802;
	cv=none; b=Mrea09ISGC46NJYJFT71yiN5BpokKAuSUj2COitC4IIUoavCiyZ/ZzsLL4Q1IAE45aJXqzNX6KjiF1HFYTdV7G06SfAhLwV0BV1982JxGgSij+r8ajC7fzwvAoTr+7OJjtZkbg3vuvIZ6bLHql0yZFolqpwSGc9OChqdZe/fcK1vhXVwrlt8mn34BsTJ99bGluNARlEbJeGRnf4hy9+DkSWFON98cGY8Up57BxPkRA8EmehYuYAwM3ykbM7eDLnUGX8p0lkXYiS4dAuy9hs9tG/67sg6ixGNAQcmOwjfH0nryL3S558RqREaxVrXUWeTtSaQSXAUd34a7Yk181BZew==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743740802; c=relaxed/relaxed;
	bh=jRiQbVybKjEcDuhXdoz/6+j4pLASO6re8oUagrPcVLA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mAszxbMJ3qinghXOB8t36Y9xDc/rf/rzLZDv3doj4Jc2e996xfbVGwSpswgiq1cC/8f2/W2GirOgjGEUyVXuq3seg6oEtrKeuAmX8vZ+Ykd8bvhzZQr+hzzELQuEOHI/XY61SJLWvIBPToxkpxIqZS086wwvQYvSehu+95cUC9ouMcaQm0NafqG8wmAh1cNpuP/fGkawsA/BBeh46YRCoSrr6m/xUhgNMhdHIyzCE+TqaXLdvzHJwSgX5NxiaYYmYKLALsYTBtofgYmplTyeqPHeac7lrr87V6hg1tG6ycCWUGY0obRngyAGvsQMz325RdDPoRQScWegs8PkG5qR3g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com; dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=TtBjpuRy; dkim-atps=neutral; spf=pass (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=sanastasio@raptorengineering.com; receiver=lists.ozlabs.org) smtp.mailfrom=raptorengineering.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=TtBjpuRy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=raptorengineering.com (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=sanastasio@raptorengineering.com; receiver=lists.ozlabs.org)
Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZTQXv2vBFz2yrt
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Apr 2025 15:26:39 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 5FFC082878A5;
	Thu,  3 Apr 2025 23:18:14 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id 3t03eeFtjAEE; Thu,  3 Apr 2025 23:18:13 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id C13338287D28;
	Thu,  3 Apr 2025 23:18:13 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com C13338287D28
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1743740293; bh=jRiQbVybKjEcDuhXdoz/6+j4pLASO6re8oUagrPcVLA=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=TtBjpuRy2roKw6anjOiVGHi1nFullHiYIjLmrAjleSddBBnNuiJnC9Izy9x2UYtCW
	 fzmWg4y/y3DXgLiqRaJ5xWiQlL9NdK6hc+eVLjP+K8WHUl5nZ0352ghRHyptB+A5c3
	 yrGV0vm0xTTj/sMLYB0bDP0orTBSocMGOJalEXEY=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id oB17kzBUJWU5; Thu,  3 Apr 2025 23:18:13 -0500 (CDT)
Received: from raptor-ewks-026.lan (5.edge.rptsys.com [23.155.224.38])
	by mail.rptsys.com (Postfix) with ESMTPSA id 18DA58287182;
	Thu,  3 Apr 2025 23:18:12 -0500 (CDT)
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	tpearson@raptorengineering.com,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH 0/3] PowerNV PCIe Hotplug Driver Fixes
Date: Thu,  3 Apr 2025 23:18:07 -0500
Message-Id: <20250404041810.245984-1-sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
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
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hello all,

This series includes two fixes for bugs in the PowerNV PCIe hotplug
driver that were discovered in testing with a Microsemi Switchtec PM8533
PFX 48xG3 PCIe switch on a PowerNV system, as well as one workaround for
PCIe switches that don't correctly implement slot presence detection
such as the aforementioned one. Without the workaround, the switch works
and downstream devices can be hot-unplugged, but the devices never come
back online after being plugged in again until the system is rebooted.
Other hotplug drivers (like pciehp_hpc) use a similar workaround.

Thanks,

Shawn Anastasio (3):
  pci/hotplug/pnv_php: Properly clean up allocated IRQs on unplug
  pci/hotplug/pnv_php: Work around switches with broken presence
    detection
  pci/hotplug/pnv_php: Fix refcount underflow on hot unplug

 drivers/pci/hotplug/pnv_php.c | 110 +++++++++++++++++++++++++++-------
 1 file changed, 88 insertions(+), 22 deletions(-)

--
2.30.2


