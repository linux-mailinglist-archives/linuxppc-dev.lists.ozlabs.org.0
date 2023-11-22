Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B69F57F4885
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Nov 2023 15:06:56 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=K9ZKUUO0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sb32k4p7Hz3dKv
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Nov 2023 01:06:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=K9ZKUUO0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sb31n0V52z3clw
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Nov 2023 01:06:00 +1100 (AEDT)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AMDHGf8025176;
	Wed, 22 Nov 2023 14:04:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=dA7NrA5d6C8cs4386hd0trKQbmFGmI3SeE+zd99ea/I=;
 b=K9ZKUUO09qNAPWcuVsKyEBVp/fNXpdXkimm5gcu1Ai14fJf6F7NMk+Q//sZhReLZhbOZ
 PKVRsXMWuQcAKiZTRKyjbtZpSBoF9/UitPlii/QyjEXV5QFejRqoUWVc4CzQapNBWr87
 ZRq9XhA4K1hzSw85x5V5kvwwEdcqVjGgrdY7d/pj5MlKsVPJwPNeYS/i8IgQ57piU+jQ
 fMR4WDksYdkLUN103mfGItDYsMAUZVWBfgMwDRfMxC5m9x8RLBriediFdO46+4TT53JQ
 uyLde522BvqhGMY7Aigts6JkL/YN3SU2/zfJ8Q8bk8gDhkQQ+ZpePMuPtDYqlRCmfr3H IQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3uhjd0hc3h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Nov 2023 14:04:57 +0000
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3AMDolDB024045;
	Wed, 22 Nov 2023 14:04:57 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3uhjd0hc30-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Nov 2023 14:04:56 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3AMDUD1o001768;
	Wed, 22 Nov 2023 14:04:55 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3uf93m031d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Nov 2023 14:04:55 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3AME4pgL44827032
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 22 Nov 2023 14:04:51 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5FD3E20043;
	Wed, 22 Nov 2023 14:04:51 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6A52B20040;
	Wed, 22 Nov 2023 14:04:50 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed, 22 Nov 2023 14:04:50 +0000 (GMT)
Date: Wed, 22 Nov 2023 15:04:49 +0100
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: Jann Horn <jannh@google.com>
Subject: Re: [PATCH 12/41] mm: add per-VMA lock and helper functions to
 control it
Message-ID: <ZV4KgferuePsR2Iz@tuxmaker.boeblingen.de.ibm.com>
References: <20230109205336.3665937-1-surenb@google.com>
 <20230109205336.3665937-13-surenb@google.com>
 <CAG48ez0RhQ6=W01brLUXDXqQxz2M1FEMNqd2OvL+LhcJQY=NqA@mail.gmail.com>
 <CAJuCfpHawn-hj3yK6MEMHsvnH9xgO87h7Sj3_g0FA7rgut_mVg@mail.gmail.com>
 <CAG48ez3sCwasFzKD5CsqMFA2W57-2fazd75g7r0NaA_BVNTLow@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAG48ez3sCwasFzKD5CsqMFA2W57-2fazd75g7r0NaA_BVNTLow@mail.gmail.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 5MhcCP9ifUrUeiSZNpIhaNnBNovbexne
X-Proofpoint-ORIG-GUID: zLZ94B08QXl1Fcylsg1aKWlm3qbMRA7p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-22_09,2023-11-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 mlxlogscore=999
 clxscore=1011 bulkscore=0 adultscore=0 lowpriorityscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311220100
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, Will Deacon <will@kernel.org>, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, laurent.dufour@fr.ibm.com, Ingo Molnar <mingo@redhat.com>, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, Suren Baghdasaryan <surenb@google.com>, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, hughlynch@google.com, linux-kernel@vger.kern
 el.org, hannes@cmpxchg.org, akpm@linux-foundation.org, tatashin@google.com, mgorman@techsingularity.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jan 17, 2023 at 10:45:25PM +0100, Jann Horn wrote:

Hi Jann,

> On Tue, Jan 17, 2023 at 10:28 PM Suren Baghdasaryan <surenb@google.com> wrote:
> > On Tue, Jan 17, 2023 at 10:03 AM Jann Horn <jannh@google.com> wrote:
> > >
> > > +locking maintainers
> >
> > Thanks! I'll CC the locking maintainers in the next posting.
> >
> > >
> > > On Mon, Jan 9, 2023 at 9:54 PM Suren Baghdasaryan <surenb@google.com> wrote:
> > > > Introduce a per-VMA rw_semaphore to be used during page fault handling
> > > > instead of mmap_lock. Because there are cases when multiple VMAs need
> > > > to be exclusively locked during VMA tree modifications, instead of the
> > > > usual lock/unlock patter we mark a VMA as locked by taking per-VMA lock
> > > > exclusively and setting vma->lock_seq to the current mm->lock_seq. When
> > > > mmap_write_lock holder is done with all modifications and drops mmap_lock,
> > > > it will increment mm->lock_seq, effectively unlocking all VMAs marked as
> > > > locked.
> > > [...]
> > > > +static inline void vma_read_unlock(struct vm_area_struct *vma)
> > > > +{
> > > > +       up_read(&vma->lock);
> > > > +}
> > >
> > > One thing that might be gnarly here is that I think you might not be
> > > allowed to use up_read() to fully release ownership of an object -
> > > from what I remember, I think that up_read() (unlike something like
> > > spin_unlock()) can access the lock object after it's already been
> > > acquired by someone else. So if you want to protect against concurrent
> > > deletion, this might have to be something like:
> > >
> > > rcu_read_lock(); /* keeps vma alive */
> > > up_read(&vma->lock);
> > > rcu_read_unlock();
> >
> > But for deleting VMA one would need to write-lock the vma->lock first,
> > which I assume can't happen until this up_read() is complete. Is that
> > assumption wrong?
> 
> __up_read() does:
> 
> rwsem_clear_reader_owned(sem);
> tmp = atomic_long_add_return_release(-RWSEM_READER_BIAS, &sem->count);
> DEBUG_RWSEMS_WARN_ON(tmp < 0, sem);
> if (unlikely((tmp & (RWSEM_LOCK_MASK|RWSEM_FLAG_WAITERS)) ==
>       RWSEM_FLAG_WAITERS)) {
>   clear_nonspinnable(sem);
>   rwsem_wake(sem);
> }

This sequence is covered by preempt_disable()/preempt_enable().
Would not it preserve the RCU grace period until after __up_read()
exited?

> The atomic_long_add_return_release() is the point where we are doing
> the main lock-releasing.
> 
> So if a reader dropped the read-lock while someone else was waiting on
> the lock (RWSEM_FLAG_WAITERS) and no other readers were holding the
> lock together with it, the reader also does clear_nonspinnable() and
> rwsem_wake() afterwards.
> But in rwsem_down_write_slowpath(), after we've set
> RWSEM_FLAG_WAITERS, we can return successfully immediately once
> rwsem_try_write_lock() sees that there are no active readers or
> writers anymore (if RWSEM_LOCK_MASK is unset and the cmpxchg
> succeeds). We're not necessarily waiting for the "nonspinnable" bit or
> the wake.
> 
> So yeah, I think down_write() can return successfully before up_read()
> is done with its memory accesses.

Thanks!
