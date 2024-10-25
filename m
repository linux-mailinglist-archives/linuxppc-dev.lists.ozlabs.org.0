Return-Path: <linuxppc-dev+bounces-2586-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 464679B0D52
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Oct 2024 20:31:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XZrvj35ydz2yD4;
	Sat, 26 Oct 2024 05:31:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729881073;
	cv=none; b=jc1E1ep9zoan80jxJtkLB0xowzDBP8ikfrYZRJkQQ3OMKlU218NPi4R93EvyVbY/RrMUAjoG5v1cf7LKc9pWe4AoiovrhAsp2YzG+Hf5eEaO85UJAmEa8XXI5CPt3Wsy8SnFjJxO5Zwp+aF64e18EX0xU7rgYjTfdKDZ3xzSuBM7vbrbMXtxNRj1rX1ZfJETuaZzVAys4HSdzfjyFzrwWCfQ+QOMa9FMLZPILh3AIvQ2hqp4WSJ+vZUAnIIufpliowmHWoLY3dsbcpQ7HxiAkXIq1au5XkPLM5XuCdDzc4+xwZCogXScl6MtBJ8U5+gKbd53/bZqNufJNx5nJM1H3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729881073; c=relaxed/relaxed;
	bh=bCYg3WI36eTA+yA5LQzfw/1BaodCD9Je+3uqP+670Ns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I1bCmGheNkD9xl2MhE8CzXuZL+xqleYsQenZULwGkhC2KdDy+LE6c1lV8ChKUSDAsgp07drE9zninr3xykCcCJAizJX93sakpg5MTPY/963B8FbEPyvDlz4O5kdpvMDeaWxAUdBkk5itIPL/SRtpp4eQ+p3l9Ko3oHyPMW4XVkro1LRLCMbxrBrxP4m0lQxT9++wZutwwyAHWG+/aizMxg5tefrSqesFTgDZaf1qHaaXaEA0L2syH4wn/knPpgodqGD1x9rA4/4Diz5FvbQJHhOUln2JKtgS2Nr/PP9uhQ30P/ObFb8bZHzQIDyvTfnTiI8IkRmpLJ3d8VdcsUzTQg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=L4JBP6u5; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nysal@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=L4JBP6u5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nysal@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XZrvh0Spkz2y6G
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Oct 2024 05:31:11 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49PEeSoi032573;
	Fri, 25 Oct 2024 18:30:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=bCYg3WI36eTA+yA5LQzfw/1BaodCD9
	Je+3uqP+670Ns=; b=L4JBP6u5Q6DXkamufc4+3XtZ1LIvxy7KA02HHWnMgLigt/
	/1qWBo6o+qQAV5pkWUKkTjnMNLq5BwQR9zJJTw0HvD4lc37cPSqK0DaSymmYGIzf
	Qmaxfl/bly8lNmJ2jumL1zxgEcKZ1nSRiAAjgrhy6jtJmxUylLwAmlgtNLB1uEYj
	9VdlGAflHyXYQpGdwjD3SSEQBbW9DtBsKEF6JAMVVVZN7BZuluITJVG9GmA8KPu7
	rzEy+lYmeYDpEgLsSfj/KrNZ15BrYOLKGm5MB6ySYTy2bB3k5CPlDBQOgaROibbv
	BiR89l1QcwwsJF0/qaDMDUFkBR4sZClC0mpsKhkA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42g246v9ex-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 18:30:42 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 49PIUfrt004272;
	Fri, 25 Oct 2024 18:30:41 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42g246v9et-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 18:30:41 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 49PHpv67008754;
	Fri, 25 Oct 2024 18:30:40 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 42emkay4pw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 18:30:40 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 49PIUcJ918743588
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Oct 2024 18:30:38 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 909152004B;
	Fri, 25 Oct 2024 18:30:38 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2DD0220040;
	Fri, 25 Oct 2024 18:30:38 +0000 (GMT)
Received: from localhost (unknown [9.43.62.211])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 25 Oct 2024 18:30:37 +0000 (GMT)
Date: Sat, 26 Oct 2024 00:00:37 +0530
From: "Nysal Jan K.A." <nysal@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: linuxppc-dev@lists.ozlabs.org, Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Kent Overstreet <kent.overstreet@linux.dev>,
        Rick Edgecombe <rick.p.edgecombe@intel.com>,
        Roman Gushchin <roman.gushchin@linux.dev>,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] sched/membarrier: Fix redundant load of membarrier_state
Message-ID: <nszn2c226bf6xslp7r5axmiov4fuhmwqqyzap7b2lysuch7fnl@uhgtmsaxttf3>
References: <20241007053936.833392-1-nysal@linux.ibm.com>
 <87frolja8d.fsf@mail.lhotse>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87frolja8d.fsf@mail.lhotse>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: gQkqUtvd0_hSqnkwwp8fiBBQGQjBbqR7
