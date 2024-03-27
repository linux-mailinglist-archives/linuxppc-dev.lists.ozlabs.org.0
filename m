Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C7F88E846
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Mar 2024 16:16:55 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Xjdniq+W;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V4VdK3z7Rz3vdR
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Mar 2024 02:16:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Xjdniq+W;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V4Vcd4bFlz3fNd
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Mar 2024 02:16:17 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C01AB615A5;
	Wed, 27 Mar 2024 15:16:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DE84C433C7;
	Wed, 27 Mar 2024 15:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711552575;
	bh=3mjqSFARTqJWeXDaQOm2tUVu0IHBSuFehHS5Hx4/O2g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xjdniq+WJyCdYl8RowcIqwQ+T6OKOC/ulCvVN9gyybhgXcn86gpxQbusTXDQ3EY2U
	 l0sJhJymwqZsW+4//00COrtoR+EQjGupyH9/kRDW3LY7ec+/vvm6oWrP3oYHh2EbRu
	 8ovFliBkwALW0cngJy36sVFunwwca1mC+J7VLbtJhZM7CBHzBYinh2Fd4/W9trBrc3
	 1EOJlqIqKEyrWRpt0yogqJlSghIRJ4E8Tptj0GFagIY6OIR4AGTkzQ6kNs+Mo+voGh
	 3jb9txE1vb4iHsWrcRZT44FWAqVPD3+QW+QVADCgWLWJOuPWpNpf5eBwTz0gGWOrbO
	 R3dmQRj6Ct5eA==
Date: Wed, 27 Mar 2024 08:16:13 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Subject: Re: FAILED: Patch "powerpc: xor_vmx: Add '-mhard-float' to CFLAGS"
 failed to apply to 5.10-stable tree
Message-ID: <20240327151613.GA1153323@dev-arch.thelio-3990X>
References: <20240327122007.2835763-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="YKLJLOt2Iod++WF+"
Content-Disposition: inline
In-Reply-To: <20240327122007.2835763-1-sashal@kernel.org>
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
Cc: llvm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--YKLJLOt2Iod++WF+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 27, 2024 at 08:20:07AM -0400, Sasha Levin wrote:
> The patch below does not apply to the 5.10-stable tree.
> If someone wants it applied there, or to any other stable or longterm
> tree, then please email the backport, including the original git commit
> id to <stable@vger.kernel.org>.
...
> ------------------ original commit in Linus's tree ------------------
> 
> From 35f20786c481d5ced9283ff42de5c69b65e5ed13 Mon Sep 17 00:00:00 2001
> From: Nathan Chancellor <nathan@kernel.org>
> Date: Sat, 27 Jan 2024 11:07:43 -0700
> Subject: [PATCH] powerpc: xor_vmx: Add '-mhard-float' to CFLAGS

I have attached a backport that will work for 5.15 and earlier. I think
you worked around this conflict in 5.15 by taking 04e85bbf71c9 but I am
not sure that is a smart idea. I think it might just be better to drop
that dependency and apply this version in 5.15.

Cheers,
Nathan

--YKLJLOt2Iod++WF+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="0001-powerpc-xor_vmx-Add-mhard-float-to-CFLAGS.patch"

From c6cb80d94871cbb4ff151f7eb2586cadeb364ef7 Mon Sep 17 00:00:00 2001
From: Nathan Chancellor <nathan@kernel.org>
Date: Sat, 27 Jan 2024 11:07:43 -0700
Subject: [PATCH 4.19 to 5.15] powerpc: xor_vmx: Add '-mhard-float' to CFLAGS

commit 35f20786c481d5ced9283ff42de5c69b65e5ed13 upstream.

arch/powerpc/lib/xor_vmx.o is built with '-msoft-float' (from the main
powerpc Makefile) and '-maltivec' (from its CFLAGS), which causes an
error when building with clang after a recent change in main:

  error: option '-msoft-float' cannot be specified with '-maltivec'
  make[6]: *** [scripts/Makefile.build:243: arch/powerpc/lib/xor_vmx.o] Error 1

Explicitly add '-mhard-float' before '-maltivec' in xor_vmx.o's CFLAGS
to override the previous inclusion of '-msoft-float' (as the last option
wins), which matches how other areas of the kernel use '-maltivec', such
as AMDGPU.

Cc: stable@vger.kernel.org
Closes: https://github.com/ClangBuiltLinux/linux/issues/1986
Link: https://github.com/llvm/llvm-project/commit/4792f912b232141ecba4cbae538873be3c28556c
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://msgid.link/20240127-ppc-xor_vmx-drop-msoft-float-v1-1-f24140e81376@kernel.org
[nathan: Fixed conflicts due to lack of 04e85bbf71c9 in older trees]
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 arch/powerpc/lib/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/lib/Makefile b/arch/powerpc/lib/Makefile
index 321cab5c3ea0..bd5012aa94e3 100644
--- a/arch/powerpc/lib/Makefile
+++ b/arch/powerpc/lib/Makefile
@@ -67,6 +67,6 @@ obj-$(CONFIG_PPC_LIB_RHEAP) += rheap.o
 obj-$(CONFIG_FTR_FIXUP_SELFTEST) += feature-fixups-test.o
 
 obj-$(CONFIG_ALTIVEC)	+= xor_vmx.o xor_vmx_glue.o
-CFLAGS_xor_vmx.o += -maltivec $(call cc-option,-mabi=altivec)
+CFLAGS_xor_vmx.o += -mhard-float -maltivec $(call cc-option,-mabi=altivec)
 
 obj-$(CONFIG_PPC64) += $(obj64-y)
-- 
2.44.0


--YKLJLOt2Iod++WF+--
