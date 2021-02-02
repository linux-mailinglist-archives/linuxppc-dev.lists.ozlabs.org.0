Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 540EC30B6A9
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Feb 2021 05:47:23 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DVC3D29NHzDqlW
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Feb 2021 15:47:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=lks1/XpV; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DVC1C2W4GzDqgS
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Feb 2021 15:45:34 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 1124hSZU058865; Mon, 1 Feb 2021 23:45:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=psy80Oh08RBp05SF9SIXJg8XMqOyl2GPUboDj95UAS0=;
 b=lks1/XpVCOim6Wo1UzZeEQzm3CR2r8oILq0MO6GBEtKK4Fo5buFI19dvf8Aj/d09aS8K
 4bMTmtAVnictyqjp1A3Ff3eZ6U9YTSWBYTWBBDYaA9oWcXqVn1h0aDa3gRE1MGmVYE8c
 A2eOFjCu6EodAWaQKfQzLnhJvcL979MHTloqlq+AG8UyySb9a1UfyGfrtwV+W/bHyqr+
 xFXRi2eYblQNqsz/jJVyNVNM+T9ySeZFBAlHFQUzcvG/Mi9Q4/9Mz0QB2CGxZxL+NX51
 r1KZlce4Rj46uOBwPqQ3b9ZGrlwTzp9ZdwRht4Ye4n8VbAwUdh4Y0JtmJhKFicAFRAF0 aQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36eyy3810q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 01 Feb 2021 23:45:16 -0500
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 1124hW5q059167;
 Mon, 1 Feb 2021 23:45:16 -0500
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36eyy3810a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 01 Feb 2021 23:45:16 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 1124g1HK010764;
 Tue, 2 Feb 2021 04:45:15 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma04dal.us.ibm.com with ESMTP id 36ex3ngnxg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Feb 2021 04:45:15 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1124jEu45177772
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 2 Feb 2021 04:45:14 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D46F2AE05C;
 Tue,  2 Feb 2021 04:45:14 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 68DCFAE05F;
 Tue,  2 Feb 2021 04:45:12 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.199.35.92])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  2 Feb 2021 04:45:12 +0000 (GMT)
X-Mailer: emacs 27.1 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>, Zorro Lang <zlang@redhat.com>
Subject: Re: [PATCH] powerpc/fault: fix wrong KUAP fault for IO_URING
In-Reply-To: <1612014260.b4fac0liie.astroid@bobo.none>
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
 <1612014260.b4fac0liie.astroid@bobo.none>
Date: Tue, 02 Feb 2021 10:15:09 +0530
Message-ID: <877dnrrsbu.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-02_03:2021-01-29,
 2021-02-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1011
 mlxlogscore=999 bulkscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102020026
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

Nicholas Piggin <npiggin@gmail.com> writes:

> Excerpts from Michael Ellerman's message of January 30, 2021 9:22 pm:
>> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
>>> +Aneesh
>>>
>>> Le 29/01/2021 =C3=A0 07:52, Zorro Lang a =C3=A9crit=C2=A0:
>> ..
>>>> [   96.200296] ------------[ cut here ]------------
>>>> [   96.200304] Bug: Read fault blocked by KUAP!
>>>> [   96.200309] WARNING: CPU: 3 PID: 1876 at arch/powerpc/mm/fault.c:22=
9 bad_kernel_fault+0x180/0x310
>>>
>>>> [   96.200734] NIP [c000000000849424] fault_in_pages_readable+0x104/0x=
350
>>>> [   96.200741] LR [c00000000084952c] fault_in_pages_readable+0x20c/0x3=
50
>>>> [   96.200747] --- interrupt: 300
>>>
>>>
>>> Problem happens in a section where userspace access is supposed to be g=
ranted, so the patch you=20
>>> proposed is definitely not the right fix.
>>>
>>> c000000000849408:	2c 01 00 4c 	isync
>>> c00000000084940c:	a6 03 3d 7d 	mtspr   29,r9  <=3D=3D granting userspac=
e access permission
>>> c000000000849410:	2c 01 00 4c 	isync
>>> c000000000849414:	00 00 36 e9 	ld      r9,0(r22)
>>> c000000000849418:	20 00 29 81 	lwz     r9,32(r9)
>>> c00000000084941c:	00 02 29 71 	andi.   r9,r9,512
>>> c000000000849420:	78 d3 5e 7f 	mr      r30,r26
>>> =3D=3D> c000000000849424:	00 00 bf 8b 	lbz     r29,0(r31)  <=3D=3D acce=
ssing userspace
>>> c000000000849428:	10 00 82 41 	beq     c000000000849438 <fault_in_pages=
_readable+0x118>
>>> c00000000084942c:	2c 01 00 4c 	isync
>>> c000000000849430:	a6 03 bd 7e 	mtspr   29,r21  <=3D=3D clearing userspa=
ce access permission
>>> c000000000849434:	2c 01 00 4c 	isync
>>>
>>> My first guess is that the problem is linked to the following function,=
 see the comment
