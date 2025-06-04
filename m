Return-Path: <linuxppc-dev+bounces-9147-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD68ACDEEC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Jun 2025 15:22:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bC7YC3xknz2xk5;
	Wed,  4 Jun 2025 23:22:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749043359;
	cv=none; b=KNGkV7nNA+eq9aJB793juWDhCyPfemb+kkwy8GmkFIKxDLvQjdakDCW/LygUcwJ7vubDclDUlmurOnWan+AmZh8tpucLWF3zoNMvk4/SxCWD625aLNc2HDbsePcj6m4vuP+cqA9kAJuGIc5j1FEOoB8ymDsjhhTeAzYjqZXGS2nVAyOO1io27us79yn3kMFoGhyKNMtUPXuvqRpsWOIW2pqWDvTTLRpfIU10BHVlXeraUgKFr5B77wIq7ySVAPmEc76GXDWMWQUrDKL6voTI04G8jeP48xXIJvgf/mD5Q/dHTNrfgDtQXfcrzKEWjywJpXWcTrR22Mls+70d/MXBqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749043359; c=relaxed/relaxed;
	bh=AyofCP+ZN+6ircaf7mXhdeuKJnDTj+s9f0clMqZxlXs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WF0sfJXunWXY6ibST9vZ//x73QOqx10s3aNiYIyM2vo2YwiQxZKRntAJFgyL5w6D6m3gsZEY3LrTAEPR36uubdi8YWzwpYzKIWBZdNUrOvigcj1WtiqlxVnJYjz7SwDiGSps955tnjySGNRm7364pjFNRm9UE38ZFdxORqv+Cqe8WQiMPrk8nantLqJjhcHU1RVdAx6K5IGimzY6bgD6A1V3GvpC455T9TppUbHpnn8UUp9p5SjfUWVXBhepsrDW91GNgtHhKkwyJ1JQw8MhDsU6zH7smGRiv+e7X6QXsF3ONS+TW1A9ckuV7i7vyVyqD2S6K+mOGpjknznuTmNLmg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Wd+QjN0T; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=donettom@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Wd+QjN0T;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=donettom@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bC7YB3wQMz2xCd
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Jun 2025 23:22:37 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 554DCawf032172;
	Wed, 4 Jun 2025 13:17:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=AyofCP
	+ZN+6ircaf7mXhdeuKJnDTj+s9f0clMqZxlXs=; b=Wd+QjN0T53cJ5UBS0BP1xh
	UoNltEcgex7nx4RL2dI/9ob1j+9I0sh8lGb06Z8yDECNrMDf1LZWEPMwMv6I8s5j
	IcNdrV/mfCpCobGpLaKXpuAyhzs3gga7PjSFbyY7C+OBpr6RSVsBGJ6PegI0tRjD
	lm0JhgdAQFrFiZhLqssqlyD53tZa1D9qQZBVRqkatFL6+hiF0T8PwA4u+tx31VC1
	buUgd7LyC28IYlSDhDoqBHJvUXnJf8cHwtRBUch7NcdoZ0YMNu+awjzOxrfpk6nm
	WvELcIcPxBe6adYvR3VwJBbi5Lppb+StgHvIFoYyGY3X0WVB02NDLSrsBnl9r75A
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 471geytmnc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Jun 2025 13:17:11 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 554CxI1B029221;
	Wed, 4 Jun 2025 13:17:11 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 471geytmna-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Jun 2025 13:17:11 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 554BoRl0031650;
	Wed, 4 Jun 2025 13:17:10 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 470cfyyymw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Jun 2025 13:17:10 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 554DH8MM25297572
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 4 Jun 2025 13:17:09 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AD4BB58067;
	Wed,  4 Jun 2025 13:17:08 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EF0ED5805D;
	Wed,  4 Jun 2025 13:17:02 +0000 (GMT)
