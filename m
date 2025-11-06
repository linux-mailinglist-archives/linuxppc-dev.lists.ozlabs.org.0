Return-Path: <linuxppc-dev+bounces-13897-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4F5C3D14A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 06 Nov 2025 19:36:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d2WBG40V6z2ymg;
	Fri,  7 Nov 2025 05:36:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762454214;
	cv=none; b=bXPasCmTvSVEMaeAiTJecig6MZyXpvBB/wRmyHF5Pzx0WoYOB1WR25kIiiHe2G/uK2xGM5rJRt5uPRc0vKvo4nRuwzOPPYpm4M8McBquHu/1WbdgxoToeU9+ph6FMLQKOCqDDqtDJOBCvPv0wb8OLmI29USOL7sNbpU0cYv7yHPwsq6//R5sbo0hiPZokhQFOFXI7V8cgxFxNqRBBlhqp0DfPuYTaCwltls3JRl9O2MO9wE/DOMW8693X7VbcOU9r8snXU8Pt17ii/8Vnvu8akwEyIkmmmxMitWUq7Ptc0wt2hN5Pg6wj+bANE5yaV+VSn1uTW52DQ27RSED5Taqfg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762454214; c=relaxed/relaxed;
	bh=OBdjEI7kn4l7c9F5yfwSdCpPLXqBc6Mzzf7HuIC42LA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VOvGgP3X98/+YJfotKFBBtH6Bp+a1m49CwTpSaJjU0pjlX4d6aiR1aQy75gkrEK38Kf4N+KSeSQTIyiuBqdQrAO7435Q67VgbdgSyI8qYV+FXKChLoaZ9S7N3MZMQq4SmNa+PB7cQYgUcTbE0/nsk9HPAm77PoABmX3iTHatO5c3Zxt6EEE11y8HZ/e7YjuJfHhw4Y2GYuenO3t5m76UX6Vszd8bhjVN1EuO60neTTUXFY+8FOWtAVjyY1uXDDB7gJeEeeSQo/VU5+lhWST1lGkXYohlK8nfhIA/rzONH9g2FJoNf5NvP3jWS00db472arRHGkf6AGi2RoxmaDOQuw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XXi4PjQS; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XXi4PjQS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d2WBF4tw1z2xR2
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Nov 2025 05:36:53 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B8F4741984;
	Thu,  6 Nov 2025 18:36:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79E52C16AAE;
	Thu,  6 Nov 2025 18:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762454210;
	bh=ovJgUkK1UaueWtGueNfGGSGbgibwAdLBLmWiDB1y0xY=;
	h=From:To:Cc:Subject:Date:From;
	b=XXi4PjQSB4Oxl69IwggGTCQIC/3oJLu4KgfZcMACoIM7uoR4x/570zQRcRgEqUXrk
	 gpC9t5uFUMf0oNjw/HiN2PZc+vU+T18e4DtiUnnl9R0zfitqwpfKPWguKcwGYJgzMU
	 D2uvSXRzHarbDEXiiZF+3wV6DjkzvB6aEByyxVELMk7wR81aApOlv3a4Klz0zRz9Uu
	 BHcIynN9o4K4dH5L4xhITng4qUv06jqeXWK4qtuK3nZHXbQ9OE7dDAwiHp9LkKz2WW
	 9Fbq+EjhKWNsAiyG8OG8O9HVZVE/vQOFHKHg+JKFZCf9kehXkC9kUkZLrrWTy5W0SD
	 qB8m4b2riraRw==
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
Subject: [PATCH 0/2] PCI/ASPM: Allow quirks to avoid L0s and L1
Date: Thu,  6 Nov 2025 12:36:37 -0600
Message-ID: <20251106183643.1963801-1-helgaas@kernel.org>
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

L1 PM Substates and Clock PM in particular are a problem because they
depend on CLKREQ# and sometimes device-specific configuration, and none of
this is discoverable in a generic way.

df5192d9bb0e ("PCI/ASPM: Enable only L0s and L1 for devicetree platforms")
(v6.18-rc3) backed off and omitted Clock PM and L1 Substates.

L0s and L1 are generically discoverable, but some devices advertise them
even though they don't work correctly.  This series is a way to avoid L0s
and L1 in that case.

Bjorn Helgaas (2):
  PCI/ASPM: Cache Link Capabilities so quirks can override them
  PCI/ASPM: Avoid L0s and L1 on Freescale Root Ports

 drivers/pci/pcie/aspm.c | 42 ++++++++++++++++++++---------------------
 drivers/pci/probe.c     |  5 ++---
 drivers/pci/quirks.c    | 12 ++++++++++++
 include/linux/pci.h     |  1 +
 4 files changed, 36 insertions(+), 24 deletions(-)

-- 
2.43.0


