Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E081718115C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Mar 2020 08:03:02 +0100 (CET)
Received: from lists.ozlabs.org (unknown [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48cjb66bNkzDqNx
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Mar 2020 18:02:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=oY3jtwKM; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48cjYS1qWSzDqHk
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Mar 2020 18:01:31 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48cjYG1Y5Rz9vBnF;
 Wed, 11 Mar 2020 08:01:22 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=oY3jtwKM; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 5yl0kmo-_LLV; Wed, 11 Mar 2020 08:01:22 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48cjYG0PNnz9vBnD;
 Wed, 11 Mar 2020 08:01:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1583910082; bh=9b4tPLzll5ovJDJ0dRAwLTvrvDgAG6hECVfKFGFASk4=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=oY3jtwKMDZYbhaoTWtSaxDYvk+LoQtSNUKIkUuJ8jG920/RdMZU8L3jTh7au1+8X6
 4YjoeEY4bLApp3AJS++alsIxDBXV9iO3sEWiRvBG2vVp2d37hiK4RZQ/MrRCfmMkuH
 O8LhGmLaMEH2x5neHM1mBNgdHMx0UYYidNLTZj4M=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DF2B98B795;
 Wed, 11 Mar 2020 08:01:22 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 7NvJdc7dEi0p; Wed, 11 Mar 2020 08:01:22 +0100 (CET)
Received: from [172.25.230.100] (po15451.idsi0.si.c-s.fr [172.25.230.100])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B9CF48B752;
 Wed, 11 Mar 2020 08:01:22 +0100 (CET)
Subject: Re: [PATCH 1/2] powerpc test_emulate_step: fix DS operand in ld
 encoding to appropriate value
To: Balamuruhan S <bala24@linux.ibm.com>, mpe@ellerman.id.au
References: <20200311061417.384629-1-bala24@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <188eadfa-6908-196a-ed77-cec210c54c84@c-s.fr>
Date: Wed, 11 Mar 2020 08:01:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200311061417.384629-1-bala24@linux.ibm.com>
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
Cc: ravi.bangoria@linux.ibm.com, jniethe5@gmail.com, paulus@samba.org,
 sandipan@linux.ibm.com, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 11/03/2020 à 07:14, Balamuruhan S a écrit :
> ld instruction should have 14 bit immediate field (DS) concatenated with
> 0b00 on the right, encode it accordingly.
> 
> Fixes: 4ceae137bdab ("powerpc: emulate_step() tests for load/store instructions")
> Reviewed-by: Sandipan Das <sandipan@linux.ibm.com>
> Signed-off-by: Balamuruhan S <bala24@linux.ibm.com>
> ---
>   arch/powerpc/lib/test_emulate_step.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/lib/test_emulate_step.c b/arch/powerpc/lib/test_emulate_step.c
> index 42347067739c..51c254fd15b5 100644
> --- a/arch/powerpc/lib/test_emulate_step.c
> +++ b/arch/powerpc/lib/test_emulate_step.c
> @@ -19,7 +19,7 @@
>    * definitions.
>    */
>   #define TEST_LD(r, base, i)	(PPC_INST_LD | ___PPC_RT(r) |		\
> -					___PPC_RA(base) | IMM_L(i))
> +					___PPC_RA(base) | ((i) & 0xfffc))

I think you should squash patch 1 and 2 together. Or at least you should
put the new IMM_DS macro in patch 1 and use it instead of open coding.

>   #define TEST_LWZ(r, base, i)	(PPC_INST_LWZ | ___PPC_RT(r) |		\
>   					___PPC_RA(base) | IMM_L(i))
>   #define TEST_LWZX(t, a, b)	(PPC_INST_LWZX | ___PPC_RT(t) |		\
> 
> base-commit: 5aa19adac1f3152a5fd3b865a1ab46bb845d3696
> 

Christophe
