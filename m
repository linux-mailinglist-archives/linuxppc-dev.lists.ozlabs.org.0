Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6D538818C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 May 2021 22:42:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fl7Gb3RSlz3btF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 May 2021 06:42:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aG21jQtY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=nathan@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=aG21jQtY; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fl7G93cW2z2xZD
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 May 2021 06:41:53 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 567CB61059;
 Tue, 18 May 2021 20:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621370511;
 bh=aIgBwh8ikO9n9G42hk2Its108dIO1H+qNOHk38ZgjLk=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=aG21jQtYqlcxI5n380BGG/YRCkivqS3rHteMFSS5ekJWaMUDcF5IAbMKzDeehytga
 FwB7699dQbeuqRYyfqFyvb00y2VuuyGg6NCuFfZEi/aFCEKeCgab7Ybpgoxxh2cbZf
 n8stjw/J5+1K9Az7aNdYzi+BboXCFaWT/HzxQohchVrsnIoWGmmSmEjfZD+OaSjrlA
 clV9mNMOQ2IO6Le8Qc5SnzUE2Vr9keWifP6e4jwwiVqyeZnKRqMvpWm4MP0/GqXBTo
 J1YRHO4JvKuvoFaZfvIhFk8xnKT1W4Xw3LDAXYEyRALoVH1S1tpKrHt4UWFtUc1w4M
 888BhJMp9LqHA==
Subject: Re: [PATCH v2] powerpc/powernv/pci: fix header guard
To: Nick Desaulniers <ndesaulniers@google.com>,
 Michael Ellerman <mpe@ellerman.id.au>
References: <87cztok1r5.fsf@mpe.ellerman.id.au>
 <20210518204044.2390064-1-ndesaulniers@google.com>
From: Nathan Chancellor <nathan@kernel.org>
Message-ID: <4aa06438-7bea-a5a6-ff64-0cf8c28e2511@kernel.org>
Date: Tue, 18 May 2021 13:41:49 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210518204044.2390064-1-ndesaulniers@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, linux-kernel@vger.kernel.org,
 Oliver O'Halloran <oohall@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Joe Perches <joe@perches.com>,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 5/18/2021 1:40 PM, Nick Desaulniers wrote:
> While looking at -Wundef warnings, the #if CONFIG_EEH stood out as a
> possible candidate to convert to #ifdef CONFIG_EEH.
> 
> It seems that based on Kconfig dependencies it's not possible to build
> this file without CONFIG_EEH enabled, but based on upstream discussion,
> it's not clear yet that CONFIG_EEH should be enabled by default.
> 
> For now, simply fix the -Wundef warning.
> 
> Suggested-by: Nathan Chancellor <nathan@kernel.org>
> Suggested-by: Joe Perches <joe@perches.com>
> Link: https://github.com/ClangBuiltLinux/linux/issues/570
> Link: https://lore.kernel.org/lkml/67f6cd269684c9aa8463ff4812c3b4605e6739c3.camel@perches.com/
> Link: https://lore.kernel.org/lkml/CAOSf1CGoN5R0LUrU=Y=UWho1Z_9SLgCX8s3SbFJXwJXc5BYz4A@mail.gmail.com/
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>

Makes sense, thanks for the patch!

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>   arch/powerpc/platforms/powernv/pci.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/platforms/powernv/pci.c b/arch/powerpc/platforms/powernv/pci.c
> index b18468dc31ff..6bb3c52633fb 100644
> --- a/arch/powerpc/platforms/powernv/pci.c
> +++ b/arch/powerpc/platforms/powernv/pci.c
> @@ -711,7 +711,7 @@ int pnv_pci_cfg_write(struct pci_dn *pdn,
>   	return PCIBIOS_SUCCESSFUL;
>   }
>   
> -#if CONFIG_EEH
> +#ifdef CONFIG_EEH
>   static bool pnv_pci_cfg_check(struct pci_dn *pdn)
>   {
>   	struct eeh_dev *edev = NULL;
> 

