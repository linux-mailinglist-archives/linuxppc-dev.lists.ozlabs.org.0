Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 68FB2373BA7
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 May 2021 14:45:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FZxJQ3VNFz309j
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 May 2021 22:45:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=gVcP9xqq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mo4-p02-ob.smtp.rzone.de (client-ip=85.215.255.84;
 helo=mo4-p02-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256
 header.s=strato-dkim-0002 header.b=gVcP9xqq; 
 dkim-atps=neutral
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de
 [85.215.255.84])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FZxHq5fcpz2yqC
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 May 2021 22:44:53 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; t=1620218638; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=qIT8BjxZouFvBMHRRiuTMxTUNj26Fdj6Sp+M7Q+oKyXu+5VubaTO55iSuQgCU9N8tg
 Z4kXcGOFaCY0gXOJxv6gjMH93xX6T1QHOgg5v05UQ6jRNXsEMfBr2YVsY4qCJu3zIU20
 lFwg0A4baqwS169e5LLOaQr5iGnBZyCOkmXfLIJOaV/2mwcBeRQVSzcUzru5ipDBSxNY
 My+aRSltsNRNUjtxc4qJMsm8uDGj9w7HZuAAesiyNq64rNFgU7lpXNdNaDC9XzUnJz8E
 mp4+s/BUQ/6Q5EHWHYFQmDHDxafVpFQg16ofTGb+l0fxBvO5LmR/nEzWtuzx8F1NbOLP
 BMwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1620218638;
 s=strato-dkim-0002; d=strato.com;
 h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
 From:Subject:Sender;
 bh=ixp2GY7flJuY1C3JaP9GQMkBHbsJZhjWmNt1blwpuHw=;
 b=VjZTG6FgekU5rFKmSnGwZj2VCHoiMnHSsviGJT0BrVa1tjb4Qiin6R277do5KnWQmT
 X1YiP7wg3hSmGmSQP+ppJ5jcV5NLToVQFTFuHEpJpqnCa9C3tMWQhxTvwCix9czABJTs
 neBcJuZIJIpCyqdM+i+w6E3vsZeZGyo/4+Q6F7+T4LuN3qZFnLJlTnMNtBS8w6aLeJjp
 kb9MfG/gpDKUYoaMo/ezSgbX+HBsXIi9kIOUVw2s3vMImgiUci3GsGqzhzxjrkcRKwgP
 RAMyH0kyxwGxigI+5JYKC+yF1NprFw/6dvvQSc3FS8G1mYKQSLzJ2IM47qf2J928G7fg
 ALEg==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1620218638;
 s=strato-dkim-0002; d=xenosoft.de;
 h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
 From:Subject:Sender;
 bh=ixp2GY7flJuY1C3JaP9GQMkBHbsJZhjWmNt1blwpuHw=;
 b=gVcP9xqqMXbPw6vGiUH3LZEoPt0w2xdel9RP2tILVsNwmfAx/ZQLDQQd0oXrS/81d6
 6VLvv23gEYFr9squmIiDQcF0nAtSF9DLd3oXKXQaZ9FY01dX2MJ6Hnvx+jJfbQIVQ3RP
 XyqBa8L0Itu1kdFp6Bmc1dU8fIlFvYI627r/9w+BPvxjf3ImwIf1zOgfgd65z37bH8oo
 t9+dT/+3BnX/zW8WW2txd4mxEpiX4ca+82w7PYAGPcBgOGq/QOZRS+B93etSc+VssCb/
 qw5R30Rn6GoUE6JRpHK0OoOpjP54FY8v7oLQ+sDL+WMGYPMLqQXuLTGzjg1eOJk79Ujf
 S7rA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBJSrwuuqxvPhaIhnVRHSnZHd/5yEsCxvS5nN4oQ=="
