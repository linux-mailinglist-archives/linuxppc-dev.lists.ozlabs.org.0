Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E18676A01FF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Feb 2023 05:23:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PMfzY5nsTz3cMs
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Feb 2023 15:23:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HyEdYCQO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=kconsul@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HyEdYCQO;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PMfyb4gPCz30hl
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Feb 2023 15:23:03 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31N2tdFK018302;
	Thu, 23 Feb 2023 04:22:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=C1RGzWa2Upo0fAEz9k40sE0hWyjqS4q6V4bAG2wspCg=;
 b=HyEdYCQO1yCz6Xg7JAUOIkcHwGSgJoLHhNRiIIN1EUiSRM1/8Xo+clvugYmH7TFScqPl
 y5+quaBWp/Yl+rdQmVXWf6eCak5i4646G1smpBiY4IV80zP7Oessz53C4K495VZFE7TM
 t9WOicSZfBUKTLi1E4JL+AWJzs+w/CAzPHOm0hiI2WCH4Apcv9ohvPNzcvBPm+o3Un6A
 nJgJyqsUXFV8DUpB3bEewOQZLS0WfzFAVU4b7soY0tNNX570+y5hv1eHi14EPgPS570N
 EGQfzwGG+aqVUG4mM9HiRNa6SvOF99KtskAVI+rAkgz7VPQyjRwg5VsW4wkRKZIS8seD qA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nwyss9c19-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Feb 2023 04:22:52 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31N4BcTO008265;
	Thu, 23 Feb 2023 04:22:52 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com [149.81.74.107])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nwyss9c0u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Feb 2023 04:22:52 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
	by ppma03fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31MAeMXH020255;
	Thu, 23 Feb 2023 04:22:49 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma03fra.de.ibm.com (PPS) with ESMTPS id 3ntpa64neb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Feb 2023 04:22:49 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 31N4Mldg55837104
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 Feb 2023 04:22:47 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 403B12004B;
	Thu, 23 Feb 2023 04:22:47 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8E34C20040;
	Thu, 23 Feb 2023 04:22:45 +0000 (GMT)
Received: from li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com (unknown [9.109.216.99])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu, 23 Feb 2023 04:22:45 +0000 (GMT)
Date: Thu, 23 Feb 2023 09:52:43 +0530
From: Kautuk Consul <kconsul@linux.vnet.ibm.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH v2] arch/powerpc/include/asm/barrier.h: redefine rmb and
 wmb to  lwsync
Message-ID: <Y/bqExjORlaKalby@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
References: <20230222090344.189270-1-kconsul@linux.vnet.ibm.com>
 <20230222174719.GA1400185@paulmck-ThinkPad-P17-Gen-1>
 <Y/blLAj2IcX5jSZU@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
 <20230223041610.GX2948950@paulmck-ThinkPad-P17-Gen-1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230223041610.GX2948950@paulmck-ThinkPad-P17-Gen-1>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: WhnQ6hN-4mO9ONHQCNnAA1zFqGMYaxcx
X-Proofpoint-ORIG-GUID: tyWvCjdLR5M_OcDgnkYEj0umdm1usmjM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-22_12,2023-02-22_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0
 mlxlogscore=769 bulkscore=0 impostorscore=0 priorityscore=1501
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302230034
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
Cc: linux-kernel@vger.kernel.org, Rohan McLure <rmclure@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2023-02-22 20:16:10, Paul E. McKenney wrote:
> On Thu, Feb 23, 2023 at 09:31:48AM +0530, Kautuk Consul wrote:
> > On 2023-02-22 09:47:19, Paul E. McKenney wrote:
> > > On Wed, Feb 22, 2023 at 02:33:44PM +0530, Kautuk Consul wrote:
> > > > A link from ibm.com states:
> > > > "Ensures that all instructions preceding the call to __lwsync
> > > >  complete before any subsequent store instructions can be executed
> > > >  on the processor that executed the function. Also, it ensures that
> > > >  all load instructions preceding the call to __lwsync complete before
> > > >  any subsequent load instructions can be executed on the processor
> > > >  that executed the function. This allows you to synchronize between
> > > >  multiple processors with minimal performance impact, as __lwsync
> > > >  does not wait for confirmation from each processor."
> > > > 
> > > > Thats why smp_rmb() and smp_wmb() are defined to lwsync.
> > > > But this same understanding applies to parallel pipeline
> > > > execution on each PowerPC processor.
> > > > So, use the lwsync instruction for rmb() and wmb() on the PPC
> > > > architectures that support it.
> > > > 
> > > > Signed-off-by: Kautuk Consul <kconsul@linux.vnet.ibm.com>
> > > > ---
> > > >  arch/powerpc/include/asm/barrier.h | 7 +++++++
> > > >  1 file changed, 7 insertions(+)
> > > > 
> > > > diff --git a/arch/powerpc/include/asm/barrier.h b/arch/powerpc/include/asm/barrier.h
> > > > index b95b666f0374..e088dacc0ee8 100644
> > > > --- a/arch/powerpc/include/asm/barrier.h
> > > > +++ b/arch/powerpc/include/asm/barrier.h
> > > > @@ -36,8 +36,15 @@
> > > >   * heavy-weight sync, so smp_wmb() can be a lighter-weight eieio.
> > > >   */
> > > >  #define __mb()   __asm__ __volatile__ ("sync" : : : "memory")
> > > > +
> > > > +/* The sub-arch has lwsync. */
> > > > +#if defined(CONFIG_PPC64) || defined(CONFIG_PPC_E500MC)
> > > > +#define __rmb() __asm__ __volatile__ ("lwsync" : : : "memory")
> > > > +#define __wmb() __asm__ __volatile__ ("lwsync" : : : "memory")
> > > 
> > > Hmmm...
> > > 
> > > Does the lwsync instruction now order both cached and uncached accesses?
> > > Or have there been changes so that smp_rmb() and smp_wmb() get this
> > > definition, while rmb() and wmb() still get the sync instruction?
> > > (Not seeing this, but I could easily be missing something.)
> 
> > Upfront I don't see any documentation that states that lwsync
> > distinguishes between cached and uncached accesses.
> > That's why I requested the mailing list for test results with
> > kernel load testing.
> 
> I suggest giving the reference manual a very careful read.  I wish I
> could be more helpful, but I found that a very long time ago, and no
> longer recall exactly where it was stated.
Will do that as soon as I get an opprotunity.
> 
> But maybe Michael Ellerman has a pointer?
Sure. Maybe the cached and uncached accesses in these instructions should be
spelt out more clearly for newer people like me. :-)
Thanks for your time, Paul.
> 
> 							Thanx, Paul
> 
> > > > +#else
> > > >  #define __rmb()  __asm__ __volatile__ ("sync" : : : "memory")
> > > >  #define __wmb()  __asm__ __volatile__ ("sync" : : : "memory")
> > > > +#endif
> > > >  
> > > >  /* The sub-arch has lwsync */
> > > >  #if defined(CONFIG_PPC64) || defined(CONFIG_PPC_E500MC)
> > > > -- 
> > > > 2.31.1
> > > > 
