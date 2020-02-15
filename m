Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DADD15FD6B
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Feb 2020 08:57:31 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48KMzW3QGkzDqrW
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Feb 2020 18:57:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48KMxY2VN4zDqc7
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Feb 2020 18:55:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=lWnzkanJ; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 48KMxX4Fmnz8t3s
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Feb 2020 18:55:44 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 48KMxX3tvXz9sRJ; Sat, 15 Feb 2020 18:55:44 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=lWnzkanJ; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 48KMxV1MhZz9s29
 for <linuxppc-dev@ozlabs.org>; Sat, 15 Feb 2020 18:55:39 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48KMxL0z7Bz9tyyY;
 Sat, 15 Feb 2020 08:55:34 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=lWnzkanJ; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Ohijlj9EmPxk; Sat, 15 Feb 2020 08:55:34 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48KMxK710Gz9tyyX;
 Sat, 15 Feb 2020 08:55:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1581753334; bh=Nonxu5wG4WZ7jYvTRz/o5M5NGhp+dzlJyp69BL0gkJU=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=lWnzkanJdLmuszlpBvhRsrGUBo0hJM/YtQvhKBbshRIJxnAMiVRkmzLVBVcf54IPU
 7YED6wGv8PRORXv9EQM+2U5bkiGiqm62CK4Ftko06Lbwar/gNiSBcA9dzucGS6i2we
 V5PdQV/iSczQQmkAxGb/btJFCCZP7vXfsCTU9Ee8=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E94668B781;
 Sat, 15 Feb 2020 08:55:34 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id ekLtMYsgoD0p; Sat, 15 Feb 2020 08:55:34 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 87DB68B755;
 Sat, 15 Feb 2020 08:55:34 +0100 (CET)
Subject: Re: RESEND: Re: Problem booting a PowerBook G4 Aluminum after commit
 cd08f109 with CONFIG_VMAP_STACK=y
To: Larry Finger <Larry.Finger@lwfinger.net>
References: <f7565b89-c8b2-d2e7-929e-4b1abf72fc63@lwfinger.net>
 <159ed5d8-376b-1642-fb4b-01406d671cf1@c-s.fr>
 <6a1802b8-c6a7-d091-1036-689e089b786f@lwfinger.net>
 <f35ea4e6-7c54-6acc-7d91-3a6eea56133c@c-s.fr>
 <608a1a18-a0ed-2059-bfbc-081c9ef1bfd8@lwfinger.net>
 <a8a38651-974a-819a-810c-83c4097adc10@c-s.fr>
 <7f63e8a8-95c5-eeca-dc79-3c13f4d98d39@lwfinger.net>
 <9429f86e-8c7d-b2e6-6dc1-8f58c44baadc@c-s.fr>
 <2da19b26-9a44-2e4e-ab7d-d3fff65091bd@lwfinger.net>
 <02ce1278-5880-063c-2281-178edd541232@c-s.fr>
 <f3f628ca-4085-e9c2-2c62-170cf9801ac2@lwfinger.net>
 <074f2468-1fbe-0714-df58-b6d2e1d2725b@c-s.fr>
 <04c1c725-6360-1663-c6ae-a4c7611dc385@lwfinger.net>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <5f4b7426-0989-7723-8993-4a0aaa71b592@c-s.fr>
Date: Sat, 15 Feb 2020 08:55:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <04c1c725-6360-1663-c6ae-a4c7611dc385@lwfinger.net>
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
Cc: "linuxppc-dev@ozlabs.org" <linuxppc-dev@ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 15/02/2020 à 03:42, Larry Finger a écrit :
> Christophe,
> 
> On 2/14/20 1:35 PM, Christophe Leroy wrote:
>> --- a/arch/powerpc/kernel/head_32.S
>> +++ b/arch/powerpc/kernel/head_32.S
>> @@ -270,6 +270,9 @@ __secondary_hold_acknowledge:
>>    * pointer when we take an exception from supervisor mode.)
>>    *    -- paulus.
>>    */
>> +#ifdef CONFIG_PPC_CHRP
>> +1:    b    machine_check_in_rtas
>> +#endif
>>       . = 0x200
>>       DO_KVM  0x200
>>   MachineCheck:
>> @@ -290,12 +293,9 @@ MachineCheck:
>>   7:    EXCEPTION_PROLOG_2
>>       addi    r3,r1,STACK_FRAME_OVERHEAD
>>   #ifdef CONFIG_PPC_CHRP
>> -    bne    cr1,1f
>> +    bne    cr1,1b
>>   #endif
>>       EXC_XFER_STD(0x200, machine_check_exception)
>> -#ifdef CONFIG_PPC_CHRP
>> -1:    b    machine_check_in_rtas
>> -#endif

I'll need to make it a bit different because it shoehorns into your 
config but won't fit if CONFIG_KVM_BOOK3S_32 is added.

>>
>>   /* Data access exception. */
>>       . = 0x300
> 
> With the above changes and all the other patches applied, the machine 
> finally boots. It is so bloody slow that it takes a long time to do 
> anything, but you finally got all the places that needed patches. I 
> really lost track of how many bugs were fixed in the process, but I can 
> now put that old box aside until time for v5.7.0-rc1. As you can tell, 
> it only gets used to verify that PPC32 is working on real G4 hardware. 
> It has no real value for any other function.

Yes, I don't have a G4 myself but this is so much nested with other 
stuff for the powerpc 83xx than we can't avoid the changes impacting the 
G4 and other hash-MMU based PPC32 allthough the changes I'm doing are 
not targetted at those platform at first. And as the 83xx is a 603 core, 
it is non-hash so all hash related things can't be verified. Plus all 
those small parts like power saving, RTAS, etc... which are more specific.
And checking with all possible options is also not easy.

VMAP-STACK was really a challenging functionnality, I'm happy it made 
its way to mainline though.

> 
> Thanks for the help,

Thanks to you for testing and for your patience.

Christophe