X-RZG-CLASS-ID: mo00
Received: from Christians-iMac.fritz.box by smtp.strato.de (RZmta 47.25.6 AUTH)
 with ESMTPSA id j00d01x45Chv0mR
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 5 May 2021 14:43:57 +0200 (CEST)
Subject: Re: [FSL P50x0] Xorg always restarts again and again after the the
 PowerPC updates 5.13-1
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>
References: <3eedbe78-1fbd-4763-a7f3-ac5665e76a4a@xenosoft.de>
 <c5b0ac7c-525f-0208-7587-c90427eae137@xenosoft.de>
 <0886c1dc-e946-69cb-a0a9-57247acfd080@csgroup.eu>
 <9864cd72-f1aa-4cf5-1cda-b3a10233b24d@xenosoft.de>
 <1b0307be-05cd-ab62-8b22-75ffb59ff76b@csgroup.eu>
 <daace050-6233-77ea-4517-0fd3c4b21057@xenosoft.de>
 <30f559f4-b50a-de63-94e1-761022468684@csgroup.eu>
 <c9a692b4-0ac0-d595-10fa-c3213b1518fc@xenosoft.de>
 <3b7daea5-7b2b-a089-0427-3becb986b6f5@csgroup.eu>
 <1502fb22-680c-7393-238c-f82570806717@xenosoft.de>
 <6a322f04-a81e-ae31-1425-19fda9307b23@csgroup.eu>
 <f253fc33-daa1-e668-31b3-593991531ffb@xenosoft.de>
 <6d3ae417-48de-3b61-f6fe-da951d74fef3@xenosoft.de>
 <07541597-f309-0d33-2c29-6da8fcd10aa1@csgroup.eu>
 <c4914f77-f8c2-e869-d731-4d0882e12af0@xenosoft.de>
 <c103a1a5-4a22-1738-1d65-3314a4457a0d@csgroup.eu>
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Message-ID: <9f150fb5-3034-f256-04f9-9c802e40f855@xenosoft.de>
Date: Wed, 5 May 2021 14:43:56 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <c103a1a5-4a22-1738-1d65-3314a4457a0d@csgroup.eu>
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

On 04 May 2021 at 05:17pm, Christophe Leroy wrote:
> Le 04/05/2021 à 16:59, Christian Zigotzky a écrit :
>> On 04 May 2021 at 04:41pm Christophe Leroy wrote:
>>> Le 04/05/2021 à 13:02, Christian Zigotzky a écrit :
>>>> On 04 May 2021 at 12:07pm, Christian Zigotzky wrote:
>>>>> On 04 May 2021 at 11:49am, Christophe Leroy wrote:
>>>>>
>>>>> I am bisecting currently.
>>>>>
>>>>> $ git bisect start -- arch/powerpc
>>>>> $ git bisect good 887f3ceb51cd3~
>>>>> $ git bisect bad c70a4be130de333ea079c59da41cc959712bb01c
>>>> OK, there is another issue after the second bisecting step. The 
>>>> boot stops after loading the dtb and uImage file. I can't solve 2 
>>>> issues with bisecting at the same time.
>>>
>>> In that case, you can use 'git bisect skip' to skip the one that is 
>>> not booting at all.
>> In my point of view 'git bisect skip' isn't a good idea because I 
>> will not find out if the skipped commit is good or bad and maybe the 
>> first bad commit.
>
> The second problem may be completely unrelated to the first one so it 
> could work.
>
> In any case, if 'git bisect' finds out that the bad commit is in the 
> middle of a skipped area, it will tell you. So I think it is worth it.
>
> The second solution could be to first focus on that 'boot stops after 
> loading problem' and try to find out which commit introduces the bug, 
> then which one fixes it. But it may not be necessary.
>
> Other solution, as you were thinking that the conversion of 'booke' to 
> C interrupt entry/exit, you can also try around that: See if d738ee8 
> has the problem and 2e2a441 doesn't have the problem.
>
> If so, you can bisect between those two commits (There are 8 commits 
> inbetween).
Hi Christophe,

I am bisecting with skipping the boot issue currently. Unfortunately it 
seems there is another bug. I had to skip two times because the kernel 
didn't compile.

Bisecting log:

1) git bisect start -- arch/powerpc

2) git bisect good 887f3ceb51cd3~

