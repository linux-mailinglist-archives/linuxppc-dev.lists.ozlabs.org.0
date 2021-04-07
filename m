Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 31EBE357522
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Apr 2021 21:47:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FFvzs0zKFz3bvl
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Apr 2021 05:47:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gbczI6VS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=gbczI6VS; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FFvzN1KBWz2y86
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Apr 2021 05:46:39 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 137JXuSD131647; Wed, 7 Apr 2021 15:46:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=MJZhsBBlZ3BvLB7g+Y23Zn0S0lRjIyWliOFeD2Gq+wU=;
 b=gbczI6VSM1Q7Oelvuqhxp3/K0iyo/HgkRYgi6ZJWX9MmpXuHrS0Axh9nGy2CSVXtdpOh
 3zLeTkZNxT5VA1XAQAJ1/o6di4BA+aYIw32XSmBtUyVv/5fSFpitc6DkDI1bi3j2rOeM
 HEK6wwmcLIvwayNCk3peWd5AajOc8DXoF9D5UBcoG45HL071MKzx0DSOJ0i2goKgI4oo
 J4AUxXsEw/DwO1tF4o+lRzcmVzvcgAX7+F0LYEPlFF238uAL/S07q6qB1nAlnqsi96Qo
 NE6jdfs+pg9pDeSondfsWBOuJ6pnnDxU1pQ6GrB00JACyzjVM/iM8J1rsGgAm1V84vMH sg== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37rvm0mu4h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Apr 2021 15:46:27 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 137JhDwJ006426;
 Wed, 7 Apr 2021 19:46:26 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma01dal.us.ibm.com with ESMTP id 37rvs19me0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Apr 2021 19:46:26 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 137JkPIj26083676
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 7 Apr 2021 19:46:25 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EA63BC6059;
 Wed,  7 Apr 2021 19:46:24 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BB7DEC6055;
 Wed,  7 Apr 2021 19:46:24 +0000 (GMT)
Received: from localhost (unknown [9.211.35.170])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  7 Apr 2021 19:46:24 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH 1/1] powerpc/smp: Set numa node before updating mask
In-Reply-To: <20210407164930.GJ2339179@linux.vnet.ibm.com>
References: <20210401154200.150077-1-srikar@linux.vnet.ibm.com>
 <87czvdbova.fsf@linux.ibm.com>
 <20210402031815.GI2339179@linux.vnet.ibm.com>
 <87eefml22p.fsf@linux.ibm.com>
 <20210407164930.GJ2339179@linux.vnet.ibm.com>
Date: Wed, 07 Apr 2021 14:46:24 -0500
Message-ID: <878s5tlvxr.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: FaVdqmU-PxeOtxV901HHeaY1fjOYgcFn
X-Proofpoint-ORIG-GUID: FaVdqmU-PxeOtxV901HHeaY1fjOYgcFn
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-07_10:2021-04-07,
 2021-04-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 mlxscore=0
 mlxlogscore=999 adultscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104070135
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
Cc: Gautham R Shenoy <ego@linux.vnet.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>, Scott Cheloha <cheloha@linux.ibm.com>,
 Geetika Moolchandani <Geetika.Moolchandani1@ibm.com>,
 Valentin Schneider <valentin.schneider@arm.com>,
 Laurent Dufour <ldufour@linux.vnet.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Srikar Dronamraju <srikar@linux.vnet.ibm.com> writes:

> * Nathan Lynch <nathanl@linux.ibm.com> [2021-04-07 07:19:10]:
>
>> Sorry for the delay in following up here.
>> 
>
> No issues.
>
>> >> So I'd suggest that pseries_add_processor() be made to update
>> >> these things when the CPUs are marked present, before onlining them.
>> >
>> > In pseries_add_processor, we are only marking the cpu as present. i.e
>> > I believe numa_setup_cpu() would not have been called. So we may not have a
>> > way to associate the CPU to the node. Otherwise we will have to call
>> > numa_setup_cpu() or the hcall_vphn.
>> >
>> > We could try calling numa_setup_cpu() immediately after we set the
>> > CPU to be present, but that would be one more extra hcall + I dont know if
>> > there are any more steps needed before CPU being made present and
>> > associating the CPU to the node.
>> 
>> An additional hcall in this path doesn't seem too expensive.
>> 
>> > Are we sure the node is already online?
>> 
>> I see that dlpar_online_cpu() calls find_and_online_cpu_nid(), so yes I
>> think that's covered.
>
> Okay, 
>
> Can we just call set_cpu_numa_node() at the end of map_cpu_to_node().
> The advantage would be the update to numa_cpu_lookup_table and cpu_to_node
> would happen at the same time and would be in sync.

I don't know. I guess this question just makes me wonder whether powerpc
needs to have the additional lookup table. How is it different from the
generic per_cpu numa_node?
