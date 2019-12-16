Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B74111FD9A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Dec 2019 05:29:00 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47bpF50h2YzDqSB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Dec 2019 15:28:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=107.174.27.60; helo=ozlabs.ru;
 envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Received: from ozlabs.ru (unknown [107.174.27.60])
 by lists.ozlabs.org (Postfix) with ESMTP id 47bp2v1571zDqS8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Dec 2019 15:20:07 +1100 (AEDT)
Received: from fstn1-p1.ozlabs.ibm.com (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id A65E2AE80805;
 Sun, 15 Dec 2019 23:18:27 -0500 (EST)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH kernel v2 4/4] powerpc/pseries/svm: Allow IOMMU to work in SVM
Date: Mon, 16 Dec 2019 15:19:24 +1100
Message-Id: <20191216041924.42318-5-aik@ozlabs.ru>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191216041924.42318-1-aik@ozlabs.ru>
References: <20191216041924.42318-1-aik@ozlabs.ru>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 Michael Anderson <andmike@linux.ibm.com>, Ram Pai <linuxram@us.ibm.com>,
 kvm-ppc@vger.kernel.org, Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

H_PUT_TCE_INDIRECT uses a shared page to send up to 512 TCE to
a hypervisor in a single hypercall. This does not work for secure VMs
as the page needs to be shared or the VM should use H_PUT_TCE instead.

This disables H_PUT_TCE_INDIRECT by clearing the FW_FEATURE_PUT_TCE_IND
feature bit so SVMs will map TCEs using H_PUT_TCE.

This is not a part of init_svm() as it is called too late after FW
patching is done and may result in a warning like this:

[    3.727716] Firmware features changed after feature patching!
[    3.727965] WARNING: CPU: 0 PID: 1 at (...)arch/powerpc/lib/feature-fixups.c:466 check_features+0xa4/0xc0

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
Changes:
v2
* new in the patchset
---
 arch/powerpc/platforms/pseries/firmware.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/firmware.c b/arch/powerpc/platforms/pseries/firmware.c
index d3acff23f2e3..3e49cc23a97a 100644
--- a/arch/powerpc/platforms/pseries/firmware.c
+++ b/arch/powerpc/platforms/pseries/firmware.c
@@ -22,6 +22,7 @@
 #include <asm/firmware.h>
 #include <asm/prom.h>
 #include <asm/udbg.h>
+#include <asm/svm.h>
 
 #include "pseries.h"
 
@@ -101,6 +102,12 @@ static void __init fw_hypertas_feature_init(const char *hypertas,
 		}
 	}
 
+	if (is_secure_guest() &&
+	    (powerpc_firmware_features & FW_FEATURE_PUT_TCE_IND)) {
+		powerpc_firmware_features &= ~FW_FEATURE_PUT_TCE_IND;
+		pr_debug("SVM: disabling PUT_TCE_IND firmware feature\n");
+	}
+
 	pr_debug(" <- fw_hypertas_feature_init()\n");
 }
 
-- 
2.17.1

