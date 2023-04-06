Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 704A96D9F3B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Apr 2023 19:52:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PspxG2C8jz3fVK
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Apr 2023 03:52:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Tf0RxFDm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=nathan@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Tf0RxFDm;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PspwK6rLCz3cMl
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Apr 2023 03:51:45 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D8F3D644F5;
	Thu,  6 Apr 2023 17:51:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFCB2C433D2;
	Thu,  6 Apr 2023 17:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680803502;
	bh=URrz+/2zLMv5BZoWzv7thKBt/9KhKr4iJnpzdXcOan4=;
	h=From:Date:Subject:To:Cc:From;
	b=Tf0RxFDm45UqXgi6dExO+oP/E+Imqbva0ixze2k33AyMriVQtuVAdoRIsjMaXpwXR
	 6yYvzHv8gShmSTcmNA0mhHoGZ2GqKcf1n0KT7tuywb6N0SPYZ6x8MjHLHJHTmRUWFP
	 dc3ShRr0J9KRr8Bn+wsdvgUop8W6BkLrdGrCW/zyeqeBNMp4tS+9S1Kc4gLlF6gJvr
	 D+NPXG/YBiUJePDXpIcD7L/O/4n5HLySLLgRkjOdXvYr3C8kTij6kem/jMZ8PUZ3b4
	 pordRq8Cr3h7tI+laW7oeWVfBUm7qXodMTmm3ul9DBP0Ch9dCzwQt/Eiz7eRbFRZol
	 77h129dJ4Tt2w==
From: Nathan Chancellor <nathan@kernel.org>
Date: Thu, 06 Apr 2023 10:51:30 -0700
Subject: [PATCH] powerpc/32: Include thread_info.h in head_booke.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230406-wundef-thread_shift_booke-v1-1-8deffa4d84f9@kernel.org>
X-B4-Tracking: v=1; b=H4sIAKEGL2QC/x2N2wrCMBAFf6Xss4FYNRR/RaQkzYlZxFR24wVK/
 93Ux+EwZxZSCEPp3C0keLPyXBrsdx1N2ZcbDMfG1Nv+YI/Wmc+rRCRTs8DHUTOnOoZ5vsPADnG
 wDtGdHDU/eIUJ4suUt4eH1wrZhqcg8fcfvVzX9QeVWPMxhAAAAA==
To: mpe@ellerman.id.au
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1458; i=nathan@kernel.org;
 h=from:subject:message-id; bh=URrz+/2zLMv5BZoWzv7thKBt/9KhKr4iJnpzdXcOan4=;
 b=owGbwMvMwCEmm602sfCA1DTG02pJDCn6bGurV5UtO5C8Kohhtktf/ZGoQ9I13gGRhVOfZj9XX
 aBncN6wo5SFQYyDQVZMkaX6sepxQ8M5ZxlvnJoEM4eVCWQIAxenAEzEpJWR4eoRtoUKslHPfvud
 kGQ5KvXthVH8f/XPEvJryve9PHMo/SLDP52Xn3j+xPw2/Bl0jc16uczsl6s5Ar+v23uGPctLwN0
 riwUA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
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
Cc: kernel test robot <lkp@intel.com>, masahiroy@kernel.org, patches@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>, npiggin@gmail.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When building with W=1 after commit 80b6093b55e3 ("kbuild: add -Wundef
to KBUILD_CPPFLAGS for W=1 builds"), the following warning occurs.

  In file included from arch/powerpc/kvm/bookehv_interrupts.S:26:
  arch/powerpc/kvm/../kernel/head_booke.h:20:6: warning: "THREAD_SHIFT" is not defined, evaluates to 0 [-Wundef]
     20 | #if (THREAD_SHIFT < 15)
        |      ^~~~~~~~~~~~

THREAD_SHIFT is defined in thread_info.h but it is not directly included
in head_booke.h, so it is possible for THREAD_SHIFT to be undefined. Add
the include to ensure that THREAD_SHIFT is always defined.

Reported-by: kernel test robot <lkp@intel.com>
Link: https://lore.kernel.org/202304050954.yskLdczH-lkp@intel.com/
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 arch/powerpc/kernel/head_booke.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/kernel/head_booke.h b/arch/powerpc/kernel/head_booke.h
index 37d43c172676..b6b5b01a173c 100644
--- a/arch/powerpc/kernel/head_booke.h
+++ b/arch/powerpc/kernel/head_booke.h
@@ -5,6 +5,7 @@
 #include <asm/ptrace.h>	/* for STACK_FRAME_REGS_MARKER */
 #include <asm/kvm_asm.h>
 #include <asm/kvm_booke_hv_asm.h>
+#include <asm/thread_info.h>	/* for THREAD_SHIFT */
 
 #ifdef __ASSEMBLY__
 

---
base-commit: b0bbe5a2915201e3231e788d716d39dc54493b03
change-id: 20230406-wundef-thread_shift_booke-e08d806ed656

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>

