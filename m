Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F927E25F0
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Nov 2023 14:45:57 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ucUkQyA7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SPCKv4VNrz3d8t
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Nov 2023 00:45:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ucUkQyA7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=devnull+nathanl.linux.ibm.com@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SPCHB2S4jz2ygZ
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Nov 2023 00:43:34 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 1C8DFB80FC3;
	Mon,  6 Nov 2023 13:43:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 72D06C433C8;
	Mon,  6 Nov 2023 13:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699278209;
	bh=XjHHeI3xDmkXHroqHwUZ8yGTVJECDdLLXqJa8OXMPNY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ucUkQyA7YndKYztTQ6J1wqccqzQtXT4TN8PrhYzp4IWFIsb9bUNL8ymNSTFNolAAN
	 zVaeegntyDhdee4yK8vUIE/3bv7B/hRdfeRT4VYZMcWtduHWGMjtHGGHzTni5ASx34
	 p/i5G7NmMYMua059r0Fz0TqOGMGRb5YKtJIGrMK4J+M4x6zS9NAsUChBbQ87oQh0oC
	 SehdfXpBR57C2vSItljImk9/o5lPQrue0eVIp8X7q0Wgjf3WC7Mq1a1L40dGwO7I3M
	 MDUrcpD22vIaIbQFpDqUHnzERGUusgv78jXUzpZUMJoFw5qeCyOKFN0yu1s7n95N2r
	 D0w56ET6ey4tg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56642C4167B;
	Mon,  6 Nov 2023 13:43:29 +0000 (UTC)
From: Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>
Date: Mon, 06 Nov 2023 07:42:53 -0600
Subject: [PATCH 1/7] powerpc/pseries/rtas-work-area: Fix
 rtas_work_area_reserve_arena() kernel-doc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231106-rtas-trivial-v1-1-61847655c51f@linux.ibm.com>
References: <20231106-rtas-trivial-v1-0-61847655c51f@linux.ibm.com>
In-Reply-To: <20231106-rtas-trivial-v1-0-61847655c51f@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1699278208; l=1096;
 i=nathanl@linux.ibm.com; s=20230817; h=from:subject:message-id;
 bh=SPblNQSOeY7KfFeIri1eXB1+jA3JaMamORCx6F8Rpj8=;
 b=ClSDmi29HMUQ/80JEN74l2GYbpkCJCraOELVtZVWM4BcHjR7EoGR+7y05tlobqs+rzevFc2hq
 6MLMgp4jhM2Boo7+J9i7RqIMaewoL1EYzk+C1iev6c+dYScV+gBgK7z
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, kernel test robot <lkp@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Nathan Lynch <nathanl@linux.ibm.com>

From a W=1 build:

>> arch/powerpc/platforms/pseries/rtas-work-area.c:189: warning: Function parameter or member 'limit' not
>> described in 'rtas_work_area_reserve_arena'

Add the missing description of the limit parameter.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202309131221.Bm1pg96n-lkp@intel.com/
---
 arch/powerpc/platforms/pseries/rtas-work-area.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/platforms/pseries/rtas-work-area.c b/arch/powerpc/platforms/pseries/rtas-work-area.c
index b37d52f40360..7fe34bee84d8 100644
--- a/arch/powerpc/platforms/pseries/rtas-work-area.c
+++ b/arch/powerpc/platforms/pseries/rtas-work-area.c
@@ -184,6 +184,7 @@ machine_arch_initcall(pseries, rtas_work_area_allocator_init);
 
 /**
  * rtas_work_area_reserve_arena() - Reserve memory suitable for RTAS work areas.
+ * @limit: Upper limit for memblock allocation.
  */
 void __init rtas_work_area_reserve_arena(const phys_addr_t limit)
 {

-- 
2.41.0

