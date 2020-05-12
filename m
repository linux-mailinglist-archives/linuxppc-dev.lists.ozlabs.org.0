Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EAB61CF2C8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 May 2020 12:45:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49LvbS1HMYzDqnf
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 May 2020 20:45:40 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49LvX60VXbzDqpv
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 May 2020 20:42:45 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04CA25KD188014; Tue, 12 May 2020 06:42:35 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30y8wtcwra-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 May 2020 06:42:34 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 04CA36YA005388;
 Tue, 12 May 2020 06:42:34 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30y8wtcwqa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 May 2020 06:42:34 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 04CAeQU1004639;
 Tue, 12 May 2020 10:42:32 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03ams.nl.ibm.com with ESMTP id 30wm55p8td-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 May 2020 10:42:31 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 04CAgThg62652518
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 12 May 2020 10:42:29 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B6EB5A4053;
 Tue, 12 May 2020 10:42:29 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6A65DA404D;
 Tue, 12 May 2020 10:42:27 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue, 12 May 2020 10:42:27 +0000 (GMT)
Date: Tue, 12 May 2020 16:12:26 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v2 3/3] mm/page_alloc: Keep memoryless cpuless node 0
 offline
Message-ID: <20200512104226.GE1961@linux.vnet.ibm.com>
References: <20200428165912.ca1eadefbac56d740e6e8fd1@linux-foundation.org>
 <20200429014145.GD19958@linux.vnet.ibm.com>
 <20200429122211.GD28637@dhcp22.suse.cz>
 <20200430071820.GF19958@linux.vnet.ibm.com>
 <20200504093712.GL22838@dhcp22.suse.cz>
 <20200508130304.GA1961@linux.vnet.ibm.com>
 <3bfe7469-1d8c-baa4-6d9d-f4786492eaa8@redhat.com>
 <ce9d47bc-f92c-dd22-0d59-e8d59c913526@redhat.com>
 <20200511174731.GD1961@linux.vnet.ibm.com>
 <45d50d80-c998-9372-42eb-ca753a7258b9@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <45d50d80-c998-9372-42eb-ca753a7258b9@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-12_02:2020-05-11,
 2020-05-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015
 phishscore=0 impostorscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0
 adultscore=0 mlxlogscore=974 spamscore=0 bulkscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2005120077
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
 linux-kernel@vger.kernel.org, Michal Hocko <mhocko@kernel.org>,
 linux-mm@kvack.org, Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>,
 Mel Gorman <mgorman@suse.de>, "Kirill A. Shutemov" <kirill@shutemov.name>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Christopher Lameter <cl@linux.com>, Vlastimil Babka <vbabka@suse.cz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* David Hildenbrand <david@redhat.com> [2020-05-12 09:49:05]:

> On 11.05.20 19:47, Srikar Dronamraju wrote:
> > * David Hildenbrand <david@redhat.com> [2020-05-08 15:42:12]:
> > 
> > 
> > [root@localhost ~]# cat /sys/devices/system/node/online
> > 0
> > [root@localhost ~]# cat /sys/devices/system/node/possible
> > 0-1
> > 
> > Even without my patch, both the combinations, I am still unable to see a
> > cpuless, memoryless node being online. And the interesting part being even
> 
> Yeah, I think on x86, all memory-less and cpu-less nodes are offline as
> default. Especially when hotunplugging cpus/memory, we set them offline
> as well.

I also came to the same conclusion that we may not have a cpuless,memoryless
node on x86.

> 
> But as Michal mentioned, the node handling code is complicated and
> differs between various architectures.
> 

I do agree that node handling code differs across various architectures and
quite complicated.

> > if I mark node 0 as cpuless,memoryless and node 1 as actual node, the system
> > somewhere marks node 0 as the actual node.
> 
> Is the kernel maybe mapping PXM 1 to node 0 in that case, because it
> always requires node 0 to be online/contain memory? Would be interesting
> what happens if you hotplug a DIMM to (QEMU )node 0 - if PXM 0 will be
> mapped to node 1 then as well.
> 

Satheesh Rajendra had tried with cpu hotplug on a similar setup and we found
that it crashes the x86 system.
reference: https://bugzilla.kernel.org/show_bug.cgi?id=202187

Even if we were able to hotplug 1 DIMM memory into node 1, that would no
more be a memoryless node.

-- 
Thanks and Regards
Srikar Dronamraju
