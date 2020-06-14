Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE241F87BF
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Jun 2020 10:52:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49l7WX3RZXzDqSw
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Jun 2020 18:52:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1041;
 helo=mail-pj1-x1041.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=UdgvbWOD; dkim-atps=neutral
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49l7Tm1h87zDqRD
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Jun 2020 18:50:50 +1000 (AEST)
Received: by mail-pj1-x1041.google.com with SMTP id h22so2369508pjf.1
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Jun 2020 01:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=vUHnJvtjAA9b/hqeT4bmQJdbeQxtf290+54BQ+xeyG0=;
 b=UdgvbWODXNSSd48DVQ9oZ4Jzpyo9kI4j91cijYtZVGKfTmGA0gzUmcMKOhISfmomfQ
 wr1of0S07uoWzYWIhLczbWJ9aszw7Sz7oTmBqQl8L3Bh7dITQp92Z2oI/XqL6B1Uqdos
 ZzqTzrRZ2wUu7ZdxBQSzUorvEB6S24+Vm27ZhpPFYEO5itGmN0gN9BzH51RXedFZ0p2b
 5CeVkmh5Wq/gxW/OJX8KNgu7YRsms+Cy2DzpioA92fpIMnIGpFwqCoxBWJ1I59Go3LvN
 me5l5waefmcXL8iUqbdPbfgmHeHl8FnPWW+7umr0ELLff1SKq30usyrqhdB0CWlM1Mos
 owfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=vUHnJvtjAA9b/hqeT4bmQJdbeQxtf290+54BQ+xeyG0=;
 b=c3Jbu5/A1rcsEz08Xzd5+pB/Jy89sOT9ZCimQ6crvd8o0H/c25dNbd2x2TDkZ0FJgL
 pzFf8k0d7hjuU/yYrdGxEyxs9iP33cE3tzVu/kEH6LTu+nu9pge6uQpmGduXueFNuvtt
 9icZeZtjbzZ+Cwp1Z/LIhgmC3aZIi0otXK6cs+eFWSeAl2FLeqVztT+wQnWYOnOLKrWC
 n+SgrNZyhFsmS2CJ3wOqUNGoEX/9h0CJ31j2GBxeeT8miMfH7a7uhDPJGcSfW8D2qx+N
 +3dKvCRuq+BS/lA/7ryaobTXfr55+0JpZz23JghgFXo2eb+VS83eGOsdifx8bZocvxu8
 orsg==
X-Gm-Message-State: AOAM530FUmKRQAE9RU5dl+mm6pv2RIGi1WakYaivsCTyQTWXGGA28SSf
 YzRhuWAtRPWGp7ZmwFlisws=
X-Google-Smtp-Source: ABdhPJxv16ba0b78rdEVJRTbPDEhU33cFlwrqcL4rAJTLh01RAEBHFUkAxzUnjNNxv+ilTDOCicfPw==
X-Received: by 2002:a17:90a:c258:: with SMTP id
 d24mr6696613pjx.137.1592124646295; 
 Sun, 14 Jun 2020 01:50:46 -0700 (PDT)
Received: from localhost (193-116-108-230.tpgi.com.au. [193.116.108.230])
 by smtp.gmail.com with ESMTPSA id s26sm994664pga.80.2020.06.14.01.50.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Jun 2020 01:50:45 -0700 (PDT)
Date: Sun, 14 Jun 2020 18:50:39 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: PowerPC KVM-PR issue
To: Christian Zigotzky <chzigotzky@xenosoft.de>, "kvm-ppc@vger.kernel.org"
 <kvm-ppc@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
