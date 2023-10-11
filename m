Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAAAB7C536D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Oct 2023 14:17:31 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dWXGSxr+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S5Bbs1xlrz3vYh
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Oct 2023 23:17:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dWXGSxr+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S5BZv0WxGz3bbW
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 23:16:38 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39BCFhha018528;
	Wed, 11 Oct 2023 12:16:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=k6CiMJSgV58Ut5fUlbSS3nqLeyv7oq82AyYp8vZZPnM=;
 b=dWXGSxr+06WE2EKI3rAbMlGGetbhJ2463nVBW/2V+GQc8Non8nKhCBhMXSKM9mU5tnd6
 DaiF2DuV4l0/C8TqIPOpG6wdIRGDUsWNZGdnbsGwXxd5BSzw/Vpyb1YriZMSLW0uW5B3
 oOdLQlaDQloPyc8jR0qvnF/jAfzO3lVnR+xPA2RSGuqVwokh0p8IlXgG5nsQHripj8dO
 ptpItirECM9Jkq67qEbddgy2IxNkt3TfoUrflv05DFz5z8HAFS0KByjZUTGVNdAIbc6q
 hXygt9eIuEomEEpKXaXioOZxxi59bXs23TMBRHKXppv9SeBJOo3w8Mnpl0vn2D7PLcIG 0w== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tnuj3r0hs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Oct 2023 12:16:29 +0000
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 39BCGTcQ020326;
	Wed, 11 Oct 2023 12:16:29 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tnuj3r0he-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Oct 2023 12:16:29 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 39BBHIW8025859;
	Wed, 11 Oct 2023 12:16:28 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3tkjnnfvpc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Oct 2023 12:16:28 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 39BCGQP316056966
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 11 Oct 2023 12:16:26 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5869D2004D;
	Wed, 11 Oct 2023 12:16:26 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5DC3C20040;
	Wed, 11 Oct 2023 12:16:24 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with SMTP;
	Wed, 11 Oct 2023 12:16:24 +0000 (GMT)
Date: Wed, 11 Oct 2023 17:46:23 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Shrikanth Hegde <sshegde@linux.vnet.ibm.com>
Subject: Re: [PATCH] powerpc/paravirt: Improve vcpu_is_preempted
Message-ID: <20231011121623.GC2194132@linux.vnet.ibm.com>
References: <20231009051740.17683-1-srikar@linux.vnet.ibm.com>
 <1ebf2b9d-f496-565c-bc00-4fee9cb11b0b@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <1ebf2b9d-f496-565c-bc00-4fee9cb11b0b@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: eKD1QRwlY64TOFagGPd4AClB46Iiv0E_
X-Proofpoint-ORIG-GUID: DnlrHEatQdX-d-FkX5yBMiQI3E4l7GTq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-11_09,2023-10-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=999 impostorscore=0
 spamscore=0 clxscore=1015 suspectscore=0 adultscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310110107
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
Cc: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, virtualization@lists.linux-foundation.org, Ajay Kaher <akaher@vmware.com>, Alexey Makhalov <amakhalov@vmware.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Shrikanth Hegde <sshegde@linux.vnet.ibm.com> [2023-10-11 14:33:34]:
> On 10/9/23 10:47 AM, Srikar Dronamraju wrote:
> 
> Hi Srikar. This is an interesting patch. 
> 
> > PowerVM Hypervisor dispatches on a whole core basis. In a shared LPAR, a
> s/whole/big 
> 
> Can we mention that a big core consist of two small cores. and w.r.t
> linux a core is at small core. Hence there is mismatch. 

PowerVM currently always schedules at a Big core granularity. And we would
want to transparent about it even if it changes.

> > CPU from a core that is preempted may have a larger latency. In
> > such a scenario, its preferable to choose a different CPU to run.
> > 
> > If one of the CPUs in the core is active, i.e neither CEDED nor
> > preempted, then consider this CPU as not preempted
> > 
> > Also if any of the CPUs in the core has yielded but OS has not requested
> > CEDE or CONFER, then consider this CPU to be preempted.
> > 
> 
> This is because an idle CPU cannot be preempted. Right?

