Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDEA75550A4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jun 2022 18:02:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LSp6d5qwFz3gXC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jun 2022 02:02:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.188; helo=szxga02-in.huawei.com; envelope-from=chenzhongjin@huawei.com; receiver=<UNKNOWN>)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LSnwF5ZGQz3cCh
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jun 2022 01:53:01 +1000 (AEST)
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.54])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4LSnr363QWzSh6d;
	Wed, 22 Jun 2022 23:49:23 +0800 (CST)
Received: from dggpemm500013.china.huawei.com (7.185.36.172) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 22 Jun 2022 23:52:48 +0800
Received: from ubuntu1804.huawei.com (10.67.175.36) by
 dggpemm500013.china.huawei.com (7.185.36.172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 22 Jun 2022 23:52:47 +0800
From: Chen Zhongjin <chenzhongjin@huawei.com>
To: <linux-kernel@vger.kernel.org>, <linux-arch@vger.kernel.org>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kbuild@vger.kernel.org>, <live-patching@vger.kernel.org>
Subject: [PATCH v5 32/33] arm64: irq-gic: Replace unreachable() with -EINVAL
Date: Wed, 22 Jun 2022 23:49:19 +0800
Message-ID: <20220622154920.95075-33-chenzhongjin@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220622154920.95075-1-chenzhongjin@huawei.com>
References: <20220622154920.95075-1-chenzhongjin@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.175.36]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500013.china.huawei.com (7.185.36.172)
X-CFilter-Loop: Reflected
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
Cc: mark.rutland@arm.com, madvenka@linux.microsoft.com, michal.lkml@markovi.net, pasha.tatashin@soleen.com, peterz@infradead.org, catalin.marinas@arm.com, masahiroy@kernel.org, ndesaulniers@google.com, chenzhongjin@huawei.com, rmk+kernel@armlinux.org.uk, broonie@kernel.org, will@kernel.org, jpoimboe@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Using unreachable() at default of switch generates an extra branch at
end of the function, and compiler won't generate a ret to close this
branch because it knows it's unreachable.

If there's no instruction in this branch, compiler will generate a NOP,
And it will confuse objtool to warn this NOP as a fall through branch.

In fact these branches are actually unreachable, so we can replace
unreachable() with returning a -EINVAL value.

Signed-off-by: Chen Zhongjin <chenzhongjin@huawei.com>
---
 arch/arm64/kvm/hyp/vgic-v3-sr.c | 7 +++----
 drivers/irqchip/irq-gic-v3.c    | 2 +-
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kvm/hyp/vgic-v3-sr.c b/arch/arm64/kvm/hyp/vgic-v3-sr.c
index 4fb419f7b8b6..f3cee92c3038 100644
--- a/arch/arm64/kvm/hyp/vgic-v3-sr.c
+++ b/arch/arm64/kvm/hyp/vgic-v3-sr.c
@@ -6,7 +6,6 @@
 
 #include <hyp/adjust_pc.h>
 
-#include <linux/compiler.h>
 #include <linux/irqchip/arm-gic-v3.h>
 #include <linux/kvm_host.h>
 
@@ -55,7 +54,7 @@ static u64 __gic_v3_get_lr(unsigned int lr)
 		return read_gicreg(ICH_LR15_EL2);
 	}
 
-	unreachable();
+	return -EINVAL;
 }
 
 static void __gic_v3_set_lr(u64 val, int lr)
@@ -166,7 +165,7 @@ static u32 __vgic_v3_read_ap0rn(int n)
 		val = read_gicreg(ICH_AP0R3_EL2);
 		break;
 	default:
-		unreachable();
+		val = -EINVAL;
 	}
 
 	return val;
@@ -190,7 +189,7 @@ static u32 __vgic_v3_read_ap1rn(int n)
 		val = read_gicreg(ICH_AP1R3_EL2);
 		break;
 	default:
-		unreachable();
+		val = -EINVAL;
 	}
 
 	return val;
diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
index b252d5534547..2ef98e32d257 100644
--- a/drivers/irqchip/irq-gic-v3.c
+++ b/drivers/irqchip/irq-gic-v3.c
@@ -475,7 +475,7 @@ static u32 __gic_get_ppi_index(irq_hw_number_t hwirq)
 	case EPPI_RANGE:
 		return hwirq - EPPI_BASE_INTID + 16;
 	default:
-		unreachable();
+		return -EINVAL;
 	}
 }
 
-- 
2.17.1

