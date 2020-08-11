Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6C8241C34
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Aug 2020 16:18:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BQw0y3qbYzDqJc
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Aug 2020 00:18:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BQvjR3ZJMzDqMm
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Aug 2020 00:04:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au
 header.a=rsa-sha256 header.s=201702 header.b=cQHftowC; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BQvjQ23Hzz9sVB;
 Wed, 12 Aug 2020 00:04:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1597154698;
 bh=cuPV6ghQz9euWNmis6qEkUpmOpmkGsAFncHAJh6hUs0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cQHftowC3ZDyxl6GhZBsL0zVwNFuh6aZwzYtzIVN/JxEJF1puMO2AcMVvFSeMJe0c
 0yq8gYc+CmQqurv+PpY1vml3w65BzqXi8YMVly2CWBfn8R9damiPBE+HbjJ2bmkJTu
 NbkIBklM3F4KJMo0x/EAFFYnWdS5kCYJ6+ERHygGbcSEPdAkCILgGOyExM+N8HZjy6
 UHLFr1REK78zTTujjbmUBLhtGRCFwtCDU/nZosmMAixIADaF+rCdFT3ENu0S8VCRmz
 E+Mr3E7R95zaO6R3Q1fndCZkK/K8FJPX3xZwx2sQpVVpCoXfuss5X3CcJn/7HyVOO2
 ZCTlwUKdxdwXw==
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 2/7] powerpc: unrel_branch_check.sh: simplify and combine some
 executions
Date: Wed, 12 Aug 2020 00:04:29 +1000
Message-Id: <20200811140435.20957-3-sfr@canb.auug.org.au>
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

Also some minor style changes.

There should still be no change in behaviour.

Cc: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/powerpc/tools/unrel_branch_check.sh | 25 +++++++++++-------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/tools/unrel_branch_check.sh b/arch/powerpc/tools/unrel_branch_check.sh
index 4c1e04ba5081..d735e3875b5e 100755
--- a/arch/powerpc/tools/unrel_branch_check.sh
+++ b/arch/powerpc/tools/unrel_branch_check.sh
@@ -17,37 +17,34 @@ objdump="$1"
 vmlinux="$2"
 
 #__end_interrupts should be located within the first 64K
+kstart=0xc000000000000000
+printf -v kend '0x%x' $(( kstart + 0x10000 ))
 
 end_intr=0x$(
-$objdump -R "$vmlinux" -d --start-address=0xc000000000000000           \
-		 --stop-address=0xc000000000010000 |
-grep '\<__end_interrupts>:' |
-awk '{print $1}'
+$objdump -R -d --start-address="$kstart" --stop-address="$kend" "$vmlinux" |
+awk '$2 == "<__end_interrupts>:" { print $1 }'
 )
 
 BRANCHES=$(
-$objdump -R "$vmlinux" -D --start-address=0xc000000000000000           \
-		--stop-address="$end_intr" |
+$objdump -R -D --start-address="$kstart" --stop-address="$end_intr" "$vmlinux" |
 grep -e "^c[0-9a-f]*:[[:space:]]*\([0-9a-f][0-9a-f][[:space:]]\)\{4\}[[:space:]]*b" |
-grep -v '\<__start_initialization_multiplatform>' |
-grep -v -e 'b.\?.\?ctr' |
-grep -v -e 'b.\?.\?lr' |
-sed -e 's/\bbt.\?[[:space:]]*[[:digit:]][[:digit:]]*,/beq/' \
+sed -e '/\<__start_initialization_multiplatform>/d' \
+	-e '/b.\?.\?ctr/d' \
+	-e '/b.\?.\?lr/d' \
+	-e 's/\bbt.\?[[:space:]]*[[:digit:]][[:digit:]]*,/beq/' \
 	-e 's/\bbf.\?[[:space:]]*[[:digit:]][[:digit:]]*,/bne/' \
 	-e 's/[[:space:]]0x/ /' \
 	-e 's/://' |
 awk '{ print $1 ":" $6 ":0x" $7 ":" $8 " "}'
 )
 
-for tuple in $BRANCHES
-do
+for tuple in $BRANCHES; do
 	from=$(echo "$tuple" | cut -d':' -f1)
 	branch=$(echo "$tuple" | cut -d':' -f2)
 	to=$(echo "$tuple" | cut -d':' -f3 | sed 's/cr[0-7],//')
 	sym=$(echo "$tuple" | cut -d':' -f4)
 
-	if (( to > end_intr ))
-	then
+	if (( to > end_intr )); then
 		if [ -z "$bad_branches" ]; then
 			echo "WARNING: Unrelocated relative branches"
 			bad_branches="yes"
-- 
2.28.0