X-Proofpoint-GUID: SMcGweBVNA9QTr_rEIeG2qZ-BNAshwUZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 adultscore=0
 mlxlogscore=999 clxscore=1011 impostorscore=0 mlxscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2410250140
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Oct 25, 2024 at 11:29:38AM +1100, Michael Ellerman wrote:
> [To += Mathieu]
> 
> "Nysal Jan K.A." <nysal@linux.ibm.com> writes:
> > From: "Nysal Jan K.A" <nysal@linux.ibm.com>
> >
> > On architectures where ARCH_HAS_SYNC_CORE_BEFORE_USERMODE
> > is not selected, sync_core_before_usermode() is a no-op.
> > In membarrier_mm_sync_core_before_usermode() the compiler does not
> > eliminate redundant branches and the load of mm->membarrier_state
> > for this case as the atomic_read() cannot be optimized away.
> 
> I was wondering if this was caused by powerpc's arch_atomic_read() which
> uses asm volatile.
> 

Yes, that's my understanding as well

> But replacing arch_atomic_read() with READ_ONCE() makes no difference,
> presumably because the compiler still can't see that the READ_ONCE() is
> unnecessary (which is kind of by design).
> 

In READ_ONCE() we cast to a volatile pointer, I think the compiler cannot eliminate
the code in that case.

> > Here's a snippet of the code generated for finish_task_switch() on powerpc:
> >
> > 1b786c:   ld      r26,2624(r30)   # mm = rq->prev_mm;
> > .......
> > 1b78c8:   cmpdi   cr7,r26,0
> > 1b78cc:   beq     cr7,1b78e4 <finish_task_switch+0xd0>
> > 1b78d0:   ld      r9,2312(r13)    # current
> > 1b78d4:   ld      r9,1888(r9)     # current->mm
> > 1b78d8:   cmpd    cr7,r26,r9
> > 1b78dc:   beq     cr7,1b7a70 <finish_task_switch+0x25c>
> > 1b78e0:   hwsync
> > 1b78e4:   cmplwi  cr7,r27,128
> > .......
> > 1b7a70:   lwz     r9,176(r26)     # atomic_read(&mm->membarrier_state)
> > 1b7a74:   b       1b78e0 <finish_task_switch+0xcc>
> >
> > This was found while analyzing "perf c2c" reports on kernels prior
> > to commit c1753fd02a00 ("mm: move mm_count into its own cache line")
> > where mm_count was false sharing with membarrier_state.
> 
> So it was causing a noticable performance blip? But isn't anymore?
> 

It was noticeable in that it showed up amongst the top entries in perf c2c reports.
There was similar false sharing with other fields that share the cache line with
mm_count, so the gains were minimal with just this patch. c1753fd02a00 addresses
these cases too.

> > There is a minor improvement in the size of finish_task_switch().
> > The following are results from bloat-o-meter:
> >
> > GCC 7.5.0:
> > ----------
> > add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-32 (-32)
> > Function                                     old     new   delta
> > finish_task_switch                           884     852     -32
> >
> > GCC 12.2.1:
> > -----------
> > add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-32 (-32)
> > Function                                     old     new   delta
> > finish_task_switch.isra                      852     820     -32
> 
> GCC 12 is a couple of years old, I assume GCC 14 behaves similarly?
> 

I cross compiled for aarch64 with gcc 14.1.1 and see similar results:

add/remove: 0/2 grow/shrink: 1/1 up/down: 4/-60 (-56)
Function                                     old     new   delta
get_nohz_timer_target                        352     356      +4
e843419@0b02_0000d7e7_408                      8       -      -8
e843419@01bb_000021d2_868                      8       -      -8
finish_task_switch.isra                      592     548     -44
Total: Before=31013792, After=31013736, chg -0.00%

> > LLVM 17.0.6:
> > ------------
> > add/remove: 0/0 grow/shrink: 0/2 up/down: 0/-36 (-36)
> > Function                                     old     new   delta
> > rt_mutex_schedule                            120     104     -16
> > finish_task_switch                           792     772     -20
> >
> > Signed-off-by: Nysal Jan K.A <nysal@linux.ibm.com>
> > ---
> >  include/linux/sched/mm.h | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/include/linux/sched/mm.h b/include/linux/sched/mm.h
> > index 07bb8d4181d7..042e60ab853a 100644
> > --- a/include/linux/sched/mm.h
> > +++ b/include/linux/sched/mm.h
> > @@ -540,6 +540,8 @@ enum {
> >  
> >  static inline void membarrier_mm_sync_core_before_usermode(struct mm_struct *mm)
> >  {
> > +	if (!IS_ENABLED(CONFIG_ARCH_HAS_SYNC_CORE_BEFORE_USERMODE))
> > +		return;
> >  	if (current->mm != mm)
> >  		return;
> >  	if (likely(!(atomic_read(&mm->membarrier_state) &
> 
> The other option would be to have a completely separate stub, eg:
> 
>   #ifdef CONFIG_ARCH_HAS_SYNC_CORE_BEFORE_USERMODE
>   static inline void membarrier_mm_sync_core_before_usermode(struct mm_struct *mm)
>   {
>           if (current->mm != mm)
>                   return;
>           if (likely(!(atomic_read(&mm->membarrier_state) &
>                        MEMBARRIER_STATE_PRIVATE_EXPEDITED_SYNC_CORE)))
>                   return;
>           sync_core_before_usermode();
>   }
>   #else
>   static inline void membarrier_mm_sync_core_before_usermode(struct mm_struct *mm) { }
>   #endif
> 
> Not sure what folks prefer.
> 
> In either case I think it's probably worth a short comment explaining
> why it's worth the trouble (ie. that the atomic_read() prevents the
> compiler from doing DCE).
>

I'll send a v2 with a comment added in there. Thanks for the review.

--Nysal


