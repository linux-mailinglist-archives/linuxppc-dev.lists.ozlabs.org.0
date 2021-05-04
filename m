Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6628F372680
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 09:22:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FZBBb3FHlz30C4
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 17:22:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=rzD5MGIA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mo4-p00-ob.smtp.rzone.de (client-ip=85.215.255.25;
 helo=mo4-p00-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256
 header.s=strato-dkim-0002 header.b=rzD5MGIA; 
 dkim-atps=neutral
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [85.215.255.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FZBB45Vpbz2xy4
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 May 2021 17:22:18 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; t=1620112901; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=gl9Ud4NRUmw5QhmGf0a0Bl5sT/wOvupoj9+75xiVgUEElrUSAxtn+Karh3i1E9l2ZC
 yPvZzqgf9Et3cUx0ZNq7K+yYphZ+/5n3aiyCsNegMliF3/RsZCjcEYr3mLeNN+kmEyPY
 lyxuB3GpaiYdziHdIytsPGvqWyO4JyIpu5W1w63As0jt19qbRL8SQHGnES573ehqwdwG
 Auvu+br10BoRb0wpF+3M3N/gzxDQFs7pfIZ64oSA72adbPmtV7LTnrKg/+SM4v6YQete
 1a+YKappJFrsIvEYum1NRy79BWNAdqeiznNwaSbUPG2sxo+/KFrZoqNx9dDm1BaAD9fb
 T6jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1620112901;
 s=strato-dkim-0002; d=strato.com;
 h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
 From:Subject:Sender;
 bh=SeRWJcY22N8vA/eSwrxt6X04jCByJQO6O4AWm6Ah48k=;
 b=jllDf/oPSw1etyC1Jf+XR9kGNrk9yRIKaQAGJ6WZnS5HVAp58Q8t4HGGmDcax7yPQg
 5rKZnKlTYC3WuVzLylunQF3Knn0Eifj3toX7XaDw4qa8AwlibXALunUusfnB8SqBvsfF
 U1l9KIykHq/4n6ZRc+rRGGXegSoX/N8ur0QiowRqXs5cC+a46Ypi0m6cKByrSbdq267C
 JG4b2mIevg0SB7XWU2/J8xwsPRPfjx04TnmLl1dIlcYO+dIKW3Z8nK5VU799pF+NGJkc
 W/J54/4IQ8FnX6CgJe63mDq3ZAYCclnB0q9g8hsTFrCbmlJdxfY1IMs4JaFSAvCkXk53
 H5IQ==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1620112901;
 s=strato-dkim-0002; d=xenosoft.de;
 h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
 From:Subject:Sender;
 bh=SeRWJcY22N8vA/eSwrxt6X04jCByJQO6O4AWm6Ah48k=;
 b=rzD5MGIA0nGwMXe0HjicDzNY8e2EsYGczEUdbVDJcd4BzhjpaqtoJWweVr9ALIBkzI
 dCg+mjLzvm3r6ZG9bD+/S1RYJPmL02kZBwKseL3fI29a47JdiosKgCAIdqDLOOFuTpp9
 lF/KbcxezO7f14hQLLc1lzLn6iP+u+d26/wiK5fDeTiQinNKLxDJ9lIFPmR417j/jmyz
 cRTUzqLBOicX+tlAWfGA7fMgicdpPCIv0i6mEBMDxQrCphlpBOOr1TfDnTGvEwkywpXJ
 nEM3RbZCo7FJL093FMzxrFNbGF9poA7HiC1uL52TLNKfoqiQRJRHisGphNXPRrVHrpuD
 zlZg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBJSrwuuqxvPhSIhsJhhV/a8MrHM5J4CoqSoOzBQ=="
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2a02:8109:89c0:ebfc:14dd:6e8f:db34:91bd]
 by smtp.strato.de (RZmta 47.25.6 AUTH)
 with ESMTPSA id Z0324bx447Ld2G7
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 4 May 2021 09:21:39 +0200 (CEST)
Subject: Re: [FSL P50x0] Xorg always restarts again and again after the the
 PowerPC updates 5.13-1
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>
References: <3eedbe78-1fbd-4763-a7f3-ac5665e76a4a@xenosoft.de>
 <c5b0ac7c-525f-0208-7587-c90427eae137@xenosoft.de>
 <0886c1dc-e946-69cb-a0a9-57247acfd080@csgroup.eu>
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Message-ID: <9864cd72-f1aa-4cf5-1cda-b3a10233b24d@xenosoft.de>
Date: Tue, 4 May 2021 09:21:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <0886c1dc-e946-69cb-a0a9-57247acfd080@csgroup.eu>
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

Hi Christophe,

Thanks for your answer but I think I don't know how it works with the 
cherry-pick.

$ git bisect start
$ git bisect good 68a32ba14177d4a21c4a9a941cf1d7aea86d436f
$ git bisect bad c70a4be130de333ea079c59da41cc959712bb01c

Bisecting: 2462 revisions left to test after this (roughly 11 steps)
[47a6959fa331fe892a4fc3b48ca08e92045c6bda] netfilter: allow to turn off 
xtables compat layer

$ git cherry-pick 525642624783
error: could not apply 525642624783... powerpc/signal32: Fix erroneous 
SIGSEGV on RT signal return
hint: after resolving the conflicts, mark the corrected paths
hint: with 'git add <paths>' or 'git rm <paths>'
hint: and commit the result with 'git commit'

How can I fix this error?

Thanks,
Christian

On 04 May 2021 at 06:56 am, Christophe Leroy wrote:
>
>
> Le 04/05/2021 à 00:25, Christian Zigotzky a écrit :
>> Hello,
>>
>> Xorg always restarts again and again after the the PowerPC updates 
>> 5.13-1 [1] on my FSL P5040 Cyrus+ board (A-EON AmigaOne X5000) [2]. 
>> Xorg doesn't start anymore in a virtual e5500 QEMU machine [3].
>>
>> I bisected today [4].
>>
>> Result: powerpc/signal32: Convert do_setcontext[_tm]() to user access 
>> block (887f3ceb51cd34109ac17bfc98695162e299e657) [5] is the first bad 
>> commit.
>>
>> Please find attached the kernel config.
>>
>> Please check the first bad commit.
>
> I'm not sure you can conclude anything here. There is a problem in 
> that commit, but it is fixed by 525642624783 ("powerpc/signal32: Fix 
> erroneous SIGSEGV on RT signal return") which is the last commit of 
> powerpc-5.13-1.
>
> So any bisect from there will for sure point to 887f3ceb51cd 
> ("powerpc/signal32: Convert do_setcontext[_tm]() to user access 
> block") but that's unconclusive. If the problem is still there at the 
> HEAD of powerpc-5.13-1, the problem is likely somewhere else.
>
> I think you need to do the bisect again with a cherry-pick of 
> 525642624783 at each step.
>
> Thanks
> Christophe
>
>
>>
>> Thanks,
>> Christian
>>
>> [1] 
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=c70a4be130de333ea079c59da41cc959712bb01c 
>>
>> [2] http://wiki.amiga.org/index.php?title=X5000
>> [3] qemu-system-ppc64 -M ppce500 -cpu e5500 -m 1024 -kernel uImage 
>> -drive format=raw,file=fedora28-2.img,index=0,if=virtio -netdev 
>> user,id=mynet0 -device virtio-net-pci,netdev=mynet0 -append "rw 
>> root=/dev/vda" -device virtio-vga -usb -device usb-ehci,id=ehci 
>> -device usb-tablet -device virtio-keyboard-pci -smp 4 -vnc :1
>> [4] 
>> https://forum.hyperion-entertainment.com/viewtopic.php?p=53101#p53101
>> [5] 
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=887f3ceb51cd34109ac17bfc98695162e299e657 
>>

