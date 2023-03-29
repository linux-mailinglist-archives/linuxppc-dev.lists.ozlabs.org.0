Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7FE6CD157
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Mar 2023 06:58:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PmZ7h73Ykz3fYx
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Mar 2023 15:58:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=rivosinc-com.20210112.gappssmtp.com header.i=@rivosinc-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=VKRX5Tw8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rivosinc.com (client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com; envelope-from=alexghiti@rivosinc.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20210112.gappssmtp.com header.i=@rivosinc-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=VKRX5Tw8;
	dkim-atps=neutral
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PmZ6t2W3Dz30Kr
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Mar 2023 15:57:42 +1100 (AEDT)
Received: by mail-wm1-x331.google.com with SMTP id n10-20020a05600c4f8a00b003ee93d2c914so10309743wmq.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Mar 2023 21:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1680065858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dDDQpcu4wlArU6dZYMfeUKSEQsg6b1kdryOeCUrFQlc=;
        b=VKRX5Tw8ADg3H3As96bXMjtA9WlMjtkGfL47ArT3E95iTfus7FSaAJlBDnfp920k7x
         PdemGUW/YeLJrVkn6J1yQZSUU28mxt+AhtJugWUcs2fm2mUKZ0SkjAwTFfxmYAHWaBh9
         34oXo9l0Qw8UjbcFYLjr6lPWCBQFUyc7ZMbeeKPlzhXYm2TxI9Zb/khVejjqkrAi2csd
         V36Yv1AqWNEsC+gGTi11hi+mhiFJz3StbOahvPtxZEULbxL//+Dp1E6LZNcu2MmWc2DD
         5/N1MLJY4bAjXif0FAnP0Jx1XJ+xrmLt5ZpihM+Ked2Iheb0vjcAMP+KOvbGX43nq5Gq
         mrXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680065858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dDDQpcu4wlArU6dZYMfeUKSEQsg6b1kdryOeCUrFQlc=;
        b=HCqPUqscWr9lySx36V88AHPEGHwug019giZwOmmyICRdxE2eX9GPY83K76jq4BBb5s
         VVMUsha2QvWuQ2ghdIGOtgG6NNTDraWzzK+hZktBYxqsV8F1ifhszMoNfnNqj4z1LQCM
         6T+69CJrUfoOQnKUZ4vVkg0OeKoOBR9zBQ1AESDQVkCq8j/EJtaD3ZRMr0NlykLJ1U/8
         2RYCTUyito6WqkSh2HqDDUiE7zxc5HY5ycK9yBi29ggzpOdm32lPUBcC7L9fgoX0CDuB
         sscz6rxCQ1SnmyhlHRGeFYgKBeitw9fzu7ZPiiHdGLU8LrG8IpLhEcMLQwfCQHOESXKo
         DkfA==
X-Gm-Message-State: AAQBX9cxVmn7G7AElAHvVvNY/rQ4JZ+GBBoZ2x4nxtLUrdV8370pqChr
	ZHPDzNEMSj1uNwKz1iHqNtSlgw==
X-Google-Smtp-Source: AKy350Zwf3+/m0WcA/QJKFN+KuVJqUrDEjpA3YZZy+HJLAgtX0Af6zJPQfGj5nLRuIS4Y+NAhHLENw==
X-Received: by 2002:a05:600c:3789:b0:3ef:62cd:1ee with SMTP id o9-20020a05600c378900b003ef62cd01eemr11455074wmr.16.1680065858027;
        Tue, 28 Mar 2023 21:57:38 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id x19-20020a1c7c13000000b003ed1f111fdesm779942wmc.20.2023.03.28.21.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 21:57:37 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Nick Desaulniers <ndesaulniers@google.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kbuild@vger.kernel.org
Subject: [PATCH v9 4/6] powerpc: Move script to check relocations at compile time in scripts/
Date: Wed, 29 Mar 2023 06:53:27 +0200
Message-Id: <20230329045329.64565-5-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230329045329.64565-1-alexghiti@rivosinc.com>
References: <20230329045329.64565-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Powerpc architecture has a script that allows to check at compile time
for such unexpected relocations: extract the common logic to scripts/
so that other architectures can take advantage of it.

Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
Reviewed-by: Anup Patel <anup@brainfault.org>
Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)
---
 arch/powerpc/tools/relocs_check.sh | 18 ++----------------
 scripts/relocs_check.sh            | 20 ++++++++++++++++++++
 2 files changed, 22 insertions(+), 16 deletions(-)
 create mode 100755 scripts/relocs_check.sh

diff --git a/arch/powerpc/tools/relocs_check.sh b/arch/powerpc/tools/relocs_check.sh
index 63792af00417..6b350e75014c 100755
--- a/arch/powerpc/tools/relocs_check.sh
+++ b/arch/powerpc/tools/relocs_check.sh
@@ -15,21 +15,8 @@ if [ $# -lt 3 ]; then
 	exit 1
 fi
 
-# Have Kbuild supply the path to objdump and nm so we handle cross compilation.
-objdump="$1"
-nm="$2"
-vmlinux="$3"
-
-# Remove from the bad relocations those that match an undefined weak symbol
-# which will result in an absolute relocation to 0.
-# Weak unresolved symbols are of that form in nm output:
-# "                  w _binary__btf_vmlinux_bin_end"
-undef_weak_symbols=$($nm "$vmlinux" | awk '$1 ~ /w/ { print $2 }')
-
 bad_relocs=$(
-$objdump -R "$vmlinux" |
-	# Only look at relocation lines.
-	grep -E '\<R_' |
+${srctree}/scripts/relocs_check.sh "$@" |
 	# These relocations are okay
 	# On PPC64:
 	#	R_PPC64_RELATIVE, R_PPC64_NONE
@@ -44,8 +31,7 @@ R_PPC_ADDR16_LO
 R_PPC_ADDR16_HI
 R_PPC_ADDR16_HA
 R_PPC_RELATIVE
-R_PPC_NONE' |
-	([ "$undef_weak_symbols" ] && grep -F -w -v "$undef_weak_symbols" || cat)
+R_PPC_NONE'
 )
 
 if [ -z "$bad_relocs" ]; then
diff --git a/scripts/relocs_check.sh b/scripts/relocs_check.sh
new file mode 100755
index 000000000000..137c660499f3
--- /dev/null
+++ b/scripts/relocs_check.sh
@@ -0,0 +1,20 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+# Get a list of all the relocations, remove from it the relocations
+# that are known to be legitimate and return this list to arch specific
+# script that will look for suspicious relocations.
+
+objdump="$1"
+nm="$2"
+vmlinux="$3"
+
+# Remove from the possible bad relocations those that match an undefined
+# weak symbol which will result in an absolute relocation to 0.
+# Weak unresolved symbols are of that form in nm output:
+# "                  w _binary__btf_vmlinux_bin_end"
+undef_weak_symbols=$($nm "$vmlinux" | awk '$1 ~ /w/ { print $2 }')
+
+$objdump -R "$vmlinux" |
+	grep -E '\<R_' |
+	([ "$undef_weak_symbols" ] && grep -F -w -v "$undef_weak_symbols" || cat)
-- 
2.37.2

