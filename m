Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B365D76F0BA
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 19:34:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=KC193m6Y;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RGwvq4Wsmz3c3j
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Aug 2023 03:34:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=KC193m6Y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--ndesaulniers.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=37otlzawkdbm6wxbtd461xabz77z4x.v75416dg88v-wxe41bcb.7i4tub.7az@flex--ndesaulniers.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RGwtQ5m01z3cGk
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Aug 2023 03:33:34 +1000 (AEST)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-569e7aec37bso13142477b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 03 Aug 2023 10:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691084012; x=1691688812;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0pu/AbS0HKjXzXWiPYnMLO2Amc72EsgDe6tRMstBdak=;
        b=KC193m6YkfKMgU1V5pk0nLnwEMaKH+pCPxR6oyeWGiIkaM4A2w8Pp69NstZno0wmB1
         ZDjO/BuWqE7adFEoyq3k08am+VD+HDLkdlXGSfaOrrWJLfoTTrC8zC2MD/8zr3IwpcGS
         o72PCx2btOf54qsSVe5aRfxxbauOWdb1xXriKdpgIWMYv8OxBaHbQe3OkHX+1ExgQT45
         4fi2EEVVuwEfD4HoT72VhlIbFGq1san8AhAwlOpsM/inO6HtwB2deOg08vibUNXNZbAS
         PKBRwsPLy2Rp5beitfEyzkusmkTZvL9/MuWg+1nxQ2xObOdCIZbE25I+cpJg67GqrUbV
         EF+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691084012; x=1691688812;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0pu/AbS0HKjXzXWiPYnMLO2Amc72EsgDe6tRMstBdak=;
        b=hCk/fsPU2eWZzrdfTWTZlnvfGOq+IaoKAeulKAH1l7mpVtQUELedjGKWFUKMuml164
         XFBtxqD2eLlGb/HwD44LZrEMj/0boRKEhV4MGsjM3WagoS/h6qqsM4ass7Ki78gAWBld
         DE96KWQFO2gxzsZpsW2w87/zYZfKD/8t0owhz+0DMTmBvDgrzTFYkrKBJiPVKlCWcAum
         QpjTQVIb5BR0L0PQkIatvAwWD9M3jN2tyIwKDMBCa8YJjVPdh5awIdvD1nTlpPo8Lig8
         tUZRqZcgXnjU3LIooD/3//GpJCVtYDfMKkYTJGWR+B7lX8jAA4kYHX7Phjyit1NJ3BWz
         Pueg==
X-Gm-Message-State: ABy/qLY4Sipgwoyltsw26BSDl94XZt+rAVoi1hKFTaQ3blbsE5PFaSNW
	vvRsijol2atT3ZXyGRDA+Jd3W9hiot4O2pXOntc=
X-Google-Smtp-Source: APBJJlEJdivYv8+b0csxVKGpKeftEtW6vp2C3Qo3RNq++FnZzd8sjOXFBRON9kXJ/6W7O/EGTSqXhU2ZwUIF7yQaems=
X-Received: from ndesaulniers-desktop.svl.corp.google.com ([2620:15c:2d1:203:cd2a:c126:8d90:d5ab])
 (user=ndesaulniers job=sendgmr) by 2002:a81:b646:0:b0:569:e04a:238f with SMTP
 id h6-20020a81b646000000b00569e04a238fmr187846ywk.4.1691084012010; Thu, 03
 Aug 2023 10:33:32 -0700 (PDT)
Date: Thu, 03 Aug 2023 10:33:27 -0700
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAObky2QC/3WNQQ6CMBBFr2JmbQ0FVHTlPQwx7XQKkxTatIRgC
 He3sHf5/s/LWyFRZErwPK0QaebEfsxQnk+AvRo7EmwyQ1mUVdEUlQgBP5PT7BYX2Ai0Rtvamtr
 eLWRJq0RCRzViv2uDShPF/QiRLC9H6d1m7jlNPn6P8Cz39W9jlkKKplZS4xXt41a9Ou87Rxf0A 7Tbtv0Aeg6LYsYAAAA=
X-Developer-Key: i=ndesaulniers@google.com; a=ed25519; pk=UIrHvErwpgNbhCkRZAYSX0CFd/XFEwqX3D0xqtqjNug=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691084010; l=3497;
 i=ndesaulniers@google.com; s=20220923; h=from:subject:message-id;
 bh=67hlOu38BB7CQZwIwTCku7kE6/CaycFqUpDIAeyUINw=; b=bEhP7KO3a79AFAV5eK8xUw0gGcjsqOcYWQS5seKyBUjoRQ1L5F0wGAVdqGIdML0+QnIFkiFCZ
 aVyNKTTHEi8Bvs5TOuBZ3doktaLzVfwNxT210gHDiu1vK3zkunVW0w1
X-Mailer: b4 0.12.3
Message-ID: <20230803-ppc_tlbilxlpid-v2-1-211ffa1df194@google.com>
Subject: [PATCH v2] powerpc/inst: add PPC_TLBILX_LPID
From: Nick Desaulniers <ndesaulniers@google.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Nathan Chancellor <nathan@kernel.org>, 
	Tom Rix <trix@redhat.com>
