Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BDBA96F0CA2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Apr 2023 21:36:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q6mDy3LrNz3fDd
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Apr 2023 05:36:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XierVmVd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=nathan@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XierVmVd;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q6mD44nhzz3cjG
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Apr 2023 05:35:16 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D06F463D7D;
	Thu, 27 Apr 2023 19:35:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24230C4339B;
	Thu, 27 Apr 2023 19:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682624111;
	bh=I6bjmJKyg+OsI5C9yWHH3qaPQ1SmKzUJt4SHAnBFRZI=;
	h=From:Date:Subject:To:Cc:From;
	b=XierVmVdpa9Cp39YuWLeh+yshOeehlTOz9gNsgUitHVikKGFTxIiAKZkigJbZrsrg
	 vgQa+Q3Ck2JIRvcGCVf3wpvIWrAypEQdMXGq1d1TO+aixd+IJz/1+t1VFZyja6lkkM
	 MyoDXHe54cW6Tg9mh9XJ060LVRxv1g7MZMunUP5XiW6dIOZNp7+H4dBL9gwCtU6h+/
	 Qg3IGXNqxWg5xgmmNvPpl+LSW9OUfesBRR/jjrB2ZTx7ori0yCkmb3fldCh/4J2gPe
	 Ai+yXz746miKIZ6kO6lUawp5qy9F5179DlH2rfO5zvywSC/rpSwUudk3SS1HDoSanB
	 wr23RJp6sCcPQ==
From: Nathan Chancellor <nathan@kernel.org>
Date: Thu, 27 Apr 2023 12:34:53 -0700
Subject: [PATCH] powerpc/boot: Disable power10 features after BOOTAFLAGS
 assignment
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230427-remove-power10-args-from-boot-aflags-clang-v1-1-9107f7c943bc@kernel.org>
X-B4-Tracking: v=1; b=H4sIAFzOSmQC/x2OwQqDMBBEf0Vy7kKM0kp/pfSwSTcaMFnZFS2I/
 97Y45thHnMYJUmk5tkcRmhLmrhUaG+NCROWkSB9KhtnXWd79wChzBvBwjtJawFlVIjCGTzzChh
 nrEGY6xTcfQh9R0NoYzBV6FEJvGAJ06XMqCvJVSxCMX3/L17v8/wBDfVlOJUAAAA=
To: mpe@ellerman.id.au
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2693; i=nathan@kernel.org;
 h=from:subject:message-id; bh=I6bjmJKyg+OsI5C9yWHH3qaPQ1SmKzUJt4SHAnBFRZI=;
 b=owGbwMvMwCEmm602sfCA1DTG02pJDCle5/I47l3VVrhda/xi+qvzUqkHPLpLjyWoL7h32nDxZ
 0XFY7urOkpZGMQ4GGTFFFmqH6seNzScc5bxxqlJMHNYmUCGMHBxCsBEUl8z/OF2N5n/qTdontgL
 j/9b712ou3PowoKTqg/552x/apAX9DCekeF31rJjPwrXT1okOJnber27/ht53bCIeqOQgo7b8Wv
 3TuQDAA==
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
Cc: trix@redhat.com, llvm@lists.linux.dev, ndesaulniers@google.com, patches@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>, npiggin@gmail.com, stable@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When building the boot wrapper assembly files with clang after
commit 648a1783fe25 ("powerpc/boot: Fix boot wrapper code generation
with CONFIG_POWER10_CPU"), the following warnings appear for each file
built:

  '-prefixed' is not a recognized feature for this target (ignoring feature)
  '-pcrel' is not a recognized feature for this target (ignoring feature)

While it is questionable whether or not LLVM should be emitting a
warning when passed negative versions of code generation flags when
building assembly files (since it does not emit a warning for the
altivec and vsx flags), it is easy enough to work around this by just
moving the disabled flags to BOOTCFLAGS after the assignment of
BOOTAFLAGS, so that they are not added when building assembly files.
Do so to silence the warnings.

Cc: stable@vger.kernel.org
Fixes: 648a1783fe25 ("powerpc/boot: Fix boot wrapper code generation with CONFIG_POWER10_CPU")
Link: https://github.com/ClangBuiltLinux/linux/issues/1839
Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
I do not think that 648a1783fe25 is truly to blame for this but the
Fixes tag will help the stable team ensure that this change gets
backported with 648a1783fe25. This is the minimal fix for the problem
but the true fix is separating AFLAGS and CFLAGS, which should be done
by this in-flight series by Nick:

https://lore.kernel.org/20230426055848.402993-1-npiggin@gmail.com/
---
 arch/powerpc/boot/Makefile | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
index 85cde5bf04b7..771b79423bbc 100644
--- a/arch/powerpc/boot/Makefile
+++ b/arch/powerpc/boot/Makefile
@@ -34,8 +34,6 @@ endif
 
 BOOTCFLAGS    := -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs \
 		 -fno-strict-aliasing -O2 -msoft-float -mno-altivec -mno-vsx \
-		 $(call cc-option,-mno-prefixed) $(call cc-option,-mno-pcrel) \
-		 $(call cc-option,-mno-mma) \
 		 $(call cc-option,-mno-spe) $(call cc-option,-mspe=no) \
 		 -pipe -fomit-frame-pointer -fno-builtin -fPIC -nostdinc \
 		 $(LINUXINCLUDE)
@@ -71,6 +69,10 @@ BOOTAFLAGS	:= -D__ASSEMBLY__ $(BOOTCFLAGS) -nostdinc
 
 BOOTARFLAGS	:= -crD
 
+BOOTCFLAGS	+= $(call cc-option,-mno-prefixed) \
+		   $(call cc-option,-mno-pcrel) \
+		   $(call cc-option,-mno-mma)
+
 ifdef CONFIG_CC_IS_CLANG
 BOOTCFLAGS += $(CLANG_FLAGS)
 BOOTAFLAGS += $(CLANG_FLAGS)

---
base-commit: 169f8997968ab620d750d9a45e15c5288d498356
change-id: 20230427-remove-power10-args-from-boot-aflags-clang-268c43e8c1fc

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>

