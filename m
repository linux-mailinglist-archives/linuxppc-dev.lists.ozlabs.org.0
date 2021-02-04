Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C7E30F9FD
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 18:44:35 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DWmC46SxjzDwlP
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Feb 2021 04:44:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ghhaijef; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DWm9Q6BvpzDqXQ
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Feb 2021 04:43:06 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 114HdkaQ100781; Thu, 4 Feb 2021 12:42:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=jWKN7ivBhipxSgsZv68MBdF+13WVyGb0j26H7NQlM1g=;
 b=ghhaijefJyDAn/f933vu96KpXAgEshbyXXgx+av3rM1bk+bPQDWoSzZ6obi58DtSl/7o
 FzS1vPak6EdJ5g+F87IO8c2oXLjlvyfr+6qVYT3EiTB1y5p/bzCaHHqGH+sYVeYVzmBB
 B51SdLovu04oC78TzltWDD11hq5QpRDN8TRnxMlYTQAzgo4dJx8WQ12izhH4e8BPRivV
 GswKF3Gaopq1H+nCh7rXT/vrxXusAHvMIELlkXOKq6BHCvEMRKg/MkqW8rduPs0+Cmz3
 zwxyFR2NMeQ5aiKGr0hHXfdrenMHHBRd/z0w9zKlngaFF1Tgx/5e3KMR2iSfwOfjJFVc pQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36gma9jdwx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Feb 2021 12:42:55 -0500
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 114HdlbD100789;
 Thu, 4 Feb 2021 12:42:55 -0500
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36gma9jdvd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Feb 2021 12:42:55 -0500
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 114HgMmc016140;
 Thu, 4 Feb 2021 17:42:52 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03ams.nl.ibm.com with ESMTP id 36fwcw16q0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Feb 2021 17:42:52 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 114HgofJ44171738
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 4 Feb 2021 17:42:50 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3D32F11C058;
 Thu,  4 Feb 2021 17:42:50 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6888C11C04A;
 Thu,  4 Feb 2021 17:42:48 +0000 (GMT)
Received: from [9.102.0.141] (unknown [9.102.0.141])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  4 Feb 2021 17:42:48 +0000 (GMT)
Subject: Re: [PATCH] powerpc/fault: fix wrong KUAP fault for IO_URING
To: Zorro Lang <zlang@redhat.com>
References: <87r1m2d5z4.fsf@mpe.ellerman.id.au>
 <1612014260.b4fac0liie.astroid@bobo.none> <877dnrrsbu.fsf@linux.ibm.com>
 <874kivrp2v.fsf@linux.ibm.com>
 <6b081ea7-e4ee-21bb-7085-e33b4e5c6205@csgroup.eu>
 <7c48c517-700d-e114-503d-e68e0e73c534@linux.ibm.com>
 <7c06ba68-9959-44bc-233b-473d7cbc574a@csgroup.eu>
 <e2dfb7ec-a4d4-579d-a79b-6709df6e9e50@linux.ibm.com>
 <086f6525-b851-c4c0-d611-42f76a54a2d9@kernel.dk>
 <490cea1a-8161-2f76-03e6-7e2b16efa648@linux.ibm.com>
 <20210204175703.GH14354@localhost.localdomain>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <37d95a48-d62a-9da5-2825-5252c1b3cd1c@linux.ibm.com>