Content-Type: text/plain; charset="utf-8"
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
Cc: kernel test robot <lkp@intel.com>, kvm@vger.kernel.org, llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Clang didn't recognize the instruction tlbilxlpid. This was fixed in
clang-18 [0] then backported to clang-17 [1].  To support clang-16 and
older, rather than using that instruction bare in inline asm, add it to
ppc-opcode.h and use that macro as is done elsewhere for other
instructions.

Link: https://github.com/ClangBuiltLinux/linux/issues/1891
Link: https://github.com/llvm/llvm-project/issues/64080
Link: https://github.com/llvm/llvm-project/commit/53648ac1d0c953ae6d008864dd2eddb437a92468 [0]
Link: https://github.com/llvm/llvm-project-release-prs/commit/0af7e5e54a8c7ac665773ac1ada328713e8338f5 [1]
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/llvm/202307211945.TSPcyOhh-lkp@intel.com/
Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
Changes in v2:
- add 2 missing tabs to PPC_RAW_TLBILX_LPID
- Link to v1: https://lore.kernel.org/r/20230803-ppc_tlbilxlpid-v1-1-84a1bc5cf963@google.com
---
 arch/powerpc/include/asm/ppc-opcode.h |  4 +++-
 arch/powerpc/kvm/e500mc.c             | 10 +++++++---
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/include/asm/ppc-opcode.h b/arch/powerpc/include/asm/ppc-opcode.h
index ef6972aa33b9..f37d8d8cbec6 100644
--- a/arch/powerpc/include/asm/ppc-opcode.h
+++ b/arch/powerpc/include/asm/ppc-opcode.h
@@ -397,7 +397,8 @@
 #define PPC_RAW_RFCI			(0x4c000066)
 #define PPC_RAW_RFDI			(0x4c00004e)
 #define PPC_RAW_RFMCI			(0x4c00004c)
-#define PPC_RAW_TLBILX(t, a, b)		(0x7c000024 | __PPC_T_TLB(t) | 	__PPC_RA0(a) | __PPC_RB(b))
+#define PPC_RAW_TLBILX_LPID		(0x7c000024)
+#define PPC_RAW_TLBILX(t, a, b)		(PPC_RAW_TLBILX_LPID | __PPC_T_TLB(t) | __PPC_RA0(a) | __PPC_RB(b))
 #define PPC_RAW_WAIT_v203		(0x7c00007c)
 #define PPC_RAW_WAIT(w, p)		(0x7c00003c | __PPC_WC(w) | __PPC_PL(p))
 #define PPC_RAW_TLBIE(lp, a)		(0x7c000264 | ___PPC_RB(a) | ___PPC_RS(lp))
@@ -616,6 +617,7 @@
 #define PPC_TLBILX(t, a, b)	stringify_in_c(.long PPC_RAW_TLBILX(t, a, b))
 #define PPC_TLBILX_ALL(a, b)	PPC_TLBILX(0, a, b)
 #define PPC_TLBILX_PID(a, b)	PPC_TLBILX(1, a, b)
+#define PPC_TLBILX_LPID		stringify_in_c(.long PPC_RAW_TLBILX_LPID)
 #define PPC_TLBILX_VA(a, b)	PPC_TLBILX(3, a, b)
 #define PPC_WAIT_v203		stringify_in_c(.long PPC_RAW_WAIT_v203)
 #define PPC_WAIT(w, p)		stringify_in_c(.long PPC_RAW_WAIT(w, p))
diff --git a/arch/powerpc/kvm/e500mc.c b/arch/powerpc/kvm/e500mc.c
index d58df71ace58..dc054b8b5032 100644
--- a/arch/powerpc/kvm/e500mc.c
+++ b/arch/powerpc/kvm/e500mc.c
@@ -16,10 +16,11 @@
 #include <linux/miscdevice.h>
 #include <linux/module.h>
 
-#include <asm/reg.h>
 #include <asm/cputable.h>
-#include <asm/kvm_ppc.h>
 #include <asm/dbell.h>
+#include <asm/kvm_ppc.h>
+#include <asm/ppc-opcode.h>
+#include <asm/reg.h>
 
 #include "booke.h"
 #include "e500.h"
@@ -92,7 +93,10 @@ void kvmppc_e500_tlbil_all(struct kvmppc_vcpu_e500 *vcpu_e500)
 
 	local_irq_save(flags);
 	mtspr(SPRN_MAS5, MAS5_SGS | get_lpid(&vcpu_e500->vcpu));
-	asm volatile("tlbilxlpid");
+	/* clang-17 and older could not assemble tlbilxlpid.
+	 * https://github.com/ClangBuiltLinux/linux/issues/1891
+	 */
+	asm volatile (PPC_TLBILX_LPID);
 	mtspr(SPRN_MAS5, 0);
 	local_irq_restore(flags);
 }

---
base-commit: 7bafbd4027ae86572f308c4ddf93120c90126332
change-id: 20230803-ppc_tlbilxlpid-cfdbf4fd4f7f

Best regards,
-- 
Nick Desaulniers <ndesaulniers@google.com>

