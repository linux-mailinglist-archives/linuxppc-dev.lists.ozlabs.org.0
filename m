Return-Path: <linuxppc-dev+bounces-9152-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B5DACE1D3
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Jun 2025 17:57:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bCC0M6DKgz2xk5;
	Thu,  5 Jun 2025 01:57:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749052675;
	cv=none; b=SODmRwp/A87spFOWA3wRtykVyQfSVG4Krq+ZGjLy6ZGwIEywaVpqEh/vPHOrvFxX9IEoGrnnzbUNqcUCNq/bU9xshIyqzAPT6f6/s24xciAXKFhQBZpMcwFaWVAok6j6V4ao8kgKiGYH/sV8aL9HYZrLEFQtYtkoTqmKZjwqaDqDqxKL3N+WrrznzZGYTv9/rbHD0d5td83BLq559dlyNNA9CehiNps0c6VnK++NMWEFpO2rMwtNR6IzetBsGD6ctlpzf7LqFfrKt4r3UaudFXAABO/HtLgp9JMQfXGy4reMIVZpLke4kevJ5DzHokjcwL1G8sB5EbIcSJ01Jtj2Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749052675; c=relaxed/relaxed;
	bh=pz+EnW/D+yNH/lAm96nc0b+2F4MOWXDHQcHk92rc5NI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fA0yhQ/W+LjEkjf2QAUBo7YBmkil9S0GoR7k7tIo6EUJlxwqGJANeOLg8jeV2y7vfev0x1gCL7deEvWu3k2wqEOz+TyHoU7czjLic7/Dq5sIyzLWBApfpmySAkZStzUxTVgJKKnymN3IZYUP/hPwVWCS5K9LYEkTQZhKFAnDW5i0SZerGERXCQIBY1Q/iZQqMV7i0he7UjoCN2lut6PB26B2B+beViMKzZ5GNaQWpN3kryURmTmNVdZfvEdikq0L38DflW0iHXpQ9noV/2ZG1Z6ohac/gFe/ULU2wjI70qN+HfQ0a7E5VFtn2bLlAsbWJcLW5aC6xGBzsO4xw7rwrg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dqNBvphO; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=donettom@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dqNBvphO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=donettom@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bCC0K5Wprz2xXP
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Jun 2025 01:57:53 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 554DGuZV024325;
	Wed, 4 Jun 2025 15:57:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=pz+EnW
	/D+yNH/lAm96nc0b+2F4MOWXDHQcHk92rc5NI=; b=dqNBvphOMDWXYrspYqvDIU
	wWMPFfxEUHSzA8DXllz4DhS/jH0jNd+ERl2YDnd6sUl7QMh1TZ4FN3A0MqQr8N4U
	rYMiArAf7OQtx2KDk+VWIHGlFwhMAeXxBKE4wsq/4vpoOglJTc1NFWrfcZPy1TfE
	jut00VjMu/VJigv0zu8TPTA2TYj3jcQo0EY2u9tHCMCFAXTsm80oWisj238DVUp8
	rsnN1TJjguzmWEoPrlGgaKTEVXfOaj+CdSVp0VksGdrrB9t2171NDSG7GZN7NG09
	RkOSTTo82mNlIw2BIkbO+9p5oLSOOez+rx3WV2OPf7CSMmpw/G6TgUjONvj+QWVw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 471geyurxh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Jun 2025 15:57:37 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 554FYtZY026153;
	Wed, 4 Jun 2025 15:57:36 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 471geyurxe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Jun 2025 15:57:36 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 554Ff1jE028437;
	Wed, 4 Jun 2025 15:57:35 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 470eakg9je-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Jun 2025 15:57:35 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 554FvXX623593548
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 4 Jun 2025 15:57:33 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6828D58067;
	Wed,  4 Jun 2025 15:57:33 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8FA2F58052;
	Wed,  4 Jun 2025 15:57:27 +0000 (GMT)
Received: from [9.39.21.166] (unknown [9.39.21.166])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  4 Jun 2025 15:57:27 +0000 (GMT)
Message-ID: <3d28858f-4ec6-43ea-8a3b-b9ce9a27bac7@linux.ibm.com>
Date: Wed, 4 Jun 2025 21:27:25 +0530
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/5] drivers/base/node: Optimize memory block
 registration to reduce boot time
To: David Hildenbrand <david@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>
Cc: Mike Rapoport <rppt@kernel.org>, Oscar Salvador <osalvador@suse.de>,
        Zi Yan <ziy@nvidia.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ritesh Harjani <ritesh.list@gmail.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, "Rafael J . Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Alison Schofield <alison.schofield@intel.com>,
        Yury Norov <yury.norov@gmail.com>, Dave Jiang <dave.jiang@intel.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Nilay Shroff
 <nilay@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <2a0a05c2dffc62a742bf1dd030098be4ce99be28.1748452241.git.donettom@linux.ibm.com>
 <20250603200729.b7581e017e4ca63f502c795e@linux-foundation.org>
 <b355e72d-0284-4a31-84e3-ae4a79ad922f@redhat.com>
 <9f7ae0e6-4640-418d-a4db-dba594377ac2@linux.ibm.com>
 <8abecd5b-2768-49d0-afc3-561b95d77a24@redhat.com>