3) git bisect bad c70a4be130de333ea079c59da41cc959712bb01c

4) git bisect bad
5) git bisect skip It stopped after loading the dtb and uImage. Maybe a 
third bug.
6) git bisect skip It stopped after loading the dtb and uImage.
7) git bisect skip It stopped after loading the dtb and uImage.
8) git bisect skip It stopped after loading the dtb and uImage.
9) git bisect skip It stopped after loading the dtb and uImage. 
([472724111f0f72042deb6a9dcee9578e5398a1a1] powerpc/iommu: Enable 
remaining IOMMU Pagesizes present in LoPAR)
10) git bisect skip It stopped after loading the dtb and uImage. 
([ceff77efa4f8d9f02d8442171b325d3b7068fe5e] powerpc/64e/interrupt: Use 
new interrupt context tracking scheme)
11) git bisect skip It stopped after loading the dtb and uImage. 
([7dcc37b3eff97379b194adb17eb9a8270512dd1d] powerpc/xive: Map one IPI 
interrupt per node)
12) git bisect skip It stopped after loading the dtb and uImage. 
([097157e16cf8bf91b9cf6fbda05d234d3599c01f] powerpc/64e/interrupt: 
reconcile irq soft-mask state in C)
13) git bisect skip It didn't compile.
Error messages:

arch/powerpc/kernel/interrupt.o: In function `.syscall_exit_prepare':
interrupt.c:(.text+0x278): undefined reference to `.schedule_user'
arch/powerpc/kernel/interrupt.o: In function `.interrupt_exit_user_prepare':
interrupt.c:(.text+0x340): undefined reference to `.schedule_user'
Makefile:1199: recipe for target 'vmlinux' failed
make: *** [vmlinux] Error 1

([fd6db2892ebaa1383a93b4a609c65b96e615510a] powerpc/xive: Modernize 
XIVE-IPI domain with an 'alloc' handler)

14) git bisect skip It stopped after loading the dtb and uImage. 
([0c2472de23aea5ce9139a3e887191925759d1259] powerpc/64e/interrupt: use 
new interrupt return)
15) git bisect skip It stopped after loading the dtb and uImage. 
([097157e16cf8bf91b9cf6fbda05d234d3599c01f] powerpc/64e/interrupt: 
reconcile irq soft-mask state in C)
16) git bisect skip It didn't compile.
Error messages:

arch/powerpc/kernel/interrupt.o: In function `.syscall_exit_prepare':
interrupt.c:(.text+0x278): undefined reference to `.schedule_user'
arch/powerpc/kernel/interrupt.o: In function `.interrupt_exit_user_prepare':
interrupt.c:(.text+0x340): undefined reference to `.schedule_user'
Makefile:1199: recipe for target 'vmlinux' failed
make: *** [vmlinux] Error 1

([14b3c9d24a7a5c274a9df27d245516f466d3bc5f] powerpc/syscalls: switch to 
generic syscalltbl.sh)

17) git bisect skip It stopped after loading the dtb and uImage. 
([08a022ad3dfafc7e33d4529015e14bb75179cacc] powerpc/powernv/memtrace: 
Allow mmaping trace buffers)
18) git bisect skip It stopped after loading the dtb and uImage. 
([e5d56763525e65417dad0d46572b234fa0008e40] powerpc/rtas: rename 
RTAS_RMOBUF_MAX to RTAS_USER_REGION_SIZE)
19) git bisect skip It stopped after loading the dtb and uImage. 
([98db179a78dd8379e9d2cbfc3f00224168a9344c] powerpc/64s: power4 nap 
fixup in C)
20) git bisect skip It stopped after loading the dtb and uImage. 
([c13ff6f3251318f5e1ff5b1a6d05f76996db672a] powerpc/rtas: improve 
ppc_rtas_rmo_buf_show documentation)

Should I continue bisecting?

You can find the other steps (21 and higher) here: 
https://forum.hyperion-entertainment.com/viewtopic.php?p=53103#p53103

Thanks,
Christian
