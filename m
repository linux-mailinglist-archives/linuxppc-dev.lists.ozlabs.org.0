Return-Path: <linuxppc-dev+bounces-6177-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C6FA357C9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Feb 2025 08:21:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YvNkw1BCBz30WR;
	Fri, 14 Feb 2025 18:21:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739517672;
	cv=none; b=bH2ex9vx76zWMZ7fEvQIktrUKUjI9/LXH0o6UVcMYjh4T+ezfwr3LwqRPAqrTF+HB867a0AHCbzapck48vIT79yyr/2zrnR7s6w1AdjjLx6zPZGuZc1MG14G1WIYtrfAIlGPxACK1X35jQjRVHyaf5zSDg7GIa4KTtBLV8lqCi15tGmLDklbYhBpCU8UOIQ56aSXqwJA1ldpX/B29M0FnA6WHyLeKknRMd8uQ9cd0NS8FDAP6iqBOpnC4yfqkQEFiyEQQvfT//wDiFJTDQru6pN7+7SVasTUdMx8zwJtCC63fLiBzB1YtRIAfE6UHaxdBt2XPGWy8bc0mfpYQRuP/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739517672; c=relaxed/relaxed;
	bh=YnncP616e8oEecv/+iRtRli894a3zkA8st46Zh9tfGA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Xz8MmRUy939Zs180Cy8ingy9ugHJwMblw0qU7CtCAcQeN1H5IPezvGeqBxlvyKcFVvtO69/lUKrKzIA1tTur7DmpWV3tEL8q7bwyvIGwlUW9JeCE9nPGPHATBOsb7Hp8MOVkNKuR1yAMBTE/qNJlFjSfWWzudlUvJSBSoVDDcPpEn71kWcvgYDHn/auSfFsvG8QH9Xm8Wj4s6Ar+9Fgalb5zk/Ts8CRbgiWT1NwrhQjHb4H2V2fV1TFsqsHIRhG7h9yg8sUKOt1SU9g4/NtBRk9MrmLZ+B5rTL09N+Zx2hQwSzFfirsMY1dvFQwPEPl3ZOiWYSuEgugOwaPBQNcDfg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=J7/WWZex; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=J7/WWZex;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YvNkt2drPz30WL
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Feb 2025 18:21:10 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51E21e6o014567;
	Fri, 14 Feb 2025 07:21:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=YnncP6
	16e8oEecv/+iRtRli894a3zkA8st46Zh9tfGA=; b=J7/WWZexS3aRqFtkQvFILk
	4q8uQeyDtXly3Jbv8udssCg3+w4sKqTpKsAfuemD14ajGnAKSs7G4eGU3XLxW/Hq
	yXcR4vGF1zOEyULlZbhdEKZudltfwxzkz+fv7aNOP9893ErEj6Ra522c8XFhEj/e
	1VjvBBykNkArhhgGbnxAaNHptrUq4myfgwDfSHmoIteXeimRQUx2sqXYByQaf0hZ
	A5cTgaqeyOVRCY/gE+8EM78qld8o3aOL+fPFrwdg4OVT8+dCJmdv3hRTndvMTTRl
	W9dL3PSRccFDL0XoiOnK8mqXYBi783/Czr07Ic4UblqMMFs6ougnZwWaXaIMEYHg
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44svp096eh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Feb 2025 07:21:07 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 51E6dl5N028204;
	Fri, 14 Feb 2025 07:21:06 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 44phyytkmx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Feb 2025 07:21:06 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 51E7L4hV39715244
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Feb 2025 07:21:04 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id ACEF52004E;
	Fri, 14 Feb 2025 07:21:04 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4B1EE20040;
	Fri, 14 Feb 2025 07:21:03 +0000 (GMT)
Received: from [9.43.98.203] (unknown [9.43.98.203])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 14 Feb 2025 07:21:02 +0000 (GMT)
Message-ID: <08077c71-41e0-4bb9-ba20-a856ea8ac4bb@linux.ibm.com>
Date: Fri, 14 Feb 2025 12:51:02 +0530
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
 <da9b637a-962a-4a9f-a4bf-b79e6119b29c@linux.ibm.com>
 <a4bbf5a8-2d16-413e-b69c-5b72388989b2@linux.ibm.com>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <a4bbf5a8-2d16-413e-b69c-5b72388989b2@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: XtGnGGddHBgZaQ4hrSAbTBq407s1Ik-c
X-Proofpoint-GUID: XtGnGGddHBgZaQ4hrSAbTBq407s1Ik-c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-14_02,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxscore=0 malwarescore=0 phishscore=0 spamscore=0
 adultscore=0 mlxlogscore=999 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502140051
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org




