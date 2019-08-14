Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 739668CBEE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2019 08:34:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 467fty5GLjzDqFY
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2019 16:34:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="v4fvDBec"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 467fqM0L1SzDqQl
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2019 16:31:09 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 467fqC1T99z9vBnC;
 Wed, 14 Aug 2019 08:31:03 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=v4fvDBec; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id OFXo1Dmho6YZ; Wed, 14 Aug 2019 08:31:03 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 467fqC0JdJz9vBn6;
 Wed, 14 Aug 2019 08:31:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1565764263; bh=o0Ho+62546nbF6sTKppM2s/M3fQa2Iw6rs5C/Kza5oo=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=v4fvDBecJnGu3IBMhD6I0eiVnfWdBEsRvUzNX/d4GbnaFiqgHchGI8bNd9Cc6NIS9
 T3xPOiYGKPMLyzVyCUNlsQC7aO1cpwqasiqNc0coKJv1xo42HkxFRArnbH1hzFbiPo
 IxdFvApZ9FSsrG/9NjQWZ+weHyQOMyO7Wk/Jq3gA=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1131F8B780;
 Wed, 14 Aug 2019 08:31:04 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id xnRS7rzmM81g; Wed, 14 Aug 2019 08:31:04 +0200 (CEST)
Received: from [172.25.230.101] (po15451.idsi0.si.c-s.fr [172.25.230.101])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E1D788B761;
 Wed, 14 Aug 2019 08:31:03 +0200 (CEST)
Subject: Re: [PATCH v4 1/2] powerpc/time: Only set
 CONFIG_ARCH_HAS_SCALED_CPUTIME on PPC64
To: Nicholas Piggin <npiggin@gmail.com>
References: <d9ac8da98f53debb4758b98d0227979aca9196f7.1528292284.git.christophe.leroy@c-s.fr>
 <20180607114304.327c4ab5@roar.ozlabs.ibm.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <26969bb5-c01b-0674-5773-027f1851bd44@c-s.fr>
Date: Wed, 14 Aug 2019 08:31:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20180607114304.327c4ab5@roar.ozlabs.ibm.com>
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
Cc: Frederic Weisbecker <fweisbec@gmail.com>, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Nick,


Le 07/06/2018 à 03:43, Nicholas Piggin a écrit :
> On Wed,  6 Jun 2018 14:21:08 +0000 (UTC)
> Christophe Leroy <christophe.leroy@c-s.fr> wrote:
> 
>> scaled cputime is only meaningfull when the processor has
>> SPURR and/or PURR, which means only on PPC64.
>>

[...]

> 
> I wonder if we could make this depend on PPC_PSERIES or even
> PPC_SPLPAR as well? (That would be for a later patch)

Can we go further on this ?

Do we know exactly which configuration support scaled cputime, in 
extenso have SPRN_SPURR and/or SPRN_PURR ?

Ref https://github.com/linuxppc/issues/issues/171

Christophe
