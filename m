Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C057523D95E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Aug 2020 12:46:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BMlXN5n99zDqHx
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Aug 2020 20:46:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BMlVP6ZjBzDqml
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Aug 2020 20:44:29 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 076AWOQJ021911
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 6 Aug 2020 06:44:26 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32r91bbaxd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Aug 2020 06:44:26 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 076AiCCG015894
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 6 Aug 2020 10:44:25 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma01wdc.us.ibm.com with ESMTP id 32n018gn2s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Aug 2020 10:44:25 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 076AiPWd38338816
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 6 Aug 2020 10:44:25 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 24B93AC059;
 Thu,  6 Aug 2020 10:44:25 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D0DBFAC05B;
 Thu,  6 Aug 2020 10:44:23 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.85.71.228])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu,  6 Aug 2020 10:44:23 +0000 (GMT)
X-Mailer: emacs 27.0.91 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: [RFC PATCH 1/2] powerpc/numa: Introduce logical numa id
In-Reply-To: <20200804072507.GI24375@linux.vnet.ibm.com>
References: <20200731111916.243569-1-aneesh.kumar@linux.ibm.com>
 <20200801052059.GA24375@linux.vnet.ibm.com> <87h7tl162y.fsf@linux.ibm.com>
 <20200804072507.GI24375@linux.vnet.ibm.com>
Date: Thu, 06 Aug 2020 16:14:21 +0530
Message-ID: <87bljoqcje.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-06_06:2020-08-06,
 2020-08-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 impostorscore=0 mlxscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 mlxlogscore=999 spamscore=0 suspectscore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008060071
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Srikar Dronamraju <srikar@linux.vnet.ibm.com> writes:

> * Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com> [2020-08-02 19:51:41]:
>> Srikar Dronamraju <srikar@linux.vnet.ibm.com> writes:
>> > * Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com> [2020-07-31 16:49:14]:
>> >
>> >
>> > If its just to eliminate node 0, then we have 2 other probably better
>> > solutions.
>> > 1. Dont mark node 0 as spl (currently still in mm-tree and a result in
>> > linux-next)
>> > 2. powerpc specific: explicitly clear node 0 during numa bringup.
>> >
>> 
>> 
>> I am not sure I consider them better. But yes, those patches are good
>> and also resolves the node 0 initialization when the firmware didn't
>> indicate the presence of such a node.
>> 
>> This patch in addition make sure that we get the same topolgy report
>> across reboot on a virtualized partitions as longs as the cpu/memory
>> ratio per powervm domains remain the same. This should also help to
>> avoid confusion after an LPM migration once we start applying topology
>> updates. 
>> 
>
> What do we mean by cpu/memory ratio. The topology across reboot would have
> changed only if PowerVM would have allocated resources differently by
> scrambling/unscrambling. We are no more processing topology updates at
> runtime. As far as I know, after LPM, the source topology is maintained.

A LPAR running with one numa node and 10GB of memory on PowerVM domain
10 will report node 10 and 10GB memory in the current scheme. After LPM
migration or a CEC shutdown/reboot if the domain from which the resource
allocated becomes 11, then the LPAR will report node 11 and 10GB memory.

Having a logical node number means in the both the above cases we report
node 0, 10GB memory. 


>
>> >> This can  be resolved by mapping the firmware provided group id to a logical Linux
>> >> NUMA id. In this patch, we do this only for pseries platforms considering the
>> >
>> > On PowerVM, as you would know the nid is already a logical or a flattened
>> > chip-id and not the actual hardware chip-id.
>> 
>> Yes. But then they are derived based on PowerVM resources AKA domains.
>> Now based on the available resource on a system, we could end up with
>> different node numbers with same toplogy across reboots. Making it
>> logical at OS level prevent that. 
>
> The above statement kind of gives an impression, that topology changes
> across every reboot.  We only end up with different node numbers if and only
> if the underlying topology has changed and that case is very rare. Or am I
> missing something?

IIUC it also depends on availability of resources within the
domain at the time of LPAR start.

