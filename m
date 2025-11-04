Return-Path: <linuxppc-dev+bounces-13714-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A325C2F719
	for <lists+linuxppc-dev@lfdr.de>; Tue, 04 Nov 2025 07:27:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d0z50667Qz3bf3;
	Tue,  4 Nov 2025 17:27:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762237620;
	cv=none; b=AeH20llocIpuyLzwcNDbJ+94FMmmrOxusojA4am52zhjbk4h+RpN9HKxfkI4/j1PPf4rTu3Jl8gsZi6ga34yDY56NjpD6NOAmSZ4uHZBVDKF97tsWDP+vunljOeGjWIxXE+NNulhJQJFHa+Dq3JWss5DdbNKXfmwSHYori03+RjelMrrnsbvUQu9FeseJPUacNGIH3vrFCuYZPoi/OGdqss3qOlzjTnhU//4FfOtLXisewIEhyhvBKWHtwWEhbPmYGlBbD4H8bt6cbuljpqAsaNfUuNiKCj1Vj/SQJc8lrlxNG4HIrJJWO9dtZFyilWwZqTvfcmipHsYUhFZN+xevA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762237620; c=relaxed/relaxed;
	bh=cgG0nhaHUcLMZC9dpZeHBf/+ElAE78vPoSHxQu3AQgg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jb4ESr200rOHZB3n9Tg1llQomY0q2Aer7g5jrDgKtacgJR2vx/e2NBKUv+r2OLW1mtx73jL0FOhiXaHRAfd6Kk7kfOTmLv/BFixCUuRFLUJfAZWus4oOX96Ayg9jpaoGYuVH732V7nkIHur3l3IXjQ0tSTsqd1um4d6jo3ztHU0pf4XEr3rOYqHUrrA5iQXpx+UacedPmRVBt7++QooNM9dj05k8BytYYcoqik9jOXKrb+Q84Se2RyMnef8lUFvx3G3hCZ6+epXYJb/cecuNdIVV4wSAcWzO8dBJGko/2TzVLYt8OlUkneYSXiduCXVAsOKwDz6ObA6MXG03sbMz5Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=a1/lePkB; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=a1/lePkB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d0z4z4v72z304H
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Nov 2025 17:26:59 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5A41O1fx011187;
	Tue, 4 Nov 2025 06:26:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=cgG0nh
	aHUcLMZC9dpZeHBf/+ElAE78vPoSHxQu3AQgg=; b=a1/lePkBJIBKfGpM+Diiqd
	yFiiyMbvL97fzz5OwrZV9/Rtake6MxkT0YUtu675T+miSN6+BW7g02amsbq1Pg6V
	/AT6TyxYvu26qriOh9D1pHiD8PrGwaTZpsbD8HtS3v8uScrYXFE4E6v5RzXhlrAN
	wmgg+CTYo/bNc3uOdlyXc0xxGCEp5gHoEjihvlFSUMFdeuKhQf0EUP2fgnqNRtC4
	6zYsJeI72g9OmLleGw0/DnaY/VbpRvb5aQnlg0gRbVCEz9SLjW2cAGUNXF31Kraz
	Mb3HGDKgWJMwhdxckzSWEAVyoHKQRmm/4vidHe5aCHFQXGDGb1LhdyXzfs3EdNKw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a57mr2kwx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Nov 2025 06:26:52 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5A46OVNd029361;
	Tue, 4 Nov 2025 06:26:52 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a57mr2kww-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Nov 2025 06:26:52 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5A46KE3w009831;
	Tue, 4 Nov 2025 06:26:51 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4a5x1k9ndr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Nov 2025 06:26:51 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5A46QlQ340108410
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 4 Nov 2025 06:26:47 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 47BE720043;
	Tue,  4 Nov 2025 06:26:47 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 967D020040;
	Tue,  4 Nov 2025 06:26:43 +0000 (GMT)
Received: from [9.109.204.116] (unknown [9.109.204.116])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  4 Nov 2025 06:26:43 +0000 (GMT)
Message-ID: <dd8b0b2e-b3ea-42c9-896f-630c864883f2@linux.ibm.com>
Date: Tue, 4 Nov 2025 11:56:42 +0530
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
Subject: Re: [PATCH 0/2] Export kdump crashkernel CMA ranges
To: linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Baoquan he <bhe@redhat.com>,
        Jiri Bohac <jbohac@suse.cz>, Shivang Upadhyay <shivangu@linux.ibm.com>,
        linuxppc-dev@lists.ozlabs.org, kexec@lists.infradead.org,
        Vivek Goyal <vgoyal@redhat.com>, Dave Young <dyoung@redhat.com>,
        Pingfan Liu <piliu@redhat.com>,
        "Ritesh Harjani (IBM)"
 <ritesh.list@gmail.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Aditya Gupta <adityag@linux.ibm.com>,
        Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
        Hari Bathini <hbathini@linux.ibm.com>
