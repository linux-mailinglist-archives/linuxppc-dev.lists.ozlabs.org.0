Return-Path: <linuxppc-dev+bounces-1308-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A7472977817
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Sep 2024 06:46:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X4hbb3j5Yz2yj3;
	Fri, 13 Sep 2024 14:46:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726202795;
	cv=none; b=PvwJXwDnUFGWoa7XWy7+gHBbMp4Sb7UlLVWhb5gq1dRmh24YdKX0a3P4KxV4RhJLYrkWdisowctZFbT0CRlHuVy6oYei7gKudIHSlyRIkBXB1aoB+31bY66kOHlUAt5xAEfRftwTl282WToq4CJFVTAuLqYkST5imVp5ulllWzR/IyeIv3tC83XBP7kO6lPPnkJumiRCWeMIFrZYU+6vBxdZrUtanlPAXcjVPts0g5BJIa4lJ+cIFVgE+7ss2eOlfglJrqmGfVkdejx91JBKq33I1eCr5TjuyLGxc7XCzWFrgxucMxiAgVSlj9p52/7afZ3+FGMH0xxJLwy+YMy5HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726202795; c=relaxed/relaxed;
	bh=wHwQUVfx/wrCQGTY2raGZIsb8cZ8NBoipQ6n64+HNRs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XzD0lqLFfVGhI4hTzbmVwZe5bacKBgQE0Qwz4RGUcn9t8SIJYsUN/xKpvfvsHefmP5jj1jDIN/MdHaR6XhsPu4cm+6AWeie9JBVlIOdpBPOjpCFV9BOkIvrdlewiWlvvRrPRfnF1zuZmrY3njhVFWPfNtk5MKaSvrtpJ+cPolMlda6GmQ6T/jMkAFvRVscLZQGiLLMBtLdRSKAHwQOueEH8jdrv/5f0DcgcVo6A8rb6OWsX3S86zluBBd7vsDoZC7IZIl+FSRvHoIAoxYGX1oU5Tt42c4wDD95cf0ggD191JLvehJgCvDu003SRjwTHn8iJA6vPP3k9zIYfl+a+5tA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AV4pI3z2; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AV4pI3z2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X4hbZ1ZVnz2xpk
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Sep 2024 14:46:33 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48CMJRx6022908;
	Fri, 13 Sep 2024 04:46:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=pp1; bh=w
	HwQUVfx/wrCQGTY2raGZIsb8cZ8NBoipQ6n64+HNRs=; b=AV4pI3z2IwVuCQhPp
	E/oRso8HRm50WbpF33CcEI4FYOhIJKy8PcPNvRC2jw8HIWg1zVK0Dr4S5htNKIdB
	FMde2OCfE6H2p+W9UtfYqCO6+R2cP4lKBDyRtBunE7PnZeISWCVO0FRx1JFu2uBC
	asuvrasFLPZBESdAVjYYlGbiQrMnKg81vlDHwE1cPKfwiUIZuNEpSDVIm9/HGI7I
	ggVQh9x97+l28G0DqswWFvl8Xz2dl3WGStZWGPS11WOYJvomlt5rAizCxQ93o+6q
	CjwpqoLQH8BBhLqg6SAezRMfrPHlAbnuNraFc+Wmnz5z+7r/Nyfb6C+3D+bGSmsj
	hjh1w==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 41gc8qquxn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Sep 2024 04:46:11 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 48D4d3RM029365;
	Fri, 13 Sep 2024 04:46:10 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 41gc8qquxh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Sep 2024 04:46:10 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 48D1nLrR032099;
	Fri, 13 Sep 2024 04:46:09 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 41h2nn3v2k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Sep 2024 04:46:09 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 48D4k8qa28508908
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 13 Sep 2024 04:46:09 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D7F6658056;
	Fri, 13 Sep 2024 04:46:08 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9DE9158052;
	Fri, 13 Sep 2024 04:46:03 +0000 (GMT)
Received: from [9.204.206.229] (unknown [9.204.206.229])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 13 Sep 2024 04:46:03 +0000 (GMT)
Message-ID: <dc9f6cc9-e6b6-46eb-a239-3ad2b80196e7@linux.ibm.com>
Date: Fri, 13 Sep 2024 10:16:01 +0530
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] perf/powerpc: Count dropped samples in core-book3s
 PMU
To: Namhyung Kim <namhyung@kernel.org>, Peter Zijlstra
 <peterz@infradead.org>,
        Ingo Molnar <mingo@kernel.org>
Cc: Kan Liang <kan.liang@linux.intel.com>,
        Mark Rutland
 <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Stephane Eranian <eranian@google.com>,
        Ravi Bangoria <ravi.bangoria@amd.com>,
        Michael Ellerman
 <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Naveen N Rao <naveen@kernel.org>, Kajol Jain <kjain@linux.ibm.com>,
        Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
        linuxppc-dev@lists.ozlabs.org
References: <20240905031027.2567913-1-namhyung@kernel.org>
 <20240905031027.2567913-5-namhyung@kernel.org>
Content-Language: en-US
From: Madhavan Srinivasan <maddy@linux.ibm.com>
In-Reply-To: <20240905031027.2567913-5-namhyung@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: jEN4VGyhxtgl2gz49S-9B6x6kKHcS7hB
X-Proofpoint-ORIG-GUID: Rm_KgN1hGv4bF7FKRXYEBDpBQ2A5Apep
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-13_01,2024-09-12_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 clxscore=1011 mlxlogscore=999 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409130030


On 9/5/24 8:40 AM, Namhyung Kim wrote:
> Due to the hardware limitation, sometimes it could sample kernel address
> while attr.exclude_kernel is set.  In that case it silently drops the
> sample.  Let's count that case in the new dropped_samples counter.

Nice catch. Thanks for the fix.
Reviewed-by: Madhavan Srinivasan <maddy@linux.ibm.com>

> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: Naveen N Rao <naveen@kernel.org>
> Cc: Kajol Jain <kjain@linux.ibm.com>
> Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> Cc: linuxppc-dev@lists.ozlabs.org
> Signed-off-by: Namhyung Kim <namhyung@kernel.org>
> ---
>   arch/powerpc/perf/core-book3s.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
> index 42867469752d73cf..553e288b9f113836 100644
> --- a/arch/powerpc/perf/core-book3s.c
> +++ b/arch/powerpc/perf/core-book3s.c
> @@ -2287,8 +2287,10 @@ static void record_and_restart(struct perf_event *event, unsigned long val,
>   	 */
>   	if (event->attr.exclude_kernel &&
>   	    (event->attr.sample_type & PERF_SAMPLE_IP) &&
> -	    is_kernel_addr(mfspr(SPRN_SIAR)))
> +	    is_kernel_addr(mfspr(SPRN_SIAR))) {
> +		atomic64_inc(&event->dropped_samples);
>   		record = 0;
> +	}
>   
>   	/*
>   	 * Finally record data if requested.

