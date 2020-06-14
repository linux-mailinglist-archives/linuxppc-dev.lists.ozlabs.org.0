Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ABCC1F88D3
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Jun 2020 14:55:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49lDvy1VrgzDqSH
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Jun 2020 22:55:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::641;
 helo=mail-pl1-x641.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=CuxCUzpZ; dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49lDsg3VfJzDqRd
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Jun 2020 22:53:26 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id g12so5657704pll.10
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Jun 2020 05:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=fxTmvzsy9wvj3KEbvKzwNOZUShe0nJuOeB9o7dwzme0=;
 b=CuxCUzpZIs7fIOwkS+d0veYN/C2mRnqAjGI/OHO0ymfYXalQjHkAmQnn/GARarZwWb
 a2DgCtv4QplEMX3hFL2Wt435B/V0UvsZgIdQDZ83fOxsc44IpN6r0CkE0fYc1At+V4qw
 VDX4TDMuy/fk8Z82t2Rqet2L/H/2eBShllikdq0kgOjTafIDRtc21V5Ch2amLMTdgslv
 M2XS2zdAWeIAenIV6molAF5I4Ds/4ZV55mwo20MCZm4tQHlhlyJ/vom8yrGsLrxzquC+
 c8EMKiJNLQEcar6uCzkLwrsoqvd/4atLLp25Pvr094V7pOvrmQmst9lHmgUSsPb8Zfpt
 yQsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=fxTmvzsy9wvj3KEbvKzwNOZUShe0nJuOeB9o7dwzme0=;
 b=JV4GFJkm2qXckG6g4/9matKf8YEzetLB+14cVvqquYl16kOdPm7STa0efaLGWbOYUG
 3m02EV5Y8BV7LTBAfp4/JqZgi5+Wkt9aioqEnE7MCdHkCUbvF7dUMc42xS4uyqmvDT1w
 bFnIx4bAgazpabPW8h4gl9nmM58/Vg/u5bxQ0/vM0DSlZVnPkn7eI7ZPeCDdtbNgiMs4
 asmwRM2wk9a42X5KHZYy5iRMjT5Z7XN3tHPBsLyLcX5DmKPVISrgrCtKNlGQrRiMgVgY
 Pyj/fJyKi6uvP4Rirg0YBF5yBe90W+5QQYgbCUIA0eNPBLbV5CcczRuOSNV8jtJfCOTa
 nPJA==
X-Gm-Message-State: AOAM530aBRrqVRW13j6dzv6gOrPqR3xIVI6hHEYrBRsLeC3Wh2ise8/7
 R8tCUZLwwS5iwpPqNBxD02o=
X-Google-Smtp-Source: ABdhPJx/KqWmFlSJ1kcLuzCc9Tc64W6PECn3T6SHj7Sis8NxHqezmbF8VUmf6DdaB3OqOn2fcQfYQg==
X-Received: by 2002:a17:902:7:: with SMTP id 7mr16820143pla.209.1592139201574; 
 Sun, 14 Jun 2020 05:53:21 -0700 (PDT)
Received: from localhost (193-116-108-230.tpgi.com.au. [193.116.108.230])
 by smtp.gmail.com with ESMTPSA id 17sm11391410pfn.19.2020.06.14.05.53.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Jun 2020 05:53:20 -0700 (PDT)
Date: Sun, 14 Jun 2020 22:53:13 +1000
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
Message-Id: <1592139127.g2951cl0h6.astroid@bobo.none>
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

Does this patch fix it for you?

The CTR register reload in the KVM interrupt path used the wrong save
area for SLB (and NMI) interrupts.

Fixes: 9600f261acaaa ("powerpc/64s/exception: Move KVM test to common code"=
)
Reported-by: Christian Zigotzky <chzigotzky@xenosoft.de>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exc=
eptions-64s.S
index e70ebb5c318c..fa080694e581 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -270,7 +270,7 @@ BEGIN_FTR_SECTION
 END_FTR_SECTION_IFSET(CPU_FTR_CFAR)
 	.endif
=20
-	ld	r10,PACA_EXGEN+EX_CTR(r13)
+	ld	r10,IAREA+EX_CTR(r13)
 	mtctr	r10
 BEGIN_FTR_SECTION
 	ld	r10,IAREA+EX_PPR(r13)
@@ -298,7 +298,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
=20
 	.if IKVM_SKIP
 89:	mtocrf	0x80,r9
-	ld	r10,PACA_EXGEN+EX_CTR(r13)
+	ld	r10,IAREA+EX_CTR(r13)
 	mtctr	r10
 	ld	r9,IAREA+EX_R9(r13)
 	ld	r10,IAREA+EX_R10(r13)
--=20
2.23.0

