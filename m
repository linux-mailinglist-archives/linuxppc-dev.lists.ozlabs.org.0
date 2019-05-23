Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E9427A06
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2019 12:07:35 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 458lYJ6FQszDqjQ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2019 20:07:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="sHCaIKEV"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 458lX61GkpzDqbh
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 May 2019 20:06:30 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 458lX13N2Hz9v2C7;
 Thu, 23 May 2019 12:06:25 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=sHCaIKEV; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id IHmgRpOMqNDR; Thu, 23 May 2019 12:06:25 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 458lX128n9z9v2C5;
 Thu, 23 May 2019 12:06:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1558605985; bh=piPL88MQTeJPHU0kv9VSj1lrWKo3xFh5bm5O/4FnNS8=;
 h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
 b=sHCaIKEVh6lsuUBH4SElIThGdctclAT1+57mAKK5IefBVM8DAcp9x1c/Nw6DB3O34
 H5EOfK1NhPY/imx8aAysgH060OW1Ls2w1z0v3oGJJtZKwWquawdqcBmNhe7cCGSJM/
 t7Wcyz7vwaEw08f3oRw8jMclvmbfJCj+ham96vWA=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 290368B85C;
 Thu, 23 May 2019 12:06:26 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 37_L5Cb609GL; Thu, 23 May 2019 12:06:26 +0200 (CEST)
Received: from po16846vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D65888B858;
 Thu, 23 May 2019 12:06:25 +0200 (CEST)
Subject: Re: Failure to boot G4: dt_headr_start=0x01501000
From: Christophe Leroy <christophe.leroy@c-s.fr>
To: Mathieu Malaterre <malat@debian.org>
References: <CA+7wUszwugJeS_x_ExaHPUb8p23D7Zo2f2qqXfLQwr8EiLsk2g@mail.gmail.com>
 <33ab57c7-294a-6ae4-d678-1490ce5b97f1@c-s.fr>
 <CA+7wUsywReRnB1ASdbVrNRkWyPkSKhruBKo57kX--1qmU8hv7A@mail.gmail.com>
 <9b6e027e-0fa0-e088-d9a3-47b005cbc356@c-s.fr>
 <CA+7wUsxOxvtsp511c63HK-=Wm22qyEtDcg=p4rfRD+n55UQmiQ@mail.gmail.com>
 <CA+7wUszcau+OBj+ZTr007_vuTJsOmT0izZ64_W98x1=MPLU6aA@mail.gmail.com>
 <9e5ef44d-259a-1f1a-bd6a-98abdae85da0@c-s.fr>
 <ba3a1c25-72ce-cfb4-67ac-df07584f57f5@c-s.fr>
Message-ID: <158e1855-62ef-baf6-4fff-f28131a7e095@c-s.fr>
Date: Thu, 23 May 2019 10:05:57 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <ba3a1c25-72ce-cfb4-67ac-df07584f57f5@c-s.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 05/23/2019 09:59 AM, Christophe Leroy wrote:
> 
> 
> On 05/23/2019 09:45 AM, Christophe Leroy wrote:
>>
>>
>> Le 23/05/2019 à 10:53, Mathieu Malaterre a écrit :
>>>> Commit id is:
>>>>
>>>> e93c9c99a629 (tag: v5.1) Linux 5.1
>>>>
>>>>> Did you try latest powerpc/merge branch ?
>>>>
>>>> Will try that next.
>>>
>>> I confirm powerpc/merge does not boot for me (same config). Commit id:
>>>
>>> a27eaa62326d (powerpc/merge) Automatic merge of branches 'master',
>>> 'next' and 'fixes' into merge
>>
>> I see in the config you sent me that you have selected CONFIG_KASAN, 
>> which is a big new stuff.
>>
>> Can you try without it ?
> 
> While building with your config, I get a huge amount of:
> 
> ppc-linux-ld: warning: orphan section `.data..LASAN0' from 
> `lib/xarray.o' being placed in section `.data..LASAN0'.
>    SORTEX  vmlinux
> 
> 
> 
> I see you have also selected CONFIG_LD_DEAD_CODE_DATA_ELIMINATION=y
> 
> I guess nobody have never tried both this and CONFIG_KASAN together on 
> ppc32. I'll give it a try.


And you also have CONFIG_FTRACE.

In a recent patch implementing KASAN on PPC64, Daniel says that KASAN 
and FTRACE don't go together well 
(https://patchwork.ozlabs.org/patch/1103826/)

If you find out that it works without KASAN, can you then try with KASAN 
but without FTRACE ?

Christophe

