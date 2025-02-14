Return-Path: <linuxppc-dev+bounces-6169-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E33DA3575E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Feb 2025 07:45:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YvMxw5z8Vz30Vr;
	Fri, 14 Feb 2025 17:45:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739515540;
	cv=none; b=oElyZCwp5R6hbIO5/78fpYfTTcKfmnrQWZ/JK2txocNhUvUV/wBb6fVHsj7+TNkW9yc8WT0iOVWZYkw13BYUVc7bdziTW2njdZ1C5IAvkri0YbXHwDUlNOEztA7O2j8GVAaiihkiRR/ra4vkCWWHjg7rl0N5OsavsQysYYMYAH+kpGd07bjAZ5adVyFDKUPaShfZIwyd04kqnLqpN0CIJbKqTfpKTmKjyRGTmyFaz8aYDLkNGMJW4i5NWl/vUXo37bJXNSVP6jUgT8c56RvNKKiW5t5bvry4F3lAjfJq/FlPO4HA2HvxtIJm5rkVFa6xjJTm4UWgYiIhYfzVRfQtzw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739515540; c=relaxed/relaxed;
	bh=suLypsBSmE6AszeJZb1uWjabD9IlIqQQNel8XNX6nn4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=aFfuDy2nVhdbSToqWapXPO924CDj9Tk9mQMAhL/Zx/jnKlMwdMoJyZP+Vd1ZSyCpkazfmUgKVIm0cpr8UY4v8dennJG3/wSH4RpQa0nokmgbAUnLQ1V/AxiwpFEbWInbBz4szCIhDCuL8zGGUvUrNXr9r6qalIRlKwZlF0nHWJZtql8TpvtVUv4xaPdDIIVJHfV6xoJHygXnUuVzSlrjixGEWbYVC530dFArcldNShkAUALH5rUM0jUT2pXcrdU5F2DzXuHn88LkINNLHvJ/ntul6oK1GE2+EaIQX8v9UgNz93qiZYNnf4ePUcf1Y42i8rrjd+bAgoN5KxlL/uqVRg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nOzAgVgy; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nOzAgVgy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YvMxw0srqz301v
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Feb 2025 17:45:39 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51E5OUVt010341;
	Fri, 14 Feb 2025 06:45:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=suLyps
	BSmE6AszeJZb1uWjabD9IlIqQQNel8XNX6nn4=; b=nOzAgVgyaX+gzuT5QVtcD3
	J98N8pL4g9Cvc8NTC/w+/GPGjrok2HnaQPUo6xkmrZELV8o6Xtb5IOz4kNIsn/Qm
	rPyQy+JYbrBuyyOTfRY8SY3tWB1bupnp9LhSyFYNL6+iTzF95rnUJCChPxXNd60j
	0M6JTXqJaHkya2+r8nl+TtGavUNIIx3FcWtJT5CwOGvgxGnouqoo3tBsgIRGe0DC
	SH79efu0HdhLs93fjjCNwh6/W81FMMpSZd8TcSbmUV8Vd4lrCC7r8PiU+0YNfXWN
	XhIvRtvDrhAd7MzenG/lBCHVhqFmhLBLhy0oq5Kr4+ShTYRpSJ46b73PLRNvlfZQ
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44syn80964-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Feb 2025 06:45:37 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 51E2U3n5000978;
	Fri, 14 Feb 2025 06:45:36 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 44pjknj9ce-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Feb 2025 06:45:36 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 51E6jYHk18415972
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Feb 2025 06:45:34 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 98E1E20067;
	Fri, 14 Feb 2025 06:45:34 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 448872004F;
	Fri, 14 Feb 2025 06:45:33 +0000 (GMT)
Received: from [9.43.98.203] (unknown [9.43.98.203])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 14 Feb 2025 06:45:32 +0000 (GMT)
Message-ID: <da9b637a-962a-4a9f-a4bf-b79e6119b29c@linux.ibm.com>
Date: Fri, 14 Feb 2025 12:15:31 +0530
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
To: Hari Bathini <hbathini@linux.ibm.com>,
        Venkat Rao Bagalkote <venkat88@linux.vnet.ibm.com>,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
References: <8e73069b-5987-4a08-b13d-13fe691092ad@linux.vnet.ibm.com>
 <77c11ea2-f3ae-497a-aaba-f7b33f46743d@linux.ibm.com>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <77c11ea2-f3ae-497a-aaba-f7b33f46743d@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: nuSfUP2hAdQ0LcOA-ozi6cFpn48kU42J
