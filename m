Return-Path: <linuxppc-dev+bounces-16866-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EJgpOIbokGkMdwEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16866-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Feb 2026 22:26:30 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0E413D59E
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Feb 2026 22:26:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fD2Ch33wpz2xLv;
	Sun, 15 Feb 2026 08:26:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771104384;
	cv=none; b=WATvPhBddH5J0JNmrzzRNL8TBnVcSEURapB3dOet4waPniM07nFMrq1zto3j6pm457lOJg772N2NHf7lPWPu0e4+P9l3FUWb5vAOk/yrnCL6liDkN4f5m3FJc7gUKyHhHjIUd24WD6KKcPetqVa73kxr6Pbj30BYknWaJaZnaKGH9B5k+xGhcOrpQAG0k0qX4CAWK/tzUlsrEcoZ8L7jPJQLag3utNOmlKgqfAh5gveO7MPeyYZWrtiBY4yKyK+gzw3XHjz4i92XBb5czj85dKgXD7T+5I5kTZPp3O9soEmfk28AqvCm39w/IZBYiID3is6C08y38ovIhCEuk+4e/w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771104384; c=relaxed/relaxed;
	bh=EnVedIPwG4uRqBX/Unkm1AgdnGPQJ9KWGOO0ZGgcRBA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BC+wilwl5+CvaNEWwdcabQw/ZTEp5TXWdBmdnRtDGY9GBZeWomxYutuNduqz2gwgBKe36bXnDX5ZAd9AzzTo+5fxn8ZR2GDxPrCJfGECZg5D+BQfv7zSzAJkqPpb9QddS24hhbYruEjHjB+nnduAW9ZOZhHx0TIIIysn8j9UiGs0rybSQDBgPC3vk7cRTREhCtrK/nhMwXwGt6PHe1nuPFpmVWwfYX1iCQGwXC3KcBn2e3axYTnppIkPeb4UCu71Pco3Suyc+jwo4hdThGiIlHnFa9wQZ4vUjRYruh0H+ruJu48Xuc8cJSsc0KKViDlpUPmUu0ohBfCpdvkRuZRaNw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LLHJ/SDm; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LLHJ/SDm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fD2Cg1QSdz2xHX
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 15 Feb 2026 08:26:23 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CD41642A8B;
	Sat, 14 Feb 2026 21:26:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7CA3C16AAE;
	Sat, 14 Feb 2026 21:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771104379;
	bh=yvaIk8C/stOejqPYYeijZfAu+PYjAATRUsgqrhgm224=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LLHJ/SDmux4vUwUwbuTsotvpu2LL28YHR6MuWkZHlgL+sT84yQp91FxpsD5wytZPO
	 wrrFL+0EqsynbdM8Agt60o3Pt1ztJgtzaFGnDVEowucvv7iztXzz7jO4SJUuHyvFdj
	 jwkzIvwD1SDJcvs5jjrRNx03ZV3zerpN8fYSdIOwauUlejw1QKqgd5k67VwV9pUT/f
	 5R5SsIA9H/m/mpLFdGDVrcJyqhu4Qw4m8JLcab2iN5ZcfbM1/8QmC7fmkNkYNjRvd/
	 Wmo7aJztAwr29jj6HeC85M/SEgCINAtomYk/ZnW4Bxg+f8aMZ1FjmohiL7vOA3sqis
	 Cb5zqhMNFJerQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Lukas Wunner <lukas@wunner.de>,
	Lucas Van <lucas.van@intel.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Sasha Levin <sashal@kernel.org>,
	mahesh@linux.ibm.com,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH AUTOSEL 6.19-5.15] PCI/AER: Clear stale errors on reporting agents upon probe
Date: Sat, 14 Feb 2026 16:23:18 -0500
Message-ID: <20260214212452.782265-53-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260214212452.782265-1-sashal@kernel.org>
References: <20260214212452.782265-1-sashal@kernel.org>
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
X-stable-base: Linux 6.19
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-16866-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:patches@lists.linux.dev,m:stable@vger.kernel.org,m:lukas@wunner.de,m:lucas.van@intel.com,m:bhelgaas@google.com,m:sathyanarayanan.kuppuswamy@linux.intel.com,m:sashal@kernel.org,m:mahesh@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sashal@kernel.org,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,intel.com:email,wunner.de:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: DD0E413D59E
X-Rspamd-Action: no action

