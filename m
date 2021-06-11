Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 323103A3DAA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Jun 2021 10:00:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G1YDh5HXDz3c3m
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Jun 2021 18:00:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux-m68k.org
 (client-ip=98.124.60.144; helo=kvm5.telegraphics.com.au;
 envelope-from=fthain@linux-m68k.org; receiver=<UNKNOWN>)
Received: from kvm5.telegraphics.com.au (kvm5.telegraphics.com.au
 [98.124.60.144])
 by lists.ozlabs.org (Postfix) with ESMTP id 4G1YDK4wGYz3089
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Jun 2021 18:00:15 +1000 (AEST)
Received: by kvm5.telegraphics.com.au (Postfix, from userid 502)
 id 8DE6F29C3A; Fri, 11 Jun 2021 04:00:09 -0400 (EDT)
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
Message-Id: <a1456e8bbd33ef702e3ff6f14b1bf3919241c62b.1623398307.git.fthain@linux-m68k.org>
From: Finn Thain <fthain@linux-m68k.org>
Subject: [PATCH v2] powerpc/tau: Remove superfluous parameter in
 alloc_workqueue() call
Date: Fri, 11 Jun 2021 17:58:27 +1000
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This avoids an (optional) compiler warning:

arch/powerpc/kernel/tau_6xx.c: In function 'TAU_init':
arch/powerpc/kernel/tau_6xx.c:204:30: error: too many arguments for format [-Werror=format-extra-args]
  tau_workq = alloc_workqueue("tau", WQ_UNBOUND, 1, 0);

Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
Fixes: b1c6a0a10bfa ("powerpc/tau: Convert from timer to workqueue")
Signed-off-by: Finn Thain <fthain@linux-m68k.org>
---
Changed since v1:
 - Improved commit log message.
---
 arch/powerpc/kernel/tau_6xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/tau_6xx.c b/arch/powerpc/kernel/tau_6xx.c
index 6c31af7f4fa8..b9a047d92ec0 100644
--- a/arch/powerpc/kernel/tau_6xx.c
+++ b/arch/powerpc/kernel/tau_6xx.c
@@ -201,7 +201,7 @@ static int __init TAU_init(void)
 	tau_int_enable = IS_ENABLED(CONFIG_TAU_INT) &&
 			 !strcmp(cur_cpu_spec->platform, "ppc750");
 
-	tau_workq = alloc_workqueue("tau", WQ_UNBOUND, 1, 0);
+	tau_workq = alloc_workqueue("tau", WQ_UNBOUND, 1);
 	if (!tau_workq)
 		return -ENOMEM;
 
-- 
2.26.3

