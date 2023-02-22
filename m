Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9436969EFFC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Feb 2023 09:17:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PM8Cz3nQCz3c9L
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Feb 2023 19:17:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=O6q1rtXa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=kconsul@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=O6q1rtXa;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PM8C00nH0z2ynx
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Feb 2023 19:16:59 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31M7NgfU007881;
	Wed, 22 Feb 2023 08:16:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=pp1;
 bh=Bi/Gk9IAru3YSqavt4h7+P7apdAjlTboqM4aaFTM7Z4=;
 b=O6q1rtXa+YILFAg5kVQa41MdEi1PqLeibkxa1CIcHq8INhN2N9PVlFdk65CqESdk4B/t
 JTdwUQ37XZlII1UdGBYRrMiqne2lBPrD1Wo1mbCfxxLkfRUEDE0b+VRWMU+XXg5sdgd6
 gRWL5fdjBNvFVixM2ns1Oj5PAmbxI12ETyQWXYx64ENdrZcndIdowLNfENbwcta51tcp
 2BqHRRE5/xtddI/zEzCx8f8BUYRmR67AeQCWmwet+HcwoN3SRshnoL6qkXg4S8pJHZrM
 2sz5Sb8bBVVJk6EPu2656OQtyCTUOCSXdFxHFw59lSEJ7MVif+jywGJGwP5A1iK3/FXA eQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nwemds373-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Feb 2023 08:16:51 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31M88uPO011154;
	Wed, 22 Feb 2023 08:16:50 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nwemds35a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Feb 2023 08:16:50 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
	by ppma06fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31LDE6oQ008627;
	Wed, 22 Feb 2023 08:16:47 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma06fra.de.ibm.com (PPS) with ESMTPS id 3ntnxf3tx8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Feb 2023 08:16:47 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 31M8Gjtk43057582
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 22 Feb 2023 08:16:45 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3703320040;
	Wed, 22 Feb 2023 08:16:45 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9B6312004D;
	Wed, 22 Feb 2023 08:16:42 +0000 (GMT)
Received: from li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com (unknown [9.43.123.148])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed, 22 Feb 2023 08:16:42 +0000 (GMT)
Date: Wed, 22 Feb 2023 13:46:38 +0530
From: Kautuk Consul <kconsul@linux.vnet.ibm.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] arch/powerpc/include/asm/barrier.h: redefine rmb and wmb
 to lwsync
Message-ID: <Y/XPZl8V4/0Bjegy@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
References: <20230222060107.70565-1-kconsul@linux.vnet.ibm.com>
 <896436d1-04e4-8019-0f89-f4d4938f9697@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <896436d1-04e4-8019-0f89-f4d4938f9697@csgroup.eu>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: SV5rauw6sPHFGf27U6aQqygD2KEYCTg4
X-Proofpoint-GUID: fXg6Dg3v7ksWoesIg3xNgWMuP5ylPwIf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-22_04,2023-02-20_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 impostorscore=0
 bulkscore=0 phishscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302220069
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Feb 22, 2023 at 07:02:34AM +0000, Christophe Leroy wrote:
> 
> 
> Le 22/02/2023 à 07:01, Kautuk Consul a écrit :
> > A link from ibm.com states:
> > "Ensures that all instructions preceding the call to __lwsync
> >   complete before any subsequent store instructions can be executed
> >   on the processor that executed the function. Also, it ensures that
> >   all load instructions preceding the call to __lwsync complete before
> >   any subsequent load instructions can be executed on the processor
> >   that executed the function. This allows you to synchronize between
> >   multiple processors with minimal performance impact, as __lwsync
> >   does not wait for confirmation from each processor."
> > 
> > Thats why smp_rmb() and smp_wmb() are defined to lwsync.
> > But this same understanding applies to parallel pipeline
> > execution on each PowerPC processor.
> > So, use the lwsync instruction for rmb() and wmb() on the PPC
> > architectures that support it.
> > 
> > Also removed some useless spaces.
> > 
> > Signed-off-by: Kautuk Consul <kconsul@linux.vnet.ibm.com>
> > ---
> >   arch/powerpc/include/asm/barrier.h | 12 +++++++++---
> >   1 file changed, 9 insertions(+), 3 deletions(-)
> > 
> > diff --git a/arch/powerpc/include/asm/barrier.h b/arch/powerpc/include/asm/barrier.h
> > index e80b2c0e9315..553f5a5d20bd 100644
> > --- a/arch/powerpc/include/asm/barrier.h
> > +++ b/arch/powerpc/include/asm/barrier.h
> > @@ -41,11 +41,17 @@
> >   
> >   /* The sub-arch has lwsync */
> >   #if defined(CONFIG_PPC64) || defined(CONFIG_PPC_E500MC)
> > -#    define SMPWMB      LWSYNC
> 
> This line shouldn't be changed by your patch
I mentioned it in the commit message.
But if you want I'll remove this. Did this because the rest
of the file doesn't have these spaces.
> 
> > +#undef rmb
> > +#undef wmb
> 
> I see no point with defining something and undefining them a few lines 
> later.
> 
> Instead, why not do:
> 
> #define mb()   __asm__ __volatile__ ("sync" : : : "memory")
> 
> #if defined(CONFIG_PPC64) || defined(CONFIG_PPC_E500MC)
> #define rmb()	({__asm__ __volatile__ ("lwsync" : : : "memory"); })
> #define wmb()	({__asm__ __volatile__ ("lwsync" : : : "memory"); })
> #else
> #define rmb()  __asm__ __volatile__ ("sync" : : : "memory")
> #define wmb()  __asm__ __volatile__ ("sync" : : : "memory")
> #endif
> 
I thought of doing that earlier, but there exists one more #elif
for CONFIG_BOOKE and then the #else.
That way we would have to put 3 different #defines for rmb and wmb
and I wanted to avoid that.
> By the way, why put it inside a ({ }) ?
checkpatch.pl asks for ({}).
> And I think nowdays we use "asm volatile" not "__asm__ __volatile__"
I was just following what was there in the file already.
Can change this if required.
> 
> Shouldn't you also consider the same for mb() ?
My change wasn't meant to address newer usages of as volatile
#defines. I just wanted to redefine the rmb and wmb #defines
to lwsync.
> 
> Note that your series will conflict with b6e259297a6b ("powerpc/kcsan: 
> Memory barriers semantics") in powerpc/next tree.
I thought of defining the __rmb and __wmb macros but I decided against
it because I didn't understand kcsan completely.
I used the standard Linus' tree, not powerpc/next.
Can you tell me which branch or git repo I should make this patch on ?
> 
> > +/* Redefine rmb() to lwsync. */
> 
> WHat's the added value of this comment ? Isn't it obvious in the line 
> below that rmb() is being defined to lwsync ? Please avoid useless comments.
Sure.
> 
> > +#define rmb()	({__asm__ __volatile__ ("lwsync" : : : "memory"); })
> > +/* Redefine wmb() to lwsync. */
> > +#define wmb()	({__asm__ __volatile__ ("lwsync" : : : "memory"); })
> > +#define SMPWMB      LWSYNC
> >   #elif defined(CONFIG_BOOKE)
> > -#    define SMPWMB      mbar
> 
> This line shouldn't be changed by your patch
> 
> > +#define SMPWMB      mbar
> >   #else
> > -#    define SMPWMB      eieio
Ok. Can change my patch.
> 
> This line shouldn't be changed by your patch
> 
> > +#define SMPWMB      eieio
> >   #endif
Sure. Will retain this too.
> >   
> >   /* clang defines this macro for a builtin, which will not work with runtime patching */
