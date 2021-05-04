Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 79FF1372741
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 10:30:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FZCj44GwGz30D9
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 18:30:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=MSI6d3nm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mo4-p00-ob.smtp.rzone.de (client-ip=85.215.255.20;
 helo=mo4-p00-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256
 header.s=strato-dkim-0002 header.b=MSI6d3nm; 
 dkim-atps=neutral
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [85.215.255.20])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FZChW3lk2z2xYt
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 May 2021 18:30:17 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; t=1620116982; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=KflHQ4aGul8HCs2egcS+iDXWPg8RzubI4a2hoOBRJ73dOe98LoI8gO4wniqHwdGNvr
 F25PeRHwCtxlzIgl1pE/PaNxx3aAP6u71m+xeqnQU9m2AwvRfn/fOyyM6Hwfbq01G4Fd
 1mn3DR/qE0WaDJerB6i3XlQcVMT+H4vhiR1cwyYtaXbjBVvXyxY6sWr+GmOezIrZZB+m
 UC9bDW5Jpa1sPt5wBAPlfJE+m1kjgMy/rjT26u/pLGVDWHR6S1u21rxLNuY8nWkystA0
 EhJBHLFf0TC4RcM9AYfIqgTpRCO/ujfPmqZGCHoA5hiaM6PbZqqv7cJq3SRl20WKJt2U
 GmOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1620116982;
 s=strato-dkim-0002; d=strato.com;
 h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
 From:Subject:Sender;
 bh=em+8YYe9In9BiERf0mzKfA5MiyZ3aldSQGnxUgzcQBs=;
 b=njQDT+vasNdr1gYM+HsR22p0IAEeO4FuXzAOru5UhX8LtjXmsgm5SUeUEgPnA4pTEv
 uWYZvajtvcQ5wPkuYs0mHfQh/hjkh2fNH5+jbkjtMegN5GN0/t4y2ikbfsFRO4f1BMXI
 4NlT89fmXAK0R7kRWN5ehvRzH2cnJenOKfQ/Xj220ciCBUORsO1/ZAxQweT3g8zoOINK
 Ryt6PEfOMfshFNH9pG0C7TLyvQ0LJpORSS7bTi6STXRzJPaVF3jQyCTVaDXcxF7+qip7
 Rz3F+PDZJ9jX1wYqb1FYkoup6qxGMJeOTTiP1oUCjxUK1YcuSzwq9p1dpp76BMWvzK9i
 X+Ow==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1620116982;
 s=strato-dkim-0002; d=xenosoft.de;
 h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
 From:Subject:Sender;
 bh=em+8YYe9In9BiERf0mzKfA5MiyZ3aldSQGnxUgzcQBs=;
 b=MSI6d3nmbR2TztIz33WasAXJm95i4ouxNqZmZT2juYj4B43TgQThsLAwRHEyuA975H
 WzbpHVBevYlL5OrxJFHUOptoeEsFjVF4vGliTgSZalJruRF8ZiQE/+vTKjZW78QQNK93
 ZNJ8/jIT/h/Wky4IacuRI2jNuvAW4RAJ1SwUNbitT2p1qVwfmaA7hYmt6Vs86cNmn/9o
 X8K0tG0xh2hpEUkm8yCnfxp/BJx/etbZhD80iYoHoutMapftDkQA3ciTVRFlHWA5EieU
 o4olo3S8/J7Vl4KDBwXIjUugCl6NlSe/CUlFgz55qU1416OkYrDGU8851ubjemEMgk2v
 8CtQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBJSrwuuqxvPhSIhsJhhV/a8MrHM5J4CoqSoOzBQ=="
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2a02:8109:89c0:ebfc:14dd:6e8f:db34:91bd]
 by smtp.strato.de (RZmta 47.25.6 AUTH)
 with ESMTPSA id D075c0x448Tf0TH
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 4 May 2021 10:29:41 +0200 (CEST)
Subject: Re: [FSL P50x0] Xorg always restarts again and again after the the
 PowerPC updates 5.13-1
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>
References: <3eedbe78-1fbd-4763-a7f3-ac5665e76a4a@xenosoft.de>
 <c5b0ac7c-525f-0208-7587-c90427eae137@xenosoft.de>
 <0886c1dc-e946-69cb-a0a9-57247acfd080@csgroup.eu>
 <9864cd72-f1aa-4cf5-1cda-b3a10233b24d@xenosoft.de>
 <1b0307be-05cd-ab62-8b22-75ffb59ff76b@csgroup.eu>
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Message-ID: <daace050-6233-77ea-4517-0fd3c4b21057@xenosoft.de>
Date: Tue, 4 May 2021 10:29:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1b0307be-05cd-ab62-8b22-75ffb59ff76b@csgroup.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: de-DE
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

