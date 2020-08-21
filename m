Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E30CC24DA98
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Aug 2020 18:22:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BY6Hz4jtdzDqJH
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Aug 2020 02:22:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=Ru/fsOhM; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BY6825qnhzDrDZ
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Aug 2020 02:16:02 +1000 (AEST)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E6EA1208DB;
 Fri, 21 Aug 2020 16:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598026560;
 bh=WZ5FxAxc/F6InEa4KrbQ2YxY+BEauxKmlWwg4Iwz29o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ru/fsOhMb1K6RC59i8jdcT6P7+Kqqhaq/lRjUhL98sVeTLlDiqclc9ujx4V3OTeAy
 UAM+Ynlet1H7m7CAQzkkBId8CxPbLLt5cFxRciX4SrRZPBlgBrDZXLNgMMRo6kWSBB
 ZtHXKJj/6cBEJuIOId4sWP4qUZWP1fOWDrfcHk08=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.7 12/61] powerpc/xive: Ignore kmemleak false
 positives
Date: Fri, 21 Aug 2020 12:14:56 -0400
Message-Id: <20200821161545.347622-12-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200821161545.347622-1-sashal@kernel.org>
References: <20200821161545.347622-1-sashal@kernel.org>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org,
 Sasha Levin <sashal@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Alexey Kardashevskiy <aik@ozlabs.ru>

[ Upstream commit f0993c839e95dd6c7f054a1015e693c87e33e4fb ]

xive_native_provision_pages() allocates memory and passes the pointer to
OPAL so kmemleak cannot find the pointer usage in the kernel memory and
produces a false positive report (below) (even if the kernel did scan
OPAL memory, it is unable to deal with __pa() addresses anyway).

This silences the warning.

unreferenced object 0xc000200350c40000 (size 65536):
  comm "qemu-system-ppc", pid 2725, jiffies 4294946414 (age 70776.530s)
  hex dump (first 32 bytes):
    02 00 00 00 50 00 00 00 00 00 00 00 00 00 00 00  ....P...........
    01 00 08 07 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace:
    [<0000000081ff046c>] xive_native_alloc_vp_block+0x120/0x250
    [<00000000d555d524>] kvmppc_xive_compute_vp_id+0x248/0x350 [kvm]
    [<00000000d69b9c9f>] kvmppc_xive_connect_vcpu+0xc0/0x520 [kvm]
    [<000000006acbc81c>] kvm_arch_vcpu_ioctl+0x308/0x580 [kvm]
    [<0000000089c69580>] kvm_vcpu_ioctl+0x19c/0xae0 [kvm]
    [<00000000902ae91e>] ksys_ioctl+0x184/0x1b0
    [<00000000f3e68bd7>] sys_ioctl+0x48/0xb0
    [<0000000001b2c127>] system_call_exception+0x124/0x1f0
    [<00000000d2b2ee40>] system_call_common+0xe8/0x214

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/20200612043303.84894-1-aik@ozlabs.ru
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/sysdev/xive/native.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/sysdev/xive/native.c b/arch/powerpc/sysdev/xive/native.c
index 5218fdc4b29a9..82860c7b58353 100644
--- a/arch/powerpc/sysdev/xive/native.c
+++ b/arch/powerpc/sysdev/xive/native.c
@@ -18,6 +18,7 @@
 #include <linux/delay.h>
 #include <linux/cpumask.h>
 #include <linux/mm.h>
+#include <linux/kmemleak.h>
 
 #include <asm/machdep.h>
 #include <asm/prom.h>
@@ -647,6 +648,7 @@ static bool xive_native_provision_pages(void)
 			pr_err("Failed to allocate provisioning page\n");
 			return false;
 		}
+		kmemleak_ignore(p);
 		opal_xive_donate_page(chip, __pa(p));
 	}
 	return true;
-- 
2.25.1

