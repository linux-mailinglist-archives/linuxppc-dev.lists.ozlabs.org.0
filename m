Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EC44A30D056
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 01:37:08 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DVjS13nkZzDr5J
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 11:37:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62d;
 helo=mail-pl1-x62d.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=jE/LbiDN; dkim-atps=neutral
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DVKmg4FnFzDqBX
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Feb 2021 20:50:08 +1100 (AEDT)
Received: by mail-pl1-x62d.google.com with SMTP id 8so6830169plc.10
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 02 Feb 2021 01:50:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=+a5Wntc1b/nEKo8Jz273VqE4QVFJRCGeTGIIeFGldos=;
 b=jE/LbiDN3cDrLQARRhjnxn+6otOaVpdv9i7UVbVdG2L20JmWLf0uJ3f6ISpMVfOtNf
 0rekf/oiqJ2sHRShLWXH/5yI9n1VeKcAocz7FDbH870t71TOapp+PoMacxRctG54JyQl
 TNDphqijMEDhRGmnu3HajsHtKHPVaTR87Du/JDKKlWFKolyT0CXpNujYgYWcTE5QwFxp
 PRXYiiWhP1zozqQSl+aOfRTcS+2saLyJtPUxDoR4nrK6EccpVFFHoKCO3Ismk4zRrhJ9
 tU7K0JFK/epUMt8or7qT5yZbC7QMzIc0kE3Aj2b6G65pAy6bKvU2l5b9AIZpWR1lN8wd
 uklg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=+a5Wntc1b/nEKo8Jz273VqE4QVFJRCGeTGIIeFGldos=;
 b=mW5saywPhAwxgzY5Ounfe8lrc4R1Vn5g9SOAbFqumGV9f3HsV2cSxxnJikk+eSHNgT
 RWILnSd9ob2h5RwJjseeX2I8rQOV+PgNgN0nCzaL/yDnPMJtX6SLiaiYGl72wCub4IIY
 8riSJDqGPHzGdibh5Ml2ciU8CAJn8OqsXe1h2b+19+lbI3Tnt94SCYQw8EqoX+UljKJo
 ExLITA8niNaDK2W9VsWRDbbNPkXZ2sEAW51sDLY+8nGUmMJe96U4koPw/3LSdKyvduye
 s5bn+5efo1VTj7X+XaBvZD9h3xwYzGqwCzAMCEdpU+he/XBDjaZivpBWPbtsvTltIjGp
 fEZQ==
X-Gm-Message-State: AOAM533EZKbsZlSCBugSZzc6OLejji3X251dH9ETnbn15D2EdzA5KT3s
 LvYFzAJZy++w5EA/H3O0faw=
X-Google-Smtp-Source: ABdhPJxKcS/32Ng2e+NXbvmbTbk+EqinJPcmsBoX4Bd9kKmugRT7TFI2PBWvOunWx9tQsd3u6hf8/Q==
X-Received: by 2002:a17:902:102:b029:e1:2a4c:61ed with SMTP id
 2-20020a1709020102b02900e12a4c61edmr17489962plb.61.1612259404942; 
 Tue, 02 Feb 2021 01:50:04 -0800 (PST)
Received: from localhost (60-242-11-44.static.tpgi.com.au. [60.242.11.44])
 by smtp.gmail.com with ESMTPSA id k32sm2334168pjc.36.2021.02.02.01.50.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 01:50:04 -0800 (PST)
Date: Tue, 02 Feb 2021 19:49:57 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/fault: fix wrong KUAP fault for IO_URING
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Michael Ellerman <mpe@ellerman.id.au>,
 Zorro Lang <zlang@redhat.com>