References: <f7f1b233-6101-2316-7996-4654586b7d24@csgroup.eu>
 <067BBAB3-19B6-42C6-AA9F-B9F14314255C@xenosoft.de>
 <014e1268-dcce-61a3-8bcd-a06c43e0dfaf@csgroup.eu>
 <7bf97562-3c6d-de73-6dbd-ccca275edc7b@xenosoft.de>
 <87tuznq89p.fsf@linux.ibm.com>
 <f2706f5f-62b8-9c52-08f4-59f91da48fa6@xenosoft.de>
 <cf99a8c0-3bad-d089-de54-e02d3dba7f72@xenosoft.de>
 <7e859f68-9455-f98f-1fa3-071619fa1731@xenosoft.de>
 <54082b17-31bb-f529-2e9e-b84c5a5aa9ec@xenosoft.de>
 <fffeb817-35e0-2562-b3cf-2fd476948c76@xenosoft.de>
In-Reply-To: <fffeb817-35e0-2562-b3cf-2fd476948c76@xenosoft.de>
MIME-Version: 1.0
Message-Id: <1592124591.eoad6txb58.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
 Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Christian Zigotzky's message of June 12, 2020 11:01 pm:
> On 11 June 2020 at 04:47 pm, Christian Zigotzky wrote:
>> On 10 June 2020 at 01:23 pm, Christian Zigotzky wrote:
>>> On 10 June 2020 at 11:06 am, Christian Zigotzky wrote:
>>>> On 10 June 2020 at 00:18 am, Christian Zigotzky wrote:
>>>>> Hello,
>>>>>
>>>>> KVM-PR doesn't work anymore on my Nemo board [1]. I figured out=20
>>>>> that the Git kernels and the kernel 5.7 are affected.
>>>>>
>>>>> Error message: Fienix kernel: kvmppc_exit_pr_progint: emulation at=20
>>>>> 700 failed (00000000)
>>>>>
>>>>> I can boot virtual QEMU PowerPC machines with KVM-PR with the=20
>>>>> kernel 5.6 without any problems on my Nemo board.
>>>>>
>>>>> I tested it with QEMU 2.5.0 and QEMU 5.0.0 today.
>>>>>
>>>>> Could you please check KVM-PR on your PowerPC machine?
>>>>>
>>>>> Thanks,
>>>>> Christian
>>>>>
>>>>> [1] https://en.wikipedia.org/wiki/AmigaOne_X1000
>>>>
>>>> I figured out that the PowerPC updates 5.7-1 [1] are responsible for=20
>>>> the KVM-PR issue. Please test KVM-PR on your PowerPC machines and=20
>>>> check the PowerPC updates 5.7-1 [1].
>>>>
>>>> Thanks
>>>>
>>>> [1]=20
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/com=
mit/?id=3Dd38c07afc356ddebaa3ed8ecb3f553340e05c969
>>>>
>>>>
>>> I tested the latest Git kernel with Mac-on-Linux/KVM-PR today.=20
>>> Unfortunately I can't use KVM-PR with MoL anymore because of this=20
>>> issue (see screenshots [1]). Please check the PowerPC updates 5.7-1.
>>>
>>> Thanks
>>>
>>> [1]
>>> -=20
>>> https://i.pinimg.com/originals/0c/b3/64/0cb364a40241fa2b7f297d4272bbb8b=
7.png
>>> -=20
>>> https://i.pinimg.com/originals/9a/61/d1/9a61d170b1c9f514f7a78a3014ffd18=
f.png
>>>
>> Hi All,
>>
>> I bisected today because of the KVM-PR issue.
>>
>> Result:
>>
>> 9600f261acaaabd476d7833cec2dd20f2919f1a0 is the first bad commit
>> commit 9600f261acaaabd476d7833cec2dd20f2919f1a0
>> Author: Nicholas Piggin <npiggin@gmail.com>
>> Date:=C2=A0=C2=A0 Wed Feb 26 03:35:21 2020 +1000
>>
>> =C2=A0=C2=A0=C2=A0 powerpc/64s/exception: Move KVM test to common code
>>
>> =C2=A0=C2=A0=C2=A0 This allows more code to be moved out of unrelocated =
regions. The
>> =C2=A0=C2=A0=C2=A0 system call KVMTEST is changed to be open-coded and r=
emain in the
>> =C2=A0=C2=A0=C2=A0 tramp area to avoid having to move it to entry_64.S. =
The custom=20
>> nature
>> =C2=A0=C2=A0=C2=A0 of the system call entry code means the hcall case ca=
n be made more
>> =C2=A0=C2=A0=C2=A0 streamlined than regular interrupt handlers.
>>
>> =C2=A0=C2=A0=C2=A0 mpe: Incorporate fix from Nick:
>>
>> =C2=A0=C2=A0=C2=A0 Moving KVM test to the common entry code missed the c=
ase of HMI and
>> =C2=A0=C2=A0=C2=A0 MCE, which do not do __GEN_COMMON_ENTRY (because they=
 don't want to
>> =C2=A0=C2=A0=C2=A0 switch to virt mode).
>>
>> =C2=A0=C2=A0=C2=A0 This means a MCE or HMI exception that is taken while=
 KVM is=20
