Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 951CA1CA798
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 May 2020 11:55:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49JQfq72W9zDr32
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 May 2020 19:54:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=inria.fr (client-ip=192.134.164.104;
 helo=mail3-relais-sop.national.inria.fr; envelope-from=julia.lawall@inria.fr;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=inria.fr
X-Greylist: delayed 73 seconds by postgrey-1.36 at bilbo;
 Fri, 08 May 2020 19:53:41 AEST
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49JQdK4GTYzDqtK
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 May 2020 19:53:41 +1000 (AEST)
X-IronPort-AV: E=Sophos;i="5.73,367,1583190000"; d="scan'208";a="348097894"
Received: from palace.rsr.lip6.fr (HELO palace.lip6.fr) ([132.227.105.202])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/AES256-SHA256;
 08 May 2020 11:52:21 +0200
From: Julia Lawall <Julia.Lawall@inria.fr>
To: Jeremy Kerr <jk@ozlabs.org>
Subject: [PATCH] powerpc/spufs: adjust list element pointer type
Date: Fri,  8 May 2020 11:12:56 +0200
Message-Id: <1588929176-28527-1-git-send-email-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 1.9.1
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
Cc: Nic Volanschi <eugene.volanschi@inria.fr>, Arnd Bergmann <arnd@arndb.de>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Other uses of &gang->aff_list_head, eg in spufs_assert_affinity, indicate
that the list elements have type spu_context, not spu as used here.  Change
the type of tmp accordingly.

This has no impact on the execution, because tmp is not used in the body of
the loop.

Fixes: c5fc8d2a92461 ("[CELL] cell: add placement computation for scheduling of affinity contexts")
Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 arch/powerpc/platforms/cell/spufs/sched.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/cell/spufs/sched.c b/arch/powerpc/platforms/cell/spufs/sched.c
index f18d5067cd0f..487fcb47f10d 100644
--- a/arch/powerpc/platforms/cell/spufs/sched.c
+++ b/arch/powerpc/platforms/cell/spufs/sched.c
@@ -344,8 +344,7 @@ static struct spu *aff_ref_location(struct spu_context *ctx, int mem_aff,
 static void aff_set_ref_point_location(struct spu_gang *gang)
 {
 	int mem_aff, gs, lowest_offset;
-	struct spu_context *ctx;
-	struct spu *tmp;
+	struct spu_context *tmp, *ctx;
 
 	mem_aff = gang->aff_ref_ctx->flags & SPU_CREATE_AFFINITY_MEM;
 	lowest_offset = 0;

