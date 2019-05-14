Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E6751C188
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2019 06:47:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4534tb5hsxzDqGW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2019 14:47:51 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4534sH4jxszDqGS
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 May 2019 14:46:43 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4E4h8JO060014
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 May 2019 00:46:41 -0400
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2sfh3kkh72-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 May 2019 00:46:40 -0400
Received: from localhost
 by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <aneesh.kumar@linux.ibm.com>;
 Tue, 14 May 2019 05:46:40 +0100
Received: from b03cxnp08025.gho.boulder.ibm.com (9.17.130.17)
 by e33.co.us.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 14 May 2019 05:46:38 +0100
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x4E4kbOo10551696
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 May 2019 04:46:38 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D3310136055;
 Tue, 14 May 2019 04:46:37 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6216913604F;
 Tue, 14 May 2019 04:46:36 +0000 (GMT)
Received: from [9.80.230.27] (unknown [9.80.230.27])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 14 May 2019 04:46:35 +0000 (GMT)
Subject: Re: [PATCH] mm/nvdimm: Use correct #defines instead of opencoding
To: Dan Williams <dan.j.williams@intel.com>
References: <20190514025604.9997-1-aneesh.kumar@linux.ibm.com>
 <CAPcyv4iNgFbSq0Hqb+CStRhGWMHfXx7tL3vrDaQ95DcBBY8QCQ@mail.gmail.com>
 <f99c4f11-a43d-c2d3-ab4f-b7072d090351@linux.ibm.com>
 <CAPcyv4gOr8SFbdtBbWhMOU-wdYuMCQ4Jn2SznGRsv6Vku97Xnw@mail.gmail.com>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Date: Tue, 14 May 2019 10:16:34 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAPcyv4gOr8SFbdtBbWhMOU-wdYuMCQ4Jn2SznGRsv6Vku97Xnw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19051404-0036-0000-0000-00000AB9189C
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011095; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000285; SDB=6.01203030; UDB=6.00631440; IPR=6.00983952; 
 MB=3.00026878; MTD=3.00000008; XFM=3.00000015; UTC=2019-05-14 04:46:39
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19051404-0037-0000-0000-00004BC780CB
Message-Id: <02d1d14d-650b-da38-0828-1af330f594d5@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-14_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905140032
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

On 5/14/19 9:42 AM, Dan Williams wrote:
> On Mon, May 13, 2019 at 9:05 PM Aneesh Kumar K.V
> <aneesh.kumar@linux.ibm.com> wrote:
>>
>> On 5/14/19 9:28 AM, Dan Williams wrote:
>>> On Mon, May 13, 2019 at 7:56 PM Aneesh Kumar K.V
>>> <aneesh.kumar@linux.ibm.com> wrote:
>>>>
>>>> The nfpn related change is needed to fix the kernel message
>>>>
>>>> "number of pfns truncated from 2617344 to 163584"
>>>>
>>>> The change makes sure the nfpns stored in the superblock is right value.
>>>>
>>>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>>>> ---
>>>>    drivers/nvdimm/pfn_devs.c    | 6 +++---
>>>>    drivers/nvdimm/region_devs.c | 8 ++++----
>>>>    2 files changed, 7 insertions(+), 7 deletions(-)
>>>>
>>>> diff --git a/drivers/nvdimm/pfn_devs.c b/drivers/nvdimm/pfn_devs.c
>>>> index 347cab166376..6751ff0296ef 100644
>>>> --- a/drivers/nvdimm/pfn_devs.c
>>>> +++ b/drivers/nvdimm/pfn_devs.c
>>>> @@ -777,8 +777,8 @@ static int nd_pfn_init(struct nd_pfn *nd_pfn)
>>>>                    * when populating the vmemmap. This *should* be equal to
>>>>                    * PMD_SIZE for most architectures.
>>>>                    */
>>>> -               offset = ALIGN(start + reserve + 64 * npfns,
>>>> -                               max(nd_pfn->align, PMD_SIZE)) - start;
>>>> +               offset = ALIGN(start + reserve + sizeof(struct page) * npfns,
>>>> +                              max(nd_pfn->align, PMD_SIZE)) - start;
>>>
>>> No, I think we need to record the page-size into the superblock format
>>> otherwise this breaks in debug builds where the struct-page size is
>>> extended.
>>>
>>>>           } else if (nd_pfn->mode == PFN_MODE_RAM)
>>>>                   offset = ALIGN(start + reserve, nd_pfn->align) - start;
>>>>           else
>>>> @@ -790,7 +790,7 @@ static int nd_pfn_init(struct nd_pfn *nd_pfn)
>>>>                   return -ENXIO;
>>>>           }
>>>>
>>>> -       npfns = (size - offset - start_pad - end_trunc) / SZ_4K;
>>>> +       npfns = (size - offset - start_pad - end_trunc) / PAGE_SIZE;
>>>
>>> Similar comment, if the page size is variable then the superblock
>>> needs to explicitly account for it.
>>>
>>
>> PAGE_SIZE is not really variable. What we can run into is the issue you
>> mentioned above. The size of struct page can change which means the
>> reserved space for keeping vmemmap in device may not be sufficient for
>> certain kernel builds.
>>
>> I was planning to add another patch that fails namespace init if we
>> don't have enough space to keep the struct page.
>>
>> Why do you suggest we need to have PAGE_SIZE as part of pfn superblock?
> 
> So that the kernel has a chance to identify cases where the superblock
> it is handling was created on a system with different PAGE_SIZE
> assumptions.
> 

The reason to do that is we don't have enough space to keep struct page 
backing the total number of pfns? If so, what i suggested above should 
handle that.

or are you finding any other reason why we should fail a namespace init 
with a different PAGE_SIZE value?

My another patch handle the details w.r.t devdax alignment for which 
devdax got created with PAGE_SIZE 4K but we are now trying to load that 
in a kernel with PAGE_SIZE 64k.

-aneesh

