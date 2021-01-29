Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D36308912
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jan 2021 13:32:16 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DRxYS0SQZzDq6k
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jan 2021 23:32:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DRxSl5FcdzDrTN
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Jan 2021 23:27:55 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DRxSM61F1zB09bL;
 Fri, 29 Jan 2021 13:27:47 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id nMpLfxfxRL_R; Fri, 29 Jan 2021 13:27:47 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DRxSM52jvzB09bK;
 Fri, 29 Jan 2021 13:27:47 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1DB928B823;
 Fri, 29 Jan 2021 13:27:49 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id e46hPmQhq8TA; Fri, 29 Jan 2021 13:27:49 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 56C818B822;
 Fri, 29 Jan 2021 13:27:48 +0100 (CET)
Subject: Re: [PATCH] powerpc/fault: fix wrong KUAP fault for IO_URING
To: Zorro Lang <zlang@redhat.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
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
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <18dd441b-440a-fe95-0907-d8cec5b49410@csgroup.eu>
Date: Fri, 29 Jan 2021 13:26:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210129065220.GS14354@localhost.localdomain>
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
Cc: Jens Axboe <axboe@kernel.dk>, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

+Aneesh

Le 29/01/2021 à 07:52, Zorro Lang a écrit :
> On Thu, Jan 28, 2021 at 03:44:21PM +0100, Christophe Leroy wrote:
>>
>>
>> Le 28/01/2021 à 15:42, Jens Axboe a écrit :
>>> On 1/28/21 6:52 AM, Zorro Lang wrote:
>>>> On Wed, Jan 27, 2021 at 08:06:37PM -0700, Jens Axboe wrote:
>>>>> On 1/27/21 8:13 PM, Zorro Lang wrote:
>>>>>> On Thu, Jan 28, 2021 at 10:18:07AM +1000, Nicholas Piggin wrote:
>>>>>>> Excerpts from Jens Axboe's message of January 28, 2021 5:29 am:
>>>>>>>> On 1/27/21 9:38 AM, Christophe Leroy wrote:
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> Le 27/01/2021 à 15:56, Zorro Lang a écrit :
>>>>>>>>>> On powerpc, io_uring test hit below KUAP fault on __do_page_fault.
>>>>>>>>>> The fail source line is:
>>>>>>>>>>
>>>>>>>>>>      if (unlikely(!is_user && bad_kernel_fault(regs, error_code, address, is_write)))
>>>>>>>>>>          return SIGSEGV;
>>>>>>>>>>
>>>>>>>>>> The is_user() is based on user_mod(regs) only. This's not suit for
>>>>>>>>>> io_uring, where the helper thread can assume the user app identity
>>>>>>>>>> and could perform this fault just fine. So turn to use mm to decide
>>>>>>>>>> if this is valid or not.
>>>>>>>>>
>>>>>>>>> I don't understand why testing is_user would be an issue. KUAP purpose
>>>>>>>>> it to block any unallowed access from kernel to user memory
>>>>>>>>> (Equivalent to SMAP on x86). So it really must be based on MSR_PR bit,
>>>>>>>>> that is what is_user provides.
>>>>>>>>>
>>>>>>>>> If the kernel access is legitimate, kernel should have opened
>>>>>>>>> userspace access then you shouldn't get this "Bug: Read fault blocked
>>>>>>>>> by KUAP!".
>>>>>>>>>
>>>>>>>>> As far as I understand, the fault occurs in
>>>>>>>>> iov_iter_fault_in_readable() which calls fault_in_pages_readable() And
>>>>>>>>> fault_in_pages_readable() uses __get_user() so it is a legitimate
>>>>>>>>> access and you really should get a KUAP fault.
>>>>>>>>>
>>>>>>>>> So the problem is somewhere else, I think you proposed patch just
>>>>>>>>> hides the problem, it doesn't fix it.
>>>>>>>>
>>>>>>>> If we do kthread_use_mm(), can we agree that the user access is valid?
>>>>>>>
>>>>>>> Yeah the io uring code is fine, provided it uses the uaccess primitives
>>>>>>> like any other kernel code. It's looking more like a an arch/powerpc bug.
>>>>>>>
>>>>>>>> We should be able to copy to/from user space, and including faults, if
>>>>>>>> that's been done and the new mm assigned. Because it really should be.
>>>>>>>> If SMAP was a problem on x86, we would have seen it long ago.
>>>>>>>>
>>>>>>>> I'm assuming this may be breakage related to the recent uaccess changes
>>>>>>>> related to set_fs and friends? Or maybe recent changes on the powerpc
>>>>>>>> side?
>>>>>>>>
>>>>>>>> Zorro, did 5.10 work?
>>>>>>>
>>>>>>> Would be interesting to know.
>>>>>>
>>>>>> Sure Nick and Jens, which 5.10 rc? version do you want to know ? Or any git
>>>>>> commit(be the HEAD) in 5.10 phase?
>>>>>
>>>>> I forget which versions had what series of this, but 5.10 final - and if
>>>>> that fails, then 5.9 final. IIRC, 5.9 was pre any of these changes, and
>>>>> 5.10 definitely has them.
>>>>
>>>> I justed built linux v5.10 with same .config file, and gave it same test.
>>>> v5.10 (HEAD=2c85ebc57b Linux 5.10) can't reproduce this bug:
>>>>
>>>> # ./check generic/013 generic/051
>>>> FSTYP         -- xfs (non-debug)
>>>> PLATFORM      -- Linux/ppc64le ibm-p9z-xxx-xxxx 5.10.0 #3 SMP Thu Jan 28 04:12:14 EST 2021
>>>> MKFS_OPTIONS  -- -f -m crc=1,finobt=1,reflink=1,rmapbt=1,bigtime=1,inobtcount=1 /dev/sda3
>>>> MOUNT_OPTIONS -- -o context=system_u:object_r:root_t:s0 /dev/sda3 /mnt/xfstests/scratch
>>>>
>>>> generic/013 138s ...  77s
>>>> generic/051 103s ...  143s
>>>> Ran: generic/013 generic/051
>>>> Passed all 2 tests
>>>
>>> Thanks for testing that, so I think it's safe to conclude that there's a
>>> regression in powerpc fault handling for kthreads that use
>>> kthread_use_mm in this release. A bisect would definitely find it, but
>>> might be pointless if Christophe or Nick already have an idea of what it
>>> is.
>>>
>>
>> I don't have any idea yet, but I'd be curious to see the vmlinux binary matching the reported Oops.
> 
> I just upload the vmlinux and .config file, the vmlinux it too big, I have to
> upload it to my google store and share the link as below:
> 
> config file: https://drive.google.com/file/d/1pMszboxdjbMPqSNXnMH-1UCZC-vtDnI9/view?usp=sharing
> vmlinux: https://drive.google.com/file/d/1s7g2eBPAFFV61aM2dO9bvVTERGQ9mLYk/view?usp=sharing
> 
> I used latest upstream mainline linux, HEAD commit is:
> 76c057c84d (HEAD -> master, origin/master, origin/HEAD) Merge branch 'parisc-5.11-2' of git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux
> 
> The test failed on this kernel as:
> 
> # dmesg
> [   96.200296] ------------[ cut here ]------------
> [   96.200304] Bug: Read fault blocked by KUAP!
> [   96.200309] WARNING: CPU: 3 PID: 1876 at arch/powerpc/mm/fault.c:229 bad_kernel_fault+0x180/0x310

