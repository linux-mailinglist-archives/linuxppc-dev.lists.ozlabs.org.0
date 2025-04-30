Return-Path: <linuxppc-dev+bounces-8200-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 417C5AA5418
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Apr 2025 20:50:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZnmTr0SWfz30FR;
	Thu,  1 May 2025 04:50:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.236.30
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746039039;
	cv=none; b=gAhohYKRG0I6KqbJriGI3D7LC92SxTNvPDrkbYTKvcgGeAWYgOYIv8hRNks6c4xyoFMcByr8r3AV9zBC/R4vv7qtOhxoOeKsCDA1IWTgu78jUGZrWX16kUhKhWetT6zdnfjSHtC9r409UrvABcNtxyeY1YR7GKKrP/8w6wmqSDZXhYTwSVwCsHzyYkAalH1K2Pp0G9cFty2G+HZ3K6huXlEfgQrQCV965cUCDBygstANiKIw8PUbJqTgt9MgGIkV3VDA4gASbB/O4dkKMc0G9a6aqpXLTrwFMZ3REvbmdtKxPM3ZHrR3BT4/J0XLuPyD+d3rLecEjVr6tQeQ586/mg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746039039; c=relaxed/relaxed;
	bh=e4GfuViYu1S6Ic9Uu/5hYYRojiQ9WsDZUINmkSqic+c=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=gBPpIqwJtkKUAdiQmOXOepfh5NThWhZr43DB90A/kNQxAqJ8wIaH8E8Edpql+fj/Nt6jVqvql59e8j8c7oOiT6J7XvH0KlwuybTZ5pakCWTSVsfPiqFpdpo/mtszWOQcifYLm1JSBaOUcuh61BWgO9Yh1/5eeA9Rad2YgbYRdIdbfvz92ImTiyorQUO51zzZrZ9AfgeW+vWvpiAlr0nBtt4PPwRuIp3gF/9/gaYjfP43ePziGXY4pQkWZSQFfDdwi7oSvG696YKp83hdDaeNbYkuX1P6hAvCpbR83xSMVSQE2bU6Zm6WlHqIpC80OOcrOGkWzMEBm/K4l/YoivZDfQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZnmTq2Zr8z2yrN
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 May 2025 04:50:37 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4ZnmGk2w83z9sCk;
	Wed, 30 Apr 2025 20:41:02 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FM7RGdNUMMJk; Wed, 30 Apr 2025 20:41:02 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4ZnmGk26Sfz9s9J;
	Wed, 30 Apr 2025 20:41:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 44A8B8B765;
	Wed, 30 Apr 2025 20:41:02 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 4VwDMcawMpJC; Wed, 30 Apr 2025 20:41:02 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 0484D8B763;
	Wed, 30 Apr 2025 20:41:01 +0200 (CEST)
Message-ID: <222574fc-42b2-4925-8ce5-f60e926f7d0c@csgroup.eu>
Date: Wed, 30 Apr 2025 20:41:01 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: segmentation fault when stepping multi-threaded application
To: Tomas Alvarez Vanoli <tomas.alvarez-vanoli@hitachienergy.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <DB9PR06MB7849819F8C6A43108E66C610C2812@DB9PR06MB7849.eurprd06.prod.outlook.com>
 <d8911b8a-94a4-4ede-8e58-8de3afeccf3f@csgroup.eu>
 <DB9PR06MB78494431B8D974B1BF69A077C2832@DB9PR06MB7849.eurprd06.prod.outlook.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <DB9PR06MB78494431B8D974B1BF69A077C2832@DB9PR06MB7849.eurprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 30/04/2025 à 15:18, Tomas Alvarez Vanoli a écrit :
