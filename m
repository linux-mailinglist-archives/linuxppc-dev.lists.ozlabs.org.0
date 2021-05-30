Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F531394FEB
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 May 2021 08:50:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ft8Dr2KMHz2yxY
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 May 2021 16:50:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=JGU6Qunl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=85.215.255.53;
 helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256
 header.s=strato-dkim-0002 header.b=JGU6Qunl; 
 dkim-atps=neutral
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.53])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ft8DF5K2xz2xvQ
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 May 2021 16:49:31 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; t=1622357350; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=SDGISMNF5AhJDcRi0hRuHpnsMC/8JlcSylVUyeFODFGOvCWVPySv1WUHSYZde+EaBG
 17gE51H2xqm/6SDTI/MgqX1sBb+RmDKFJH9XN+WZoUuvVuIhjPzc0vuGs036imP1/uDh
 Tl7D/n8wi0K0wUm5DnpQMJVFpxag2NIAMv9p+suvFuvPJ2+JCr1c41bivldMsFlES+cz
 CAciFLmfX7JU+9RtuJSQO/hPbJyTy+JvJkNjxjStFbPgcKK3Kp6XncyvFAKaLRCS5lBG
 Aijp327SPJ9aiyHO6XWmhI9TFyN9Hn8dGMmO6PmP0YbnPdw5zKPMxG2k+QoZ7QWYSd2V
 H8dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1622357350;
 s=strato-dkim-0002; d=strato.com;
 h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
 From:Subject:Sender;
 bh=WRXVmiroGZ+6WgAUp6EaN5e8szeqUQhfW9upgdZTFkE=;
 b=Obd+PwVB89qls5iAMkRZxnUAsK8iQ8Nn208D2Hs0NgRGjjjU/Ky33fQJ2MM/jE2cdZ
 No4Wp57QXdgLvzW0KEywrlKW+RS34A1RwqwGWXajV0IxNs0l1VOggupBUAfdYgmATdVH
 SsvGc/xNJi8yQuLI4RlSPPF+TZIvar6rm270eyOqz9JkdtGqr6IHaGQiVgHk2NH1qsNb
 x4jyttMgb2MdSB5ruUOu9Wabc9SNRmjd/Yx4Ctr3DtA1jurg687X375XJ0yaWL7Nks1p
 OjHR3Wx3kkiJaJKOSi14ra/tfCnlt5EeFwSS+9yR7Sicp7+tMfqUJdNGA5kdHKI+tsqi
 mSKw==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1622357350;
 s=strato-dkim-0002; d=xenosoft.de;
 h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
 From:Subject:Sender;
 bh=WRXVmiroGZ+6WgAUp6EaN5e8szeqUQhfW9upgdZTFkE=;
 b=JGU6Qunlk2k9DY769tcpOZYgwDpL1EdgGZplO2DsEVGVFmgxIc9HnA5pup89KP3G9W
 6lx55EVKyNmQf/Fe7Nr5kFBMX7DCnzqhCopZdq4Cn7fbWMKLbIVX0fYRGUfJUoBvPJnv
 qUFqLtaXFY50pvvIMIRajnUxNN1kX5ORAgP71H22Gx3QlB/hbRso5Yrlon8kSyMeDQno
 QEMS3zku1Wgc1WlTWHhrIJc7vkpBUO4TKgqs/NOTtYjWm2j1ZRjpgxlpMLSZ8XNR9LGG
 aGNIG6J+Ciq+xDD9A8zKI1L6O2JbT6YSFIqiw9EaINlu/Ynt0XDXGMO+nED+p5fwxh3t
 K7nQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBJSrwuuqxvPhUJhBnUfFi1Ts+UyTUShcsiNoeag=="
