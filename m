Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8750A7EB541
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Nov 2023 18:03:28 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dJe1Kor5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SVCL63KD8z3cXy
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Nov 2023 04:03:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dJe1Kor5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=devnull+nathanl.linux.ibm.com@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SVCKB38BBz3cRs
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Nov 2023 04:02:38 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C5FC4CE094D;
	Tue, 14 Nov 2023 17:02:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0C718C433CA;
	Tue, 14 Nov 2023 17:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699981354;
	bh=C9FsR/z1ZXtSQnNdRo5NqOp7YDyeKa33cGra0Q+pvy8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=dJe1Kor5SXbdo0JXxXROFojWQX1W/Nh3rGemnolAgyKJbZu2jiaWTwU/QVvNdveBS
	 zsA3QeTMr+gDZCicyY2poD83G1H5ZX/aT+3t4e9SSh7U+DCZSg6Ww5AF/aFHc8p6BP
	 jQ7O+cFFSbFR3l6ChaEDUCmp87LwPZthHxId0E8hgX/epkGhGdi0LTiGX/g9DTxzmG
	 5RJ84ctex9xmnjpczsKYuNg9gINKxPFTcYZOrxWkugt1UOKqy9lBjJ+eDa0YoEInPh
	 qib3KF7RxMjr3c2WUrdZ1aWB+puu6GyLFb7FKuJ5A11UTlruhgfYRiYufjFubzek55
	 5KPVrkmtWDmNw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2692C4167B;
	Tue, 14 Nov 2023 17:02:33 +0000 (UTC)
From: Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>
Date: Tue, 14 Nov 2023 11:01:54 -0600
Subject: [PATCH 2/3] powerpc/pseries/memhp: Remove unbalanced
 dlpar_release_drc() call
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231114-pseries-memhp-fixes-v1-2-fb8f2bb7c557@linux.ibm.com>
References: <20231114-pseries-memhp-fixes-v1-0-fb8f2bb7c557@linux.ibm.com>
In-Reply-To: <20231114-pseries-memhp-fixes-v1-0-fb8f2bb7c557@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1699981353; l=1128;
 i=nathanl@linux.ibm.com; s=20230817; h=from:subject:message-id;
 bh=SI5VGXmes014ZZ4j4BIRL6/6dqnnjMkcnKTZDpxpV2w=;
 b=2AhfoR+rD1s1cjLBKO45hF/+ru+QUnDy7mVNZKNqRvbw4b7+zc0/PUkaadg0Jll9ofFLEsdQc
 R3Dedf8N6e8Bboe/IRvhD3ogSDn/il0f5ZGmZJhr2FwyL8sE/WZWDrk
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Nick Child <nnac123@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Scott Cheloha <cheloha@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Nathan Lynch <nathanl@linux.ibm.com>

Callers of dlpar_add_lmb() are responsible for first acquiring the DRC
and releasing it if dlpar_add_lmb() fails.

However, dlpar_add_lmb() performs a dlpar_release_drc() in one error
branch.  There is no corresponding dlpar_acquire_drc() in the
function, nor is there any stated justification. None of the other
error paths in dlpar_add_lmb() release the DRC.

This is a potential source of redundant attempts to release DRCs,
which is likely benign, but is confusing and inconsistent. Remove it.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/hotplug-memory.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c b/arch/powerpc/platforms/pseries/hotplug-memory.c
index 6f2eebae7bee..ba883c1b9f6d 100644
--- a/arch/powerpc/platforms/pseries/hotplug-memory.c
+++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
@@ -575,7 +575,6 @@ static int dlpar_add_lmb(struct drmem_lmb *lmb)
 
 	rc = update_lmb_associativity_index(lmb);
 	if (rc) {
-		dlpar_release_drc(lmb->drc_index);
 		return rc;
 	}
 

-- 
2.41.0

