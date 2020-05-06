Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A66681C669A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 May 2020 06:08:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49H33m5mXNzDqxV
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 May 2020 14:08:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::641;
 helo=mail-pl1-x641.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=VLW09sG2; dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49H2YZ5MRtzDqbk
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 May 2020 13:45:38 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id t7so26863plr.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 05 May 2020 20:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=zvS8qK7RxSqJxWrAxleXDsHOS+Ibn7pYgQVsw5qkhsU=;
 b=VLW09sG2zZFBrPMVYQcRjY/u69WASs3fq7TqFbE7efoum6h4i8gWA16lWrl0c32lM1
 JofQjarlMegYMsAxvMhaYaVH+23KFXSZmjIStkpDP0/4BSBP3kjw4FAHdW/KrQw+mvy4
 J6i1CnLcz1JWJdAjtpDzcskcn0jw8cV3gcP2hK5m1Q89LWLq/sHhSQpCw7219bWsZqWH
 6PW9/Pre5S/hH3pSXJDZPPc80PkvV3sT9L4wQv7YxjmZkR7M1DAuAUOTor1Z5rnfJRsj
 zV8ewDLVbtxWU5iEN96BVqje/RVcu4vXW/a4D4xJfIuUmrhmILeYt8Zz9sksDvp1mC6E
 +J5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=zvS8qK7RxSqJxWrAxleXDsHOS+Ibn7pYgQVsw5qkhsU=;
 b=f8LbogrK4gD2gcLeCSOB67iYMVxdpAjQpG0Ou94vKlYv7SSPbTg4ekYAx+gHpdsYUp
 yCivN9dM+uINCeqbEl37tSDr0fQ3sIF9qbtGEljillv0ci54eGhzPSoR3LT4SD6Kz4dy
 8XYnRntpKAtjSU4X7ZeYfMhdzRKGjA7wAPUF95SdaSaq8cFTtq9FqDiN1TigBMXoWQ20
 QX/wxa1z2QzPhcUIMvZLDJr5tKfXEBbpfVzJLUdex5BwGd4+kg2GiiO52Tq8DCMSnccM
 OGfTUUWvDr2B0R8LW/BFCywSrDQG8q2joTTsAxgpe2ryYEGVXqb7NEZ8qppbhE+qhMli
 3suA==
X-Gm-Message-State: AGi0PubjjZFS4W/Kdf+oeOttgUrwYYFtg8EIDqr+/AneanFgec3sBcww
 f3H9BtcJEUloD3ZPA/YttHnxCThGcWCE/w==
X-Google-Smtp-Source: APiQypI1Ke1ZZ7OioUmZVvVnFRA7xI7YndApdU0g4mYcbPwbz0Qj8y4Gmy6SBg5d9aqW+pFm8ffpDA==
X-Received: by 2002:a17:902:b7c9:: with SMTP id
 v9mr5988413plz.197.1588736736556; 
 Tue, 05 May 2020 20:45:36 -0700 (PDT)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id k4sm465676pgg.88.2020.05.05.20.45.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 May 2020 20:45:36 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v8 13/30] powerpc: Add a probe_user_read_inst() function
Date: Wed,  6 May 2020 13:40:33 +1000
Message-Id: <20200506034050.24806-14-jniethe5@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200506034050.24806-1-jniethe5@gmail.com>
References: <20200506034050.24806-1-jniethe5@gmail.com>
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

Reviewed-by: Alistair Popple <alistair@popple.id.au>
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

