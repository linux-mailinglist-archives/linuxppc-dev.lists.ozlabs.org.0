Return-Path: <linuxppc-dev+bounces-6173-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E0BA357A0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Feb 2025 08:08:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YvNSH21Vyz30W7;
	Fri, 14 Feb 2025 18:08:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739516911;
	cv=none; b=dGch4k/xe54KLDLRbKRFq3BDfsnotAzHBABzD8myUt38ZncA/YQVE1xo2dC/vvfQjM2eST0qjoejBFOrUwkNpn5jr8dakNv/0kqIM/GqtGgLg0CRuysxq9RAnk9x8AtPVjXEp14vzOBm12UK7z6mpL4EFm4vUEQz4mOkpmgNcEFiK7OlKHjH6McFXw/gSyvByyCG9E+T8/pgOZmEqlfBDrkrCEEMC8qH0Ot8XqfaS7JfjZodBev4ryTRBJLmCiNTAo9L9+NquPxpeIJ3xptRCziyBPWmb/BU6+AwqfISmvnCJptwd2rViPF5nWArXW4AjK+gsah8oSHJvhWRLuSDZg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739516911; c=relaxed/relaxed;
	bh=sJHMdfV+dI8vIeJadG/y3SRzplajPm7cS6pBEV/nrPs=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=cRStRetxcKKiT3WOdyh0RHaCS0hKt/Y+Or1u3KBbfprDhyCS8i8TXaN+rVTAeGLRclKpTijbSk8m0y1MbZQyHrUK4G8/gVXn4KrEKuvVjqTn6KAPV9k779NTxf3WDNiGu6wAxUe+NgOIgGMWHhsyyHEUCyWuHgBJV8jFSVq4xhS3TrWUsEDF7Gp+yiO4Srz6/+nefCd2EBwL35lyJa/1d0pIeYEqSuiclN6xDCYzZVWyB3W8DhUYOwyZ5NIQbqkQdf2eXO6LnOKgXa51ncw2uD/yeXxbKZtWkHMjkOV5wvHqwX2gC1YmnLtUDd2/9kVL+mrpsppr1JOrUf7IsqkATA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KPx4HmXx; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KPx4HmXx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YvNSG2ZkCz30W0
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Feb 2025 18:08:30 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51E18Igx004229;
	Fri, 14 Feb 2025 07:08:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=sJHMdf
	V+dI8vIeJadG/y3SRzplajPm7cS6pBEV/nrPs=; b=KPx4HmXxSoWe/8hkvzfKe8
	UL9mRFToxfrrragXzRHEvuhM6vRvAFDMvE9RlqMikBg7RotboiPLWBuyo5D/MQo0
	ut3BUe5iaSxkmtOAMpfO/b37EowasLKBQE64ItziQcDd3xSnagUTO5IejllFaZTM
	mTKUIJGc9+9wGszMEXcphVTCZCGZhQHHfRhoZiM7q8PtAVp/qdQfw2XWHnwKq1TJ
	mhEEs1iuanzLVKC7gzAc8hqaikJrCT5OJvODMPv1rl+x6fj6c3I/LgnwUx0lpaqu
	kZtRw/w+gRRFVkCddWFFFUi78aoftcggUlWlWBYwI9HmdTcyAs4zf9R3XaASo6RQ
	==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44suwa1a1q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Feb 2025 07:08:27 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 51E4hooT028667;
	Fri, 14 Feb 2025 07:08:26 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 44pma22050-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Feb 2025 07:08:26 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 51E78PHh56689062
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Feb 2025 07:08:25 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 243D320043;
	Fri, 14 Feb 2025 07:08:25 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 19C8E20040;
	Fri, 14 Feb 2025 07:08:24 +0000 (GMT)
Received: from [9.43.1.221] (unknown [9.43.1.221])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 14 Feb 2025 07:08:23 +0000 (GMT)
Message-ID: <a4bbf5a8-2d16-413e-b69c-5b72388989b2@linux.ibm.com>
Date: Fri, 14 Feb 2025 12:38:23 +0530
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
Subject: Re: [linux-next-20250212] syscall kexec_file_load not available
To: Sourabh Jain <sourabhjain@linux.ibm.com>,
        Venkat Rao Bagalkote <venkat88@linux.vnet.ibm.com>,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
References: <8e73069b-5987-4a08-b13d-13fe691092ad@linux.vnet.ibm.com>
 <77c11ea2-f3ae-497a-aaba-f7b33f46743d@linux.ibm.com>
 <da9b637a-962a-4a9f-a4bf-b79e6119b29c@linux.ibm.com>
