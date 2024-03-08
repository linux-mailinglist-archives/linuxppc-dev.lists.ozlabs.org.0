Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B391875D80
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Mar 2024 06:20:40 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=npxBWVE0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TrZJ60xC8z3vYv
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Mar 2024 16:20:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=npxBWVE0;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TrZHM0J86z2xLW
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Mar 2024 16:19:59 +1100 (AEDT)
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4TrZHH0TDsz4wxv
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Mar 2024 16:19:55 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4TrZHH0MH4z4wcl; Fri,  8 Mar 2024 16:19:55 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=npxBWVE0;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=mahesh@linux.ibm.com; receiver=ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4TrZHG4P1Hz4wb0;
	Fri,  8 Mar 2024 16:19:53 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 42857BMc011287;
	Fri, 8 Mar 2024 05:19:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=fmX4nWkkYbcQHc2iymUNVeRBhYq+jMW4a2phnbGHtgM=;
 b=npxBWVE0rr9jk3eBiGY/h0BCmDYP7ljqx/unc417Lb4rpfHwpGPW1H0PW/kw2Mr4dopp
 JACO6qVMoq3tyzq0HK2B/R4jzJ+qh1saCBKvTM06DrajUSC+q8UJITfx5u/6fc4/cEFG
 NXvxdxOteVa813dZGhQSekqFyg0Bs+GNsGBOqZo2IPvpOZUdlDyIMjlQ6rwjXZsRHQ4A
 fXVc5rVhwkuCbJR5P3Ln0XvFAD6ZFJWswFthmnOdfrtM+dRVhM3JC/N7wzu/7cfuO9fP
 lYD7uyQbAXvC+mXLcL5ZvRNATOb/q+IX4a8bUsIAb8gtV5TrgYMQS3OF/A3QqXJfDt93 cQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wqv88r5m9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Mar 2024 05:19:51 +0000
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 428576MS011174;
	Fri, 8 Mar 2024 05:19:50 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wqv88r5m3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Mar 2024 05:19:50 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 4283TvB1024211;
	Fri, 8 Mar 2024 05:19:49 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3wpjwsnpj0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Mar 2024 05:19:49 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4285JhB534275788
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 8 Mar 2024 05:19:45 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B302C2004B;
	Fri,  8 Mar 2024 05:19:43 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7250D20040;
	Fri,  8 Mar 2024 05:19:42 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.171.47.236])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Fri,  8 Mar 2024 05:19:42 +0000 (GMT)
Date: Fri, 8 Mar 2024 10:49:39 +0530
From: Mahesh J Salgaonkar <mahesh@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v4] powerpc: Avoid nmi_enter/nmi_exit in real mode
 interrupt.
Message-ID: <emzwsv2psn4bg4s4kmrbj6uc7hxbs22vcqf24rk63hv4ry2wyv@3wdx57e3nk4l>
References: <20240214095146.1527369-1-mahesh@linux.ibm.com>
 <87edcmnu7o.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87edcmnu7o.fsf@mail.lhotse>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 4yKwT_Y446OV79v8o1bI1yfgEcQVdfXj
