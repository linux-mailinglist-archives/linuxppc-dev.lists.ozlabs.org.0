Return-Path: <linuxppc-dev+bounces-13514-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 724D1C1B6E4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Oct 2025 15:54:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cxVcz0H69z30hP;
	Thu, 30 Oct 2025 01:54:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761749650;
	cv=none; b=a0vqu+5WCaATvFndUbrlQZxFVmK/eIWnrm+4WDgEBE1wr/YhFMmnwQYapB+gENzfQ07aOgEXYV5g6UzGwcNW34/mqlRhD0MwFuMSH8jyw2x1D6ZyNDTtbodyBD8588tNbEbWpnUW/9gzO5stoqsOCZAmiY8HYjnedMUUs/1zJIS4d1PmcsAGlSXMvXNnkOAcv9fx5+zhgU3vsZBqezIQz17TcH/wWBmwQEdZqQValgOvnTVvrDqJBJwxGehDA33Uds0ghCVNG2aga1KMJiPF2nfxiMi78ftQ8OKfoEiP51/H/AlIh4ydrEjNz2lWND4R9W2QIhtdTEjv6SsxlB6f1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761749650; c=relaxed/relaxed;
	bh=sv9a4OR6dXMl6ieWoM+RDbNICm7j3Ls5Y+kDg6pwG9k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aaiSixUezx+QX7aG3dbaoqaBwbyVbz1hpH+mRoX0ywJ9e135ig6ryA4ITLbjO8xeOFCqpUdx+YEdkue93BjZqum7pSaojqeydktAoqAnLzy1NJpYEkvINH28ngBxO9rssOJ2fA1yKriedBJJ0CcUR0nyYrW+jAO8JuMfzLbsW0RkTFg/8kaKhpL6RaTdwFAiM+YjWZrQoGa1TkMlEp1dNemtW9z1WBFypOACTQzyGBkoKf7uVtbYZo9TeFjmFOrsWlG4KC6kbKDtTSnx441DNiJDKyFpWNqYxWCXwu0T3HYa2wcAufj0bUtBM9GdKAQg+AsOju+JD0XKl8sSOYaEHg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rlnlI6+1; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rlnlI6+1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cxVcw5T9bz2xsq
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Oct 2025 01:54:08 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59TBqBEt025685;
	Wed, 29 Oct 2025 14:54:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=sv9a4O
	R6dXMl6ieWoM+RDbNICm7j3Ls5Y+kDg6pwG9k=; b=rlnlI6+1RxqpbJvl54cYFz
	8nMJ+AHzSlUlxfxU/4PXfGpZ1vdUrHGpbU6QFmhNbKH6PhBjToTZTlJdTimoJFO3
	cGlwP2cjSiIb9c8TJ8GZfpTayI+4fG+bXhHGaHWriM0nWRceLfPnUQBjJcUWzw6c
	idVT43oxhsXNHnVyuvpMWmj8LxpQKnO5a7kWI8Cr2B0m2v8C+Sj+SVhkUyQQG0XP
	ZOx8TPsX8d0VrXCHOjsnedJt8EqKXLHHHJcEosfh65YO60jMVsi/mRF/C/biK+VO
	NXdX6sfOo8t0W/hZlBJuu7H+NIV1vQuG/t7hEUQ98g19fYmvl1qNlProzDDeYPqQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a34acky5e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Oct 2025 14:54:00 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 59TEs08K030678;
	Wed, 29 Oct 2025 14:54:00 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a34acky5a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Oct 2025 14:54:00 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 59TDUDLt031689;
	Wed, 29 Oct 2025 14:53:59 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4a33w03x73-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Oct 2025 14:53:59 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 59TErsJ923134582
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 29 Oct 2025 14:53:55 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DD7DA20049;
	Wed, 29 Oct 2025 14:53:54 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E991F20040;
	Wed, 29 Oct 2025 14:53:52 +0000 (GMT)
Received: from [9.124.210.68] (unknown [9.124.210.68])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 29 Oct 2025 14:53:52 +0000 (GMT)
Message-ID: <e7337060-baea-4386-99fe-f7831330bb14@linux.ibm.com>
Date: Wed, 29 Oct 2025 20:23:51 +0530
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
Subject: Re: [PATCH v3] powerpc/kdump: Add support for crashkernel CMA
 reservation
To: Jiri Bohac <jbohac@suse.cz>
Cc: linuxppc-dev@lists.ozlabs.org, Hari Bathini <hbathini@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Mahesh Salgaonkar <mahesh@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        Shivang Upadhyay <shivangu@linux.ibm.com>
References: <20251024170118.297472-1-sourabhjain@linux.ibm.com>
 <aQIemtjbgSaMGYnE@dwarf.suse.cz>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <aQIemtjbgSaMGYnE@dwarf.suse.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=XbuEDY55 c=1 sm=1 tr=0 ts=69022a88 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=_Hpar7qatIJ0jiNUb3sA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 3MRHbzQbhS0SN3sHt52nO9UZ_AC-zupr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDE2NiBTYWx0ZWRfXywoyKAM9vPEr
 Ddj4nK5rag78j5gxxolvR+pWlxW2t4sJB87l/n0NE8ZzxITJer6Mg6/l9qNKBJ6zAjhHT4u/J90
 nZxPxyDwb2ER/fnJ3FW/XRYXQBLotqO0M/0r50ZtoGRdWlb5fJOTnPZEtTLT6uRZ8UzSTpDERtu
 o0g/oOKMchgGHMC/SAlPyI62C8c3OQbljEeVs7VwCqBzWcuU9mW3XarZUigmVsb7DzzMrzH1ewA
 hwlKbeBZkwCwUN/w4YBNPcBpGCYS6mm3oLYAvttiSOItmb3daB2j/xmlaACDdWv6+u5Xo8YiWj2
 8GyDYycoayxwgl2zsDBxAWAjnkpJuvawWw8SK3iD11oEaEkqQBAl+dDg45PCscf2Y7veIQykUSA
 SCRFo6cwvYec/IqL+43nP6YSeKdBXg==
X-Proofpoint-GUID: xJHrKAew39Qf62j6NTi8ggMeI88hFwpW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-29_06,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 suspectscore=0 bulkscore=0 spamscore=0
 impostorscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510240000
 definitions=main-2510280166
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 29/10/25 19:33, Jiri Bohac wrote:
> On Fri, Oct 24, 2025 at 10:31:18PM +0530, Sourabh Jain wrote:
>> +static int crash_exclude_mem_range_guarded(struct crash_mem **mem_ranges,
>> +					   unsigned long long mstart,
>> +					   unsigned long long mend)
>> +{
>> +	struct crash_mem *tmem = *mem_ranges;
>> +
>> +	/* Reallocate memory ranges if there is no space to split ranges */
>> +	tmem = *mem_ranges;
> repeated initialization

Will remove it in next verison.

>
>> +	if (tmem && (tmem->nr_ranges == tmem->max_nr_ranges)) {
>> +		tmem = realloc_mem_ranges(mem_ranges);
>> +		if (!tmem)
>> +			return -ENOMEM;
>> +	}
>> +
>> +	return crash_exclude_mem_range(tmem, crashk_res.start, crashk_res.end);
> mstart and mend, not crashk_res.start and crashk_res.end
Yup my bad. I will fix it. Thanks for the review.


- Sourabh Jain

