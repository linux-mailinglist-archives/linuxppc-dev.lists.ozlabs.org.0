Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AC88B3B2D12
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Jun 2021 12:56:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G9cWk3pCMz3bvq
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Jun 2021 20:56:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gtXke96Z;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=gtXke96Z; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G9cWC2kJPz2yQw
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Jun 2021 20:56:06 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15OAiG1e100081; Thu, 24 Jun 2021 06:55:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=wNSxqGQhTBj0s+Qf4Oyzg9MhJXJ1L/N3+JcuRsvBAQE=;
 b=gtXke96Z5AcIw9bPhfocH8eqZy9DxKqKU6mPhvXgCNGiYI594W05wBnG2sHbFwQ5hZkS
 jWt5+0HdxNPPlV45TQ9Grrp0q3VPzRk20lzr2qN+ZdWtWBF2vV5dHy8RxIy0ZK18kS6c
 o/My85EK8gMBjAbmGEUNYTE/K3+shKMl877hkX3hURVuxxXT7bp7YOUAjc+aldgWYkGx
 0ljG+i7QX+2x3+Uk/OSYblq/oczZkcMm+LmZez1CMCoeAQFc1ef+VzKe6n9RAvk6HSVg
 7WxXNPaFyzq2BUoh07JGmEMJvlt8u+4DD8byXoMEIRV+A+Kt2e4wCrze1T2lNYkUSGQD hg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39crj9gaee-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Jun 2021 06:55:57 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15OAiQ6u100367;
 Thu, 24 Jun 2021 06:55:57 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39crj9gads-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Jun 2021 06:55:57 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15OAmNpU000828;
 Thu, 24 Jun 2021 10:55:55 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma05fra.de.ibm.com with ESMTP id 3998789cgj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Jun 2021 10:55:54 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15OAtpmd23921072
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Jun 2021 10:55:51 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AC1244204D;
 Thu, 24 Jun 2021 10:55:51 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C12EF42042;
 Thu, 24 Jun 2021 10:55:49 +0000 (GMT)
Received: from [9.85.116.63] (unknown [9.85.116.63])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 24 Jun 2021 10:55:49 +0000 (GMT)
Subject: Re: [PATCH v4 7/7] powerpc/pseries: Add support for FORM2
 associativity
To: Laurent Dufour <ldufour@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
References: <20210617165105.574178-1-aneesh.kumar@linux.ibm.com>
 <20210617165105.574178-8-aneesh.kumar@linux.ibm.com>
 <6287f135-54a1-5c5e-6a7f-a8e4c0dc5113@linux.ibm.com>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <8d6af1f5-e017-aef4-88e1-78977db91739@linux.ibm.com>
Date: Thu, 24 Jun 2021 16:25:48 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <6287f135-54a1-5c5e-6a7f-a8e4c0dc5113@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: -HpObCP0H1eK9uXWrUVkEz_1BOAbtOUn
X-Proofpoint-GUID: -Dn5sUqrhQ1KKPipuyas5GnlvMK_Alof
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-24_06:2021-06-24,
 2021-06-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 mlxlogscore=999 clxscore=1015 impostorscore=0 phishscore=0
 priorityscore=1501 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104190000 definitions=main-2106240056
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, nvdimm@lists.linux.dev,
 dan.j.williams@intel.com, Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/24/21 4:03 PM, Laurent Dufour wrote:
> Hi Aneesh,
> 
> A little bit of wordsmithing below...
> 
> Le 17/06/2021 à 18:51, Aneesh Kumar K.V a écrit :
>> PAPR interface currently supports two different ways of communicating 
>> resource
>> grouping details to the OS. These are referred to as Form 0 and Form 1
>> associativity grouping. Form 0 is the older format and is now considered
>> deprecated. This patch adds another resource grouping named FORM2.
>>
>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> ---
>>   Documentation/powerpc/associativity.rst   | 135 ++++++++++++++++++++
>>   arch/powerpc/include/asm/firmware.h       |   3 +-
>>   arch/powerpc/include/asm/prom.h           |   1 +
>>   arch/powerpc/kernel/prom_init.c           |   3 +-
>>   arch/powerpc/mm/numa.c                    | 149 +++++++++++++++++++++-
>>   arch/powerpc/platforms/pseries/firmware.c |   1 +
>>   6 files changed, 286 insertions(+), 6 deletions(-)
>>   create mode 100644 Documentation/powerpc/associativity.rst
>>
>> diff --git a/Documentation/powerpc/associativity.rst 
>> b/Documentation/powerpc/associativity.rst
>> new file mode 100644
>> index 000000000000..93be604ac54d
>> --- /dev/null
>> +++ b/Documentation/powerpc/associativity.rst
>> @@ -0,0 +1,135 @@
>> +============================
>> +NUMA resource associativity
>> +=============================
>> +
>> +Associativity represents the groupings of the various platform 
>> resources into
>> +domains of substantially similar mean performance relative to 
>> resources outside
>> +of that domain. Resources subsets of a given domain that exhibit better
>> +performance relative to each other than relative to other resources 
>> subsets
>> +are represented as being members of a sub-grouping domain. This 
>> performance
>> +characteristic is presented in terms of NUMA node distance within the 
>> Linux kernel.
>> +From the platform view, these groups are also referred to as domains.
>> +
>> +PAPR interface currently supports different ways of communicating 
>> these resource
>> +grouping details to the OS. These are referred to as Form 0, Form 1 
>> and Form2
>> +associativity grouping. Form 0 is the older format and is now 
>> considered deprecated.
>> +
>> +Hypervisor indicates the type/form of associativity used via 
>> "ibm,arcitecture-vec-5 property".
>                                                             architecture ^
> 

