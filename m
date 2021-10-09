Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 463DF427DDE
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 Oct 2021 00:17:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HRfZ51Zz3z3cVM
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 Oct 2021 09:17:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized)
 smtp.mailfrom=canonical.com (client-ip=217.70.178.240;
 helo=mslow1.mail.gandi.net; envelope-from=alexandre.ghiti@canonical.com;
 receiver=<UNKNOWN>)
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HRX2C5vFmz2yK2
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 Oct 2021 04:22:59 +1100 (AEDT)
Received: from relay11.mail.gandi.net (unknown [217.70.178.231])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 2D4B7C703F
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Oct 2021 17:15:52 +0000 (UTC)
Received: (Authenticated sender: alex@ghiti.fr)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 86378100004;
 Sat,  9 Oct 2021 17:15:23 +0000 (UTC)
From: Alexandre Ghiti <alexandre.ghiti@canonical.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH v7 2/3] powerpc: Move script to check relocations at compile
 time in scripts/
Date: Sat,  9 Oct 2021 19:12:58 +0200
Message-Id: <20211009171259.2515351-3-alexandre.ghiti@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211009171259.2515351-1-alexandre.ghiti@canonical.com>
References: <20211009171259.2515351-1-alexandre.ghiti@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 10 Oct 2021 09:16:02 +1100
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

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
index 014e00e74d2b..e367895941ae 100755
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
@@ -43,8 +30,7 @@ R_PPC_ADDR16_LO
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
2.30.2

