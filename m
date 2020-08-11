Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 53380241C7C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Aug 2020 16:35:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BQwNk2rsMzDqKH
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Aug 2020 00:35:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BQvjk4wmczDqMm
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Aug 2020 00:05:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au
 header.a=rsa-sha256 header.s=201702 header.b=EOzWAm42; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BQvjj5BQ7z9sVP;
 Wed, 12 Aug 2020 00:05:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1597154713;
 bh=iSEKg+87jjDteWhaJ+qL8pbW2TiMt/xPx1qjGqylh1A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EOzWAm42H4Zb8ogM3UfxNkjVXIkvl1oQaTcOt0kA2tYH60ufaO7yoPfy73rGokQCI
 yUPVDMITE0N49VGchPR8mti9LmO/wV9r7yYFTypboFc0vvMtzwT061cwnJHTUe5ikC
 p7XddWjjYY8ihkbdL7wOHwwn/1Nh7G+Rv1mU/diYA4qyFR2/B9XFbo6ZUsrLS8dwGq
 9e/X++K1IxiZA5oSRf4wZApsMUAkB/UaX2GdKzaO7R39uYovkehWulVhrisqgPKlwh
 TmyJH7hpSAH1skBYhqkzIUfsbQC9zlaI6ew7EFQR+I9LRGVnm1DihBS/q7pvGx1rcm
 hbRADrgh55wJw==
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 7/7] powerpc: unrel_branch_check.sh: exit silently for early
 errors
Date: Wed, 12 Aug 2020 00:04:34 +1000
Message-Id: <20200811140435.20957-8-sfr@canb.auug.org.au>
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

If we can't find the address of __end_interrupts, then we still exit
successfully as that is the current behaviour.

Cc: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/powerpc/tools/unrel_branch_check.sh | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/tools/unrel_branch_check.sh b/arch/powerpc/tools/unrel_branch_check.sh
index 4489f16a443c..70da90270c78 100755
--- a/arch/powerpc/tools/unrel_branch_check.sh
+++ b/arch/powerpc/tools/unrel_branch_check.sh
@@ -14,9 +14,12 @@ kstart=0xc000000000000000
 printf -v kend '0x%x' $(( kstart + 0x10000 ))
 
 end_intr=0x$(
-$objdump -R -d --start-address="$kstart" --stop-address="$kend" "$vmlinux" |
+$objdump -R -d --start-address="$kstart" --stop-address="$kend" "$vmlinux" 2>/dev/null |
 awk '$2 == "<__end_interrupts>:" { print $1 }'
 )
+if [ "$end_intr" = "0x" ]; then
+	exit 0
+fi
 
 $objdump -R -D --no-show-raw-insn --start-address="$kstart" --stop-address="$end_intr" "$vmlinux" |
 sed -E -n '
-- 
2.28.0

