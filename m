Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5133515BDA3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Feb 2020 12:27:03 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48JDkD0p2fzDqVs
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Feb 2020 22:27:00 +1100 (AEDT)
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
 header.s=mail header.b=ORntJGy+; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48JDfp4mf6zDqSp
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Feb 2020 22:24:01 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48JDfh1z74z9vC0p;
 Thu, 13 Feb 2020 12:23:56 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=ORntJGy+; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id AyQazogu8umr; Thu, 13 Feb 2020 12:23:56 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48JDfh0nj1z9vC0n;
 Thu, 13 Feb 2020 12:23:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1581593036; bh=Yo2th5OUuIeJ85w0+/5q+x8tAlxdLuraDLJmFRgAewU=;
 h=Subject:To:References:Cc:From:Date:In-Reply-To:From;
 b=ORntJGy+/ZY2Y95ai+TtFNHJrsBFBqBOrF2rcbTC/nAHxoklf9n3RD20ZVozd2/aH
 WKWK9Q0QCEmqt4oqBrAxgXjJOGc66JbcmOP3bekq/XjXBps0zQobGvDuvIjbg2K4Ty
 URERdJwJeJYJ/JB4v1lkGYBnTRuLadXM1DFImLRg=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 54C408B841;
 Thu, 13 Feb 2020 12:23:57 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id ForvXfbpopuU; Thu, 13 Feb 2020 12:23:57 +0100 (CET)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 07B258B83F;
 Thu, 13 Feb 2020 12:23:56 +0100 (CET)
Subject: Re: Problem booting a PowerBook G4 Aluminum after commit cd08f109
 with CONFIG_VMAP_STACK=y
To: Larry Finger <Larry.Finger@lwfinger.net>
References: <f7565b89-c8b2-d2e7-929e-4b1abf72fc63@lwfinger.net>
 <159ed5d8-376b-1642-fb4b-01406d671cf1@c-s.fr>
 <6a1802b8-c6a7-d091-1036-689e089b786f@lwfinger.net>
 <f35ea4e6-7c54-6acc-7d91-3a6eea56133c@c-s.fr>
 <608a1a18-a0ed-2059-bfbc-081c9ef1bfd8@lwfinger.net>
 <a8a38651-974a-819a-810c-83c4097adc10@c-s.fr>
 <1787b507-dfbf-7801-f7d4-a1547e9bd588@lwfinger.net>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <02293587-2753-dbb1-73fe-d00ca08f2cf4@c-s.fr>
Date: Thu, 13 Feb 2020 11:23:56 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <1787b507-dfbf-7801-f7d4-a1547e9bd588@lwfinger.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 02/12/2020 11:02 PM, Larry Finger wrote:
> On 2/11/20 1:23 PM, Christophe Leroy wrote:
>>
>> Can you send me a picture of that BUG Unable to handle kernel data 
>> access with all the registers values etc..., together with the 
>> matching vmlinux ?
> 
> The vmlinux file was too big for your mailbox. You can download it from 
> http://www.lwfinger.com/download/vmlinux.gz
> 

Hi,

Is that the vmlinux that corresponds to:

	BUG Unable to handle kernel data access at 0x007a84fc.
	The faulting instruction address was 0x00013674

Nevertheless, do you have a picture of the said BUG/Oops to see all 
registers ?

Because here, the address 0x13674 is not a data access:

c00135ec <ppc6xx_idle>:
c00135ec:	3c 60 00 00 	lis     r3,0
c00135f0:	3c 60 00 80 	lis     r3,128
c00135f4:	3c 80 c0 83 	lis     r4,-16253
c00135f8:	80 84 f2 80 	lwz     r4,-3456(r4)
c00135fc:	80 84 00 0c 	lwz     r4,12(r4)
c0013600:	70 80 00 08 	andi.   r0,r4,8
c0013604:	41 82 00 18 	beq     c001361c <ppc6xx_idle+0x30>
c0013608:	3c 80 c0 84 	lis     r4,-16252
c001360c:	80 84 30 34 	lwz     r4,12340(r4)
c0013610:	2c 04 00 00 	cmpwi   r4,0
c0013614:	41 82 00 08 	beq     c001361c <ppc6xx_idle+0x30>
c0013618:	3c 60 00 40 	lis     r3,64
c001361c:	2c 03 00 00 	cmpwi   r3,0
c0013620:	4d 82 00 20 	beqlr
c0013624:	74 60 00 40 	andis.  r0,r3,64
c0013628:	41 82 00 30 	beq     c0013658 <ppc6xx_idle+0x6c>
c001362c:	7c 96 fa a6 	mfspr   r4,1014
c0013630:	54 84 00 3a 	rlwinm  r4,r4,0,0,29
c0013634:	7c 00 04 ac 	hwsync
c0013638:	7c 96 fb a6 	mtspr   1014,r4
c001363c:	7c 00 04 ac 	hwsync
c0013640:	4c 00 01 2c 	isync
c0013644:	3c 80 c0 00 	lis     r4,-16384
c0013648:	7c 00 20 ac 	dcbf    0,r4
c001364c:	7c 00 20 ac 	dcbf    0,r4
c0013650:	7c 00 20 ac 	dcbf    0,r4
c0013654:	7c 00 20 ac 	dcbf    0,r4
c0013658:	3c 80 c0 7c 	lis     r4,-16260
c001365c:	80 84 92 64 	lwz     r4,-28060(r4)
c0013660:	2c 04 00 00 	cmpwi   r4,0
c0013664:	41 82 00 10 	beq     c0013674 <ppc6xx_idle+0x88>
c0013668:	7c 91 fa a6 	mfspr   r4,1009
c001366c:	64 84 00 01 	oris    r4,r4,1
c0013670:	7c 91 fb a6 	mtspr   1009,r4
 >> c0013674:	7c 90 fa a6 	mfspr   r4,1008
c0013678:	3c a0 00 60 	lis     r5,96
c001367c:	64 a5 00 80 	oris    r5,r5,128
c0013680:	7c 84 28 78 	andc    r4,r4,r5
c0013684:	7c 84 1b 78 	or      r4,r4,r3
c0013688:	64 84 00 10 	oris    r4,r4,16
c001368c:	7c 90 fb a6 	mtspr   1008,r4
c0013690:	7e 00 06 6c 	dssall
c0013694:	7c 00 04 ac 	hwsync
c0013698:	81 02 00 04 	lwz     r8,4(r2)
c001369c:	61 08 00 01 	ori     r8,r8,1
c00136a0:	91 02 00 04 	stw     r8,4(r2)
c00136a4:	7c e0 00 a6 	mfmsr   r7
c00136a8:	60 e7 80 00 	ori     r7,r7,32768
c00136ac:	64 e7 00 04 	oris    r7,r7,4
c00136b0:	7c 00 04 ac 	hwsync
c00136b4:	7c e0 01 24 	mtmsr   r7
c00136b8:	4c 00 01 2c 	isync
c00136bc:	4b ff ff f4 	b       c00136b0 <ppc6xx_idle+0xc4>

Thanks
Christophe