X-Proofpoint-ORIG-GUID: 3wkGgs5MVQHuXf1GgnsVYHYonWbLI4a6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-08_03,2024-03-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 clxscore=1011 suspectscore=0 phishscore=0 mlxscore=0 bulkscore=0
 spamscore=0 mlxlogscore=999 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2403080040
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
Reply-To: mahesh@linux.ibm.com
Cc: linuxppc-dev <linuxppc-dev@ozlabs.org>, Ganesh Goudar <ganeshgr@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2024-03-07 22:43:07 Thu, Michael Ellerman wrote:
> > diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
> > index a4196ab1d0167..0b96464ff0339 100644
> > --- a/arch/powerpc/include/asm/interrupt.h
> > +++ b/arch/powerpc/include/asm/interrupt.h
> > @@ -336,6 +336,14 @@ static inline void interrupt_nmi_enter_prepare(struct pt_regs *regs, struct inte
> >  	if (IS_ENABLED(CONFIG_KASAN))
> >  		return;
> >  
> > +	/*
> > +	 * Likewise, do not use it in real mode if percpu first chunk is not
> > +	 * embedded. With CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK enabled there
> > +	 * are chances where percpu allocation can come from vmalloc area.
> > +	 */
> > +	if (IS_ENABLED(CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK) && !is_embed_first_chunk)
> 
> I think this would be clearer if it was inverted, eg:
> 
>         if (percpu_first_chunk_is_paged)
>                return;

Agree.

> 
> That way you shouldn't need to check CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK here.
> Instead it can be part of the ifdef in the header.
> 
> > @@ -351,6 +359,8 @@ static inline void interrupt_nmi_exit_prepare(struct pt_regs *regs, struct inter
> >  		// no nmi_exit for a pseries hash guest taking a real mode exception
> >  	} else if (IS_ENABLED(CONFIG_KASAN)) {
> >  		// no nmi_exit for KASAN in real mode
> > +	} else if (IS_ENABLED(CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK) && !is_embed_first_chunk) {
> > +		// no nmi_exit if percpu first chunk is not embedded
> >  	} else {
> >  		nmi_exit();
> >  	}
> > diff --git a/arch/powerpc/include/asm/percpu.h b/arch/powerpc/include/asm/percpu.h
> > index 8e5b7d0b851c6..e24063eb0b33b 100644
> > --- a/arch/powerpc/include/asm/percpu.h
> > +++ b/arch/powerpc/include/asm/percpu.h
> > @@ -15,6 +15,16 @@
> >  #endif /* CONFIG_SMP */
> >  #endif /* __powerpc64__ */
> >  
> > +#ifdef CONFIG_PPC64
> > +#include <linux/jump_label.h>
> > +DECLARE_STATIC_KEY_FALSE(__percpu_embed_first_chunk);
> > +
> > +#define is_embed_first_chunk	\
> > +		(static_key_enabled(&__percpu_embed_first_chunk.key))
> > +#else
> > +#define is_embed_first_chunk	true
> > +#endif /* CONFIG_PPC64 */
> > +
> 
> Something like:
> 
> #ifdef CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK
> #include <linux/jump_label.h>
> DECLARE_STATIC_KEY_FALSE(__percpu_first_chunk_is_paged);
> 
> #define percpu_first_chunk_is_paged	\
> 		(static_key_enabled(&__percpu_first_chunk_is_paged.key))
> #else
> #define percpu_first_chunk_is_paged	false
> #endif /* CONFIG_PPC64 */

Sure, will fix it.

> 
> > diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
> > index 2f19d5e944852..e04f0ff69d4b6 100644
> > --- a/arch/powerpc/kernel/setup_64.c
> > +++ b/arch/powerpc/kernel/setup_64.c
> > @@ -834,6 +834,7 @@ static __init int pcpu_cpu_to_node(int cpu)
> >  
> >  unsigned long __per_cpu_offset[NR_CPUS] __read_mostly;
> >  EXPORT_SYMBOL(__per_cpu_offset);
> > +DEFINE_STATIC_KEY_FALSE(__percpu_embed_first_chunk);
> >  
> >  void __init setup_per_cpu_areas(void)
> >  {
> > @@ -869,6 +870,8 @@ void __init setup_per_cpu_areas(void)
> >  			pr_warn("PERCPU: %s allocator failed (%d), "
> >  				"falling back to page size\n",
> >  				pcpu_fc_names[pcpu_chosen_fc], rc);
> > +		else
> > +			static_key_enable(&__percpu_embed_first_chunk.key);
> >  	}
> >  
> >  	if (rc < 0)
>  
> Finally, the current patch breaks the microwatt build:
> 
>   $ make microwatt_defconfig ; make -s -j (nproc)
>   make[1]: Entering directory '/home/michael/linux/.build'
>     GEN     Makefile
>   #
>   # configuration written to .config
>   #
>   make[1]: Leaving directory '/home/michael/linux/.build'
>   ld: arch/powerpc/kernel/traps.o:(.toc+0x0): undefined reference to `__percpu_embed_first_chunk'
>   ld: arch/powerpc/kernel/mce.o:(.toc+0x0): undefined reference to `__percpu_embed_first_chunk'
>   make[3]: *** [../scripts/Makefile.vmlinux:37: vmlinux] Error 1
> 
> I guess because it has CONFIG_JUMP_LABEL=n?

Even with CONFIG_JUMP_LABEL=n it should still work. Let me take look and
fix this for microwatt build.

Thanks for your review.
-Mahesh.

> 
> cheers

-- 
Mahesh J Salgaonkar
