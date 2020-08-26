Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB20253A38
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Aug 2020 00:22:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BcL2h6QgpzDqRY
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Aug 2020 08:22:36 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BcL116vf0zDqQ6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Aug 2020 08:21:06 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4Bc1px5vTgz9txfZ;
 Wed, 26 Aug 2020 12:11:21 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id AKkxJx-9QG5l; Wed, 26 Aug 2020 12:11:21 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4Bc1pl4n1zz9v2Jj;
 Wed, 26 Aug 2020 12:11:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E81658B83E;
 Wed, 26 Aug 2020 12:11:12 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id C8kRB_EXGZGs; Wed, 26 Aug 2020 12:11:12 +0200 (CEST)
Received: from [192.168.204.43] (unknown [192.168.204.43])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5897A8B838;
 Wed, 26 Aug 2020 12:11:12 +0200 (CEST)
Subject: Re: kernel since 5.6 do not boot anymore on Apple PowerBook
To: Giuseppe Sacco <giuseppe@sguazz.it>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <89e412a76350b28f791bb8a2b6f9647a034f6fc8.camel@sguazz.it>
 <990279c219476c4d513df52454adf583de32641a.camel@sguazz.it>
 <211a35b02193ae79a201d4d567fe1d7a53a979f5.camel@sguazz.it>
 <639a48d1-815b-33f1-3c9e-cd9ca8ec41b1@csgroup.eu>
 <aab7a9fefe9ccfa272fbc45eeaa8228fced14d3b.camel@sguazz.it>
 <498426507489f2c8e32daaf7af1105b5adba552f.camel@sguazz.it>
 <c2a89243-6135-4edd-2c1c-42c2159b5a1e@csgroup.eu>
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
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <87b46754-db63-fa71-bbea-35ac9c8931ce@csgroup.eu>
Date: Wed, 26 Aug 2020 12:10:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <e7a620fa7521e84e2010660b87f20dd24a3b0cd4.camel@sguazz.it>
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

Hello Giuseppe,

Le 24/08/2020 à 22:48, Giuseppe Sacco a écrit :
> Hello Christophe,
> 
> Il giorno lun, 24/08/2020 alle 07.17 +0200, Christophe Leroy ha
> scritto:
>> Hello Giuseppe,
> [...]
>> The Oopses in the video are fixed in 5.9-rc2, see my response to your
>> other mail.
> 
> Right, I just updated from git and rebuilt the kernel whith
> CONFIG_VMAP_STACK not set and the machine boots correctly.
> 
>> So now we know that your kernel doesn't boot when CONFIG_VMAP_STACK is set.
>> Can you remind the exact problem ?
> 
> latest kernel with CONFIG_VMAP_STACK set stops after writing:
> pmac32_cpufreq: registering PowerMac CPU frequency driver
> pmac32_cpufreq: Low: 667 MHz, High: 867 Mhz, Boot: 667 MHz
> 
>> One common problem with CONFIG_VMAP_STACK is when some drivers are
>> invalidly using buffers in stack for DMA.
>>
>> Couldn't try with CONFIG_DEBUG_VIRTUAL (without CONFIG_VMAP_STACK) and
>> see if it triggers some warnings ?
> 
> I've just tried: it boots without any special warning. What should I
> look for? This is an excerpt of dmesg output about the line it would
> otherwise stop:

If there is no warning, then the issue is something else, bad luck.

Could you increase the loglevel and try again both with and without 
VMAP_STACK ? Maybe we'll get more information on where it stops.

Christophe

> 
> [...]
> [    6.566984] PowerMac i2c bus pmu 2 registered
> [    6.574879] PowerMac i2c bus pmu 1 registered
> [    6.582634] PowerMac i2c bus mac-io 0 registered
> [    6.590323] i2c i2c-2: No i2c address for /pci@f2000000/mac-io@17/i2c@18000/i2c-modem
> [    6.598290] PowerMac i2c bus uni-n 1 registered
> [    6.606196] i2c i2c-3: i2c-powermac: modalias failure on /uni-n@f8000000/i2c@f8001000/cereal@1c0
> [    6.614320] PowerMac i2c bus uni-n 0 registered
> [    6.622501] pmac32_cpufreq: Registering PowerMac CPU frequency driver
> [    6.630580] pmac32_cpufreq: Low: 667 Mhz, High: 867 Mhz, Boot: 667 Mhz
> [    6.639518] ledtrig-cpu: registered to indicate activity on CPUs
> [    6.647894] NET: Registered protocol family 10
> [    6.656492] Segment Routing with IPv6
> [    6.664490] mip6: Mobile IPv6
> [    6.672337] NET: Registered protocol family 17
> [    6.680213] mpls_gso: MPLS GSO support
> [...]
> 
> Bye,
> Giuseppe
> 
