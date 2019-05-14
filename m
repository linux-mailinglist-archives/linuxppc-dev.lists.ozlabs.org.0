Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7181C12A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2019 06:07:26 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4533zv6krGzDqGW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2019 14:07:23 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4533xm53D9zDqGY
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 May 2019 14:05:32 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4E42itO021153
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 May 2019 00:05:29 -0400
Received: from e11.ny.us.ibm.com (e11.ny.us.ibm.com [129.33.205.201])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2sfj48r15s-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 May 2019 00:05:29 -0400
Received: from localhost
 by e11.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <aneesh.kumar@linux.ibm.com>;
 Tue, 14 May 2019 05:05:28 +0100
Received: from b01cxnp23034.gho.pok.ibm.com (9.57.198.29)
 by e11.ny.us.ibm.com (146.89.104.198) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 14 May 2019 05:05:25 +0100
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x4E45OZ633161672
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 May 2019 04:05:24 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3797211206B;
 Tue, 14 May 2019 04:05:24 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 22F6811206E;
 Tue, 14 May 2019 04:05:23 +0000 (GMT)
Received: from [9.80.221.111] (unknown [9.80.221.111])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 14 May 2019 04:05:22 +0000 (GMT)
Subject: Re: [PATCH] mm/nvdimm: Use correct #defines instead of opencoding
To: Dan Williams <dan.j.williams@intel.com>
References: <20190514025604.9997-1-aneesh.kumar@linux.ibm.com>
 <CAPcyv4iNgFbSq0Hqb+CStRhGWMHfXx7tL3vrDaQ95DcBBY8QCQ@mail.gmail.com>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Date: Tue, 14 May 2019 09:35:21 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAPcyv4iNgFbSq0Hqb+CStRhGWMHfXx7tL3vrDaQ95DcBBY8QCQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19051404-2213-0000-0000-0000038D6545
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011095; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000285; SDB=6.01203018; UDB=6.00631432; IPR=6.00983938; 
 MB=3.00026877; MTD=3.00000008; XFM=3.00000015; UTC=2019-05-14 04:05:27
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19051404-2214-0000-0000-00005E6D0FF7
Message-Id: <f99c4f11-a43d-c2d3-ab4f-b7072d090351@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-14_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905140027
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

On 5/14/19 9:28 AM, Dan Williams wrote:
> On Mon, May 13, 2019 at 7:56 PM Aneesh Kumar K.V
> <aneesh.kumar@linux.ibm.com> wrote:
>>
>> The nfpn related change is needed to fix the kernel message
>>
>> "number of pfns truncated from 2617344 to 163584"
>>
>> The change makes sure the nfpns stored in the superblock is right value.
>>
>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> ---
>>   drivers/nvdimm/pfn_devs.c    | 6 +++---
>>   drivers/nvdimm/region_devs.c | 8 ++++----
>>   2 files changed, 7 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/nvdimm/pfn_devs.c b/drivers/nvdimm/pfn_devs.c
>> index 347cab166376..6751ff0296ef 100644
>> --- a/drivers/nvdimm/pfn_devs.c
>> +++ b/drivers/nvdimm/pfn_devs.c
>> @@ -777,8 +777,8 @@ static int nd_pfn_init(struct nd_pfn *nd_pfn)
>>                   * when populating the vmemmap. This *should* be equal to
>>                   * PMD_SIZE for most architectures.
>>                   */
>> -               offset = ALIGN(start + reserve + 64 * npfns,
>> -                               max(nd_pfn->align, PMD_SIZE)) - start;
>> +               offset = ALIGN(start + reserve + sizeof(struct page) * npfns,
>> +                              max(nd_pfn->align, PMD_SIZE)) - start;
> 
> No, I think we need to record the page-size into the superblock format
> otherwise this breaks in debug builds where the struct-page size is
> extended.
> 
>>          } else if (nd_pfn->mode == PFN_MODE_RAM)
>>                  offset = ALIGN(start + reserve, nd_pfn->align) - start;
>>          else
>> @@ -790,7 +790,7 @@ static int nd_pfn_init(struct nd_pfn *nd_pfn)
>>                  return -ENXIO;
>>          }
>>
>> -       npfns = (size - offset - start_pad - end_trunc) / SZ_4K;
>> +       npfns = (size - offset - start_pad - end_trunc) / PAGE_SIZE;
> 
> Similar comment, if the page size is variable then the superblock
> needs to explicitly account for it.
> 

PAGE_SIZE is not really variable. What we can run into is the issue you 
mentioned above. The size of struct page can change which means the 
reserved space for keeping vmemmap in device may not be sufficient for 
certain kernel builds.

I was planning to add another patch that fails namespace init if we 
don't have enough space to keep the struct page.

Why do you suggest we need to have PAGE_SIZE as part of pfn superblock?

-aneesh

