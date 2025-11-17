Return-Path: <linuxppc-dev+bounces-14224-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA74C65BB3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Nov 2025 19:34:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d9Gc63M4Bz2yw7;
	Tue, 18 Nov 2025 05:34:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763404454;
	cv=none; b=W3P/0dFCOzD+O8E4a4MJAFyXiBAjdURRVlwZm1/pvenI5bt0k7UwspUV/PbasyR81Nynlb6JMHqrZlBVHH9gHmAm/aRc4/glLkmNEm2O4HseqWj7MP4rd+1VynweqhLR/Llpa4xqo7pbb/w4/9dVG/CVfaoYS3ehL7qVZJYAf75GPeMyu1n1E1pjiZh+hMlBAW4HKkA4RbNIjpVA0WDn6KhrUi30Ybk3UAYRQug5I+kIYbtY/HtsWvN4LR8e7YitxfIQBb4uFT1qbl7/mqlnlbxhB+MyRJgL2/1Gwa0fPOp57bZGTAFCK20KRtJDPOuDhBfAio8mIMZ2QoNY5as0OA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763404454; c=relaxed/relaxed;
	bh=CB4azO07xyg1JfNcGlWqEWWzwLoXdVKZABwYq4c8BVY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FgKKZz6+0TL2vzD3XL4bV46l8j/afqGqUVbQfyOMqjJ/Lkhn2R50+oX0zdt23ummX6jdWthPndekt+f3FrcRjO3csC/rm7TjNwtgDu99xSFkyCCFnT0AqZhWuf5tDdTyNkgH0v9Xg4IK80awVz3bnOtT0TOEnIKO6jYxqFgBkHKGc2Rs7asPF8go/GieR4lFNNXotPBJXeRXKY67KGrP0cwfexCiEzDsxCvo356bC30ym7lVfH5IYHWR+zqYsRJb7HwJ7eZTX8mK/A76MTlXprINkjJ8mtT0SLHMBE00dTX30lZg4xZgT9/JPdDJyKkx1DxI1RiIqTYX4V76K2y4WQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ijgo3hGQ; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ijgo3hGQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d9Gc46x8wz2ynC
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Nov 2025 05:34:12 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AHBlNK5017282;
	Mon, 17 Nov 2025 18:34:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=CB4azO
	07xyg1JfNcGlWqEWWzwLoXdVKZABwYq4c8BVY=; b=Ijgo3hGQSin4zYV/JXPl2r
	r9u2yN+I597/lVvzC+ylB3//8PWhCmpdUvnFXNwzQAWwW5xQ00DEx+ub/R9LDpkA
	VXbjOnZFQl8Urin/PTSKUB69FUZsSwOm7Wgj/FP3kJ8x0oZevMivvERtkUdWOlvf
	hBVNUodLNR+tn1VD/iuiSHl7ea3cQwE96MGVtWlnmBIZktOh4/riKUFCXXYtXyjF
	uRHqi1bXRZyQbeVOWQWVZ7Rwu2xx89uU/diSynw3exHi+wfVvklTIpPkyyISeeMW
	kNwWx0Xt7Vg5jIMVGM7y2X5SRqQdtfXO+HU5bkuvEbeMY/IQdJ9FV8TFKizXUlUw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejjtqd3b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Nov 2025 18:34:04 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5AHISmE4016800;
	Mon, 17 Nov 2025 18:34:03 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejjtqd39-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Nov 2025 18:34:03 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AHHrgtE010411;
	Mon, 17 Nov 2025 18:34:02 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4af3urygt3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Nov 2025 18:34:02 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5AHIXxmN8061184
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 Nov 2025 18:33:59 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 177362004B;
	Mon, 17 Nov 2025 18:33:59 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DEBB920040;
	Mon, 17 Nov 2025 18:33:55 +0000 (GMT)
