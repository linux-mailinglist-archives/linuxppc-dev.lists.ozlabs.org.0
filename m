Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B4E1C17D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2019 06:43:03 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4534n10V8RzDqLw
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2019 14:43:01 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4534lq00GCzDqGS
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 May 2019 14:41:58 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4E4XE6u015340
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 May 2019 00:41:54 -0400
Received: from e35.co.us.ibm.com (e35.co.us.ibm.com [32.97.110.153])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2sfm55n6xg-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 May 2019 00:41:54 -0400
Received: from localhost
 by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <aneesh.kumar@linux.ibm.com>;
 Tue, 14 May 2019 05:41:53 +0100
Received: from b03cxnp07029.gho.boulder.ibm.com (9.17.130.16)
 by e35.co.us.ibm.com (192.168.1.135) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 14 May 2019 05:41:51 +0100
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x4E4fooX2753004
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 May 2019 04:41:50 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2A8B7136060;
 Tue, 14 May 2019 04:41:50 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AD0FE13604F;
 Tue, 14 May 2019 04:41:48 +0000 (GMT)
Received: from [9.80.230.27] (unknown [9.80.230.27])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 14 May 2019 04:41:48 +0000 (GMT)
Subject: Re: [PATCH] mm/nvdimm: Use correct alignment when looking at first
 pfn from a region
To: Dan Williams <dan.j.williams@intel.com>
References: <20190514025512.9670-1-aneesh.kumar@linux.ibm.com>
 <CAPcyv4hgNUDxjgYNkxOXJ9hfLb6z2+E1yasNoZNDKFUxkCzWLA@mail.gmail.com>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Date: Tue, 14 May 2019 10:11:47 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAPcyv4hgNUDxjgYNkxOXJ9hfLb6z2+E1yasNoZNDKFUxkCzWLA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19051404-0012-0000-0000-000017361693
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011095; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000285; SDB=6.01203028; UDB=6.00631439; IPR=6.00983950; 
 MB=3.00026878; MTD=3.00000008; XFM=3.00000015; UTC=2019-05-14 04:41:52
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19051404-0013-0000-0000-00005741C30C
Message-Id: <925e41ad-cc57-bc03-a2b6-6913c9e98abf@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-14_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905140031
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
Cc: Linux MM <linux-mm@kvack.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-nvdimm <linux-nvdimm@lists.01.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 5/14/19 9:59 AM, Dan Williams wrote:
> On Mon, May 13, 2019 at 7:55 PM Aneesh Kumar K.V
> <aneesh.kumar@linux.ibm.com> wrote:
>>
>> We already add the start_pad to the resource->start but fails to section
>> align the start. This make sure with altmap we compute the right first
>> pfn when start_pad is zero and we are doing an align down of start address.
>>
>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> ---
>>   kernel/memremap.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/kernel/memremap.c b/kernel/memremap.c
>> index a856cb5ff192..23d77b60e728 100644
>> --- a/kernel/memremap.c
>> +++ b/kernel/memremap.c
>> @@ -59,9 +59,9 @@ static unsigned long pfn_first(struct dev_pagemap *pgmap)
>>   {
>>          const struct resource *res = &pgmap->res;
>>          struct vmem_altmap *altmap = &pgmap->altmap;
>> -       unsigned long pfn;
>> +       unsigned long pfn = PHYS_PFN(res->start);
>>
>> -       pfn = res->start >> PAGE_SHIFT;
>> +       pfn = SECTION_ALIGN_DOWN(pfn);
> 
> This does not seem right to me it breaks the assumptions of where the
> first expected valid pfn occurs in the passed in range.
> 

How do we define the first valid pfn? Isn't that at pfn_sb->dataoff ?

-aneesh

