Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B039898F2D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Apr 2024 21:44:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=b4XkN8kk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V9XBF5fcqz3vYD
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Apr 2024 06:44:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=b4XkN8kk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=devnull+nathanl.linux.ibm.com@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V9X9T6TV2z3cNN
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Apr 2024 06:43:41 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 0A174CE1138;
	Thu,  4 Apr 2024 19:43:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 426DBC433C7;
	Thu,  4 Apr 2024 19:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712259817;
	bh=ykeQUbXyzmvhAHWqoboLCCUorGmowhWxKCGC1zFKsCs=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=b4XkN8kksx0cyTbmn5ANwFhXGQzFQT4ssCH6Ggbw8cMAStMPgzgdT9lQFhvRkG2ta
	 tMdH3UXSTdtFe+DhrfQtWPWUR8mCfmAgLXRhJ0kRr/pU6zHBGvYNfnX9Z1523fV3sR
	 5oipA/LG2MryYkbbcLysZaBxmn62s7YrCg3Fyzzy7kMe+9xVD/cOqPrFK5DvU4vC0T
	 zJlLhW97jj7CsDvm0L3RmgAgprJ4Pq1mBaVdM+EoArCH88h7edxUyaaRWqBCWbi00N
	 cXEHianI4+imt6Lvyf6l4Y9UTcA5zWYVQXWJLqGZbI91kqW9G8BsffcCOQIZA+zmJ+
	 Zes0xyF6YmW/A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 284DCCD1288;
	Thu,  4 Apr 2024 19:43:37 +0000 (UTC)
From: Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>
Date: Thu, 04 Apr 2024 14:43:36 -0500
Subject: [PATCH] selftests/powerpc/papr-vpd: Fix missing variable
 initialization
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240404-papr-vpd-test-uninit-lc-v1-1-04cc22d7f799@linux.ibm.com>
X-B4-Tracking: v=1; b=H4sIAOcCD2YC/x3MTQqAIBBA4avErBvwpwy6SrQInWogTNQiCO+et
 PwW772QKDIlGJsXIt2c+PQVsm3A7ovfCNlVgxKqE53QGJYQ8Q4OM6WMl2fPGQ+LWhhLxrpemgF
 qHSKt/PznaS7lA/abMUBpAAAA
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1712259816; l=1184;
 i=nathanl@linux.ibm.com; s=20230206; h=from:subject:message-id;
 bh=a/o3lqjGPFohwmOc1NqwCzXppmJphtefEpMvQ+pHiZg=;
 b=CB1egXPxeJFbMCiCCEwDWAUrD1ZHMqzxvct9cHVm4rS7gOYh7P/htxqic1JpeBzzIBv/C0ise
 NX4OZvLPaqnBNBDGivFi5O4HNk5J51DKsL+MoE+xCrkryOoFgvu43FS
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Nathan Lynch <nathanl@linux.ibm.com>

The "close handle without consuming VPD" testcase has inconsistent
results because it fails to initialize the location code object it
passes to ioctl() to create a VPD handle. Initialize the location code
to the empty string as intended.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
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


