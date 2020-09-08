Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2738F2611D9
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Sep 2020 15:13:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bm5FY1HrDzDqSY
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Sep 2020 23:13:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bm5C901TWzDqRc
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Sep 2020 23:11:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4Bm5C85mcCz8syr
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Sep 2020 23:11:48 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4Bm5C85MzVz9sTX; Tue,  8 Sep 2020 23:11:48 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4Bm5C80wqFz9sSn
 for <linuxppc-dev@ozlabs.org>; Tue,  8 Sep 2020 23:11:45 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4Bm5C10L9lz9tytT;
 Tue,  8 Sep 2020 15:11:41 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 0yrBPq4xOkCS; Tue,  8 Sep 2020 15:11:40 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4Bm5C066pzz9tytR;
 Tue,  8 Sep 2020 15:11:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 57F758B7C5;
 Tue,  8 Sep 2020 15:11:42 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id urzp2p3UnTc6; Tue,  8 Sep 2020 15:11:42 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0F2828B7BE;
 Tue,  8 Sep 2020 15:11:42 +0200 (CEST)
Subject: Re: [PATCH] powerpc/64: Make VDSO32 track COMPAT on 64-bit
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@ozlabs.org
References: <20200908125850.407939-1-mpe@ellerman.id.au>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <f5ca915b-81b5-aa7b-727e-e43681ab825f@csgroup.eu>
Date: Tue, 8 Sep 2020 15:11:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200908125850.407939-1-mpe@ellerman.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
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
Cc: msuchanek@suse.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 08/09/2020 à 14:58, Michael Ellerman a écrit :
> When we added the VDSO32 kconfig symbol, which controls building of
> the 32-bit VDSO, we made it depend on CPU_BIG_ENDIAN (for 64-bit).
> 
> That was because back then COMPAT was always enabled for 64-bit, so
> depending on it would have left the 32-bit VDSO always enabled, which
> we didn't want.
> 
> But since then we have made COMPAT selectable, and off by default for
> ppc64le, so VDSO32 should really depend on that.
> 
> For most people this makes no difference, none of the defconfigs
> change, it's only if someone is building ppc64le with COMPAT=y, they
> will now also get VDSO32. If they've enabled COMPAT in order to run
> 32-bit binaries they presumably also want the 32-bit VDSO.
> 
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>


Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Michael, please note that christophe.leroy@c-s.fr is a deprecated 
address that will one day not work anymore. Please use the new one 
whenever possible.

Christophe


> ---
>   arch/powerpc/platforms/Kconfig.cputype | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
> index 87737ec86d39..a80ad0ef436e 100644
> --- a/arch/powerpc/platforms/Kconfig.cputype
> +++ b/arch/powerpc/platforms/Kconfig.cputype
> @@ -490,13 +490,12 @@ endmenu
>   
>   config VDSO32
>   	def_bool y
> -	depends on PPC32 || CPU_BIG_ENDIAN
> +	depends on PPC32 || COMPAT
>   	help
>   	  This symbol controls whether we build the 32-bit VDSO. We obviously
>   	  want to do that if we're building a 32-bit kernel. If we're building
> -	  a 64-bit kernel then we only want a 32-bit VDSO if we're building for
> -	  big endian. That is because the only little endian configuration we
> -	  support is ppc64le which is 64-bit only.
> +	  a 64-bit kernel then we only want a 32-bit VDSO if we're also enabling
> +	  COMPAT.
>   
>   choice
>   	prompt "Endianness selection"
> 
