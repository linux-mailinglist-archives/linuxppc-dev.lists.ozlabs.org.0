Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08925356BFC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Apr 2021 14:19:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FFk3v6b1fz30Qk
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Apr 2021 22:19:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=j4Q0oUrC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=j4Q0oUrC; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FFk3S1yZMz2yjD
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Apr 2021 22:19:31 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 137C4B7d130575; Wed, 7 Apr 2021 08:19:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=2qRL45oQF8jzGGKQwVIBfrfaoHbaXaO+SGLuDv7puQM=;
 b=j4Q0oUrCDCLnym2y6PyTZ2hhgu0CX8czQP/fyBAsHNCCAeaeUTlAV86/irPY3ppjzW4F
 MglDbdTXFjpleACbGjBDYeQ5yBheJrBpzvGHMI83w3303oPWJpesHKqk4RgOO61Iuslt
 XT8LYEKqHGLbGdiWy3OroYaN5O5dPiQQb5C7gGMukgW5Jj5RWrEZRq+UwynT9pOPiuCw
 J5NyLl/DUI7Qk/NUQ28XS3bRYh5IkbI0SnNtJqJoUSc1M/5T6088hMLggmmpat46SoMt
 qvHeqAEMpfQharZTu9s1FeKgnUyECgzECvw/4yCNB7twcKIQn02IFDDDA2FRM+5N51Np mA== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37rvm08ewr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Apr 2021 08:19:13 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 137CH9pM032368;
 Wed, 7 Apr 2021 12:19:12 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma01dal.us.ibm.com with ESMTP id 37rvs16hp0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Apr 2021 12:19:12 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 137CJAa424445188
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 7 Apr 2021 12:19:11 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DF818C6055;
 Wed,  7 Apr 2021 12:19:10 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B9796C6057;
 Wed,  7 Apr 2021 12:19:10 +0000 (GMT)
Received: from localhost (unknown [9.211.35.170])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  7 Apr 2021 12:19:10 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH 1/1] powerpc/smp: Set numa node before updating mask
In-Reply-To: <20210402031815.GI2339179@linux.vnet.ibm.com>
References: <20210401154200.150077-1-srikar@linux.vnet.ibm.com>
 <87czvdbova.fsf@linux.ibm.com>
 <20210402031815.GI2339179@linux.vnet.ibm.com>
Date: Wed, 07 Apr 2021 07:19:10 -0500
Message-ID: <87eefml22p.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 1xSxdIUQgeDeSq_Z5gQu80OAQbGQCLpJ
X-Proofpoint-ORIG-GUID: 1xSxdIUQgeDeSq_Z5gQu80OAQbGQCLpJ
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-04-07_07:2021-04-07,
 2021-04-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 mlxscore=0
 mlxlogscore=999 adultscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104070084
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

Sorry for the delay in following up here.

Srikar Dronamraju <srikar@linux.vnet.ibm.com> writes:
>> > -	set_numa_node(numa_cpu_lookup_table[cpu]);
>> > -	set_numa_mem(local_memory_node(numa_cpu_lookup_table[cpu]));
>> > -
>> 
>> Regardless of your change: at boot time, this set of calls to
>> set_numa_node() and set_numa_mem() is redundant, right? Because
>> smp_prepare_cpus() has:
>> 
>> 	for_each_possible_cpu(cpu) {
>> 		...
>> 		if (cpu_present(cpu)) {
>> 			set_cpu_numa_node(cpu, numa_cpu_lookup_table[cpu]);
>> 			set_cpu_numa_mem(cpu,
>> 				local_memory_node(numa_cpu_lookup_table[cpu]));
>> 		}
>> 
>> I would rather that, when onlining a CPU that happens to have been
>> dynamically added after boot, we enter start_secondary() with conditions
>> equivalent to those at boot time. Or as close to that as is practical.
>> 
>> So I'd suggest that pseries_add_processor() be made to update
>> these things when the CPUs are marked present, before onlining them.
>
> In pseries_add_processor, we are only marking the cpu as present. i.e
> I believe numa_setup_cpu() would not have been called. So we may not have a
> way to associate the CPU to the node. Otherwise we will have to call
> numa_setup_cpu() or the hcall_vphn.
>
> We could try calling numa_setup_cpu() immediately after we set the
> CPU to be present, but that would be one more extra hcall + I dont know if
> there are any more steps needed before CPU being made present and
> associating the CPU to the node.

An additional hcall in this path doesn't seem too expensive.

> Are we sure the node is already online?

I see that dlpar_online_cpu() calls find_and_online_cpu_nid(), so yes I
think that's covered.

> For the numa_mem, we are better of if the zonelists for the node are
> built.
>
> or the other solution would be to call this in map_cpu_to_node().
> Here also we have to be sure the zonelists for the node are already
> built.
