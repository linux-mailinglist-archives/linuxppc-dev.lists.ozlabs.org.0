Return-Path: <linuxppc-dev+bounces-14016-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F90C498F3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Nov 2025 23:29:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d549C04zTz2ytx;
	Tue, 11 Nov 2025 09:29:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762813790;
	cv=none; b=fUyte0plQvJ+MjofkK3sJz7iE+pTZuegmoaBIO2r4gDXhyFvZu6px1jDed60Zi94IaydmZOiB0oxLZhuzbZNcjNt1PeMLiwgS0jyqmLCOIMFJQRytxhL1w7hVcUJJBUSnXsgZ75ML16qdcT0ojxMvhM52qxvQs9tX/m3kMMMKflEfMmpPUF4jkTMdzLu80KEwh9roTpk2M8Y6f97cJ5k8pF12rX237Xr75E2xFsXGiW/BXd/op7+pzIYwLBxwTHx/+2ABD/RZYk0Q8fHng1JxsGe24M5NiMOwarJrUJ2QliizqUMD6ncoJ+a9pqiI97TE/dENyE5qQAywz0Ikvo8Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762813790; c=relaxed/relaxed;
	bh=yvB8s9+ubiaaU82Ye4v9kYZ0uUNm5r/pwExZByA4mf8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U4DUcKlZn5onvCE4NaiZCvh5Gbn5+XiOm7Y/hIFDE7KRrEuqVBg04EFA3O3RsyUjxHelSdjW05gy4RICDgbM1s4X+HhVaqJaCYvnUU+NcLDQ2RRhZ5/7ecAJIElMJfP+vXZUpTRRxMDpVsvBiMJMGV0Rang0ZILWrGFH0SS0RprdqGJeNl+JMG1RfA4U3r/txoWNQJawAWitjeCvXbHG0eWamxgXkFndp5/MsL8sJSdEOvYUmZxid5j8thebJfQcixUS7W4VVbQOr4lBdCSytOdPnwkqb4cT6H3+Ffr/EX2DbTtn/wiaYtpaI8BKaqJIctVgHXevMBwXy+CoYCPzdA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=m+5t5Swo; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=m+5t5Swo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d549B0cvYz2xqZ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Nov 2025 09:29:50 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EB04960145;
	Mon, 10 Nov 2025 22:29:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C0BCC16AAE;
	Mon, 10 Nov 2025 22:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762813786;
	bh=Ew1J1aHGuwLLJKwapglsP0+NcHadMOOCXzL3ZeOS9U0=;
	h=From:To:Cc:Subject:Date:From;
	b=m+5t5Swo67nM7sEdysvArYvIok7mMcmERnJmNun+u5J3G3GBvrq+qiRqn/zPoyaC2
	 LZqa2i8RTZnLt7i0cTBpcvfBOL9ArsRcbeNK4robmStbfggXqKKxV+vJSh6KA+fuuW
	 7x9fhhIorg/qa5GfYjACeV6CvN6Kq/r7uLCGU34Q4seUnbRwprLpqgRwM6+xkWlYis
	 DDb86yBdVCor4GLwlP0RCz/t51N+dka1CCmpINkyOLqgCDqWbxURt2S8sHUT5rzpI1
	 k9j5PKoi8/aZ84OYGfsrDvV3U4z/fJbU3NMWhzXvq/e4q7RJGlV+IzWtVkVPHXu+U2
	 +XkWqlhds645w==
From: Bjorn Helgaas <helgaas@kernel.org>
To: linux-pci@vger.kernel.org
Cc: Christian Zigotzky <chzigotzky@xenosoft.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	mad skateman <madskateman@gmail.com>,
	"R . T . Dickinson" <rtd2@xtra.co.nz>,
	Darren Stevens <darren@stevens-zone.net>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Lukas Wunner <lukas@wunner.de>,
	luigi burdo <intermediadc@hotmail.com>,
	Al <al@datazap.net>,
	Roland <rol7and@gmx.com>,
	Hongxing Zhu <hongxing.zhu@nxp.com>,
	hypexed@yahoo.com.au,
	linuxppc-dev@lists.ozlabs.org,
	debian-powerpc@lists.debian.org,
	linux-kernel@vger.kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH v2 0/4] PCI/ASPM: Allow quirks to avoid L0s and L1
Date: Mon, 10 Nov 2025 16:22:24 -0600
Message-ID: <20251110222929.2140564-1-helgaas@kernel.org>
X-Mailer: git-send-email 2.43.0
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
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Bjorn Helgaas <bhelgaas@google.com>

We enabled ASPM too aggressively in v6.18-rc1.  f3ac2ff14834 ("PCI/ASPM:
Enable all ClockPM and ASPM states for devicetree platforms") enabled ASPM
L0s, L1, and (if advertised) L1 PM Substates.

df5192d9bb0e ("PCI/ASPM: Enable only L0s and L1 for devicetree platforms")
(v6.18-rc3) backed off and omitted Clock PM and L1 Substates because we
don't have good infrastructure to discover CLKREQ# support, and L1
Substates may require device-specific configuration.

L0s and L1 are generically discoverable and should not require
device-specific support, but some devices advertise them even though they
don't work correctly.  This series is a way to add quirks avoid L0s and L1
in this case.


Bjorn Helgaas (4):
  PCI/ASPM: Cache L0s/L1 Supported so advertised link states can be
    overridden
  PCI/ASPM: Add pcie_aspm_remove_cap() to override advertised link
    states
  PCI/ASPM: Convert quirks to override advertised link states
  PCI/ASPM: Avoid L0s and L1 on Freescale Root Ports

 drivers/pci/pci.h       |  2 ++
 drivers/pci/pcie/aspm.c | 25 +++++++++++++++++--------
 drivers/pci/probe.c     |  7 +++++++
 drivers/pci/quirks.c    | 38 +++++++++++++++++++-------------------
 include/linux/pci.h     |  2 ++
 5 files changed, 47 insertions(+), 27 deletions(-)

-- 

v1: https://lore.kernel.org/r/20251106183643.1963801-1-helgaas@kernel.org

Changes between v1 and v2:
- Cache just the two bits for L0s and L1 support, not the entire Link
  Capabilities (Lukas)
- Add pcie_aspm_remove_cap() to override the ASPM Support bits in Link
  Capabilities (Lukas)
- Convert existing quirks to use pcie_aspm_remove_cap() instead of
  pci_disable_link_state(), and from FINAL to HEADER (Mani)

