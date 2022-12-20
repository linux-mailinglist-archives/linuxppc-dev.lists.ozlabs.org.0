Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D49A6527B4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Dec 2022 21:17:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nc7DF2qvnz3fJy
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Dec 2022 07:17:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sn6Oh5cY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sn6Oh5cY;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nc7B226Rpz3c8C
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Dec 2022 07:15:54 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9781D6158C;
	Tue, 20 Dec 2022 20:15:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA3F9C433EF;
	Tue, 20 Dec 2022 20:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671567352;
	bh=Ysbhxfb4+GSt8g7B+0msZxC7XX+fKQNQougHwdZVmyk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sn6Oh5cYMfEPaNmNUsOnY6L7sLghzqaf92oeLFwxc4sUmT+Ku4UEMJl/QMossxE7k
	 fkWLOdLaE64rx8tXdUhvi3+902orunRfP7G4ahtigr3Ab0O5GA93jF8ELkPVT0i6+Y
	 Pxx1l1hyrcHua1ceEIDp+vCOp4wMxOekOaVaXVA9NBEdB/TX9zEW1DhH37Idk9ObK0
	 Ph7Wib9FEtR8/LMy4E0JjUDAPuGvutlR+5oNSEk2g4jh/T+x5jkwnqmau63fyOYB11
	 4pqqNHkYOiD6q19fKDaKf2QO8UFxJPbbJCZi1Vj599TiAqz/mD7VmfDNBdE7eh5h1u
	 T3Nyt28m84plQ==
Received: by pali.im (Postfix)
	id ABF36963; Tue, 20 Dec 2022 21:15:49 +0100 (CET)
Date: Tue, 20 Dec 2022 21:15:49 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v1 4/5] powerpc: Remove cpu-as-y completely
Message-ID: <20221220201549.fpnopv6h4y5mpabj@pali>
References: <38a8d765ed9149bc6b5484a7142e3bc59ffa3b1a.1671475543.git.christophe.leroy@csgroup.eu>
 <9e43ad8b173c2fdb540e2555a8ba3e375419f3cf.1671475543.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9e43ad8b173c2fdb540e2555a8ba3e375419f3cf.1671475543.git.christophe.leroy@csgroup.eu>
User-Agent: NeoMutt/20180716
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
Cc: linuxppc-dev@lists.ozlabs.org, jbglaw@lug-owl.de, Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Monday 19 December 2022 19:45:59 Christophe Leroy wrote:
> cpu-as-y is there to force assembler building options.
> But there is no need for that. Gcc is passed the necessary
> options and it automatically pass the appropriate option to
> GAS.
> 
> GCC is given -maltivec when relevant, so no need
> for -Wa,-maltivec in addition
> 
> And -Wa,-many is wrong as it will hide innapropriate
> instructions. Better to detect them and handle them on a
> case by case basis.
> -Wa,-many was added by commit 960e30029863 ("powerpc/Makefile:
> Fix PPC_BOOK3S_64 ASFLAGS") in order to fix an issue with
> clang and the passed -Wa,-mpower4 option. But we have now
> removed it expecting the compiler to automatically pass the
> proper options and instructions based on -mcpu=power4
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Acked-by: Pali Rohár <pali@kernel.org>

> ---
>  arch/powerpc/Makefile | 12 ------------
>  1 file changed, 12 deletions(-)
> 
> diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
> index 0f9f291895cb..7e67f939a243 100644
> --- a/arch/powerpc/Makefile
> +++ b/arch/powerpc/Makefile
> @@ -201,18 +201,6 @@ KBUILD_CFLAGS += -fno-asynchronous-unwind-tables
>  # often slow when they are implemented at all
>  KBUILD_CFLAGS		+= $(call cc-option,-mno-string)
>  
> -cpu-as-$(CONFIG_ALTIVEC)	+= $(call as-option,-Wa$(comma)-maltivec)
> -
> -# When using '-many -mpower4' gas will first try and find a matching power4
> -# mnemonic and failing that it will allow any valid mnemonic that GAS knows
> -# about. GCC will pass -many to GAS when assembling, clang does not.
> -# LLVM IAS doesn't understand either flag: https://github.com/ClangBuiltLinux/linux/issues/675
> -# but LLVM IAS only supports ISA >= 2.06 for Book3S 64 anyway...
> -cpu-as-$(CONFIG_PPC_BOOK3S_64)	+= $(call as-option,-Wa$(comma)-many)
> -
> -KBUILD_AFLAGS += $(cpu-as-y)
> -KBUILD_CFLAGS += $(cpu-as-y)
> -
>  KBUILD_AFLAGS += $(aflags-y)
>  KBUILD_CFLAGS += $(cflags-y)
>  
> -- 
> 2.38.1
> 
