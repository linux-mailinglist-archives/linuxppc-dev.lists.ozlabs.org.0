Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE4218C925
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 09:46:53 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48kHSp1d0RzDrKd
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 19:46:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bharata@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48kHQj3Q1czDrFn
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 19:45:01 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02K8XiM9145962
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 04:44:59 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yu7dbrpre-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 04:44:58 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bharata@linux.ibm.com>;
 Fri, 20 Mar 2020 08:44:57 -0000
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 20 Mar 2020 08:44:53 -0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02K8ipRF51904590
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 Mar 2020 08:44:51 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D3807A4040;
 Fri, 20 Mar 2020 08:44:51 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5FC9CA4053;
 Fri, 20 Mar 2020 08:44:49 +0000 (GMT)
Received: from in.ibm.com (unknown [9.85.95.122])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Fri, 20 Mar 2020 08:44:49 +0000 (GMT)
Date: Fri, 20 Mar 2020 14:14:47 +0530
From: Bharata B Rao <bharata@linux.ibm.com>
To: Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [RFC 1/2] mm, slub: prevent kmalloc_node crashes and memory leaks
References: <20200318144220.18083-1-vbabka@suse.cz>
 <20200318160610.GD26049@in.ibm.com>
 <e060ad43-ff4e-0e59-2e64-ce8a4916ec70@suse.cz>
 <0F67B5AA-96DF-4977-BDC6-D72959B3F7EF@linux.vnet.ibm.com>
 <b9b95895-ca6b-5ad2-1f67-45fee93d1e67@suse.cz>
 <658E6AB8-581F-4722-BCBB-4BDD2245D265@linux.vnet.ibm.com>
 <339cf655-393e-c48e-4797-86f61df56c35@suse.cz>
 <20200320034241.GE26049@in.ibm.com>
 <bc0a11e9-65b1-9862-9be9-9c73b84e9b23@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bc0a11e9-65b1-9862-9be9-9c73b84e9b23@suse.cz>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-TM-AS-GCONF: 00
x-cbid: 20032008-0016-0000-0000-000002F45BE7
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20032008-0017-0000-0000-00003357E9B7
Message-Id: <20200320084447.GF26049@in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-20_01:2020-03-19,
 2020-03-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 mlxscore=0 suspectscore=0 clxscore=1011 priorityscore=1501 impostorscore=0
 adultscore=0 spamscore=0 phishscore=0 mlxlogscore=999 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2003200035
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
 Nathan Lynch <nathanl@linux.ibm.com>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>, puvichakravarthy@in.ibm.com,
 Mel Gorman <mgorman@techsingularity.net>, Michal Hocko <mhocko@kernel.org>,
 Pekka Enberg <penberg@kernel.org>, linux-mm@kvack.org,
 Kirill Tkhai <ktkhai@virtuozzo.com>, David Rientjes <rientjes@google.com>,
 Christopher Lameter <cl@linux.com>, linuxppc-dev@lists.ozlabs.org,
 Joonsoo Kim <iamjoonsoo.kim@lge.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Mar 20, 2020 at 09:37:18AM +0100, Vlastimil Babka wrote:
> On 3/20/20 4:42 AM, Bharata B Rao wrote:
> > On Thu, Mar 19, 2020 at 02:47:58PM +0100, Vlastimil Babka wrote:
> >> diff --git a/mm/slub.c b/mm/slub.c
> >> index 17dc00e33115..7113b1f9cd77 100644
> >> --- a/mm/slub.c
> >> +++ b/mm/slub.c
> >> @@ -1973,8 +1973,6 @@ static void *get_partial(struct kmem_cache *s, gfp_t flags, int node,
> >>  
> >>  	if (node == NUMA_NO_NODE)
> >>  		searchnode = numa_mem_id();
> >> -	else if (!node_present_pages(node))
> >> -		searchnode = node_to_mem_node(node);
> >>  
> >>  	object = get_partial_node(s, get_node(s, searchnode), c, flags);
> >>  	if (object || node != NUMA_NO_NODE)
> >> @@ -2563,17 +2561,27 @@ static void *___slab_alloc(struct kmem_cache *s, gfp_t gfpflags, int node,
> >>  	struct page *page;
> >>  
> >>  	page = c->page;
> >> -	if (!page)
> >> +	if (!page) {
> >> +		/*
> >> +		 * if the node is not online or has no normal memory, just
> >> +		 * ignore the node constraint
> >> +		 */
> >> +		if (unlikely(node != NUMA_NO_NODE &&
> >> +			     !node_state(node, N_NORMAL_MEMORY)))
> >> +			node = NUMA_NO_NODE;
> >>  		goto new_slab;
> >> +	}
> >>  redo:
> >>  
> >>  	if (unlikely(!node_match(page, node))) {
> >> -		int searchnode = node;
> >> -
> >> -		if (node != NUMA_NO_NODE && !node_present_pages(node))
> >> -			searchnode = node_to_mem_node(node);
> >> -
> >> -		if (unlikely(!node_match(page, searchnode))) {
> >> +		/*
> >> +		 * same as above but node_match() being false already
> >> +		 * implies node != NUMA_NO_NODE
> >> +		 */
> >> +		if (!node_state(node, N_NORMAL_MEMORY)) {
> >> +			node = NUMA_NO_NODE;
> >> +			goto redo;
> >> +		} else {
> >>  			stat(s, ALLOC_NODE_MISMATCH);
> >>  			deactivate_slab(s, page, c->freelist, c);
> >>  			goto new_slab;
> > 
> > This fixes the problem I reported at
> > https://lore.kernel.org/linux-mm/20200317092624.GB22538@in.ibm.com/
> 
> Thanks, I hope it means I can make it Reported-and-tested-by: you

It was reeported first by PUVICHAKRAVARTHY RAMACHANDRAN <puvichakravarthy@in.ibm.com>
You can add my tested-by.

Regards,
Bharata.

