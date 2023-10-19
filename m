Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 471CA7CFA68
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Oct 2023 15:09:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VU0RxPDg;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SB7NZ1XGJz3vXT
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Oct 2023 00:09:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VU0RxPDg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SB7Mj5hLBz3cRN
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Oct 2023 00:09:05 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39JD5pnw022703;
	Thu, 19 Oct 2023 13:08:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=wefq5l/NfyiUOh2/K3hLXsYdyjlw2nsfgUdvc6uHmaQ=;
 b=VU0RxPDgFnJIB9glY0+FpWzyhm0tw+o/UmuH//TM0WfFCSGo+/s3Juz4nuiNlEkkjF4c
 Y1vrRtrUJQPgEWoXjIZkCi7w+ig5iCN5FDk2YeQNH/jxosmlWn6qO5D7mTovlbu27D/U
 MEe/RFU8N+ylgffyGx2mIpZycrlsWSm1as9y/CPr7Le/0AOmeE/jz26zDqBgcmn2ZVrp
 zBGfopV7+3kAxvQEo0oQy1Z9GGWCFNMKiPZHS912RaIzL9Qj6b0jo+8AN1ggDuWj+zeQ
 vXT5nGaSvM8uzcHbn59Rfk5h9Fj+z8DfyFlZ7qEYp6GqpUJmveawHutekVAUqfdW4VX4 qA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tu51nr7f7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Oct 2023 13:08:51 +0000
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 39JD6NIw026640;
	Thu, 19 Oct 2023 13:08:50 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tu51nr7dy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Oct 2023 13:08:50 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 39JAF9GS019900;
	Thu, 19 Oct 2023 13:08:49 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3tr8120evx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Oct 2023 13:08:49 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 39JD8ll344302644
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Oct 2023 13:08:47 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 88C6320043;
	Thu, 19 Oct 2023 13:08:47 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9DFB420040;
	Thu, 19 Oct 2023 13:08:44 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with SMTP;
	Thu, 19 Oct 2023 13:08:44 +0000 (GMT)
Date: Thu, 19 Oct 2023 18:38:43 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v2 3/6] powerpc/smp: Move shared_processor static key to
 smp.h
Message-ID: <20231019130843.GI2194132@linux.vnet.ibm.com>
References: <20231018163751.2423181-1-srikar@linux.vnet.ibm.com>
 <20231018163751.2423181-4-srikar@linux.vnet.ibm.com>
 <87sf675im3.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <87sf675im3.fsf@mail.lhotse>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: aU8TME1IjwVF9r22d_NEiqeu4_u4_b1W
X-Proofpoint-GUID: 27h_Y8VBQgPyYVsbJj6D0z1NkvNofouQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-19_11,2023-10-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 mlxscore=0
 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 mlxlogscore=793 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310190112
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
Reply-To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Cc: Valentin Schneider <vschneid@redhat.com>, Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org, x86@kernel.org, Ajay Kaher <akaher@vmware.com>, Nicholas Piggin <npiggin@gmail.com>, virtualization@lists.linux-foundation.org, VMware PV-Drivers Reviewers <pv-drivers@vmware.com>, Rohan McLure <rmclure@linux.ibm.com>, Alexey Makhalov <amakhalov@vmware.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Josh Poimboeuf <jpoimboe@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Michael Ellerman <mpe@ellerman.id.au> [2023-10-19 15:41:40]:

> Srikar Dronamraju <srikar@linux.vnet.ibm.com> writes:
> > The ability to detect if the system is running in a shared processor
> > mode is helpful in few more generic cases not just in
> > paravirtualization.
> > For example: At boot time, different scheduler/ topology flags may be
> > set based on the processor mode. Hence move it to a more generic file.
> 
> I'd rather you just included paravirt.h in the few files where you need it.


I thought, detecting if a Processor was shared or not was more a
smp/processor related than a paravirt related.

Will drop as suggested.

> 
> cheers
> 
> > diff --git a/arch/powerpc/include/asm/paravirt.h b/arch/powerpc/include/asm/paravirt.h
> > index 0372b0093f72..cf83e837a571 100644
> > --- a/arch/powerpc/include/asm/paravirt.h
> > +++ b/arch/powerpc/include/asm/paravirt.h
> > @@ -15,13 +15,6 @@
> >  #include <asm/kvm_guest.h>
> >  #include <asm/cputhreads.h>
> >  
> > -DECLARE_STATIC_KEY_FALSE(shared_processor);
> > -
> > -static inline bool is_shared_processor(void)
> > -{
> > -	return static_branch_unlikely(&shared_processor);
> > -}
> > -
> >  #ifdef CONFIG_PARAVIRT_TIME_ACCOUNTING
> >  extern struct static_key paravirt_steal_enabled;
> >  extern struct static_key paravirt_steal_rq_enabled;
> > @@ -77,11 +70,6 @@ static inline bool is_vcpu_idle(int vcpu)
> >  	return lppaca_of(vcpu).idle;
> >  }
> >  #else
> > -static inline bool is_shared_processor(void)
> > -{
> > -	return false;
> > -}
> > -
> >  static inline u32 yield_count_of(int cpu)
> >  {
> >  	return 0;
> > diff --git a/arch/powerpc/include/asm/smp.h b/arch/powerpc/include/asm/smp.h
> > index aaaa576d0e15..08631b2a4528 100644
> > --- a/arch/powerpc/include/asm/smp.h
> > +++ b/arch/powerpc/include/asm/smp.h
> > @@ -34,6 +34,20 @@ extern bool coregroup_enabled;
> >  extern int cpu_to_chip_id(int cpu);
> >  extern int *chip_id_lookup_table;
> >  
> > +#ifdef CONFIG_PPC_SPLPAR
> > +DECLARE_STATIC_KEY_FALSE(shared_processor);
> > +
> > +static inline bool is_shared_processor(void)
> > +{
> > +	return static_branch_unlikely(&shared_processor);
> > +}
> > +#else
> > +static inline bool is_shared_processor(void)
> > +{
> > +	return false;
> > +}
> > +#endif
> > +
> >  DECLARE_PER_CPU(cpumask_var_t, thread_group_l1_cache_map);
> >  DECLARE_PER_CPU(cpumask_var_t, thread_group_l2_cache_map);
> >  DECLARE_PER_CPU(cpumask_var_t, thread_group_l3_cache_map);
> > -- 
> > 2.31.1

-- 
Thanks and Regards
Srikar Dronamraju
