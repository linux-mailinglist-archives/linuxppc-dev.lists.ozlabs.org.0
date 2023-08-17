Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B21A877FC00
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Aug 2023 18:23:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dC8zXzE7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RRVgT3jNVz3dDy
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Aug 2023 02:23:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dC8zXzE7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=devnull+nathanl.linux.ibm.com@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RRVdg01fKz3bWH
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Aug 2023 02:22:14 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3739161690;
	Thu, 17 Aug 2023 16:22:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9D0CBC433C7;
	Thu, 17 Aug 2023 16:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692289330;
	bh=/UG5yshygFrQmZa8Qu5vuhRCfAcK8aFU0HH/CDSQKWw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=dC8zXzE7uoqBoyeEermmZDs2BkPTBHRTFSv+jrZpcQjrx23uc8HLKJs2rmiT0XUt/
	 RzA/HgJvH2t09gt5VKB7nv4ODIRKH+rrlav6jR7UGPdTMI9jw73D93fvnoImX2PbBJ
	 cE1OmFrC5CznQ9xQcXBpRcBRdWpbp4L8coDtSF7u0xgB4ARmFPnTBLLvBTxHs7xNOf
	 CY3AGxsUA/J9gmH6qVvhLtBKFT1tIQJPh/Z+3yGXiQgclUkrt3/G3bp0a989ks/+VS
	 iRCI8FNgC1/EvupCm/6lYXkx6JcVUy1tyac4x8zKndc1kbGcPf+GsNPVQYqVw8zqFX
	 EXTIJqyJ2C5SA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C617C3DA50;
	Thu, 17 Aug 2023 16:22:10 +0000 (UTC)
From: Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>
Date: Thu, 17 Aug 2023 11:21:52 -0500
Subject: [PATCH 1/2] powerpc/selftests: sort mm/.gitignore, add exec_prot
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230817-powerpc-selftest-misc-v1-1-a84cc1ef78b2@linux.ibm.com>
References: <20230817-powerpc-selftest-misc-v1-0-a84cc1ef78b2@linux.ibm.com>
In-Reply-To: <20230817-powerpc-selftest-misc-v1-0-a84cc1ef78b2@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1692289329; l=945;
 i=nathanl@linux.ibm.com; s=20230817; h=from:subject:message-id;
 bh=Z/88EbWN790XkVvb3x287idnDanC2WrxI0AE8kR6mLQ=;
 b=3juCn+J4s8cYIXbbbnSZR/ZRKw0HNMtREkvmbWpwXQrYuoc5DghUjRwkuYfbN1eB5Tl5l9Obq
 KSU/rS4ViOcAxJt8Cx839TwNdby8e+wN7JiGBkeaZIZsodmEjlJj2vo
X-Developer-Key: i=nathanl@linux.ibm.com; a=ed25519;
 pk=jPDF44RvT+9DGFOH3NGoIu1xN9dF+82pjdpnKjXfoJ0=
X-Endpoint-Received:  by B4 Relay for nathanl@linux.ibm.com/20230817 with auth_id=78
X-Original-From: Nathan Lynch <nathanl@linux.ibm.com>
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
Reply-To: nathanl@linux.ibm.com
Cc: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Nathan Lynch <nathanl@linux.ibm.com>

Add exec_prot to to mm/.gitignore and sort the result.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 tools/testing/selftests/powerpc/mm/.gitignore | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/powerpc/mm/.gitignore b/tools/testing/selftests/powerpc/mm/.gitignore
index 4e1a294eec35..0df1a3afc5e2 100644
--- a/tools/testing/selftests/powerpc/mm/.gitignore
+++ b/tools/testing/selftests/powerpc/mm/.gitignore
@@ -1,15 +1,16 @@
 # SPDX-License-Identifier: GPL-2.0-only
+bad_accesses
+exec_prot
 hugetlb_vs_thp_test
-subpage_prot
-tempfile
-prot_sao
-segv_errors
-wild_bctr
 large_vm_fork_separation
-bad_accesses
-tlbie_test
+large_vm_gpr_corruption
 pkey_exec_prot
 pkey_siginfo
+prot_sao
+segv_errors
 stack_expansion_ldst
 stack_expansion_signal
-large_vm_gpr_corruption
+subpage_prot
+tempfile
+tlbie_test
+wild_bctr

-- 
2.41.0

