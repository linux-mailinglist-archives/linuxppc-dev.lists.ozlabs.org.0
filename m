Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C2A3525A6
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Apr 2021 05:19:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FBQJ51bCBz3c01
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Apr 2021 14:19:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NuZx5P5O;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=NuZx5P5O; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FBQHd1jBwz3brp
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Apr 2021 14:18:36 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 132347H5080796; Thu, 1 Apr 2021 23:18:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=E/PXh5OadEo5XQf65TlNXCU+hnuX16/QVhiBqm4Z2FQ=;
 b=NuZx5P5O7FJvVNoZJC8ongFC2a9XwU/5PWly+3HydHendHkF4essJrpLoTqoIO+GW4vx
 0qjo6RMBqbHFxXQ5eQbWvPc55p9gJF5ZB4YkwSXRQR+UGlyYtX26Op9MbZWuxY58Sk+M
 YGI7izTHt3IT3KdobHJG/HTs1GKZPoG8/OONqXOj12DgPcGZcmDEZ1sjdom7BVfvCsJ5
 gg7vg7WY9NdzF8gbdu9lYaJtpSypiIi6zJ3I8hd0Zy6BGMdHpyPo18ybUs3LMB2JxT8a
 SqdvEPMIpLJH0kDXmvME7HB54J4xQsj2EdQwrpjcRsmxXgS8X/VjSPymdRI2yfecfMVi 2w== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37n8r0vwbh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Apr 2021 23:18:23 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13238vkr000500;
 Fri, 2 Apr 2021 03:18:21 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma05fra.de.ibm.com with ESMTP id 37n28w8h4c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 02 Apr 2021 03:18:21 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1323IIXr42991880
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 2 Apr 2021 03:18:18 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3BBFC4204B;
 Fri,  2 Apr 2021 03:18:18 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6197042047;
 Fri,  2 Apr 2021 03:18:16 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri,  2 Apr 2021 03:18:16 +0000 (GMT)
Date: Fri, 2 Apr 2021 08:48:15 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Nathan Lynch <nathanl@linux.ibm.com>
Subject: Re: [PATCH 1/1] powerpc/smp: Set numa node before updating mask
Message-ID: <20210402031815.GI2339179@linux.vnet.ibm.com>
References: <20210401154200.150077-1-srikar@linux.vnet.ibm.com>
 <87czvdbova.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <87czvdbova.fsf@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: z4gpYR1P-0qpQTe2n7Yg1umno961i3xB
X-Proofpoint-GUID: z4gpYR1P-0qpQTe2n7Yg1umno961i3xB
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-04-01_14:2021-04-01,
 2021-04-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 mlxlogscore=999 clxscore=1015 lowpriorityscore=0 mlxscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2103310000 definitions=main-2104020022
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
Cc: Gautham R Shenoy <ego@linux.vnet.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>, Scott Cheloha <cheloha@linux.ibm.com>,
 Geetika Moolchandani <Geetika.Moolchandani1@ibm.com>,
 Valentin Schneider <valentin.schneider@arm.com>,
 Laurent Dufour <ldufour@linux.vnet.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Nathan Lynch <nathanl@linux.ibm.com> [2021-04-01 17:51:05]:

Thanks Nathan for reviewing.

> > -	set_numa_node(numa_cpu_lookup_table[cpu]);
> > -	set_numa_mem(local_memory_node(numa_cpu_lookup_table[cpu]));
> > -
> 
> Regardless of your change: at boot time, this set of calls to
> set_numa_node() and set_numa_mem() is redundant, right? Because
> smp_prepare_cpus() has:
> 
> 	for_each_possible_cpu(cpu) {
> 		...
> 		if (cpu_present(cpu)) {
> 			set_cpu_numa_node(cpu, numa_cpu_lookup_table[cpu]);
> 			set_cpu_numa_mem(cpu,
> 				local_memory_node(numa_cpu_lookup_table[cpu]));
> 		}
> 
> I would rather that, when onlining a CPU that happens to have been
> dynamically added after boot, we enter start_secondary() with conditions
> equivalent to those at boot time. Or as close to that as is practical.
> 
> So I'd suggest that pseries_add_processor() be made to update
> these things when the CPUs are marked present, before onlining them.

In pseries_add_processor, we are only marking the cpu as present. i.e
I believe numa_setup_cpu() would not have been called. So we may not have a
way to associate the CPU to the node. Otherwise we will have to call
numa_setup_cpu() or the hcall_vphn.

We could try calling numa_setup_cpu() immediately after we set the
CPU to be present, but that would be one more extra hcall + I dont know if
there are any more steps needed before CPU being made present and
associating the CPU to the node. Are we sure the node is already online? For
the numa_mem, we are better of if the zonelists for the node are built.

or the other solution would be to call this in map_cpu_to_node().
Here also we have to be sure the zonelists for the node are already built.

-- 
Thanks and Regards
Srikar Dronamraju
