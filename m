Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A58B95688
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 07:11:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46CJn747FdzDr1C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 15:11:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="iK5h35DW"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46CJl83VsSzDqlX
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2019 15:10:09 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46CJky58BGz9tyvg;
 Tue, 20 Aug 2019 07:10:02 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=iK5h35DW; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id oP4J9rGVqrDA; Tue, 20 Aug 2019 07:10:02 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46CJky3k81z9tyvd;
 Tue, 20 Aug 2019 07:10:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1566277802; bh=/UI9QJC3ZH9u+c1qny2Oir9/BEulbaJcTlOTBJsWOEE=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=iK5h35DWBOvWbtHP97XrIp76nbRp3qzumgVgE4pAfbzMUiZBEtGiKvSfXD+WUmsAG
 8rhOEt0AVk0fchtyAediLNzIWJfpf16ApPGhgnS9tTV7W71VUNjtaZ0B6SJ1Q8IsXI
 7ghzLiEH4bryT2ravrGh7HehNGYGOWOft9kfwn1k=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 281E38B782;
 Tue, 20 Aug 2019 07:10:04 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id nK8vtjC-v5h3; Tue, 20 Aug 2019 07:10:04 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B85C98B756;
 Tue, 20 Aug 2019 07:10:03 +0200 (CEST)
Subject: Re: [PATCH v1 05/10] powerpc/mm: Do early ioremaps from top to bottom
 on PPC64 too.
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
 <npiggin@gmail.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
References: <6bc35eca507359075528bc0e55938bc1ce8ee485.1565726867.git.christophe.leroy@c-s.fr>
 <019c5d90f7027ccff00e38a3bcd633d290f6af59.1565726867.git.christophe.leroy@c-s.fr>
 <1566221500.6f5zxv68dm.astroid@bobo.none>
 <87r25g662n.fsf@concordia.ellerman.id.au>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <fdfc4c49-d6b9-4458-2465-666a2e10680d@c-s.fr>
Date: Tue, 20 Aug 2019 07:10:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <87r25g662n.fsf@concordia.ellerman.id.au>
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



Le 20/08/2019 à 02:20, Michael Ellerman a écrit :
> Nicholas Piggin <npiggin@gmail.com> writes:
>> Christophe Leroy's on August 14, 2019 6:11 am:
>>> Until vmalloc system is up and running, ioremap basically
>>> allocates addresses at the border of the IOREMAP area.
>>>
>>> On PPC32, addresses are allocated down from the top of the area
>>> while on PPC64, addresses are allocated up from the base of the
>>> area.
>>   
>> This series looks pretty good to me, but I'm not sure about this patch.
>>
>> It seems like quite a small divergence in terms of code, and it looks
>> like the final result still has some ifdefs in these functions. Maybe
>> you could just keep existing behaviour for this cleanup series so it
>> does not risk triggering some obscure regression?
> 
> Yeah that is also my feeling. Changing it *should* work, and I haven't
> found anything that breaks yet, but it's one of those things that's
> bound to break something for some obscure reason.
> 
> Christophe do you think you can rework it to retain the different
> allocation directions at least for now?
> 

Yes I have started addressing the comments I received, and I think for 
now I'll keep all the machinery aside from the merge. Not sure yet if 
I'll leave it in pgtables_32/64.c or if I'll add ioremap_32/64.c

Christophe
