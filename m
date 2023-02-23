Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1E06A01AE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Feb 2023 05:03:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PMfWS5TKsz3cML
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Feb 2023 15:03:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cnksVnYt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=kconsul@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cnksVnYt;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PMfVW4Bgzz2xWc
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Feb 2023 15:02:11 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31N30gid005947;
	Thu, 23 Feb 2023 04:01:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=aWI424mVV8PhcWb2Am5JLl5tI1gKSRtLkc631cc2pqQ=;
 b=cnksVnYtmGHyBte8ebHYtGP/rbvE33qYzCio3FFvpmPY9sVvZyPB0Mp2ZK/dJKnpBTM6
 LP05hGoupQOa0j/hoqz1k5VMg+ERNdhS82+cgjhm6ZAD/b07So5szKo3ldxJXtSeifEg
 2RgG4THeJmv5Hlovsx2Y0Jly9hUoqD5pEdQm6+Y/UQXyQYAfU4Zkr6Fguxcz8iKiBUdV
 kgXa/ImrY820iAhJb7QWbxfl1NtBs53Xh/MtPYgsAKDBrn8ASYZKU/poFqQxHPxioNwn
 7HoK9vbIMj1GFc/FFd1k81KyTCpk7sxquX3br533tW6znl0VjY30vTdYRIh5S+ix2n56 ow== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3nwv8kw5x7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Feb 2023 04:01:58 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31N40hVh007372;
	Thu, 23 Feb 2023 04:01:57 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3nwv8kw5wk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Feb 2023 04:01:57 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31MEuGlp016645;
	Thu, 23 Feb 2023 04:01:55 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3ntpa6e5au-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Feb 2023 04:01:55 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 31N41rIl28639598
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 Feb 2023 04:01:53 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1E5C520040;
	Thu, 23 Feb 2023 04:01:53 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4DE8320043;
	Thu, 23 Feb 2023 04:01:51 +0000 (GMT)
Received: from li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com (unknown [9.109.216.99])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu, 23 Feb 2023 04:01:51 +0000 (GMT)
Date: Thu, 23 Feb 2023 09:31:48 +0530
From: Kautuk Consul <kconsul@linux.vnet.ibm.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH v2] arch/powerpc/include/asm/barrier.h: redefine rmb and
 wmb to  lwsync
Message-ID: <Y/blLAj2IcX5jSZU@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
References: <20230222090344.189270-1-kconsul@linux.vnet.ibm.com>
 <20230222174719.GA1400185@paulmck-ThinkPad-P17-Gen-1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230222174719.GA1400185@paulmck-ThinkPad-P17-Gen-1>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 02OMzsZkApw7RmuFX-ZTQAEai33NG_o4
X-Proofpoint-GUID: kQqb1af6jXKHbeJF8UIp5XhM3nqNd-vF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-22_12,2023-02-22_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 suspectscore=0 mlxscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 phishscore=0 impostorscore=0 mlxlogscore=870 malwarescore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302230029
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

On 2023-02-22 09:47:19, Paul E. McKenney wrote:
> On Wed, Feb 22, 2023 at 02:33:44PM +0530, Kautuk Consul wrote:
> > A link from ibm.com states:
> > "Ensures that all instructions preceding the call to __lwsync
> >  complete before any subsequent store instructions can be executed
> >  on the processor that executed the function. Also, it ensures that
> >  all load instructions preceding the call to __lwsync complete before
> >  any subsequent load instructions can be executed on the processor
> >  that executed the function. This allows you to synchronize between
> >  multiple processors with minimal performance impact, as __lwsync
> >  does not wait for confirmation from each processor."
> > 
> > Thats why smp_rmb() and smp_wmb() are defined to lwsync.
> > But this same understanding applies to parallel pipeline
> > execution on each PowerPC processor.
> > So, use the lwsync instruction for rmb() and wmb() on the PPC
> > architectures that support it.
> > 
> > Signed-off-by: Kautuk Consul <kconsul@linux.vnet.ibm.com>
> > ---
> >  arch/powerpc/include/asm/barrier.h | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/arch/powerpc/include/asm/barrier.h b/arch/powerpc/include/asm/barrier.h
> > index b95b666f0374..e088dacc0ee8 100644
> > --- a/arch/powerpc/include/asm/barrier.h
> > +++ b/arch/powerpc/include/asm/barrier.h
> > @@ -36,8 +36,15 @@
> >   * heavy-weight sync, so smp_wmb() can be a lighter-weight eieio.
> >   */
> >  #define __mb()   __asm__ __volatile__ ("sync" : : : "memory")
> > +
> > +/* The sub-arch has lwsync. */
> > +#if defined(CONFIG_PPC64) || defined(CONFIG_PPC_E500MC)
> > +#define __rmb() __asm__ __volatile__ ("lwsync" : : : "memory")
> > +#define __wmb() __asm__ __volatile__ ("lwsync" : : : "memory")
> 
> Hmmm...
> 
> Does the lwsync instruction now order both cached and uncached accesses?
> Or have there been changes so that smp_rmb() and smp_wmb() get this
> definition, while rmb() and wmb() still get the sync instruction?
> (Not seeing this, but I could easily be missing something.)
> 
> 							Thanx, Paul
Upfront I don't see any documentation that states that lwsync
distinguishes between cached and uncached accesses.
That's why I requested the mailing list for test results with
kernel load testing.
> 
> > +#else
> >  #define __rmb()  __asm__ __volatile__ ("sync" : : : "memory")
> >  #define __wmb()  __asm__ __volatile__ ("sync" : : : "memory")
> > +#endif
> >  
> >  /* The sub-arch has lwsync */
> >  #if defined(CONFIG_PPC64) || defined(CONFIG_PPC_E500MC)
> > -- 
> > 2.31.1
> > 
