Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B44B486D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Sep 2019 09:42:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46XZnR2WF3zF4Gt
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Sep 2019 17:42:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=aneesh.kumar@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46XZl939VhzF49P
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Sep 2019 17:40:05 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8H7bDfD096042; Tue, 17 Sep 2019 03:39:56 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v2stvu75v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Sep 2019 03:39:56 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x8H7bJk3096825;
 Tue, 17 Sep 2019 03:39:55 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v2stvu75b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Sep 2019 03:39:55 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x8H7dTdu012830;
 Tue, 17 Sep 2019 07:39:54 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma03dal.us.ibm.com with ESMTP id 2v0svqmjcf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Sep 2019 07:39:54 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8H7drf047513974
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Sep 2019 07:39:53 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3FE0CC6061;
 Tue, 17 Sep 2019 07:39:53 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8A313C6055;
 Tue, 17 Sep 2019 07:39:51 +0000 (GMT)
Received: from [9.124.35.113] (unknown [9.124.35.113])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 17 Sep 2019 07:39:51 +0000 (GMT)
Subject: Re: [PATCH 1/2] libnvdimm/altmap: Track namespace boundaries in altmap
To: Dan Williams <dan.j.williams@intel.com>
References: <20190910062826.10041-1-aneesh.kumar@linux.ibm.com>
 <CAPcyv4g2jAGzQ3fxpZRTV16hoPfyXqzvB7Zny6D5g5JyAQ1Dkw@mail.gmail.com>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <94cff17c-bdf7-0395-bf5a-e2d72ca61893@linux.ibm.com>
Date: Tue, 17 Sep 2019 13:09:50 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAPcyv4g2jAGzQ3fxpZRTV16hoPfyXqzvB7Zny6D5g5JyAQ1Dkw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-17_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909170084
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
Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-nvdimm <linux-nvdimm@lists.01.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 9/16/19 11:28 PM, Dan Williams wrote:
> On Mon, Sep 9, 2019 at 11:29 PM Aneesh Kumar K.V
> <aneesh.kumar@linux.ibm.com> wrote:
>>
>> With PFN_MODE_PMEM namespace, the memmap area is allocated from the device
>> area. Some architectures map the memmap area with large page size. On
>> architectures like ppc64, 16MB page for memap mapping can map 262144 pfns.
>> This maps a namespace size of 16G.
>>
>> When populating memmap region with 16MB page from the device area,
>> make sure the allocated space is not used to map resources outside this
>> namespace. Such usage of device area will prevent a namespace destroy.
>>
>> Add resource end pnf in altmap and use that to check if the memmap area
>> allocation can map pfn outside the namespace. On ppc64 in such case we fallback
>> to allocation from memory.
>>
>> This fix kernel crash reported below:
>>
>> [  132.034989] WARNING: CPU: 13 PID: 13719 at mm/memremap.c:133 devm_memremap_pages_release+0x2d8/0x2e0
>> [  133.464754] BUG: Unable to handle kernel data access at 0xc00c00010b204000
>> [  133.464760] Faulting instruction address: 0xc00000000007580c
>> [  133.464766] Oops: Kernel access of bad area, sig: 11 [#1]
>> [  133.464771] LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA pSeries
>> .....
>> [  133.464901] NIP [c00000000007580c] vmemmap_free+0x2ac/0x3d0
>> [  133.464906] LR [c0000000000757f8] vmemmap_free+0x298/0x3d0
>> [  133.464910] Call Trace:
>> [  133.464914] [c000007cbfd0f7b0] [c0000000000757f8] vmemmap_free+0x298/0x3d0 (unreliable)
>> [  133.464921] [c000007cbfd0f8d0] [c000000000370a44] section_deactivate+0x1a4/0x240
>> [  133.464928] [c000007cbfd0f980] [c000000000386270] __remove_pages+0x3a0/0x590
>> [  133.464935] [c000007cbfd0fa50] [c000000000074158] arch_remove_memory+0x88/0x160
>> [  133.464942] [c000007cbfd0fae0] [c0000000003be8c0] devm_memremap_pages_release+0x150/0x2e0
>> [  133.464949] [c000007cbfd0fb70] [c000000000738ea0] devm_action_release+0x30/0x50
>> [  133.464955] [c000007cbfd0fb90] [c00000000073a5a4] release_nodes+0x344/0x400
>> [  133.464961] [c000007cbfd0fc40] [c00000000073378c] device_release_driver_internal+0x15c/0x250
>> [  133.464968] [c000007cbfd0fc80] [c00000000072fd14] unbind_store+0x104/0x110
>> [  133.464973] [c000007cbfd0fcd0] [c00000000072ee24] drv_attr_store+0x44/0x70
>> [  133.464981] [c000007cbfd0fcf0] [c0000000004a32bc] sysfs_kf_write+0x6c/0xa0
>> [  133.464987] [c000007cbfd0fd10] [c0000000004a1dfc] kernfs_fop_write+0x17c/0x250
>> [  133.464993] [c000007cbfd0fd60] [c0000000003c348c] __vfs_write+0x3c/0x70
>> [  133.464999] [c000007cbfd0fd80] [c0000000003c75d0] vfs_write+0xd0/0x250
> 
> Question, does this crash only happen when the namespace is not 16MB
> aligned? In other words was this bug exposed by the subsection-hotplug
> changes and should it contain Fixes: tag for those commits?
> 

We are able to hit this crash even with older kernels. This happens when 
we have multiple namespaces from the same region of size 26G. In that 
case we need to make sure we don't end up using altmap from one 
namespace for mapping vmemmap of the adjacent namespace.

Considering this impacts ppc64 and we got the ppc64 SCM support in 4.20. 
may be  we can do just
Cc: <stable@vger.kernel.org> # 4.20+

-aneesh
