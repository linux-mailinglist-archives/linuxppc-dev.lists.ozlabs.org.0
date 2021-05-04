Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B55293726C7
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 09:48:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FZBlz5txvz301N
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 17:48:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FZBlZ4fjFz2xg5
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 May 2021 17:47:51 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4FZBlS6PTqz9sVn;
 Tue,  4 May 2021 09:47:48 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jHQZDkb4alYJ; Tue,  4 May 2021 09:47:48 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4FZBlS5QbQz9sVk;
 Tue,  4 May 2021 09:47:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9ED418B78E;
 Tue,  4 May 2021 09:47:48 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id uIAc0z8p2UAN; Tue,  4 May 2021 09:47:48 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D89C28B78D;
 Tue,  4 May 2021 09:47:47 +0200 (CEST)
Subject: Re: [FSL P50x0] Xorg always restarts again and again after the the
 PowerPC updates 5.13-1
To: Christian Zigotzky <chzigotzky@xenosoft.de>,
 Michael Ellerman <mpe@ellerman.id.au>
References: <3eedbe78-1fbd-4763-a7f3-ac5665e76a4a@xenosoft.de>
 <c5b0ac7c-525f-0208-7587-c90427eae137@xenosoft.de>
 <0886c1dc-e946-69cb-a0a9-57247acfd080@csgroup.eu>
 <9864cd72-f1aa-4cf5-1cda-b3a10233b24d@xenosoft.de>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <1b0307be-05cd-ab62-8b22-75ffb59ff76b@csgroup.eu>
Date: Tue, 4 May 2021 09:47:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <9864cd72-f1aa-4cf5-1cda-b3a10233b24d@xenosoft.de>
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
Cc: Darren Stevens <darren@stevens-zone.net>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 mad skateman <madskateman@gmail.com>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi

Le 04/05/2021 à 09:21, Christian Zigotzky a écrit :
> Hi Christophe,
> 
> Thanks for your answer but I think I don't know how it works with the cherry-pick.
> 
> $ git bisect start

As you suspect the problem to be specific to powerpc, I can do

git bisect start -- arch/powerpc


> $ git bisect good 68a32ba14177d4a21c4a9a941cf1d7aea86d436f
> $ git bisect bad c70a4be130de333ea079c59da41cc959712bb01c

You said that powerpc-5.13-1 is bad so you can narrow the search I think:

git bisect bad powerpc-5.13-1
git bisect good 887f3ceb51cd3~


> 
> Bisecting: 2462 revisions left to test after this (roughly 11 steps)
> [47a6959fa331fe892a4fc3b48ca08e92045c6bda] netfilter: allow to turn off xtables compat layer
> 
> $ git cherry-pick 525642624783
> error: could not apply 525642624783... powerpc/signal32: Fix erroneous SIGSEGV on RT signal return
> hint: after resolving the conflicts, mark the corrected paths
> hint: with 'git add <paths>' or 'git rm <paths>'
> hint: and commit the result with 'git commit'
> 
> How can I fix this error?

This problably means that the step is at a commit which is prior to the first bad commit you 
identified at previous step. If you narrow the bisect as explained above, it shouldn't happen unless 
git decides it needs to descend a branch to a merge point. In that case just do 'git cherry-pick 
--abort" and go without the fix.

Note that once you have cherry picked the fix and tested the result, you have to apply the result to 
HEAD~ (the commit before the cherry-pick).
- git bisect good HEAD~
- git bisect bad HEAD~

Christophe
