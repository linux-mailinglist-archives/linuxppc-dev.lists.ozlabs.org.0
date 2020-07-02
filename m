Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 58FE221268D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jul 2020 16:44:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49yLTl3BDGzDqQk
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jul 2020 00:44:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49yLJD1nBnzDqBb
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jul 2020 00:36:28 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 062EaABb170333; Thu, 2 Jul 2020 10:36:18 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 320wfgh49q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Jul 2020 10:36:18 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 062EaHFU170740;
 Thu, 2 Jul 2020 10:36:17 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 320wfgh3p8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Jul 2020 10:36:16 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 062EQKOT006404;
 Thu, 2 Jul 2020 14:32:33 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04ams.nl.ibm.com with ESMTP id 31wwr8e88m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Jul 2020 14:32:33 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 062EWU0K45613128
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 2 Jul 2020 14:32:30 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C88AE4C044;
 Thu,  2 Jul 2020 14:32:30 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 523C24C050;
 Thu,  2 Jul 2020 14:32:28 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu,  2 Jul 2020 14:32:28 +0000 (GMT)
Date: Thu, 2 Jul 2020 20:02:27 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michal Hocko <mhocko@kernel.org>
Subject: Re: [PATCH v5 3/3] mm/page_alloc: Keep memoryless cpuless node 0
 offline
Message-ID: <20200702143227.GE17918@linux.vnet.ibm.com>
References: <20200624092846.9194-4-srikar@linux.vnet.ibm.com>
 <20200701084200.GN2369@dhcp22.suse.cz>
 <20200701100442.GB17918@linux.vnet.ibm.com>
 <184102af-ecf2-c834-db46-173ab2e66f51@redhat.com>
 <20200701110145.GC17918@linux.vnet.ibm.com>
 <0468f965-8762-76a3-93de-3987cf859927@redhat.com>
 <12945273-d788-710d-e8d7-974966529c7d@redhat.com>
 <20200701122110.GT2369@dhcp22.suse.cz>
 <20200702064408.GD17918@linux.vnet.ibm.com>
 <20200702084123.GC18446@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20200702084123.GC18446@dhcp22.suse.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-02_09:2020-07-02,
 2020-07-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 mlxlogscore=999 cotscore=-2147483648
 adultscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0 spamscore=0
 mlxscore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2007020100
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
 David Hildenbrand <david@redhat.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>,
 Mel Gorman <mgorman@suse.de>, "Kirill A. Shutemov" <kirill@shutemov.name>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Christopher Lameter <cl@linux.com>, Vlastimil Babka <vbabka@suse.cz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Michal Hocko <mhocko@kernel.org> [2020-07-02 10:41:23]:

> On Thu 02-07-20 12:14:08, Srikar Dronamraju wrote:
> > * Michal Hocko <mhocko@kernel.org> [2020-07-01 14:21:10]:
> > 
> > > > >>>>> The autonuma problem sounds interesting but again this patch doesn't
> > > > >>>>> really solve the underlying problem because I strongly suspect that the
> > > > >>>>> problem is still there when a numa node gets all its memory offline as
> > > > >>>>> mentioned above.
> > > 
> > > I would really appreciate a feedback to these two as well.
> > 
> > 1. Its not just numactl that's to be fixed but all tools/utilities that
> > depend on /sys/devices/system/node/online. Are we saying to not rely/believe
> > in the output given by the kernel but do further verification?  
> 
> No, what we are saying is that even an online node might have zero
> number of online pages/cpus. So the online status is not really
> something that matters. If people are confused by that output then user
> space tools can make their confusion go away. I really do not understand
> why the kernel should do any logic there.

The user facing teams are saying they are getting queries from the users who
are unable to understand from the tools/sysfs files why a node is online and
but has no attached resources. Its the amount of time that is being spent on
these issues that triggered the patch. Initially even I was skeptical that
this was a non-issue.

> 
> > Also how would the user space differentiate between the case where the
> > Kernel missed marking a node as offline to the case where the memory was
> > offlined on a cpuless node but node wasn't offline?.
> 
> What I am arguing is that those two shouldn't be any different. Really!
> 
> > 2. Regarding the autonuma, the case of offline memory is user/admin driven,
> > so if there is a performance hit, its something that's driven by his
> > user/admin actions. Also how often do we see users offline complete memory
> > of cpuless node on a 2 node system?
> 
> How often do we see crippled HW configurations like that? Really if
> autonuma should be made more clever for one case it should recognize the
> other as well.
> 

Lets take a 16 socket PowerVM system and assume that 32 lpars are created
on that socket, i.e 2 lpars for each socket. (PowerVM has the final say on
how the lpars are created.) In such a case, we can expect 30 out of the 32
lpars to face this problem, with the only 2 lpars that actually run on
socket 0 having the correct configuration.

> > > 
> > > This begs a question whether ppc can do the same thing?
> > 
> > Certainly ppc can be made to adapt to this situation but that would be a
> > workaround. Do we have a reason why we think node 0 is unique and special?
> 
> It is not. As replied in other email in this thread. I would hope for
> having less hacks in the numa initialization. Cleaning up the mess is
> would be a lot of work and testing on all NUMA capable architectures.
> This is a heritage from the past I am afraid. All that I am arguing here
> is that your touch to the generic code with a very simple looking patch
> might have side effects which are pretty much impossible to review.
> Moreover it seems that nothing but ppc really needs this treatment.
> So fixing it in ppc specific code sounds much more safe.
> 
> Normally I would really push for a generic solution but after getting
> burned several times in this area I do not dare anymore. The problem is
> not in the code complexity but in how spread it is in places where you
> do not expect side effects.
> 

I do understand and respect your viewpoint.

> -- 
> Michal Hocko
> SUSE Labs

-- 
Thanks and Regards
Srikar Dronamraju