On 14/02/25 12:38, Hari Bathini wrote:
>
>
> On 14/02/25 12:15 pm, Sourabh Jain wrote:
>> Hello Hari,
>>
>>
>> On 14/02/25 12:02, Hari Bathini wrote:
>>>
>>>
>>> On 13/02/25 8:34 pm, Venkat Rao Bagalkote wrote:
>>>> Greetings!!!
>>>>
>>>>  From kernel next-20250210, I am observing syscall kexec_file_load 
>>>> not available, there by kdump service is failing to start.
>>>>
>>>>
>>>> Logs:
>>>>
>>>> [root@ltc-zzci-1 ~]# kexec -p --initrd=/boot/initramfs-6.14.0-rc2- 
>>>> next-20250212kdump.img /boot/vmlinuz-6.14.0-rc2-next-20250212 -c
>>>> Warning: append= option is not passed. Using the first kernel root 
>>>> partition
>>>> Modified cmdline: elfcorehdr=311424K root=UUID=b5b1f89c- 
>>>> d479-48b3-90e2-744a2fd05667
>>>> [root@ltc-zzci-1 ~]# kexec -p --initrd=/boot/initramfs-6.14.0-rc2- 
>>>> next-20250212kdump.img /boot/vmlinuz-6.14.0-rc2-next-20250212 -s
>>>> syscall kexec_file_load not available.
>>>> [root@ltc-zzci-1 ~]# kexec -v
>>>> kexec-tools 2.0.27
>>>> [root@ltc-zzci-1 ~]# uname -r
>>>> 6.14.0-rc2-next-20250212
>>>>
>>>
>>> Is the kernel built with CONFIG_KEXEC_FILE ?
>>
>> I am able to reproduce it with CONFIG_KEXEC_FILE enabled.
>>
>> Seems like there is something went wrong in next-20250210 and 
>> next-20250212.
>>
>> kexec -p --initrd=/boot/initramfs-6.14.0-rc2-next-20250210kdump.img / 
>> boot/vmlinuz-6.14.0-rc2-next-20250210 -d -s
>>
>> Try gzip decompression.
>> Try LZMA decompression.
>> [ 3375.712319] kexec_file: kernel: 00000000e539303c kernel_size: 
>> 0x2cdacf0
>> [ 3375.717022] ima: kexec measurement buffer for the loaded kernel at 
>> 0x0.
>> [ 3375.717076] kexec_elf: Loaded the kernel at 0x0
>> [ 3375.717094] kexec_elf: Loaded purgatory at 0x0
>> [ 3375.717104] Loaded the backup region at 0x0
>> [ 3375.717130] crash_core: Crash PT_LOAD ELF header. 
>> phdr=000000004720e656 vaddr=0xc000000000000000, paddr=0x0, sz=0x10000 
>> e_phnum=18 p_offset=0x0
>> [ 3375.717156] crash_core: Crash PT_LOAD ELF header. 
>> phdr=0000000005eb3f14 vaddr=0xc000000000010000, paddr=0x10000, 
>> sz=0xfff0000 e_phnum=19 p_offset=0x10000
>> [ 3375.717174] crash_core: Crash PT_LOAD ELF header. 
>> phdr=000000000ec70071 vaddr=0xc00000001ec20000, paddr=0x1ec20000, 
>> sz=0x13e0000 e_phnum=20 p_offset=0x1ec20000
>> [ 3375.717192] crash_core: Crash PT_LOAD ELF header. 
>> phdr=00000000b66c9c25 vaddr=0xc000000050000000, paddr=0x50000000, 
>> sz=0x3b0000000 e_phnum=21 p_offset=0x50000000
>> [ 3375.717215] Loaded elf core header at 0x0, bufsz=0x1000 memsz=0x80000
>> [ 3375.717229] kexec_elf: Loaded initrd at 0x0
>> [ 3375.718043] Memory node path: /memory@0
>> [ 3375.722854] kexec_elf: Loaded device tree at 0x0
>> syscall kexec_file_load not available.
>>
>> Kernel is reporting that all kexec segments are getting loaded at 0x0.
>>
>> Running kexec with strace shows that kexec_file_load system return -1 
>> EINVAL.
>>
>> kexec_file_load(3, 4, 1, "\0", KEXEC_FILE_ON_CRASH) = -1 EINVAL 
>> (Invalid argument)
>>
>> Based on the logs printed on the console and kexec_file_load return 
>> value. I am suspecting
>> kexec_file_load returned early form sanity_check_segment_list() 
>> because the segment is 0x0.
>>
>> I am investigating further to find how segment.mem for all segment is 
>> 0x0.
>>
>
> Interesting. Thanks for the update, Sourabh.
> I believe the error "syscall kexec_file_load not available." is
> inappropriate and misleading. That should be fixed too.

Agree. It is happening because kexec is handling ENOSYS, EINVAL, 
ENOEXEC, and ENOTSUP
as a single case and printing "syscall kexec_file_load not available".

I will send a fix for kexec tool to avoid this confusing error message.

Thanks,
Sourabh Jain

