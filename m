Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0041E242697
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Aug 2020 10:17:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BRMyC2HRZzDqXV
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Aug 2020 18:17:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BRMpg1vPgzDqY3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Aug 2020 18:11:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au
 header.a=rsa-sha256 header.s=201702 header.b=ntIwH4IC; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BRMpd70KLz9sTS;
 Wed, 12 Aug 2020 18:11:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1597219866;
 bh=t0RdvnmV/VADsggqs8a68+YNtHOSGzUsZiTI6YJ98JA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ntIwH4IC/Ij7gr93C2G8Rgn8NjwgufZd8SciHE0QkQrRzy9vBxXKA7qC1b7xF59Fg
 iysrcXMx2R5OD+GlO7PyymCdi3XBaxGUEkdI5y4L7i2EtWq+F2K1iFk8LZgjQ5143u
 7nTJ5/kP37a96Cpc7n2NmfcQk99GkCXno35LVnkxZ8kHsKlq+2oAssmRATVUMi57WN
 bgiC9Xx2vRm0fbhFfg1LXuquEQET4RxuhgnBB1503UcppLiAPFp1cemlZDIdS6h5yV
 PFgaJkZqf84JoKxxO/Jadnd/bNTIIBI13tDXdvbfw1KAcNL69ZXaQoEyo427kuOtIi
 1KCU+S+XWT+qA==
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 2/2] powerpc: unrel_branch_check.sh: enable the use of
 llvm-objdump v9, 10 or 11
Date: Wed, 12 Aug 2020 18:10:36 +1000
Message-Id: <20200812081036.7969-3-sfr@canb.auug.org.au>
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

Currently, using llvm-objtool, this script just silently succeeds without
actually do the intended checking.  So this updates it to work properly.

Firstly, llvm-objdump does not add target symbol names to the end
of branches in its asm output, so we have to drop the branch to
__start_initialization_multiplatform using its address.

Secondly, v9 and 10 specify branch targets as .+<offset>, so we convert
those to actual addresses.

Thirdly, v10 and 11 error out on a vmlinux if given the -R option
complaining that it is "not a dynamic object".  The -R does not make
any difference to the asm output, so remove it.

Lastly, v11 produces asm that is very similar to Gnu objtool (at least
as far as branches are concerned), so no further changes are necessary
to make it work.

Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Bill Wendling <morbo@google.com>
Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/powerpc/tools/unrel_branch_check.sh | 34 ++++++++++++++++++++----
 1 file changed, 29 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/tools/unrel_branch_check.sh b/arch/powerpc/tools/unrel_branch_check.sh
index 0369eb2e7e4b..8301efee1e6c 100755
--- a/arch/powerpc/tools/unrel_branch_check.sh
+++ b/arch/powerpc/tools/unrel_branch_check.sh
@@ -18,12 +18,16 @@ if [ "$end_intr" = "0x" ]; then
 	exit 0
 fi
 
-$objdump -R -D --no-show-raw-insn --start-address="$kstart" --stop-address="$end_intr" "$vmlinux" |
+# we know that there is a correct branch to
+# __start_initialization_multiplatform, so find its address
+# so we can exclude it.
+sim=0x$($nm -p "$vmlinux" |
+	sed -E -n '/\s+[[:alpha:]]\s+__start_initialization_multiplatform\s*$/{s///p;q}')
+
+$objdump -D --no-show-raw-insn --start-address="$kstart" --stop-address="$end_intr" "$vmlinux" |
 sed -E -n '
 # match lines that start with a kernel address
 /^c[0-9a-f]*:\s*b/ {
-	# drop a target that we do not care about
-	/\<__start_initialization_multiplatform>/d
 	# drop branches via ctr or lr
 	/\<b.?.?(ct|l)r/d
 	# cope with some differences between Clang and GNU objdumps
@@ -33,14 +37,34 @@ sed -E -n '
 	s/\s0x/ /
 	s/://
 	# format for the loop below
-	s/^(\S+)\s+(\S+)\s+(\S+)\s*(\S*).*$/\1:\2:0x\3:\4/
+	s/^(\S+)\s+(\S+)\s+(\S+)\s*(\S*).*$/\1:\2:\3:\4/
 	# strip out condition registers
-	s/:0xcr[0-7],/:0x/
+	s/:cr[0-7],/:/
 	p
 }' | {
 
 all_good=true
 while IFS=: read -r from branch to sym; do
+	case "$to" in
+	c*)	to="0x$to"
+		;;
+	.+*)
+		to=${to#.+}
+		if [ "$branch" = 'b' ]; then
+			if (( to >= 0x2000000 )); then
+				to=$(( to - 0x4000000 ))
+			fi
+		elif (( to >= 0x8000 )); then
+			to=$(( to - 0x10000 ))
+		fi
+		printf -v to '0x%x' $(( "0x$from" + to ))
+		;;
+	*)	printf 'Unkown branch format\n'
+		;;
+	esac
+	if [ "$to" = "$sim" ]; then
+		continue
+	fi
 	if (( to > end_intr )); then
 		if $all_good; then
 			printf '%s\n' 'WARNING: Unrelocated relative branches'
-- 
2.28.0

