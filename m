Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8FA277101F
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Aug 2023 16:25:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=keNq2p0C;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RJ4cg2BmRz3cTd
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Aug 2023 00:25:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=keNq2p0C;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RJ4bg6l7Hz2y1d
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  6 Aug 2023 00:24:47 +1000 (AEST)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 375E99Dw028596;
	Sat, 5 Aug 2023 14:24:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=sHMyFPhLaq4AEGvZpLfrIyL6/Kz4Sel++511eSM5fig=;
 b=keNq2p0CWFvyG4P4DB7ButV4DaExADV8slwb6CMdVDzFmC+1hK+v2eSqWIWjJ+1Y+28y
 YQakygVhrny7SrGAeV76WazloATizyWh1XwAW35JnfCwRw0Tr35HUKHa8ZCIwdcryY/z
 wdVyTgz8PwryhjAKXmDGIFqUXzJHnzot4y5asVKxXvgAU53tFVtlyAAn8uhZ/Kst0VbQ
 qT+d72WJxX/A7rcTlK9wctR16sztS8l9/k4nBFiNWHVrbOUWMS6d5zofW2FycfYK9MX7
 5bvmaLxbaeE4HZdA8to4g0mWW+UswVbFq/32sJEIA3zoZeAAfDUj5ibg6KpDhQRb/+cl gw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s9qt8g8yp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 05 Aug 2023 14:24:30 +0000
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 375EFfqT016702;
	Sat, 5 Aug 2023 14:24:29 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s9qt8g8yj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 05 Aug 2023 14:24:28 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 375CFuk8021591;
	Sat, 5 Aug 2023 14:24:28 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3s8kmcpq1d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 05 Aug 2023 14:24:28 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 375EOQT614353088
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 5 Aug 2023 14:24:26 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 62C642004B;
	Sat,  5 Aug 2023 14:24:26 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 753B920040;
	Sat,  5 Aug 2023 14:24:24 +0000 (GMT)
Received: from [9.43.27.99] (unknown [9.43.27.99])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat,  5 Aug 2023 14:24:24 +0000 (GMT)
Message-ID: <d71a85b1-c0ea-6451-d65c-d7c5040caf77@linux.ibm.com>
Date: Sat, 5 Aug 2023 19:54:23 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v7 7/7] mm/memory_hotplug: Enable runtime update of
 memmap_on_memory parameter
Content-Language: en-US
To: Michal Hocko <mhocko@suse.com>, David Hildenbrand <david@redhat.com>
References: <20230801044116.10674-8-aneesh.kumar@linux.ibm.com>
 <ZMjJPFcXlt+aeCUB@dhcp22.suse.cz>
 <a32fe748-fa18-bd92-3a10-5da8dbad96e6@linux.ibm.com>
 <ZMjjbKnxZXSNcJL5@dhcp22.suse.cz>
 <c1e6e3f6-2e3a-c098-ae78-0d86de8a3a95@linux.ibm.com>
 <ZMp7Vr8PbfoADQw0@dhcp22.suse.cz>
 <31305ab7-1e65-80aa-ee91-9190c8f67430@redhat.com>
 <ZMqLV2S6vY0cZxbp@dhcp22.suse.cz> <ZMtqu76Tgh9jj+AI@dhcp22.suse.cz>
 <1c6a74f0-85e9-5299-1520-9068e842b1a5@redhat.com>
 <ZMuP7gsxQzAmRpNX@dhcp22.suse.cz>
From: Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>
In-Reply-To: <ZMuP7gsxQzAmRpNX@dhcp22.suse.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: l2xmH5f-l5XHPxaEIV0H8mw-djw5PYh0
X-Proofpoint-ORIG-GUID: Iq6-HSVxKUBkazP8YjVZyEUs8J2A_4rK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-05_13,2023-08-03_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 mlxlogscore=288 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308050133
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

On 8/3/23 5:00 PM, Michal Hocko wrote:
> On Thu 03-08-23 11:24:08, David Hildenbrand wrote:
> [...]
>>> would be readable only when the block is offline and it would reallocate
>>> vmemmap on the change. Makes sense? Are there any risks? Maybe pfn
>>> walkers?
>>
>> The question is: is it of any real value such that it would be worth the
>> cost and risk?
>>
>>
>> One of the primary reasons for memmap_on_memory is that *memory hotplug*
>> succeeds even in low-memory situations (including, low on ZONE_NORMAL
>> situations).
> 
> One usecase I would have in mind is a mix of smaller and larger memory
> blocks. For larger ones you want to have memmap_on_memory in general
> because they do not eat memory from outside but small(er) ones might be
> more tricky because now you can add a lot of blocks that would be
> internally fragmented to prevent larger allocations to form.
> 


I guess that closely aligns with device memory and being able to add
device memory via dax/kmem using a larger memory block size.
We can then make sure we enable the memmap_on_memory feature
at the device level for this device memory. Do you see a need for
firmware-managed memory to be hotplugged in with different memory block sizes?



>> So you want that behavior already when hotplugging such
>> devices. While there might be value to relocate it later, I'm not sure if
>> that is really worth it, and it does not solve the main use case.
> 
> Is it worth it? TBH I am not sure same as I am not sure the global
> default should be writable after boot. If we want to make it more
> dynamic we should however talk about the proper layer this is
> implemented on.

-aneesh
