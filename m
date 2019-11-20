Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A1F103205
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 04:21:46 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47HnzX0xxczDqsw
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 14:21:44 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Hnwl1Hp5zDqll
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Nov 2019 14:19:18 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAK38LL8095039; Tue, 19 Nov 2019 22:19:09 -0500
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2wcf5ncnvj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Nov 2019 22:19:09 -0500
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xAK39j4G017134;
 Wed, 20 Nov 2019 03:19:08 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma05wdc.us.ibm.com with ESMTP id 2wa8r6h3ms-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Nov 2019 03:19:08 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xAK3J6Fo55378276
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Nov 2019 03:19:06 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5C5AB6A04F;
 Wed, 20 Nov 2019 03:19:06 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CAE256A047;
 Wed, 20 Nov 2019 03:19:04 +0000 (GMT)
Received: from [9.199.42.251] (unknown [9.199.42.251])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 20 Nov 2019 03:19:04 +0000 (GMT)
Subject: Re: [RFC PATCH 1/4] libnvdimm/namespace: Make namespace size
 validation arch dependent
To: Dan Williams <dan.j.williams@intel.com>
References: <20191028094825.21448-1-aneesh.kumar@linux.ibm.com>
 <CAPcyv4gZ=wKzwscu_nch8VUtNTHusKzjmMhYZWo+Se=BPO9q8g@mail.gmail.com>
 <6f85f4af-788d-aaef-db64-ab8d3faf6b1b@linux.ibm.com>
 <CAPcyv4gMnSe26QfSBABx0zj3XuFqy=K1XaGnmE3h3sP3Y76nRw@mail.gmail.com>
 <4c6e5743-663e-853b-2203-15c809965965@linux.ibm.com>
 <CAPcyv4h42_1deZDaaW1RqX0Ls+maiFO_1e=6xJuHTa3wdWvVvA@mail.gmail.com>
 <87o8xp5lo9.fsf@linux.ibm.com> <8736eohva1.fsf@linux.ibm.com>
 <CAPcyv4hroohsrXT1YHQB-L8ZFa2kUW+bKy03We4Mt7afeJgu3Q@mail.gmail.com>
 <87o8x9h5qa.fsf@linux.ibm.com>
 <CAPcyv4gv52NK4+=3wcJ2uKX7xnaYVaF-H6O-XfJK8MiRX60SBg@mail.gmail.com>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <7e9a19c1-992f-a92a-172d-bcbad1298c41@linux.ibm.com>
Date: Wed, 20 Nov 2019 08:49:02 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <CAPcyv4gv52NK4+=3wcJ2uKX7xnaYVaF-H6O-XfJK8MiRX60SBg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-19_08:2019-11-15,2019-11-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=999 phishscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1911200028
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-nvdimm <linux-nvdimm@lists.01.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11/19/19 11:28 PM, Dan Williams wrote:
> On Mon, Nov 18, 2019 at 1:52 AM Aneesh Kumar K.V
> <aneesh.kumar@linux.ibm.com> wrote:
>>
>> Dan Williams <dan.j.williams@intel.com> writes:
>>
>>> On Sat, Nov 16, 2019 at 4:15 AM Aneesh Kumar K.V
>>> <aneesh.kumar@linux.ibm.com> wrote:
>>>>
>>
>> ....
>>
>>
>>>>
>>>> Considering the direct-map map size is not going to be user selectable,
>>>> do you agree that we can skip the above step 0 configuration you
>>>> suggested.
>>>>
>>>> The changes proposed in the patch series essentially does the rest.
>>>>
>>>> 1) It validate the size against the arch specific limit during
>>>> namespace creation. (part of step 1)
>>>
>>> This validation is a surprise failure to ndctl.
>>>
>>>> 2) It also disable initializing a region if it find the size not
>>>> correctly aligned as per the platform requirement.
>>>
>>> There needs to be a way for the user to discover the correct alignment
>>> that the kernel will accept.
>>>
>>>> 3) Direct map  mapping size is different from supported_alignment for a
>>>> namespace. The supported alignment controls what possible PAGE SIZE user want the
>>>> namespace to be mapped to user space.
>>>
>>> No, the namespace alignment is different than the page mapping size.
>>> The alignment is only interpreted as a mapping size at the device-dax
>>> level, otherwise at the raw namespace level it's just an arbitrary
>>> alignment.
>>>
>>>> With the above do you think the current patch series is good?
>>>
>>> I don't think we've quite converged on a solution.
>>
>> How about we make it a property of seed device. ie,
>> we add `supported_size_align` RO attribute to the seed device. ndctl can
>> use this to validate the size value. So this now becomes step0
>>
>> sys/bus/nd/devices/region0> cat btt0.0/supported_size_align
>> 16777216
>> /sys/bus/nd/devices/region0> cat pfn0.0/supported_size_align
>> 16777216
>> /sys/bus/nd/devices/region0> cat dax0.0/supported_size_align
>> 16777216
> 
> Why on those devices and not namespace0.0?

sure.

> 
>> We follow that up with validating the size value written to size
>> attribute(step 1).
>>
>> While initializing the namespaces already present in a region we again
>> validate the size and if not properly aligned we mark the region
>> disabled.
> 
> The region might have a mix of namespaces, some aligned and some not,
> only the misaligned namespaces should fail to enable. The region
> should otherwise enable successfully.
> 

One misaligned namespace would mean, we get other namespace resource 
start addr wrongly aligned. If we allow regions to be enabled with 
namespace with wrong size, user would find further namespace creation in 
that regions failing due to wrongly aligned resource start. IMHO that is 
a confusing user experience.

-aneesh
