Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 596C08D8A35
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jun 2024 21:32:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=h5ypBDu0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VtP4j0vjSz3cmp
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2024 05:32:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=h5ypBDu0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=devnull+nathanl.linux.ibm.com@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VtP3x54syz3cZC
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jun 2024 05:31:41 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CCF9F60918;
	Mon,  3 Jun 2024 19:31:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 80880C2BD10;
	Mon,  3 Jun 2024 19:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717443098;
	bh=ADjDfMOOWtB5OlarqJFBuey88NNlSIwhNIIO5H123ZM=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=h5ypBDu07d6S/tyrCJGFAoXm5SLMQGUtNq9gkbxAAae51e9bkVqOMecJLcG9R7S95
	 UtiMUSB5IJvaxKd9xxXFnmxoCwXdetCne1mjBpchZWH9v+OKUNW9/LvQdlww9TZlDg
	 YWSxwjwJ8CeNougTNhur30YbinEBSwgKyTwS+GoYkJ8PAJNWlneYG4blZqy++Hmaag
	 +zfMd9VtlXWP8Qq1lveg6GkFR0/L4WTKQfNIyQuTP44R6doPzN0bit4stc/9sfTh+/
	 D89StqCmjLjRCs3WTp96plmSpvPXSFGH0t7oZjCRbt2MvdgOb0WOUKELZ4Al2c6pKp
	 VhB/nDQM/cxtQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69B99C25B75;
	Mon,  3 Jun 2024 19:31:38 +0000 (UTC)
From: Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>
Date: Mon, 03 Jun 2024 14:31:32 -0500
Subject: [PATCH] powerpc/mm/drmem: Silence drmem_init() early return
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240603-silence-drmem_init-v1-1-e9d71646bc3d@linux.ibm.com>
X-B4-Tracking: v=1; b=H4sIABMaXmYC/x3M3QpAMBiH8VvRe2w1zEduRRLbH28x2iSl3bvl8
 HfwPC95OIanNnnJ4WbPh43I0oT0OtoFgk005TJXspKF8LzBagjjduwDW76EGVVZ12jkpDTF8HS
 Y+fmnXR/CBysngiRkAAAA
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1717443097; l=939;
 i=nathanl@linux.ibm.com; s=20230817; h=from:subject:message-id;
 bh=ArKgFOJwaRqH7ZIf89ZHqTfwAzZfHpebTMperM6RitI=;
 b=rq41dBW5bVWytILVb8ARF1MR+WzjqtCGpcm7z8zm3h9fUhcoF8ykkRTGOgOWYA1AIt1MVG2Ss
 tn46YYWpZBuC0dR05kphRGalt5WOA7a1WTD7EIItSs01+Kfyws4Pvc6
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Nathan Lynch <nathanl@linux.ibm.com>

It's not an error or noteworthy condition if the
"ibm,dynamic-reconfiguration-memory" node isn't present.

Drop the needless message.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/mm/drmem.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/powerpc/mm/drmem.c b/arch/powerpc/mm/drmem.c
index c110ab8fa8a3..8dd7b340d51f 100644
--- a/arch/powerpc/mm/drmem.c
+++ b/arch/powerpc/mm/drmem.c
@@ -491,10 +491,8 @@ static int __init drmem_init(void)
 	const __be32 *prop;
 
 	dn = of_find_node_by_path("/ibm,dynamic-reconfiguration-memory");
-	if (!dn) {
-		pr_info("No dynamic reconfiguration memory found\n");
+	if (!dn)
 		return 0;
-	}
 
 	if (init_drmem_lmb_size(dn)) {
 		of_node_put(dn);

---
base-commit: be2fc65d66e0406cc9d39d40becaecdf4ee765f3
change-id: 20240603-silence-drmem_init-da4577e80b4c

Best regards,
-- 
Nathan Lynch <nathanl@linux.ibm.com>


