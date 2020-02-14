Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0179A15F775
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Feb 2020 21:09:23 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48K4GS5vR4zDqj1
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Feb 2020 07:09:20 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Jzz02pqzzDqFp
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Feb 2020 03:55:39 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01EGo5dn132006
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Feb 2020 11:55:36 -0500
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2y5jxu0e3f-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Feb 2020 11:55:36 -0500
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <aneesh.kumar@linux.ibm.com>;
 Fri, 14 Feb 2020 16:55:34 -0000
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 14 Feb 2020 16:55:32 -0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01EGtV7W27656442
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 Feb 2020 16:55:31 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 52E7711C05C;
 Fri, 14 Feb 2020 16:55:31 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C111711C04A;
 Fri, 14 Feb 2020 16:55:29 +0000 (GMT)
Received: from [9.85.93.41] (unknown [9.85.93.41])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 14 Feb 2020 16:55:29 +0000 (GMT)
Subject: Re: [PATCH v2 2/4] libnvdimm/namespace: Enforce
 memremap_compat_align()
To: Jeff Moyer <jmoyer@redhat.com>, Dan Williams <dan.j.williams@intel.com>
References: <158155489850.3343782.2687127373754434980.stgit@dwillia2-desk3.amr.corp.intel.com>
 <158155490897.3343782.14216276134794923581.stgit@dwillia2-desk3.amr.corp.intel.com>
 <x49k14q5ezs.fsf@segfault.boston.devel.redhat.com>
 <CAPcyv4hQouRNBcJ4uZ2mysr_aKstLhvUf66gRQ_3QoQNyOy72g@mail.gmail.com>
 <x49h7ztdsp5.fsf@segfault.boston.devel.redhat.com>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Date: Fri, 14 Feb 2020 22:25:28 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <x49h7ztdsp5.fsf@segfault.boston.devel.redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 20021416-0028-0000-0000-000003DB0464
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20021416-0029-0000-0000-000024A0047E
Message-Id: <0843d8bf-c9e4-37c9-d9c2-ba4407daae21@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-14_05:2020-02-12,
 2020-02-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 impostorscore=0 mlxlogscore=999
 bulkscore=0 adultscore=0 mlxscore=0 suspectscore=0 clxscore=1015
 spamscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002140127
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
Cc: Vishal L Verma <vishal.l.verma@intel.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-nvdimm <linux-nvdimm@lists.01.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2/14/20 10:14 PM, Jeff Moyer wrote:
> Dan Williams <dan.j.williams@intel.com> writes:
> 
>> On Thu, Feb 13, 2020 at 1:55 PM Jeff Moyer <jmoyer@redhat.com> wrote:
>>>
>>> Dan Williams <dan.j.williams@intel.com> writes:
>>>
>>>> The pmem driver on PowerPC crashes with the following signature when
>>>> instantiating misaligned namespaces that map their capacity via
>>>> memremap_pages().
>>>>
>>>>      BUG: Unable to handle kernel data access at 0xc001000406000000
>>>>      Faulting instruction address: 0xc000000000090790
>>>>      NIP [c000000000090790] arch_add_memory+0xc0/0x130
>>>>      LR [c000000000090744] arch_add_memory+0x74/0x130
>>>>      Call Trace:
>>>>       arch_add_memory+0x74/0x130 (unreliable)
>>>>       memremap_pages+0x74c/0xa30
>>>>       devm_memremap_pages+0x3c/0xa0
>>>>       pmem_attach_disk+0x188/0x770
>>>>       nvdimm_bus_probe+0xd8/0x470
>>>>
>>>> With the assumption that only memremap_pages() has alignment
>>>> constraints, enforce memremap_compat_align() for
>>>> pmem_should_map_pages(), nd_pfn, or nd_dax cases.
>>>>
>>>> Reported-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>>>> Cc: Jeff Moyer <jmoyer@redhat.com>
>>>> Reviewed-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>>>> Link: https://lore.kernel.org/r/158041477336.3889308.4581652885008605170.stgit@dwillia2-desk3.amr.corp.intel.com
>>>> Signed-off-by: Dan Williams <dan.j.williams@intel.com>
>>>> ---
>>>>   drivers/nvdimm/namespace_devs.c |   10 ++++++++++
>>>>   1 file changed, 10 insertions(+)
>>>>
>>>> diff --git a/drivers/nvdimm/namespace_devs.c b/drivers/nvdimm/namespace_devs.c
>>>> index 032dc61725ff..aff1f32fdb4f 100644
>>>> --- a/drivers/nvdimm/namespace_devs.c
>>>> +++ b/drivers/nvdimm/namespace_devs.c
>>>> @@ -1739,6 +1739,16 @@ struct nd_namespace_common *nvdimm_namespace_common_probe(struct device *dev)
>>>>                return ERR_PTR(-ENODEV);
>>>>        }
>>>>
>>>> +     if (pmem_should_map_pages(dev) || nd_pfn || nd_dax) {
>>>> +             struct nd_namespace_io *nsio = to_nd_namespace_io(&ndns->dev);
>>>> +             resource_size_t start = nsio->res.start;
>>>> +
>>>> +             if (!IS_ALIGNED(start | size, memremap_compat_align())) {
>>>> +                     dev_dbg(&ndns->dev, "misaligned, unable to map\n");
>>>> +                     return ERR_PTR(-EOPNOTSUPP);
>>>> +             }
>>>> +     }
>>>> +
>>>>        if (is_namespace_pmem(&ndns->dev)) {
>>>>                struct nd_namespace_pmem *nspm;
>>>>
>>>
>>> Actually, I take back my ack.  :) This prevents a previously working
>>> namespace from being successfully probed/setup.
>>
>> Do you have a test case handy? I can see a potential gap with a
>> namespace that used internal padding to fix up the alignment.
> 
> # ndctl list -v -n namespace0.0
> [
>    {
>      "dev":"namespace0.0",
>      "mode":"fsdax",
>      "map":"dev",
>      "size":52846133248,
>      "uuid":"b99f6f6a-2909-4189-9bfa-6eeebd95d40e",
>      "raw_uuid":"aff43777-015b-493f-bbf9-7c7b0fe33519",
>      "sector_size":512,
>      "align":4096,
>      "blockdev":"pmem0",
>      "numa_node":0
>    }
> ]
> 
> # cat /sys/bus/nd/devices/region0/mappings
> 6
> 
> # grep namespace0.0 /proc/iomem
>    1860000000-24e0003fff : namespace0.0
> 
>> The goal of this check is to catch cases that are just going to fail
>> devm_memremap_pages(), and the expectation is that it could not have
>> worked before unless it was ported from another platform, or someone
>> flipped the page-size switch on PowerPC.
> 
> On x86, creation and probing of the namespace worked fine before this
> patch.  What *doesn't* work is creating another fsdax namespace after
> this one.  sector mode namespaces can still be created, though:
> 
> [
>    {
>      "dev":"namespace0.1",
>      "mode":"sector",
>      "size":53270768640,
>      "uuid":"67ea2c74-d4b1-4fc9-9c1a-a7d2a6c2a4a7",
>      "sector_size":512,
>      "blockdev":"pmem0.1s"
>    },
> 
> # grep namespace0.1 /proc/iomem
>    24e0004000-3160007fff : namespace0.1
> 
>>> I thought we were only going to enforce the alignment for a newly
>>> created namespace?  This should only check whether the alignment
>>> works for the current platform.
>>
>> The model is a new default 16MB alignment is enforced at creation
>> time, but if you need to support previously created namespaces then
>> you can manually trim that alignment requirement to no less than
>> memremap_compat_align() because that's the point at which
>> devm_memremap_pages() will start failing or crashing.
> 
> The problem is that older kernels did not enforce alignment to
> SUBSECTION_SIZE.  We shouldn't prevent those namespaces from being
> accessed.  The probe itself will not cause the WARN_ON to trigger.
> Creating new namespaces at misaligned addresses could, but you've
> altered the free space allocation such that we won't hit that anymore.
> 
> If I drop this patch, the probe will still work, and allocating new
> namespaces will also work:
> 
> # ndctl list
> [
>    {
>      "dev":"namespace0.1",
>      "mode":"sector",
>      "size":53270768640,
>      "uuid":"67ea2c74-d4b1-4fc9-9c1a-a7d2a6c2a4a7",
>      "sector_size":512,
>      "blockdev":"pmem0.1s"
>    },
>    {
>      "dev":"namespace0.0",
>      "mode":"fsdax",
>      "map":"dev",
>      "size":52846133248,
>      "uuid":"b99f6f6a-2909-4189-9bfa-6eeebd95d40e",
>      "sector_size":512,
>      "align":4096,
>      "blockdev":"pmem0"
>    }
> ]
>   ndctl create-namespace -m fsdax -s 36g -r 0
> {
>    "dev":"namespace0.2",
>    "mode":"fsdax",
>    "map":"dev",
>    "size":"35.44 GiB (38.05 GB)",
>    "uuid":"7893264c-c7ef-4cbe-95e1-ccf2aff041fb",
>    "sector_size":512,
>    "align":2097152,
>    "blockdev":"pmem0.2"
> }
> 
> proc/iomem:
> 
> 1860000000-d55fffffff : Persistent Memory
>    1860000000-24e0003fff : namespace0.0
>    24e0004000-3160007fff : namespace0.1
>    3162000000-3a61ffffff : namespace0.2
> 
> So, maybe the right thing is to make memremap_compat_align return
> PAGE_SIZE for x86 instead of SUBSECTION_SIZE?
> 


I did that as part of 
https://lore.kernel.org/linux-nvdimm/20200120140749.69549-2-aneesh.kumar@linux.ibm.com 
and applied the subsection details only when creating new namespace

https://lore.kernel.org/linux-nvdimm/20200120140749.69549-4-aneesh.kumar@linux.ibm.com


But I do agree with the approach that in-order to create a compatible 
namespace we need enforce max possible align value across all supported 
architectures.


On POWER we should still be able to enforce SUBSECTION_SIZE 
restrictions. We did put that as document w.r.t. distributions like Suse 
https://www.suse.com/support/kb/doc/?id=7024300



-aneesh

