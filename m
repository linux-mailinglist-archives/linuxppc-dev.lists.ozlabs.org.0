Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 89042211C20
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jul 2020 08:46:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49y7sj08vVzDqTd
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jul 2020 16:46:17 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49y7qY6gR0zDqqD
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Jul 2020 16:44:25 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0626W4fT082159; Thu, 2 Jul 2020 02:44:17 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 320wmp2je5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Jul 2020 02:44:16 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0626fftQ118902;
 Thu, 2 Jul 2020 02:44:16 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 320wmp2jdg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Jul 2020 02:44:16 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0626aPZb016144;
 Thu, 2 Jul 2020 06:44:13 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06ams.nl.ibm.com with ESMTP id 31wwch5bu7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Jul 2020 06:44:13 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0626iBVI58196136
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 2 Jul 2020 06:44:11 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 43DC45204F;
 Thu,  2 Jul 2020 06:44:11 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id C8DD352052;
 Thu,  2 Jul 2020 06:44:08 +0000 (GMT)
Date: Thu, 2 Jul 2020 12:14:08 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michal Hocko <mhocko@kernel.org>
Subject: Re: [PATCH v5 3/3] mm/page_alloc: Keep memoryless cpuless node 0
 offline
Message-ID: <20200702064408.GD17918@linux.vnet.ibm.com>
References: <20200624092846.9194-1-srikar@linux.vnet.ibm.com>
 <20200624092846.9194-4-srikar@linux.vnet.ibm.com>
 <20200701084200.GN2369@dhcp22.suse.cz>
 <20200701100442.GB17918@linux.vnet.ibm.com>
 <184102af-ecf2-c834-db46-173ab2e66f51@redhat.com>
 <20200701110145.GC17918@linux.vnet.ibm.com>
 <0468f965-8762-76a3-93de-3987cf859927@redhat.com>
 <12945273-d788-710d-e8d7-974966529c7d@redhat.com>
 <20200701122110.GT2369@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20200701122110.GT2369@dhcp22.suse.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-02_02:2020-07-01,
 2020-07-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 impostorscore=0 adultscore=0 cotscore=-2147483648 suspectscore=0
 phishscore=0 priorityscore=1501 mlxscore=0 spamscore=0 bulkscore=0
 mlxlogscore=999 lowpriorityscore=0 clxscore=1015 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2007020046
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

* Michal Hocko <mhocko@kernel.org> [2020-07-01 14:21:10]:

> > >>>>>>
> > >>>>>> 2. Also existence of dummy node also leads to inconsistent information. The
> > >>>>>> number of online nodes is inconsistent with the information in the
> > >>>>>> device-tree and resource-dump
> > >>>>>>
> > >>>>>> 3. When the dummy node is present, single node non-Numa systems end up showing
> > >>>>>> up as NUMA systems and numa_balancing gets enabled. This will mean we take
> > >>>>>> the hit from the unnecessary numa hinting faults.
> > >>>>>
> > >>>>> I have to say that I dislike the node online/offline state and directly
> > >>>>> exporting that to the userspace. Users should only care whether the node
> > >>>>> has memory/cpus. Numa nodes can be online without any memory. Just
> > >>>>> offline all the present memory blocks but do not physically hot remove
> > >>>>> them and you are in the same situation. If users are confused by an
> > >>>>> output of tools like numactl -H then those could be updated and hide
> > >>>>> nodes without any memory&cpus.
> > >>>>>
> > >>>>> The autonuma problem sounds interesting but again this patch doesn't
> > >>>>> really solve the underlying problem because I strongly suspect that the
> > >>>>> problem is still there when a numa node gets all its memory offline as
> > >>>>> mentioned above.
> 
> I would really appreciate a feedback to these two as well.

1. Its not just numactl that's to be fixed but all tools/utilities that
depend on /sys/devices/system/node/online. Are we saying to not rely/believe
in the output given by the kernel but do further verification?  

Also how would the user space differentiate between the case where the
Kernel missed marking a node as offline to the case where the memory was
offlined on a cpuless node but node wasn't offline?.

2. Regarding the autonuma, the case of offline memory is user/admin driven,
so if there is a performance hit, its something that's driven by his
user/admin actions. Also how often do we see users offline complete memory
of cpuless node on a 2 node system?

> 
> > [    0.009726] SRAT: PXM 1 -> APIC 0x00 -> Node 0
> > [    0.009727] SRAT: PXM 1 -> APIC 0x01 -> Node 0
> > [    0.009727] SRAT: PXM 1 -> APIC 0x02 -> Node 0
> > [    0.009728] SRAT: PXM 1 -> APIC 0x03 -> Node 0
> > [    0.009731] ACPI: SRAT: Node 0 PXM 1 [mem 0x00000000-0x0009ffff]
> > [    0.009732] ACPI: SRAT: Node 0 PXM 1 [mem 0x00100000-0xbfffffff]
> > [    0.009733] ACPI: SRAT: Node 0 PXM 1 [mem 0x100000000-0x13fffffff]
> 
> This begs a question whether ppc can do the same thing?

Certainly ppc can be made to adapt to this situation but that would be a
workaround. Do we have a reason why we think node 0 is unique and special?
If yes can we document it so that in future also people know why we consider
node 0 to be special. I do understand the *fear of the unknown* but when we
are unable to theoretically or practically come up a case, then it may
probably be better we hit the situation to understand what that unknown is?

> I would swear that we've had x86 system with node 0 but I cannot really
> find it and it is possible that it was not x86 after all...

-- 
Thanks and Regards
Srikar Dronamraju