fixed

>> +Bit 0 of byte 5 in the "ibm,architecture-vec-5" property indicates 
>> usage of Form 0 or Form 1.
>> +A value of 1 indicates the usage of Form 1 associativity. For Form 2 
>> associativity
>> +bit 2 of byte 5 in the "ibm,architecture-vec-5" property is used.
>> +
>> +Form 0
>> +-----
>> +Form 0 associativity supports only two NUMA distance (LOCAL and REMOTE).
>> +
>> +Form 1
>> +-----
>> +With Form 1 a combination of ibm,associativity-reference-points and 
>> ibm,associativity
>> +device tree properties are used to determine the NUMA distance 
>> between resource groups/domains.
>> +
>> +The “ibm,associativity” property contains one or more lists of 
>> numbers (domainID)
>> +representing the resource’s platform grouping domains.
>> +
>> +The “ibm,associativity-reference-points” property contains one or 
>> more list of numbers
>> +(domainID index) that represents the 1 based ordinal in the 
>> associativity lists.
>> +The list of domainID index represnets increasing hierachy of resource 
>> grouping.
>                          represents ^
> 

fixed

>> +
>> +ex:
>> +{ primary domainID index, secondary domainID index, tertiary domainID 
>> index.. }
>> +
>> +Linux kernel uses the domainID at the primary domainID index as the 
>> NUMA node id.
>> +Linux kernel computes NUMA distance between two domains by 
>> recursively comparing
>> +if they belong to the same higher-level domains. For mismatch at 
>> every higher
>> +level of the resource group, the kernel doubles the NUMA distance 
>> between the
>> +comparing domains.
>> +
>> +Form 2
>> +-------
>> +Form 2 associativity format adds separate device tree properties 
>> representing NUMA node distance
>> +thereby making the node distance computation flexible. Form 2 also 
>> allows flexible primary
>> +domain numbering. With numa distance computation now detached from 
>> the index value of
>> +"ibm,associativity" property, Form 2 allows a large number of primary 
>> domain ids at the
>> +same domainID index representing resource groups of different 
>> performance/latency characteristics.
>> +
>> +Hypervisor indicates the usage of FORM2 associativity using bit 2 of 
>> byte 5 in the
>> +"ibm,architecture-vec-5" property.
>> +
>> +"ibm,numa-lookup-index-table" property contains one or more list 
>> numbers representing
>> +the domainIDs present in the system. The offset of the domainID in 
>> this property is considered
>> +the domainID index.
>> +
>> +prop-encoded-array: The number N of the domainIDs encoded as with 
>> encode-int, followed by
>> +N domainID encoded as with encode-int
>> +
>> +For ex:
>> +ibm,numa-lookup-index-table =  {4, 0, 8, 250, 252}, domainID index 
>> for domainID 8 is 1.
>> +
>> +"ibm,numa-distance-table" property contains one or more list of 
>> numbers representing the NUMA
>> +distance between resource groups/domains present in the system.
>> +
>> +prop-encoded-array: The number N of the distance values encoded as 
>> with encode-int, followed by
>> +N distance values encoded as with encode-bytes. The max distance 
>> value we could encode is 255.
>> +
>> +For ex:
>> +ibm,numa-lookup-index-table =  {3, 0, 8, 40}
>> +ibm,numa-distance-table     =  {9, 10, 20, 80, 20, 10, 160, 80, 160, 10}
>> +
>> +  | 0    8   40
>> +--|------------
>> +  |
>> +0 | 10   20  80
>> +  |
>> +8 | 20   10  160
>> +  |
>> +40| 80   160  10
>> +
>> +
>> +"ibm,associativity" property for resources in node 0, 8 and 40
>> +
>> +{ 3, 6, 7, 0 }
>> +{ 3, 6, 9, 8 }
>> +{ 3, 6, 7, 40}
>> +
>> +With "ibm,associativity-reference-points"  { 0x3 }
>> +
>> +Each resource (drcIndex) now also supports additional optional device 
>> tree properties.
>> +These properties are marked optional because the platform can choose 
>> not to export
>> +them and provide the system topology details using the earlier 
>> defined device tree
>> +properties alone. The optional device tree properties are used when 
>> adding new resources
>> +(DLPAR) and when the platform didn't provide the topology details of 
>> the domain which
>> +contains the newly added resource during boot.
>> +
>> +"ibm,numa-lookup-index" property contains a number representing the 
>> domainID index to be used
>> +when building the NUMA distance of the numa node to which this 
>> resource belongs. This can
>> +be looked at as the index at which this new domainID would have 
>> appeared in
>> +"ibm,numa-lookup-index-table" if the domain was present during boot. 
>> The domainID
>> +of the new resource can be obtained from the existing 
>> "ibm,associativity" property. This
>> +can be used to build distance information of a newly onlined NUMA 
>> node via DLPAR operation.
>> +The value is 1 based array index value.
>> +
>> +prop-encoded-array: An integer encoded as with encode-int specifying 
>> the domainID index
>> +
>> +"ibm,numa-distance" property contains one or more list of numbers 
>> presenting the NUMA distance
>> +from this resource domain to other resources.
>> +
>> +prop-encoded-array: The number N of the distance values encoded as 
>> with encode-int, followed by
>> +N distance values encoded as with encode-bytes. The max distance 
>> value we could encode is 255.
>> +
>> +For ex:
>> +ibm,associativity     = { 4, 5, 10, 50}
> 
> Is missing the first byte of the property (length) or an associativity 
> number?
> 