From: Lukas Wunner <lukas@wunner.de>

[ Upstream commit e242d09b58e869f86071b7889acace4cff215935 ]

Correctable and Uncorrectable Error Status Registers on reporting agents
are cleared upon PCI device enumeration in pci_aer_init() to flush past
events.  They're cleared again when an error is handled by the AER driver.

If an agent reports a new error after pci_aer_init() and before the AER
driver has probed on the corresponding Root Port or Root Complex Event
Collector, that error is not handled by the AER driver:  It clears the
Root Error Status Register on probe, but neglects to re-clear the
Correctable and Uncorrectable Error Status Registers on reporting agents.

The error will eventually be reported when another error occurs.  Which
is irritating because to an end user it appears as if the earlier error
has just happened.

Amend the AER driver to clear stale errors on reporting agents upon probe.

Skip reporting agents which have not invoked pci_aer_init() yet to avoid
using an uninitialized pdev->aer_cap.  They're recognizable by the error
bits in the Device Control register still being clear.

Reporting agents may execute pci_aer_init() after the AER driver has
probed, particularly when devices are hotplugged or removed/rescanned via
sysfs.  For this reason, it continues to be necessary that pci_aer_init()
clears Correctable and Uncorrectable Error Status Registers.

Reported-by: Lucas Van <lucas.van@intel.com> # off-list
Signed-off-by: Lukas Wunner <lukas@wunner.de>
Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
Tested-by: Lucas Van <lucas.van@intel.com>
Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Link: https://patch.msgid.link/3011c2ed30c11f858e35e29939add754adea7478.1769332702.git.lukas@wunner.de
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

### 3. Classification

This is a **bug fix** — it addresses stale error reporting in the PCI
AER subsystem. The issue is that errors that occur in a specific timing
window (between `pci_aer_init()` and AER driver probe) are not properly
cleared, causing misleading error reports to users later.

**Nature of the bug**: Not a crash or security issue, but a functional
correctness issue. Stale PCIe AER errors are reported at the wrong time,
confusing users and potentially causing unnecessary troubleshooting or
even unnecessary hardware replacements.

### 4. Scope and Risk Assessment