Received: from [9.39.23.49] (unknown [9.39.23.49])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 17 Nov 2025 18:33:55 +0000 (GMT)
Message-ID: <469c97cb-5ea1-4c2b-a70f-b1a6febf70df@linux.ibm.com>
Date: Tue, 18 Nov 2025 00:03:54 +0530
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
Subject: Re: [PATCH v5] crash: export crashkernel CMA reservation to userspace
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Aditya Gupta <adityag@linux.ibm.com>,
        Baoquan he <bhe@redhat.com>, Dave Young <dyoung@redhat.com>,
        Hari Bathini <hbathini@linux.ibm.com>, Jiri Bohac <jbohac@suse.cz>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
        Pingfan Liu <piliu@redhat.com>,
        "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        Shivang Upadhyay <shivangu@linux.ibm.com>,
        Vivek Goyal <vgoyal@redhat.com>, linuxppc-dev@lists.ozlabs.org,
        kexec@lists.infradead.org
References: <20251117041905.1277801-1-sourabhjain@linux.ibm.com>
 <20251117094211.f8b4426ddda3bc0db5a62624@linux-foundation.org>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <20251117094211.f8b4426ddda3bc0db5a62624@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: CU9iESYN2j67vAEv2SgazOoBXgPDzaQZ
X-Proofpoint-ORIG-GUID: pxnzCu9taJxuT8G2Bw21OV8xLzu6ZmTS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAzMiBTYWx0ZWRfX27fIVSon0c6o
 UhN7VIJqtR8X3Mll3WY0QUrGaxzD3eoEtbFLhPJP4xwmtisCcKFGgUTtpJFYFNCuz8lf8PriBwf
 Mo/rT53XUKk0VG3KPLrYJQBmmAUS+LkMpqB5MZIdiHhU3g9cJ9i3x6DI6vpdneuc1Ax9A37PAhW
 jbgBAvIt23EnO+qkzXEfmuB0oieL+72N0YJ1lZUkit9jf2cPx7EzjkyHl9HGs3+dA9Q3KJANyRt
 kRxGDqsSZQPDM7yR6rUmru+g7ZN5mNdTzenEcOob2W5hsyzNv+YDsCzIltQgDNSusGPKfXOhwKx
 cRMIK2OaYKyHSzi8LzsGL1xB3TZn1WHiSqQOh2N51evC/vDLGqQuD/yNkIGHXvPhJeJwbS10Z4G
 0fKNeNrEdaZy3dB3H7icpuJe0t5wdg==
X-Authority-Analysis: v=2.4 cv=SvOdKfO0 c=1 sm=1 tr=0 ts=691b6a9c cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VnNF1IyMAAAA:8 a=0l8sKcWMKP3lnFByZlwA:9 a=QEXdDO2ut3YA:10
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 clxscore=1015
 suspectscore=0 phishscore=0 adultscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510240000
 definitions=main-2511150032
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 17/11/25 23:12, Andrew Morton wrote:
> On Mon, 17 Nov 2025 09:49:05 +0530 Sourabh Jain <sourabhjain@linux.ibm.com> wrote:
>
>> Add a sysfs entry /sys/kernel/kexec/crash_cma_ranges to expose all
>> CMA crashkernel ranges.
>>
>> This allows userspace tools configuring kdump to determine how much
>> memory is reserved for crashkernel. If CMA is used, tools can warn
>> users when attempting to capture user pages with CMA reservation.
>>
>> The new sysfs hold the CMA ranges in below format:
>>
>> cat /sys/kernel/kexec/crash_cma_ranges
>> 100000000-10c7fffff
>>
>> There are already four kexec and kdump sysfs entries under /sys/kernel.
>> Adding more entries there would clutter the directory. To avoid this,
>> the new crash_cma_ranges sysfs entry is placed in a new kexec node under
>> /sys/kernel/.
> I suggest not creating /sys/kernel/kexec in this patch.
>
> Moving everything into a new /sys/kernel/kexec is a separate patchset
> and a separate concept and it might never be merged - it changes ABI!
>
> So let's put crash_cma_ranges in /sys/kernel and move it to
> /sys/kernel/kexec within the other patchset.

Yeah sure. I will send the patches accordingly.

Thanks,
Sourabh Jain