References: <20210127145648.348135-1-zlang@redhat.com>
 <cce83328-d996-defc-6c87-97cd24ec7027@csgroup.eu>
 <a8013c71-433a-96b3-c657-66ac2ba5b838@kernel.dk>
 <1611792928.nw4g8h8kj4.astroid@bobo.none>
 <20210128031355.GP14354@localhost.localdomain>
 <66061f75-c8de-c1eb-aaaf-9594a31be790@kernel.dk>
 <20210128135220.GQ14354@localhost.localdomain>
 <aedb880b-da2b-ec29-3b66-66f01733be9b@kernel.dk>
 <17ae2706-fe95-a5de-b9da-e3480800daf7@csgroup.eu>
 <20210129065220.GS14354@localhost.localdomain>
 <18dd441b-440a-fe95-0907-d8cec5b49410@csgroup.eu>
 <87r1m2d5z4.fsf@mpe.ellerman.id.au>
 <1612014260.b4fac0liie.astroid@bobo.none> <877dnrrsbu.fsf@linux.ibm.com>
 <874kivrp2v.fsf@linux.ibm.com>
 <6b081ea7-e4ee-21bb-7085-e33b4e5c6205@csgroup.eu>
 <7c48c517-700d-e114-503d-e68e0e73c534@linux.ibm.com>
 <7c06ba68-9959-44bc-233b-473d7cbc574a@csgroup.eu>
 <e2dfb7ec-a4d4-579d-a79b-6709df6e9e50@linux.ibm.com>
