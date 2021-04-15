Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 185D836116E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Apr 2021 19:51:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FLn3H6yCFz3bqs
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 03:51:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ad2glWOM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Ad2glWOM; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FLn2r0NWyz309X
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Apr 2021 03:51:31 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13FHYrh1042903; Thu, 15 Apr 2021 13:51:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=f3bbhzPCDmP7JUfVR9orh93YXeJN9bLXytDu5EICHpU=;
 b=Ad2glWOMlxOAdU3rn4qQumERNeulSIN7PKSu9n74E5VUvZvGNwyNNXywl54iGB5W6Q9u
 C29YuTBST8HFIqEkvTKcRYZqkU9pbdgYypFRP8OyMXvfSdIe+P4XDmESB7GkFtQjncNr
 AYRvzhzWu1qEiUQqV7JD/MXngXvCRs37bnp4mJq+hSQF9n4rAcfg+MQiW98HD4BnDtl4
 n6lejqUjyQwqNIGHvEXaLnhGsDNsqCA55yocxx4Teibkm1cT61CfMZKjIIV30pnrCVxn
 69GcWa2i7/1w1QNurUjHMbId0NopdlH9relhCWedPWlUep+8H4JSqL4Cs3sC6UJ1jxaF nA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37xscy1eg8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Apr 2021 13:51:17 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13FHZ3Sa043635;
 Thu, 15 Apr 2021 13:51:17 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37xscy1efn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Apr 2021 13:51:17 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13FHlQHM024166;
 Thu, 15 Apr 2021 17:51:15 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03ams.nl.ibm.com with ESMTP id 37u3n8c1nv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Apr 2021 17:51:15 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13FHpDsF46334454
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 15 Apr 2021 17:51:13 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 31D81A4053;
 Thu, 15 Apr 2021 17:51:13 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3BA86A4055;
 Thu, 15 Apr 2021 17:51:11 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu, 15 Apr 2021 17:51:11 +0000 (GMT)
Date: Thu, 15 Apr 2021 23:21:10 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Gautham R Shenoy <ego@linux.vnet.ibm.com>
Subject: Re: [PATCH 3/3] powerpc/smp: Cache CPU to chip lookup
Message-ID: <20210415175110.GE2633526@linux.vnet.ibm.com>
References: <20210415120934.232271-1-srikar@linux.vnet.ibm.com>
 <20210415120934.232271-4-srikar@linux.vnet.ibm.com>
 <20210415171921.GB16351@in.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20210415171921.GB16351@in.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: RQYrXLPbyCyR98EZ9_OkInMgp-cMBRfd
X-Proofpoint-GUID: ncVAzCGVssJ1MmY0eQewGlfS0RDA9K22
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-15_09:2021-04-15,
 2021-04-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 spamscore=0 mlxscore=0 mlxlogscore=827 clxscore=1015 impostorscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

* Gautham R Shenoy <ego@linux.vnet.ibm.com> [2021-04-15 22:49:21]:

> > 
> > +int *chip_id_lookup_table;
> > +
> >  #ifdef CONFIG_PPC64
> >  int __initdata iommu_is_off;
> >  int __initdata iommu_force_on;
> > @@ -914,13 +916,22 @@ EXPORT_SYMBOL(of_get_ibm_chip_id);
> >  int cpu_to_chip_id(int cpu)
> >  {
> >  	struct device_node *np;
> > +	int ret = -1, idx;
> > +
> > +	idx = cpu / threads_per_core;
> > +	if (chip_id_lookup_table && chip_id_lookup_table[idx] != -1)
> 

> The value -1 is ambiguous since we won't be able to determine if
> it is because we haven't yet made a of_get_ibm_chip_id() call
> or if of_get_ibm_chip_id() call was made and it returned a -1.
> 

We don't allocate chip_id_lookup_table unless cpu_to_chip_id() return
!-1 value for the boot-cpuid. So this ensures that we dont
unnecessarily allocate chip_id_lookup_table. Also I check for
chip_id_lookup_table before calling cpu_to_chip_id() for other CPUs.
So this avoids overhead of calling cpu_to_chip_id() for platforms that
dont support it.  Also its most likely that if the
chip_id_lookup_table is initialized then of_get_ibm_chip_id() call
would return a valid value.

+ Below we are only populating the lookup table, only when the
of_get_cpu_node is valid.

So I dont see any drawbacks of initializing it to -1. Do you see any?

> Thus, perhaps we can initialize chip_id_lookup_table[idx] with a
> different unique negative value. How about S32_MIN ? and check
> chip_id_lookup_table[idx] is different here ?
> 

I had initially initialized to -2, But then I thought we adding in
more confusion than necessary and it was not solving any issues.


-- 
Thanks and Regards
Srikar Dronamraju