Date: Thu, 4 Feb 2021 23:12:47 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210204175703.GH14354@localhost.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-04_09:2021-02-04,
 2021-02-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015
 adultscore=0 mlxlogscore=999 priorityscore=1501 bulkscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102040104
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
Cc: Jens Axboe <axboe@kernel.dk>, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2/4/21 11:27 PM, Zorro Lang wrote:
> On Thu, Feb 04, 2021 at 10:31:59PM +0530, Aneesh Kumar K.V wrote:
>> On 2/4/21 10:23 PM, Jens Axboe wrote:
>>> On 2/1/21 11:30 PM, Aneesh Kumar K.V wrote:
>>>> On 2/2/21 11:50 AM, Christophe Leroy wrote:
>>>>>
>>>>>
>>>>> Le 02/02/2021 à 07:16, Aneesh Kumar K.V a écrit :
>>>>>> On 2/2/21 11:32 AM, Christophe Leroy wrote:
>>>>>>>
>>>>>>>
>>>>>>> Le 02/02/2021 à 06:55, Aneesh Kumar K.V a écrit :
>>>>>>>> Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com> writes:
>>>>>>>>
>>>>>>>>> Nicholas Piggin <npiggin@gmail.com> writes:
>>>>>>>>>
>>>>>>>>>> Excerpts from Michael Ellerman's message of January 30, 2021 9:22 pm:
>>>>>>>>>>> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
>>>>>>>>>>>> +Aneesh
>>>>>>>>>>>>
>>>>>>>>>>>> Le 29/01/2021 à 07:52, Zorro Lang a écrit :
>>>>>>>>>>> ..
>>>>>>>>>>>>> [   96.200296] ------------[ cut here ]------------
>>>>>>>>>>>>> [   96.200304] Bug: Read fault blocked by KUAP!
>>>>>>>>>>>>> [   96.200309] WARNING: CPU: 3 PID: 1876 at
>>>>>>>>>>>>> arch/powerpc/mm/fault.c:229 bad_kernel_fault+0x180/0x310
>>>>>>>>>>>>
>>>>>>>>>>>>> [   96.200734] NIP [c000000000849424]
>>>>>>>>>>>>> fault_in_pages_readable+0x104/0x350
>>>>>>>>>>>>> [   96.200741] LR [c00000000084952c]
>>>>>>>>>>>>> fault_in_pages_readable+0x20c/0x350
>>>>>>>>>>>>> [   96.200747] --- interrupt: 300
>>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>> Problem happens in a section where userspace access is supposed
>>>>>>>>>>>> to be granted, so the patch you
>>>>>>>>>>>> proposed is definitely not the right fix.
>>>>>>>>>>>>
>>>>>>>>>>>> c000000000849408:    2c 01 00 4c     isync
>>>>>>>>>>>> c00000000084940c:    a6 03 3d 7d     mtspr   29,r9  <== granting
>>>>>>>>>>>> userspace access permission
>>>>>>>>>>>> c000000000849410:    2c 01 00 4c     isync
>>>>>>>>>>>> c000000000849414:    00 00 36 e9     ld      r9,0(r22)
>>>>>>>>>>>> c000000000849418:    20 00 29 81     lwz     r9,32(r9)
>>>>>>>>>>>> c00000000084941c:    00 02 29 71     andi.   r9,r9,512
>>>>>>>>>>>> c000000000849420:    78 d3 5e 7f     mr      r30,r26
>>>>>>>>>>>> ==> c000000000849424:    00 00 bf 8b     lbz     r29,0(r31)  <==
>>>>>>>>>>>> accessing userspace
>>>>>>>>>>>> c000000000849428:    10 00 82 41     beq     c000000000849438
>>>>>>>>>>>> <fault_in_pages_readable+0x118>
>>>>>>>>>>>> c00000000084942c:    2c 01 00 4c     isync
>>>>>>>>>>>> c000000000849430:    a6 03 bd 7e     mtspr   29,r21  <==
>>>>>>>>>>>> clearing userspace access permission
>>>>>>>>>>>> c000000000849434:    2c 01 00 4c     isync
>>>>>>>>>>>>
>>>>>>>>>>>> My first guess is that the problem is linked to the following
>>>>>>>>>>>> function, see the comment
>>>>>>>>>>>>
>>>>>>>>>>>> /*
>>>>>>>>>>>>      * For kernel thread that doesn't have thread.regs return
>>>>>>>>>>>>      * default AMR/IAMR values.
>>>>>>>>>>>>      */
>>>>>>>>>>>> static inline u64 current_thread_amr(void)
>>>>>>>>>>>> {
>>>>>>>>>>>>       if (current->thread.regs)
>>>>>>>>>>>>           return current->thread.regs->amr;
>>>>>>>>>>>>       return AMR_KUAP_BLOCKED;
>>>>>>>>>>>> }
>>>>>>>>>>>>
>>>>>>>>>>>> Above function was introduced by commit 48a8ab4eeb82
>>>>>>>>>>>> ("powerpc/book3s64/pkeys: Don't update SPRN_AMR
>>>>>>>>>>>> when in kernel mode")
>>>>>>>>>>>
>>>>>>>>>>> Yeah that's a bit of a curly one.
>>>>>>>>>>>
>>>>>>>>>>> At some point io_uring did kthread_use_mm(), which is supposed to
>>>>>>>>>>> mean
>>>>>>>>>>> the kthread can operate on behalf of the original process that
>>>>>>>>>>> submitted
>>>>>>>>>>> the IO.
>>>>>>>>>>>
>>>>>>>>>>> But because KUAP is implemented using memory protection keys, it
>>>>>>>>>>> depends
>>>>>>>>>>> on the value of the AMR register, which is not part of the mm,
>>>>>>>>>>> it's in
>>>>>>>>>>> thread.regs->amr.
>>>>>>>>>>>
>>>>>>>>>>> And what's worse by the time we're in kthread_use_mm() we no
>>>>>>>>>>> longer have
>>>>>>>>>>> access to the thread.regs->amr of the original process that
>>>>>>>>>>> submitted
>>>>>>>>>>> the IO.
>>>>>>>>>>>
>>>>>>>>>>> We also can't simply move the AMR into the mm, precisely because
>>>>>>>>>>> it's
>>>>>>>>>>> per thread, not per mm.
>>>>>>>>>>>
>>>>>>>>>>> So TBH I don't know how we're going to fix this.
>>>>>>>>>>>
>>>>>>>>>>> I guess we could return AMR=unblocked for kernel threads, but that's
>>>>>>>>>>> arguably a bug because it allows a process to circumvent memory
>>>>>>>>>>> keys by
>>>>>>>>>>> asking the kernel to do the access.
>>>>>>>>>>
>>>>>>>>>> We shouldn't need to inherit AMR should we? We only need it to be
>>>>>>>>>> locked
>>>>>>>>>> for kernel threads until it's explicitly unlocked -- nothing mm
>>>>>>>>>> specific
>>>>>>>>>> there. I think current_thread_amr could return 0 for kernel
>>>>>>>>>> threads? Or
>>>>>>>>>> I would even avoid using that function for allow_user_access and open
>>>>>>>>>> code the kthread case and remove it from current_thread_amr().
>>>>>>>>>>
>>>>>>>>>> Thanks,
>>>>>>>>>> Nick
>>>>>>>>>
>>>>>>>>
>>>>>>>> updated one
>>>>>>>>
>>>>>>>>    From 8fdb0680f983940d61f91da8252b13c8d3e8ebee Mon Sep 17 00:00:00 2001
>>>>>>>> From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
>>>>>>>> Date: Tue, 2 Feb 2021 09:23:38 +0530
>>>>>>>> Subject: [PATCH v2] powerpc/kuap: Allow kernel thread to access
>>>>>>>> userspace
>>>>>>>>     after kthread_use_mm
>>>>>>>>
>>>>>>>> This fix the bad fault reported by KUAP when io_wqe_worker access
>>>>>>>> userspace.
>>>>>>>>
>>>>>>>>     Bug: Read fault blocked by KUAP!
>>>>>>>>     WARNING: CPU: 1 PID: 101841 at arch/powerpc/mm/fault.c:229
>>>>>>>> __do_page_fault+0x6b4/0xcd0
>>>>>>>>     NIP [c00000000009e7e4] __do_page_fault+0x6b4/0xcd0
>>>>>>>>     LR [c00000000009e7e0] __do_page_fault+0x6b0/0xcd0
>>>>>>>> ..........
>>>>>>>>     Call Trace:
>>>>>>>>     [c000000016367330] [c00000000009e7e0] __do_page_fault+0x6b0/0xcd0
>>>>>>>> (unreliable)
>>>>>>>>     [c0000000163673e0] [c00000000009ee3c] do_page_fault+0x3c/0x120
>>>>>>>>     [c000000016367430] [c00000000000c848] handle_page_fault+0x10/0x2c
>>>>>>>>     --- interrupt: 300 at iov_iter_fault_in_readable+0x148/0x6f0
>>>>>>>> ..........
>>>>>>>>     NIP [c0000000008e8228] iov_iter_fault_in_readable+0x148/0x6f0
>>>>>>>>     LR [c0000000008e834c] iov_iter_fault_in_readable+0x26c/0x6f0
>>>>>>>>     interrupt: 300
>>>>>>>>     [c0000000163677e0] [c0000000007154a0] iomap_write_actor+0xc0/0x280
>>>>>>>>     [c000000016367880] [c00000000070fc94] iomap_apply+0x1c4/0x780
>>>>>>>>     [c000000016367990] [c000000000710330]
>>>>>>>> iomap_file_buffered_write+0xa0/0x120
>>>>>>>>     [c0000000163679e0] [c00800000040791c]
>>>>>>>> xfs_file_buffered_aio_write+0x314/0x5e0 [xfs]
>>>>>>>>     [c000000016367a90] [c0000000006d74bc] io_write+0x10c/0x460
>>>>>>>>     [c000000016367bb0] [c0000000006d80e4] io_issue_sqe+0x8d4/0x1200
>>>>>>>>     [c000000016367c70] [c0000000006d8ad0] io_wq_submit_work+0xc0/0x250
>>>>>>>>     [c000000016367cb0] [c0000000006e2578]
>>>>>>>> io_worker_handle_work+0x498/0x800
>>>>>>>>     [c000000016367d40] [c0000000006e2cdc] io_wqe_worker+0x3fc/0x4f0
>>>>>>>>     [c000000016367da0] [c0000000001cb0a4] kthread+0x1c4/0x1d0
>>>>>>>>     [c000000016367e10] [c00000000000dbf0]
>>>>>>>> ret_from_kernel_thread+0x5c/0x6c
>>>>>>>>
>>>>>>>> The kernel consider thread AMR value for kernel thread to be
>>>>>>>> AMR_KUAP_BLOCKED. Hence access to userspace is denied. This
>>>>>>>> of course not correct and we should allow userspace access after
>>>>>>>> kthread_use_mm(). To be precise, kthread_use_mm() should inherit the
>>>>>>>> AMR value of the operating address space. But, the AMR value is
>>>>>>>> thread-specific and we inherit the address space and not thread
>>>>>>>> access restrictions. Because of this ignore AMR value when accessing
>>>>>>>> userspace via kernel thread.
>>>>>>>>
>>>>>>>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>>>>>>>> ---
>>>>>>>> Changes from v1:
>>>>>>>> * Address review feedback from Nick
>>>>>>>>
>>>>>>>>     arch/powerpc/include/asm/book3s/64/kup.h | 8 +++++++-
>>>>>>>>     1 file changed, 7 insertions(+), 1 deletion(-)
>>>>>>>>
>>>>>>>> diff --git a/arch/powerpc/include/asm/book3s/64/kup.h
>>>>>>>> b/arch/powerpc/include/asm/book3s/64/kup.h
>>>>>>>> index f50f72e535aa..95f4df99249e 100644
>>>>>>>> --- a/arch/powerpc/include/asm/book3s/64/kup.h
>>>>>>>> +++ b/arch/powerpc/include/asm/book3s/64/kup.h
>>>>>>>> @@ -384,7 +384,13 @@ static __always_inline void
>>>>>>>> allow_user_access(void __user *to, const void __user
>>>>>>>>         // This is written so we can resolve to a single case at build
>>>>>>>> time
>>>>>>>>         BUILD_BUG_ON(!__builtin_constant_p(dir));
>>>>>>>> -    if (mmu_has_feature(MMU_FTR_PKEY))
>>>>>>>> +    /*
>>>>>>>> +     * if it is a kthread that did kthread_use_mm() don't
>>>>>>>> +     * use current_thread_amr().
>>>>>>>
>>>>>>> According to include/linux/sched.h, PF_KTHREAD means /* I am a kernel
>>>>>>> thread */
>>>>>>> It doesn't seem to be related to kthread_use_mm()
>>>>>>
>>>>>> That should be a sufficient check here. if we did reach here without
>>>>>> calling kthread_user_mm, we will crash on access because we don't have
>>>>>> a mm attached to the current process.  a kernel thread with
>>>>>> kthread_use_mm has
>>>>>
>>>>> Ok but then the comment doesn't match the check.
>>>>
>>>>
>>>> I was trying to be explict in the comment that we expect the thread to
>>>> have done kthread_use_mm().
>>>>
>>>>>
>>>>> And also the comment in current_thread_amr() is then misleading.
>>>>>
>>>>> Why not do the current->flags & PF_KTHREAD check in current_thread_amr()
>>>>> and return 0 in that case instead of BLOCKED ?
>>>>
>>>> In my view currrent_thread_amr() is more generic and we want to be
>>>> explicit there that a kernel thread AMR is KUAP_BLOCKED. Only when we
>>>> call allow user access, we relax the AMR value.
>>>
>>> Just following up on this, as I'd hate to have 5.11 released with this
>>> bug in it for powerpc. It'll obviously also affect other cases of a
>>> kernel thread faulting after having done kthread_use_mm(), though I'm
>>> not sure how widespread that is. In any case, it'll leave io_uring
>>> mostly broken on powerpc if this isn't patched for release.
>>>
>>
>> I am waiting for test feedback on the change I posted earlier. I am also
>> running a regression run myself. Once that is complete i will post the patch
>> as a separate email.
> 
> Are you waiting a test from me? Or someone else who test PPC? Although I'm
> the "Reported-by" of this bug, I just can help to verify this bug itself,
> I don't have enough test cases to do regression test from PPC side. Do you need
> me to verify this bug itself.
> 
>

If you can verify this bug, it would be really helpful.

-aneesh
