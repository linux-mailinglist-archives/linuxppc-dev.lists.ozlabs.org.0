Return-Path: <linuxppc-dev+bounces-6939-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E98A5E2EE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Mar 2025 18:44:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZCdLP6hn0z30V7;
	Thu, 13 Mar 2025 04:44:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:5300:400:ed00::31e5"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741801485;
	cv=none; b=ndpL8YR6E67UMqPOQO7tR0tNjRCsatfiuY55Ssif0ThFfDoNhSrAB8X37dLcQxqrEtFfoERAe8JwGe8Hp59l75QRIRfsGNq7rnifIvz5sfc2QSybn40o3s0qqw/9WGQPnSQO965Nhk3xXP0kJESkgpIF51isNAHpZiT5ysKGnORw101dJtexCelddo/Afwj1RDwIaS1vOFztotyEM8vOlTgmI2CwsmuV1gGlUU6+E9yUUgd3IccFFKxzZK8u0W7bRUnWem8CcJtfjoi5efInhmex3/GDlt3QRJFDufzxby+61lEQdjAinwgeg3juddMAh6g5UAD7ggE9HR8l4o6Esw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741801485; c=relaxed/relaxed;
	bh=n+vTG4WwsUvvk0jT3UtpPhRoYdPsHKAkk/qLUucsfeA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EnqmdPt9u2kflm8JwncrlVTMDPbD+BiyUOP4aZ9wY54lOSdG+K4F8znPc2yjkjfzXSwZpqQzh/6tbjUVGM8jv5iqUREDFO1KiFwUxaTd6oAO3nrHD+VsF0q2m/QnaOUr/ASdOjb9wEZAUy5oEh8ZG7toEWuCSEyxFfD6BgT0aUFamEdNdG0HZ+Bv8RL0nyB10DvJvlRDnVipCTnPbilbJebgMHz8NddnrHQbCjBIV/mtQBVEgnjpuNJKYulJuHSDwcBAi5KDe35ftBEz63DkNaCMArYs0TzgLMwUNnszNMUKYwHlq6x6SIM8ZqqgdHkv7OBPdtmxpJtiweiRlOeC6A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=efficios.com; dkim=pass (2048-bit key; unprotected) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=smtpout1 header.b=wPqmwTpG; dkim-atps=neutral; spf=pass (client-ip=2607:5300:400:ed00::31e5; helo=smtpout.efficios.com; envelope-from=mathieu.desnoyers@efficios.com; receiver=lists.ozlabs.org) smtp.mailfrom=efficios.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=smtpout1 header.b=wPqmwTpG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=efficios.com (client-ip=2607:5300:400:ed00::31e5; helo=smtpout.efficios.com; envelope-from=mathieu.desnoyers@efficios.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 537 seconds by postgrey-1.37 at boromir; Thu, 13 Mar 2025 04:44:43 AEDT
Received: from smtpout.efficios.com (smtpout.efficios.com [IPv6:2607:5300:400:ed00::31e5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZCdLM72Bmz30T1
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Mar 2025 04:44:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=efficios.com;
	s=smtpout1; t=1741800941;
	bh=4qkLX++lFyjNleliVYwoolACCiGvD8umAZsZrlCBTo4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wPqmwTpGdXOJqNv6lNDC51+hi+V6v31jtUzUQaIUIa26vodfgzFLXMkG8S2bGxeS6
	 ZstdwCfijI4FKsp8uIEniIzsSvjG7Wte+xt5bM80cmHysGmp8RkQo3dcK4F8LOmrg3
	 ZWnOK6QXRUtB0Iu6/XnwpXG55kBAbi/PVZ3BuZyNsWkG2/U0yK+gS/T6KS3h84MszD
	 cl2pqijsDIGpMwksnf0zMGNYrDXMFGaCZg74uhKG4Jv8LfLiEnpyV2gSzPW/9d0Vwn
	 o0JHJOjGOW5ZmEiwzMQ9pHKsKja+8z5Cl3k5c95EvWAE/CO9SSTSyGodTZJMb4T5x4
	 +8xMlqKkgUQGA==
Received: from localhost.localdomain (96-127-217-162.qc.cable.ebox.net [96.127.217.162])
	by smtpout.efficios.com (Postfix) with ESMTPSA id 4ZCd7x44BDzWnL;
	Wed, 12 Mar 2025 13:35:41 -0400 (EDT)
Date: Wed, 12 Mar 2025 13:35:40 -0400
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: Kienan Stewart <kstewart@efficios.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>, linux-build@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	Nicolas Schier <n.schier@avm.de>
Subject: Re: [PATCH v2] kbuild: Add missing $(objtree) prefix to powerpc
 crtsavres.o artifact
Message-ID: <Z9HF7EtC8lNfJ41e@localhost.localdomain>
References: <20250218-buildfix-extmod-powerpc-v2-1-1e78fcf12b56@efficios.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250218-buildfix-extmod-powerpc-v2-1-1e78fcf12b56@efficios.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 18-Feb-2025 03:26:39 PM, Kienan Stewart wrote:
> In the upstream commit 214c0eea43b2ea66bcd6467ea57e47ce8874191b
> ("kbuild: add $(objtree)/ prefix to some in-kernel build artifacts")
> artifacts required for building out-of-tree kernel modules had
> $(objtree) prepended to them to prepare for building in other
> directories.
> 
> When building external modules for powerpc,
> arch/powerpc/lib/crtsavres.o is required for certain
> configurations. This artifact is missing the prepended $(objtree).

FYI, the issue resolved here breaks the build of LTTng-modules against
recent kernels on powerpc. I would gladly welcome upstreaming of this
fix into the Linux kernel.

Thanks!

Mathieu

> 
> Fixes: 13b25489b6f8 ("kbuild: change working directory to external module directory with M=")
> Acked-by: Masahiro Yamada <masahiroy@kernel.org>
> Reviewed-by: Nicolas Schier <n.schier@avm.de>
> Tested-by: Nicolas Schier <n.schier@avm.de>
> Signed-off-by: Kienan Stewart <kstewart@efficios.com>
> ---
> Changes in v2:
> - Added Review-by/Tested-by/Fixes/Acked-By
> - Removed mention of possible work-around for external modules (while
> the build will pass, `make modules_install` will fail)
> - Link to v1: https://lore.kernel.org/r/20250127-buildfix-extmod-powerpc-v1-1-450012b16263@efficios.com
> ---
>  arch/powerpc/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
> index f3804103c56ccfdb16289468397ccaea71bf721e..9933b98df69d7f7b9aaf33d36155cc61ab4460c7 100644
> --- a/arch/powerpc/Makefile
> +++ b/arch/powerpc/Makefile
> @@ -58,7 +58,7 @@ ifeq ($(CONFIG_PPC64)$(CONFIG_LD_IS_BFD),yy)
>  # There is a corresponding test in arch/powerpc/lib/Makefile
>  KBUILD_LDFLAGS_MODULE += --save-restore-funcs
>  else
> -KBUILD_LDFLAGS_MODULE += arch/powerpc/lib/crtsavres.o
> +KBUILD_LDFLAGS_MODULE += $(objtree)/arch/powerpc/lib/crtsavres.o
>  endif
>  
>  ifdef CONFIG_CPU_LITTLE_ENDIAN
> 
> ---
> base-commit: ffd294d346d185b70e28b1a28abe367bbfe53c04
> change-id: 20250127-buildfix-extmod-powerpc-a744e1331f83
> 
> Best regards,
> -- 
> Kienan Stewart <kstewart@efficios.com>
> 

-- 
Mathieu Desnoyers
EfficiOS Inc.
http://www.efficios.com

