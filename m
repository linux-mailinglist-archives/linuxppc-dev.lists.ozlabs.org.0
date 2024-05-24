Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id E2B978CEA62
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 May 2024 21:36:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Vqw/a7yZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VmFWN5PB9z79FT
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 May 2024 05:30:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Vqw/a7yZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=devnull+nathanl.linux.ibm.com@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VmFVf1Rvdz78qb
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 May 2024 05:30:02 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4B09463200;
	Fri, 24 May 2024 19:29:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F2566C2BBFC;
	Fri, 24 May 2024 19:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716578999;
	bh=fQc3hu9PNTUaaXT1d+s0kQugD3afWKZUaVD8b4wu//c=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=Vqw/a7yZltvR9bAtUrgn5Yw9tC5IyJwweS+n8JCKruH0OU8c3by8wPs3rLYKcw6G1
	 fCwf8ftgAg4WMywgXN6yzkK7Hk5YXiixkeBIrjJYVtm2F5CbTbExroMvw/Vxuu2Ris
	 P8dQ6WUn+WjIbirIafeTn7Kdhz7g43I6CmJCDbnzNoHsIquBmbkBx7MzMQHRDy8pTU
	 WdoPdmuP7WqW5gI63uLeo6NnlFxHKnCVRVxBzslfEVzz/7T035NobAsn0tYpKaPSOJ
	 WVIkVhRuOplHooEjTpBjrXRMALz7bJ8XplzO3HvkB7+YOSqJgHTMVZQ8g1+w9PoXIk
	 2eBh2n8iEJAkQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFE3BC25B79;
	Fri, 24 May 2024 19:29:58 +0000 (UTC)
From: Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>
Date: Fri, 24 May 2024 14:29:54 -0500
Subject: [PATCH v2] powerpc/pseries/lparcfg: drop error message from guest
 name lookup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240524-lparcfg-updates-v2-1-62e2e9d28724@linux.ibm.com>
X-B4-Tracking: v=1; b=H4sIALLqUGYC/2WNywqDMBBFf0Vm3UgmRi1d9T+KixhHHfAREhWL+
 O+Nbrs8B+65BwTyTAFeyQGeNg48TxHUIwHbm6kjwU1kUFJlqFCJwRlv206srjELBUEt5jorbZG
 XEuLKeWp5v4ufKnLPYZn99z7Y8LJXS0uU+q+1oUBRFEbiUxtNNb4HntY95XpM7TxCdZ7nD2v1R
 f2yAAAA
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716578998; l=1381;
 i=nathanl@linux.ibm.com; s=20230817; h=from:subject:message-id;
 bh=NEUhSoj0WlsPQRe4cTFyD/u1YuoW2Ozw67ZFMVrHt8s=;
 b=8dDzzlfhfwDYt/+lQsriCZU9IsT5xbUPTZR+JEVH3hp8IOKBL4E+ZAzPklOxA5xc9KBLyldxu
 ErXiV9kd143BL3FQsGuzqbkxAOt48q/t9IPGBg68X7uzXJjjwDSO10z
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

It's not an error or exceptional situation when the hosting
environment does not expose a name for the LP/guest via RTAS or the
device tree. This happens with qemu when run without the '-name'
option. The message also lacks a newline. Remove it.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
Fixes: eddaa9a40275 ("powerpc/pseries: read the lpar name from the firmware")
---
Changes in v2:
- Added Fixes: tag
- Link to v1: https://lore.kernel.org/r/20240104-lparcfg-updates-v1-1-66a0184a4eb1@linux.ibm.com
---
 arch/powerpc/platforms/pseries/lparcfg.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/lparcfg.c b/arch/powerpc/platforms/pseries/lparcfg.c
index 6e7029640c0c..62da20f9700a 100644
--- a/arch/powerpc/platforms/pseries/lparcfg.c
+++ b/arch/powerpc/platforms/pseries/lparcfg.c
@@ -371,8 +371,8 @@ static int read_dt_lpar_name(struct seq_file *m)
 
 static void read_lpar_name(struct seq_file *m)
 {
-	if (read_rtas_lpar_name(m) && read_dt_lpar_name(m))
-		pr_err_once("Error can't get the LPAR name");
+	if (read_rtas_lpar_name(m))
+		read_dt_lpar_name(m);
 }
 
 #define SPLPAR_MAXLENGTH 1026*(sizeof(char))

---
base-commit: 61700f816e6f58f6b1aaa881a69a784d146e30f0
change-id: 20231212-lparcfg-updates-ef15437c6570

Best regards,
-- 
Nathan Lynch <nathanl@linux.ibm.com>