>
>> 
>> >> diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
>> >> index e437a9ac4956..6c659aada55b 100644
>> >> --- a/arch/powerpc/mm/numa.c
>> >> +++ b/arch/powerpc/mm/numa.c
>> >> @@ -221,25 +221,51 @@ static void initialize_distance_lookup_table(int nid,
>> >>  	}
>> >>  }
>> >> 
>> >> +static u32 nid_map[MAX_NUMNODES] = {[0 ... MAX_NUMNODES - 1] =  NUMA_NO_NODE};
>> >> +
>> >> +int firmware_group_id_to_nid(int firmware_gid)
>> >> +{
>> >> +	static int last_nid = 0;
>> >> +
>> >> +	/*
>> >> +	 * For PowerNV we don't change the node id. This helps to avoid
>> >> +	 * confusion w.r.t the expected node ids. On pseries, node numbers
>> >> +	 * are virtualized. Hence do logical node id for pseries.
>> >> +	 */
>> >> +	if (!firmware_has_feature(FW_FEATURE_LPAR))
>> >> +		return firmware_gid;
>> >> +
>> >> +	if (firmware_gid ==  -1)
>> >> +		return NUMA_NO_NODE;
>> >> +
>> >> +	if (nid_map[firmware_gid] == NUMA_NO_NODE)
>> >> +		nid_map[firmware_gid] = last_nid++;
>> >
>> > How do we ensure 2 simultaneous firmware_group_id_to_nid() calls dont end up
>> > at this place in parallel?
>> 
>> Do we have a code path where we do that? All the node id init should
>> happen early and there should not be two cpus doing node init at the
>> same time. I might be mistaken. Can you point to the code path where you
>> expect this to be called in parallel?
>> 
>
> associativity_to_nid gets called the first time a cpu is being made present
> from offline. So it need not be in boot path. We may to verify if cpu
> hotplug, dlpar, operations are synchronized. For example a memory hotadd and
> cpu hotplug are they synchronized? I am not sure if they are synchronized at
> this time.

But you don't online cpu or memory to a non existent node post boot
right?. If the node is existent we have already initialized the nid_map.

However i am not sure whether we do a parallel initialization of devices. ie,
of_device_add getting called in parallel. if it can then we need the
below?

@@ -226,6 +226,7 @@ static u32 nid_map[MAX_NUMNODES] = {[0 ... MAX_NUMNODES - 1] =  NUMA_NO_NODE};
 int firmware_group_id_to_nid(int firmware_gid)
 {
        static int last_nid = 0;
+       static DEFINE_SPINLOCK(node_id_lock);
 
        /*
         * For PowerNV we don't change the node id. This helps to avoid
@@ -238,8 +239,13 @@ int firmware_group_id_to_nid(int firmware_gid)
        if (firmware_gid ==  -1)
                return NUMA_NO_NODE;
 
-       if (nid_map[firmware_gid] == NUMA_NO_NODE)
-               nid_map[firmware_gid] = last_nid++;
+       if (nid_map[firmware_gid] == NUMA_NO_NODE) {
+               spin_lock(&node_id_lock);
+               /*  recheck with lock held */
+               if (nid_map[firmware_gid] == NUMA_NO_NODE)
+                       nid_map[firmware_gid] = last_nid++;
+               spin_unlock(&node_id_lock);
+       }
 
        return nid_map[firmware_gid];
 }



>
>> >
>> >> +
>> >> +	return nid_map[firmware_gid];
>> >> +}
>> >> +
>> >>  /* Returns nid in the range [0..MAX_NUMNODES-1], or -1 if no useful numa
>> >>   * info is found.
>> >>   */
>> >>  static int associativity_to_nid(const __be32 *associativity)
>> >>  {
>> >>  	int nid = NUMA_NO_NODE;
>> >> +	int firmware_gid = -1;
>> >> 
>> >>  	if (!numa_enabled)
>> >>  		goto out;
>> >> 
>> >>  	if (of_read_number(associativity, 1) >= min_common_depth)
>> >> -		nid = of_read_number(&associativity[min_common_depth], 1);
>> >> +		firmware_gid = of_read_number(&associativity[min_common_depth], 1);
>> >> 
>> >>  	/* POWER4 LPAR uses 0xffff as invalid node */
>> >> -	if (nid == 0xffff || nid >= MAX_NUMNODES)
>> >> -		nid = NUMA_NO_NODE;
>> >> +	if (firmware_gid == 0xffff || firmware_gid >= MAX_NUMNODES)
>> >> +		firmware_gid = -1;
>> >
>> > Lets assume two or more invocations of associativity_to_nid for the same
>> > associativity, end up with -1, In each case aren't giving different
>> > nids?
>> 
>> 
>> I didn't quiet get the comment here. But I assume you are indicating the
>> same one you mentioned above?
>> 
>
> No its not related to the above comment.
> We are incrementing the nid_map table for every unique firmware_gid or for
> every -1 (aka invalid associativities). If there are sufficiently large
> number of associativities that end up returning invalid associativities,
> then don't we quickly overflow the nid_map table? Not only about the
> overflow but a 8 node machine may soon look like a 80 node machine.

Not sure I follow. What does a large number of associativies imply? Are
you looking at ibm,associativity-lookup-arrays that got entries which
are invalid? Even there we are not parsing the full array, we lookup
only a specific firmware_gid (in case of lookup-arrays we use aa_index
value from drmem_lmb).

I will also add a las_nid > MAX_NUMNODES check in
firmware_group_id_to_nid() to handle the case where we find more numa
nodes than MAX_NUMANODES in device tree.

-aneesh
