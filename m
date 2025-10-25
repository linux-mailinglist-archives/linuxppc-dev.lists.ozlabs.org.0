Return-Path: <linuxppc-dev+bounces-13303-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 60754C0977C
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Oct 2025 18:28:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cv4vd0Vffz2xlK;
	Sun, 26 Oct 2025 03:28:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761409708;
	cv=none; b=SeQqhP4R55be1KEAOFJodT9r031vsDLpgXhlJVpqMmTURlxtLPvxjEXtRIS8seXLBU3SYVC+eb5pCCvgzwfqxWfktPB8CCIgehVsi4p2pG8l1ztNhGUQUahzXHI2gUjFXYK6zg4PeTTdgYe0FuUvqjPtzUM/JgwEfhg+V7RoUNxHVzE59Pv/Ex13CO6enRcd7D0CSL/3Dqf1MpKm8ZVkgbElYL0VfOxzlto/hgxtOM1CD7UlDS1S5aL7IDjlEE8YVoxMVcZP/ITMZxkAHLd1LZ1nahJncqp8P37OKsuQJtpVQZH22sOMEuB4udxj510ENsSbvAXVpCpz42WfWS0bAg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761409708; c=relaxed/relaxed;
	bh=nm0f033tS4dh5cg+ZV8R2wB/hQ9xtqzakOFsrvxfSTI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Nfgsfb3ytjnO6uAwY0z3L7YtY0YMj3K0I+ZMWTmH0uTFKOOpKorRKkHzVKFjYyxXCtVlcNQyr5e1ba426qyplUDg1d7FSXaUkrYiUNxOYyWQz326j0fte9Hv/IvMQuO3qj0jMTGgVeVCSMoQfe+8ELJK9vCFyxAeQuDeYIDvUuEulQ1MHj3PJmQVW7ATAAng+8PkuHrCo536ozgCrtevqmUsANZiogiMqLfTYMzGLx86SqE6H3QjkWVQ2tJh15S74zSBdYvDHM7RbOWgZYJhLn8zsv7xiexfgB4YtVF02iwymv8v9ufSm+Hc4TvizDzV99yTu0h51hQ0ewh+JaDPyg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oXeB67PS; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oXeB67PS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cv4vb60Ryz2xdg
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Oct 2025 03:28:27 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 15A0E605E2;
	Sat, 25 Oct 2025 16:28:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7D30C4CEFB;
	Sat, 25 Oct 2025 16:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761409704;
	bh=NxAJjRQ5XZukhLLPW9DdM8UWn1dj4M611C9t9qZPwcs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oXeB67PS5rCwGDqvwlHXIRk7PmWMAUPXmCgyGAQqpsx3ftmP4BmqOKOCA6jgnWOVc
	 k7QfsjtNDbhas4/uaMB9uhMlk5lQO55jFP0GluYcBRMwml+MfKImwm1TnnjYvPIxqJ
	 zJ0ezQhNG9UTtLKJ++8t9BFkVoLpjcVhILaDwWJTNwXkVSzPAHY+gaRhKOMusYyWRj
	 lZQIeIFRVW/u8sO8QATXFZqSjT43QaXXJ1G6f9yPaMtPKNut4uMeTNSssARxyGdnjW
	 faTeZtXuUYXSto7a4MBpXyFbeXDK/pSEPUpaEon5bZWxGiIoUBjtZlt1wEBBcx9IuJ
	 Ye5CaN03Q5IcA==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Vernon Yang <yanglincheng@kylinos.cn>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Sasha Levin <sashal@kernel.org>,
	mahesh@linux.ibm.com,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH AUTOSEL 6.17] PCI/AER: Fix NULL pointer access by aer_info
Date: Sat, 25 Oct 2025 12:00:59 -0400
Message-ID: <20251025160905.3857885-428-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251025160905.3857885-1-sashal@kernel.org>
References: <20251025160905.3857885-1-sashal@kernel.org>
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
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.5
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Vernon Yang <yanglincheng@kylinos.cn>

