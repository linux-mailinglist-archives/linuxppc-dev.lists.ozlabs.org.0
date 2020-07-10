Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D57EE21BC7C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jul 2020 19:43:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B3L3m01gzzDqXl
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jul 2020 03:43:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B3L236pxXzDrNJ
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jul 2020 03:41:31 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06AHVaoH178907; Fri, 10 Jul 2020 13:41:25 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com with ESMTP id 326bp0uwdx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Jul 2020 13:41:25 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06AHYqh2032535;
 Fri, 10 Jul 2020 17:41:24 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma04wdc.us.ibm.com with ESMTP id 326bcaxd6d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Jul 2020 17:41:24 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06AHfN9Q20054340
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Jul 2020 17:41:23 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D1BE76E050;
 Fri, 10 Jul 2020 17:41:23 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 988E86E04C;
 Fri, 10 Jul 2020 17:41:23 +0000 (GMT)
Received: from localhost (unknown [9.160.49.198])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 10 Jul 2020 17:41:23 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH] powerpc/numa: Restrict possible nodes based on platform
In-Reply-To: <20200707084203.GC874@linux.vnet.ibm.com>
References: <20200706064002.14848-1-srikar@linux.vnet.ibm.com>
 <87lfjv5352.fsf@mpe.ellerman.id.au> <20200707084203.GC874@linux.vnet.ibm.com>
Date: Fri, 10 Jul 2020 12:41:22 -0500
Message-ID: <871rljfet9.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-10_13:2020-07-10,
 2020-07-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=999
 phishscore=0 suspectscore=0 spamscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007100112
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Bharata B Rao <bharata@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Srikar Dronamraju <srikar@linux.vnet.ibm.com> writes:

> * Michael Ellerman <mpe@ellerman.id.au> [2020-07-07 15:02:17]:
>
>> Srikar Dronamraju <srikar@linux.vnet.ibm.com> writes:
>> > $ lsprop /proc/device-tree/rtas/ibm,*associ*-domains
>> > /proc/device-tree/rtas/ibm,current-associativity-domains
>> > 		 00000005 00000001 00000002 00000002 00000002 00000010
>> > /proc/device-tree/rtas/ibm,max-associativity-domains
>> > 		 00000005 00000001 00000008 00000020 00000020 00000100
>> >
>> > $ cat /sys/devices/system/node/possible ##Before patch
>> > 0-31
>> >
>> > $ cat /sys/devices/system/node/possible ##After patch
>> > 0-1
>> >
>> > Note the maximum nodes this platform can support is only 2 but the
>> > possible nodes is set to 32.
>> 
>> But what about LPM to a system with more nodes?
>> 
>
> I have very less info on LPM, so I checked with Nathan Lynch before posting
> and as per Nathan in the current design of LPM, Linux wouldn't use the new
> node numbers.

(I see a v2 has been posted already but I needed a little time to check
with our hypervisor people on this point.)

It's less of a design and more of a least-bad option in the absence of a
more flexible NUMA architecture in Linux.

For now, the "rule" with LPM and NUMA has to be that Linux uses the NUMA
information from the device tree that it was booted with, and it must
disregard ibm,associativity and similar information after LPM or certain
other platform events. Historically there has been code that tried to
honor changes in NUMA information but it caused much worse problems than
degraded performance. That code has been disabled by default since last
year and is now subject to removal:

https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=182897

Most NUMA-aware code happens to follow that rule because the device tree
associativity information tends to get cached on first access in Linux's
own data structures. It all feels a little fragile to me though,
especially since we can DLPAR add processors and memory after LPM with
"new" associativity properties which don't relate to the logical
topology Linux has already built. However, on currently available hw, as
long as we're using ibm,max-associativity-domains to limit the set of
possible nodes, I believe such resources will always receive valid (but
possibly suboptimal) NUMA assignments. That's because as of this
writing ibm,max-associativity-domains has the same contents on all
currently available PowerVM systems.

Now if we change to using ibm,current-associativity-domains, which we
*can* expect to differ between differently configured systems, post-LPM
DLPAR additions can yield resources with node assignments that
fall outside of the possible range, especially when we've migrated from
a smaller system to a larger one.

Is the current code robust against that possibility? I don't think so:
it looks like of_node_to_nid_single(), of_drconf_to_nid_single() and
possibly more code need to guard against this in order to prevent
NODE_DATA() null dereferences and the like. Probably those functions
should be made to clamp the nid assignment at num_possible_nodes()
instead of MAX_NUMNODES, which strikes me as more correct regardless of
your patch.

