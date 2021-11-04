Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D5644575E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Nov 2021 17:40:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HlTsY2gCsz3bXV
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Nov 2021 03:40:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HlTs34CwJz2xtK
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Nov 2021 03:40:20 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4HlTrt5QXgz9sSw;
 Thu,  4 Nov 2021 17:40:14 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XvoEAsy_BhrJ; Thu,  4 Nov 2021 17:40:14 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4HlTrn0xn4z9sSl;
 Thu,  4 Nov 2021 17:40:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0BC078B781;
 Thu,  4 Nov 2021 17:40:09 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id qwL6sSqOlkTV; Thu,  4 Nov 2021 17:40:08 +0100 (CET)
Received: from [192.168.233.108] (po17922.idsi0.si.c-s.fr [192.168.233.108])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id AB3DD8B763;
 Thu,  4 Nov 2021 17:40:08 +0100 (CET)
Message-ID: <a1e6c282-c8fd-9671-5df6-cd7ca06fdbb3@csgroup.eu>
Date: Thu, 4 Nov 2021 17:40:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: Fwd: Fwd: X stopped working with 5.14 on iBook
Content-Language: fr-FR
To: Finn Thain <fthain@linux-m68k.org>,
 "Christopher M. Riedl" <cmr@linux.ibm.com>
References: <6919111c-02fa-c6b9-bb05-04161e52f340@yahoo.com>
 <27ad38f3-c1a8-ac5c-8467-f311b5882a00@yahoo.com>
 <d5d0b396-7408-bdae-cf50-4b5f4e7b3184@csgroup.eu>
 <48c3ed15-2ecf-cc12-c287-2b61457f5fb@nippy.intranet>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <48c3ed15-2ecf-cc12-c287-2b61457f5fb@nippy.intranet>
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
Cc: Stan Johnson <stanley.johnson.001@protonmail.com>,
 linuxppc-dev@lists.ozlabs.org, Riccardo Mottola <riccardo.mottola@libero.it>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 02/11/2021 à 03:20, Finn Thain a écrit :
> Hi Christopher,
> 
> After many builds and tests, Stan and I were able to determine that this
> regression only affects builds with CONFIG_USER_NS=y. That is,
> 
> d3ccc9781560  + CONFIG_USER_NS=y  -->  fail
> d3ccc9781560  + CONFIG_USER_NS=n  -->  okay
> d3ccc9781560~ + CONFIG_USER_NS=y  -->  okay
> d3ccc9781560~ + CONFIG_USER_NS=n  -->  okay
> 
> Stan also tested a PowerMac G3 system and found that the regression is not
> present there. Thus far, only PowerMac G4 systems are known to be affected
> (Stan's Cube and Riccardo's PowerBook).
> 
> I asked Stan to try v5.15-rc after reverting commit d3ccc9781560.
> Unexpectedly, this build had the same issue. So, it appears there are
> multiple bad commits that produce this Xorg failure, of which d3ccc9781560
> is just the first.
> 
> But there's no easy way to identify the other bad commits using bisection.
> So I've addressed this message to you. Can you help fix this regression?
> 

I'm wondering if this commit is really the cause of the problem.

Are you using GCC 11 ?

If yes, I think it could be a false positive, fixed by 
https://github.com/linuxppc/linux/commit/7315e457d6bc

Can you try with GCC 10 or older ?

Can you cherry pick 7315e457d6bc ("powerpc/uaccess: Fix __get_user() 
with CONFIG_CC_HAS_ASM_GOTO_OUTPUT") on top of d3ccc9781560 and see what 
happens ?

Thanks
Christophe

