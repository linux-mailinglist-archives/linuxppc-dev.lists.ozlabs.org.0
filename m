Return-Path: <linuxppc-dev+bounces-14732-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C984CB8C22
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Dec 2025 13:02:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dSSk20zJfz2xjb;
	Fri, 12 Dec 2025 23:02:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765540921;
	cv=none; b=RgI+vnXumoQQDHE3H+Gk4nFke+BjgZ8YqZdWTXYI6o12p4pRy5uOVo4k/aUrSSuMXaZ109DMdLEabXUmHiU+BGWOq7fgHCVA3l7UR4RfO7lYGc6mQ2VtjVHyz8RVUEkyXm3L+1Q5A462j1LUcMSUpZ1Xf0pnwu4WsMxeq3mdertXUcGhFlJfLnzK+BpjxawgIVQl5HIHXvtlpWcJ7AnL7NOJOBN+VigodvBtdxMFn4U5+GJqxp31X3ZAGJzP5DuAhrfX5YlcyqdGUezy5uB4x/6fXf+oqbrdZXXFaWtSI4BKKC/yapTG2FK1uIv5pNlWez2WF3i83jx0lHfRmE0DvA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765540921; c=relaxed/relaxed;
	bh=3z+tc1NpR5UUK27rqzSVFLKc+7teQZCqO8GScwzmUXA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ZPX4erUsvjlMFNo+Dz1GVVdHe83UX+4McXfQIbhbQqwcnkQD6YcD0b12AGk4kNSgofCPsqlADGxX8fDoSAUhkE72lAyb8t9hmK7/GikkiQBlEg3k+XNw7j0iar85fa0MxKjabAnmRsNRZuPkwRYv9eQyBnHObeTjJtLaJSEnoA8lnIVfpp14Si0I5wVtk9aBwc/VaD0qu0St0fKhqTLp/Azkag4YYfu9DGG3yyght7cb4MUfzOPlPtjvcgY2UUNkF8nLdGUH9fLYpnwUnmsHllx9PDLZL4MDzQLhTJ4st2eq3NUnBQ36U9H3qDLRUO2LQ7Kl/KYrme2II5XUAtVunA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EAB+6RXg; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=adityab1@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EAB+6RXg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=adityab1@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dSSk05XMTz2x9M
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Dec 2025 23:02:00 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5BC4RkhQ022275;
	Fri, 12 Dec 2025 12:01:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=3z+tc1
	NpR5UUK27rqzSVFLKc+7teQZCqO8GScwzmUXA=; b=EAB+6RXgQzo6yFR44YXZf5
	X3tDcwqkeIZO7uOFv+tB/jh4A0Pj5biLs9UUy60/zTS43JRWRj9KNMzMa+rYDIjA
	jYV46CB5n9wthbViCsWDOij84+/r6jLhFA6bWusK+4CysHSOp9p/Z+gFYzBpf7SC
	ZueIHjqc85ZB+y0gnkXGKcextCJpDQrUXF8jptqm2x7Ta7+41coQZPsylNKAv8G0
	Xu/nfEI76z65z1w0WJpW0iQtmzFC4c0lCCcIHXaLrBtoVzZOShJY/Mb/EmGoRZPI
	WkcEXRR/Kqt8c8vkYEHL9RE+hp5WhaT5Le1nGciBJoHqF+EPnJx1qQiNJ4TWjd4g
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4avc0kd65b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Dec 2025 12:01:45 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5BCBxjH7003043;
	Fri, 12 Dec 2025 12:01:45 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4avc0kd657-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Dec 2025 12:01:45 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BC9uA5e030331;
	Fri, 12 Dec 2025 12:01:44 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4avxtskvb3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Dec 2025 12:01:44 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5BCC1gYJ44171672
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 12 Dec 2025 12:01:42 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6FC422004D;
	Fri, 12 Dec 2025 12:01:42 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8C66620040;
	Fri, 12 Dec 2025 12:01:36 +0000 (GMT)
Received: from [9.61.250.41] (unknown [9.61.250.41])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 12 Dec 2025 12:01:36 +0000 (GMT)
Message-ID: <60dfb410-b814-4db5-b928-6793fba012a4@linux.ibm.com>
Date: Fri, 12 Dec 2025 17:31:34 +0530
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
Subject: Re: [PATCH RESEND] selftests/powerpc/pmu/: Add
 check_extended_reg_test to .gitignore
To: Gopi Krishna Menon <krishnagopi487@gmail.com>, maddy@linux.ibm.com,
        mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        shuah@kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org
References: <20250922004439.2395-1-krishnagopi487@gmail.com>
Content-Language: en-US
From: Aditya Bodkhe <adityab1@linux.ibm.com>
In-Reply-To: <20250922004439.2395-1-krishnagopi487@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=Cf8FJbrl c=1 sm=1 tr=0 ts=693c0429 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=VnNF1IyMAAAA:8 a=wQKQ9SNmtxRVP8ipeUEA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: nV8BXba4YoY5DJvZBK1AYrhH6zswStZi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA2MDAxNiBTYWx0ZWRfX8HnwRLd2e+WU
 zk1orW3QtNGqzd7dsilTBoaLnt8QEdltcd8WJepODGKC0h9obrpws6VWLZmzHmAmCNGgdf1xneg
 CKRChMzUtw4wbmSgypk9Dn4GxMmJ8ox6nzHn+LEji9fhgIyOjgfpPII4xp3Av1QzzFFU378T4GR
 zpfjWWDqm8hMUek18MbSAbSVngEP3UUcZQ0i0JDAlrIYfBUPC6jPBtT77+h0rgUJxPsRWYabz4a
 crWiNSseSYQ2P0eBvQZ5tqzkJKUDznE7TX6chBvvAUe/2ORzQJDHXgtfHj3NMb+tsu4iPWk8EyI
 /FB8lCIcJVeO3F5xUQtx7A+ljyAzWOqKv3dhGtd+44z3d7zO+ZaaTTp3WCE9KV4RT0iTPqcPQJP
 dHedoZh/8J3ptgxz0QrU/gHq3hZpbA==
X-Proofpoint-GUID: GxgCxAftOxTNCp4AAKpB7jSYyLNmPx95
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-12_03,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 clxscore=1011 adultscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510240000
 definitions=main-2512060016
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 22/09/25 6:11 am, Gopi Krishna Menon wrote:
> Add the check_extended_reg_test binary to .gitignore to avoid accidentally
> staging the build artifact.
>
> Signed-off-by: Gopi Krishna Menon <krishnagopi487@gmail.com>
> ---
>   tools/testing/selftests/powerpc/pmu/sampling_tests/.gitignore | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/tools/testing/selftests/powerpc/pmu/sampling_tests/.gitignore b/tools/testing/selftests/powerpc/pmu/sampling_tests/.gitignore
> index f93b4c7c3a8a..ea29228334e8 100644
> --- a/tools/testing/selftests/powerpc/pmu/sampling_tests/.gitignore
> +++ b/tools/testing/selftests/powerpc/pmu/sampling_tests/.gitignore
> @@ -1,5 +1,6 @@
>   bhrb_filter_map_test
>   bhrb_no_crash_wo_pmu_test
> +check_extended_reg_test
>   intr_regs_no_crash_wo_pmu_test
>   mmcr0_cc56run_test
>   mmcr0_exceptionbits_test

I tested this patch , the file is correctly ignored through the updated 
.gitignore entry.

Tested-by: Aditya Bodkhe <adityab1@linux.ibm.com>

Thanks,
Aditya


