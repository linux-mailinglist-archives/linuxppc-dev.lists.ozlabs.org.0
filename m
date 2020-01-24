Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E51148CC0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jan 2020 18:10:02 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4845H95LYszDqg8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Jan 2020 04:09:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4845DM5jTTzDqjV
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Jan 2020 04:07:31 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00OH5xma109424
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jan 2020 12:07:28 -0500
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2xq3ma5vp7-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jan 2020 12:07:28 -0500
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <aneesh.kumar@linux.ibm.com>;
 Fri, 24 Jan 2020 17:07:26 -0000
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 24 Jan 2020 17:07:23 -0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 00OH7Mv723265404
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 24 Jan 2020 17:07:22 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3E88042047;
 Fri, 24 Jan 2020 17:07:22 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E9FB042045;
 Fri, 24 Jan 2020 17:07:20 +0000 (GMT)
Received: from [9.85.89.94] (unknown [9.85.89.94])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 24 Jan 2020 17:07:20 +0000 (GMT)
Subject: Re: [PATCH v4 1/6] libnvdimm/namespace: Make namespace size
 validation arch dependent
To: Dan Williams <dan.j.williams@intel.com>
References: <20200120140749.69549-1-aneesh.kumar@linux.ibm.com>
 <20200120140749.69549-2-aneesh.kumar@linux.ibm.com>
 <CAPcyv4jcZhQcKr=0OGWc1aZb0OQ1ws2edd-LZMR-EJ_Z2174Sg@mail.gmail.com>
 <5fd11235-5f26-b10a-140f-ef24214c85b1@linux.ibm.com>
 <CAPcyv4jP3S0h9vUVVU16ipeauXyaW3qxUdridagA4SNJ1UW+Vw@mail.gmail.com>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Date: Fri, 24 Jan 2020 22:37:19 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAPcyv4jP3S0h9vUVVU16ipeauXyaW3qxUdridagA4SNJ1UW+Vw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 20012417-0020-0000-0000-000003A3AE9F
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20012417-0021-0000-0000-000021FB4D1E
Message-Id: <cb71528e-0ea9-cb56-6b51-ae7a5231ad54@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-24_06:2020-01-24,
 2020-01-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 mlxlogscore=778 mlxscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001240140
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
Cc: Vishal L Verma <vishal.l.verma@intel.com>, jmoyer <jmoyer@redhat.com>,
 linuxppc-dev@lists.ozlabs.org, linux-nvdimm <linux-nvdimm@lists.01.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 1/24/20 10:15 PM, Dan Williams wrote:
> On Thu, Jan 23, 2020 at 11:34 PM Aneesh Kumar K.V
> <aneesh.kumar@linux.ibm.com> wrote:
>>
>> On 1/24/20 11:27 AM, Dan Williams wrote:
>>> On Mon, Jan 20, 2020 at 6:08 AM Aneesh Kumar K.V
>>>
>>
>> ....
>>
>>>>
>>>> +unsigned long arch_namespace_map_size(void)
>>>> +{
>>>> +       return PAGE_SIZE;
>>>> +}
>>>> +EXPORT_SYMBOL_GPL(arch_namespace_map_size);
>>>> +
>>>> +
>>>>    static void __cpa_flush_all(void *arg)
>>>>    {
>>>>           unsigned long cache = (unsigned long)arg;
>>>> diff --git a/include/linux/libnvdimm.h b/include/linux/libnvdimm.h
>>>> index 9df091bd30ba..a3476dbd2656 100644
>>>> --- a/include/linux/libnvdimm.h
>>>> +++ b/include/linux/libnvdimm.h
>>>> @@ -284,4 +284,5 @@ static inline void arch_invalidate_pmem(void *addr, size_t size)
>>>>    }
>>>>    #endif
>>>>
>>>> +unsigned long arch_namespace_map_size(void);
>>>
>>> This property is more generic than the nvdimm namespace mapping size,
>>> it's more the fundamental remap granularity that the architecture
>>> supports. So I would expect this to be defined in core header files.
>>> Something like:
>>>
>>> diff --git a/include/linux/io.h b/include/linux/io.h
>>> index a59834bc0a11..58b3b2091dbb 100644
>>> --- a/include/linux/io.h
>>> +++ b/include/linux/io.h
>>> @@ -155,6 +155,13 @@ enum {
>>>    void *memremap(resource_size_t offset, size_t size, unsigned long flags);
>>>    void memunmap(void *addr);
>>>
>>> +#ifndef memremap_min_align
>>> +static inline unsigned int memremap_min_align(void)
>>> +{
>>> +       return PAGE_SIZE;
>>> +}
>>> +#endif
>>> +
>>
>>
>> Should that be memremap_pages_min_align()?
> 
> No, and on second look it needs to be a common value that results in
> properly aligned / sized namespaces across architectures.
> 
> What would it take for Power to make it's minimum mapping granularity
> SUBSECTION_SIZE? The minute that the minimum alignment changes across
> architectures we lose compatibility.
> 
> The namespaces need to be sized such that the mode can be changed freely.
> 

Linux on ppc64 with hash translation use just one page size for direct 
mapping and that is 16MB.

-aneesh

