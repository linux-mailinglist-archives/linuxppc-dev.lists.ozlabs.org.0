Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 54DCE8D8341
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jun 2024 15:01:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=U9feCv+f;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VtDQ53St9z3ck3
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jun 2024 23:01:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=U9feCv+f;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=devnull+nathanl.linux.ibm.com@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VtDPL5PH0z30TQ
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Jun 2024 23:01:10 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 585B960DD0;
	Mon,  3 Jun 2024 13:01:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0C118C2BD10;
	Mon,  3 Jun 2024 13:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717419669;
	bh=hJYwoFGlnugTymRGVt1UgZWaPCCiUj0gq+QrUUX/45E=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=U9feCv+fYTluUBwM4FpOl8q47QdLHhSbMGDa7v6J4r2GBJYbYLwO2ZxIlrKH8Q4+j
	 tSq3yQiYAwpRGvJoeSPBDYQeAbbgiFwn+5lhXyMubLMao/4uLTxUXBenwAwtES8vbe
	 R6UW5fk9ZzQoXMUih9Z49Ds1sMYuFcjyTjBeL0QC5cmpEo6lbAImf3J8IngtBAVzSx
	 sx3VXcxelzYtVl9wPxviYkyz2j5RSyZupIwXf9eq/IEDAQTdH0zova4wQTint0KVdp
	 IEPiPV2kIn+qi04NbEHKrwU8iNMcn7c++i1QtNAj0Ql1gfS0+RPa4u45TR7JpMCWpq
	 Lx9zZgVxoMn9Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA63EC25B75;
	Mon,  3 Jun 2024 13:01:08 +0000 (UTC)
From: Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>
Date: Mon, 03 Jun 2024 08:01:03 -0500
Subject: [PATCH] powerpc/crypto: Add generated P8 asm to .gitignore
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240603-powerpc-crypto-ignore-p8-asm-v1-1-05843fec2bb7@linux.ibm.com>
X-B4-Tracking: v=1; b=H4sIAI6+XWYC/x3MOw6DMAwA0Ksgz1hy+VSlV0EdosSAhyaWU1EQ4
 u5EjG95B2Q24Qzv6gDjVbKkWPCoK/CLizOjhGJoqOnoSS1q+rOpR2+7/hLKHJMx6gtd/mIXhqk
 fgiNqGUqhxpNsdz9+zvMCr/+Njm4AAAA=
To: Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, 
 Danny Tsen <dtsen@linux.ibm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1717419668; l=931;
 i=nathanl@linux.ibm.com; s=20230817; h=from:subject:message-id;
 bh=QihzfT/yvBcFqpbTNR7ndCqh7WaXVJqXBsXhRlZPQ90=;
 b=QGuEuclbxZu65XOLMH9NK3EWtZhcZw+0yN7nFsIHy+I7MoKKPXUPvM7Gsd3TDDsqn7GmZ3CUN
 CjIqTKmsh3OARa/D/u5bqr2EQMRnMMb17I33uslOf1hxKx6/We9aCDd
X-Developer-Key: i=nathanl@linux.ibm.com; a=ed25519;
 pk=jPDF44RvT+9DGFOH3NGoIu1xN9dF+82pjdpnKjXfoJ0=
X-Endpoint-Received: by B4 Relay for nathanl@linux.ibm.com/20230817 with
 auth_id=78
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Nathan Lynch <nathanl@linux.ibm.com>

Looks like drivers/crypto/vmx/.gitignore should have been merged into
arch/powerpc/crypto/.gitignore as part of commit
109303336a0c ("crypto: vmx - Move to arch/powerpc/crypto") so that all
generated asm files are ignored.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
Fixes: 109303336a0c ("crypto: vmx - Move to arch/powerpc/crypto")
---
 arch/powerpc/crypto/.gitignore | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/crypto/.gitignore b/arch/powerpc/crypto/.gitignore
index e1094f08f713..e9fe73aac8b6 100644
--- a/arch/powerpc/crypto/.gitignore
+++ b/arch/powerpc/crypto/.gitignore
@@ -1,3 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
 aesp10-ppc.S
+aesp8-ppc.S
 ghashp10-ppc.S
+ghashp8-ppc.S

---
base-commit: be2fc65d66e0406cc9d39d40becaecdf4ee765f3
change-id: 20240603-powerpc-crypto-ignore-p8-asm-4d9f59da003e

Best regards,
-- 
Nathan Lynch <nathanl@linux.ibm.com>


