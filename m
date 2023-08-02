Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CFC476D31D
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Aug 2023 17:58:11 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rNzKRaea;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RGGpm66TMz3cCb
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 01:58:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rNzKRaea;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RGGnr3w4cz2yD8
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Aug 2023 01:57:19 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 372FmfMj016758;
	Wed, 2 Aug 2023 15:57:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=UsmY3/6Kn8L9keeIZr04vLXviQCHfw9UeyBPatlFKjs=;
 b=rNzKRaeaDUhCTPYW1r47bItWLsHSXwuSCYirhbYzh3tUGEfpA96V1E7O50ygjtr1vNFE
 PP0D30i8BcrNcPc/Q2vXN2vO2M50/NL5cdBxmMWjzp02Mczk59oxkdGicQ1AHook8FWI
 k4IG8x3uPjj3TLpskFk3xLr4qv5uFd/lksyoVYVM9mnkiVFDwr9EMyRoIIPlQh7jvq/i
 96xzjTxWurKugs+U0qh24NQr+QASVWZcbC+4O/NzV+6sHK18BsLJFuFrRwHzTZy6O8/+
 9HhCQE9Yl6WIha5UmX9xebbBC05E3Cd/VxJrEPYjUXrNSQB5bbOfucf+Bkky1wpPs10S sg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s7t45r5jn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Aug 2023 15:57:06 +0000
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 372FmjCT016927;
	Wed, 2 Aug 2023 15:57:06 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s7t45r5j5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Aug 2023 15:57:06 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 372FeOmO014537;
	Wed, 2 Aug 2023 15:57:05 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3s5ft1n698-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Aug 2023 15:57:04 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 372Fv3sK38142626
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 2 Aug 2023 15:57:03 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5216E20043;
	Wed,  2 Aug 2023 15:57:03 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5942E20040;
	Wed,  2 Aug 2023 15:57:01 +0000 (GMT)
Received: from [9.43.11.83] (unknown [9.43.11.83])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  2 Aug 2023 15:57:01 +0000 (GMT)
Message-ID: <6f66dfcc-3d2a-c47c-1b84-c0d5210564d6@linux.ibm.com>
Date: Wed, 2 Aug 2023 21:27:00 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v7 7/7] mm/memory_hotplug: Enable runtime update of
 memmap_on_memory parameter
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, Michal Hocko <mhocko@suse.com>
References: <20230801044116.10674-1-aneesh.kumar@linux.ibm.com>
 <20230801044116.10674-8-aneesh.kumar@linux.ibm.com>
 <ZMjJPFcXlt+aeCUB@dhcp22.suse.cz>
 <a32fe748-fa18-bd92-3a10-5da8dbad96e6@linux.ibm.com>
 <ZMjjbKnxZXSNcJL5@dhcp22.suse.cz>
 <c1e6e3f6-2e3a-c098-ae78-0d86de8a3a95@linux.ibm.com>
 <ZMp7Vr8PbfoADQw0@dhcp22.suse.cz>
 <31305ab7-1e65-80aa-ee91-9190c8f67430@redhat.com>
From: Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>
In-Reply-To: <31305ab7-1e65-80aa-ee91-9190c8f67430@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: xyuVu8gHNdrGGVc6nLYPzEg4Qgmf2wli
X-Proofpoint-ORIG-GUID: _XITVjbX84zCYtpnyH8n390p-lCvpnvN
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-02_12,2023-08-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=842
 suspectscore=0 priorityscore=1501 mlxscore=0 spamscore=0 impostorscore=0
 phishscore=0 malwarescore=0 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2308020138
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
Cc: linux-mm@kvack.org, npiggin@gmail.com, Vishal Verma <vishal.l.verma@intel.com>, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 8/2/23 9:24 PM, David Hildenbrand wrote:
> On 02.08.23 17:50, Michal Hocko wrote:
>> On Wed 02-08-23 10:15:04, Aneesh Kumar K V wrote:
>>> On 8/1/23 4:20 PM, Michal Hocko wrote:
>>>> On Tue 01-08-23 14:58:29, Aneesh Kumar K V wrote:
>>>>> On 8/1/23 2:28 PM, Michal Hocko wrote:
>>>>>> On Tue 01-08-23 10:11:16, Aneesh Kumar K.V wrote:
>>>>>>> Allow updating memmap_on_memory mode after the kernel boot. Memory
>>>>>>> hotplug done after the mode update will use the new mmemap_on_memory
>>>>>>> value.
>>>>>>
>>>>>> Well, this is a user space kABI extension and as such you should spend
>>>>>> more words about the usecase. Why we could live with this static and now
>>>>>> need dynamic?
>>>>>>
>>>>>
>>>>> This enables easy testing of memmap_on_memory feature without a kernel reboot.
>>>>
>>>> Testing alone is rather weak argument to be honest.
>>>>
>>>>> I also expect people wanting to use that when they find dax kmem memory online
>>>>> failing because of struct page allocation failures[1]. User could reboot back with
>>>>> memmap_on_memory=y kernel parameter. But being able to enable it via sysfs makes
>>>>> the feature much more useful.
>>>>
>>>> Sure it can be useful but that holds for any feature, right. The main
>>>> question is whether this is worth maintaing. The current implementation
>>>> seems rather trivial which is an argument to have it but are there any
>>>> risks long term? Have you evaluated a potential long term maintenance
>>>> cost? There is no easy way to go back and disable it later on without
>>>> breaking some userspace.
>>>>
>>>> All that should be in the changelog!
>>>
>>> I updated it as below.
>>>
>>> mm/memory_hotplug: Enable runtime update of memmap_on_memory parameter
>>>
>>> Allow updating memmap_on_memory mode after the kernel boot. Memory
>>> hotplug done after the mode update will use the new mmemap_on_memory
>>> value.
>>>
>>> It is now possible to test the memmap_on_memory feature easily without
>>> the need for a kernel reboot. Additionally, for those encountering
>>> struct page allocation failures while using dax kmem memory online, this
>>> feature may prove useful. Instead of rebooting with the
>>> memmap_on_memory=y kernel parameter, users can now enable it via sysfs,
>>> which greatly enhances its usefulness.
>>
>>
>> I do not really see a solid argument why rebooting is really a problem
>> TBH. Also is the global policy knob really the right fit for existing
>> hotplug usecases? In other words, if we really want to make
>> memmap_on_memory more flexible would it make more sense to have it per
>> memory block property instead (the global knob being the default if
>> admin doesn't specify it differently).
> 
> Per memory block isn't possible, due to the creation order. Also, I think it's not the right approach.
> 
> I thought about driver toggles. At least for dax/kmem people are looking into that:
> 
> https://lkml.kernel.org/r/20230801-vv-kmem_memmap-v3-2-406e9aaf5689@intel.com
> 
> Where that can also be toggled per device.
> 

That still is dependent on the global memmap_on_memory enabled right? We could make the dax facility independent of the
global feature toggle? 

-aneesh
