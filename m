Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 801F836112E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Apr 2021 19:37:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FLmkH2s0kz3bxF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 03:37:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PLkrZaK8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=PLkrZaK8; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FLmjp6hQKz300J
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Apr 2021 03:36:46 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13FHXVGX049897; Thu, 15 Apr 2021 13:36:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=DW64rjdI1cuyU64w5jp6pGksg11yq3aDpRhA9FKT2WQ=;
 b=PLkrZaK8gq9pkZT3+grKv18MnbVtI4ZPEXadZ5ftXmvAebVhx8LUYmOF7sgCKcLsD0RK
 DC59sYnfYBKxt35NmeYodFG5BfjNLIcpAg7Byvx/jnkChDyrKxybGwIuNdESn1BM4ZPY
 ukIGP43uVb1aFGBP7QHuKTamenJCLyFzzOY5E8bYKhsKL33YDlLMfKw2gdB83nhVu2Y1
 yIPz6IJRIH+ah7Abt1NHrPdpjFLjt+c7Wjnnw0ek/EsEmyBFrw4VkyGyEwOaOntcz7Oe
 pWx668HQ4T+KCCudp6tZinhJij37DYOhjEp8/6FagD7prj+HsMGg/LJdWXn2AaIoI9Bl jA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37x88jcrac-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Apr 2021 13:36:32 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13FHXj0T050874;
 Thu, 15 Apr 2021 13:36:31 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37x88jcr9n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Apr 2021 13:36:31 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13FHWJ6f019696;
 Thu, 15 Apr 2021 17:36:29 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04ams.nl.ibm.com with ESMTP id 37u3n8v1kw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Apr 2021 17:36:29 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13FHaROb40960510
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 15 Apr 2021 17:36:27 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 86B27AE055;
 Thu, 15 Apr 2021 17:36:27 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 27C91AE051;
 Thu, 15 Apr 2021 17:36:25 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu, 15 Apr 2021 17:36:24 +0000 (GMT)
Date: Thu, 15 Apr 2021 23:06:24 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Gautham R Shenoy <ego@linux.vnet.ibm.com>
Subject: Re: [PATCH 1/3] powerpc/smp: Reintroduce cpu_core_mask
Message-ID: <20210415173624.GD2633526@linux.vnet.ibm.com>
References: <20210415120934.232271-1-srikar@linux.vnet.ibm.com>
 <20210415120934.232271-2-srikar@linux.vnet.ibm.com>
 <20210415171134.GA16351@in.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20210415171134.GA16351@in.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 8jFMJfTb-8yThZdwpSV8pby5JOq97-LI
X-Proofpoint-ORIG-GUID: zoAc7Nt_nHIq7lI3yuFChwTRNQWDPbe8
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-15_09:2021-04-15,
 2021-04-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015
 mlxscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104150108
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, Peter Zijlstra <peterz@infradead.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Valentin Schneider <valentin.schneider@arm.com>, qemu-ppc@nongnu.org,
 Cedric Le Goater <clg@kaod.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Ingo Molnar <mingo@kernel.org>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Gautham R Shenoy <ego@linux.vnet.ibm.com> [2021-04-15 22:41:34]:

> Hi Srikar,
> 
> 

Thanks for taking a look.

> > @@ -1485,12 +1486,36 @@ static void add_cpu_to_masks(int cpu)
> >  	add_cpu_to_smallcore_masks(cpu);
> > 
> >  	/* In CPU-hotplug path, hence use GFP_ATOMIC */
> > -	alloc_cpumask_var_node(&mask, GFP_ATOMIC, cpu_to_node(cpu));
> > +	ret = alloc_cpumask_var_node(&mask, GFP_ATOMIC, cpu_to_node(cpu));
> >  	update_mask_by_l2(cpu, &mask);
> > 
> >  	if (has_coregroup_support())
> >  		update_coregroup_mask(cpu, &mask);
> > 
> > +	if (chip_id == -1 || !ret) {
> > +		cpumask_copy(per_cpu(cpu_core_map, cpu), cpu_cpu_mask(cpu));
> > +		goto out;
> > +	}
> > +
> > +	if (shared_caches)
> > +		submask_fn = cpu_l2_cache_mask;
> > +
> > +	/* Update core_mask with all the CPUs that are part of submask */
> > +	or_cpumasks_related(cpu, cpu, submask_fn, cpu_core_mask);
> >
> 
> If coregroups exist, we can add the cpus of the coregroup to the
> cpu_core_mask thereby reducing the scope of the for_each_cpu() search
> below. This will still cut down the time on Baremetal systems
> supporting coregroups.
> 

Yes, once we upstream coregroup support to Baremetal, we should look
at adding it. Also do note, number of CPUs we support for Baremetal is
comparatively lower than in PowerVM + QEMU. And more importantly the
number of cores per coregroup is also very low. So the optimization
may not yield too much of a benefit.

Its only in the QEMU case, where we end up having too many cores in
the same chip, where we see a drastic increase in the boot-up time.

-- 
Thanks and Regards
Srikar Dronamraju