>>>
>>> /*
>>>   * For kernel thread that doesn't have thread.regs return
>>>   * default AMR/IAMR values.
>>>   */
>>> static inline u64 current_thread_amr(void)
>>> {
>>> 	if (current->thread.regs)
>>> 		return current->thread.regs->amr;
>>> 	return AMR_KUAP_BLOCKED;
>>> }
>>>
>>> Above function was introduced by commit 48a8ab4eeb82 ("powerpc/book3s64=
/pkeys: Don't update SPRN_AMR=20
>>> when in kernel mode")
>>=20
>> Yeah that's a bit of a curly one.
>>=20
>> At some point io_uring did kthread_use_mm(), which is supposed to mean
>> the kthread can operate on behalf of the original process that submitted
>> the IO.
>>=20
>> But because KUAP is implemented using memory protection keys, it depends
>> on the value of the AMR register, which is not part of the mm, it's in
>> thread.regs->amr.
>>=20
>> And what's worse by the time we're in kthread_use_mm() we no longer have
>> access to the thread.regs->amr of the original process that submitted
>> the IO.
>>=20
>> We also can't simply move the AMR into the mm, precisely because it's
>> per thread, not per mm.
>>=20
>> So TBH I don't know how we're going to fix this.
>>=20
>> I guess we could return AMR=3Dunblocked for kernel threads, but that's
>> arguably a bug because it allows a process to circumvent memory keys by
>> asking the kernel to do the access.
>
> We shouldn't need to inherit AMR should we? We only need it to be locked=
=20
> for kernel threads until it's explicitly unlocked -- nothing mm specific=
=20
> there. I think current_thread_amr could return 0 for kernel threads? Or
> I would even avoid using that function for allow_user_access and open
> code the kthread case and remove it from current_thread_amr().
>
> Thanks,
> Nick

Can we try this?

commit 9a193d38b1a0a52364bc70ec953e0685993603b6
Author: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
Date:   Tue Feb 2 09:23:38 2021 +0530

    powerpc/kuap: Allow kernel thread to access userspace after kthread_use=
_mm
=20=20=20=20
    This fix the bad fault reported by KUAP when io_wqe_worker access users=
pace.
=20=20=20=20
     Bug: Read fault blocked by KUAP!
     WARNING: CPU: 1 PID: 101841 at arch/powerpc/mm/fault.c:229 __do_page_f=
ault+0x6b4/0xcd0
     NIP [c00000000009e7e4] __do_page_fault+0x6b4/0xcd0
     LR [c00000000009e7e0] __do_page_fault+0x6b0/0xcd0
    ..........
     Call Trace:
     [c000000016367330] [c00000000009e7e0] __do_page_fault+0x6b0/0xcd0 (unr=
eliable)
     [c0000000163673e0] [c00000000009ee3c] do_page_fault+0x3c/0x120
     [c000000016367430] [c00000000000c848] handle_page_fault+0x10/0x2c
     --- interrupt: 300 at iov_iter_fault_in_readable+0x148/0x6f0
    ..........
     NIP [c0000000008e8228] iov_iter_fault_in_readable+0x148/0x6f0
     LR [c0000000008e834c] iov_iter_fault_in_readable+0x26c/0x6f0
     interrupt: 300
     [c0000000163677e0] [c0000000007154a0] iomap_write_actor+0xc0/0x280
     [c000000016367880] [c00000000070fc94] iomap_apply+0x1c4/0x780
     [c000000016367990] [c000000000710330] iomap_file_buffered_write+0xa0/0=
x120
     [c0000000163679e0] [c00800000040791c] xfs_file_buffered_aio_write+0x31=
4/0x5e0 [xfs]
     [c000000016367a90] [c0000000006d74bc] io_write+0x10c/0x460
     [c000000016367bb0] [c0000000006d80e4] io_issue_sqe+0x8d4/0x1200
     [c000000016367c70] [c0000000006d8ad0] io_wq_submit_work+0xc0/0x250
     [c000000016367cb0] [c0000000006e2578] io_worker_handle_work+0x498/0x800
     [c000000016367d40] [c0000000006e2cdc] io_wqe_worker+0x3fc/0x4f0
     [c000000016367da0] [c0000000001cb0a4] kthread+0x1c4/0x1d0
     [c000000016367e10] [c00000000000dbf0] ret_from_kernel_thread+0x5c/0x6c
=20=20=20=20
    The kernel consider thread AMR value for kernel thread to be
    AMR_KUAP_BLOCKED. Hence access to userspace is denied. This
    of course not correct and we should allow userspace access after
    kthread_use_mm(). To be precise, kthread_use_mm() should inherit the
    AMR value of the operating address space. But, the AMR value is
    thread-specific and we inherit the address space and not thread
    access restrictions. Because of this ignore AMR value when accessing
    userspace via kernel thread.
=20=20=20=20
    Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>

diff --git a/arch/powerpc/include/asm/book3s/64/kup.h b/arch/powerpc/includ=
e/asm/book3s/64/kup.h
index f50f72e535aa..7457d80ba0bb 100644
--- a/arch/powerpc/include/asm/book3s/64/kup.h
+++ b/arch/powerpc/include/asm/book3s/64/kup.h
@@ -384,7 +384,13 @@ static __always_inline void allow_user_access(void __u=
ser *to, const void __user
 	// This is written so we can resolve to a single case at build time
 	BUILD_BUG_ON(!__builtin_constant_p(dir));
=20
-	if (mmu_has_feature(MMU_FTR_PKEY))
+	/*
+	 * if it is a kthread that did kthread_use_mm() don't
+	 * use current_thread_amr().
+	 */
+	if (!current->mm && current->active_mm !=3D &init_mm)
+		thread_amr =3D 0;
+	else if (mmu_has_feature(MMU_FTR_PKEY))
 		thread_amr =3D current_thread_amr();
=20
 	if (dir =3D=3D KUAP_READ)
