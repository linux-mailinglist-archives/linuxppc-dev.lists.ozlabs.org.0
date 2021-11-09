Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CB88144B5C7
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Nov 2021 23:20:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hpj8c5g9Vz3bXR
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Nov 2021 09:20:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Yj+5TCU0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Yj+5TCU0; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hpj7T5Y0jz2yxx
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Nov 2021 09:19:01 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id AEBE661A03;
 Tue,  9 Nov 2021 22:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636496339;
 bh=w5Xb6WCzlZ8aPhmrZpZHwKQX/kb2t2tuhtwlxNHDG2k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Yj+5TCU0AOXdj7KQM35zg10zVG5UCYlYWE9f2O+PrDNEkKC0gVPIGIMHPl9M4Vr9A
 RZIWoPuK4mGjarCaDcPA9jQ0OrMbOH68CvJbhOJxFY+4Zj5hmCb1Ub4zYpgYLiIXr4
 uFjm9kOEf8Drp4OwfpNdo3DMFDd15nJ1z2eEqnMOtmLOjwjnKDKjXX6IpL+6Aw67jU
 r0k892S5UzqH1USRhpG+pBQXhYJc7eh/GrX1Mm/9DUcPBGU23/IvRp5O25pt2KOwqj
 wOpEbo6GLOmylBTl878jHIHnqWb0B58+8nNK0z//5Oqq/rKcp7SPHuo9gOmz/n1Imr
 xIuT8OYYxqV4Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 80/82] powerpc/dcr: Use cmplwi instead of
 3-argument cmpli
Date: Tue,  9 Nov 2021 17:16:38 -0500
Message-Id: <20211109221641.1233217-80-sashal@kernel.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211109221641.1233217-1-sashal@kernel.org>
References: <20211109221641.1233217-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
 paulus@samba.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Michael Ellerman <mpe@ellerman.id.au>

[ Upstream commit fef071be57dc43679a32d5b0e6ee176d6f12e9f2 ]

In dcr-low.S we use cmpli with three arguments, instead of four
arguments as defined in the ISA:

	cmpli	cr0,r3,1024

This appears to be a PPC440-ism, looking at the "PPC440x5 CPU Core
User’s Manual" it shows cmpli having no L field, but implied to be 0 due
to the core being 32-bit. It mentions that the ISA defines four
arguments and recommends using cmplwi.

It also corresponds to the old POWER instruction set, which had no L
field there, a reserved bit instead.

dcr-low.S is only built 32-bit, because it is only built when
DCR_NATIVE=y, which is only selected by 40x and 44x. Looking at the
generated code (with gcc/gas) we see cmplwi as expected.

Although gas is happy with the 3-argument version when building for
32-bit, the LLVM assembler is not and errors out with:

  arch/powerpc/sysdev/dcr-low.S:27:10: error: invalid operand for instruction
   cmpli 0,%r3,1024; ...
           ^

Switch to the cmplwi extended opcode, which avoids any confusion when
reading the ISA, fixes the issue with the LLVM assembler, and also means
the code could be built 64-bit in future (though that's very unlikely).

Reported-by: Nick Desaulniers <ndesaulniers@google.com>
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
BugLink: https://github.com/ClangBuiltLinux/linux/issues/1419
Link: https://lore.kernel.org/r/20211014024424.528848-1-mpe@ellerman.id.au
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/sysdev/dcr-low.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/sysdev/dcr-low.S b/arch/powerpc/sysdev/dcr-low.S
index efeeb1b885a17..329b9c4ae5429 100644
--- a/arch/powerpc/sysdev/dcr-low.S
+++ b/arch/powerpc/sysdev/dcr-low.S
@@ -11,7 +11,7 @@
 #include <asm/export.h>
 
 #define DCR_ACCESS_PROLOG(table) \
-	cmpli	cr0,r3,1024;	 \
+	cmplwi	cr0,r3,1024;	 \
 	rlwinm  r3,r3,4,18,27;   \
 	lis     r5,table@h;      \
 	ori     r5,r5,table@l;   \
-- 
2.33.0