> [   96.200734] NIP [c000000000849424] fault_in_pages_readable+0x104/0x350
> [   96.200741] LR [c00000000084952c] fault_in_pages_readable+0x20c/0x350
> [   96.200747] --- interrupt: 300


Problem happens in a section where userspace access is supposed to be granted, so the patch you 
proposed is definitely not the right fix.

c000000000849408:	2c 01 00 4c 	isync
c00000000084940c:	a6 03 3d 7d 	mtspr   29,r9  <== granting userspace access permission
c000000000849410:	2c 01 00 4c 	isync
c000000000849414:	00 00 36 e9 	ld      r9,0(r22)
c000000000849418:	20 00 29 81 	lwz     r9,32(r9)
c00000000084941c:	00 02 29 71 	andi.   r9,r9,512
c000000000849420:	78 d3 5e 7f 	mr      r30,r26
==> c000000000849424:	00 00 bf 8b 	lbz     r29,0(r31)  <== accessing userspace
c000000000849428:	10 00 82 41 	beq     c000000000849438 <fault_in_pages_readable+0x118>
c00000000084942c:	2c 01 00 4c 	isync
c000000000849430:	a6 03 bd 7e 	mtspr   29,r21  <== clearing userspace access permission
c000000000849434:	2c 01 00 4c 	isync

My first guess is that the problem is linked to the following function, see the comment

/*
  * For kernel thread that doesn't have thread.regs return
  * default AMR/IAMR values.
  */
static inline u64 current_thread_amr(void)
{
	if (current->thread.regs)
		return current->thread.regs->amr;
	return AMR_KUAP_BLOCKED;
}

Above function was introduced by commit 48a8ab4eeb82 ("powerpc/book3s64/pkeys: Don't update SPRN_AMR 
when in kernel mode")

Aneesh, any idea ?

Christophe
