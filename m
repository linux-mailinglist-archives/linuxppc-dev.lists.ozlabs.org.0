Return-Path: <linuxppc-dev+bounces-5496-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE65A1A1CE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jan 2025 11:27:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YdxvZ4FVrz302N;
	Thu, 23 Jan 2025 21:27:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737628026;
	cv=none; b=aDGlbRIQJHs5hTvri4mm/JDbEqrLCCWsKjDrQBeRLUog4KrJYJSgHRrw3ZxPbzy8YmK7H/KLEZUPRAUESYGq52eBcXshe2W/8cUZch7EuFZPXgrt3yTr3A65+Rakn2+UkZh60EL91da9t+ja+6bpMMYiUvoOzZldA2MiERzGToUUdAoeVShMDWsRzLbGaJ3CDdfIOifaWKg/AI2hqv6hmGitq5YMRuvLDiUiEvE5JPpuVHcYGuZgcvnYaqfUjraVjz1Jc4RTM9aRs8hxGa82hds7b0LmSUtnvh3nGhYItFw+l65wGVEru9dcar1eSwUNPASb2hc511wowVlqEnQ0jA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737628026; c=relaxed/relaxed;
	bh=wU7CQkF8eV96lXf9kDZem94vsLOMZulWpJpAGXGFjh4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OR5tCVVi5OFaJi9TQoa7ghlfuRvtv2McNRaZ9DbkzcKGlJM7mt8E+mT+khJ8wclb85KwwuiWZv/+ih26b5mL43D6owOojlT7QJChveeXnYKmyX8ZOMYVmD+omrDisQSRP6Bfj2cTHb2zmnIWyH8XI9kUglochTFRquifoLT+fk3zdX4cwM+OU3n8VaySaivkO6fTbhsWgCRv1qCGtVacKsBBH4b9m9F7AIUYHKK7EBFJAGfqv7nt5HG7kjkWQmrlFI1wOS9Xo79S6yiWNZAEcbCSilsN+k5s3K7+/isuhJOcm+I3QAcLpmQFfWI5eqmDvbezcIgvjEZgxPm2ztpgtw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LxgpP/pi; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LxgpP/pi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YdxvY5mNhz2xGH
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jan 2025 21:27:05 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50N5O5uR026549;
	Thu, 23 Jan 2025 10:26:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=wU7CQk
	F8eV96lXf9kDZem94vsLOMZulWpJpAGXGFjh4=; b=LxgpP/piEvmCE15ze0N6Xv
	otp2Zjdpz0701IW4iJTrDxv1gopZ6JxOW6yo79quoj2Em/YZsIp7tWfUMMvcJw87
	WQ2YaZT1ZtM6LnkFPL/J1htbYDwHrwHzmtHhh90DLUuWdVdLKOy+j9/enZiAVgGv
	9fe4TmwmWKN7NFKnHvqeFcQWyYJtL8sy4qAmj0rHFvcoU1jt9o3kRbJ9ElykfZEq
	W7dDSUTwgiCGXshu0yeJdTu3Lf8AToxbrbLczHZdR5W51kDqSwoQeo48gVRUcYLL
	bvOJ+8FGTOVVjiVAO8epUtiCSssfhlS1HTXEbdLj8jaKvEZzndccaU269eKL71LA
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44bfk7sbm2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jan 2025 10:26:55 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50NABqDX024225;
	Thu, 23 Jan 2025 10:26:54 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 448q0yd6yv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jan 2025 10:26:54 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50NAQm7a46531014
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 Jan 2025 10:26:48 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 028CA20202;
	Thu, 23 Jan 2025 10:26:48 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3131220208;
	Thu, 23 Jan 2025 10:26:46 +0000 (GMT)
Received: from [9.203.114.244] (unknown [9.203.114.244])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 23 Jan 2025 10:26:46 +0000 (GMT)
Message-ID: <9207962e-acfe-4d68-a050-370ab0a48efa@linux.ibm.com>
Date: Thu, 23 Jan 2025 15:56:45 +0530
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
Subject: Re: [PATCH v2 3/6] crash: let arch decide crash memory export to
 iomem_resource
To: Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Baoquan he <bhe@redhat.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Mahesh Salgaonkar <mahesh@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>, kexec@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20250121115442.1278458-1-sourabhjain@linux.ibm.com>
 <20250121115442.1278458-4-sourabhjain@linux.ibm.com>
