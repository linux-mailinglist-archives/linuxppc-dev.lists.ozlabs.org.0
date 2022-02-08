Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B93484ADC81
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Feb 2022 16:23:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JtRcQ3qzGz3cY1
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Feb 2022 02:23:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=molgen.mpg.de (client-ip=141.14.17.11; helo=mx1.molgen.mpg.de;
 envelope-from=pmenzel@molgen.mpg.de; receiver=<UNKNOWN>)
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JtRbv2V5Sz3cCM
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Feb 2022 02:23:22 +1100 (AEDT)
Received: from localhost.localdomain (ip5f5aebc2.dynamic.kabel-deutschland.de
 [95.90.235.194])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id 3486761E6478B;
 Tue,  8 Feb 2022 16:23:20 +0100 (CET)
From: Paul Menzel <pmenzel@molgen.mpg.de>
To: 
Subject: [PATCH v2 2/2] lib/raid6: Include <asm/ppc-opcode.h> for `VPERMXOR`
Date: Tue,  8 Feb 2022 16:21:50 +0100
Message-Id: <20220208152148.48534-2-pmenzel@molgen.mpg.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220208152148.48534-1-pmenzel@molgen.mpg.de>
References: <20220208152148.48534-1-pmenzel@molgen.mpg.de>
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
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, linux-kernel@vger.kernel.org,
 Matt Brown <matthew.brown.dev@gmail.com>, linux-raid@vger.kernel.org,
 Song Liu <song@kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Ubuntu 21.10 (ppc64le) building `raid6test` with gcc (Ubuntu
11.2.0-7ubuntu2) 11.2.0 fails with the error below.

    gcc -I.. -I ../../../include -g -O2                      -I../../../arch/powerpc/include -DCONFIG_ALTIVEC -c -o vpermxor1.o vpermxor1.c
    vpermxor1.c: In function ‘raid6_vpermxor1_gen_syndrome_real’:
    vpermxor1.c:64:29: error: expected string literal before ‘VPERMXOR’
       64 |                         asm(VPERMXOR(%0,%1,%2,%3):"=v"(wq0):"v"(gf_high), "v"(gf_low), "v"(wq0));
          |                             ^~~~~~~~
    make: *** [Makefile:58: vpermxor1.o] Error 1

So, include the header `asm/ppc-opcode.h` defining this macro also when
not building the Linux kernel but only this too.

Cc: Matt Brown <matthew.brown.dev@gmail.com>
Signed-off-by: Paul Menzel <pmenzel@molgen.mpg.de>
---
v2: Resend

 lib/raid6/vpermxor.uc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/raid6/vpermxor.uc b/lib/raid6/vpermxor.uc
index 10475dc423c1..1bfb127fbfe8 100644
--- a/lib/raid6/vpermxor.uc
+++ b/lib/raid6/vpermxor.uc
@@ -24,9 +24,9 @@
 #ifdef CONFIG_ALTIVEC
 
 #include <altivec.h>
+#include <asm/ppc-opcode.h>
 #ifdef __KERNEL__
 #include <asm/cputable.h>
-#include <asm/ppc-opcode.h>
 #include <asm/switch_to.h>
 #endif
 
-- 
2.34.1

