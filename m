Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1353116FF39
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 13:46:13 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48SFsZ1VnfzDqLW
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 23:46:10 +1100 (AEDT)
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
 header.s=mail header.b=TVIuVPWY; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48SDwt5X6RzDqd7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2020 23:03:58 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48SDwn4BNRz9txW1;
 Wed, 26 Feb 2020 13:03:53 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=TVIuVPWY; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id lCvgd2pa5vu2; Wed, 26 Feb 2020 13:03:53 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48SDwn0prvz9txVB;
 Wed, 26 Feb 2020 13:03:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1582718633; bh=YsrrIHLg54stOepFXBRgikAxSaN1wN0118dC6ZDyX+c=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=TVIuVPWYYObz7bFtspZ7AEeCpP5kxKkwF2WO/rjg4YwesPkasnICmfabfpcWewoGN
 clFqU1YAZrxAsJgFiGuwlGvIyc3k3nHBfxUNDlIZ2GDpp+K93H4h78R9mo7GwbUV2c
 Z1QV6m+Uc1QoXlGM4xholmOsi0WCQ9vYxuWy3dRc=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4A9DE8B844;
 Wed, 26 Feb 2020 13:03:54 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id p6O_in8XQ8e7; Wed, 26 Feb 2020 13:03:54 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6DB5B8B776;
 Wed, 26 Feb 2020 13:03:53 +0100 (CET)
Subject: Re: [RFC PATCH v2 00/12] Reduce ifdef mess in ptrace
To: Michael Ellerman <mpe@ellerman.id.au>, Michael Neuling <mikey@neuling.org>
References: <cover.1561735587.git.christophe.leroy@c-s.fr>
 <f62b0f67-c418-3734-0b07-65aea7537a78@c-s.fr>
 <7b86733f81c7e15d81ab14b98c8998011ed54880.camel@neuling.org>
 <5b5d8f61-c9aa-1afd-6001-44a17f00c1a6@c-s.fr>
 <8736b01cjb.fsf@mpe.ellerman.id.au>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <310bc462-2c07-67f4-5e30-3acb02f25245@c-s.fr>
Date: Wed, 26 Feb 2020 13:03:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <8736b01cjb.fsf@mpe.ellerman.id.au>
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
Cc: Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 24/02/2020 à 11:54, Michael Ellerman a écrit :
> Christophe Leroy <christophe.leroy@c-s.fr> writes:
>> Le 24/02/2020 à 03:15, Michael Neuling a écrit :
>>> Christophe,
>>>> Le 28/06/2019 à 17:47, Christophe Leroy a écrit :
>>>>> The purpose of this series is to reduce the amount of #ifdefs
>>>>> in ptrace.c
>>>>
>>>> Any feedback on this series which aims at fixing the issue you opened at
>>>> https://github.com/linuxppc/issues/issues/128 ?
>>>
>>> Yeah, sorry my bad. You did all the hard work and I ignored it.
>>>
>>> I like the approach and is a long the lines I was thinking. Putting it in a
>>> ptrace subdir, splitting out adv_debug_regs, TM, SPE, Alitivec, VSX.
>>> ppc_gethwdinfo() looks a lot nicer now too (that was some of the worst of it).
>>>
>>> I've not gone through it with a fine tooth comb though. There is (rightly) a lot
>>> of code moved around which could have introduced some issues.
>>>
>>> It applies on v5.2 but are you planning on updating it to a newer base?
>>>
>>
>> As you noticed there is a lot of code moved around, and rebasing
>> produces a lot of conflicts. So I didn't want to spend hours to rebase
>> and rebase without being sure it was the right approach.
>>
>> Now that I got a positive feedback I'll consider rebasing it, hopping
>> that Michael will pick it up.
> 
> I would love to.
> 

Great.

Just sent v3 out.

Christophe
