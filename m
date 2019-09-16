Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B732B41AD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Sep 2019 22:20:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46XHfn5LjrzF3B3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Sep 2019 06:20:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="hVMA8BWM"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46XHcQ4mFwzDqrn
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Sep 2019 06:18:12 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46XHcG4XQtz9v0sm;
 Mon, 16 Sep 2019 22:18:06 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=hVMA8BWM; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id PiOu49LYUBUM; Mon, 16 Sep 2019 22:18:06 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46XHcG3Kwbz9v0sl;
 Mon, 16 Sep 2019 22:18:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1568665086; bh=Oc7QqPHRv6G+INGV1Il1EHOkAwSu+426AB7PrqORGOw=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=hVMA8BWMLx4Af6rO3TbEdlG8FAACNgino3PlfsJ6UbnnHqfodpDS47p3L0wv3bzdJ
 tWtTahLLvFF6DpMJ83xBvrK5i+bBzzrw5R41KVE6wA4+HCKiDHnmJzGq9SUIkd5x4A
 76snh5V+b6gSdxZ9XPoYKfvLqkGwS1tQfaUSxlYU=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 768C28B847;
 Mon, 16 Sep 2019 22:18:06 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id t6Ds54bdJKMc; Mon, 16 Sep 2019 22:18:06 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E00FE8B841;
 Mon, 16 Sep 2019 22:18:05 +0200 (CEST)
Subject: Re: [PATCH v2 2/2] powerpc/83xx: map IMMR with a BAT.
To: Scott Wood <oss@buserror.net>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 galak@kernel.crashing.org
References: <966e6d6a226f9786098d296239a6c65064e73a41.1568616151.git.christophe.leroy@c-s.fr>
 <7f8f9747ef1ab2e1261cf83b03c1da321d47f7b7.1568616151.git.christophe.leroy@c-s.fr>
 <71490f3b94b851106eb48c8909239f401d0018d1.camel@buserror.net>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <faa12987-1c3d-b554-de03-cb1be34112ad@c-s.fr>
Date: Mon, 16 Sep 2019 22:18:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <71490f3b94b851106eb48c8909239f401d0018d1.camel@buserror.net>
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



Le 16/09/2019 à 17:04, Scott Wood a écrit :
> On Mon, 2019-09-16 at 06:42 +0000, Christophe Leroy wrote:
>> @@ -145,6 +147,15 @@ void __init mpc83xx_setup_arch(void)
>>   	if (ppc_md.progress)
>>   		ppc_md.progress("mpc83xx_setup_arch()", 0);
>>   
>> +	if (!__map_without_bats) {
>> +		phys_addr_t immrbase = get_immrbase();
>> +		int immrsize = IS_ALIGNED(immrbase, SZ_2M) ? SZ_2M : SZ_1M;
>> +		unsigned long va = __fix_to_virt(FIX_IMMR_BASE);
> 
> Why __fix_to_virt() and not fix_to_virt()?
> 

Euh ... because I copy/pasted it from 
/arch/powerpc/include/asm/nohash/32/mmu-8xx.h

But yes I can do fix_to_virt() instead.

Christophe
