Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1546E192251
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Mar 2020 09:15:28 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48nLXD2RWnzDqkL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Mar 2020 19:15:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48nLT35YXNzDqWy
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Mar 2020 19:12:38 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02P86a8K018575
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Mar 2020 04:12:35 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ywbthnmrb-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Mar 2020 04:12:34 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <aneesh.kumar@linux.ibm.com>;
 Wed, 25 Mar 2020 08:12:30 -0000
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 25 Mar 2020 08:12:27 -0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02P8CR0h43450380
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 25 Mar 2020 08:12:28 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D82074C040;
 Wed, 25 Mar 2020 08:12:27 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4B4484C044;
 Wed, 25 Mar 2020 08:12:26 +0000 (GMT)
Received: from [9.199.32.190] (unknown [9.199.32.190])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 25 Mar 2020 08:12:26 +0000 (GMT)
Subject: Re: [PATCH] mm/sparse: Fix kernel crash with pfn_section_valid check
To: Baoquan He <bhe@redhat.com>
References: <20200325031914.107660-1-aneesh.kumar@linux.ibm.com>
 <20200325070643.GH3039@MiWiFi-R3L-srv> <20200325073707.GI3039@MiWiFi-R3L-srv>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Date: Wed, 25 Mar 2020 13:42:25 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200325073707.GI3039@MiWiFi-R3L-srv>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 20032508-0012-0000-0000-0000039757D9
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20032508-0013-0000-0000-000021D44EA6
Message-Id: <5cdf5334-7fbb-8427-1918-ed67d5f23834@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-25_01:2020-03-23,
 2020-03-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 phishscore=0 impostorscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 mlxlogscore=999 lowpriorityscore=0 clxscore=1015 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003250063
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
Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 dan.j.williams@intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/25/20 1:07 PM, Baoquan He wrote:
> On 03/25/20 at 03:06pm, Baoquan He wrote:
>> On 03/25/20 at 08:49am, Aneesh Kumar K.V wrote:
> 
>>>   mm/sparse.c | 2 ++
>>>   1 file changed, 2 insertions(+)
>>>
>>> diff --git a/mm/sparse.c b/mm/sparse.c
>>> index aadb7298dcef..3012d1f3771a 100644
>>> --- a/mm/sparse.c
>>> +++ b/mm/sparse.c
>>> @@ -781,6 +781,8 @@ static void section_deactivate(unsigned long pfn, unsigned long nr_pages,
>>>   			ms->usage = NULL;
>>>   		}
>>>   		memmap = sparse_decode_mem_map(ms->section_mem_map, section_nr);
>>> +		/* Mark the section invalid */
>>> +		ms->section_mem_map &= ~SECTION_HAS_MEM_MAP;
>>
>> Not sure if we should add checking in valid_section() or pfn_valid(),
>> e.g check ms->usage validation too. Otherwise, this fix looks good to
>> me.
> 
> With SPASEMEM_VMEMAP enabled, we should do validation check on ms->usage
> before checking any subsection is valid. Since now we do have case
> in which ms->usage is released, people still try to check it.
> 
> diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
> index f0a2c184eb9a..d79bd938852e 100644
> --- a/include/linux/mmzone.h
> +++ b/include/linux/mmzone.h
> @@ -1306,6 +1306,8 @@ static inline int pfn_section_valid(struct mem_section *ms, unsigned long pfn)
>   {
>   	int idx = subsection_map_index(pfn);
>   
> +	if (!ms->usage)
> +		return 0;
>   	return test_bit(idx, ms->usage->subsection_map);
>   }
>   #else
> 

We always check for section valid, before we check if pfn_section_valid().

static inline int pfn_valid(unsigned long pfn)

	struct mem_section *ms;

	if (pfn_to_section_nr(pfn) >= NR_MEM_SECTIONS)
		return 0;
	ms = __nr_to_section(pfn_to_section_nr(pfn));
	if (!valid_section(ms))
		return 0;
	/*
	 * Traditionally early sections always returned pfn_valid() for
	 * the entire section-sized span.
	 */
	return early_section(ms) || pfn_section_valid(ms, pfn);
}


IMHO adding that if (!ms->usage) is redundant.

-aneesh


