Return-Path: <linuxppc-dev+bounces-9148-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5EE5ACDF01
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Jun 2025 15:26:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bC7dP2XHJz2xlK;
	Wed,  4 Jun 2025 23:26:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749043577;
	cv=none; b=VvU8CE6PlWFC+zAF5NMRRnsnHxc4SfTn+RuZ43u+KIg3SPA91JMbCH5l+W8LSg4Px/RKdVWlOUpZBwK69j4DtyeKgODRICrJ/pk7jk9Tr1TPOkHS9onWRH8lwoZHqDBtKCVsQnB6MffVPXcx66qLaKEdz7sbNvNnuncXVKte1S/dJb6Homri17CRnFNegGdrPe/sEWQkBcTAzZlD+uUng1bujJzZ/9n4vmwC1qFVFbx28tNwB8WE2ECi00jiBv62b/YDL0+NnvwRCyGnkIz4oCH3VAJP2SgG83FV+bdu0o9KSj85CXq3hek/AedPCiz2QBwiE2Vv8pr5xy5QRf+oqw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749043577; c=relaxed/relaxed;
	bh=JNIQ7szjEf71NuUbS9S2gha5+GvA2tSVHUgg7CdOick=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FbYttxHCGQCSuxK9zK0DPqbMPJlPSX9wLowAwr4p1M79ruRAfC3gqZwRa6tBAeS4mI+dnI8yTtfRmEBDzriJCpaCGiJTmaPgQnekDk1Ko9n/zi9Y7iv06BRTV7B0K6updM+1uSp95ieiChEdPs1NsXXxCeTr9ZfsAEoSQTh6ngfAAmZmyb9iY37w878ZfWnzEvHmX1BV6C7M9lVpLB0Xzgn62Sy01bgWLrgzsjgKNXXUJuVpmulhAlqVxbsmKZOK/mGemo2mCB/7B6/TIHZXbbR2G6v4dzbDXJylKmTM5rvU7erak01luMRJVsmULNbBqRDL/ik8f+p0v1d+xeqw4w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XfhdYuC0; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=donettom@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XfhdYuC0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=donettom@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bC7dN3bb3z2xCd
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Jun 2025 23:26:16 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 554CwnwK030628;
	Wed, 4 Jun 2025 13:25:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=JNIQ7s
	zjEf71NuUbS9S2gha5+GvA2tSVHUgg7CdOick=; b=XfhdYuC0oPH8zTd7G78gKo
	C6P9Xu9xmLBToE+GN6cjawLlP5Hf6deoZhu9midZLuSiCoGQN+6oa76j4G3cnNzs
	hRmOJgjWq1Z6YY9bk1EGQ7K0URbwC3ziWgCec8eu4jVNo6mypcFJCB5AHHX0pliO
	7+f7zsV72JnSFL+kW6dquzBOGL21J8alJiBMBLuIJnttcI61iuHWG/P9r7k9QSuh
	oKRBm477HMXLgGZX4ZxaozoUqgktjCyrRoikZHS2buNDg0dfZ9p4g+kX7FeQL6bg
	zuwV371P7Fv6XWeA/+bzqolczNv4u6HNNHC1bxibMuJkYLquYv7ozdYkbO7DvIHQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 471geyttxc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Jun 2025 13:25:53 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 554DPrT5028249;
	Wed, 4 Jun 2025 13:25:53 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 471geyttx4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Jun 2025 13:25:53 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 554Bx58E024776;
	Wed, 4 Jun 2025 13:25:51 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 470dkmfsve-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Jun 2025 13:25:51 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 554DPjto15532692
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 4 Jun 2025 13:25:46 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E28F158056;
	Wed,  4 Jun 2025 13:25:49 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 12B8E58052;
	Wed,  4 Jun 2025 13:25:44 +0000 (GMT)
Received: from [9.39.21.166] (unknown [9.39.21.166])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  4 Jun 2025 13:25:43 +0000 (GMT)
Message-ID: <badb9a92-3682-4f89-88d2-0651386a31f7@linux.ibm.com>
Date: Wed, 4 Jun 2025 18:55:42 +0530
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
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>, Mike Rapoport <rppt@kernel.org>,
        Oscar Salvador <osalvador@suse.de>, Zi Yan <ziy@nvidia.com>,
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
Content-Language: en-US
From: Donet Tom <donettom@linux.ibm.com>
In-Reply-To: <20250603200729.b7581e017e4ca63f502c795e@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: EbSF01bE5odkPh65mRkLZGyusm5mOC7m
X-Authority-Analysis: v=2.4 cv=DYMXqutW c=1 sm=1 tr=0 ts=68404961 cx=c_pps a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VnNF1IyMAAAA:8 a=w-oE209dy2xqcs4eIbgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: F-1tfnlDZhRpZUcrZROpJTlH7sVUQtpP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDA5OSBTYWx0ZWRfXwBZBHb+c2Ct+ McEOwK31mxvwYUWFLx3Rt/bOArjqZkBjpHAYHO+84FUTyB4nyppSBCQNVTgQ3lL4NDO2Hv5JAgX WWYHgqRwsvbkHNdwIYmS8Ct3L0LqXxc27ea7x12TK04pRgI3fdcVZW6P9t+FL0YG6Tje8sPQtG1
 If05/q7siRtf9WKcTJykTy+T0HH/2vY2QVqYJSG8qfhw3iT3+WeRdBgcdAkFaGMWrWotk5JnoYE XG0K9Es76TQUKULgfNGY5OEtgsCsEZ1eTGfTZVRUIekOuZG1Vd0bcOIMq4DszbrSlTaprZ0A/Vu 3g9z0S9LTu+dm3mytL1Hpmqz2qLlBfEjAtx4bCcREAlEkHRlZwD7riAA2WioXEpvUgVI4fhV7v6
 eGVOEnXgki/EZ/jTbToR8DRM7DUkCQX0AipvFjcaSN6MI651asU+Pwtnj7BscCJAj2qb4XjN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_03,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 mlxscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 mlxlogscore=993 adultscore=0
 malwarescore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506040099
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 6/4/25 8:37 AM, Andrew Morton wrote:
> On Wed, 28 May 2025 12:18:00 -0500 Donet Tom <donettom@linux.ibm.com> wrote:
>
>> During node device initialization, `memory blocks` are registered under
>> each NUMA node. The `memory blocks` to be registered are identified using
>> the node’s start and end PFNs, which are obtained from the node's pg_data
> It's quite unconventional to omit the [0/N] changelog.  This omission
> somewhat messed up my processes so I added a one-liner to this.


Sorry, Andrew. I’ll include the cover letter in the next revision and 
make sure to follow this for all future patches.


>
>> ...
>>
>> Test Results on My system with 32TB RAM
>> =======================================
>> 1. Boot time with CONFIG_DEFERRED_STRUCT_PAGE_INIT enabled.
>>
>> Without this patch
>> ------------------
>> Startup finished in 1min 16.528s (kernel)
>>
>> With this patch
>> ---------------
>> Startup finished in 17.236s (kernel) - 78% Improvement
> Well someone is in for a nice surprise.
>
>> 2. Boot time with CONFIG_DEFERRED_STRUCT_PAGE_INIT disabled.
>>
>> Without this patch
>> ------------------
>> Startup finished in 28.320s (kernel)
> what.  CONFIG_DEFERRED_STRUCT_PAGE_INIT is supposed to make bootup
> faster.
>
>

