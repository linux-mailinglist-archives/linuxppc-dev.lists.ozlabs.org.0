Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EC007241C59
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Aug 2020 16:28:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BQwCx2FfSzDqKf
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Aug 2020 00:27:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BQvjh2hXZzDqMm
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Aug 2020 00:05:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au
 header.a=rsa-sha256 header.s=201702 header.b=kSTtjXO3; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BQvjc1fHYz9sTd;
 Wed, 12 Aug 2020 00:05:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1597154708;
 bh=Uc1DFmj6GDVlR0S2M6HTMamhLfv5jYMemm15PEIauk8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kSTtjXO3FoiKxtQvLOkHcYdNtiIS6prr+GFclsMrf79a6P5W0OeeULiGKlaod5GA8
 7li3Po61vMaKyhNmI4RzJUju3982Fx8zQI/JtQLTo3tRsPY0wKvKZvGHuJEk8PyobC
 RJ4X/asVsvByoHtZNhh6XnfGKwazPHQxKah9VOHDCq7ZWfEERn3ha9RCvZDJTTPsiD
 XszFnAzRhuOb0H2tBy7NYWd4tGs+fsUPaN3UzM23VrHXYNhXZQwV5BqxDgQDrpN6cq
 vqn589SAuUDVuagY7XG6KU2Z/ZhGgj1b/HjDBqlsxT8Bgc3HEmFHngntoYKfphtu3s
 fl9oQXmo6m9Vg==
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 5/7] powerpc: unrel_branch_check.sh: simplify and tidy up the
 final loop
Date: Wed, 12 Aug 2020 00:04:32 +1000
Message-Id: <20200811140435.20957-6-sfr@canb.auug.org.au>
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

Cc: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/powerpc/tools/unrel_branch_check.sh | 26 +++++++++---------------
 1 file changed, 10 insertions(+), 16 deletions(-)

diff --git a/arch/powerpc/tools/unrel_branch_check.sh b/arch/powerpc/tools/unrel_branch_check.sh
index dc82289b2252..54ebd05615d4 100755
--- a/arch/powerpc/tools/unrel_branch_check.sh
+++ b/arch/powerpc/tools/unrel_branch_check.sh
@@ -25,7 +25,6 @@ $objdump -R -d --start-address="$kstart" --stop-address="$kend" "$vmlinux" |
 awk '$2 == "<__end_interrupts>:" { print $1 }'
 )
 
-BRANCHES=$(
 $objdump -R -D --no-show-raw-insn --start-address="$kstart" --stop-address="$end_intr" "$vmlinux" |
 sed -E -n '
 # match lines that start with a kernel address
@@ -45,24 +44,19 @@ sed -E -n '
 	# strip out condition registers
 	s/:0xcr[0-7],/:0x/
 	p
-}'
-)
-
-for tuple in $BRANCHES; do
-	from=$(echo "$tuple" | cut -d':' -f1)
-	branch=$(echo "$tuple" | cut -d':' -f2)
-	to=$(echo "$tuple" | cut -d':' -f3)
-	sym=$(echo "$tuple" | cut -d':' -f4)
+}' | {
 
+all_good=true
+while IFS=: read -r from branch to sym; do
 	if (( to > end_intr )); then
-		if [ -z "$bad_branches" ]; then
-			echo "WARNING: Unrelocated relative branches"
-			bad_branches="yes"
+		if $all_good; then
+			printf '%s\n' 'WARNING: Unrelocated relative branches'
+			all_good=false
 		fi
-		echo "$from $branch-> $to $sym"
+		printf '%s %s-> %s %s\n' "$from" "$branch" "$to" "$sym"
 	fi
 done
 
-if [ -z "$bad_branches" ]; then
-	exit 0
-fi
+$all_good
+
+}
-- 
2.28.0

