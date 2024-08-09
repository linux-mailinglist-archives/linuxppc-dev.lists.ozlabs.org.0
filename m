Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9E594C9A8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Aug 2024 07:36:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LGWMVFQ4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WgCMR40c1z2ytN
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Aug 2024 15:36:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LGWMVFQ4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WgCLl5P8Kz2yRC
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Aug 2024 15:35:59 +1000 (AEST)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 478Cb3I8005727;
	Fri, 9 Aug 2024 05:35:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=pp1; bh=
	ZKL8Q9qcvjVY5MH9IXvnciiyhYMEMZN0/x4DWSJkYTU=; b=LGWMVFQ44cMhD1G6
	H8FirD6qcFLsFBZC3mdg1iP72C28Yqb4VEUo5FH+RnLDJRk6x2uywj1mkkAvyN0R
	wayXmEHdENljkC9LloEJSvrEYTWfoQN1VhjMShvnk/FXWrTPyn8f4YuHokPn5m3T
	oBc231Y3vl1szuMGxKx2O9sN/y1x/z+dJKlBc/nU3Qa7W13E1xqDiR9u/BFeQeJo
	W466GtrX8sCGw5vK2VeOaJe9z4PBnoBVQVx1il9oGhv8f4eVPXVQwUHJ0yguTGYw
	tcxhZ0nKsltNb0GF2NAm6Ny+OR3HMtQdSSLuwzSCl84UJVAHGfZEdF7Eg6ZUbZoY
	PxwwQQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 40vwkca1a8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Aug 2024 05:35:50 +0000 (GMT)
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4795Zn9J030019;
	Fri, 9 Aug 2024 05:35:49 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 40vwkca1a6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Aug 2024 05:35:49 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 4794DNjX006462;
	Fri, 9 Aug 2024 05:35:49 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 40t13mssc6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Aug 2024 05:35:49 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4795Zjlq18219434
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 9 Aug 2024 05:35:47 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 548BA20040;
	Fri,  9 Aug 2024 05:35:45 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C9D5A2004F;
	Fri,  9 Aug 2024 05:35:33 +0000 (GMT)
Received: from [9.43.4.15] (unknown [9.43.4.15])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  9 Aug 2024 05:35:33 +0000 (GMT)
Message-ID: <ba0c218b-fb38-41a6-8339-265cc75466aa@linux.ibm.com>
Date: Fri, 9 Aug 2024 11:05:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Document/kexec: Generalize crash hotplug description
To: =?UTF-8?B?UGV0ciBUZXNhxZnDrWs=?= <petr@tesarici.cz>
References: <20240805050829.297171-1-sourabhjain@linux.ibm.com>
 <20240808132423.0f313ffe@meshulam.tesarici.cz>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <20240808132423.0f313ffe@meshulam.tesarici.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: HBp7JP1jjSSjsCq5NunZcsWQeKbk0vI8
X-Proofpoint-ORIG-GUID: kU2XRt0kb8RKUAbJXblqXveslvhGz5mj
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-09_02,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 malwarescore=0 adultscore=0 spamscore=0 mlxlogscore=999 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408090041
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: bhe@redhat.com, x86@kernel.org, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Petr,

On 08/08/24 16:54, Petr Tesařík wrote:
> Hi Sourabh,
>
> sorry for late reply, was on vacation and then catching up...
>
> On Mon,  5 Aug 2024 10:38:29 +0530
> Sourabh Jain <sourabhjain@linux.ibm.com> wrote:
>
>> Commit 79365026f869 ("crash: add a new kexec flag for hotplug support")
>> generalizes the crash hotplug support to allow architectures to update
>> multiple kexec segments on CPU/Memory hotplug and not just elfcorehdr.
>> Therefore, update the relevant kernel documentation to reflect the same.
>>
>> No functional change.
>>
>> Cc: Petr Tesarik <petr@tesarici.cz>
>> Cc: Hari Bathini <hbathini@linux.ibm.com>
>> Cc: kexec@lists.infradead.org
>> Cc: linux-kernel@vger.kernel.org
>> Cc: linuxppc-dev@lists.ozlabs.org
>> Cc: x86@kernel.org
>> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>> ---
>>
>> Discussion about the documentation update:
>> https://lore.kernel.org/all/68d0328d-531a-4a2b-ab26-c97fd8a12e8b@linux.ibm.com/
>>
>> ---
>>   .../ABI/testing/sysfs-devices-memory          |  6 ++--
>>   .../ABI/testing/sysfs-devices-system-cpu      |  6 ++--
>>   .../admin-guide/mm/memory-hotplug.rst         |  5 ++--
>>   Documentation/core-api/cpu_hotplug.rst        | 10 ++++---
>>   kernel/crash_core.c                           | 29 ++++++++++++-------
>>   5 files changed, 33 insertions(+), 23 deletions(-)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-devices-memory b/Documentation/ABI/testing/sysfs-devices-memory
>> index a95e0f17c35a..421acc8e2c6b 100644
>> --- a/Documentation/ABI/testing/sysfs-devices-memory
>> +++ b/Documentation/ABI/testing/sysfs-devices-memory
>> @@ -115,6 +115,6 @@ What:		/sys/devices/system/memory/crash_hotplug
>>   Date:		Aug 2023
>>   Contact:	Linux kernel mailing list <linux-kernel@vger.kernel.org>
>>   Description:
>> -		(RO) indicates whether or not the kernel directly supports
>> -		modifying the crash elfcorehdr for memory hot un/plug and/or
>> -		on/offline changes.
>> +		(RO) indicates whether or not the kernel update of kexec
>> +		segments on memory hot un/plug and/or on/offline events,
>> +		avoiding the need to reload kdump kernel.
> This sentence somehow lacks a verb. My suggestion:
>
>    (RO) indicates whether or not the kernel updates relevant kexec
>    segments on memory hot un/plug and/or on/offline events, avoiding the
>    need to reload kdump kernel.


Thanks for the review. I will update the document as suggested.


- Sourabh Jain

>
>> diff --git a/Documentation/ABI/testing/sysfs-devices-system-cpu b/Documentation/ABI/testing/sysfs-devices-system-cpu
>> index 325873385b71..f4ada1cd2f96 100644
>> --- a/Documentation/ABI/testing/sysfs-devices-system-cpu
>> +++ b/Documentation/ABI/testing/sysfs-devices-system-cpu
>> @@ -703,9 +703,9 @@ What:		/sys/devices/system/cpu/crash_hotplug
>>   Date:		Aug 2023
>>   Contact:	Linux kernel mailing list <linux-kernel@vger.kernel.org>
>>   Description:
>> -		(RO) indicates whether or not the kernel directly supports
>> -		modifying the crash elfcorehdr for CPU hot un/plug and/or
>> -		on/offline changes.
>> +		(RO) indicates whether or not the kernel update of kexec
>> +		segments on CPU hot un/plug and/or on/offline events,
>> +		avoiding the need to reload kdump kernel.
> Same as above.
>
> Otherwise LGTM.
>
> Petr T

