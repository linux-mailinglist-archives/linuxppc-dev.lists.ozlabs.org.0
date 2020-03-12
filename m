Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C0856182869
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Mar 2020 06:28:46 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48dHRv1h7QzDqMC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Mar 2020 16:28:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48dHQK3Z3FzDqHx
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Mar 2020 16:27:20 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02C5LtBT077878
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Mar 2020 01:27:18 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yqe3et6pb-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Mar 2020 01:27:17 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <srikar@linux.vnet.ibm.com>;
 Thu, 12 Mar 2020 05:27:15 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 12 Mar 2020 05:27:11 -0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02C5RASI58917104
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 12 Mar 2020 05:27:10 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 90E2B42049;
 Thu, 12 Mar 2020 05:27:10 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 880EE4203F;
 Thu, 12 Mar 2020 05:27:08 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu, 12 Mar 2020 05:27:08 +0000 (GMT)
Date: Thu, 12 Mar 2020 10:57:07 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michal Hocko <mhocko@kernel.org>
Subject: Re: [PATCH 1/3] powerpc/numa: Set numa_node for all possible cpus
References: <20200311110237.5731-1-srikar@linux.vnet.ibm.com>
 <20200311110237.5731-2-srikar@linux.vnet.ibm.com>
 <20200311115735.GM23944@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20200311115735.GM23944@dhcp22.suse.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
x-cbid: 20031205-4275-0000-0000-000003AAF1EF
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20031205-4276-0000-0000-000038C00F90
Message-Id: <20200312052707.GA3277@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-11_15:2020-03-11,
 2020-03-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 mlxscore=0 mlxlogscore=999
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003120027
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
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, Mel Gorman <mgorman@suse.de>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Christopher Lameter <cl@linux.com>, Vlastimil Babka <vbabka@suse.cz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Michal Hocko <mhocko@kernel.org> [2020-03-11 12:57:35]:

> On Wed 11-03-20 16:32:35, Srikar Dronamraju wrote:
> > A Powerpc system with multiple possible nodes and with CONFIG_NUMA
> > enabled always used to have a node 0, even if node 0 does not any cpus
> > or memory attached to it. As per PAPR, node affinity of a cpu is only
> > available once its present / online. For all cpus that are possible but
> > not present, cpu_to_node() would point to node 0.
> > 
> > To ensure a cpuless, memoryless dummy node is not online, powerpc need
> > to make sure all possible but not present cpu_to_node are set to a
> > proper node.
> 
> Just curious, is this somehow related to
> http://lkml.kernel.org/r/20200227182650.GG3771@dhcp22.suse.cz?
> 

The issue I am trying to fix is a known issue in Powerpc since many years.
So this surely not a problem after a75056fc1e7c (mm/memcontrol.c: allocate
shrinker_map on appropriate NUMA node"). 

I tried v5.6-rc4 + a75056fc1e7c but didnt face any issues booting the
kernel. Will work with Sachin/Abdul (reporters of the issue).


> > Cc: linuxppc-dev@lists.ozlabs.org
> > Cc: linux-mm@kvack.org
> > Cc: linux-kernel@vger.kernel.org
> > Cc: Michal Hocko <mhocko@suse.com>
> > Cc: Mel Gorman <mgorman@suse.de>
> > Cc: Vlastimil Babka <vbabka@suse.cz>
> > Cc: "Kirill A. Shutemov" <kirill@shutemov.name>
> > Cc: Christopher Lameter <cl@linux.com>
> > Cc: Michael Ellerman <mpe@ellerman.id.au>
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > Cc: Linus Torvalds <torvalds@linux-foundation.org>
> > Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
> > ---
> >  arch/powerpc/mm/numa.c | 16 ++++++++++++++--
> >  1 file changed, 14 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
> > index 8a399db..54dcd49 100644
> > --- a/arch/powerpc/mm/numa.c
> > +++ b/arch/powerpc/mm/numa.c
> > @@ -931,8 +931,20 @@ void __init mem_topology_setup(void)
> >  
> >  	reset_numa_cpu_lookup_table();
> >  
> > -	for_each_present_cpu(cpu)
> > -		numa_setup_cpu(cpu);
> > +	for_each_possible_cpu(cpu) {
> > +		/*
> > +		 * Powerpc with CONFIG_NUMA always used to have a node 0,
> > +		 * even if it was memoryless or cpuless. For all cpus that
> > +		 * are possible but not present, cpu_to_node() would point
> > +		 * to node 0. To remove a cpuless, memoryless dummy node,
> > +		 * powerpc need to make sure all possible but not present
> > +		 * cpu_to_node are set to a proper node.
> > +		 */
> > +		if (cpu_present(cpu))
> > +			numa_setup_cpu(cpu);
> > +		else
> > +			set_cpu_numa_node(cpu, first_online_node);
> > +	}
> >  }
> >  
> >  void __init initmem_init(void)
> > -- 
> > 1.8.3.1
> 
> -- 
> Michal Hocko
> SUSE Labs

-- 
Thanks and Regards
Srikar Dronamraju

