Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 16BB5AE606
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Sep 2019 10:49:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46SJcr2gW9zDqV8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Sep 2019 18:49:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=aneesh.kumar@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46SJBt6y02zDqZX
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Sep 2019 18:30:46 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8A8Rvxs066369; Tue, 10 Sep 2019 04:30:37 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ux6hcbhmx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Sep 2019 04:30:37 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x8A8SGTw067975;
 Tue, 10 Sep 2019 04:30:37 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ux6hcbhmc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Sep 2019 04:30:36 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x8A8TZPQ017704;
 Tue, 10 Sep 2019 08:30:36 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma03dal.us.ibm.com with ESMTP id 2uv4687kms-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Sep 2019 08:30:36 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8A8UYhc52429304
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 Sep 2019 08:30:34 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 778FD7805C;
 Tue, 10 Sep 2019 08:30:34 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1DD9678067;
 Tue, 10 Sep 2019 08:30:29 +0000 (GMT)
Received: from [9.199.41.80] (unknown [9.199.41.80])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 10 Sep 2019 08:30:28 +0000 (GMT)
Subject: Re: [PATCH 1/2] libnvdimm/altmap: Track namespace boundaries in altmap
To: Dan Williams <dan.j.williams@intel.com>
References: <20190910062826.10041-1-aneesh.kumar@linux.ibm.com>
 <CAPcyv4jmO381oLTHBM80jNy6uNNkXvsOyGTjqSY4zzaS6-4_nQ@mail.gmail.com>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <14129b58-37a5-56f5-9e90-8740400d07f6@linux.ibm.com>
Date: Tue, 10 Sep 2019 14:00:25 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAPcyv4jmO381oLTHBM80jNy6uNNkXvsOyGTjqSY4zzaS6-4_nQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-10_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1909100085
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

On 9/10/19 1:40 PM, Dan Williams wrote:
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
> 
> Shouldn't this instead be comprehended by nd_pfn_init() to increase
> the reservation size so that it fits in the alignment? It may not
> always be possible to fall back to allocation from memory for
> extremely large pmem devices. I.e. at 64GB of memmap per 1TB of pmem
> there may not be enough DRAM to store the memmap.
> 

We do switch between DRAM and device for memmap allocation. ppc64 
vmemmap_populate  does

if (altmap && !altmap_cross_boundary(altmap, start, page_size)) {
	p = altmap_alloc_block_buf(page_size, altmap);
	if (!p)
		pr_debug("altmap block allocation failed, falling back to system memory");
	}
	if (!p)
		p = vmemmap_alloc_block_buf(page_size, node);
	

With that we should be using DRAM for the first and the last mapping, 
rest of the memmap should be backed by device.

-aneesh
