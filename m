Return-Path: <linuxppc-dev+bounces-12584-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B49C4BA1FE3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Sep 2025 01:46:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cXr2c22vQz30FR;
	Fri, 26 Sep 2025 09:46:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758843976;
	cv=none; b=HMCJwbX+ub23tO2t7YmVkbABhIDybQdqdpnBo4QRNvQFUftkJ0j6oJy0xx0Zd/SuxEqc6nwjsY1DeUwgU1Syi9RdnEEhtzVTMU9Eg3RUIvf0cjUwtmQ0vsZs7ZTMA6oaqPgpX7n/1XcELXVnet/NLxFLg4daNrz/9EzK3+wdRF05tbZmz9tNGx81MIjprz55Gdmw6CTpa2I3gxWRPByVmR9TZT9qJPqzPzJUx2FeJEK/BpANmAbnRLcdEp0GY1t7HDo5KXgJgIMjL6eVjKK+OAnZJa8M2HEJ+UV0Zd4ygIzq+lY4BcVW2pv2KKhBAkCMnINg5c5jgAVGvoZHcLKfwg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758843976; c=relaxed/relaxed;
	bh=BP7wvLITVtd/3+Jvg4BJT8lBVwH9goaGkdXOV+tVve4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HacoqcZaGbLpT1Eq0q9Gh77KeGaVh4Q/yjJETEgKwJbg6FCYsyTfHpertUnUfGAGNmEzVedKkhMSGWCTsl9aIO7v2fozHqQ9MXTqnz2tbTKnUUaIavQ1gUiLh+V3NIkPLHRXnbdmGbwa2XCN3qbZdWZYFdrETNnV/Lc2Cj0M/nbwPjcsFlqQ+OAWsjrGgjmadducTRhJJSyxvCL12RGsC/EMIlTr9LRq9tdbqAhAvk5D7jhjN7dUHsAEwnfP6ZU/bPbiveLSBSHFwNlGEAPT7PjEq8+wJoLAsCFQ/UftUMhq5Pn61417o6CPWSq2ii2ryadgRghJC//KjnOvKI+vAQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QEsgX/7w; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QEsgX/7w;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cXr2b475mz2xQ3
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Sep 2025 09:46:15 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D363745509;
	Thu, 25 Sep 2025 23:46:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65AF9C4CEF0;
	Thu, 25 Sep 2025 23:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758843973;
	bh=BTz2dqzjufAff3cToSGp2U+KM2FiE2ziyECnjpSiYcg=;
	h=From:Subject:Date:To:Cc:From;
	b=QEsgX/7wcHRNzl+DejZjlOEZH+Px+o+nSZg53fjdKmF63FCc50uro/GCKWcjCouLg
	 IRBVqoZ4CdHTps5ywhfTtg46E+xHmlX/788swYivwRbG0nqye7EFyIIV1/Dtb6QYh8
	 IFNMBOOHUHZBw0WGfQFUa47Q0ksrr/jdV9+zqhNBhPCqTRtvErKhKrOLu4WMJ9p+Ju
	 KEiKb1vNliCOgy5evYKCw9fWdN+J3U0VN7W1FikOcWTJZ0DQezxgqfRvHsgUkh82Q8
	 ZbzUa5an1pBVQoNLl9nyVQWCJRMXauozPXwjT8LbVWrwUURg/cD7kaZSwzQgsI0/yu
	 A9WRteHU3INBg==
From: Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH 0/2] Fixes for pmac32_defconfig after fb.h removal from
 backlight.h
Date: Thu, 25 Sep 2025 19:46:05 -0400
Message-Id: <20250925-ppc-fixes-for-backlight-fb-h-removal-v1-0-d256858d86a6@kernel.org>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD3U1WgC/x3MTQqDMBBA4avIrDuQDmh/rlK6SMaJGWpNmIgUx
 Ls3uPwW7+1QxVQqPLsdTDatmpeG66UDTn6ZBHVsBnLUuwf1WApj1J9UjNkweP7MOqUVY8CEJt+
 8+RkpDP5+Y5bREbRVMTmbdnq9j+MPf+/WQHYAAAA=
X-Change-ID: 20250925-ppc-fixes-for-backlight-fb-h-removal-2b6a87cced02
To: Lee Jones <lee@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Daniel Thompson <danielt@kernel.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Simona Vetter <simona.vetter@ffwll.ch>, linuxppc-dev@lists.ozlabs.org, 
 patches@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=832; i=nathan@kernel.org;
 h=from:subject:message-id; bh=BTz2dqzjufAff3cToSGp2U+KM2FiE2ziyECnjpSiYcg=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDBlXrzgdUnxtxKUdeFHILKSJ5eL7NKNTLtY3VjLpntdfe
 n+C78EZHaUsDGJcDLJiiizVj1WPGxrOOct449QkmDmsTCBDGLg4BWAi4XsZ/uelJu19XOr49Nfm
 qtN57VcWCD98dF/o3J0D77e82hfD/c6NkWFjCPPcnZY/IzUNPs380SWXLGcwZyb3GxfFvy/OWlR
 OEuIHAA==
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Commit 9f218f9bb9d2 ("backlight: Do not include <linux/fb.h> in header
file") exposed some necessary includes that were missing from a few
powerpc drivers, breaking the build. This series resolves them.

This should go via the backlight tree, which includes 9f218f9bb9d2, but
I have included the PowerPC folks for visibility.

---
Nathan Chancellor (2):
      powerpc/powermac: Include linux/of.h in backlight.c
      macintosh/via-pmu-backlight: Include linux/of.h and uapi/linux/fb.h

 arch/powerpc/platforms/powermac/backlight.c | 1 +
 drivers/macintosh/via-pmu-backlight.c       | 2 ++
 2 files changed, 3 insertions(+)
---
base-commit: 9f218f9bb9d274b9d5d48a4c95e1b199141fc1f2
change-id: 20250925-ppc-fixes-for-backlight-fb-h-removal-2b6a87cced02

Best regards,
--  
Nathan Chancellor <nathan@kernel.org>