If a CPU from the same SMT8 core has been preempted, we should consider this CPU
also has been preempted.

> 
> This patch should help address the has_idle_core functionality and ttwu path 
> in powerpc SPLPAR based on powerVM. Currently they are not correct.  
> 
> when the all the CPU's are idle, __update_idle_core will not set has_idle_core
>  which is functionally not right. That is one example, there are other places where correct 
> functionality of vcpu_is_preempted is crucial as well. 
> 

Right, its a crucial from a functionality perspective on shared LPARs.
The Dedicated ones dont have this issue.

> 
> > Cc: Ajay Kaher <akaher@vmware.com>
> > Cc: Alexey Makhalov <amakhalov@vmware.com>
> > Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> > Cc: Juergen Gross <jgross@suse.com>
> > Cc: linux-kernel@vger.kernel.org
> > Cc: linuxppc-dev@lists.ozlabs.org
> > Cc: Michael Ellerman <mpe@ellerman.id.au>
> > Cc: Nicholas Piggin <npiggin@gmail.com>
> > Cc: virtualization@lists.linux-foundation.org
> > Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
> > ---
> >  arch/powerpc/include/asm/paravirt.h | 33 ++++++++++++++++++++++++++---
> >  1 file changed, 30 insertions(+), 3 deletions(-)
> > 
> > diff --git a/arch/powerpc/include/asm/paravirt.h b/arch/powerpc/include/asm/paravirt.h
> > index e08513d73119..a980756f58df 100644
> > --- a/arch/powerpc/include/asm/paravirt.h
> > +++ b/arch/powerpc/include/asm/paravirt.h
> > @@ -121,9 +121,19 @@ static inline bool vcpu_is_preempted(int cpu)
> >  	if (!is_shared_processor())
> >  		return false;
> > 
> > +	if (!(yield_count_of(cpu) & 1))
> > +		return false;
> > +
> > +	/*
> > +	 * If CPU has yielded but OS has not requested idle then this CPU is
> 
> nit: can it be "if CPU is in hypervisor but OS has not requested ..." ?

Ok, will take it.

> 
> > +	 * definitely preempted.
> > +	 */
> > +	if (!lppaca_of(cpu).idle)
> > +		return true;
> > +
> >  #ifdef CONFIG_PPC_SPLPAR
> >  	if (!is_kvm_guest()) {
> > -		int first_cpu;
> > +		int first_cpu, i;
> > 
> >  		/*
> >  		 * The result of vcpu_is_preempted() is used in a
> > @@ -149,11 +159,28 @@ static inline bool vcpu_is_preempted(int cpu)
> >  		 */
> >  		if (cpu_first_thread_sibling(cpu) == first_cpu)
> >  			return false;
> > +
> > +		/*
> > +		 * If any of the threads of this core is not preempted or
> > +		 * ceded, then consider this CPU to be non-preempted
> > +		 */
> > +		first_cpu = cpu_first_thread_sibling(cpu);
> > +		for (i = first_cpu; i < first_cpu + threads_per_core; i++) {
> > +			if (i == cpu)
> > +				continue;
> > +			if (!(yield_count_of(i) & 1))
> > +				return false;
> > +			if (!lppaca_of(i).idle)
> > +				return true;
> > +		}
> >  	}
> >  #endif
> > 
> > -	if (yield_count_of(cpu) & 1)
> > -		return true;
> > +	/*
> > +	 * None of the threads in this thread group are running but none of
> > +	 * them were preempted too. Hence assume the thread to be
> > +	 * non-preempted.
> > +	 */
> 
> That comment is bit confusing. instead of threads it would be better say CPUs
> 
> "None of the CPUs in this Big Core are running but none of them were preempted too. Hence assume the 
> the CPU to be non-preempted."
> 
> 
> >  	return false;
> >  }
> > 
> 
> Otherwise LGTM
> Reviewed-by: Shrikanth Hegde <sshegde@linux.vnet.ibm.com>


Thanks Shrikanth.

-- 
Thanks and Regards
Srikar Dronamraju
