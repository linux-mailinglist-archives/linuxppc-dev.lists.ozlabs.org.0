Return-Path: <linuxppc-dev+bounces-13302-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C3FC0938D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Oct 2025 18:12:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cv4Xw4qzwz305M;
	Sun, 26 Oct 2025 03:12:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761408736;
	cv=none; b=j+DWu3nXU8HThQfky7rP2PHidA1a6a6sutaJOc1mXG6jMn8De5Hsb2N6GbrBSQmpm5EADH2STi5VvmRlV2Gd7sU10uwvDjtwtqgNQ/EAPx6CYxqp07346Mg6oaPlGcSxV8PoetS7k9CsDRnP26bQd4srIVWUI/8qG16HOB7moz1QZLpayLi+VmGZifrHJlEJ/YT/Itbozfn650bFy1v/XH/h5vUOpMvW7MOVMMIEkkyCyqomcYR4JV2fw47DGEI5FEr6HhxI329xNrY3ySYRwXBZRvB9CRmi/QkzxKU2BioocEVzvEx31h8IDhPxRPwPX9vTOI8NKW49KIB/jf9opg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761408736; c=relaxed/relaxed;
	bh=R2Pv6ZhBB2oiUKZOsz+phRxda2i661lz9EoE4NFGo7s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D8aiqKhxTQqQ4p8AYLd/jVztdhivCpQYhLiWLxYWy/zCC2UJqSxMfbXTWp16pZoBMwxMjT2aVXPBBMFxhQo80h0ZGKVd5IO1Y5a4YFvlCquU8mkqIItGnzXWFpk7wSQYKZkoD18f8f90dqxYsVkLVYARjmP1UR/dra/eSxZzJjTtxPSj/0WIF70bxgoFuMP6j2312cE9jvz1kQaY+afurOLLBw0+CtqLMSZ4tspBnpNiJLXjXL1ShFc8wkBUtdiQUbavrJT8VCxOQE9sjAjYtIR7NR5oq4Vaz92ow4+MB1DOnMMBToUQGxQdokME+O9RS3teNBY7ws3crVVXarLumw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=f40uJPtt; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=f40uJPtt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cv4Xv51Qzz2yFT
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Oct 2025 03:12:15 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0BE41602AD;
	Sat, 25 Oct 2025 16:12:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A80FEC4CEFB;
	Sat, 25 Oct 2025 16:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761408732;
	bh=Q1m86h5mZ/Z4pKLW9z0TvV/FvWuLAG1O/eDl17A1PD4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=f40uJPtt2xEjA/W/bui78AWH2xaJtaJfYq82REZ/hIEDq2L3Dt8i2hJTKleNdPztC
	 vEoS07wBcPKXismbaopyn0nfQxTGvOdiEGcaInmY2DnqKj26J6gRoQNFRUj6tWdrGc
	 1Bk3tJSBQOVnL9TEvHDoHZ16Ap5iMGIA7kNGV0ABRQpN/E6d7/BAINfI1xR/8MAooD
	 CUyCvTIsjhw1pnWf46PW6yT0KaJYd5jm/2QNspkpYXRS07WY7KJafOR05lkMu7vfPg
	 YaIfaRO2qXmdh01j5tQi9qYPmJqvci5sH94Je6YTBxYbjDhPGTJ8SS90/xynNz9xDY
	 BmSJQqmv2heOA==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Niklas Schnelle <schnelle@linux.ibm.com>,
	Lukas Wunner <lukas@wunner.de>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Mahesh Salgaonkar <mahesh@linux.ibm.com>,
	Sasha Levin <sashal@kernel.org>,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH AUTOSEL 6.17-5.4] powerpc/eeh: Use result of error_detected() in uevent
Date: Sat, 25 Oct 2025 11:54:48 -0400
Message-ID: <20251025160905.3857885-57-sashal@kernel.org>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Niklas Schnelle <schnelle@linux.ibm.com>

[ Upstream commit 704e5dd1c02371dfc7d22e1520102b197a3b628b ]

Ever since uevent support was added for AER and EEH with commit
856e1eb9bdd4 ("PCI/AER: Add uevents in AER and EEH error/resume"), it
reported PCI_ERS_RESULT_NONE as uevent when recovery begins.

