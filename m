Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B362872A5D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 23:44:02 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=grtqyePr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tq9bN1R5tz3vZv
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Mar 2024 09:44:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=grtqyePr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tq9Zd4L40z3dW3
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Mar 2024 09:43:21 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6FE3A618B6;
	Tue,  5 Mar 2024 22:43:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7158EC433F1;
	Tue,  5 Mar 2024 22:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709678598;
	bh=dQ1pJAIiavjdmCx57q0B9xSQYGoGPYdjft4ZmROG2sI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=grtqyePrDLKoRLaMF/691CTWvRljtN0XrIwLHTHblVWNNnspKCBQfcrPz5KaqGlIT
	 wNL1ocYuCO8GaC/9C4HwOzamXHadXRDycP2V9OcBBWl1oSCyrF9FWBb0s2zNK0bjdd
	 HbekNWMkCcw9QGdpSCdFkhS/bzuiI+e3xRHGV/VdaPKMcel77jYDN5QWWxo+lsCsvn
	 HSA4z1yjaMEd/QgQaWpwin9eOEVvbDcAz1CmjAkBcwo6gblPZ8TVgaRJU98SxGQTWG
	 WILvMUZSTd7Gx+a9RwLbG2sAuQMUTgf8wsxMdVTP0G8ExnGJdJQ6Z+bnv2/pjJCjiC
	 wNKUwrjAs8B+A==
Date: Tue, 5 Mar 2024 15:43:15 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: mpe@ellerman.id.au
Subject: Re: [PATCH] powerpc: xor_vmx: Add '-mhard-float' to CFLAGS
Message-ID: <20240305224315.GA2361659@dev-arch.thelio-3990X>
References: <20240127-ppc-xor_vmx-drop-msoft-float-v1-1-f24140e81376@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240127-ppc-xor_vmx-drop-msoft-float-v1-1-f24140e81376@kernel.org>
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
Cc: llvm@lists.linux.dev, patches@lists.linux.dev, aneesh.kumar@kernel.org, npiggin@gmail.com, justinstitt@google.com, naveen.n.rao@linux.ibm.com, stable@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, morbo@google.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Ping? We have been applying this in our CI since it was sent, it would
be nice to have this upstream soon so it can start filtering through the
stable trees.

On Sat, Jan 27, 2024 at 11:07:43AM -0700, Nathan Chancellor wrote:
> arch/powerpc/lib/xor_vmx.o is built with '-msoft-float' (from the main
> powerpc Makefile) and '-maltivec' (from its CFLAGS), which causes an
> error when building with clang after a recent change in main:
> 
>   error: option '-msoft-float' cannot be specified with '-maltivec'
>   make[6]: *** [scripts/Makefile.build:243: arch/powerpc/lib/xor_vmx.o] Error 1
> 
> Explicitly add '-mhard-float' before '-maltivec' in xor_vmx.o's CFLAGS
> to override the previous inclusion of '-msoft-float' (as the last option
> wins), which matches how other areas of the kernel use '-maltivec', such
> as AMDGPU.
> 
> Cc: stable@vger.kernel.org
> Closes: https://github.com/ClangBuiltLinux/linux/issues/1986
> Link: https://github.com/llvm/llvm-project/commit/4792f912b232141ecba4cbae538873be3c28556c
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  arch/powerpc/lib/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/lib/Makefile b/arch/powerpc/lib/Makefile
> index 6eac63e79a89..0ab65eeb93ee 100644
> --- a/arch/powerpc/lib/Makefile
> +++ b/arch/powerpc/lib/Makefile
> @@ -76,7 +76,7 @@ obj-$(CONFIG_PPC_LIB_RHEAP) += rheap.o
>  obj-$(CONFIG_FTR_FIXUP_SELFTEST) += feature-fixups-test.o
>  
>  obj-$(CONFIG_ALTIVEC)	+= xor_vmx.o xor_vmx_glue.o
> -CFLAGS_xor_vmx.o += -maltivec $(call cc-option,-mabi=altivec)
> +CFLAGS_xor_vmx.o += -mhard-float -maltivec $(call cc-option,-mabi=altivec)
>  # Enable <altivec.h>
>  CFLAGS_xor_vmx.o += -isystem $(shell $(CC) -print-file-name=include)
>  
> 
> ---
> base-commit: 6613476e225e090cc9aad49be7fa504e290dd33d
> change-id: 20240127-ppc-xor_vmx-drop-msoft-float-ad68b437f86c
> 
> Best regards,
> -- 
> Nathan Chancellor <nathan@kernel.org>
> 
