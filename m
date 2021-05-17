Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AED8638289E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 May 2021 11:43:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FkDhz4d73z30Dl
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 May 2021 19:43:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=b8luP57g;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=85.215.255.54;
 helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256
 header.s=strato-dkim-0002 header.b=b8luP57g; 
 dkim-atps=neutral
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.54])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FkDhT6xZ3z2xxn
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 May 2021 19:43:03 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; t=1621244566; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=Bb80fHfWsl2as0Bzja3tmAaZ9msvugut1/sG21fSivbAd+Ci5k77xAo1vY49KvSfgL
 0p1ngQsBhhrOgCyHGtGJt7POPNMLCrSwCP7FmFYtj4UEeG6UrKB+2V+THYr5/sTQ8pHg
 r1L90+LASdtNq/zM+pNkqkVifhFFcZNc02UaNyRHHBg3dCBrC3uLnqAEmO7NC9UcYjw+
 kjnO3Xq+09ADSVK4eWN86kCuCWI3x8UVM5XBeSFnS0YgZ8OpPqU6PMDrTyDUgQgRe7l/
 MohnAOn0DN8gIkZEQjGd9HC8NIaespq7X2HMW7tchJRsGvqXKX0Qj9s83U0Wr0t4glAH
 f80Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1621244566;
 s=strato-dkim-0002; d=strato.com;
 h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
 From:Subject:Sender;
 bh=Rl/Gdkc7egQWIBOSMIJX1XaY9AiyuXx2nuAj0o6wsks=;
 b=GbXH6pkiDdNME/8kFE6Qgu3m1019Wh/liU76uViiBP95222qAhDpDa7NJlV6Vqev71
 fOXPzyMrQ/nf3aiYwmn6NSitros3S/UylHr5EKMGOZ3SZJ73f4iibNixWEPo+x40cmaI
 2WmN9/vcSZztAAE6GSJXwK7JXvqLs+O25/zMM5IO3+k/vIHJoHebeEIONdAxTQHk5nax
 z97Ga1P153ZgFz4kaLzGY/HPejuGbojafCwD94sykMSX3SLV2FMGAb6C7sL4PZLC5w+m
 TFpjwvmyjw1b00bhuL2aSf/qz7yPAOTL8hyTBbJL5eGCecSnh4q84O7QVEFbjLPcx8Qc
 b6WQ==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1621244566;
 s=strato-dkim-0002; d=xenosoft.de;
 h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
 From:Subject:Sender;
 bh=Rl/Gdkc7egQWIBOSMIJX1XaY9AiyuXx2nuAj0o6wsks=;
 b=b8luP57gpmrZBcfUwwdMzFRTcocewx8zMH8sYzg/rMu7djzRfVaOPgagdkh2b2hNk1
 IXPyIVybF5pmseiY4Psw66sZ818HgedyFsIG/8uG38vhnYXAEy3rhgKMzDEx9OxsOo2b
 JolbvIS4ZDkobhCeK0QWL34vUXsTsvkq2mXdAR6FklDAcfMQc4Iblh1hTtCV6qMcV9zy
 CSj1XROYuldh+sNEcqgp0QDVL9iTKYrZr08jpsJJBIoFnj1yXqP2tEof4WxxpO6vJVN9
 e91+l1MaKn+s6p8rmBMBbXIr6Qvw0Eixs3N/6pnbS6tkJHYh2udlv9zYAZEq3RQbMaZ2
 wyXw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBJSrwuuqxvPhbL1/HFNrQWNLFP5JgxJd3+MH2JA=="
X-RZG-CLASS-ID: mo00
Received: from Christians-iMac.fritz.box by smtp.strato.de (RZmta 47.26.0 AUTH)
 with ESMTPSA id f051dfx4H9gj0nU
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 17 May 2021 11:42:45 +0200 (CEST)
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
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Message-ID: <e6ed7674-3df9-ec3e-8bcf-dcd8ff0fecf8@xenosoft.de>
Date: Mon, 17 May 2021 11:42:45 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <1621236734.xfc1uw04eb.astroid@bobo.none>
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
Cc: Darren Stevens <darren@stevens-zone.net>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 mad skateman <madskateman@gmail.com>, Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 17 May 2021 at 09:42am, Nicholas Piggin wrote:
> Excerpts from Christian Zigotzky's message of May 15, 2021 11:46 pm:
>> On 15 May 2021 at 12:08pm Christophe Leroy wrote:
>>>
>>> Le 15/05/2021 à 11:48, Christian Zigotzky a écrit :
>>>> Hi All,
>>>>
>>>> I bisected today [1] and the bisecting itself was OK but the
>>>> reverting of the bad commit doesn't solve the issue. Do you have an
>>>> idea which commit could be resposible for this issue? Maybe the
>>>> bisecting wasn't successful. I will look in the kernel git log. Maybe
>>>> there is a commit that affected KVM HV on FSL P50x0 machines.
>>> If the uImage doesn't load, it may be because of the size of uImage.
>>>
>>> See https://github.com/linuxppc/issues/issues/208
>>>
>>> Is there a significant size difference with and without KVM HV ?
>>>
>>> Maybe you can try to remove another option to reduce the size of the
>>> uImage.
>> I tried it but it doesn't solve the issue. The uImage works without KVM
>> HV in a virtual e5500 QEMU machine.
> Any more progress with this? I would say that bisect might have just
> been a bit unstable and maybe by chance some things did not crash so
> it's pointing to the wrong patch.
>
> Upstream merge of powerpc-5.13-1 was good and powerpc-5.13-2 was bad?
>
> Between that looks like some KVM MMU rework. You could try the patch
> before this one b1c5356e873c ("KVM: PPC: Convert to the gfn-based MMU
> notifier callbacks"). That won't revert cleanly so just try run the
> tree at that point. If it works, test the patch and see if it fails.
>
> Thanks,
> Nick
Hi Nick,

Thanks a lot for your answer. Yes, there is a little bit of progress. 
The RC2 of kernel 5.13 successfully boots with -smp 3 in a virtual e5500 
QEMU machine.
-smp 4 doesn't work anymore since the PowerPC updates 5.13-2. I used 
-smp 4 before 5.13 because my FSL P5040 machine has 4 cores.

Could you please post a patch for reverting the commit before 
b1c5356e873c ("KVM: PPC: Convert to the gfn-based MMU notifier callbacks")?

Thanks in advance,

Christian


