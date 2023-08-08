Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D067F773830
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Aug 2023 08:30:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Wnd32b7W;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RKjxM3cbKz30PY
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Aug 2023 16:30:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Wnd32b7W;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RKjwK56Rgz2yt6
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Aug 2023 16:29:53 +1000 (AEST)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3786LFlh001796;
	Tue, 8 Aug 2023 06:29:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=/K+iyWmpHfwFJUA4J+GYS5VEGZyeglN1XkoMxkXLjpQ=;
 b=Wnd32b7WZ3n8HpMJLUzzF2UyYrUh9mqdicgHHdKMISLegQdK/dhBjzhlI4wmKtkVr8K1
 Zbzmb1aHsKgpwuJr9yLAnVHpSBwa+GOgqK5s09RDNnP5ytk8un5nKYchd6WUhLSMqQRl
 aaUufdC4dYcgRnzCgSHzPtcbCG5Fszrir1dopT2oDlV2m6FjAUwLimjsL2q97kvd3OcA
 Q83VKJunkPNm4BdT8d3laZl8K9dbm5YGK32ly1E8RtgiUVC68FP9wuRrmpvT6E+86yoh
 jcTERUXgY0fcvnbI5/mCN9Zl7tiZeN7cznczwl5Yn3Wz3rPa/YN+CllJPs3GubYuZFV0 Tg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sbg4wrhha-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Aug 2023 06:29:39 +0000
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3786NhAH009057;
	Tue, 8 Aug 2023 06:29:39 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sbg4wrhg8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Aug 2023 06:29:39 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 37864YBJ001772;
	Tue, 8 Aug 2023 06:29:37 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3sa3f1khrg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Aug 2023 06:29:37 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3786TaqA39846272
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 8 Aug 2023 06:29:36 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 222792004B;
	Tue,  8 Aug 2023 06:29:36 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4B04720040;
	Tue,  8 Aug 2023 06:29:34 +0000 (GMT)
Received: from [9.109.212.144] (unknown [9.109.212.144])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  8 Aug 2023 06:29:34 +0000 (GMT)
Message-ID: <41ffec19-775a-534b-b217-438d3bd8b94e@linux.ibm.com>
Date: Tue, 8 Aug 2023 11:59:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v7 7/7] mm/memory_hotplug: Enable runtime update of
 memmap_on_memory parameter
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, Michal Hocko <mhocko@suse.com>
References: <a32fe748-fa18-bd92-3a10-5da8dbad96e6@linux.ibm.com>
 <ZMjjbKnxZXSNcJL5@dhcp22.suse.cz>
 <c1e6e3f6-2e3a-c098-ae78-0d86de8a3a95@linux.ibm.com>
 <ZMp7Vr8PbfoADQw0@dhcp22.suse.cz>
 <31305ab7-1e65-80aa-ee91-9190c8f67430@redhat.com>
 <ZMqLV2S6vY0cZxbp@dhcp22.suse.cz> <ZMtqu76Tgh9jj+AI@dhcp22.suse.cz>
 <1c6a74f0-85e9-5299-1520-9068e842b1a5@redhat.com>
 <ZMuP7gsxQzAmRpNX@dhcp22.suse.cz>
 <d71a85b1-c0ea-6451-d65c-d7c5040caf77@linux.ibm.com>
 <ZNDjHbtm3jaWS8h8@dhcp22.suse.cz>
 <a32a9e7f-1e24-bab1-cb73-8058fed3b59c@redhat.com>
 <b6753402-2de9-25b2-36e9-eacd49752b19@redhat.com>
From: Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>
In-Reply-To: <b6753402-2de9-25b2-36e9-eacd49752b19@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: jcR45jUlNkJaaYiS7nzigDjHGol2Jlxe
X-Proofpoint-GUID: GmlyqABiyau630WTndx2icKHqAnytggP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-08_04,2023-08-03_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=810 mlxscore=0 adultscore=0 clxscore=1011
 bulkscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308080054
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

On 8/8/23 12:05 AM, David Hildenbrand wrote:
> On 07.08.23 14:41, David Hildenbrand wrote:
>> On 07.08.23 14:27, Michal Hocko wrote:
>>> On Sat 05-08-23 19:54:23, Aneesh Kumar K V wrote:
>>> [...]
>>>> Do you see a need for firmware-managed memory to be hotplugged in with
>>>> different memory block sizes?
>>>
>>> In short. Yes. Slightly longer, a fixed size memory block semantic is
>>> just standing in the way and I would even argue it is actively harmful.
>>> Just have a look at ridicously small memory blocks on ppc. I do
>>> understand that it makes some sense to be aligned to the memory model
>>> (so sparsmem section aligned). In an ideal world, memory hotplug v2
>>> interface (if we ever go that path) should be physical memory range based.
>>
>> Yes, we discussed that a couple of times already (and so far nobody
>> cared to implement any of that).
>>
>> Small memory block sizes are very beneficial for use cases like PPC
>> dlar, virtio-mem, hyperv-balloon, ... essentially in most virtual
>> environments where you might want to add/remove memory in very small
>> granularity. I don't see that changing any time soon. Rather the opposite.
>>
>> Small memory block sizes are suboptimal for large machines where you
>> might never end up removing such memory (boot memory), or when dealing
>> with devices that can only be removed in one piece (DIMM/kmem). We
>> already have memory groups in place to model that.
>>
>> For the latter it might be beneficial to have memory blocks of larger
>> size that correspond to the physical memory ranges. That might also make
>> a memmap (re-)configuration easier.
>>
>> Not sure if that is standing in any way or is harmful, though.
>>
> 
> Just because I thought of something right now, I'll share it, maybe it makes sense.
> 
> Assume when we get add_memory*(MHP_MEMMAP_ON_MEMORY) and it is enabled by the admin:
> 
> 1) We create a single altmap at the beginning of the memory
> 
> 2) We create the existing fixed-size memory block devices, but flag them
>    to be part of a single "altmap" unit.
> 
> 3) Whenever we trigger offlining of a single such memory block, we
>    offline *all* memory blocks belonging to that altmap, essentially
>    using a single offline_pages() call and updating all memory block
>    states accordingly.
> 
> 4) Whenever we trigger onlining of a single such memory block, we
>    online *all* memory blocks belonging to that altmap, using a single
>    online_pages() call.
> 
> 5) We fail remove_memory() if it doesn't cover the same (altmap) range.
> 
> So we can avoid having a memory block v2 (and all that comes with that ...) for now and still get that altmap stuff sorted out. As that altmap behavior can be controlled by the admin, we should be fine for now.
> 
> I think all memory notifiers should already be able to handle bigger granularity, but it would be easy to check. Some internal things might require a bit of tweaking.
> 

We can look at the possibility of using the altmap space reserved for a namespace (via option -M dev) for allocating struct page memory even with dax/kmem. 

-aneesh

