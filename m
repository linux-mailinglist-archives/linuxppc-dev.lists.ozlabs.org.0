Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CDB254D15
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Aug 2020 20:30:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BcrrF0SFvzDqDf
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Aug 2020 04:30:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bcrny6690zDqJP
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Aug 2020 04:28:22 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4Bcrns2JKYz9vCq7;
 Thu, 27 Aug 2020 20:28:17 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 4x7wEfdWC28Q; Thu, 27 Aug 2020 20:28:17 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4Bcrns1WvPz9vCq6;
 Thu, 27 Aug 2020 20:28:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 060FE8B8A5;
 Thu, 27 Aug 2020 20:28:17 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id cgqvSafQGO_I; Thu, 27 Aug 2020 20:28:16 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BDA238B886;
 Thu, 27 Aug 2020 20:28:16 +0200 (CEST)
Subject: Re: kernel since 5.6 do not boot anymore on Apple PowerBook
To: Giuseppe Sacco <giuseppe@sguazz.it>, linuxppc-dev@lists.ozlabs.org
References: <89e412a76350b28f791bb8a2b6f9647a034f6fc8.camel@sguazz.it>
 <e6878657490aa34b54b3daf0430073078a9840e7.camel@sguazz.it>
 <b70a6343-a380-ff08-a401-04f9ab50be6b@csgroup.eu>
 <59de290b-4b6c-a55e-9289-e640473b1382@csgroup.eu>
 <3558dadc530a60e9e3f958f0d6d4a0f28958ae86.camel@sguazz.it>
 <a62714c0-1b17-305d-577d-529e1781ec56@csgroup.eu>
 <8ce38d9bb162268f53a2292a916c44579421e552.camel@sguazz.it>
 <5158eae8-6809-ae07-0d16-58f2a766f534@csgroup.eu>
 <c707f59d379a51b83ba52e796d137887219c32fc.camel@sguazz.it>
 <f96d336d-fb81-fe9d-9890-db57c6560e85@csgroup.eu>
 <e7a620fa7521e84e2010660b87f20dd24a3b0cd4.camel@sguazz.it>
 <65baad98-79a0-5ee4-521e-5327029de459@csgroup.eu>
 <0a18fc199cef2643bd07591205a6234c2edf6c95.camel@sguazz.it>
 <afd75c134e2c4a57f8cf1f064595455e67b17e41.camel@sguazz.it>
 <cab15033beeefa317aae40370664e108f57dc050.camel@sguazz.it>
 <afae7efd-0d8a-5672-7b75-9394b0ff3d3c@csgroup.eu>
 <37c4253abc08ef3e93d67cae5b92252af96fcf65.camel@sguazz.it>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <3d171af2-90d5-aeb7-6a32-471daceaf5ed@csgroup.eu>
Date: Thu, 27 Aug 2020 20:28:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <37c4253abc08ef3e93d67cae5b92252af96fcf65.camel@sguazz.it>
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



Le 27/08/2020 à 16:37, Giuseppe Sacco a écrit :
> Il giorno gio, 27/08/2020 alle 12.39 +0200, Christophe Leroy ha
> scritto:
>> Hi,
>>
>> Le 27/08/2020 à 10:28, Giuseppe Sacco a écrit :
> [...]
>>> Sorry, I made a mistake. The real problem is down, on the same
>>> function, when it calls low_sleep_handler(). This is where the problem
>>> probably is.
>>
>> Great, you spotted the problem.
>>
>> I see what it is, it is in low_sleep_handler() in
>> arch/powerpc/platforms/powermac/sleep.S
>>
>> All critical registers are saved on the stack. At restore, they are
>> restore BEFORE re-enabling MMU (because they are needed for that). But
>> when we have VMAP_STACK, the stack can hardly be accessed without the
>> MMU enabled. tophys() doesn't work for virtual stack addresses.
>>
>> Therefore, the low_sleep_handler() has to be reworked for using an area
>> in the linear mem instead of the stack.
> 
> I am sorry, but I don't know how to fix it. Should I open a bug for
> tracking this problem?

Yes please, at https://github.com/linuxppc/issues/issues

In the meantime, I have sent a patch to disable CONFIG_VMAP_STACK when 
CONFIG_ADB_PMU is selected until this is fixed.

Have you tried without CONFIG_ADB_PMU ? Or does it make no sense ?

Christophe