[ Upstream commit 0a27bdb14b028fed30a10cec2f945c38cb5ca4fa ]

The kzalloc(GFP_KERNEL) may return NULL, so all accesses to aer_info->xxx
will result in kernel panic. Fix it.

Signed-off-by: Vernon Yang <yanglincheng@kylinos.cn>
Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
Link: https://patch.msgid.link/20250904182527.67371-1-vernon2gm@gmail.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

YES

**Why It Matters**
- Prevents a NULL pointer dereference and kernel panic during device
  enumeration when `kzalloc(GFP_KERNEL)` fails in AER initialization.
  This is a real bug users can hit under memory pressure and affects any
  kernel with `CONFIG_PCIEAER` enabled.

**Change Details**
- Adds a NULL check after allocating `dev->aer_info` and returns early
  on failure, resetting `dev->aer_cap` to keep state consistent:
  - drivers/pci/pcie/aer.c:395
  - drivers/pci/pcie/aer.c:396
  - drivers/pci/pcie/aer.c:397
- The dereferences that would otherwise panic immediately follow the
  allocation (ratelimit initialization), so without this guard, OOM
  leads to instant crash:
  - drivers/pci/pcie/aer.c:401
  - drivers/pci/pcie/aer.c:403

**Consistency With AER Flows**
- Resetting `dev->aer_cap` to 0 on allocation failure is correct and
  keeps all AER-related code paths coherent:
  - Save/restore explicitly no-op when `aer_cap == 0`, avoiding config
    space accesses:
    - drivers/pci/pcie/aer.c:349
    - drivers/pci/pcie/aer.c:371
  - AER enablement and ECRC setup get skipped because AER is treated as
    unavailable:
    - drivers/pci/pcie/aer.c:417 (enable reporting)
    - drivers/pci/pcie/aer.c:420 (ECRC)
    - ECRC helpers themselves also gate on `aer_cap`:
      - drivers/pci/pcie/aer.c:164
      - drivers/pci/pcie/aer.c:188
- Sysfs attributes that unconditionally dereference `pdev->aer_info` are
  already hidden when `aer_info == NULL`:
  - Visibility gating for stats attrs checks `pdev->aer_info`:
    - drivers/pci/pcie/aer.c:632
  - Visibility gating for ratelimit attrs checks `pdev->aer_info`:
    - drivers/pci/pcie/aer.c:769
- AER initialization is called during capability setup for every device;
  avoiding a panic here is critical:
  - drivers/pci/probe.c:2671

**Risk and Side Effects**
- Impact is limited and defensive:
  - On allocation failure, AER features are disabled for that device
    (graceful degradation) instead of panicking.
  - No architectural changes; no ABI changes; minimal lines touched.
  - All later AER users already handle `aer_info == NULL` and/or
    `aer_cap == 0` via existing guards.
- Side effects are intentional and safe:
  - Port driver IRQ message number programming for AER is skipped if
    `aer_cap == 0`, consistent with AER being unavailable:
    - drivers/pci/pcie/portdrv.c:81
    - drivers/pci/pcie/portdrv.c:242

**Stable Criteria**
- Fixes a real crash bug that can affect users (OOM during enumeration
  or hotplug).
- Small, contained change in a single function.
- No new features or interfaces; no architectural churn.
- Very low regression risk due to consistent gating on
  `aer_cap`/`aer_info`.

Given the clear correctness and robustness benefits with minimal risk,
this is a strong candidate for backporting to stable trees.

 drivers/pci/pcie/aer.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index 9d23294ceb2f6..3dba9c0c6ae11 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -383,6 +383,10 @@ void pci_aer_init(struct pci_dev *dev)
 		return;
 
 	dev->aer_info = kzalloc(sizeof(*dev->aer_info), GFP_KERNEL);
+	if (!dev->aer_info) {
+		dev->aer_cap = 0;
+		return;
+	}
 
 	ratelimit_state_init(&dev->aer_info->correctable_ratelimit,
 			     DEFAULT_RATELIMIT_INTERVAL, DEFAULT_RATELIMIT_BURST);
-- 
2.51.0


