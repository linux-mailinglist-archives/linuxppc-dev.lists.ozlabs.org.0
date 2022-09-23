Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9205E72B4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 06:10:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MYdww6GWsz3cdg
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 14:10:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=APdKrjZH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=APdKrjZH;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MYdwB0Hrsz305M
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Sep 2022 14:10:01 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28N3HPru001286;
	Fri, 23 Sep 2022 04:09:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : date : in-reply-to : references : content-type : mime-version
 : content-transfer-encoding; s=pp1;
 bh=C01ARR9YA9yI5yRVaO7gQ7gN2jtvSNaU4rQBm2GjThA=;
 b=APdKrjZHZNjGtXemPulAXDJ0RmQWr2cerrrLgF0sDX8YjumLd6Lwh+eTNgL9bGwfYN2V
 Unk9TkSndyJllj/bIKDLQsQkSs3Oerwew0J3EHNCbFMbsQL6JV2q/V33xaDd7dTu9HXR
 T8DeDd7BUapBwQm/mOnmfyK0gkfo0YAQ7vWf96RwrP5PHHezLqnqFZIZExBtS3HAObWD
 c9uthsOIn14wtJxJtCs++XConaulciWnWdxHU2qN+/g8+oJPqHqrmMQXEHY2P3bevbrU
 ZH8L6zhnn4BVPiJIiRArYdykZ4EWaLubFSEZi8duvKsQCvKSTZ8hy3gQ+Du4jkdcD4+p PQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3js3gakd5s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Sep 2022 04:09:52 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28N3fNDQ018864;
	Fri, 23 Sep 2022 04:09:52 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com [169.53.41.122])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3js3gakd59-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Sep 2022 04:09:52 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
	by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28N46FDT026646;
	Fri, 23 Sep 2022 04:09:51 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com [9.57.198.25])
	by ppma04dal.us.ibm.com with ESMTP id 3jn5vaeaxe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Sep 2022 04:09:51 +0000
Received: from smtpav04.wdc07v.mail.ibm.com ([9.208.128.116])
	by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28N49oD42949804
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 23 Sep 2022 04:09:50 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1A1E358045;
	Fri, 23 Sep 2022 04:09:50 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0635958054;
	Fri, 23 Sep 2022 04:09:49 +0000 (GMT)
Received: from sig-9-77-146-251.ibm.com (unknown [9.77.146.251])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 23 Sep 2022 04:09:48 +0000 (GMT)
Message-ID: <6cae63897a458c0c3df3edb94566bb96990e8c26.camel@linux.ibm.com>
Subject: Re: [PATCH] powerpc: Ignore DSI error caused by the copy/paste
 instruction
From: Haren Myneni <haren@linux.ibm.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        "mpe@ellerman.id.au"
	 <mpe@ellerman.id.au>,
        "npiggin@gmail.com" <npiggin@gmail.com>,
        "linuxppc-dev@lists.ozlabs.org"
	 <linuxppc-dev@lists.ozlabs.org>
Date: Thu, 22 Sep 2022 21:09:39 -0700
In-Reply-To: <859d233e-99c6-be6e-d770-dff511101109@csgroup.eu>
References: <bc3ff98e0da908d452cc161d6e1aca8ccec02d03.camel@linux.ibm.com>
	 <859d233e-99c6-be6e-d770-dff511101109@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Fou3m407QlJzUMZR-ys2aHarczOkDjDj
X-Proofpoint-ORIG-GUID: uA_2C0Rfs7q6jidNi9jPv810B1d1Ky7h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-23_02,2022-09-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 mlxlogscore=999
 impostorscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 mlxscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209230025
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2022-09-22 at 09:04 +0000, Christophe Leroy wrote:
> 
> Le 22/09/2022 à 10:29, Haren Myneni a écrit :
> > DSI error will be generated when the paste operation is issued on
> > the suspended NX window due to NX state changes. The hypervisor
> > expects the partition to ignore this error during page pault
> > handling. To differentiate DSI caused by an actual HW configuration
> > or by the NX window, a new “ibm,pi-features” type value is defined.
> > Byte 0, bit 3 of pi-attribute-specifier-type is now defined to
> > indicate this DSI error.
> 
> What is NX ? No eXec ? That's what it is usually. But in that case
> it 
> would be the ISI, not DSI.

NX is nest accelerator supports several functions such as compression,
encryption and etc. It is DSI error mentioned in PAPR ("DSI Caused by
User Mode NX")

> 
> > This patch adds changes to read ibm,pi-features property and ignore
> > DSI error in the page fault handling if CPU_FTR_NX_DSI if defined.
> > 
> > Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> > ---
> >   arch/powerpc/include/asm/cputable.h |  5 ++--
> >   arch/powerpc/kernel/prom.c          | 36 +++++++++++++++++++++---
> > -----
> >   arch/powerpc/mm/fault.c             | 17 +++++++++++++-
> >   3 files changed, 45 insertions(+), 13 deletions(-)
> > 
> > diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
> > index 014005428687..154cc1e85770 100644
> > --- a/arch/powerpc/mm/fault.c
> > +++ b/arch/powerpc/mm/fault.c
> > @@ -367,7 +367,22 @@ static void sanity_check_fault(bool is_write,
> > bool is_user,
> >   #elif defined(CONFIG_PPC_8xx)
> >   #define page_fault_is_bad(__err)	((__err) & DSISR_NOEXEC_OR_G)
> >   #elif defined(CONFIG_PPC64)
> > -#define page_fault_is_bad(__err)	((__err) & DSISR_BAD_FAULT_64S)
> > +static inline int page_fault_is_bad(unsigned long __err)
> 
> The name was __err because it was a macro and there was a risk of 
> collision with a 'err' variable in the caller.
> 
> But as it is now a function, you can just call it 'err'.
> 
> And no need of the 'inline' keyword, GCC will inline it anyway.

Thanks for your comments. I will repost the patch with these changes.

> 
> > +{
> > +	unsigned long flag = DSISR_BAD_FAULT_64S;
> > +
> > +	/*
> > +	 * PAPR 14.15.3.4.1
> > +	 * If byte 0, bit 3 of pi-attribute-specifier-type in
> > +	 * ibm,pi-features property is defined, ignore the DSI error
> > +	 * which is caused by the paste instruction on the
> > +	 * suspended NX window.
> > +	 */
> > +	if (cpu_has_feature(CPU_FTR_NX_DSI))
> > +		flag &= ~DSISR_BAD_COPYPASTE;
> > +
> > +	return ((__err) & flag);
> 
> The () around __err was because it was a macro parameter. It is 
> pointless now. And same for the overall ones. Now it can be :
> 
> 	return err & flags;
> 
> > +}
> >   #else
> >   #define page_fault_is_bad(__err)	((__err) & DSISR_BAD_FAULT_32S)
> >   #endif

