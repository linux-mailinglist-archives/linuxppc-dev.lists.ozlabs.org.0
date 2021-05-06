Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 79DAA37508F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 May 2021 10:09:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FbR7k3s69z30Gg
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 May 2021 18:09:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FbR7H32WJz304R
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 May 2021 18:09:11 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4FbR784Hqpz9sTC;
 Thu,  6 May 2021 10:09:08 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lAZD1k47T6gl; Thu,  6 May 2021 10:09:08 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4FbR783HTCz9sSD;
 Thu,  6 May 2021 10:09:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 378D98B7F6;
 Thu,  6 May 2021 10:09:08 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id sp9gSccG3Nsj; Thu,  6 May 2021 10:09:08 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B31138B7EC;
 Thu,  6 May 2021 10:09:07 +0200 (CEST)
Subject: Re: [FSL P50x0] Xorg always restarts again and again after the the
 PowerPC updates 5.13-1
To: Christian Zigotzky <chzigotzky@xenosoft.de>
References: <b5a2b9b7-6f1e-8dcb-8466-053b8ff8241d@csgroup.eu>
 <B67668EF-EDC8-45F9-A340-5B453065166C@xenosoft.de>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <1b0134d4-4235-b294-8112-dcd5468564bf@csgroup.eu>
Date: Thu, 6 May 2021 10:09:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <B67668EF-EDC8-45F9-A340-5B453065166C@xenosoft.de>
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
Cc: Darren Stevens <darren@stevens-zone.net>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 mad skateman <madskateman@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

Le 06/05/2021 à 09:56, Christian Zigotzky a écrit :
> Hi Christophe,
> 
> Ok, so let's summarise from my side.
> 
> The issue is in the PowerPC updates 5.13-1. I reverted these and after that the issue is gone.
> We know that only BookE machines are affected. Book3S machines are working with the PowerPC updates.
> I think it’s not directly an Xorg issue. It’s more a symptom that Xorg restarts again and again. In my point of view the changes for BookE machines in the PowerPC updates are responsible for this issue.
> Bisecting costs a lot of time and I don’t have time for my main work anymore.
> Bisecting is good but sometime you have to check your code yourself. We know all facts and now it’s time to check the code because of BookE compatibility.
> 
> @All
> You can test it with QEMU as well. I provide some virtual machines and kernels for testing. Guys, it is really important that you test your changes before you release them.
> 


So, summary from my side:

You popped up telling that commit 887f3ceb51cd was the reason of your problem. As I am the one who 
released that commit, I took a look, and identified that 525642624783 should have fixed it.

You are working with a 64 bits kernel. My domain is 32 bits kernels.

I have no problem at all with corenet64_smp_defconfig booting QEMU with any of the commits you pointed.

On my side QEMU doesn't work at all with the configuration you provided, I don't get any output at 
all on the screen.


So how can we progress ?

I know bisecting is not always easy, and for sure you must have spend a lot of time with all those 
skipped steps. But it provided us good information anyway and I'm sure we could progress quickly if 
you can do the few tests I suggested in my last email:

- Can you check that 887f3ceb51cd with cherry-picked 525642624783 has Xorg working ?
- Can you bisect between 887f3ceb51cd[good] and 56bec2f9d4d0[bad] to identify first bad commit that 
stops after loading the dtb and uImage ?
- Once that first bad commit is identified, can you check whether the preceeding commit with 
cherry-picked 525642624783 has Xorg working or not ?

Thanks
Christophe