In-Reply-To: <e2dfb7ec-a4d4-579d-a79b-6709df6e9e50@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1612258936.h966kxxsc1.astroid@bobo.none>
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
Cc: Jens Axboe <axboe@kernel.dk>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Aneesh Kumar K.V's message of February 2, 2021 4:30 pm:
> On 2/2/21 11:50 AM, Christophe Leroy wrote:
>>=20
>>=20
>> Le 02/02/2021 =C3=A0 07:16, Aneesh Kumar K.V a =C3=A9crit=C2=A0:
>>> On 2/2/21 11:32 AM, Christophe Leroy wrote:
>>>>
>>>>
>>>> Le 02/02/2021 =C3=A0 06:55, Aneesh Kumar K.V a =C3=A9crit=C2=A0:
>>>>> Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com> writes:
>>>>>
>>>>>> Nicholas Piggin <npiggin@gmail.com> writes:
>>>>>>
>>>>>>> Excerpts from Michael Ellerman's message of January 30, 2021 9:22 p=
m:
>>>>>>>> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
>>>>>>>>> +Aneesh
>>>>>>>>>
>>>>>>>>> Le 29/01/2021 =C3=A0 07:52, Zorro Lang a =C3=A9crit=C2=A0:
>>>>>>>> ..
>>>>>>>>>> [=C2=A0=C2=A0 96.200296] ------------[ cut here ]------------
>>>>>>>>>> [=C2=A0=C2=A0 96.200304] Bug: Read fault blocked by KUAP!
>>>>>>>>>> [=C2=A0=C2=A0 96.200309] WARNING: CPU: 3 PID: 1876 at=20
>>>>>>>>>> arch/powerpc/mm/fault.c:229 bad_kernel_fault+0x180/0x310
>>>>>>>>>
>>>>>>>>>> [=C2=A0=C2=A0 96.200734] NIP [c000000000849424]=20
>>>>>>>>>> fault_in_pages_readable+0x104/0x350
>>>>>>>>>> [=C2=A0=C2=A0 96.200741] LR [c00000000084952c]=20
>>>>>>>>>> fault_in_pages_readable+0x20c/0x350
>>>>>>>>>> [=C2=A0=C2=A0 96.200747] --- interrupt: 300
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> Problem happens in a section where userspace access is supposed=20
>>>>>>>>> to be granted, so the patch you
>>>>>>>>> proposed is definitely not the right fix.
>>>>>>>>>
>>>>>>>>> c000000000849408:=C2=A0=C2=A0=C2=A0 2c 01 00 4c=C2=A0=C2=A0=C2=A0=
=C2=A0 isync
>>>>>>>>> c00000000084940c:=C2=A0=C2=A0=C2=A0 a6 03 3d 7d=C2=A0=C2=A0=C2=A0=
=C2=A0 mtspr=C2=A0=C2=A0 29,r9=C2=A0 <=3D=3D granting=20
>>>>>>>>> userspace access permission
>>>>>>>>> c000000000849410:=C2=A0=C2=A0=C2=A0 2c 01 00 4c=C2=A0=C2=A0=C2=A0=
=C2=A0 isync
>>>>>>>>> c000000000849414:=C2=A0=C2=A0=C2=A0 00 00 36 e9=C2=A0=C2=A0=C2=A0=
=C2=A0 ld=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r9,0(r22)
>>>>>>>>> c000000000849418:=C2=A0=C2=A0=C2=A0 20 00 29 81=C2=A0=C2=A0=C2=A0=
=C2=A0 lwz=C2=A0=C2=A0=C2=A0=C2=A0 r9,32(r9)
>>>>>>>>> c00000000084941c:=C2=A0=C2=A0=C2=A0 00 02 29 71=C2=A0=C2=A0=C2=A0=
=C2=A0 andi.=C2=A0=C2=A0 r9,r9,512
>>>>>>>>> c000000000849420:=C2=A0=C2=A0=C2=A0 78 d3 5e 7f=C2=A0=C2=A0=C2=A0=
=C2=A0 mr=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r30,r26
>>>>>>>>> =3D=3D> c000000000849424:=C2=A0=C2=A0=C2=A0 00 00 bf 8b=C2=A0=C2=
=A0=C2=A0=C2=A0 lbz=C2=A0=C2=A0=C2=A0=C2=A0 r29,0(r31)=C2=A0 <=3D=3D=20
>>>>>>>>> accessing userspace
>>>>>>>>> c000000000849428:=C2=A0=C2=A0=C2=A0 10 00 82 41=C2=A0=C2=A0=C2=A0=
=C2=A0 beq=C2=A0=C2=A0=C2=A0=C2=A0 c000000000849438=20
>>>>>>>>> <fault_in_pages_readable+0x118>
>>>>>>>>> c00000000084942c:=C2=A0=C2=A0=C2=A0 2c 01 00 4c=C2=A0=C2=A0=C2=A0=
=C2=A0 isync
>>>>>>>>> c000000000849430:=C2=A0=C2=A0=C2=A0 a6 03 bd 7e=C2=A0=C2=A0=C2=A0=
=C2=A0 mtspr=C2=A0=C2=A0 29,r21=C2=A0 <=3D=3D=20
>>>>>>>>> clearing userspace access permission
>>>>>>>>> c000000000849434:=C2=A0=C2=A0=C2=A0 2c 01 00 4c=C2=A0=C2=A0=C2=A0=
=C2=A0 isync
>>>>>>>>>
>>>>>>>>> My first guess is that the problem is linked to the following=20
>>>>>>>>> function, see the comment
>>>>>>>>>
>>>>>>>>> /*
>>>>>>>>> =C2=A0=C2=A0 * For kernel thread that doesn't have thread.regs re=
turn
>>>>>>>>> =C2=A0=C2=A0 * default AMR/IAMR values.
>>>>>>>>> =C2=A0=C2=A0 */
>>>>>>>>> static inline u64 current_thread_amr(void)
>>>>>>>>> {
>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0if (current->thread.regs)
>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return current->thread=
.regs->amr;
>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0return AMR_KUAP_BLOCKED;
>>>>>>>>> }
>>>>>>>>>
>>>>>>>>> Above function was introduced by commit 48a8ab4eeb82=20
>>>>>>>>> ("powerpc/book3s64/pkeys: Don't update SPRN_AMR
>>>>>>>>> when in kernel mode")
>>>>>>>>
>>>>>>>> Yeah that's a bit of a curly one.
>>>>>>>>
>>>>>>>> At some point io_uring did kthread_use_mm(), which is supposed to=20
>>>>>>>> mean
>>>>>>>> the kthread can operate on behalf of the original process that=20
>>>>>>>> submitted
>>>>>>>> the IO.
>>>>>>>>
>>>>>>>> But because KUAP is implemented using memory protection keys, it=20
>>>>>>>> depends
>>>>>>>> on the value of the AMR register, which is not part of the mm,=20
>>>>>>>> it's in
>>>>>>>> thread.regs->amr.
>>>>>>>>
>>>>>>>> And what's worse by the time we're in kthread_use_mm() we no=20
>>>>>>>> longer have
>>>>>>>> access to the thread.regs->amr of the original process that=20
>>>>>>>> submitted
>>>>>>>> the IO.
>>>>>>>>
>>>>>>>> We also can't simply move the AMR into the mm, precisely because=20
>>>>>>>> it's
>>>>>>>> per thread, not per mm.
>>>>>>>>
>>>>>>>> So TBH I don't know how we're going to fix this.
>>>>>>>>
>>>>>>>> I guess we could return AMR=3Dunblocked for kernel threads, but th=
at's
>>>>>>>> arguably a bug because it allows a process to circumvent memory=20
>>>>>>>> keys by
>>>>>>>> asking the kernel to do the access.
>>>>>>>
>>>>>>> We shouldn't need to inherit AMR should we? We only need it to be=20
>>>>>>> locked
>>>>>>> for kernel threads until it's explicitly unlocked -- nothing mm=20
>>>>>>> specific
>>>>>>> there. I think current_thread_amr could return 0 for kernel=20
>>>>>>> threads? Or
>>>>>>> I would even avoid using that function for allow_user_access and op=
en
>>>>>>> code the kthread case and remove it from current_thread_amr().
>>>>>>>
>>>>>>> Thanks,
>>>>>>> Nick
>>>>>>
>>>>>
>>>>> updated one
>>>>>
>>>>> =C2=A0From 8fdb0680f983940d61f91da8252b13c8d3e8ebee Mon Sep 17 00:00:=
00 2001
>>>>> From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
>>>>> Date: Tue, 2 Feb 2021 09:23:38 +0530
>>>>> Subject: [PATCH v2] powerpc/kuap: Allow kernel thread to access=20
>>>>> userspace
>>>>> =C2=A0 after kthread_use_mm
>>>>>
>>>>> This fix the bad fault reported by KUAP when io_wqe_worker access=20
>>>>> userspace.
>>>>>
>>>>> =C2=A0 Bug: Read fault blocked by KUAP!
>>>>> =C2=A0 WARNING: CPU: 1 PID: 101841 at arch/powerpc/mm/fault.c:229=20
>>>>> __do_page_fault+0x6b4/0xcd0
>>>>> =C2=A0 NIP [c00000000009e7e4] __do_page_fault+0x6b4/0xcd0
>>>>> =C2=A0 LR [c00000000009e7e0] __do_page_fault+0x6b0/0xcd0
>>>>> ..........
>>>>> =C2=A0 Call Trace:
>>>>> =C2=A0 [c000000016367330] [c00000000009e7e0] __do_page_fault+0x6b0/0x=
cd0=20
>>>>> (unreliable)
>>>>> =C2=A0 [c0000000163673e0] [c00000000009ee3c] do_page_fault+0x3c/0x120
>>>>> =C2=A0 [c000000016367430] [c00000000000c848] handle_page_fault+0x10/0=
x2c
>>>>> =C2=A0 --- interrupt: 300 at iov_iter_fault_in_readable+0x148/0x6f0
>>>>> ..........
>>>>> =C2=A0 NIP [c0000000008e8228] iov_iter_fault_in_readable+0x148/0x6f0
>>>>> =C2=A0 LR [c0000000008e834c] iov_iter_fault_in_readable+0x26c/0x6f0
>>>>> =C2=A0 interrupt: 300
>>>>> =C2=A0 [c0000000163677e0] [c0000000007154a0] iomap_write_actor+0xc0/0=
x280
>>>>> =C2=A0 [c000000016367880] [c00000000070fc94] iomap_apply+0x1c4/0x780
>>>>> =C2=A0 [c000000016367990] [c000000000710330]=20
>>>>> iomap_file_buffered_write+0xa0/0x120
>>>>> =C2=A0 [c0000000163679e0] [c00800000040791c]=20
>>>>> xfs_file_buffered_aio_write+0x314/0x5e0 [xfs]
>>>>> =C2=A0 [c000000016367a90] [c0000000006d74bc] io_write+0x10c/0x460
>>>>> =C2=A0 [c000000016367bb0] [c0000000006d80e4] io_issue_sqe+0x8d4/0x120=
0
>>>>> =C2=A0 [c000000016367c70] [c0000000006d8ad0] io_wq_submit_work+0xc0/0=
x250
>>>>> =C2=A0 [c000000016367cb0] [c0000000006e2578]=20
>>>>> io_worker_handle_work+0x498/0x800
>>>>> =C2=A0 [c000000016367d40] [c0000000006e2cdc] io_wqe_worker+0x3fc/0x4f=
0
>>>>> =C2=A0 [c000000016367da0] [c0000000001cb0a4] kthread+0x1c4/0x1d0
>>>>> =C2=A0 [c000000016367e10] [c00000000000dbf0]=20
>>>>> ret_from_kernel_thread+0x5c/0x6c
>>>>>
>>>>> The kernel consider thread AMR value for kernel thread to be
>>>>> AMR_KUAP_BLOCKED. Hence access to userspace is denied. This
>>>>> of course not correct and we should allow userspace access after
>>>>> kthread_use_mm(). To be precise, kthread_use_mm() should inherit the
>>>>> AMR value of the operating address space. But, the AMR value is
>>>>> thread-specific and we inherit the address space and not thread
>>>>> access restrictions. Because of this ignore AMR value when accessing
>>>>> userspace via kernel thread.
>>>>>
>>>>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>>>>> ---
>>>>> Changes from v1:
>>>>> * Address review feedback from Nick
>>>>>
>>>>> =C2=A0 arch/powerpc/include/asm/book3s/64/kup.h | 8 +++++++-
>>>>> =C2=A0 1 file changed, 7 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/arch/powerpc/include/asm/book3s/64/kup.h=20
>>>>> b/arch/powerpc/include/asm/book3s/64/kup.h
>>>>> index f50f72e535aa..95f4df99249e 100644
>>>>> --- a/arch/powerpc/include/asm/book3s/64/kup.h
>>>>> +++ b/arch/powerpc/include/asm/book3s/64/kup.h
>>>>> @@ -384,7 +384,13 @@ static __always_inline void=20
>>>>> allow_user_access(void __user *to, const void __user
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // This is written so we can resolve t=
o a single case at build=20
>>>>> time
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BUILD_BUG_ON(!__builtin_constant_p(dir=
));
>>>>> -=C2=A0=C2=A0=C2=A0 if (mmu_has_feature(MMU_FTR_PKEY))
>>>>> +=C2=A0=C2=A0=C2=A0 /*
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * if it is a kthread that did kthread_use_m=
m() don't
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * use current_thread_amr().
>>>>
>>>> According to include/linux/sched.h, PF_KTHREAD means /* I am a kernel=20
>>>> thread */
>>>> It doesn't seem to be related to kthread_use_mm()
>>>
>>> That should be a sufficient check here. if we did reach here without=20
>>> calling kthread_user_mm, we will crash on access because we don't have=20
>>> a mm attached to the current process.=C2=A0 a kernel thread with=20
>>> kthread_use_mm has
>>=20
>> Ok but then the comment doesn't match the check.
>=20
>=20
> I was trying to be explict in the comment that we expect the thread to=20
> have done kthread_use_mm().

I would avoid making it sound conditional. There is no way for a kernel=20
thread to ever access user without having done so.

 /*
  * Kernel threads may access user mm with kthread_use_mm() but
  * can't use current_thread_amr because they have thread.regs=3D=3DNULL,
  * but they have no pkeys.
  */

>=20
>>=20
>> And also the comment in current_thread_amr() is then misleading.
>>=20
>> Why not do the current->flags & PF_KTHREAD check in current_thread_amr()=
=20
>> and return 0 in that case instead of BLOCKED ?
>=20
> In my view currrent_thread_amr() is more generic and we want to be=20
> explicit there that a kernel thread AMR is KUAP_BLOCKED. Only when we=20
> call allow user access, we relax the AMR value.

current_thread_amr() shouldn't be used by kernel threads ever
(after the patch). It's just confusing. The user access or the
check could have a test and warning for !current->mm if there
is a concern about it (maybe there already is one somehwere).

Thanks,
Nick
