Return-Path: <linuxppc-dev+bounces-1525-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE0F97E5A7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Sep 2024 07:37:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XBsFC6m4Hz2yPM;
	Mon, 23 Sep 2024 15:37:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727069823;
	cv=none; b=K8Lob7+iwLBrl9OllAhY8ik0gNWEtEbM1j9YKuz3qBr9Gyd9NAXxhO2peUW++1Ng1AajUQ/wL6t1e7K0y/R8To2OmP+jpDIoJ/35a8kPA/cBbzezR9KtA7yTFcjET7fxrPdwPn4aCBrf0ifCjSXQ216yo4buytFKOK4Ja8e8kQ9GtefJB3TvBCf9ZIjgTwRcm9Kyyx9JyJ0Ua0K9YFekggHW3ba73uCZvbBweW+w+B/Bu95OIqTi5K3S9J6YMyNudYfdfAqdnxnmUYDXm+xeyJziTn06Scy2dImMBTa/macA/V+JTzl4dGMneADae5Mz/IdHgrlmhKo26VIuxIvE8w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727069823; c=relaxed/relaxed;
	bh=e6xPyTGaCARr9kHdRBWXY1Z266siIPfCD8X32fMOBgk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=aGihryqC3DMcOSm9aRb6joPoGTgvVd1Ie8HT5mhSMbqrYuSITXYeGsZfHPDsxhr+hlAzHQA1OyctnEJ+qskPUE0e5yl+ZkiCPxy/noOaTsn8XqbYAfTBpLN8MvBT0A9c2qW8H1gR7ITcY6Bi7H1v/swnJWYXO6kJ2/T8bKW4r6bk7PZOKgb7veihA62GojMB4PIAFf7P0pziC1/LJTWAqW2TWz+y/VRTzRKqQuEJawu+gYu9iS8LN5r/8rOl6n+HiFoKb61Moy1Olmp4mCizn1A3xCHx/YsRHCeW9rBKtwMW5GwFi9sRTPWy152jK6tbzDd1KJY1pGQW1Hj1hjoiGw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZLPSa//g; dkim-atps=neutral; spf=none (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=venkat88@linux.vnet.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZLPSa//g;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=venkat88@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XBsFC3QZVz2yNJ
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Sep 2024 15:37:02 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48N2dGBT001531;
	Mon, 23 Sep 2024 05:36:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=pp1; bh=
	e6xPyTGaCARr9kHdRBWXY1Z266siIPfCD8X32fMOBgk=; b=ZLPSa//gxK6eokjQ
	2VIbkMX+k5zxZ1SDEpg1+f2AVpNKjPx1bXlbKlYZgu5UAuEb+AQRACfVHalQvcEx
	3bd+ol2VC7FE+P2FwO6LiTvNl2Aur4ZmthqyDTVYG980lx08IlTsMn2Yk0zFTqbG
	72u6VfxZwhUzzQzbSuF+Zq+M5NJeCiVAMjwX2/WM2u1npnmSM27Bs9hg6dZSL1uI
	FXCJn/NhnWwexIlMGja4eFhCLI0Fx3d74XMzRGqfdnpR3nsB1Y2XHxWPY1AVOXcs
	rnU+7Z5zvavmRKSUDhyG0vHOEyxYU0G8R6hT3d2l+aMHFXe1G/eD0YIxjxcnoFT9
	1D4WKg==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 41snna1qwy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Sep 2024 05:36:49 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 48N0daXU020846;
	Mon, 23 Sep 2024 05:36:48 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 41tb62vb6w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Sep 2024 05:36:48 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 48N5alGB28508748
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 23 Sep 2024 05:36:47 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6583858052;
	Mon, 23 Sep 2024 05:36:47 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 28EF358065;
	Mon, 23 Sep 2024 05:36:45 +0000 (GMT)
Received: from [9.61.252.168] (unknown [9.61.252.168])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 23 Sep 2024 05:36:44 +0000 (GMT)
Message-ID: <03a55b4b-eb45-4187-9de6-ef06f8176d05@linux.vnet.ibm.com>
Date: Mon, 23 Sep 2024 11:06:43 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [Bug][Git-Bisect][6.11.0-next-20240917]BUG: Unable to handle
 kernel data access on read at 0xc00c020000013d88
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        akpm@linux-foundation.org, minchan@kernel.org, terrelln@fb.com,
        sfr@canb.auug.org.au
References: <57130e48-dbb6-4047-a8c7-ebf5aaea93f4@linux.vnet.ibm.com>
 <20240923021557.GA38742@google.com>
Content-Language: en-GB
From: Venkat Rao Bagalkote <venkat88@linux.vnet.ibm.com>
In-Reply-To: <20240923021557.GA38742@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: j_6Ip9-DdyJmOeFLwhwqwk8BF74tf54h
X-Proofpoint-ORIG-GUID: j_6Ip9-DdyJmOeFLwhwqwk8BF74tf54h
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-23_02,2024-09-19_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 mlxscore=0 mlxlogscore=858 spamscore=0 impostorscore=0 priorityscore=1501
 phishscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2409230037

Hello,


Below is the TC, I was running.


https://github.com/avocado-framework-tests/avocado-misc-tests/blob/master/generic/ltp.py

Regards,

Venkat.

On 23/09/24 7:45 am, Sergey Senozhatsky wrote:
> Hi,
>
> On (24/09/22 22:23), Venkat Rao Bagalkote wrote:
>> Greetings!!!
>>
>> I am observing Kernel OOPs on PowerPC system, while running LTP Test case.
>>
>> [11472.962838] BUG: Unable to handle kernel data access on read at
>> 0xc00c020000013d88
>> [11472.962846] Faulting instruction address: 0xc00000000055e2c0
> [..]
>> [11472.963005] NIP [c00000000055e2c0] kfree+0x60/0x468
>> [11472.963013] LR [c008000004e02838] zram_destroy_comps+0x5c/0xa4 [zram]
>> [11472.963020] Call Trace:
>> [11472.963023] [c0000005da817b30] [c00000051f580440] 0xc00000051f580440
>> (unreliable)
>> [11472.963028] [c0000005da817ba0] [c008000004e02838]
>> zram_destroy_comps+0x5c/0xa4 [zram]
>> [11472.963034] [c0000005da817bd0] [c008000004e02d24]
>> zram_reset_device+0x178/0x250 [zram]
>> [11472.963040] [c0000005da817c20] [c008000004e031e0] reset_store+0xd0/0x174
>> [zram]
>> [11472.963046] [c0000005da817c80] [c000000000a85874]
>> dev_attr_store+0x34/0x50
>> [11472.963052] [c0000005da817ca0] [c00000000070e7a4]
>> sysfs_kf_write+0x64/0x78
>> [11472.963060] [c0000005da817cc0] [c00000000070d2a8]
>> kernfs_fop_write_iter+0x1b0/0x290
>> [11472.963066] [c0000005da817d10] [c000000000604868] vfs_write+0x38c/0x488
>> [11472.963071] [c0000005da817dc0] [c000000000604c98] ksys_write+0x84/0x140
> Can you post the script that you run?

