Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E81210908
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jul 2020 12:14:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49xcXP0DsGzDqtK
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jul 2020 20:14:29 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49xcKV6QSMzDr0m
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Jul 2020 20:05:02 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 061A3D4U112370; Wed, 1 Jul 2020 06:04:50 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 320pjt3us7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Jul 2020 06:04:50 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 061A3D0h112394;
 Wed, 1 Jul 2020 06:04:49 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 320pjt3ur9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Jul 2020 06:04:49 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0619qH6v009168;
 Wed, 1 Jul 2020 10:04:47 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06ams.nl.ibm.com with ESMTP id 31wwch4dq2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Jul 2020 10:04:47 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 061A4jmi26673334
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 1 Jul 2020 10:04:45 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7B1615205A;
 Wed,  1 Jul 2020 10:04:45 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id D50F65204E;
 Wed,  1 Jul 2020 10:04:42 +0000 (GMT)
Date: Wed, 1 Jul 2020 15:34:42 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michal Hocko <mhocko@kernel.org>
Subject: Re: [PATCH v5 3/3] mm/page_alloc: Keep memoryless cpuless node 0
 offline
Message-ID: <20200701100442.GB17918@linux.vnet.ibm.com>
References: <20200624092846.9194-1-srikar@linux.vnet.ibm.com>
 <20200624092846.9194-4-srikar@linux.vnet.ibm.com>
 <20200701084200.GN2369@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20200701084200.GN2369@dhcp22.suse.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-01_04:2020-07-01,
 2020-07-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015
 suspectscore=0 mlxscore=0 adultscore=0 impostorscore=0
 cotscore=-2147483648 spamscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 phishscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2007010069
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

* Michal Hocko <mhocko@kernel.org> [2020-07-01 10:42:00]:

> 
> > 
> > 2. Also existence of dummy node also leads to inconsistent information. The
> > number of online nodes is inconsistent with the information in the
> > device-tree and resource-dump
> > 
> > 3. When the dummy node is present, single node non-Numa systems end up showing
> > up as NUMA systems and numa_balancing gets enabled. This will mean we take
> > the hit from the unnecessary numa hinting faults.
> 
> I have to say that I dislike the node online/offline state and directly
> exporting that to the userspace. Users should only care whether the node
> has memory/cpus. Numa nodes can be online without any memory. Just
> offline all the present memory blocks but do not physically hot remove
> them and you are in the same situation. If users are confused by an
> output of tools like numactl -H then those could be updated and hide
> nodes without any memory&cpus.
> 
> The autonuma problem sounds interesting but again this patch doesn't
> really solve the underlying problem because I strongly suspect that the
> problem is still there when a numa node gets all its memory offline as
> mentioned above.
> 
> While I completely agree that making node 0 special is wrong, I have
> still hard time to review this very simply looking patch because all the
> numa initialization is so spread around that this might just blow up
> at unexpected places. IIRC we have discussed testing in the previous
> version and David has provided a way to emulate these configurations
> on x86. Did you manage to use those instruction for additional testing
> on other than ppc architectures?
> 

I have tried all the steps that David mentioned and reported back at
https://lore.kernel.org/lkml/20200511174731.GD1961@linux.vnet.ibm.com/t/#u

As a summary, David's steps are still not creating a memoryless/cpuless on
x86 VM. I have tried booting with Numa/non-numa on all the x86 machines that
I could get to.

-- 
Thanks and Regards
Srikar Dronamraju