Received: from [9.39.21.166] (unknown [9.39.21.166])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  4 Jun 2025 13:17:02 +0000 (GMT)
Message-ID: <9f7ae0e6-4640-418d-a4db-dba594377ac2@linux.ibm.com>
Date: Wed, 4 Jun 2025 18:47:01 +0530
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
Content-Language: en-US
From: Donet Tom <donettom@linux.ibm.com>
In-Reply-To: <b355e72d-0284-4a31-84e3-ae4a79ad922f@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 4FsplurUS7c-nNdN0AmIoqUxedlpBq1v
X-Proofpoint-ORIG-GUID: cm-Oc-tEKoBA3qeJIzbOxbnJXz9fYfvv
X-Authority-Analysis: v=2.4 cv=X4dSKHTe c=1 sm=1 tr=0 ts=68404757 cx=c_pps a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VnNF1IyMAAAA:8 a=k8bw5oIpvhWMPjh-KD8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDA5OSBTYWx0ZWRfXwW6CTbwXdFug zCXnZycTe/FqRgU6/7hAGmicwbUedmIIArWprAYdtHHYFavfFa4G+KxKc+VYO1pl6alcHRcrnEf xtqqWsw7o4wouJXJZzoiVu80TLtzFLtJwUNLpc6hsMSpgi2KAPuhJs5p3mGD9U84OeoklTUc5sn
 PO0Oz36/aec/Qkgp/dwSynzy9BzkcF+qgNlnrvE9Xo4/YUm9T/pCxhQS/mkX2twpZ2oBIWO+y4E fLsZmb8Hm2OFz2Owb8eVOZs0ET6iz52pippiIXA9bORtj7zfZU5Vif2yLNxoL/mevj+FhZvouV4 jeOJ8otynWo0iTOxhMKjLDCuX5C0uN78khP7zH28mqiv/t1+dsNkBy3020SYjol1DSCiNLzXe9j
 DxyfRX481RrnuSrz9kupxaY++cA4LzgAC6gDwjUeAhnBviMJhEI4V4hGPkwPy4jkwFCF2rTS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_03,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 clxscore=1015 phishscore=0 bulkscore=0
 malwarescore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506040099
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 6/4/25 3:15 PM, David Hildenbrand wrote:
> On 04.06.25 05:07, Andrew Morton wrote:
>> On Wed, 28 May 2025 12:18:00 -0500 Donet Tom <donettom@linux.ibm.com> 
>> wrote:
>>
>>> During node device initialization, `memory blocks` are registered under
>>> each NUMA node. The `memory blocks` to be registered are identified 
>>> using
>>> the node’s start and end PFNs, which are obtained from the node's 
>>> pg_data
>>
>> It's quite unconventional to omit the [0/N] changelog.  This omission
>> somewhat messed up my processes so I added a one-liner to this.
>>
>
> Yeah, I was assuming that I simply did not get cc'ed on the cover 
> letter, but there is actually none.
>
> Donet please add that in the future. git can do this using 
> --cover-letter.

Sure,

I will add cover letter in next revision.


>
>>>
>>> ...
>>>
>>> Test Results on My system with 32TB RAM
>>> =======================================
>>> 1. Boot time with CONFIG_DEFERRED_STRUCT_PAGE_INIT enabled.
>>>
>>> Without this patch
>>> ------------------
>>> Startup finished in 1min 16.528s (kernel)
>>>
>>> With this patch
>>> ---------------
>>> Startup finished in 17.236s (kernel) - 78% Improvement
>>
>> Well someone is in for a nice surprise.
>>
>>> 2. Boot time with CONFIG_DEFERRED_STRUCT_PAGE_INIT disabled.
>>>
>>> Without this patch
>>> ------------------
>>> Startup finished in 28.320s (kernel)
>>
>> what.  CONFIG_DEFERRED_STRUCT_PAGE_INIT is supposed to make bootup
>> faster.
>
> Right, that's weird. Especially that it is still slower after these 
> changes.
>
> CONFIG_DEFERRED_STRUCT_PAGE_INIT should be initializing in parallel 
> which ... should be faster.
>
> @Donet, how many CPUs and nodes does your system have? Can you 
> identify what is taking longer than without 
> CONFIG_DEFERRED_STRUCT_PAGE_INIT?



My system has,

CPU      - 1528
Node     - 16
Memory - 31TB

I ran the same test with and without CONFIG_DEFERRED_STRUCT_PAGE_INIT, 
and the boot time was consistently higher with 
CONFIG_DEFERRED_STRUCT_PAGE_INIT enabled.

I'm still investigating this. I'll check further and get back to you.



CONFIG_DEFERRED_STRUCT_PAGE_INIT enabled
----------------------------------------------------------------------
1. Startup finished in 12.959s (kernel)
2. Startup finished in 13.036s (kernel)
3. Startup finished in 12.944s (kernel)


CONFIG_DEFERRED_STRUCT_PAGE_INIT disabled
-----------------------------------------------------------------------
1. Startup finished in 12.234s (kernel)
2. Startup finished in 12.287s (kernel)
3. Startup finished in 12.230s (kernel)

Thanks
Donet