Content-Language: en-US
From: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <da9b637a-962a-4a9f-a4bf-b79e6119b29c@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: lulF5F6h3KmroQ3QIKUav9ATbumfIkTH
X-Proofpoint-ORIG-GUID: lulF5F6h3KmroQ3QIKUav9ATbumfIkTH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-14_02,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 malwarescore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0
 mlxlogscore=999 impostorscore=0 spamscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502140047
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 14/02/25 12:15 pm, Sourabh Jain wrote:
> Hello Hari,
> 
> 
> On 14/02/25 12:02, Hari Bathini wrote:
>>
>>
>> On 13/02/25 8:34 pm, Venkat Rao Bagalkote wrote:
>>> Greetings!!!
>>>
>>>  From kernel next-20250210, I am observing syscall kexec_file_load 
>>> not available, there by kdump service is failing to start.
>>>
>>>
>>> Logs:
>>>
>>> [root@ltc-zzci-1 ~]# kexec -p --initrd=/boot/initramfs-6.14.0-rc2- 
>>> next-20250212kdump.img /boot/vmlinuz-6.14.0-rc2-next-20250212 -c
>>> Warning: append= option is not passed. Using the first kernel root 
>>> partition
>>> Modified cmdline: elfcorehdr=311424K root=UUID=b5b1f89c- 
>>> d479-48b3-90e2-744a2fd05667
>>> [root@ltc-zzci-1 ~]# kexec -p --initrd=/boot/initramfs-6.14.0-rc2- 
>>> next-20250212kdump.img /boot/vmlinuz-6.14.0-rc2-next-20250212 -s
>>> syscall kexec_file_load not available.
>>> [root@ltc-zzci-1 ~]# kexec -v
>>> kexec-tools 2.0.27
>>> [root@ltc-zzci-1 ~]# uname -r
>>> 6.14.0-rc2-next-20250212
>>>
>>
>> Is the kernel built with CONFIG_KEXEC_FILE ?
> 
> I am able to reproduce it with CONFIG_KEXEC_FILE enabled.
> 
> Seems like there is something went wrong in next-20250210 and 
> next-20250212.
> 
> kexec -p --initrd=/boot/initramfs-6.14.0-rc2-next-20250210kdump.img / 
> boot/vmlinuz-6.14.0-rc2-next-20250210 -d -s
> 
> Try gzip decompression.
> Try LZMA decompression.
> [ 3375.712319] kexec_file: kernel: 00000000e539303c kernel_size: 0x2cdacf0
> [ 3375.717022] ima: kexec measurement buffer for the loaded kernel at 0x0.
> [ 3375.717076] kexec_elf: Loaded the kernel at 0x0
> [ 3375.717094] kexec_elf: Loaded purgatory at 0x0
> [ 3375.717104] Loaded the backup region at 0x0
> [ 3375.717130] crash_core: Crash PT_LOAD ELF header. 
> phdr=000000004720e656 vaddr=0xc000000000000000, paddr=0x0, sz=0x10000 
> e_phnum=18 p_offset=0x0
> [ 3375.717156] crash_core: Crash PT_LOAD ELF header. 
> phdr=0000000005eb3f14 vaddr=0xc000000000010000, paddr=0x10000, 
> sz=0xfff0000 e_phnum=19 p_offset=0x10000
> [ 3375.717174] crash_core: Crash PT_LOAD ELF header. 
> phdr=000000000ec70071 vaddr=0xc00000001ec20000, paddr=0x1ec20000, 
> sz=0x13e0000 e_phnum=20 p_offset=0x1ec20000
> [ 3375.717192] crash_core: Crash PT_LOAD ELF header. 
> phdr=00000000b66c9c25 vaddr=0xc000000050000000, paddr=0x50000000, 
> sz=0x3b0000000 e_phnum=21 p_offset=0x50000000
> [ 3375.717215] Loaded elf core header at 0x0, bufsz=0x1000 memsz=0x80000
> [ 3375.717229] kexec_elf: Loaded initrd at 0x0
> [ 3375.718043] Memory node path: /memory@0
> [ 3375.722854] kexec_elf: Loaded device tree at 0x0
> syscall kexec_file_load not available.
> 
> Kernel is reporting that all kexec segments are getting loaded at 0x0.
> 
> Running kexec with strace shows that kexec_file_load system return -1 
> EINVAL.
> 
> kexec_file_load(3, 4, 1, "\0", KEXEC_FILE_ON_CRASH) = -1 EINVAL (Invalid 
> argument)
> 
> Based on the logs printed on the console and kexec_file_load return 
> value. I am suspecting
> kexec_file_load returned early form sanity_check_segment_list() because 
> the segment is 0x0.
> 
> I am investigating further to find how segment.mem for all segment is 0x0.
> 

Interesting. Thanks for the update, Sourabh.
I believe the error "syscall kexec_file_load not available." is
inappropriate and misleading. That should be fixed too.

- Hari


