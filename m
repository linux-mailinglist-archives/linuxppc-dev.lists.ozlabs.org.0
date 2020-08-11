Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A9C241C53
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Aug 2020 16:24:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BQw8P1PpLzDqSH
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Aug 2020 00:24:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BQvjb5ZQWzDqMm
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Aug 2020 00:05:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au
 header.a=rsa-sha256 header.s=201702 header.b=iUtJ4RJx; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BQvjW73BGz9sVM;
 Wed, 12 Aug 2020 00:05:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1597154704;
 bh=9EKeGXcQiDn7VXvqw3APGDD4eXjF9RC6OJsE+q+2MWg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iUtJ4RJxyMIeLsFxNlHwv37db+/Rt7K49575NUnmEGQ4LafzmcDyPJpd8Zh8pqv5x
 vD1ATKL1r7x4egBVFhDRmny+YVujKOlp+Jqmmg4EepozU2/V4qeSkDR8/wvpssIX/L
 5I0vp+PGE5cDLzj1sp+Js6ekmQnwINtCwukPTPT4iqE6NYRtzE9cYlfzrUx8tzCIay
 0k/xrdCqiK1yDIsHLs+SZU8FaUFX5ymsvo7SJEuLh6rMo1Te9uG6Mx3m5vksDlG5sG
 74vMQ33mL7K6mg7BAbqKQcRyC//xnsH2rcC902HAfbjvuuo0BvdjFJfJwIqN+7o6cP
 SbWGcx6yVytKQ==
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 4/7] powerpc: unrel_branch_check.sh: convert grep | sed | awk
 to just sed
Date: Wed, 12 Aug 2020 00:04:31 +1000
Message-Id: <20200811140435.20957-5-sfr@canb.auug.org.au>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200811140435.20957-1-sfr@canb.auug.org.au>
References: <20200811140435.20957-1-sfr@canb.auug.org.au>
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
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Also start using sed -E and make all the separate expressions into a
single one with comments.  Pull the stripping of condition registers
back into the sed command.

Cc: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/powerpc/tools/unrel_branch_check.sh | 30 ++++++++++++++++--------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/tools/unrel_branch_check.sh b/arch/powerpc/tools/unrel_branch_check.sh
index 7e936e2cf70d..dc82289b2252 100755
--- a/arch/powerpc/tools/unrel_branch_check.sh
+++ b/arch/powerpc/tools/unrel_branch_check.sh
@@ -27,21 +27,31 @@ awk '$2 == "<__end_interrupts>:" { print $1 }'
 
 BRANCHES=$(
 $objdump -R -D --no-show-raw-insn --start-address="$kstart" --stop-address="$end_intr" "$vmlinux" |
-grep -e "^c[0-9a-f]*:\s*b" |
-sed -e '/\<__start_initialization_multiplatform>/d' \
-	-e '/b.\?.\?ctr/d' \
-	-e '/b.\?.\?lr/d' \
-	-e 's/\bbt.\?\s*[[:digit:]][[:digit:]]*,/beq/' \
-	-e 's/\bbf.\?\s*[[:digit:]][[:digit:]]*,/bne/' \
-	-e 's/\s0x/ /' \
-	-e 's/://' |
-awk '{ print $1 ":" $2 ":0x" $3 ":" $4 " "}'
+sed -E -n '
+# match lines that start with a kernel address
+/^c[0-9a-f]*:\s*b/ {
+	# drop a target that we do not care about
+	/\<__start_initialization_multiplatform>/d
+	# drop branches via ctr or lr
+	/\<b.?.?(ct|l)r/d
+	# cope with some differences between Clang and GNU objdumps
+	s/\<bt.?\s*[[:digit:]]+,/beq/
+	s/\<bf.?\s*[[:digit:]]+,/bne/
+	# tidy up
+	s/\s0x/ /
+	s/://
+	# format for the loop below
+	s/^(\S+)\s+(\S+)\s+(\S+)\s*(\S*).*$/\1:\2:0x\3:\4/
+	# strip out condition registers
+	s/:0xcr[0-7],/:0x/
+	p
+}'
 )
 
 for tuple in $BRANCHES; do
 	from=$(echo "$tuple" | cut -d':' -f1)
 	branch=$(echo "$tuple" | cut -d':' -f2)
-	to=$(echo "$tuple" | cut -d':' -f3 | sed 's/cr[0-7],//')
+	to=$(echo "$tuple" | cut -d':' -f3)
 	sym=$(echo "$tuple" | cut -d':' -f4)
 
 	if (( to > end_intr )); then
-- 
2.28.0

