Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3020944B0EE
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Nov 2021 17:13:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HpY230Bd6z3cB1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Nov 2021 03:13:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HpY1c54hnz2yK3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Nov 2021 03:13:22 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4HpY1V1gm2z9sSJ;
 Tue,  9 Nov 2021 17:13:18 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rY5l2W1lpe1v; Tue,  9 Nov 2021 17:13:18 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4HpY1V0vl4z9sSG;
 Tue,  9 Nov 2021 17:13:18 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0A9418B77A;
 Tue,  9 Nov 2021 17:13:18 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id G4AVCO6bIdsl; Tue,  9 Nov 2021 17:13:17 +0100 (CET)
Received: from [192.168.233.192] (unknown [192.168.233.192])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 827828B767;
 Tue,  9 Nov 2021 17:13:17 +0100 (CET)
Message-ID: <be6d1ed3-010c-b5c3-6359-dbb695950b03@csgroup.eu>
Date: Tue, 9 Nov 2021 17:13:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [FSL P50x0] Cyrus+ board doesn't boot with the PowerPC updates
 5.16-1
Content-Language: fr-FR
To: Christian Zigotzky <chzigotzky@xenosoft.de>
References: <3eedbe78-1fbd-4763-a7f3-ac5665e76a4a@xenosoft.de>
 <15731ad7-83ff-c7ef-e4a1-8b11814572c2@xenosoft.de>
 <17e37b22-5839-0e3a-0dbf-9c676adb0dec@xenosoft.de>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <17e37b22-5839-0e3a-0dbf-9c676adb0dec@xenosoft.de>
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
Cc: Darren Stevens <darren@stevens-zone.net>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 mad skateman <madskateman@gmail.com>, Matthew Leaman <matthew@a-eon.biz>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 08/11/2021 à 15:48, Christian Zigotzky a écrit :
> Hi Christophe,
> 
> The Cyrus+ board with FSL P50x0 SoC [1] doesn't boot with the PowerPC 
> updates 5.16-1 [2].
> 
> I was able to revert the new PowerPC updates 5.16-1 [2]. After a new 
> compiling, the kernel boots without any problems on the Cyrus+ board.
> 
> I bisected today [3]. 52bda69ae8b5102fe08c9db10f4a1514478e07d3 
> (powerpc/fsl_booke: Tell map_mem_in_cams() if init is done) [4] is the 
> first bad commit.

Yes, the bad commit is obviously ... bad.

That commit should have just added an additional argument set to 'true' 
while not changing anything else.

Apparently it went wrong in mm/nohash/tlb.c

I will send a fixup early next week as I'm AFK at the moment.


Christophe
