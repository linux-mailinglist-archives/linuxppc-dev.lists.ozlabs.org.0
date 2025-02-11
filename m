Return-Path: <linuxppc-dev+bounces-6087-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D3DA310B5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Feb 2025 17:09:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YsmbR0vllz2yFP;
	Wed, 12 Feb 2025 03:09:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739290147;
	cv=none; b=YdJYPxXcP1WPkNbuNt3wIORnlZkvbZpOKujGu6Cny6JYSUx+YWxVV2zf6B35l7UyvI0g/ZMRznBe1qXVrn+xaUFxCS023RwNxvxNfxdZWOuLpOIs+J1oYZKYomiYS3L2uwcFbjdnBCkw4uiTBpZTL30v67cRdTk0C38d9nazi/YeEqs2o+xvJGfnMAh4Ur/QeMwpT5a+BQnlYCuseK+D9pZcMlpPrAmTUvjE+6nvAIO1fp5l9DLAOYWYXFZZ6e5NP/gVFnT1gFd1kEyR3IiRedemIVfwLaA3XP81iJMq6yfOD/PfHxYvVmyC7KwVu4PHLPtlFouZrCMWWDlVaXsXhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739290147; c=relaxed/relaxed;
	bh=wtL+QYDbO6A/V/hgozFPL+oJWc1lHHXFmG5Pskw5eUs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G5rLVWKkyJheZ7tnZvb4e8+snQ4iRGUtZyCFcDZjemHvi5jXCYwtoScU8AUoBeriMQY80wvFeR9WVCyW8WiWOFB750btOFKAtOa65mtks2H/iHTAz0G05vKkDCwORIKjs9V92u7Xu5nZyNXJ1myf7/Uk/z7p6fL8OPVXi3V7/P9es9nHAOHN/MXMozUXXDvtfl3xnXz9DKcdyqjxEQ0mLqTN02zjgDI1GzBUU1pW/E9B9kaCb74nJJVospTdRhEuTcqjijaJc1jAxND4nOGh8+x43wKFawHNW+ynpdSojfEUH2c6JCRmdgs2NPhOyrqQhap85zJi1mXllnr6CAVTzg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Khcy2pf+; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Khcy2pf+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YsmbQ13KLz2xgv
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Feb 2025 03:09:05 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51B5Npg6026470;
	Tue, 11 Feb 2025 16:08:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=wtL+QY
	DbO6A/V/hgozFPL+oJWc1lHHXFmG5Pskw5eUs=; b=Khcy2pf+PR71oagTKbe6X/
	CsYkRga1e1/FMxQjBVaGiWLZw1TX0VN78i1GufOeb2386uPSSav00WBy5Rpsi7z4
	vsD0RNWfbwSss4QUAhbb8OFfDxxObEMsUpHk7EL29B++zxZh6ajT38B8lfMIaoKc
	udlmeV0MxiHk/0/vj2BxqZs1SyprYTmzWlXZLpqw01/H970+WLkdqZ4R3pm9Aii0
	vtO19JHMIWMgEUIZBZzgIht6AFpGVgzF7Mk0LcJmEcDKdj3DnJG08O7nZu1NYw84
	lsa8tJNUPTf7IVUY3h2Ittuc8rKjYPHCga9fdOO8rvxf9Fvv6kHKMU8g1liG9Puw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44r0c9av22-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Feb 2025 16:08:45 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 51BG7R2s028371;
	Tue, 11 Feb 2025 16:08:45 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44r0c9av1v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Feb 2025 16:08:45 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 51BDObkf016712;
	Tue, 11 Feb 2025 16:08:44 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 44pk3k40ht-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Feb 2025 16:08:44 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 51BG8gUu29557354
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 11 Feb 2025 16:08:43 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E3A9958043;
	Tue, 11 Feb 2025 16:08:42 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B8BB658059;
	Tue, 11 Feb 2025 16:08:42 +0000 (GMT)
Received: from [9.61.47.87] (unknown [9.61.47.87])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 11 Feb 2025 16:08:42 +0000 (GMT)
Message-ID: <5652c604-f513-4d03-b6b5-c78d35c6568b@linux.ibm.com>
Date: Tue, 11 Feb 2025 10:08:39 -0600
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
Subject: Re: [PATCH] powerpc/crash: Fix non-smp kexec preparation
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        naveen@kernel.org, hbathini@linux.ibm.com
References: <20250210195240.438127-1-eajames@linux.ibm.com>
 <bbf7bd7e-6395-42dc-9e94-ec6d8f99deb4@csgroup.eu>
Content-Language: en-US
From: Eddie James <eajames@linux.ibm.com>
In-Reply-To: <bbf7bd7e-6395-42dc-9e94-ec6d8f99deb4@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: _fXwo67DxfFpkJM8WOEkmm2jV-qHbUzt
X-Proofpoint-GUID: QVEz4TmNLNu_U8IDxRvb2YKOgSztTS_s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_07,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 mlxlogscore=898
 spamscore=0 mlxscore=0 phishscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502110106
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org


On 2/11/25 01:38, Christophe Leroy wrote:
>
>
> Le 10/02/2025 à 20:52, Eddie James a écrit :
>> [Vous ne recevez pas souvent de courriers de eajames@linux.ibm.com. 
>> Découvrez pourquoi ceci est important à 
>> https://aka.ms/LearnAboutSenderIdentification ]
>>
>> In non-smp configurations, crash_kexec_prepare is never called in
>> the crash shutdown path. One result of this is that the crashing_cpu
>> variable is never set, preventing crash_save_cpu from storing the
>> NT_PRSTATUS elf note in the core dump.
>>
>> Fixes: c7255058b543 ("powerpc/crash: save cpu register data in 
>> crash_smp_send_stop()")
>> Signed-off-by: Eddie James <eajames@linux.ibm.com>
>> ---
>>   arch/powerpc/kexec/crash.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/arch/powerpc/kexec/crash.c b/arch/powerpc/kexec/crash.c
>> index 9ac3266e49652..8c11cfd19e734 100644
>> --- a/arch/powerpc/kexec/crash.c
>> +++ b/arch/powerpc/kexec/crash.c
>> @@ -359,7 +359,11 @@ void default_machine_crash_shutdown(struct 
>> pt_regs *regs)
>>          if (TRAP(regs) == INTERRUPT_SYSTEM_RESET)
>>                  is_via_system_reset = 1;
>>
>> +#ifdef CONFIG_SMP
>
> I see no obvious reason to use #ifdef instead of 
> IS_ENABLED(CONFIG_SMP), is there any ?
>
> Ref 
> https://docs.kernel.org/process/coding-style.html#conditional-compilation


Oops, no, just my habit. I'll change it.


Thanks,

Eddie


>
>>          crash_smp_send_stop();
>> +#else
>> +       crash_kexec_prepare();
>> +#endif
>>
>>          crash_save_cpu(regs, crashing_cpu);
>>
>> -- 
>> 2.43.5
>>
>