that should be {3, 5,10,50}  fixed.

>> +ibm,numa-lookup-index = { 4 }
>> +ibm,numa-distance   =  {8, 160, 255, 80, 10, 160, 255, 80, 10}
>> +
>> +resulting in a new toplogy as below.
>> +  | 0    8   40   50
>> +--|------------------
>> +  |
>> +0 | 10   20  80   160
>> +  |
>> +8 | 20   10  160  255
>> +  |
>> +40| 80   160  10  80
>> +  |
>> +50| 160  255  80  10
>> +
>> diff --git a/arch/powerpc/include/asm/firmware.h 
>> b/arch/powerpc/include/asm/firmware.h
>> index 60b631161360..97a3bd9ffeb9 100644
>> --- a/arch/powerpc/include/asm/firmware.h
>> +++ b/arch/powerpc/include/asm/firmware.h
>

...

>> +    numa_distancep = of_get_property(node, "ibm,numa-distance", NULL);
>> +    if (!numa_distancep)
>> +        return;
>> +
>> +    numa_indexp = of_get_property(node, "ibm,numa-lookup-index", NULL);
>> +    if (!numa_indexp)
>> +        return;
>> +
>> +    numa_index = of_read_number(numa_indexp, 1);
>> +    /*
>> +     * update the numa_id_index_table. Device tree look at index 
>> table as
>> +     * 1 based array indexing.
>> +     */
>> +    numa_id_index_table[numa_index - 1] = nid;
>> +
>> +    max_numa_index = of_read_number((const __be32 *)numa_distancep, 1);
>> +    VM_WARN_ON(max_numa_index != 2 * numa_index);
> 
> Could you explain shortly in a comment the meaning of this VM_WARN_ON 
> check?
> 

Based on the other review feedback this is dropped. We now derive domain 
distance offset based on the number of elements in "ibm,numa-distance"

>> +    /* Skip the size which is encoded int */
>> +    numa_distancep += sizeof(__be32);
>> +
>> +    /*
>> +     * First fill the distance information from other node to this node.
>> +     */
>> +    other_nid_index = 0;
>> +    for (i = 0; i < numa_index; i++) {
>> +        numa_distance = numa_distancep[i];
>> +        other_nid = numa_id_index_table[other_nid_index++];
>> +        numa_distance_table[other_nid][nid] = numa_distance;
>> +    }
>> +
>> +    other_nid_index = 0;
>> +    for (; i < max_numa_index; i++) {
>> +        numa_distance = numa_distancep[i];
>> +        other_nid = numa_id_index_table[other_nid_index++];
>> +        numa_distance_table[nid][other_nid] = numa_distance;
>> +    }
>> +}
>> +

Thanks for reviewing the patch.

-aneesh
