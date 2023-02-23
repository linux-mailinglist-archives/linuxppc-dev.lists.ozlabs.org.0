Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8B56A01B6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Feb 2023 05:08:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PMfdw5S60z3cGV
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Feb 2023 15:08:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Rvn+kKRR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=kconsul@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Rvn+kKRR;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PMfcy4BGnz2xWc
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Feb 2023 15:07:46 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31N3iJOv017601;
	Thu, 23 Feb 2023 04:07:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=uS3KxeNwh5w8dE8l1gjghrkZCcqmgBLUBeJHbuZz7k8=;
 b=Rvn+kKRRhSfEsLAAwdmd6bb1FfJHrThx8HTWLSV5GuLpoc8fXMb31wqGfRYoxVmzcAJ9
 CYXLA+BWkMloPsuYFWiPgNnL+lg/8FS8AEaDBOQqUa5KV/3LDP4AY6V8W7ywDcEO6/qz
 FHRoPm+aEGzt4mzFHLgv6R+5d5ZcqIZxc50fJeGPvxVvi7/cro/ip8Bh8tpMSkTP9Muy
 0SoLXUIkKNATxOFWXpvX3IMzlNqR9b8SkB9eZqXlzQ6j8t/AqurgDrYon1viQ/tJikKN
 GhdY+ZkACH0n+yb7z6+b4z4gWjEC3kCqtyw1fSihXfJGLksu/Y9NrGFT0yAXYnCCBnfH tQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3nx0g6gb8v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Feb 2023 04:07:35 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31N3rhbP013746;
	Thu, 23 Feb 2023 04:07:35 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3nx0g6gb88-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Feb 2023 04:07:35 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31MFv1oL007338;
	Thu, 23 Feb 2023 04:07:32 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3ntpa6e4tb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Feb 2023 04:07:32 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 31N47T1S14156174
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 Feb 2023 04:07:29 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AE8572005A;
	Thu, 23 Feb 2023 04:07:29 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id ED15020043;
	Thu, 23 Feb 2023 04:07:27 +0000 (GMT)
Received: from li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com (unknown [9.109.216.99])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu, 23 Feb 2023 04:07:27 +0000 (GMT)
Date: Thu, 23 Feb 2023 09:37:25 +0530
From: Kautuk Consul <kconsul@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v2] arch/powerpc/include/asm/barrier.h: redefine rmb and
 wmb to  lwsync
Message-ID: <Y/bmffAACvN2B6mj@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
References: <20230222090344.189270-1-kconsul@linux.vnet.ibm.com>
 <20230222174719.GA1400185@paulmck-ThinkPad-P17-Gen-1>
 <87fsaxavk2.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87fsaxavk2.fsf@mpe.ellerman.id.au>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: T0Uv6F5juD7Su33UiYROLJXJpFagHJ-L
X-Proofpoint-ORIG-GUID: 6TLhLi7MQuhZczpKHNBsDYdSoPKToNGe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-22_12,2023-02-22_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxlogscore=903 spamscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302230034
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
Cc: paulmck@kernel.org, linux-kernel@vger.kernel.org, Rohan McLure <rmclure@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2023-02-23 14:51:25, Michael Ellerman wrote:
> Hi Paul,
> 
> "Paul E. McKenney" <paulmck@kernel.org> writes:
> > On Wed, Feb 22, 2023 at 02:33:44PM +0530, Kautuk Consul wrote:
> >> A link from ibm.com states:
> >> "Ensures that all instructions preceding the call to __lwsync
> >>  complete before any subsequent store instructions can be executed
> >>  on the processor that executed the function. Also, it ensures that
> >>  all load instructions preceding the call to __lwsync complete before
> >>  any subsequent load instructions can be executed on the processor
> >>  that executed the function. This allows you to synchronize between
> >>  multiple processors with minimal performance impact, as __lwsync
> >>  does not wait for confirmation from each processor."
> >> 
> >> Thats why smp_rmb() and smp_wmb() are defined to lwsync.
> >> But this same understanding applies to parallel pipeline
> >> execution on each PowerPC processor.
> >> So, use the lwsync instruction for rmb() and wmb() on the PPC
> >> architectures that support it.
> >> 
> >> Signed-off-by: Kautuk Consul <kconsul@linux.vnet.ibm.com>
> >> ---
> >>  arch/powerpc/include/asm/barrier.h | 7 +++++++
> >>  1 file changed, 7 insertions(+)
> >> 
> >> diff --git a/arch/powerpc/include/asm/barrier.h b/arch/powerpc/include/asm/barrier.h
> >> index b95b666f0374..e088dacc0ee8 100644
> >> --- a/arch/powerpc/include/asm/barrier.h
> >> +++ b/arch/powerpc/include/asm/barrier.h
> >> @@ -36,8 +36,15 @@
> >>   * heavy-weight sync, so smp_wmb() can be a lighter-weight eieio.
> >>   */
> >>  #define __mb()   __asm__ __volatile__ ("sync" : : : "memory")
> >> +
> >> +/* The sub-arch has lwsync. */
> >> +#if defined(CONFIG_PPC64) || defined(CONFIG_PPC_E500MC)
> >> +#define __rmb() __asm__ __volatile__ ("lwsync" : : : "memory")
> >> +#define __wmb() __asm__ __volatile__ ("lwsync" : : : "memory")
> >
> > Hmmm...
> >
> > Does the lwsync instruction now order both cached and uncached accesses?
> 
> No.
> 
> > Or have there been changes so that smp_rmb() and smp_wmb() get this
> > definition, while rmb() and wmb() still get the sync instruction?
> 
> No.
> 
> They come from:
> 
> include/asm-generic/barrier.h:#define rmb()        do { kcsan_rmb(); __rmb(); } while (0)
> include/asm-generic/barrier.h:#define wmb()        do { kcsan_wmb(); __wmb(); } while (0)
> 
> > (Not seeing this, but I could easily be missing something.)
> 
> You are correct, the patch is wrong because it fails to account for IO
> accesses.
> 
> Kautuk, I'm not sure what motivated you to look at these barriers, was
> it just the documentation you linked to?
> 
> Maybe we need some better documentation in the kernel explaining why we
> use the barriers we do?
> 
> Although there's already a pretty decent comment above the definitions,
> but maybe it needs further clarification:
> 
>   /*
>    * Memory barrier.
>    * The sync instruction guarantees that all memory accesses initiated
>    * by this processor have been performed (with respect to all other
>    * mechanisms that access memory).  The eieio instruction is a barrier
>    * providing an ordering (separately) for (a) cacheable stores and (b)
>    * loads and stores to non-cacheable memory (e.g. I/O devices).
>    *
>    * mb() prevents loads and stores being reordered across this point.
>    * rmb() prevents loads being reordered across this point.
>    * wmb() prevents stores being reordered across this point.
>    *
>    * *mb() variants without smp_ prefix must order all types of memory
>    * operations with one another. sync is the only instruction sufficient
>    * to do this.
>    *
>    * For the smp_ barriers, ordering is for cacheable memory operations
>    * only. We have to use the sync instruction for smp_mb(), since lwsync
>    * doesn't order loads with respect to previous stores.  Lwsync can be
>    * used for smp_rmb() and smp_wmb().

Sorry I didn't change the comment.
My point is: Is the "sync is the only instruction sufficient to do this"
comment completely correct?
As I mentioned in my reply to Paul there I didn't find any
documentation that up-front states (in the differences between sync and
lwsync) that lwsync distinguishes between cached and unchached accesses.
> 
> 
> cheers
