Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B2423B59B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Aug 2020 09:26:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BLRCP1MY9zDqX1
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Aug 2020 17:26:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BLR9Y25dfzDqQv
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Aug 2020 17:25:21 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07473pdk087756; Tue, 4 Aug 2020 03:25:13 -0400
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32pxcgxtv5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Aug 2020 03:25:13 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0747KiTa016220;
 Tue, 4 Aug 2020 07:25:12 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06fra.de.ibm.com with ESMTP id 32mynh9uvp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Aug 2020 07:25:11 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0747P8eC16908788
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 4 Aug 2020 07:25:09 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CB2964203F;
 Tue,  4 Aug 2020 07:25:08 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C76BA42049;
 Tue,  4 Aug 2020 07:25:07 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue,  4 Aug 2020 07:25:07 +0000 (GMT)
Date: Tue, 4 Aug 2020 12:55:07 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [RFC PATCH 1/2] powerpc/numa: Introduce logical numa id
Message-ID: <20200804072507.GI24375@linux.vnet.ibm.com>
References: <20200731111916.243569-1-aneesh.kumar@linux.ibm.com>
 <20200801052059.GA24375@linux.vnet.ibm.com>
 <87h7tl162y.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <87h7tl162y.fsf@linux.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-04_02:2020-08-03,
 2020-08-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 adultscore=0 mlxlogscore=999 spamscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 phishscore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008040048
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com> [2020-08-02 19:51:41]:
> Srikar Dronamraju <srikar@linux.vnet.ibm.com> writes:
> > * Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com> [2020-07-31 16:49:14]:
> >
> >
> > If its just to eliminate node 0, then we have 2 other probably better
> > solutions.
> > 1. Dont mark node 0 as spl (currently still in mm-tree and a result in
> > linux-next)
> > 2. powerpc specific: explicitly clear node 0 during numa bringup.
> >
> 
> 
> I am not sure I consider them better. But yes, those patches are good
> and also resolves the node 0 initialization when the firmware didn't
> indicate the presence of such a node.
> 
> This patch in addition make sure that we get the same topolgy report
> across reboot on a virtualized partitions as longs as the cpu/memory
> ratio per powervm domains remain the same. This should also help to
> avoid confusion after an LPM migration once we start applying topology
> updates. 
> 

What do we mean by cpu/memory ratio. The topology across reboot would have
changed only if PowerVM would have allocated resources differently by
scrambling/unscrambling. We are no more processing topology updates at
runtime. As far as I know, after LPM, the source topology is maintained.

> >> This can  be resolved by mapping the firmware provided group id to a logical Linux
> >> NUMA id. In this patch, we do this only for pseries platforms considering the
> >
> > On PowerVM, as you would know the nid is already a logical or a flattened
> > chip-id and not the actual hardware chip-id.
> 
> Yes. But then they are derived based on PowerVM resources AKA domains.
> Now based on the available resource on a system, we could end up with
> different node numbers with same toplogy across reboots. Making it
> logical at OS level prevent that. 

The above statement kind of gives an impression, that topology changes
across every reboot.  We only end up with different node numbers if and only
if the underlying topology has changed and that case is very rare. Or am I
missing something?

> 
> >> diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
> >> index e437a9ac4956..6c659aada55b 100644
> >> --- a/arch/powerpc/mm/numa.c
> >> +++ b/arch/powerpc/mm/numa.c
> >> @@ -221,25 +221,51 @@ static void initialize_distance_lookup_table(int nid,
> >>  	}
> >>  }
> >> 
> >> +static u32 nid_map[MAX_NUMNODES] = {[0 ... MAX_NUMNODES - 1] =  NUMA_NO_NODE};
> >> +
> >> +int firmware_group_id_to_nid(int firmware_gid)
> >> +{
> >> +	static int last_nid = 0;
> >> +
> >> +	/*
> >> +	 * For PowerNV we don't change the node id. This helps to avoid
> >> +	 * confusion w.r.t the expected node ids. On pseries, node numbers
> >> +	 * are virtualized. Hence do logical node id for pseries.
> >> +	 */
> >> +	if (!firmware_has_feature(FW_FEATURE_LPAR))
> >> +		return firmware_gid;
> >> +
> >> +	if (firmware_gid ==  -1)
> >> +		return NUMA_NO_NODE;
> >> +
> >> +	if (nid_map[firmware_gid] == NUMA_NO_NODE)
> >> +		nid_map[firmware_gid] = last_nid++;
> >
> > How do we ensure 2 simultaneous firmware_group_id_to_nid() calls dont end up
> > at this place in parallel?
> 
> Do we have a code path where we do that? All the node id init should
> happen early and there should not be two cpus doing node init at the
> same time. I might be mistaken. Can you point to the code path where you
> expect this to be called in parallel?
> 

associativity_to_nid gets called the first time a cpu is being made present
from offline. So it need not be in boot path. We may to verify if cpu
hotplug, dlpar, operations are synchronized. For example a memory hotadd and
cpu hotplug are they synchronized? I am not sure if they are synchronized at
this time.

> >
> >> +
> >> +	return nid_map[firmware_gid];
> >> +}
> >> +
> >>  /* Returns nid in the range [0..MAX_NUMNODES-1], or -1 if no useful numa
> >>   * info is found.
> >>   */
> >>  static int associativity_to_nid(const __be32 *associativity)
> >>  {
> >>  	int nid = NUMA_NO_NODE;
> >> +	int firmware_gid = -1;
> >> 
> >>  	if (!numa_enabled)
> >>  		goto out;
> >> 
> >>  	if (of_read_number(associativity, 1) >= min_common_depth)
> >> -		nid = of_read_number(&associativity[min_common_depth], 1);
> >> +		firmware_gid = of_read_number(&associativity[min_common_depth], 1);
> >> 
> >>  	/* POWER4 LPAR uses 0xffff as invalid node */
> >> -	if (nid == 0xffff || nid >= MAX_NUMNODES)
> >> -		nid = NUMA_NO_NODE;
> >> +	if (firmware_gid == 0xffff || firmware_gid >= MAX_NUMNODES)
> >> +		firmware_gid = -1;
> >
> > Lets assume two or more invocations of associativity_to_nid for the same
> > associativity, end up with -1, In each case aren't giving different
> > nids?
> 
> 
> I didn't quiet get the comment here. But I assume you are indicating the
> same one you mentioned above?
> 

No its not related to the above comment.
We are incrementing the nid_map table for every unique firmware_gid or for
every -1 (aka invalid associativities). If there are sufficiently large
number of associativities that end up returning invalid associativities,
then don't we quickly overflow the nid_map table? Not only about the
overflow but a 8 node machine may soon look like a 80 node machine.


-- 
Thanks and Regards
Srikar Dronamraju
