Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C4423CBD4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Aug 2020 17:54:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BMGQq1KD9zDqgM
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Aug 2020 01:54:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BMGNn35jKzDqd2
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Aug 2020 01:52:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4BMGNm42Tyz8tXC
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Aug 2020 01:52:56 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4BMGNm3q6pz9sRN; Thu,  6 Aug 2020 01:52:56 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4BMGNm1Dbkz9sRK
 for <linuxppc-dev@ozlabs.org>; Thu,  6 Aug 2020 01:52:52 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BMGNb2kKkz9vD49;
 Wed,  5 Aug 2020 17:52:47 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id vreXf-1b-J8y; Wed,  5 Aug 2020 17:52:47 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BMGNb1zcxz9vD42;
 Wed,  5 Aug 2020 17:52:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3AFE88B7EF;
 Wed,  5 Aug 2020 17:52:49 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id DA5-dK037bNK; Wed,  5 Aug 2020 17:52:48 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8BD438B7EC;
 Wed,  5 Aug 2020 17:52:48 +0200 (CEST)
Subject: Re: [PATCH] powerpc/40x: Fix assembler warning about r0
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@ozlabs.org
References: <20200722022422.825197-1-mpe@ellerman.id.au>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <bc70ddd8-d48d-d939-dce0-5aa8b8cf87d8@csgroup.eu>
Date: Wed, 5 Aug 2020 17:52:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200722022422.825197-1-mpe@ellerman.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 22/07/2020 à 04:24, Michael Ellerman a écrit :
> The assembler says:
>    arch/powerpc/kernel/head_40x.S:623: Warning: invalid register expression

I get exactly the same with head_32.S, for the exact same reason.

Christophe

> 
> It's objecting to the use of r0 as the RA argument. That's because
> when RA = 0 the literal value 0 is used, rather than the content of
> r0, making the use of r0 in the source potentially confusing.
> 
> Fix it to use a literal 0, the generated code is identical.
> 
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
>   arch/powerpc/kernel/head_40x.S | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/kernel/head_40x.S b/arch/powerpc/kernel/head_40x.S
> index 926bfa73586a..5b282d9965a5 100644
> --- a/arch/powerpc/kernel/head_40x.S
> +++ b/arch/powerpc/kernel/head_40x.S
> @@ -620,7 +620,7 @@ _ENTRY(saved_ksp_limit)
>   	ori	r6, r6, swapper_pg_dir@l
>   	lis	r5, abatron_pteptrs@h
>   	ori	r5, r5, abatron_pteptrs@l
> -	stw	r5, 0xf0(r0)	/* Must match your Abatron config file */
> +	stw	r5, 0xf0(0)	/* Must match your Abatron config file */
>   	tophys(r5,r5)
>   	stw	r6, 0(r5)
>   
> 