**Changes**:
- **New function**: `clear_status_iter()` (~12 lines) — a simple
  callback that checks `PCI_EXP_AER_FLAGS` in Device Control (to skip
  devices that haven't been initialized), then calls existing
  `pci_aer_clear_status()` and `pcie_clear_device_status()`.
- **Modified function**: `aer_enable_rootport()` — adds ~8 lines after
  clearing Root Error Status to walk subordinate devices and clear their
  error status too. The walk is conditional on `AER_ERR_STATUS_MASK`
  being set in the root status register.

**Risk assessment**:
- The new code uses **well-established APIs**: `pci_walk_bus()`,
  `pcie_walk_rcec()`, `pci_aer_clear_status()`,
  `pcie_clear_device_status()` — all already used elsewhere in the same
  file.
- The guard condition `!(devctl & PCI_EXP_AER_FLAGS)` mirrors the
  existing check at line 1047 in `is_error_source()`, so this is a
  proven pattern.
- The `AER_ERR_STATUS_MASK` check ensures the walk only happens when
  there are actual errors to clear, minimizing unnecessary bus walks.
- Only touches one file (`drivers/pci/pcie/aer.c`).

### 5. User Impact

- **Who is affected**: Any system with PCIe devices that can generate
  AER errors. This is common on servers, workstations, and laptops.
- **How severe**: Not a crash or data corruption, but stale error
  reporting can:
  - Cause unnecessary alarm and investigation
  - Mask the true timing of errors, complicating root cause analysis
  - Confuse monitoring/alerting systems
- **Real-world impact**: Reported by Intel engineer (Lucas Van),
  suggesting this was encountered in real deployment scenarios.

### 6. Stability Indicators

- **Tested-by**: Lucas Van (the reporter) — confirms the fix works
- **Reviewed-by**: Kuppuswamy Sathyanarayanan (Intel kernel developer) —
  expert review
- **Signed-off-by**: Bjorn Helgaas — PCI subsystem maintainer, extremely
  conservative gatekeeper

### 7. Dependency Check

The functions used (`pci_walk_bus`, `pcie_walk_rcec`,
`pci_aer_clear_status`, `pcie_clear_device_status`, `PCI_EXP_AER_FLAGS`)
all exist in current stable trees. The `AER_ERR_STATUS_MASK` macro is
defined in the same file. No dependencies on recent mainline changes
detected.

### Summary

**Pros**:
- Fixes a real bug reported and tested by an Intel engineer
- Small, contained change (~20 lines added) in a single file
- Uses existing, well-established APIs with proven patterns
- Reviewed by PCI subsystem maintainer
- No risk of regression — only adds clearing of stale error registers at
  probe time
- All dependencies exist in stable trees

**Cons**:
- Not a crash/security/corruption fix — it's a "misleading error
  reporting" fix
- Adds a new function (though trivial and self-contained)
- The bug is somewhat niche (requires specific timing of error vs. AER
  probe)

While this isn't a critical crash or security fix, it does fix a real
functional bug that affects error reporting accuracy. The fix is small,
well-tested, well-reviewed, uses established patterns, and carries
minimal regression risk. The PCI AER subsystem is important for system
reliability monitoring, and misleading error reports can lead to
unnecessary hardware replacements or missed real issues. The quality
indicators (maintainer sign-off, tested-by, reviewed-by, Intel reporter)
are all strong.

**YES**

 drivers/pci/pcie/aer.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index e0bcaa896803c..4299c553d9bb4 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -1608,6 +1608,20 @@ static void aer_disable_irq(struct pci_dev *pdev)
 	pci_write_config_dword(pdev, aer + PCI_ERR_ROOT_COMMAND, reg32);
 }
 
+static int clear_status_iter(struct pci_dev *dev, void *data)
+{
+	u16 devctl;
+
+	/* Skip if pci_enable_pcie_error_reporting() hasn't been called yet */
+	pcie_capability_read_word(dev, PCI_EXP_DEVCTL, &devctl);
+	if (!(devctl & PCI_EXP_AER_FLAGS))
+		return 0;
+
+	pci_aer_clear_status(dev);
+	pcie_clear_device_status(dev);
+	return 0;
+}
+
 /**
  * aer_enable_rootport - enable Root Port's interrupts when receiving messages
  * @rpc: pointer to a Root Port data structure
@@ -1629,9 +1643,19 @@ static void aer_enable_rootport(struct aer_rpc *rpc)
 	pcie_capability_clear_word(pdev, PCI_EXP_RTCTL,
 				   SYSTEM_ERROR_INTR_ON_MESG_MASK);
 
-	/* Clear error status */
+	/* Clear error status of this Root Port or RCEC */
 	pci_read_config_dword(pdev, aer + PCI_ERR_ROOT_STATUS, &reg32);
 	pci_write_config_dword(pdev, aer + PCI_ERR_ROOT_STATUS, reg32);
+
+	/* Clear error status of agents reporting to this Root Port or RCEC */
+	if (reg32 & AER_ERR_STATUS_MASK) {
+		if (pci_pcie_type(pdev) == PCI_EXP_TYPE_RC_EC)
+			pcie_walk_rcec(pdev, clear_status_iter, NULL);
+		else if (pdev->subordinate)
+			pci_walk_bus(pdev->subordinate, clear_status_iter,
+				     NULL);
+	}
+
 	pci_read_config_dword(pdev, aer + PCI_ERR_COR_STATUS, &reg32);
 	pci_write_config_dword(pdev, aer + PCI_ERR_COR_STATUS, reg32);
 	pci_read_config_dword(pdev, aer + PCI_ERR_UNCOR_STATUS, &reg32);
-- 
2.51.0