X-RZG-CLASS-ID: mo00
Received: from Christians-iMac.fritz.box by smtp.strato.de (RZmta 47.26.3 AUTH)
 with ESMTPSA id Y04da1x4U6nA6kX
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Sun, 30 May 2021 08:49:10 +0200 (CEST)
Subject: Re: [FSL P50x0] KVM HV doesn't work anymore
To: Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 "kvm-ppc@vger.kernel.org" <kvm-ppc@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
References: <04526309-4653-3349-b6de-e7640c2258d6@xenosoft.de>
 <34617b1b-e213-668b-05f6-6fce7b549bf0@xenosoft.de>
 <9af2c1c9-2caf-120b-2f97-c7722274eee3@csgroup.eu>
 <199da427-9511-34fe-1a9e-08e24995ea85@xenosoft.de>
 <1621236734.xfc1uw04eb.astroid@bobo.none>
 <e6ed7674-3df9-ec3e-8bcf-dcd8ff0fecf8@xenosoft.de>
 <1621410977.cgh0d6nvlo.astroid@bobo.none>
 <acf63821-2030-90fa-f178-b2baeb0c4784@xenosoft.de>
 <1621464963.g8v9ejlhyh.astroid@bobo.none>
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Message-ID: <91b8ea0f-0666-7bf7-a526-b3d4f183d4d6@xenosoft.de>
Date: Sun, 30 May 2021 08:49:09 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <1621464963.g8v9ejlhyh.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Darren Stevens <darren@stevens-zone.net>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 mad skateman <madskateman@gmail.com>, Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 20 May 21 at 01:07am, Nicholas Piggin wrote:
> Excerpts from Christian Zigotzky's message of May 19, 2021 9:52 pm:
>> On 19 May 2021 at 09:57 am, Nicholas Piggin wrote:
>>> Excerpts from Christian Zigotzky's message of May 17, 2021 7:42 pm:
>>>> On 17 May 2021 at 09:42am, Nicholas Piggin wrote:
>>>>> Excerpts from Christian Zigotzky's message of May 15, 2021 11:46 pm:
>>>>>> I tried it but it doesn't solve the issue. The uImage works without
>>>>>> KVM
>>>>>> HV in a virtual e5500 QEMU machine.
>>>>> Any more progress with this? I would say that bisect might have just
>>>>> been a bit unstable and maybe by chance some things did not crash so
>>>>> it's pointing to the wrong patch.
>>>>>
>>>>> Upstream merge of powerpc-5.13-1 was good and powerpc-5.13-2 was bad?
>>>>>
>>>>> Between that looks like some KVM MMU rework. You could try the patch
>>>>> before this one b1c5356e873c ("KVM: PPC: Convert to the gfn-based MMU
>>>>> notifier callbacks"). That won't revert cleanly so just try run the
>>>>> tree at that point. If it works, test the patch and see if it fails.
>>>>>
>>>>> Thanks,
>>>>> Nick
>>>> Hi Nick,
>>>>
>>>> Thanks a lot for your answer. Yes, there is a little bit of progress.
>>>> The RC2 of kernel 5.13 successfully boots with -smp 3 in a virtual e5500
>>>> QEMU machine.
>>>> -smp 4 doesn't work anymore since the PowerPC updates 5.13-2. I used
>>>> -smp 4 before 5.13 because my FSL P5040 machine has 4 cores.
>>>>
>>>> Could you please post a patch for reverting the commit before
>>>> b1c5356e873c ("KVM: PPC: Convert to the gfn-based MMU notifier callbacks")?
>>> You could `git checkout b1c5356e873c~1`
>>>
>>> Thanks,
>>> Nick
>> Hi Nick,
>>
>> Thanks for your answer. I checked out the commit b1c5356e873c~1 (HEAD is
>> now at d923ff258423 KVM: MIPS/MMU: Convert to the gfn-based MMU notifier
>> callbacks).
>> The kernel boots with '-smp 4' without any problems.
>> After that I patched with the probable first bad commit (KVM: PPC:
>> Convert to the gfn-based MMU notifier callbacks). The kernel also boots
>> with this patch. That means, this isn't the first bad commit.
>> Further information:
>> https://forum.hyperion-entertainment.com/viewtopic.php?p=53267#p53267
> Hmm, okay that probably rules out those notifier changes then.
>
> Can you remind me were you able to rule these out as suspects?
>
> 8f6cc75a97d1 powerpc: move norestart trap flag to bit 0
> 8dc7f0229b78 powerpc: remove partial register save logic
> c45ba4f44f6b powerpc: clean up do_page_fault
> d738ee8d56de powerpc/64e/interrupt: handle bad_page_fault in C
> ceff77efa4f8 powerpc/64e/interrupt: Use new interrupt context tracking scheme
> 097157e16cf8 powerpc/64e/interrupt: reconcile irq soft-mask state in C
> 3db8aa10de9a powerpc/64e/interrupt: NMI save irq soft-mask state in C
> 0c2472de23ae powerpc/64e/interrupt: use new interrupt return
> dc6231821a14 powerpc/interrupt: update common interrupt code for
> 4228b2c3d20e powerpc/64e/interrupt: always save nvgprs on interrupt
> 5a5a893c4ad8 powerpc/syscall: switch user_exit_irqoff and trace_hardirqs_off order
>
> Thanks,
> Nick
Hi Nick,

Thanks for your answer. Smp 4 still doesn't work on quad core e5500 
CPUs. I use -smp 3 currently. Shall I checkout the commits above (in 
your last answer) and test them? Do you prefer a commit for testing?

Thanks,
Christian
