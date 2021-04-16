Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C08A5362634
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 18:58:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FMMpk5qKLz3byg
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Apr 2021 02:58:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Pqc1+jNG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Pqc1+jNG; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FMMpH1GBGz302y
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Apr 2021 02:57:42 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13GGYSHZ054382; Fri, 16 Apr 2021 12:57:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=FhcpdImEoIm2TiybHoHvM3KHNt1Ze0TL5IbuX5AK7OM=;
 b=Pqc1+jNGzpDuyHkEKzPxEsm5TITflE0PnM/HE+qO6YF3R7m6Wekht3TfWKvHzthr7OAc
 aew9M8EkN1ZoeCFyVvQRNW/G15rfpL3AY0cBOhtO5O6YXuRCq/Yg4NtesMiXP2OaYygc
 ff+cAEg+Dj3fHt9PJDvzQVGsHnadZlDJqLYnq9Zo09MOqBJkHV++qe4ts/GD/8TJuYoZ
 SvXu04zgi/BQiI5cZUK0Pm9piy+wODGVduaNjbY5I+1zZ7ZmAbANi6pyLvU05GGPfZvj
 g2uieAYjXVTcncYRdnIFLxJ921/54rcukJcjzHeqPU71h3s1FmO8DT025/N3ERad4A9A Dw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37xsvb0u6m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Apr 2021 12:57:22 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13GGZW34059763;
 Fri, 16 Apr 2021 12:57:22 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37xsvb0u62-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Apr 2021 12:57:22 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13GGvKHM010040;
 Fri, 16 Apr 2021 16:57:20 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06ams.nl.ibm.com with ESMTP id 37u39hmk77-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Apr 2021 16:57:20 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 13GGutrd30867780
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 16 Apr 2021 16:56:55 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BFF914C04E;
 Fri, 16 Apr 2021 16:57:17 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 79C4A4C046;
 Fri, 16 Apr 2021 16:57:15 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri, 16 Apr 2021 16:57:15 +0000 (GMT)
Date: Fri, 16 Apr 2021 22:27:14 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Gautham R Shenoy <ego@linux.vnet.ibm.com>
Subject: Re: [PATCH 3/3] powerpc/smp: Cache CPU to chip lookup
Message-ID: <20210416165714.GG2633526@linux.vnet.ibm.com>
References: <20210415120934.232271-1-srikar@linux.vnet.ibm.com>
 <20210415120934.232271-4-srikar@linux.vnet.ibm.com>
 <20210415171921.GB16351@in.ibm.com>
 <20210415175110.GE2633526@linux.vnet.ibm.com>
 <20210416155748.GA26496@in.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20210416155748.GA26496@in.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 8bp4HaOlLpK87NpjPmEm9_9qTCrb9y8L
X-Proofpoint-GUID: X4gHH-xksQmxB6DAc_s7gGb323e9WAJc
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-16_08:2021-04-16,
 2021-04-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0
 phishscore=0 mlxlogscore=999 priorityscore=1501 spamscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 mlxscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104160119
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

* Gautham R Shenoy <ego@linux.vnet.ibm.com> [2021-04-16 21:27:48]:

> On Thu, Apr 15, 2021 at 11:21:10PM +0530, Srikar Dronamraju wrote:
> > * Gautham R Shenoy <ego@linux.vnet.ibm.com> [2021-04-15 22:49:21]:
> > 
> > > > 
> > > > +int *chip_id_lookup_table;
> > > > +
> > > >  #ifdef CONFIG_PPC64
> > > >  int __initdata iommu_is_off;
> > > >  int __initdata iommu_force_on;
> > > > @@ -914,13 +916,22 @@ EXPORT_SYMBOL(of_get_ibm_chip_id);
> > > >  int cpu_to_chip_id(int cpu)
> > > >  {
> > > >  	struct device_node *np;
> > > > +	int ret = -1, idx;
> > > > +
> > > > +	idx = cpu / threads_per_core;
> > > > +	if (chip_id_lookup_table && chip_id_lookup_table[idx] != -1)
> > > 
> > 
> > > The value -1 is ambiguous since we won't be able to determine if
> > > it is because we haven't yet made a of_get_ibm_chip_id() call
> > > or if of_get_ibm_chip_id() call was made and it returned a -1.
> > > 
> > 
> > We don't allocate chip_id_lookup_table unless cpu_to_chip_id() return
> > !-1 value for the boot-cpuid. So this ensures that we dont
> > unnecessarily allocate chip_id_lookup_table. Also I check for
> > chip_id_lookup_table before calling cpu_to_chip_id() for other CPUs.
> > So this avoids overhead of calling cpu_to_chip_id() for platforms that
> > dont support it.  Also its most likely that if the
> > chip_id_lookup_table is initialized then of_get_ibm_chip_id() call
> > would return a valid value.
> > 
> > + Below we are only populating the lookup table, only when the
> > of_get_cpu_node is valid.
> > 
> > So I dont see any drawbacks of initializing it to -1. Do you see
> any?
> 
> 
> Only if other callers of cpu_to_chip_id() don't check for whether the
> chip_id_lookup_table() has been allocated or not. From a code
> readability point of view, it is easier to have that check  this inside
> cpu_to_chip_id() instead of requiring all its callers to make that
> check.
> 

I didn't understand your comment. However let me reiterate what I said
earlier. We don't have control over who and when cpu_to_chip_id() gets
called. If the cpu_to_chip_id() might be called for non present CPU,
in which case it will return -1, Should we cache it or not?

If we cache it, we will return wrong value when the CPU may turn out
to be present. If we cache and retry it then having one value for
initializing and another for invalid is all the same as having just 1
value for initializing and invalid. Just that we end up adding more
confusing code. Atleast to me, code isnt readable if I say retry for
-1 and -2 too. After few years, we ourselves will wonder why we have
two values if we are checking and performing same actions.

> > 
> > > Thus, perhaps we can initialize chip_id_lookup_table[idx] with a
> > > different unique negative value. How about S32_MIN ? and check
> > > chip_id_lookup_table[idx] is different here ?
> > > 
> > 
> > I had initially initialized to -2, But then I thought we adding in
> > more confusion than necessary and it was not solving any issues.
> > 
> > 
> > -- 
> > Thanks and Regards
> > Srikar Dronamraju

-- 
Thanks and Regards
Srikar Dronamraju
