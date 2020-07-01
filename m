Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D269D2109FC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jul 2020 13:04:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49xddt721QzDr1S
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jul 2020 21:04:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49xdbp4MKNzDr09
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Jul 2020 21:02:30 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 061B1hkj016074; Wed, 1 Jul 2020 07:02:19 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 320s8ar11p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Jul 2020 07:02:19 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 061B1tO9017308;
 Wed, 1 Jul 2020 07:02:18 -0400
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0b-001b2d01.pphosted.com with ESMTP id 320s8ar102-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Jul 2020 07:02:18 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 061AuTVk003987;
 Wed, 1 Jul 2020 11:02:16 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06fra.de.ibm.com with ESMTP id 31wwcgt8ae-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Jul 2020 11:02:16 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 061B0sJc62062930
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 1 Jul 2020 11:00:54 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C5F41AE0E3;
 Wed,  1 Jul 2020 11:02:10 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 42A6EAE0F4;
 Wed,  1 Jul 2020 11:01:46 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  1 Jul 2020 11:01:46 +0000 (GMT)
Date: Wed, 1 Jul 2020 16:31:45 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v5 3/3] mm/page_alloc: Keep memoryless cpuless node 0
 offline
Message-ID: <20200701110145.GC17918@linux.vnet.ibm.com>
References: <20200624092846.9194-1-srikar@linux.vnet.ibm.com>
 <20200624092846.9194-4-srikar@linux.vnet.ibm.com>
 <20200701084200.GN2369@dhcp22.suse.cz>
 <20200701100442.GB17918@linux.vnet.ibm.com>
 <184102af-ecf2-c834-db46-173ab2e66f51@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <184102af-ecf2-c834-db46-173ab2e66f51@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-01_07:2020-07-01,
 2020-07-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 mlxscore=0 bulkscore=0
 spamscore=0 mlxlogscore=999 cotscore=-2147483648 adultscore=0
 lowpriorityscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2007010077
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
 Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org,
 Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org,
 Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>, Mel Gorman <mgorman@suse.de>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Christopher Lameter <cl@linux.com>, Vlastimil Babka <vbabka@suse.cz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* David Hildenbrand <david@redhat.com> [2020-07-01 12:15:54]:

> On 01.07.20 12:04, Srikar Dronamraju wrote:
> > * Michal Hocko <mhocko@kernel.org> [2020-07-01 10:42:00]:
> > 
> >>
> >>>
> >>> 2. Also existence of dummy node also leads to inconsistent information. The
> >>> number of online nodes is inconsistent with the information in the
> >>> device-tree and resource-dump
> >>>
> >>> 3. When the dummy node is present, single node non-Numa systems end up showing
> >>> up as NUMA systems and numa_balancing gets enabled. This will mean we take
> >>> the hit from the unnecessary numa hinting faults.
> >>
> >> I have to say that I dislike the node online/offline state and directly
> >> exporting that to the userspace. Users should only care whether the node
> >> has memory/cpus. Numa nodes can be online without any memory. Just
> >> offline all the present memory blocks but do not physically hot remove
> >> them and you are in the same situation. If users are confused by an
> >> output of tools like numactl -H then those could be updated and hide
> >> nodes without any memory&cpus.
> >>
> >> The autonuma problem sounds interesting but again this patch doesn't
> >> really solve the underlying problem because I strongly suspect that the
> >> problem is still there when a numa node gets all its memory offline as
> >> mentioned above.
> >>
> >> While I completely agree that making node 0 special is wrong, I have
> >> still hard time to review this very simply looking patch because all the
> >> numa initialization is so spread around that this might just blow up
> >> at unexpected places. IIRC we have discussed testing in the previous
> >> version and David has provided a way to emulate these configurations
> >> on x86. Did you manage to use those instruction for additional testing
> >> on other than ppc architectures?
> >>
> > 
> > I have tried all the steps that David mentioned and reported back at
> > https://lore.kernel.org/lkml/20200511174731.GD1961@linux.vnet.ibm.com/t/#u
> > 
> > As a summary, David's steps are still not creating a memoryless/cpuless on
> > x86 VM.
> 
> Now, that is wrong. You get a memoryless/cpuless node, which is *not
> online*. Once you hotplug some memory, it will switch online. Once you
> remove memory, it will switch back offline.
> 

Let me clarify, we are looking for a node 0 which is cpuless/memoryless at
boot.  The code in question tries to handle a cpuless/memoryless node 0 at
boot.

With the steps that you gave the node 0 was always populated, node 1 or
some other node would be memoryless/cpuless and offline. But that should
have no impact by patch.

I don't see how adding/hotplugging/removing memory to a node after boot is
going to affect the changes that I have made. Please do correct me if I have
misunderstood.


-- 
Thanks and Regards
Srikar Dronamraju