Content-Language: en-US
From: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <20250121115442.1278458-4-sourabhjain@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: jaUI3snupAfZbpaJCzi2DLU1fG-pC48g
X-Proofpoint-ORIG-GUID: jaUI3snupAfZbpaJCzi2DLU1fG-pC48g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-23_04,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 adultscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501230076
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Sourabh,

On 21/01/25 5:24 pm, Sourabh Jain wrote:
> insert_crashkernel_resources() adds crash memory to iomem_resource if
> generic crashkernel reservation is enabled on an architecture.
> 

> On PowerPC, system RAM is added to iomem_resource. See commit
> c40dd2f766440 ("powerpc: Add System RAM to /proc/iomem").

The changelog clearly says the patch was added for kdump. But 
kexec-tools or kernel code for kdump on powerpc don't seem to have relied
on that. Device-tree memory nodes were used instead? Wondering if
dropping commit c40dd2f766440 is better..

- Hari

> 
> Enabling generic crashkernel reservation on PowerPC leads to a conflict
> when system RAM is added to iomem_resource because a part of the system
> RAM, the crashkernel memory, has already been added to iomem_resource.
> 
> The next commit in the series "powerpc/crash: use generic crashkernel
> reservation" enables generic crashkernel reservation on PowerPC. If the
> crashkernel is added to iomem_resource, the kernel fails to add
> system RAM to /proc/iomem and prints the following traces:
> 
> CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.13.0-rc2+
> snip...
> NIP [c000000002016b3c] add_system_ram_resources+0xf0/0x15c
> LR [c000000002016b34] add_system_ram_resources+0xe8/0x15c
> Call Trace:
> [c00000000484bbc0] [c000000002016b34] add_system_ram_resources+0xe8/0x15c
> [c00000000484bc20] [c000000000010a4c] do_one_initcall+0x7c/0x39c
> [c00000000484bd00] [c000000002005418] do_initcalls+0x144/0x18c
> [c00000000484bd90] [c000000002005714] kernel_init_freeable+0x21c/0x290
> [c00000000484bdf0] [c0000000000110f4] kernel_init+0x2c/0x1b8
> [c00000000484be50] [c00000000000dd3c] ret_from_kernel_user_thread+0x14/0x1c
> 
> To avoid this, an architecture hook is added in
> insert_crashkernel_resources(), allowing the architecture to decide
> whether crashkernel memory should be added to iomem_resource.
> 
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Baoquan he <bhe@redhat.com>
> Cc: Hari Bathini <hbathini@linux.ibm.com>
> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
> Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: kexec@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> ---
>   include/linux/crash_reserve.h | 11 +++++++++++
>   kernel/crash_reserve.c        |  3 +++
>   2 files changed, 14 insertions(+)
> 
> diff --git a/include/linux/crash_reserve.h b/include/linux/crash_reserve.h
> index 1fe7e7d1b214..f1205d044dae 100644
> --- a/include/linux/crash_reserve.h
> +++ b/include/linux/crash_reserve.h
> @@ -18,6 +18,17 @@ int __init parse_crashkernel(char *cmdline, unsigned long long system_ram,
>   		unsigned long long *crash_size, unsigned long long *crash_base,
>   		unsigned long long *low_size, bool *high);
>   
> +#ifdef CONFIG_ARCH_HAS_GENERIC_CRASHKERNEL_RESERVATION
> +
> +#ifndef arch_add_crash_res_to_iomem
> +static inline bool arch_add_crash_res_to_iomem(void)
> +{
> +	return true;
> +}
> +#endif
> +
> +#endif
> +
>   #ifdef CONFIG_ARCH_HAS_GENERIC_CRASHKERNEL_RESERVATION
>   #ifndef DEFAULT_CRASH_KERNEL_LOW_SIZE
>   #define DEFAULT_CRASH_KERNEL_LOW_SIZE	(128UL << 20)
> diff --git a/kernel/crash_reserve.c b/kernel/crash_reserve.c
> index aff7c0fdbefa..190104f32fe1 100644
> --- a/kernel/crash_reserve.c
> +++ b/kernel/crash_reserve.c
> @@ -460,6 +460,9 @@ void __init reserve_crashkernel_generic(unsigned long long crash_size,
>   #ifndef HAVE_ARCH_ADD_CRASH_RES_TO_IOMEM_EARLY
>   static __init int insert_crashkernel_resources(void)
>   {
> +	if (!arch_add_crash_res_to_iomem())
> +		return 0;
> +
>   	if (crashk_res.start < crashk_res.end)
>   		insert_resource(&iomem_resource, &crashk_res);
>   


