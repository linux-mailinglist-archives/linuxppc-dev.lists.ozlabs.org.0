Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E614C07D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jun 2019 20:05:55 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45TXtl28QrzDqsx
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 04:05:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="jVD1AiET"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45TXrP2bBfzDqnK
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2019 04:03:48 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45TXrK2rM4z9v3gr;
 Wed, 19 Jun 2019 20:03:45 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=jVD1AiET; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 0ivfhnAFLmlc; Wed, 19 Jun 2019 20:03:45 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45TXrK1h0pz9v3gk;
 Wed, 19 Jun 2019 20:03:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1560967425; bh=hF9uyl1Y0uCKyuJ+ZrmdhspkTLdfLpici3IxoVzljMI=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=jVD1AiET+kjqbxCYVaMWkFP8+pj5DY7tazAxx6cwAonrw2TaxwBiC8Dijj9jPg4Da
 j67hDj1L4Muq8Am5L7yqmFAkTdzs+QqkvfGeXHRrfwvfqN6TOcHtjOmsDiCxlk9FDi
 2W1R69pBruoDdXf0Wfi7hCTde0+hzB7yKJAHjJTg=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2016D8B952;
 Wed, 19 Jun 2019 20:03:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id EIDmk4IZlZqv; Wed, 19 Jun 2019 20:03:45 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4B1EE8B92B;
 Wed, 19 Jun 2019 20:03:44 +0200 (CEST)
Subject: Re: [PATCH v5 2/2] powerpc: Fix compile issue with force DAWR
To: Michael Neuling <mikey@neuling.org>, mpe@ellerman.id.au
References: <20190604030037.9424-1-mikey@neuling.org>
 <20190604030037.9424-2-mikey@neuling.org>
 <e20b2d44-508c-7d06-1af8-b608563b8c57@c-s.fr>
 <3426e38c9028694f2ea55f6adaf3b679a1bce19f.camel@neuling.org>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <3bdfdc0c-62e3-6495-7a8c-601294e2db0c@c-s.fr>
Date: Wed, 19 Jun 2019 20:03:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <3426e38c9028694f2ea55f6adaf3b679a1bce19f.camel@neuling.org>
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
Cc: Mathieu Malaterre <malat@debian.org>, hch@infradead.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 19/06/2019 à 03:11, Michael Neuling a écrit :
> On Tue, 2019-06-18 at 18:28 +0200, Christophe Leroy wrote:
>>
>> Le 04/06/2019 à 05:00, Michael Neuling a écrit :
>>> If you compile with KVM but without CONFIG_HAVE_HW_BREAKPOINT you fail
>>> at linking with:
>>>     arch/powerpc/kvm/book3s_hv_rmhandlers.o:(.text+0x708): undefined
>>> reference to `dawr_force_enable'
>>>
>>> This was caused by commit c1fe190c0672 ("powerpc: Add force enable of
>>> DAWR on P9 option").
>>>
>>> This moves a bunch of code around to fix this. It moves a lot of the
>>> DAWR code in a new file and creates a new CONFIG_PPC_DAWR to enable
>>> compiling it.
>>
>> After looking at all this once more, I'm just wondering: why are we
>> creating stuff specific to DAWR ?
>>
>> In the old days, we only add DABR, and everything was named on DABR.
>> When DAWR was introduced some years ago we renamed stuff like do_dabr()
>> to do_break() so that we could regroup things together. And now we are
>> taking dawr() out of the rest. Why not keep dabr() stuff and dawr()
>> stuff all together in something dedicated to breakpoints, and try to
>> regroup all breakpoint stuff in a single place ? I see some
>> breakpointing stuff done in kernel/process.c and other things done in
>> hw_breakpoint.c, to common functions call from one file to the other,
>> preventing GCC to fully optimise, etc ...
>>
>> Also, behing this thinking, I have the idea that we could easily
>> implement 512 bytes breakpoints on the 8xx too. The 8xx have neither
>> DABR nor DAWR, but is using a set of comparators. And as you can see in
>> the 8xx version of __set_dabr() in kernel/process.c, we emulate the DABR
>> behaviour by setting two comparators. By using the same comparators with
>> a different setup, we should be able to implement breakpoints on larger
>> ranges of address.
> 
> Christophe
> 
> I agree that their are opportunities to refactor this code and I appreciate your
> efforts in making this code better but...
> 
> We have a problem here of not being able to compile an odd ball case that almost
> no one ever hits (it was just an odd mpe CI case). We're up to v5 of a simple
> fix which is just silly.
> 
> So let's get this fix in and move on to the whole bunch of refactoring we can do
> in this code which is already documented in the github issue tracking.
> 

Agreed.

I've filed the following issue to keep that in mind: 
https://github.com/linuxppc/issues/issues/251

Thanks
Christophe
