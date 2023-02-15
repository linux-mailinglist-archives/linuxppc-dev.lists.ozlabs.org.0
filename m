Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C1E697E86
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Feb 2023 15:39:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PH11Q3D0tz3f43
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 01:39:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=rivosinc-com.20210112.gappssmtp.com header.i=@rivosinc-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=NWWiA7pE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rivosinc.com (client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com; envelope-from=alexghiti@rivosinc.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20210112.gappssmtp.com header.i=@rivosinc-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=NWWiA7pE;
	dkim-atps=neutral
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PH10W0Xcvz3cjH
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Feb 2023 01:38:34 +1100 (AEDT)
Received: by mail-wr1-x436.google.com with SMTP id co8so15622113wrb.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Feb 2023 06:38:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dDDQpcu4wlArU6dZYMfeUKSEQsg6b1kdryOeCUrFQlc=;
        b=NWWiA7pEQ+rkqfq6PxjAcfVNFkh/3naJV1qTqerZm0mmH+bBEsJWA+oh5IwlpOL+AR
         KXJ7H0JHrAp17b0C+1P0EDUTnuDad6z1StppmmFKeMYRzqBEF3AGsqgBNWd1EXa3LGM+
         tapyOWmDfrPK0EU9s24YUWPS6qTqye3oovAJGa1pJupXz6nwhjkr+q6Reclx3sk9qFJu
         XBx6069D3Wbt7BpXxmJ9T1iuGjsn1zcCKIfJYCvjGHUacLH4MuHMP6cQh14cOZVXoq7a
         /29ySlqZo/dPkpGQ3aqKvkoH086Qd9+B+FfSjJzwbgfmBhtWniu+UssrHq8ODeuVJoTf
         BBpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dDDQpcu4wlArU6dZYMfeUKSEQsg6b1kdryOeCUrFQlc=;
        b=pdBASddNPr+MakL1aFTRkaox4Fach7VxjC9b6C9uN5easQ+ExYzDugz3h+cpg8GEWN
         +hsR9jOqZmL4JZ4RekCdVVjOQziaOdZCY3aE9G52MYoBV3yhUunyvPfhhvZZB0030umU
         4hvjhaNxrtQxSNu0jWI11k44LEZ2bhSEdgQ/d/FR2wtgVFEr0SfcQiF4aInvqvN+flU2
         fchOcgD59D27E3WoeBpB3qRAqNBeXwQE7dHHAL6ETqbJ+d52I1jXJh24aNnbDG4XAp3a
         YZ+zv7tVfiiWD+ixicJYfQXrEnGWRPmVbu3Wpjgohq0wYqWRjfLONJDiC0Sgq4nx45QV
         CcQw==
X-Gm-Message-State: AO0yUKWF8IvWOoABuXgzbulslANxTx/htCYszjzHmJnTgJ5jI+SRLMeL
	KhMy5jvt9iypNVrc0vnoVTA8/Q==
X-Google-Smtp-Source: AK7set9Df7sPhWCSuF3fCAo3V27citHHiLZ7aQJdxJGeprd+nLleiF9LWkfZ3+y7qC+M4ZRkrTuxnA==
X-Received: by 2002:a5d:5552:0:b0:2c5:5dbf:1cc2 with SMTP id g18-20020a5d5552000000b002c55dbf1cc2mr1659354wrw.32.1676471910785;
        Wed, 15 Feb 2023 06:38:30 -0800 (PST)
Received: from alex-rivos.home (lfbn-lyo-1-450-160.w2-7.abo.wanadoo.fr. [2.7.42.160])
        by smtp.gmail.com with ESMTPSA id q4-20020a05600000c400b002c54737e908sm13906189wrx.91.2023.02.15.06.38.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Feb 2023 06:38:30 -0800 (PST)
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
Subject: [PATCH v8 2/3] powerpc: Move script to check relocations at compile time in scripts/
Date: Wed, 15 Feb 2023 15:36:25 +0100
Message-Id: <20230215143626.453491-3-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230215143626.453491-1-alexghiti@rivosinc.com>
References: <20230215143626.453491-1-alexghiti@rivosinc.com>
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