X-Proofpoint-GUID: nuSfUP2hAdQ0LcOA-ozi6cFpn48kU42J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-14_02,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 mlxscore=0 spamscore=0 bulkscore=0
 impostorscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502140047
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hello Hari,


On 14/02/25 12:02, Hari Bathini wrote:
>
>
> On 13/02/25 8:34 pm, Venkat Rao Bagalkote wrote:
>> Greetings!!!
>>
>>  From kernel next-20250210, I am observing syscall kexec_file_load 
>> not available, there by kdump service is failing to start.
>>
>>
>> Logs:
>>
>> [root@ltc-zzci-1 ~]# kexec -p --initrd=/boot/initramfs-6.14.0-rc2- 
>> next-20250212kdump.img /boot/vmlinuz-6.14.0-rc2-next-20250212 -c
>> Warning: append= option is not passed. Using the first kernel root 
>> partition
>> Modified cmdline: elfcorehdr=311424K root=UUID=b5b1f89c- 
>> d479-48b3-90e2-744a2fd05667
>> [root@ltc-zzci-1 ~]# kexec -p --initrd=/boot/initramfs-6.14.0-rc2- 
>> next-20250212kdump.img /boot/vmlinuz-6.14.0-rc2-next-20250212 -s
>> syscall kexec_file_load not available.
>> [root@ltc-zzci-1 ~]# kexec -v
>> kexec-tools 2.0.27
>> [root@ltc-zzci-1 ~]# uname -r
>> 6.14.0-rc2-next-20250212
>>
>
> Is the kernel built with CONFIG_KEXEC_FILE ?

I am able to reproduce it with CONFIG_KEXEC_FILE enabled.

Seems like there is something went wrong in next-20250210 and next-20250212.

kexec -p --initrd=/boot/initramfs-6.14.0-rc2-next-20250210kdump.img 
/boot/vmlinuz-6.14.0-rc2-next-20250210 -d -s

Try gzip decompression.
Try LZMA decompression.
[ 3375.712319] kexec_file: kernel: 00000000e539303c kernel_size: 0x2cdacf0
[ 3375.717022] ima: kexec measurement buffer for the loaded kernel at 0x0.
[ 3375.717076] kexec_elf: Loaded the kernel at 0x0
[ 3375.717094] kexec_elf: Loaded purgatory at 0x0
[ 3375.717104] Loaded the backup region at 0x0
[ 3375.717130] crash_core: Crash PT_LOAD ELF header. 
phdr=000000004720e656 vaddr=0xc000000000000000, paddr=0x0, sz=0x10000 
e_phnum=18 p_offset=0x0
[ 3375.717156] crash_core: Crash PT_LOAD ELF header. 
phdr=0000000005eb3f14 vaddr=0xc000000000010000, paddr=0x10000, 
sz=0xfff0000 e_phnum=19 p_offset=0x10000
[ 3375.717174] crash_core: Crash PT_LOAD ELF header. 
phdr=000000000ec70071 vaddr=0xc00000001ec20000, paddr=0x1ec20000, 
sz=0x13e0000 e_phnum=20 p_offset=0x1ec20000
[ 3375.717192] crash_core: Crash PT_LOAD ELF header. 
phdr=00000000b66c9c25 vaddr=0xc000000050000000, paddr=0x50000000, 
sz=0x3b0000000 e_phnum=21 p_offset=0x50000000
[ 3375.717215] Loaded elf core header at 0x0, bufsz=0x1000 memsz=0x80000
[ 3375.717229] kexec_elf: Loaded initrd at 0x0
[ 3375.718043] Memory node path: /memory@0
[ 3375.722854] kexec_elf: Loaded device tree at 0x0
syscall kexec_file_load not available.

Kernel is reporting that all kexec segments are getting loaded at 0x0.

Running kexec with strace shows that kexec_file_load system return -1 
EINVAL.

kexec_file_load(3, 4, 1, "\0", KEXEC_FILE_ON_CRASH) = -1 EINVAL (Invalid 
argument)

Based on the logs printed on the console and kexec_file_load return 
value. I am suspecting
kexec_file_load returned early form sanity_check_segment_list() because 
the segment is 0x0.

I am investigating further to find how segment.mem for all segment is 0x0.

Thanks,
Sourabh Jain