Commit 7b42d97e99d3 ("PCI/ERR: Always report current recovery status for
udev") subsequently amended AER to report the actual return value of
error_detected().

Make the same change to EEH to align it with AER and s390.

Suggested-by: Lukas Wunner <lukas@wunner.de>
Link: https://lore.kernel.org/linux-pci/aIp6LiKJor9KLVpv@wunner.de/
Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>
Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
Reviewed-by: Lukas Wunner <lukas@wunner.de>
Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Acked-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Link: https://patch.msgid.link/20250807-add_err_uevents-v5-3-adf85b0620b0@linux.ibm.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

YES

Rationale
- Fixes incorrect uevent status at start of EEH recovery: the code
  currently emits a uevent with `PCI_ERS_RESULT_NONE` regardless of what
  the driver reported via `error_detected()`. This misrepresents the
  actual recovery status to user space.
- The fix makes EEH behave like AER (already fixed by commit
  7b42d97e99d3) and s390, improving cross-arch consistency and user
  space expectations.

Evidence in code
- Current EEH behavior: emits BEGIN_RECOVERY unconditionally at error
  detection
  - `pci_uevent_ers(pdev, PCI_ERS_RESULT_NONE);` is called after
    `error_detected()` even if the driver “votes” differently (e.g.,
    DISCONNECT/NEED_RESET): arch/powerpc/kernel/eeh_driver.c:337
- Proposed change: pass actual driver result
  - Changes the above call to `pci_uevent_ers(pdev, rc);`, where `rc` is
    the result of `driver->err_handler->error_detected()` captured just
    above: arch/powerpc/kernel/eeh_driver.c:337
- uevent mapping semantics (what user space sees) are centralized in
  `pci_uevent_ers()`:
  - NONE/CAN_RECOVER -> `ERROR_EVENT=BEGIN_RECOVERY`, `DEVICE_ONLINE=0`
  - RECOVERED -> `ERROR_EVENT=SUCCESSFUL_RECOVERY`, `DEVICE_ONLINE=1`
  - DISCONNECT -> `ERROR_EVENT=FAILED_RECOVERY`, `DEVICE_ONLINE=0`
  - Others (e.g., NEED_RESET) -> no immediate uevent (consistent with
    AER)
  - drivers/pci/pci-driver.c:1595
- AER already reports actual `error_detected()` return value to udev:
  - `pci_uevent_ers(dev, vote);` after computing `vote` in
    `report_error_detected()`: drivers/pci/pcie/err.c:83
- EEH already emits final-stage uevents correctly (unchanged by this
  patch):
  - Success at resume: `pci_uevent_ers(edev->pdev,
    PCI_ERS_RESULT_RECOVERED);` arch/powerpc/kernel/eeh_driver.c:432
  - Failure path: `pci_uevent_ers(pdev, PCI_ERS_RESULT_DISCONNECT);`
    arch/powerpc/kernel/eeh_driver.c:462

Why this is a bugfix suitable for stable
- User-visible correctness: With the current code, user space always
  sees “BEGIN_RECOVERY” even when drivers have already indicated an
  unrecoverable state (e.g., DISCONNECT). The patch ensures uevents
  reflect the true state immediately, matching AER behavior introduced
  by 7b42d97e99d3.
- Minimal, contained change: One-line change in a single architecture-
  specific file (PowerPC EEH). No API/ABI changes; only corrects the
  parameter passed to an existing helper.
- No architectural change: Keeps existing EEH flow; only adjusts the
  uevent status emitted at a single step.
- Low regression risk: AER has used this semantic for years;
  `pci_uevent_ers()` already handles `rc` values. EEH already emits
  RECOVERED/DISCONNECT at later stages; this makes the initial event
  consistent.
- Aligns cross-arch semantics: Consistent uevent reporting across AER,
  EEH, and s390 reduces user space special-casing and potential errors.

Potential side effects and why acceptable
- For drivers returning `PCI_ERS_RESULT_DISCONNECT` at
  `error_detected()`, user space will now see `FAILED_RECOVERY`
  immediately instead of a misleading `BEGIN_RECOVERY`. This is a
  correctness fix.
- For returns like `PCI_ERS_RESULT_NEED_RESET`, no initial uevent is
  emitted (consistent with AER); user space will still receive final
  RECOVERED/FAILED, as today. Any scripts that strictly expected an
  initial BEGIN_RECOVERY for all cases are already inconsistent with AER
  and should not rely on that behavior.

Historical context
- Uevent support was added by 856e1eb9bdd4 (“PCI/AER: Add uevents in AER
  and EEH error/resume”), initially emitting `NONE` at error detection
  for both AER and EEH.
- AER was corrected by 7b42d97e99d3 (“PCI/ERR: Always report current
  recovery status for udev”) to emit the actual `error_detected()`
  result.
- This patch brings EEH to parity with that established AER behavior.

Conclusion
- This is a targeted, low-risk correctness fix that improves user space
  observability and cross-arch consistency without changing kernel-side
  recovery logic. It fits stable backport rules (important bugfix,
  minimal change, low regression risk, confined to a subsystem).

 arch/powerpc/kernel/eeh_driver.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/eeh_driver.c b/arch/powerpc/kernel/eeh_driver.c
index 48ad0116f3590..ef78ff77cf8f2 100644
--- a/arch/powerpc/kernel/eeh_driver.c
+++ b/arch/powerpc/kernel/eeh_driver.c
@@ -334,7 +334,7 @@ static enum pci_ers_result eeh_report_error(struct eeh_dev *edev,
 	rc = driver->err_handler->error_detected(pdev, pci_channel_io_frozen);
 
 	edev->in_error = true;
-	pci_uevent_ers(pdev, PCI_ERS_RESULT_NONE);
+	pci_uevent_ers(pdev, rc);
 	return rc;
 }
 
-- 
2.51.0


