Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B85A242694
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Aug 2020 10:15:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BRMvZ52GSzDqZH
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Aug 2020 18:15:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BRMpb6qFzzDqY1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Aug 2020 18:11:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au
 header.a=rsa-sha256 header.s=201702 header.b=XYLc3A8/; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BRMpb2FySz9sRN;
 Wed, 12 Aug 2020 18:11:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1597219863;
 bh=Qel6ITxOawkiv7Wh7P7TYB6H965dFcwKK5qu7Z+2nOY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XYLc3A8/ofxBtGWdVMPughrHVmcGH4H9Y9VYN2o4lAJj6b0Gc3lhNmqQrGWf3WH5g
 ztSwksED28nx8+1VomsgtVukTfurNluyP2hgNYCK5Jb9efhilmW2aZOeBoH89UEgxE
 j40lQcqr9u3dOev8pw5trG0FJEhrPa+B/FpiBaAlqVqO5qdVxvlLt2ACFqBRlxO+3Z
 HpI5A5IbMbVp4H5FFb8HuBEU4inD3usl2xNIGfwCJK19jFvg9uR9Di9PViNv3Cqo8A
 ab8vJsrhL2P5EJsM6CnBceXLXXNE+WN2hSdE0CmubEvUdFyuyzoF7vOvr/1adUa+tz
 uxlrpwbm7kBcw==
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 1/2] powerpc: unrel_branch_check.sh: use nm to find symbol
 value
Date: Wed, 12 Aug 2020 18:10:35 +1000
Message-Id: <20200812081036.7969-2-sfr@canb.auug.org.au>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200812081036.7969-1-sfr@canb.auug.org.au>
References: <20200812081036.7969-1-sfr@canb.auug.org.au>
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
Cc: Linux PowerPC List <linuxppc-dev@lists.ozlabs.org>,
 Bill Wendling <morbo@google.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is considerably faster then parsing the objdump asm output.  It will
also make the enabling of llvm-objdump a little easier.

Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Bill Wendling <morbo@google.com>
Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/powerpc/Makefile.postlink           |  2 +-
 arch/powerpc/tools/unrel_branch_check.sh | 13 +++++--------
 2 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/Makefile.postlink b/arch/powerpc/Makefile.postlink
index 2268396ff4bb..a6c77f4d32b2 100644
--- a/arch/powerpc/Makefile.postlink
+++ b/arch/powerpc/Makefile.postlink
@@ -18,7 +18,7 @@ quiet_cmd_relocs_check = CHKREL  $@
 ifdef CONFIG_PPC_BOOK3S_64
       cmd_relocs_check =						\
 	$(CONFIG_SHELL) $(srctree)/arch/powerpc/tools/relocs_check.sh "$(OBJDUMP)" "$(NM)" "$@" ; \
-	$(BASH) $(srctree)/arch/powerpc/tools/unrel_branch_check.sh "$(OBJDUMP)" "$@"
+	$(BASH) $(srctree)/arch/powerpc/tools/unrel_branch_check.sh "$(OBJDUMP)" "$(NM)" "$@"
 else
       cmd_relocs_check =						\
 	$(CONFIG_SHELL) $(srctree)/arch/powerpc/tools/relocs_check.sh "$(OBJDUMP)" "$(NM)" "$@"
diff --git a/arch/powerpc/tools/unrel_branch_check.sh b/arch/powerpc/tools/unrel_branch_check.sh
index 70da90270c78..0369eb2e7e4b 100755
--- a/arch/powerpc/tools/unrel_branch_check.sh
+++ b/arch/powerpc/tools/unrel_branch_check.sh
@@ -5,18 +5,15 @@
 # This script checks the unrelocated code of a vmlinux for "suspicious"
 # branches to relocated code (head_64.S code).
 
-# Have Kbuild supply the path to objdump so we handle cross compilation.
+# Have Kbuild supply the path to objdump and nm so we handle cross compilation.
 objdump="$1"
-vmlinux="$2"
+nm="$2"
+vmlinux="$3"
 
-#__end_interrupts should be located within the first 64K
 kstart=0xc000000000000000
-printf -v kend '0x%x' $(( kstart + 0x10000 ))
 
-end_intr=0x$(
-$objdump -R -d --start-address="$kstart" --stop-address="$kend" "$vmlinux" 2>/dev/null |
-awk '$2 == "<__end_interrupts>:" { print $1 }'
-)
+end_intr=0x$($nm -p "$vmlinux" |
+	sed -E -n '/\s+[[:alpha:]]\s+__end_interrupts\s*$/{s///p;q}')
 if [ "$end_intr" = "0x" ]; then
 	exit 0
 fi
-- 
2.28.0

