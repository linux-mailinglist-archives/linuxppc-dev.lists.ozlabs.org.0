Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 423253624C6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 17:58:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FMLVF1qrSz3c4k
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Apr 2021 01:58:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YDufFcyz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ego@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=YDufFcyz; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FMLTn400kz2xxt
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Apr 2021 01:58:20 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13GFYppL116465; Fri, 16 Apr 2021 11:57:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=GYHEJRmpC29F27DcaAFfZmz4t/fg3ExNk/QMNku/Rug=;
 b=YDufFcyzirTUFegq3lKKWD2LhTek07C9DSk9IBH/6SbfDxUhxR7aXJWQqmQ7DJJeJeZL
 BwJC2FAB/3D9l4Yjnoq92zMjdJU9RmficFeM1zUUBpS+9HOzaUK3yj1ueeeyAVKWf3eD
 O+OYwkp+GUIAIEyeMV6gAHMQ9eIrAECSCJs93wedI/wtyDK+OXgm4yeuKdk5sX8Xbkbu
 O1Pjg5Wl/cBkVqFejK/ZC4AkrRaKyN7Zo1gszcTVbHz8b1p0jSyIGtBDZfBHkg2Nj+2E
 YZaB2SDyt8H/zggAxTIFsHMZOS6S5jyr1g/ujb4gU+5v6rD1A25kx991wYgNGE0VjRRp Hg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37y8rp1dch-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Apr 2021 11:57:58 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13GFZYaq119148;
 Fri, 16 Apr 2021 11:57:57 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37y8rp1dbh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Apr 2021 11:57:57 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13GFfHxT005351;
 Fri, 16 Apr 2021 15:57:56 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma03dal.us.ibm.com with ESMTP id 37u3na755x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Apr 2021 15:57:56 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13GFvtp625166132
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 16 Apr 2021 15:57:55 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EA1966E052;
 Fri, 16 Apr 2021 15:57:54 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 89EDE6E04E;
 Fri, 16 Apr 2021 15:57:54 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.199.35.169])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 16 Apr 2021 15:57:54 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id AA0BA2E2E70; Fri, 16 Apr 2021 21:27:48 +0530 (IST)
Date: Fri, 16 Apr 2021 21:27:48 +0530
From: Gautham R Shenoy <ego@linux.vnet.ibm.com>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH 3/3] powerpc/smp: Cache CPU to chip lookup
Message-ID: <20210416155748.GA26496@in.ibm.com>
References: <20210415120934.232271-1-srikar@linux.vnet.ibm.com>
 <20210415120934.232271-4-srikar@linux.vnet.ibm.com>
 <20210415171921.GB16351@in.ibm.com>
 <20210415175110.GE2633526@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210415175110.GE2633526@linux.vnet.ibm.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: xbGi785-J056W-AxHoDADVtiaXqvje3L
X-Proofpoint-ORIG-GUID: xsqEzdErUe5UdBPyTjOhUBbBur7tjjAf
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-16_08:2021-04-16,
 2021-04-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 mlxlogscore=999 bulkscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 mlxscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104160113
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
Reply-To: ego@linux.vnet.ibm.com
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 Gautham R Shenoy <ego@linux.vnet.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Valentin Schneider <valentin.schneider@arm.com>, qemu-ppc@nongnu.org,
 Cedric Le Goater <clg@kaod.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Ingo Molnar <mingo@kernel.org>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Apr 15, 2021 at 11:21:10PM +0530, Srikar Dronamraju wrote:
> * Gautham R Shenoy <ego@linux.vnet.ibm.com> [2021-04-15 22:49:21]:
> 
> > > 
> > > +int *chip_id_lookup_table;
> > > +
> > >  #ifdef CONFIG_PPC64
> > >  int __initdata iommu_is_off;
> > >  int __initdata iommu_force_on;
> > > @@ -914,13 +916,22 @@ EXPORT_SYMBOL(of_get_ibm_chip_id);
> > >  int cpu_to_chip_id(int cpu)
> > >  {
> > >  	struct device_node *np;
> > > +	int ret = -1, idx;
> > > +
> > > +	idx = cpu / threads_per_core;
> > > +	if (chip_id_lookup_table && chip_id_lookup_table[idx] != -1)
> > 
> 
> > The value -1 is ambiguous since we won't be able to determine if
> > it is because we haven't yet made a of_get_ibm_chip_id() call
> > or if of_get_ibm_chip_id() call was made and it returned a -1.
> > 
> 
> We don't allocate chip_id_lookup_table unless cpu_to_chip_id() return
> !-1 value for the boot-cpuid. So this ensures that we dont
> unnecessarily allocate chip_id_lookup_table. Also I check for
> chip_id_lookup_table before calling cpu_to_chip_id() for other CPUs.
> So this avoids overhead of calling cpu_to_chip_id() for platforms that
> dont support it.  Also its most likely that if the
> chip_id_lookup_table is initialized then of_get_ibm_chip_id() call
> would return a valid value.
> 
> + Below we are only populating the lookup table, only when the
> of_get_cpu_node is valid.
> 
> So I dont see any drawbacks of initializing it to -1. Do you see
any?


Only if other callers of cpu_to_chip_id() don't check for whether the
chip_id_lookup_table() has been allocated or not. From a code
readability point of view, it is easier to have that check  this inside
cpu_to_chip_id() instead of requiring all its callers to make that
check.

> 
> > Thus, perhaps we can initialize chip_id_lookup_table[idx] with a
> > different unique negative value. How about S32_MIN ? and check
> > chip_id_lookup_table[idx] is different here ?
> > 
> 
> I had initially initialized to -2, But then I thought we adding in
> more confusion than necessary and it was not solving any issues.
> 
> 
> -- 
> Thanks and Regards
> Srikar Dronamraju