> [Vous ne recevez pas souvent de courriers de tomas.alvarez-vanoli@hitachienergy.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> 
>> Am I missing something ?
> 
> Apologies for that, I made a mistake. The board is based off T1040, with e5500.
> Previous report affected two of our products, the one from the previous report and the one I am reporting now.
> 
> Since I wrote the email I was able to also reproduce a crash when stepping 3 times and then continuing, but in that case the problematic address always comes from r2.

Is it only when using gdbserver, or does it also happen when using gdb 
directly on the board ?

Christophe

> 
> Tomas Alvarez Vanoli
> R&D Embedded Software Developer
> -----Original Message-----
> From: Christophe Leroy <christophe.leroy@csgroup.eu>
> Sent: Wednesday, 30 April 2025 14:52
> To: Tomas Alvarez Vanoli <tomas.alvarez-vanoli@hitachienergy.com>; linuxppc-dev@lists.ozlabs.org
> Subject: Re: segmentation fault when stepping multi-threaded application
> 
> [You don't often get email from christophe.leroy@csgroup.eu. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> Warning
> 
> This email comes from outside of Hitachi Energy. Make sure you verify the sender before clicking any links or downloading/opening attachments.
> If this email looks suspicious, report it by clicking 'Report Phishing' button in Outlook.
> See the SecureWay group in Yammer for more security information.
> 
> Le 28/04/2025 à 13:16, Tomas Alvarez Vanoli a écrit :
>> [Vous ne recevez pas souvent de courriers de
>> tomas.alvarez-vanoli@hitachienergy.com. Découvrez pourquoi ceci est
>> important à https://aka.ms/LearnAboutSenderIdentification ]
>>
>> Hello, I am writing because I have a segmentation fault when remote-debugging a PPC 32-bit target with gdbserver.
>> This is the same platform described in
>> 'https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flor%2F&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C2df4f9b0c64549c4a53008dd87e9762b%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638816158963370369%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=iVjUSjuMm9L%2FAax1TKElszuYIQzZWteTG1Dt02xcIow%3D&reserved=0
>> e.kernel.org%2Flinuxppc-dev%2Fdc38afe9-6b78-f3f5-666b-986939e40fc6%40k
>> eymile.com%2F&data=05%7C02%7Ctomas.alvarez-vanoli%40hitachienergy.com%
>> 7Cd48fefc550ab4077b24508dd87e5be03%7C7831e6d9dc6c4cd19ec61dc2b4133195%
>> 7C0%7C0%7C638816142997141092%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiO
>> nRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%
>> 3D%3D%7C60000%7C%7C%7C&sdata=InfI5W80oeLQMPkx9yc8zDgYvGdazTUUW5hwP8%2B
>> o6UM%3D&reserved=0', although the bug does not seem to be the same and
>> the position of the thread struct does not affect it.
>>
>> The segmentation fault message is the following:
>>
>> tomcli[135]: User access of kernel address (dffbdf10) - exploit
>> attempt? (uid: 0)
>>
>>
>> gdbserver is sometimes unresponsive, although sometimes I am able to kill it with CTRL+C.
>> The code I use to reproduce this (tomcli) is the same as my colleague sent back in 2016:
>>
>>
>>
>> This can be reproduced always by starting the debug session, stepping 5 times and then issuing a continue.
>> Sometimes just a continue will do.
>> This error is also happening sporadically when running our main application under gdbserver, we get a segmentation fault in dl_fixup.
>> It never happens during normal runtime.
>>
>> The address that the kernel complains about is coming from pt_regs->gpr[3]. This value is put in the register in a call to PTRACE_SINGLESTEP (value 9).
>>
>> I poked around the ptrace code a bit, seeing if there were any possible overflows but I could not find anything, so maybe I'm barking up the wrong tree, although it does seem to be related to ptrace.
>>
>> I also added a dump_stack before the "exploit attempt" message:
>>
>> CPU: 3 PID: 135 Comm: tomcli Not tainted
>> 6.1.133-00564-g0c302b26a2c4-dirty #0 Hardware name: name,prodname
>> e5500 0x80241021 CoreNet Generic
> 
> In the begining you say it is the same platform as the other report.
> When I follow the link I understand that platform is a 83xx.
> 
> Here it is a e5500.
> 
> Am I missing something ?
> 
> Christophe
> 


