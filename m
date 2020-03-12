Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8781118316F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Mar 2020 14:31:38 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48dV911PP6zDqW6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Mar 2020 00:31:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48dV4C5b2bzDqLx
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Mar 2020 00:27:22 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02CDKERR096521
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Mar 2020 09:27:20 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2yqkjxx841-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Mar 2020 09:27:18 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <srikar@linux.vnet.ibm.com>;
 Thu, 12 Mar 2020 13:14:45 -0000
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 12 Mar 2020 13:14:42 -0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 02CDDfmt45351394
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 12 Mar 2020 13:13:41 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 24C14A405B;
 Thu, 12 Mar 2020 13:14:41 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1ACD4A4054;
 Thu, 12 Mar 2020 13:14:39 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu, 12 Mar 2020 13:14:38 +0000 (GMT)
Date: Thu, 12 Mar 2020 18:44:38 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [PATCH 1/3] powerpc/numa: Set numa_node for all possible cpus
References: <20200311110237.5731-1-srikar@linux.vnet.ibm.com>
 <20200311110237.5731-2-srikar@linux.vnet.ibm.com>
 <20200311115735.GM23944@dhcp22.suse.cz>
 <20200312052707.GA3277@linux.vnet.ibm.com>
 <C5560C71-483A-41FB-BDE9-526F1E0CFA36@linux.vnet.ibm.com>
 <5e5c736a-a88c-7c76-fc3d-7bc765e8dcba@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <5e5c736a-a88c-7c76-fc3d-7bc765e8dcba@suse.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
x-cbid: 20031213-4275-0000-0000-000003AB2976
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20031213-4276-0000-0000-000038C0483A
Message-Id: <20200312131438.GB3277@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-12_05:2020-03-11,
 2020-03-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 priorityscore=1501 malwarescore=0 mlxscore=0 bulkscore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 suspectscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2001150001 definitions=main-2003120072
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
Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 LKML <linux-kernel@vger.kernel.org>, Michal Hocko <mhocko@kernel.org>,
 linux-mm@kvack.org, Mel Gorman <mgorman@suse.de>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Christopher Lameter <cl@linux.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Vlastimil Babka <vbabka@suse.cz> [2020-03-12 10:30:50]:

> On 3/12/20 9:23 AM, Sachin Sant wrote:
> >> On 12-Mar-2020, at 10:57 AM, Srikar Dronamraju <srikar@linux.vnet.ibm.com> wrote:
> >> * Michal Hocko <mhocko@kernel.org> [2020-03-11 12:57:35]:
> >>> On Wed 11-03-20 16:32:35, Srikar Dronamraju wrote:
> >>>> To ensure a cpuless, memoryless dummy node is not online, powerpc need
> >>>> to make sure all possible but not present cpu_to_node are set to a
> >>>> proper node.
> >>> 
> >>> Just curious, is this somehow related to
> >>> http://lkml.kernel.org/r/20200227182650.GG3771@dhcp22.suse.cz?
> >>> 
> >> 
> >> The issue I am trying to fix is a known issue in Powerpc since many years.
> >> So this surely not a problem after a75056fc1e7c (mm/memcontrol.c: allocate
> >> shrinker_map on appropriate NUMA node"). 
> >> 
> >> I tried v5.6-rc4 + a75056fc1e7c but didnt face any issues booting the
> >> kernel. Will work with Sachin/Abdul (reporters of the issue).

I had used v1 and not v2. So my mistake.

> > I applied this 3 patch series on top of March 11 next tree (commit d44a64766795 )
> > The kernel still fails to boot with same call trace.
> 

While I am not an expert in the slub area, I looked at the patch
a75056fc1e7c and had some thoughts on why this could be causing this issue.

On the system where the crash happens, the possible number of nodes is much
greater than the number of onlined nodes. The pdgat or the NODE_DATA is only
available for onlined nodes.

With a75056fc1e7c memcg_alloc_shrinker_maps, we end up calling kzalloc_node
for all possible nodes and in ___slab_alloc we end up looking at the
node_present_pages which is NODE_DATA(nid)->node_present_pages.
i.e for a node whose pdgat struct is not allocated, we are trying to
dereference.

Also for a memoryless/cpuless node or possible but not present nodes,
node_to_mem_node(node) will still end up as node (atleast on powerpc).

I tried with this hunk below and it works.

But I am not sure if we need to check at other places were
node_present_pages is being called.

diff --git a/mm/slub.c b/mm/slub.c
index 626cbcbd977f..bddb93bed55e 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -2571,9 +2571,13 @@ static void *___slab_alloc(struct kmem_cache *s, gfp_t gfpflags, int node,
 	if (unlikely(!node_match(page, node))) {
 		int searchnode = node;
 
-		if (node != NUMA_NO_NODE && !node_present_pages(node))
-			searchnode = node_to_mem_node(node);
-
+		if (node != NUMA_NO_NODE) {
+			if (!node_online(node) || !node_present_pages(node)) {
+				searchnode = node_to_mem_node(node);
+				if (!node_online(searchnode))
+					searchnode = first_online_node;
+			}
+		}
 		if (unlikely(!node_match(page, searchnode))) {
 			stat(s, ALLOC_NODE_MISMATCH);
 			deactivate_slab(s, page, c->freelist, c);

> > 
> 

-- 
Thanks and Regards
Srikar Dronamraju

