Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A89697E8E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Feb 2023 15:40:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PH12Z6fXqz3f6K
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 01:40:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=rivosinc-com.20210112.gappssmtp.com header.i=@rivosinc-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=BoSoAYbY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rivosinc.com (client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com; envelope-from=alexghiti@rivosinc.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20210112.gappssmtp.com header.i=@rivosinc-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=BoSoAYbY;
	dkim-atps=neutral
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PH11g2Sckz3cf8
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Feb 2023 01:39:35 +1100 (AEDT)
Received: by mail-wm1-x332.google.com with SMTP id s13-20020a05600c45cd00b003ddca7a2bcbso1704627wmo.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Feb 2023 06:39:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yD/6wakyPf7JrmKHeHtinmHp6mBb9XsJjFS0GkJ6tz4=;
        b=BoSoAYbYFg8HdU2SNacDnaS+5CeQ0e207z74mrcLON9XyOg4vOWlNvHSHENHSz6AHS
         TXXPV6YKRrjTygMWgAH5NAsMBs8jkRVcXI6LfigB0xE0u5MZLmp8EkO8SHcrxWNVbu62
         dEn0JC0XCdThk6U+d9TbDA3VVwA2VC8IF6aM3dZElzHEGco7QFsuWyZ8ThCN/o0HWANB
         GpxRp3dCWcclSGpQlFOFRJ+0J1C17mGXIcCg06XWlyBsAgbWwbBTPlVe7R4fVdvNvWKd
         MPEmsaEiQRIQsIAsvMV3MeR3AIj3b88dHNxbEMFeSa1zGoYf4RYZYNcrFcougFJQPhtd
         atYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yD/6wakyPf7JrmKHeHtinmHp6mBb9XsJjFS0GkJ6tz4=;
        b=0IPEROqJW0C/cB2/+euhqGlLfWOqKw7vDgrqhvThSFbiw7iyFh8YA/RN1HgpbHeu2e
         9lfoKJW4KOJr+2prvAf4Gq3nmRT+HgBZEMxCquLjMbfYVTK3fjr56C6jWD5ha/LXciZY
         5hy5H6kWBF8cDl+YXtV7ffKd/HbekZ8QgYPWzTNZApY+VyEE3SI0DjYovdhTFX74sioe
         qBkFqePbZJNCC28U3e2ZiwE+Oqyq4c07QKL/QXBOQgwoomkgmMlOM8MbqasEWA2JXaKA
         3srg81f8+1eMckB9AxodF+F0lZeojazDPsVcnjCEqA8Tx9OiU6IfrfoIQM5ZFLxzSgNA
         Gw1A==
X-Gm-Message-State: AO0yUKWM1gUL9UB5iZGdkzb/ZfObpAgMPiu1JZDwXEMiqsbS8tuN4RRQ
	rUcGyWTOfVCw7VIYEv0hFZvPxA==
X-Google-Smtp-Source: AK7set8Tp8vvWaWc0e+MxOiR5cvSLBCg2Fe806RP1RqrzlGlekyMApRlk8+hhjLVM/Hil8sEckbm+Q==
X-Received: by 2002:a05:600c:2e89:b0:3e0:6c4:6a38 with SMTP id p9-20020a05600c2e8900b003e006c46a38mr2284134wmn.33.1676471971627;
        Wed, 15 Feb 2023 06:39:31 -0800 (PST)
Received: from alex-rivos.home (lfbn-lyo-1-450-160.w2-7.abo.wanadoo.fr. [2.7.42.160])
        by smtp.gmail.com with ESMTPSA id h8-20020a1ccc08000000b003e1202744f2sm2423115wmb.31.2023.02.15.06.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Feb 2023 06:39:31 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v8 3/3] riscv: Check relocations at compile time
Date: Wed, 15 Feb 2023 15:36:26 +0100
Message-Id: <20230215143626.453491-4-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230215143626.453491-1-alexghiti@rivosinc.com>
References: <20230215143626.453491-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
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
Cc: Anup Patel <anup@brainfault.org>, Alexandre Ghiti <alex@ghiti.fr>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Alexandre Ghiti <alex@ghiti.fr>

Relocating kernel at runtime is done very early in the boot process, so
it is not convenient to check for relocations there and react in case a
relocation was not expected.

There exists a script in scripts/ that extracts the relocations from
vmlinux that is then used at postlink to check the relocations.

Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 arch/riscv/Makefile.postlink     | 36 ++++++++++++++++++++++++++++++++
 arch/riscv/tools/relocs_check.sh | 26 +++++++++++++++++++++++
 2 files changed, 62 insertions(+)
 create mode 100644 arch/riscv/Makefile.postlink
 create mode 100755 arch/riscv/tools/relocs_check.sh

diff --git a/arch/riscv/Makefile.postlink b/arch/riscv/Makefile.postlink
new file mode 100644
index 000000000000..bf2b2bca1845
--- /dev/null
+++ b/arch/riscv/Makefile.postlink
@@ -0,0 +1,36 @@
+# SPDX-License-Identifier: GPL-2.0
+# ===========================================================================
+# Post-link riscv pass
+# ===========================================================================
+#
+# Check that vmlinux relocations look sane
+
+PHONY := __archpost
+__archpost:
+
+-include include/config/auto.conf
+include scripts/Kbuild.include
+
+quiet_cmd_relocs_check = CHKREL  $@
+cmd_relocs_check = 							\
+	$(CONFIG_SHELL) $(srctree)/arch/riscv/tools/relocs_check.sh "$(OBJDUMP)" "$(NM)" "$@"
+
+# `@true` prevents complaint when there is nothing to be done
+
+vmlinux: FORCE
+	@true
+ifdef CONFIG_RELOCATABLE
+	$(call if_changed,relocs_check)
+endif
+
+%.ko: FORCE
+	@true
+
+clean:
+	@true
+
+PHONY += FORCE clean
+
+FORCE:
+
+.PHONY: $(PHONY)
diff --git a/arch/riscv/tools/relocs_check.sh b/arch/riscv/tools/relocs_check.sh
new file mode 100755
index 000000000000..baeb2e7b2290
--- /dev/null
+++ b/arch/riscv/tools/relocs_check.sh
@@ -0,0 +1,26 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0-or-later
+# Based on powerpc relocs_check.sh
+
+# This script checks the relocations of a vmlinux for "suspicious"
+# relocations.
+
+if [ $# -lt 3 ]; then
+        echo "$0 [path to objdump] [path to nm] [path to vmlinux]" 1>&2
+        exit 1
+fi
+
+bad_relocs=$(
+${srctree}/scripts/relocs_check.sh "$@" |
+	# These relocations are okay
+	#	R_RISCV_RELATIVE
+	grep -F -w -v 'R_RISCV_RELATIVE'
+)
+
+if [ -z "$bad_relocs" ]; then
+	exit 0
+fi
+
+num_bad=$(echo "$bad_relocs" | wc -l)
+echo "WARNING: $num_bad bad relocations"
+echo "$bad_relocs"
-- 
2.37.2

