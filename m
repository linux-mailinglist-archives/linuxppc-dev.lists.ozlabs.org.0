Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5076059ADEC
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Aug 2022 14:34:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M8yjz1yKpz3cC1
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Aug 2022 22:34:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DBch2/TS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DBch2/TS;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M8yjK3fsmz304n
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Aug 2022 22:33:57 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1815E61226;
	Sat, 20 Aug 2022 12:33:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53AD6C433C1;
	Sat, 20 Aug 2022 12:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660998834;
	bh=mCz2SxJKYp8oLIDh+dfPccwFT6pIPPbM7vRC1B7QWME=;
	h=From:To:Cc:Subject:Date:From;
	b=DBch2/TSovQN6bsHK3PYXvYmjx2yg/WBvzNi404oyhcuXHxP22Vpx73Rc0tI6hAtL
	 7p5eI8zlCjDwcow2VW3jrLtUl4RbN7MNBeEpAsXOYFUlND1OWD7QQlVUyb9n5JaDRA
	 0qQaLrd1/g5hWz0ovxwYHrJKPIkbt49e256KHrrd64BKTjZT0dVaUstVrR2EzIkx37
	 96kJTYUwiAaKPtPxFVJc2/4rOITmT644yH0EEu04gO6OoITQY/Bb31V2rskJfcqHBs
	 M169miU07sCQxviv/SMR7CgUgCVekCVrxNLMGDphs00Qtlwve4kcrhAyliMCZXRRP4
	 K4aXS/jywVBEg==
Received: by pali.im (Postfix)
	id 9F2095D0; Sat, 20 Aug 2022 14:33:51 +0200 (CEST)
From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Paul Mackerras <paulus@samba.org>
Subject: [PATCH] powerpc/fsl-pci: Choose PCI host bridge with alias pci0 as the primary
Date: Sat, 20 Aug 2022 14:33:27 +0200
Message-Id: <20220820123327.20551-1-pali@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

If there's no PCI host bridge with ISA then check for PCI host bridge with
alias "pci0" (first PCI host bridge) and if it exists then choose it as the
primary PCI host bridge.

This makes choice of primary PCI host bridge more stable across boots and
updates as the last fallback candidate for primary PCI host bridge (if
there is no choice) is selected arbitrary.

Signed-off-by: Pali Rohár <pali@kernel.org>
---
 arch/powerpc/sysdev/fsl_pci.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/powerpc/sysdev/fsl_pci.c b/arch/powerpc/sysdev/fsl_pci.c
index 1011cfea2e32..e4b703943dd3 100644
--- a/arch/powerpc/sysdev/fsl_pci.c
+++ b/arch/powerpc/sysdev/fsl_pci.c
@@ -1125,6 +1125,19 @@ void __init fsl_pci_assign_primary(void)
 			return;
 	}
 
+	/*
+	 * If there's no PCI host bridge with ISA then check for
+	 * PCI host bridge with alias "pci0" (first PCI host bridge).
+	 */
+	np = of_find_node_by_path("pci0");
+	if (np && of_match_node(pci_ids, np) && of_device_is_available(np)) {
+		fsl_pci_primary = np;
+		of_node_put(np);
+		return;
+	}
+	if (np)
+		of_node_put(np);
+
 	/*
 	 * If there's no PCI host bridge with ISA, arbitrarily
 	 * designate one as primary.  This can go away once
-- 
2.20.1

