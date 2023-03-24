Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BBE76C74EF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Mar 2023 02:15:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PjPQw0v7xz3fQq
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Mar 2023 12:15:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RiY8pILq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nysal@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RiY8pILq;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PjPPw3zmcz3cFw
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Mar 2023 12:14:44 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32O0rCLj025410;
	Fri, 24 Mar 2023 01:14:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : content-type : in-reply-to :
 content-transfer-encoding : mime-version; s=pp1;
 bh=07Cl9j+coPR30fPlu1/LHwwvjDuDQDmYh62R4eSzmdo=;
 b=RiY8pILqnkyRbzlQ81w7Ccg3quGtSMtjUjF/Qya7U8WVPp4PB9FT6OUYxQ2ZwX3lnP3q
 MtwYfuPOfmCG6Tb7oRRn7Oscz1YKH/Hu04oOK+MAPVLoIumHM/k0spCXc5rLSiR7WSEF
 y1Lde06ai2XrcLXPRqlcqe/JkI+mEJRnDkBAwf13pz7XQx82gV2NuPWlfIF8AoPwhVMz
 qdqc+Q5hvmKyytN3GLwbjmuuXWAWuRAw8GzUiZelMqshCajKi6rq53n3JYaz3CB2Xjbo
 /LMQEFN+5mrpEdqp7FSWec/sOInr/PIxhQdYq+S39EiVhxr5Z4ppg+8UP7IVzxLNoFwj og== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pgxs1v3k6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Mar 2023 01:14:38 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32NLcpQr015828;
	Fri, 24 Mar 2023 01:14:36 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma01fra.de.ibm.com (PPS) with ESMTPS id 3pgxv8g4g1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Mar 2023 01:14:36 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 32O1EXGi28508844
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 24 Mar 2023 01:14:33 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BA2042004B;
	Fri, 24 Mar 2023 01:14:33 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2349D20043;
	Fri, 24 Mar 2023 01:14:33 +0000 (GMT)
Received: from localhost (unknown [9.43.33.250])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 24 Mar 2023 01:14:32 +0000 (GMT)
Date: Fri, 24 Mar 2023 06:44:31 +0530
From: "Nysal Jan K.A." <nysal@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/atomics: Remove unused function
Message-ID: <ZBz5dwsVQ/eK2uW8@li-80eaad4c-2afd-11b2-a85c-af8123d033e3.ibm.com>
References: <20230224103940.1328725-1-nysal@linux.ibm.com>
 <2ca14657-8bc3-f4d8-c4ca-212a982bd209@csgroup.eu>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <2ca14657-8bc3-f4d8-c4ca-212a982bd209@csgroup.eu>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: yT9WY6glzVYUvZxVyN1Zzo9r0aUCwpJm
X-Proofpoint-GUID: yT9WY6glzVYUvZxVyN1Zzo9r0aUCwpJm
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-23_15,2023-03-23_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1011 malwarescore=0
 mlxlogscore=999 priorityscore=1501 impostorscore=0 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2303240006
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael,
Any comments on this one?

On Fri, Feb 24, 2023 at 11:02:31AM +0000, Christophe Leroy wrote:
> 
> 
> Le 24/02/2023 à 11:39, Nysal Jan K.A a écrit :
> > [Vous ne recevez pas souvent de courriers de nysal@linux.ibm.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> > 
> > Remove arch_atomic_try_cmpxchg_lock function as it is no longer used
> > since commit 9f61521c7a28 ("powerpc/qspinlock: powerpc qspinlock
> > implementation")
> > 
> > Signed-off-by: Nysal Jan K.A <nysal@linux.ibm.com>
> 
> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> 
> > ---
> >   arch/powerpc/include/asm/atomic.h | 29 -----------------------------
> >   1 file changed, 29 deletions(-)
> > 
> > diff --git a/arch/powerpc/include/asm/atomic.h b/arch/powerpc/include/asm/atomic.h
> > index 486ab7889121..b3a53830446b 100644
> > --- a/arch/powerpc/include/asm/atomic.h
> > +++ b/arch/powerpc/include/asm/atomic.h
> > @@ -130,35 +130,6 @@ ATOMIC_OPS(xor, xor, "", K)
> >   #define arch_atomic_xchg_relaxed(v, new) \
> >          arch_xchg_relaxed(&((v)->counter), (new))
> > 
> > -/*
> > - * Don't want to override the generic atomic_try_cmpxchg_acquire, because
> > - * we add a lock hint to the lwarx, which may not be wanted for the
> > - * _acquire case (and is not used by the other _acquire variants so it
> > - * would be a surprise).
> > - */
> > -static __always_inline bool
> > -arch_atomic_try_cmpxchg_lock(atomic_t *v, int *old, int new)
> > -{
> > -       int r, o = *old;
> > -       unsigned int eh = IS_ENABLED(CONFIG_PPC64);
> > -
> > -       __asm__ __volatile__ (
> > -"1:    lwarx   %0,0,%2,%[eh]   # atomic_try_cmpxchg_acquire            \n"
> > -"      cmpw    0,%0,%3                                                 \n"
> > -"      bne-    2f                                                      \n"
> > -"      stwcx.  %4,0,%2                                                 \n"
> > -"      bne-    1b                                                      \n"
> > -"\t"   PPC_ACQUIRE_BARRIER "                                           \n"
> > -"2:                                                                    \n"
> > -       : "=&r" (r), "+m" (v->counter)
> > -       : "r" (&v->counter), "r" (o), "r" (new), [eh] "n" (eh)
> > -       : "cr0", "memory");
> > -
> > -       if (unlikely(r != o))
> > -               *old = r;
> > -       return likely(r == o);
> > -}
> > -
> >   /**
> >    * atomic_fetch_add_unless - add unless the number is a given value
> >    * @v: pointer of type atomic_t
> > --
> > 2.39.2
> > 
