Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA245746132
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 19:13:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256 header.s=t20230301 header.b=sXg+tmLw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QvsvN4m92z3bcJ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jul 2023 03:13:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256 header.s=t20230301 header.b=sXg+tmLw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wanadoo.fr (client-ip=80.12.242.22; helo=smtp.smtpout.orange.fr; envelope-from=christophe.jaillet@wanadoo.fr; receiver=lists.ozlabs.org)
X-Greylist: delayed 201 seconds by postgrey-1.37 at boromir; Tue, 04 Jul 2023 03:12:34 AEST
Received: from smtp.smtpout.orange.fr (smtp-22.smtpout.orange.fr [80.12.242.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QvstV3QDDz3bTV
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jul 2023 03:12:34 +1000 (AEST)
Received: from [192.168.1.18] ([86.243.2.178])
	by smtp.orange.fr with ESMTPA
	id GMyvqgymIvjvzGMyvqofj8; Mon, 03 Jul 2023 19:05:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1688403900;
	bh=a0h2WeZR5ZIgLMFVFqtSFBNARYIIoqbQKR8GHb2Hk1Y=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To;
	b=sXg+tmLwyyU+9QNaWfn68yulpmL1kq+fXYVPAArQHDlnbvZIScYNW2GAKGI/DaKEs
	 +VDAMCIFqNyrigWnne5qQDi0o4DwHj38Le3kXcbLxKCVvnPvdjawbUqlIx0IjMLnKZ
	 ea5RsLXAuKPOywpW1aDtR23RziUjHKTwJx29/lW1WiW5vJPIlg0GF1DgeMMrsh8cAF
	 SO2qeyquh4BmL/6ZsvcI1nq4JgHIYknQ7QwQ+TTW1jFhjORnC1p6umd9Ww/ALZg2ia
	 92yVOHmNaGemXxKJGiIswhddDdsdpLN3lJTffc6r/N852rtaBHuXLhe6+3efFYKVZc
	 mrrmbr/Xgx59w==
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 03 Jul 2023 19:05:00 +0200
X-ME-IP: 86.243.2.178
Message-ID: <1854d8ec-0860-c8c1-bf16-572afda97ce0@wanadoo.fr>
Date: Mon, 3 Jul 2023 19:04:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] powerpc: powermac: Use of_get_cpu_hwid() to read CPU node
 'reg'
Content-Language: fr
From: Marion & Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Michael Ellerman <patch-notifications@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Rob Herring <robh@kernel.org>
References: <20230319145931.65499-1-robh@kernel.org>
 <168836201902.50010.13066091729121047041.b4-ty@ellerman.id.au>
 <f97e8c26-1379-dabc-21af-ebf4b06b31e7@wanadoo.fr>
In-Reply-To: <f97e8c26-1379-dabc-21af-ebf4b06b31e7@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 03/07/2023 à 19:01, Christophe JAILLET a écrit :
> Le 03/07/2023 à 07:26, Michael Ellerman a écrit :
>> On Sun, 19 Mar 2023 09:59:31 -0500, Rob Herring wrote:
>>> Replace open coded reading of CPU nodes' "reg" properties with
>>> of_get_cpu_hwid() dedicated for this purpose.
>>>
>>>
>>
>> Applied to powerpc/next.
>>
>> [1/1] powerpc: powermac: Use of_get_cpu_hwid() to read CPU node 'reg'
>>        
>> https://git.kernel.org/powerpc/c/bc1cf75027585f8d87f94e464ee5909acf885a8c
>>
>> cheers
>>
> 
> Hi,
> 
> I guess, that it does not really matter, but shouldn't the of_node_put() 
> be *after* the "reset_io = *rst;" statements to be absolutely safe?
> 
> 
> (This change is in my backlog and I have apparently never proposed it)

Well, in fact is was in:
https://lore.kernel.org/all/f2186955f310494f10990b5c402ada164d7834b8.1619188632.git.christophe.jaillet@wanadoo.fr/

> 
> CJ
> 
