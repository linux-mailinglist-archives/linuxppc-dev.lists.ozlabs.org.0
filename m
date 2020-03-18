Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B70AB189511
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Mar 2020 05:47:49 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48hyFs2T6bzDqsl
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Mar 2020 15:47:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48hyDS3Jb7zDqkc
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Mar 2020 15:46:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 48hyDR5GcZz8tGy
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Mar 2020 15:46:31 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 48hyDR4krtz9sQx; Wed, 18 Mar 2020 15:46:31 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bharata@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 48hyDR14J1z9sQt
 for <linuxppc-dev@ozlabs.org>; Wed, 18 Mar 2020 15:46:30 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02I4YGMO157562
 for <linuxppc-dev@ozlabs.org>; Wed, 18 Mar 2020 00:46:27 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2yu7abhrxm-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Wed, 18 Mar 2020 00:46:27 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <bharata@linux.ibm.com>;
 Wed, 18 Mar 2020 04:46:25 -0000
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 18 Mar 2020 04:46:21 -0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 02I4jKIt46137826
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 Mar 2020 04:45:20 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C3B8242042;
 Wed, 18 Mar 2020 04:46:20 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ABEAD4203F;
 Wed, 18 Mar 2020 04:46:18 +0000 (GMT)
Received: from in.ibm.com (unknown [9.85.80.118])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Wed, 18 Mar 2020 04:46:18 +0000 (GMT)
Date: Wed, 18 Mar 2020 10:16:16 +0530
From: Bharata B Rao <bharata@linux.ibm.com>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: Slub: Increased mem consumption on cpu,mem-less node powerpc guest
References: <20200317092624.GB22538@in.ibm.com>
 <20200317115339.GA26049@in.ibm.com>
 <4088ae3c-4dfa-62ae-f56a-b46773788fc7@suse.cz>
 <20200317162536.GB27520@linux.vnet.ibm.com>
 <080b2d00-76ef-2187-ec78-c9d181ef1701@suse.cz>
 <20200318032044.GC4879@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200318032044.GC4879@linux.vnet.ibm.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-TM-AS-GCONF: 00
x-cbid: 20031804-0012-0000-0000-00000392F130
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20031804-0013-0000-0000-000021CFD252
Message-Id: <20200318044616.GC26049@in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-18_01:2020-03-17,
 2020-03-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 adultscore=0 spamscore=0 impostorscore=0
 malwarescore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2003020000 definitions=main-2003180021
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
Reply-To: bharata@linux.ibm.com
Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@ozlabs.org,
 aneesh.kumar@linux.ibm.com, Michal Hocko <mhocko@kernel.org>,
 Pekka Enberg <penberg@kernel.org>, linux-mm@kvack.org,
 David Rientjes <rientjes@google.com>, Christoph Lameter <cl@linux.com>,
 Joonsoo Kim <iamjoonsoo.kim@lge.com>, Vlastimil Babka <vbabka@suse.cz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Mar 18, 2020 at 08:50:44AM +0530, Srikar Dronamraju wrote:
> * Vlastimil Babka <vbabka@suse.cz> [2020-03-17 17:45:15]:
> 
> > On 3/17/20 5:25 PM, Srikar Dronamraju wrote:
> > > * Vlastimil Babka <vbabka@suse.cz> [2020-03-17 16:56:04]:
> > > 
> > >> 
> > >> I wonder why do you get a memory leak while Sachin in the same situation [1]
> > >> gets a crash? I don't understand anything anymore.
> > > 
> > > Sachin was testing on linux-next which has Kirill's patch which modifies
> > > slub to use kmalloc_node instead of kmalloc. While Bharata is testing on
> > > upstream, which doesn't have this. 
> > 
> > Yes, that Kirill's patch was about the memcg shrinker map allocation. But the
> > patch hunk that Bharata posted as a "hack" that fixes the problem, it follows
> > that there has to be something else that calls kmalloc_node(node) where node is
> > one that doesn't have present pages.
> > 
> > He mentions alloc_fair_sched_group() which has:
> > 
> >         for_each_possible_cpu(i) {
> >                 cfs_rq = kzalloc_node(sizeof(struct cfs_rq),
> >                                       GFP_KERNEL, cpu_to_node(i));
> > ...
> >                 se = kzalloc_node(sizeof(struct sched_entity),
> >                                   GFP_KERNEL, cpu_to_node(i));
> > 
> 
> 
> Sachin's experiment.
> Upstream-next/ memcg /
> possible nodes were 0-31
> online nodes were 0-1
> kmalloc_node called for_each_node / for_each_possible_node.
> This would crash while allocating slab from !N_ONLINE nodes.
> 
> Bharata's experiment.
> Upstream
> possible nodes were 0-1
> online nodes were 0-1
> kmalloc_node called for_each_online_node/ for_each_possible_cpu
> i.e kmalloc is called for N_ONLINE nodes.
> So wouldn't crash
> 
> Even if his possible nodes were 0-256. I don't think we have kmalloc_node
> being called in !N_ONLINE nodes. Hence its not crashing.
> If we see the above code that you quote, kzalloc_node is using cpu_to_node
> which in Bharata's case will always return 1.
> 
> 
> > I assume one of these structs is 1k and other 512 bytes (rounded) and that for
> > some possible cpu's cpu_to_node(i) will be 0, which has no present pages. And as
> > Bharata pasted, node_to_mem_node(0) = 0

Correct, these two kazalloc_node() calls for all possible cpus are
causing increased slab memory consumption in my case.

> > So this looks like the same scenario, but it doesn't crash? Is the node 0
> > actually online here, and/or does it have N_NORMAL_MEMORY state?
> 

Node 0 is online, but N_NORMAL_MEMORY state is empty. In fact memory
leak goes away if I insert the below check/assignment in the slab
alloc code path:

+       if (!node_isset(node, node_states[N_NORMAL_MEMORY]))
+               node = NUMA_NO_NODE;

Regards,
Bharata.