On 04 May 2021 at 09:47am, Christophe Leroy wrote:
> Hi
>
> Le 04/05/2021 à 09:21, Christian Zigotzky a écrit :
>> Hi Christophe,
>>
>> Thanks for your answer but I think I don't know how it works with the 
>> cherry-pick.
>>
>> $ git bisect start
>
> As you suspect the problem to be specific to powerpc, I can do
>
> git bisect start -- arch/powerpc
>
>
>> $ git bisect good 68a32ba14177d4a21c4a9a941cf1d7aea86d436f
>> $ git bisect bad c70a4be130de333ea079c59da41cc959712bb01c
>
> You said that powerpc-5.13-1 is bad so you can narrow the search I think:
>
> git bisect bad powerpc-5.13-1
> git bisect good 887f3ceb51cd3~
I tried it but without any success.

git bisect bad powerpc-5.13-1

Output:
fatal: Needed a single revision
Bad rev input: powerpc-5.13-1

Maybe we should look in the PowerPC updates directly. The CPUs of the 
AmigaOne X5000 and virtual e5500 QEMU machine belong to BookE cpu 
family. The AmigaOne X1000 isn't affected by this issue because the PA6T 
belongs to the Book3S cpu family. [1]

I found this in the PowerPC updates 5.13-1:  - Convert 64-bit BookE to 
do interrupt entry/exit in C.

Maybe we should look more in the modified BookE files:

arch/powerpc/kernel/head_booke.h [2]
arch/powerpc/kernel/head_fsl_booke.S [3]

Please check the BookE commits in the PowerPC updates 5.13-1. You don't 
need an AmigaOne X5000 for testing because the virtual e5500 QEMU 
machine is also affected.

Thanks,
Christian

[1] https://www.kernel.org/doc/Documentation/powerpc/cpu_families.txt
[2] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/diff/arch/powerpc/kernel/head_booke.h?id=c70a4be130de333ea079c59da41cc959712bb01c
[3] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/diff/arch/powerpc/kernel/head_fsl_booke.S?id=c70a4be130de333ea079c59da41cc959712bb01c


>
>
>>
>> Bisecting: 2462 revisions left to test after this (roughly 11 steps)
>> [47a6959fa331fe892a4fc3b48ca08e92045c6bda] netfilter: allow to turn 
>> off xtables compat layer
>>
>> $ git cherry-pick 525642624783
>> error: could not apply 525642624783... powerpc/signal32: Fix 
>> erroneous SIGSEGV on RT signal return
>> hint: after resolving the conflicts, mark the corrected paths
>> hint: with 'git add <paths>' or 'git rm <paths>'
>> hint: and commit the result with 'git commit'
>>
>> How can I fix this error?
>
> This problably means that the step is at a commit which is prior to 
> the first bad commit you identified at previous step. If you narrow 
> the bisect as explained above, it shouldn't happen unless git decides 
> it needs to descend a branch to a merge point. In that case just do 
> 'git cherry-pick --abort" and go without the fix.
>
> Note that once you have cherry picked the fix and tested the result, 
> you have to apply the result to HEAD~ (the commit before the 
> cherry-pick).
> - git bisect good HEAD~
> - git bisect bad HEAD~
>
> Christophe

