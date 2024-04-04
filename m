Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A508990F3
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Apr 2024 00:03:04 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Uadm20zc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V9bGG5BH0z3vZR
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Apr 2024 09:03:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Uadm20zc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=devnull+nathanl.linux.ibm.com@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V9bFV5JjJz3c5J
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Apr 2024 09:02:22 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 527846176A;
	Thu,  4 Apr 2024 22:02:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E994CC433F1;
	Thu,  4 Apr 2024 22:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712268138;
	bh=UgVpT3HlGkIsl+I8fTMWUFls/94yxe0pHH2dt8xmGvw=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=Uadm20zcdMHW+MOTrDkoBb0FWza7/1DxmNTaa0eZ/VIvsjvzYFMFIDogoHGXSZLDd
	 bJ2cHivUyxKc93GQyFd0ajOEsvDOtL1AD8MnO49yTHUBGewqMy7q3VD7RF3SwozEId
	 EFS0b5tNQ/REuTuARxaR/PNpzxp31Ntf6rmLNEGJBSdqtCWHHQKULUOEyYXutDYTJD
	 iA98HAvRW+eAwuWBJ7sax4yigBSIil4qAOqMXhm9/okLZJXRii4m16u8180YH5f8bx
	 +AJxR/3wWcLoX78uhK94O8SiXtqyD8n2bzDeuj4x12/s2/qh7yAEGoQQWNKEFH2QZ3
	 YODpGYm1oWsRw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D50C0CD1284;
	Thu,  4 Apr 2024 22:02:17 +0000 (UTC)
From: Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>
Date: Thu, 04 Apr 2024 17:02:09 -0500
Subject: [PATCH v2] selftests/powerpc/papr-vpd: Fix missing variable
 initialization
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240404-papr-vpd-test-uninit-lc-v2-1-37bff46c65a5@linux.ibm.com>
X-B4-Tracking: v=1; b=H4sIAGAjD2YC/3WNwQqDMBAFf0Vy7koSU8We+h/Fg93EuqAxJDFYx
 H9vKvTY4wy8eTsLxpMJ7FbszJtEgRabQV4KhmNvXwZIZ2aSS8UVr8D1zkNyGqIJEVZLliJMCBW
 v0dSor6JuWF47bwbazvKjyzxSiIt/n0dJfO2vqf42kwABXCFKqZuhadv7RHbdSnrOJS4z647j+
 ACbLa0PwgAAAA==
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1712268137; l=1473;
 i=nathanl@linux.ibm.com; s=20230206; h=from:subject:message-id;
 bh=bYiOiaClrXV1SOzlLA/y5qVSPUcyHE9ZqM034MU/ORQ=;
 b=PZ2pQwgASuBN6LNMB7MTOSfo6bFZNALzbSHPPZImCqh1/KrQYGyYdq/674lEj60WEJ3bP6Pe4
 6OfduhqsyTwDBGXI4HtY0W2Y03/rHUD94c9xJJW2MOetH+d/wtE5icB
X-Developer-Key: i=nathanl@linux.ibm.com; a=ed25519;
 pk=6daubz/ymoaMF+8voz7UHwnhluEsmDZuqygIIMWpQQY=
X-Endpoint-Received: by B4 Relay for nathanl@linux.ibm.com/20230206 with
 auth_id=27
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Geetika Moolchandani <geetika@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Nathan Lynch <nathanl@linux.ibm.com>

The "close handle without consuming VPD" testcase has inconsistent
results because it fails to initialize the location code object it
passes to ioctl() to create a VPD handle. Initialize the location code
to the empty string as intended.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
Reported-by: Geetika Moolchandani <geetika@linux.ibm.com>
Fixes: 9118c5d32bdd ("powerpc/selftests: Add test for papr-vpd")
---
Changes in v2:
- Add Fixes: and Reported-by: tags.
- Link to v1: https://lore.kernel.org/r/20240404-papr-vpd-test-uninit-lc-v1-1-04cc22d7f799@linux.ibm.com
---
 tools/testing/selftests/powerpc/papr_vpd/papr_vpd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/powerpc/papr_vpd/papr_vpd.c b/tools/testing/selftests/powerpc/papr_vpd/papr_vpd.c
index 505294da1b9f..d6f99eb9be65 100644
--- a/tools/testing/selftests/powerpc/papr_vpd/papr_vpd.c
+++ b/tools/testing/selftests/powerpc/papr_vpd/papr_vpd.c
@@ -154,7 +154,7 @@ static int dev_papr_vpd_null_handle(void)
 static int papr_vpd_close_handle_without_reading(void)
 {
 	const int devfd = open(DEVPATH, O_RDONLY);
-	struct papr_location_code lc;
+	struct papr_location_code lc = { .str = "", };
 	int fd;
 
 	SKIP_IF_MSG(devfd < 0 && errno == ENOENT,

---
base-commit: bfe51886ca544956eb4ff924d1937ac01d0ca9c8
change-id: 20240403-papr-vpd-test-uninit-lc-306ce6cd5167

Best regards,
-- 
Nathan Lynch <nathanl@linux.ibm.com>


