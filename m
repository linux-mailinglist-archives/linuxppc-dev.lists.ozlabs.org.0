Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F6C10C4B9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Nov 2019 09:09:02 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47NqzH1mz0zDqkX
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Nov 2019 19:08:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="dyDBE4cz"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Nqww27MnzDqSw
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Nov 2019 19:06:56 +1100 (AEDT)
Received: from localhost (mailhub1-ext [192.168.12.233])
 by localhost (Postfix) with ESMTP id 47Nqwq3STlz9ty0Y;
 Thu, 28 Nov 2019 09:06:51 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=dyDBE4cz; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id mgpN2mQI7JlB; Thu, 28 Nov 2019 09:06:51 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 47Nqwq2FZrz9ty0T;
 Thu, 28 Nov 2019 09:06:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1574928411; bh=r0UjyHYvteSzLuUih/qEKzzmGw4ED7wqOOic8C4w5SA=;
 h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
 b=dyDBE4czf+EVa7HddAfrip5wNrdAXpxfQppTvkKZyv4sMXgEaMYcWNXHWKi0ttugQ
 0Dpwk6SvIFZ+81slLnonUt1xeydEFkqqtVamutMVtyiFLsrpP7zWzfliuQTw5OurYG
 USk2sUpqVviGeSmwEBSlYaNiEcG53eDCKpSWMb0M=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 40CA28B787;
 Thu, 28 Nov 2019 09:06:52 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id TDIdejapCBoz; Thu, 28 Nov 2019 09:06:52 +0100 (CET)
Received: from [172.25.230.103] (po15451.idsi0.si.c-s.fr [172.25.230.103])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1CD438B767;
 Thu, 28 Nov 2019 09:06:52 +0100 (CET)
Subject: Re: [PATCH v1 1/4] powerpc/fixmap: don't clear fixmap area in
 paging_init()
From: Christophe Leroy <christophe.leroy@c-s.fr>
To: Michael Ellerman <patch-notifications@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, npiggin@gmail.com, hch@infradead.org
References: <47MQrc6TCxz9sPV@ozlabs.org>
 <bedbd52f-9eea-7253-e28b-68e01a848405@c-s.fr>
Message-ID: <51c97c23-251d-90d9-0c52-41ef55c9f4c9@c-s.fr>
Date: Thu, 28 Nov 2019 09:06:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <bedbd52f-9eea-7253-e28b-68e01a848405@c-s.fr>
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



Le 27/11/2019 à 15:43, Christophe Leroy a écrit :
> 
> 
> Le 26/11/2019 à 02:13, Michael Ellerman a écrit :
>> On Thu, 2019-09-12 at 13:49:41 UTC, Christophe Leroy wrote:
>>> fixmap is intended to map things permanently like the IMMR region on
>>> FSL SOC (8xx, 83xx, ...), so don't clear it when initialising paging()
>>>
>>> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
>>
>> Applied to powerpc next, thanks.
>>
>> https://git.kernel.org/powerpc/c/f2bb86937d86ebcb0e52f95b6d19aba1d850e601
>>
> 
> Hi,
> 
> What happened ?
> 
> It looks like it is gone in today's powerpc next.
> 

I see it back today in powerpc/merge, thanks.

The issue is it is crashing with HIGHMEM, indeed exactly the same as you 
saw with "[PATCH] powerpc/8xx: Fix permanently mapped IMMR region.", 
since that was exactly the same code.

I sent a fix for it, and I also rebased "[PATCH] powerpc/8xx: Fix 
permanently mapped IMMR region." into v2 to exclude from it the already 
merged part.

It would be wise if you could merge both.

Thanks
Christophe
