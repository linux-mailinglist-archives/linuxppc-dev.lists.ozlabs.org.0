Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9595190DDC4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2024 22:50:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NtTtFPkW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W3f5y2RwFz3bxZ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jun 2024 06:50:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NtTtFPkW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W3f5G21NBz2ysf
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2024 06:49:54 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7427161B4D;
	Tue, 18 Jun 2024 20:49:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0B61C3277B;
	Tue, 18 Jun 2024 20:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718743792;
	bh=CkxYcZq8lMhZtQeh+gh2bGRvtFYZZWl5V5Oif5kfgr0=;
	h=From:To:Cc:Subject:Date:From;
	b=NtTtFPkWR9PN9rl/hh7cLp2Bgo45qAe0Nd1YSQPZdlmWSzsqsruf3WYzecSPgbeqI
	 zO32c+un6WskSZ75Lo9tW8AaOVmXwSyBux6basDs2x51R+Q4mYbUmptS7JUkmeyx51
	 V/71Fc8GI5+izP9hWVpUWwSzyhcVtGJruI0Z/klP/E4tKetTkIZv5YzbKUXv5y75X3
	 M01MhSGJzQVrN1hxlCo0rh+RcgdyF6Q4n+1VLscMPXjlP03CJ/hA7CS47b/319r4QF
	 frOM8AR10Zd467TmvaoLrn1BgM83WMvLeb1Z2L63H0W9CVcH+VmeFEjzzYETHlNGUV
	 9oqrc8q+QMIvg==
From: Bjorn Helgaas <helgaas@kernel.org>
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
Subject: [PATCH v9 0/2] PCI: Disable AER & DPC on suspend
Date: Tue, 18 Jun 2024 15:49:44 -0500
Message-Id: <20240618204946.1271042-1-helgaas@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Hannes Reinecke <hare@suse.com>, Chaitanya Kulkarni <kch@nvidia.com>, Sagi Grimberg <sagi@grimberg.me>, "Rafael J . Wysocki" <rafael@kernel.org>, linux-pci@vger.kernel.org, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, Oliver O'Halloran <oohall@gmail.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Keith Busch <kbusch@kernel.org>, Thomas Crider <gloriouseggroll@gmail.com>, linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>, regressions@lists.linux.dev
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Bjorn Helgaas <bhelgaas@google.com>

This is an old series from Kai-Heng that I didn't handle soon enough.  The
intent is to fix several suspend/resume issues:

  - Spurious wakeup from s2idle
    (https://bugzilla.kernel.org/show_bug.cgi?id=216295)

  - Steam Deck doesn't resume after suspend
    (https://bugzilla.kernel.org/show_bug.cgi?id=218090)

  - Unexpected ACS error and DPC event when resuming after suspend
    (https://bugzilla.kernel.org/show_bug.cgi?id=209149)

It seems that a glitch when the link is powered down during suspend causes
errors to be logged by AER.  When AER is enabled, this causes an AER
interrupt, and if that IRQ is shared with PME, it may cause a spurious
wakeup.

Also, errors logged during link power-down and power-up seem to cause
unwanted error reporting during resume.

This series disables AER interrupts, DPC triggering, and DPC interrupts
during suspend.  On resume, it clears AER and DPC error status before
re-enabling their interrupts.

I added a couple cosmetic changes for the v9, but this is essentially all
Kai-Heng's work.  I'm just posting it as a v9 because I failed to act on
this earlier.

Bjorn

v9:
 - Drop pci_ancestor_pr3_present() and pm_suspend_via_firmware; do it
   unconditionally
 - Clear DPC status before re-enabling DPC interrupt

v8: https://lore.kernel.org/r/20240416043225.1462548-1-kai.heng.feng@canonical.com
 - Wording.
 - Add more bug reports.

v7:
 - Wording.
 - Disable AER completely (again) if power will be turned off
 - Disable DPC completely (again) if power will be turned off

v6: https://lore.kernel.org/r/20230512000014.118942-1-kai.heng.feng@canonical.com

v5: https://lore.kernel.org/r/20230511133610.99759-1-kai.heng.feng@canonical.com
 - Wording.

v4: https://lore.kernel.org/r/20230424055249.460381-1-kai.heng.feng@canonical.com
v3: https://lore.kernel.org/r/20230420125941.333675-1-kai.heng.feng@canonical.com
 - Correct subject.

v2: https://lore.kernel.org/r/20230420015830.309845-1-kai.heng.feng@canonical.com
 - Only disable AER IRQ.
 - No more AER check on PME IRQ#.
 - Use AER helper.
 - Only disable DPC IRQ.
 - No more DPC check on PME IRQ#.

v1: https://lore.kernel.org/r/20220727013255.269815-1-kai.heng.feng@canonical.com

Kai-Heng Feng (2):
  PCI/AER: Disable AER service on suspend
  PCI/DPC: Disable DPC service on suspend

 drivers/pci/pcie/aer.c | 18 +++++++++++++
 drivers/pci/pcie/dpc.c | 60 +++++++++++++++++++++++++++++++++---------
 2 files changed, 66 insertions(+), 12 deletions(-)

-- 
2.34.1

