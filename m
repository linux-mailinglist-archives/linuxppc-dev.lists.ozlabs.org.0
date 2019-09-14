Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 199A6B2C4B
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Sep 2019 18:53:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Vz8m4DY7zF5xk
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Sep 2019 02:53:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="h6zRP2Ck"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Vz6d0qnzzF532
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 15 Sep 2019 02:51:20 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46Vz6T5ggMz9tycq;
 Sat, 14 Sep 2019 18:51:13 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=h6zRP2Ck; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id XHDQc381JH2O; Sat, 14 Sep 2019 18:51:13 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46Vz6T4ZRyz9tycp;
 Sat, 14 Sep 2019 18:51:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1568479873; bh=LWujgpcYct92yuUDaXEeUAyD2wFvAtFvepKoZtQnzKI=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=h6zRP2CkSx1dpu3chBbomnZh98BnpdMH1DKk++Q7zW7HWQxtVHU7WcR+u5U3s/e/w
 XlaFmz0dW+i+BoTxvHsUGm742A6pFuaZph4mjvWhYifQ6FCMt74XyUa824uaJEvpJM
 q0/sFYtJt/1a2PMh7xZGxnRjFtCvd4luYASDiVHQ=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 507C58B80B;
 Sat, 14 Sep 2019 18:51:15 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id BOzyotLb7U4A; Sat, 14 Sep 2019 18:51:15 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 681C88B756;
 Sat, 14 Sep 2019 18:51:14 +0200 (CEST)
Subject: Re: [PATCH 2/2] powerpc/83xx: map IMMR with a BAT.
To: Scott Wood <oss@buserror.net>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 galak@kernel.crashing.org
References: <b51b96090138aba1920d2cf7c0e0e348667f9a69.1566564560.git.christophe.leroy@c-s.fr>
 <331759c1bcba5797d30f8eace74afb16ac5f3c36.1566564560.git.christophe.leroy@c-s.fr>
 <b201df6242e7f6cebd525e0a301eef2afdb38f30.camel@buserror.net>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <e9437d8c-564e-cc76-e8fd-54e4000c2349@c-s.fr>
Date: Sat, 14 Sep 2019 18:51:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <b201df6242e7f6cebd525e0a301eef2afdb38f30.camel@buserror.net>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 14/09/2019 à 16:34, Scott Wood a écrit :
> On Fri, 2019-08-23 at 12:50 +0000, Christophe Leroy wrote:
>> On mpc83xx with a QE, IMMR is 2Mbytes.
>> On mpc83xx without a QE, IMMR is 1Mbytes.
>> Each driver will map a part of it to access the registers it needs.
>> Some driver will map the same part of IMMR as other drivers.
>>
>> In order to reduce TLB misses, map the full IMMR with a BAT.
>>
>> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
>> ---
>>   arch/powerpc/platforms/83xx/misc.c | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/arch/powerpc/platforms/83xx/misc.c
>> b/arch/powerpc/platforms/83xx/misc.c
>> index f46d7bf3b140..1e395b01c535 100644
>> --- a/arch/powerpc/platforms/83xx/misc.c
>> +++ b/arch/powerpc/platforms/83xx/misc.c
>> @@ -18,6 +18,8 @@
>>   #include <sysdev/fsl_soc.h>
>>   #include <sysdev/fsl_pci.h>
>>   
>> +#include <mm/mmu_decl.h>
>> +
>>   #include "mpc83xx.h"
>>   
>>   static __be32 __iomem *restart_reg_base;
>> @@ -145,6 +147,14 @@ void __init mpc83xx_setup_arch(void)
>>   	if (ppc_md.progress)
>>   		ppc_md.progress("mpc83xx_setup_arch()", 0);
>>   
>> +	if (!__map_without_bats) {
>> +		int immrsize = IS_ENABLED(CONFIG_QUICC_ENGINE) ? SZ_2M :
>> SZ_1M;
> 
> Any reason not to unconditionally make it 2M?  After all, the kernel being
> built with CONFIG_QUICC_ENGINE doesn't mean that the hardware you're running
> on has it...
> 

Euh .. ok. I didn't see it that way, but you are right.

Do you think it is not a problem to map 2M even when the quicc engine is 
not there ? Or should it check device tree instead ?

Christophe
