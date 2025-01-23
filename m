Return-Path: <linuxppc-dev+bounces-5500-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E58A1A2DB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jan 2025 12:23:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ydz8Q1xkkz303K;
	Thu, 23 Jan 2025 22:23:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737631398;
	cv=none; b=CypBGpAw5UoIBTa6GT3icNmPDitzr8U3Uy7eCF/g840tP02l9qkUPB8KEEghavWwD2d/wbBdJewVzDxXtLpdZiSCuDSv0OO/K6Aqi8+veLiWBmxdjS28JjEzI1L/Z9XhkvNNPB7tlSnzIeXNAvONo+FmDsTFvfu3nbyoJvrls9E88l6lyYABGSmFjP6MpvueiosI3aN4ReEAqfBL+o/XZN0WdS6yPiLISZZ2g/2gChy5FDP5kOGv71KAfDe9r/CH0eIErV2qNsHleN/SJPGHJcPEP5Cbzc1iIwBJ32Dyeo4a7AOcxjIDPLx0m2/hJxbiN/cZ3rcdRRRAEvvgguWFvA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737631398; c=relaxed/relaxed;
	bh=TYHzT7PsfyUri1Pj5o7+pR3jEob9Vl2tdXjNuTZzJaE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dCHUfAV/nznLzWRssb0nJaWJ1noSTPqC27gZUaJQs3TBI2mUu/ilTHhSkaoEAUYJVsuWeot+HnHwBYp2E5IrALyvGNGJ1/uLF/wFBPxJM08ZVREWCMKxTwb9/lq4Sj+ATT0blMXBgwGYKMYo3Q+rt0qTjI5XGbGxQPLV8psjqFCcA9Etpx5rJL7RMCuANNiEzEy54sEmgJqXFGEL75BhhGXtaLj00P90kyLfAB0rvL+gHKMSlxkbn3Zg2pYoIEGlZiOt4K+QaWb3qZ/I8etk+5gHQewDvxq0NE3obembBLHRGMz357Mtv7xl+1g0wHPz1tfV2daDrH4d84ZfKh8lHQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NhZ7/ugn; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NhZ7/ugn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ydz8P41Y9z2ytN
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jan 2025 22:23:17 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50N5NoBr026361;
	Thu, 23 Jan 2025 11:23:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=TYHzT7
	PsfyUri1Pj5o7+pR3jEob9Vl2tdXjNuTZzJaE=; b=NhZ7/ugnVmpJ0M9krwXvho
	kpKhOABczxzbG7ZZP2x2IlfoCC1cT2oZhwADeHiDqzs+tj0pbiMkKkO5IdQG/555
	6hMUt254PYlZ5Twoj3jD3RSJmOQXEvR+emh51OVlG5wl9i105OE0ov3VT8AxQYqw
	2mHMZdrLRhUtEJcS/gkJJdBx0mIR/B423xP7VomWaSbl3OxXJhCZxWnHmijlmYCz
	gTyifA3RfhNSEir6keRWzuml4F7wGEWseB75VObPLX0EDW1XMf7YeuRH65yGv94n
	4UOh5hvsA2g8vWxeFbIUOcbKp9SNDvqW3nsKjBsrVicWRok5jbkgZayqIk1zIgLQ
	==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44bfk7skgw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jan 2025 11:23:08 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50N8xHlx021074;
	Thu, 23 Jan 2025 11:23:07 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 448sb1mw32-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jan 2025 11:23:07 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50NBN46964946494
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 Jan 2025 11:23:04 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 00F9020049;
	Thu, 23 Jan 2025 11:23:04 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E812120040;
	Thu, 23 Jan 2025 11:23:01 +0000 (GMT)
Received: from [9.109.204.94] (unknown [9.109.204.94])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 23 Jan 2025 11:23:01 +0000 (GMT)
Message-ID: <ed578d5e-c2ec-46b8-90fa-7e4f9b727685@linux.ibm.com>
Date: Thu, 23 Jan 2025 16:53:01 +0530
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
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] kexec: Initialize ELF lowest address to ULONG_MAX
To: Hari Bathini <hbathini@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Mahesh Salgaonkar <mahesh@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>, kexec@lists.infradead.org,
        linux-kernel@vger.kernel.org, Baoquan He <bhe@redhat.com>
References: <20250121115442.1278458-1-sourabhjain@linux.ibm.com>
 <20250121115442.1278458-2-sourabhjain@linux.ibm.com>
 <7cfe94c9-4ca5-48b1-ab53-bc08fcf8fbc0@linux.ibm.com>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <7cfe94c9-4ca5-48b1-ab53-bc08fcf8fbc0@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: bHomo7JeB_Q0vOgJKpGHSVDIlTTskGB-
X-Proofpoint-ORIG-GUID: bHomo7JeB_Q0vOgJKpGHSVDIlTTskGB-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-23_04,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 adultscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501230084
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hello Hari,


On 23/01/25 15:34, Hari Bathini wrote:
>
>
> On 21/01/25 5:24 pm, Sourabh Jain wrote:
>> kexec_elf_load() loads an ELF executable and sets the address of the
>> lowest PT_LOAD section to the address held by the lowest_load_addr
>> function argument.
>>
>> To determine the lowest PT_LOAD address, a local variable lowest_addr
>> (type unsigned long) is initialized to UINT_MAX. After loading each
>> PT_LOAD, its address is compared to lowest_addr. If a loaded PT_LOAD
>> address is lower, lowest_addr is updated. However, setting lowest_addr
>> to UINT_MAX won't work when the kernel image is loaded above 4G, as the
>> returned lowest PT_LOAD address would be invalid. This is resolved by
>> initializing lowest_addr to ULONG_MAX instead.
>>
>> This issue was discovered while implementing crashkernel high/low
>> reservation on the PowerPC architecture.
>>
>
> Acked-by: Hari Bathini <hbathini@linux.ibm.com>


Thanks for the Ack!

- Sourabh Jain


>
>> Fixes: a0458284f062 ("powerpc: Add support code for kexec_file_load()")
>> Cc: Andrew Morton <akpm@linux-foundation.org>
>> Cc: Hari Bathini <hbathini@linux.ibm.com>
>> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
>> Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>> Cc: kexec@lists.infradead.org
>> Cc: linuxppc-dev@lists.ozlabs.org
>> Cc: linux-kernel@vger.kernel.org
>> Acked-by: Baoquan He <bhe@redhat.com>
>> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>> ---
>>   kernel/kexec_elf.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/kernel/kexec_elf.c b/kernel/kexec_elf.c
>> index d3689632e8b9..3a5c25b2adc9 100644
>> --- a/kernel/kexec_elf.c
>> +++ b/kernel/kexec_elf.c
>> @@ -390,7 +390,7 @@ int kexec_elf_load(struct kimage *image, struct 
>> elfhdr *ehdr,
>>                struct kexec_buf *kbuf,
>>                unsigned long *lowest_load_addr)
>>   {
>> -    unsigned long lowest_addr = UINT_MAX;
>> +    unsigned long lowest_addr = ULONG_MAX;
>>       int ret;
>>       size_t i;
>


