Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB732492D3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 04:19:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BWWgq70KzzDqYp
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 12:19:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BWWBW2D1jzDqsJ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Aug 2020 11:57:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=eWILLNuc; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 4BWWBV6cZLz9sTh; Wed, 19 Aug 2020 11:57:38 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BWWBV3GnYz9sPC; Wed, 19 Aug 2020 11:57:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1597802258;
 bh=cg3JR+bqlURCqAhQVg3WYomdlbqrlo9Tkf3uzP0k2LE=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=eWILLNucMDOyLY3RiNSD5sfIqrR6AbhrglC4Egdq2kUgAEX+Fw6F18IC7N5LdPVtO
 4qNuOSVPwKtDprRBzbedxYlFIX93aoJmLU+NW6s+5wx/V3zJL+g2aUtQiwc8PWduVf
 5yAaYva0T9TkhCtyCrl9u+9caUWy9aTSCdb0tdjeYy/Sftvsht3FkkkN3gBt9ZdfSt
 6CTzNQVujoQZqpSOaH8lsv2Q9vtXAx84R4qzTq5gT/kcN9HoeaIi6SN1RaTr1L1U3P
 DGQSqR/bXz4CuxsXdiMZUX3Synr+DVtqPcrNR9bq4kn4r4HXY+zWPbEYPLECy/s3Zu
 s1ZnIGEoeGRNQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH 8/9] selftests/powerpc: Don't touch VMX/VSX on older CPUs
Date: Wed, 19 Aug 2020 11:57:26 +1000
Message-Id: <20200819015727.1977134-8-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200819015727.1977134-1-mpe@ellerman.id.au>
References: <20200819015727.1977134-1-mpe@ellerman.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

If we're running on a CPU without VMX/VSX then don't touch them. This
is fragile, the compiler could spill a VMX/VSX register and break the
test anyway. But in practice it seems to work, ie. the test runs to
completion on a system without VSX with this change.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 tools/testing/selftests/powerpc/benchmarks/context_switch.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tools/testing/selftests/powerpc/benchmarks/context_switch.c b/tools/testing/selftests/powerpc/benchmarks/context_switch.c
index d50cc05df495..96554e2794d1 100644
--- a/tools/testing/selftests/powerpc/benchmarks/context_switch.c
+++ b/tools/testing/selftests/powerpc/benchmarks/context_switch.c
@@ -481,6 +481,12 @@ int main(int argc, char *argv[])
 	else
 		printf("futex");
 
+	if (!have_hwcap(PPC_FEATURE_HAS_ALTIVEC))
+		touch_altivec = 0;
+
+	if (!have_hwcap(PPC_FEATURE_HAS_VSX))
+		touch_vector = 0;
+
 	printf(" on cpus %d/%d touching FP:%s altivec:%s vector:%s vdso:%s\n",
 	       cpu1, cpu2, touch_fp ?  "yes" : "no", touch_altivec ? "yes" : "no",
 	       touch_vector ? "yes" : "no", touch_vdso ? "yes" : "no");
-- 
2.25.1