References: <20251103035859.1267318-1-sourabhjain@linux.ibm.com>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <20251103035859.1267318-1-sourabhjain@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: opMdqXoXuHzzqDA97ozX4NfvyOjw1gdU
X-Authority-Analysis: v=2.4 cv=MKhtWcZl c=1 sm=1 tr=0 ts=69099cac cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z4Rwk6OoAAAA:8 a=20KFwNOVAAAA:8 a=VnNF1IyMAAAA:8 a=voM4FWlXAAAA:8
 a=JfrnYn6hAAAA:8 a=iJAgtciTF2dadzWhSi8A:9 a=QEXdDO2ut3YA:10
 a=HkZW87K1Qel5hWWM3VKY:22 a=IC2XNlieTeVoXbcui8wp:22 a=1CNFftbPRP8L7MoqJWF3:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: pafzTugha00TAbBSMvDd4fbGf2Zn_0WQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAxMDAwMSBTYWx0ZWRfX2lxEIQfUWC+o
 Io1msdIIhj0d8XkDLU4OSf9j5sShsyGbQy8KjVwl+EjyIx+77cwrRZ2scoYzaBv09DunZD4j+ih
 28ufcFTwCNuCWp9Ogab3FwHEH/kb47D4jp4Sd8+nOFyPzYKPL6y4sqPF6h7rvX1V+rGNSsSEymH
 JcrkFqnmw6WrulIepMl+oDgh/h6V8+t8Sc96JUnBCIMq6f0FZY7DM1M+HkWitedzdIJ9pnx0V3W
 AzG6wxN5aN/sohGGPNxYUnVT+qz2GX/3v8zYzbZvjh8wGYCFn664dax5y1XB2+WwijXhGm3ScVB
 Up3QIfCzTqzyTXZMaDJquiQwbkh+JE88BJ4k4iVoS9+jL1B8g0sQhhCJnGYF63k97JCS31ljU7X
 l7PMaTZwmBhCEtRVeDuAu6FvJICHKQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0 clxscore=1011
 lowpriorityscore=0 malwarescore=0 adultscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511010001
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Cc others who can provide input.

On 03/11/25 09:28, Sourabh Jain wrote:
> /sys/kernel/kexec_crash_cma_ranges to export all CMA regions reserved
> for the crashkernel to user-space. This enables user-space tools
> configuring kdump to determine the amount of memory reserved for the
> crashkernel. When CMA is used for crashkernel allocation, tools can use
> this information to warn users that attempting to capture user pages
> while CMA reservation is active may lead to unreliable or incomplete
> dump capture.
>
> While adding documentation for the new sysfs interface, I realized that
> there was no ABI document for the existing kexec and kdump sysfs
> interfaces, so I added one.
>
> The first patch adds the ABI documentation for the existing kexec and
> kdump sysfs interfaces, and the second patch adds the
> /sys/kernel/kexec_crash_cma_ranges sysfs interface along with its
> corresponding ABI documentation.
>
> *Seeking opinions*
> There are already four kexec/kdump sysfs entries under /sys/kernel/,
> and this patch series adds one more. Should we consider moving them to
> a separate directory, such as /sys/kernel/kexec, to avoid polluting
> /sys/kernel/? For backward compatibility, we can create symlinks at
> the old locations for sometime and remove them in the future.
>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Baoquan he <bhe@redhat.com>
> Cc: Jiri Bohac <jbohac@suse.cz>
> Cc: Shivang Upadhyay <shivangu@linux.ibm.com>
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: kexec@lists.infradead.org
>
> Sourabh Jain (2):
>    Documentation/ABI: add kexec and kdump sysfs interface
>    crash: export crashkernel CMA reservation to userspace
>
>   .../ABI/testing/sysfs-kernel-kexec-kdump      | 53 +++++++++++++++++++
>   kernel/ksysfs.c                               | 17 ++++++
>   2 files changed, 70 insertions(+)
>   create mode 100644 Documentation/ABI/testing/sysfs-kernel-kexec-kdump
>


