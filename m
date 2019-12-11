Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E4111B902
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Dec 2019 17:41:16 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Y2kJ6P7MzDq8X
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Dec 2019 03:41:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="JZzj+QuP"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Y16g4lcqzDqLR
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Dec 2019 02:28:43 +1100 (AEDT)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2B38224679;
 Wed, 11 Dec 2019 15:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576078121;
 bh=H042mJv8ZqhBukEqzRcdzPQ5+UvCTUOQpacnn5zgq8s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JZzj+QuPPiPblTeclmXcGdv0gJTC4Fz1Nb4n4jdI6KJlie7EImkwU5C69O8UoygNw
 29ZNW/JY8Zx/d/8hVZIseuNZcaDH+e2C4fz6fDVSpyPdtX5R+UOicKFwfxpcudblvw
 RieNyVi+19l4IHfSwNghGBdIU1R0jhDNfOJLO1V0=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 09/58] powerpc/pseries: Mark
 accumulate_stolen_time() as notrace
Date: Wed, 11 Dec 2019 10:27:42 -0500
Message-Id: <20191211152831.23507-9-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191211152831.23507-1-sashal@kernel.org>
References: <20191211152831.23507-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Michael Ellerman <mpe@ellerman.id.au>

[ Upstream commit eb8e20f89093b64f48975c74ccb114e6775cee22 ]

accumulate_stolen_time() is called prior to interrupt state being
reconciled, which can trip the warning in arch_local_irq_restore():

  WARNING: CPU: 5 PID: 1017 at arch/powerpc/kernel/irq.c:258 .arch_local_irq_restore+0x9c/0x130
  ...
  NIP .arch_local_irq_restore+0x9c/0x130
  LR  .rb_start_commit+0x38/0x80
  Call Trace:
    .ring_buffer_lock_reserve+0xe4/0x620
    .trace_function+0x44/0x210
    .function_trace_call+0x148/0x170
    .ftrace_ops_no_ops+0x180/0x1d0
    ftrace_call+0x4/0x8
    .accumulate_stolen_time+0x1c/0xb0
    decrementer_common+0x124/0x160

For now just mark it as notrace. We may change the ordering to call it
after interrupt state has been reconciled, but that is a larger
change.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/20191024055932.27940-1-mpe@ellerman.id.au
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/kernel/time.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
index 7c7c5a16284d2..808f71f9fe615 100644
--- a/arch/powerpc/kernel/time.c
+++ b/arch/powerpc/kernel/time.c
@@ -241,7 +241,7 @@ static u64 scan_dispatch_log(u64 stop_tb)
  * Accumulate stolen time by scanning the dispatch trace log.
  * Called on entry from user mode.
  */
-void accumulate_stolen_time(void)
+void notrace accumulate_stolen_time(void)
 {
 	u64 sst, ust;
 	u8 save_soft_enabled = local_paca->soft_enabled;
-- 
2.20.1

