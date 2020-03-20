Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 730FC18CB43
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 11:12:15 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48kKMJ3ThNzDrf6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 21:12:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48kKK92HYqzDsNc
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 21:10:20 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02KA5Nl1008033
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 06:10:17 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yu934142s-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 06:10:17 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <srikar@linux.vnet.ibm.com>;
 Fri, 20 Mar 2020 10:10:15 -0000
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 20 Mar 2020 10:10:11 -0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 02KAA99t22806954
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 Mar 2020 10:10:09 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B46EAA404D;
 Fri, 20 Mar 2020 10:10:09 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4F663A4053;
 Fri, 20 Mar 2020 10:10:07 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri, 20 Mar 2020 10:10:07 +0000 (GMT)
Date: Fri, 20 Mar 2020 15:40:06 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [RFC 1/2] mm, slub: prevent kmalloc_node crashes and memory leaks
References: <20200318160610.GD26049@in.ibm.com>
 <e060ad43-ff4e-0e59-2e64-ce8a4916ec70@suse.cz>
 <0F67B5AA-96DF-4977-BDC6-D72959B3F7EF@linux.vnet.ibm.com>
 <b9b95895-ca6b-5ad2-1f67-45fee93d1e67@suse.cz>
 <658E6AB8-581F-4722-BCBB-4BDD2245D265@linux.vnet.ibm.com>
 <339cf655-393e-c48e-4797-86f61df56c35@suse.cz>
 <20200319140549.GF4879@linux.vnet.ibm.com>
 <717aa572-73a9-65c0-4d6c-30f15d9d909a@suse.cz>
 <20200320074638.GG4879@linux.vnet.ibm.com>
 <90075919-dd9b-e38a-47a8-aea8520b3b94@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <90075919-dd9b-e38a-47a8-aea8520b3b94@suse.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
x-cbid: 20032010-0016-0000-0000-000002F468B5
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20032010-0017-0000-0000-00003357F6F0
Message-Id: <20200320100950.GA12944@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-20_02:2020-03-20,
 2020-03-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 spamscore=0 bulkscore=0 phishscore=0 mlxlogscore=999
 mlxscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003200044
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
Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>,
 Nathan Lynch <nathanl@linux.ibm.com>, Mel Gorman <mgorman@techsingularity.net>,
 Michal Hocko <mhocko@kernel.org>, Pekka Enberg <penberg@kernel.org>,
 linux-mm@kvack.org, Kirill Tkhai <ktkhai@virtuozzo.com>,
 David Rientjes <rientjes@google.com>, Christopher Lameter <cl@linux.com>,
 bharata@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 Joonsoo Kim <iamjoonsoo.kim@lge.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Vlastimil Babka <vbabka@suse.cz> [2020-03-20 09:43:11]:

> On 3/20/20 8:46 AM, Srikar Dronamraju wrote:
> > * Vlastimil Babka <vbabka@suse.cz> [2020-03-19 15:10:19]:
> > 
> >> On 3/19/20 3:05 PM, Srikar Dronamraju wrote:
> >> > * Vlastimil Babka <vbabka@suse.cz> [2020-03-19 14:47:58]:
> >> > 
> >> 
> >> No, but AFAICS, such node values are already handled in ___slab_alloc, and
> >> cannot reach get_partial(). If you see something I missed, please do tell.
> >> 
> > 
> > Ah I probably got confused with your previous version where
> > alloc_slab_page() was modified. I see no problems with this version.
> 
> Thanks!
> 
> > Sorry for the noise.
> 
> No problem.
> 
> > A question just for my better understanding,
> > How worse would it be to set node to numa_mem_id() instead of NUMA_NODE_ID
> > when the current node is !N_NORMAL_MEMORY?
> 

Yes,

> (I'm assuming you mean s/NUMA_NODE_ID/NUMA_NO_NODE/)
> 
> Well, numa_mem_id() should work too, but it would make the allocation
> constrained to the node of current cpu, with all the consequences (deactivating
> percpu slab if it was from a different node etc).
> 
> There's no reason why this cpu's node should be the closest node to the one that
> was originally requested (but has no memory), so it's IMO pointless or even
> suboptimal to constraint to it. This can be revisited in case we get guaranteed
> existence of node data with zonelists for all possible nodes, but for now
> NUMA_NO_NODE seems the most reasonable fix to me.
> 

Okay.


-- 
Thanks and Regards
Srikar Dronamraju

