Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C67911C0D18
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 May 2020 06:12:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49CzNN6zrxzDqRM
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 May 2020 14:12:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::644;
 helo=mail-pl1-x644.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=HGwyiPbg; dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49CyqC1Kn5zDrGG
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 May 2020 13:46:47 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id t7so3249617plr.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Apr 2020 20:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=0ZTuLbd8iH8wVuxFioG38chFQ7vx6gJ0NHQmYifZYGI=;
 b=HGwyiPbgStj0GMUnc1hlBSyIOX9w87bwFLOE31fB7hrq0s5rsD7ytr7eEjJ2eSd6S7
 RYxvfbffwKsprSYQRxufGhxOC8KHzSaGrZGWwR7HmoptA55q9SIiHGoiu3e4DgSrYshl
 /x+QVU3z9GoTPltNw2A5TORN4KWizM3TWfpukww2+H9u5R4KbcH3UuZDaHfKYqO2WJgw
 INbvN9NaAQBoajI14ZmiY9iFXISDqqZAQMu8oRCtrhTqq42qJ0ixkIaJn06KBFVHNxGc
 OJKTMagK0xXu8zeMRa+g/TYyCZzjaYdoQr5CDwU0E9KxVHg2ZoXSTvSSpv1hkyQiQoD5
 XK6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=0ZTuLbd8iH8wVuxFioG38chFQ7vx6gJ0NHQmYifZYGI=;
 b=XRziWbgLSvw/+9rqIsSXmWbfr7+ymIUFcsl4igQtLeK6pZJeBxdD5J3sAFcJAZZzoP
 yui9Z7H46PMWC+LuYqxa7Gz0vKuYPdrBbk3+KRtIzrCWW9veRgVJsWR0ruCPNqs7Z97X
 3Fb3yBnTWSf8SZIwN7DmmGI6TgGlkQBujVRhZynh9j+yN5V6fJEA6jKrchHn2EwIZkOy
 UAtI/X9CtmAg3nn5MGUrFAG5nz9QbTGKPM7JZlH6yj0HMlNqIj625vorw9qeSsnuQl0S
 NP/70CerRpzXRJwc6nJtsR77oNSIIHRwTOlX8q563C9V6H3MyAqdhfNFXyUMHTntH9gU
 HUeA==
X-Gm-Message-State: AGi0PuaviLegbjmQjPkYA0Zt6yUjL+uKCVMtlR+DlFzSL2/iXwdGT4no
 Eu0y5/vtrnDA5a4UOlgTvThgSyz2AjRJNA==
X-Google-Smtp-Source: APiQypJdPgHKQA0lsPc7f5HbgtI4+hys/KwRtmVeSENw9UlOoIuoYO3ppLCCuUWkginQg71nvkLJyg==
X-Received: by 2002:a17:90a:fb4e:: with SMTP id
 iq14mr2359190pjb.146.1588304803801; 
 Thu, 30 Apr 2020 20:46:43 -0700 (PDT)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id w28sm940082pgc.26.2020.04.30.20.46.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2020 20:46:42 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v7 13/28] powerpc: Add a probe_user_read_inst() function
Date: Fri,  1 May 2020 13:42:05 +1000
Message-Id: <20200501034220.8982-14-jniethe5@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200501034220.8982-1-jniethe5@gmail.com>
References: <20200501034220.8982-1-jniethe5@gmail.com>
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
Cc: alistair@popple.id.au, npiggin@gmail.com, bala24@linux.ibm.com,
 naveen.n.rao@linux.vnet.ibm.com, Jordan Niethe <jniethe5@gmail.com>,
 dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Introduce a probe_user_read_inst() function to use in cases where
probe_user_read() is used for getting an instruction. This will be more
useful for prefixed instructions.

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
v6: - New to series
---
 arch/powerpc/include/asm/inst.h |  3 +++
 arch/powerpc/lib/Makefile       |  2 +-
 arch/powerpc/lib/inst.c         | 18 ++++++++++++++++++
 arch/powerpc/mm/fault.c         |  2 +-
 4 files changed, 23 insertions(+), 2 deletions(-)
 create mode 100644 arch/powerpc/lib/inst.c

diff --git a/arch/powerpc/include/asm/inst.h b/arch/powerpc/include/asm/inst.h
index 552e953bf04f..3e9a58420151 100644
--- a/arch/powerpc/include/asm/inst.h
+++ b/arch/powerpc/include/asm/inst.h
@@ -37,4 +37,7 @@ static inline bool ppc_inst_equal(struct ppc_inst x, struct ppc_inst y)
 	return ppc_inst_val(x) == ppc_inst_val(y);
 }
 
+int probe_user_read_inst(struct ppc_inst *inst,
+			 struct ppc_inst *nip);
+
 #endif /* _ASM_INST_H */
diff --git a/arch/powerpc/lib/Makefile b/arch/powerpc/lib/Makefile
index b8de3be10eb4..546591848219 100644
--- a/arch/powerpc/lib/Makefile
+++ b/arch/powerpc/lib/Makefile
@@ -16,7 +16,7 @@ CFLAGS_code-patching.o += -DDISABLE_BRANCH_PROFILING
 CFLAGS_feature-fixups.o += -DDISABLE_BRANCH_PROFILING
 endif
 
-obj-y += alloc.o code-patching.o feature-fixups.o pmem.o
+obj-y += alloc.o code-patching.o feature-fixups.o pmem.o inst.o
 
 ifndef CONFIG_KASAN
 obj-y	+=	string.o memcmp_$(BITS).o
diff --git a/arch/powerpc/lib/inst.c b/arch/powerpc/lib/inst.c
new file mode 100644
index 000000000000..eaf786afad2b
--- /dev/null
+++ b/arch/powerpc/lib/inst.c
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ *  Copyright 2020, IBM Corporation.
+ */
+
+#include <linux/uaccess.h>
+#include <asm/inst.h>
+
+int probe_user_read_inst(struct ppc_inst *inst,
+			 struct ppc_inst *nip)
+{
+	unsigned int val;
+	int err;
+
+	err = probe_user_read(&val, nip, sizeof(val));
+	*inst = ppc_inst(val);
+	return err;
+}
diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
index 4a50f125ec18..f3a943eae305 100644
--- a/arch/powerpc/mm/fault.c
+++ b/arch/powerpc/mm/fault.c
@@ -281,7 +281,7 @@ static bool bad_stack_expansion(struct pt_regs *regs, unsigned long address,
 		    access_ok(nip, sizeof(*nip))) {
 			struct ppc_inst inst;
 
-			if (!probe_user_read(&inst, nip, sizeof(inst)))
+			if (!probe_user_read_inst(&inst, (struct ppc_inst __user *)nip))
 				return !store_updates_sp(inst);
 			*must_retry = true;
 		}
-- 
2.17.1