Content-Language: en-US
From: Donet Tom <donettom@linux.ibm.com>
In-Reply-To: <8abecd5b-2768-49d0-afc3-561b95d77a24@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=Pq2TbxM3 c=1 sm=1 tr=0 ts=68406cf1 cx=c_pps a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VnNF1IyMAAAA:8 a=mxs0qDoQSYin1jJoqQcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDExNyBTYWx0ZWRfX8WJCyVYxYOx4 ZwXF2L0hT9TVa9DCSZd0HnDTGnBLFWEQfIxdH7zNVM7GUVTw9QNAEgXFvI/Xf2VFj702xdpkOwZ sfqoXfWav9Rh6Q7PyjfPbaOH7gSnB9W1ScAh5rm/TsIwa5ei31ohpf9YVdbG04aMpO/YATwLmKc
 Nu4l7OGkwJONLlda7cIGo5xN4tNoU5UWs7aWuldP0AxM+oI6kN/2TY/JBbQz7cKY93NcxIWW8tW WgHpy0zclU/Ytt607VyE1rKfvJD5sP9EHB1ztXnYinqH583LpBYXATXCdNBDhJPqPJ8R/vxLle1 avaH5sAL+9Pjua1nGH/CFx6EpV7DjmpkhInXsPuhnQOvipMOn0uGoH244A9l8nkKf4KiAHjDxo9
 o+X4w74JpOyhMp51jOolPmtOZntcZfPPKt8xNLN8FXCuDhvXTNLasu1gWBqP7xtuOE954ekS
X-Proofpoint-GUID: 9l28POHsiWfHdlg-x-L2inqY-xBTAJNz
X-Proofpoint-ORIG-GUID: d6boryrX-Nv2vvbBUaTJBWLYcMY3GX1l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_03,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 mlxlogscore=999
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 mlxscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506040117
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 6/4/25 7:00 PM, David Hildenbrand wrote:
> On 04.06.25 15:17, Donet Tom wrote:
>>
>> On 6/4/25 3:15 PM, David Hildenbrand wrote:
>>> On 04.06.25 05:07, Andrew Morton wrote:
>>>> On Wed, 28 May 2025 12:18:00 -0500 Donet Tom <donettom@linux.ibm.com>
>>>> wrote:
>>>>
>>>>> During node device initialization, `memory blocks` are registered 
>>>>> under
>>>>> each NUMA node. The `memory blocks` to be registered are identified
>>>>> using
>>>>> the node’s start and end PFNs, which are obtained from the node's
>>>>> pg_data
>>>>
>>>> It's quite unconventional to omit the [0/N] changelog.  This omission
>>>> somewhat messed up my processes so I added a one-liner to this.
>>>>
>>>
>>> Yeah, I was assuming that I simply did not get cc'ed on the cover
>>> letter, but there is actually none.
>>>
>>> Donet please add that in the future. git can do this using
>>> --cover-letter.
>>
>> Sure,
>>
>> I will add cover letter in next revision.
>>
>>
>>>
>>>>>
>>>>> ...
>>>>>
>>>>> Test Results on My system with 32TB RAM
>>>>> =======================================
>>>>> 1. Boot time with CONFIG_DEFERRED_STRUCT_PAGE_INIT enabled.
>>>>>
>>>>> Without this patch
>>>>> ------------------
>>>>> Startup finished in 1min 16.528s (kernel)
>>>>>
>>>>> With this patch
>>>>> ---------------
>>>>> Startup finished in 17.236s (kernel) - 78% Improvement
>>>>
>>>> Well someone is in for a nice surprise.
>>>>
>>>>> 2. Boot time with CONFIG_DEFERRED_STRUCT_PAGE_INIT disabled.
>>>>>
>>>>> Without this patch
>>>>> ------------------
>>>>> Startup finished in 28.320s (kernel)
>>>>
>>>> what.  CONFIG_DEFERRED_STRUCT_PAGE_INIT is supposed to make bootup
>>>> faster.
>>>
>>> Right, that's weird. Especially that it is still slower after these
>>> changes.
>>>
>>> CONFIG_DEFERRED_STRUCT_PAGE_INIT should be initializing in parallel
>>> which ... should be faster.
>>>
>>> @Donet, how many CPUs and nodes does your system have? Can you
>>> identify what is taking longer than without
>>> CONFIG_DEFERRED_STRUCT_PAGE_INIT?
>>
>>
>>
>> My system has,
>>
>> CPU      - 1528
>
> Holy cow.
>
> Pure speculation: are we parallelizing *too much* ? :)
>
> That's ~95 CPUs per node on average.

yes

>
> Staring at deferred_init_memmap(), we do have
>
>     max_threads = deferred_page_init_max_threads(cpumask);
>
> And that calls cpumask_weight(), essentially using all CPUs on the node.
>
> ... not sure what exactly happens if there are no CPUs for a node.


Okay.

I'm still debugging what's happening. I'll update you once I find something.


>
>> Node     - 16
>
> Are any of these memory-less?


No, there are no memory-less nodes. All nodes have around 2 TB of memory.


>
>> Memory - 31TB
>
>
>