>> running a
>> =C2=A0=C2=A0=C2=A0 guest context will not be switched out of that contex=
t, and KVM won't
>> =C2=A0=C2=A0=C2=A0 be notified. Found by running sigfuz in guest with pa=
tched host on
>> =C2=A0=C2=A0=C2=A0 POWER9 DD2.3, which causes some TM related HMI interr=
upts (which are
>> =C2=A0=C2=A0=C2=A0 expected and supposed to be handled by KVM).
>>
>> =C2=A0=C2=A0=C2=A0 This fix adds a __GEN_REALMODE_COMMON_ENTRY for those=
 handlers to add
>> =C2=A0=C2=A0=C2=A0 the KVM test. This makes them look a little more like=
 other handlers
>> =C2=A0=C2=A0=C2=A0 that all use __GEN_COMMON_ENTRY.
>>
>> =C2=A0=C2=A0=C2=A0 Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> =C2=A0=C2=A0=C2=A0 Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
>> =C2=A0=C2=A0=C2=A0 Link:=20
>> https://lore.kernel.org/r/20200225173541.1549955-13-npiggin@gmail.com
>>
>> :040000 040000 ec21cec22d165f8696d69532734cb2985d532cb0=20
>> 87dd49a9cd7202ec79350e8ca26cea01f1dbd93d M=C2=A0=C2=A0=C2=A0 arch
>>
>> -----
>>
>> The following commit is the problem: powerpc/64s/exception: Move KVM=20
>> test to common code [1]
>>
>> These changes were included in the PowerPC updates 5.7-1. [2]
>>
>> Another test:
>>
>> git checkout d38c07afc356ddebaa3ed8ecb3f553340e05c969 (PowerPC updates=20
>> 5.7-1 [2] ) -> KVM-PR doesn't work.
>>
>> After that: git revert d38c07afc356ddebaa3ed8ecb3f553340e05c969 -m 1=20
>> -> KVM-PR works.
>>
>> Could you please check the first bad commit? [1]
>>
>> Thanks,
>> Christian
>>
>>
>> [1]=20
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commi=
t/?id=3D9600f261acaaabd476d7833cec2dd20f2919f1a0
>> [2]=20
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commi=
t/?id=3Dd38c07afc356ddebaa3ed8ecb3f553340e05c969
>=20
> Hi All,
>=20
> I tried to revert the __GEN_REALMODE_COMMON_ENTRY fix for the latest Git=20
> kernel and for the stable kernel 5.7.2 but without any success. There=20
> was lot of restructuring work during the kernel 5.7 development time in=20
> the PowerPC area so it isn't possible reactivate the old code. That=20
> means we have lost the whole KVM-PR support. I also reported this issue=20
> to Alexander Graf two days ago. He wrote: "Howdy :). It looks pretty=20
> broken. Have you ever made a bisect to see where the problem comes from?"
>=20
> Please check the KVM-PR code.

Hey, thanks for debugging it and reporting. I'm looking into it, will=20
try to get a fix soon.

Thanks,
Nick
