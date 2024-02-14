Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA01854A97
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Feb 2024 14:38:50 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dBs/97Al;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TZfRX4MnVz3dlT
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Feb 2024 00:38:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dBs/97Al;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TZfQm1DkKz3c5J
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Feb 2024 00:38:08 +1100 (AEDT)
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4TZfQl6MGNz4wcr
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Feb 2024 00:38:07 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4TZfQl6Hdbz4wp3; Thu, 15 Feb 2024 00:38:07 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dBs/97Al;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4TZfQl3B6kz4wcr
	for <linuxppc-dev@ozlabs.org>; Thu, 15 Feb 2024 00:38:07 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41ECTscS005701;
	Wed, 14 Feb 2024 13:37:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=66aKMC+DKM0cDMfo8TE1gVlZfE/wkFZWk8GOx8oR3LQ=;
 b=dBs/97Al7bYKDsf4c/jeuozQgJW+tv3PAouoEUIKVcl8yAxB9MhehT4bRgl5xxITnACS
 qtP8ROINuup8EhGhXu5vJxH2lY6iDUUo45DcoVg5Yo8ypB3q5QXVXExRQDrRoH0vov5S
 HSa3vfSgwWzpMEoyCwPmtANoVGnptPzu4rF1XFvxLNNdfM3558k8iLMeo1mspxPHZ3C0
 6G0KWrJBBwCBp7jSvXaKDQ7yE5vFz+V60MBcM4eDdUKdAHQ4/Li47gf6WMBXI15J5QpQ
 8+Pwzxpt/XRKLUGmcQPyni8z2pwwew14CVDPIjScuajojlyAygMx6JJk451WBrJkHlk1 QA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w8rmvs1su-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Feb 2024 13:37:19 +0000
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 41ECUKii009479;
	Wed, 14 Feb 2024 13:37:19 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w8rmvs0va-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Feb 2024 13:37:19 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41EC4CU8009741;
	Wed, 14 Feb 2024 13:36:14 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3w6p62wnbw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Feb 2024 13:36:14 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41EDa9hf20906508
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 14 Feb 2024 13:36:11 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 46E032004E;
	Wed, 14 Feb 2024 13:36:09 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CDAA120040;
	Wed, 14 Feb 2024 13:35:57 +0000 (GMT)
Received: from [9.61.185.188] (unknown [9.61.185.188])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 14 Feb 2024 13:35:57 +0000 (GMT)
Message-ID: <7c5f8e9a-b6d4-4ebf-9bed-4b9bddb62e25@linux.ibm.com>
Date: Wed, 14 Feb 2024 19:05:55 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 2/5] crash: add a new kexec flag for hotplug support
To: Baoquan He <bhe@redhat.com>
References: <20240111105138.251366-1-sourabhjain@linux.ibm.com>
 <20240111105138.251366-3-sourabhjain@linux.ibm.com>
 <ZcBRle7szFrD3cW+@MiWiFi-R3L-srv>
 <cc02538f-9460-4cbb-9ae4-194412b85e36@linux.ibm.com>
 <ZcrgHvTbDGbXc894@MiWiFi-R3L-srv>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <ZcrgHvTbDGbXc894@MiWiFi-R3L-srv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: D6o2onbtUPBmy6b7s_IQOnwLYwQ0Qxpy
X-Proofpoint-ORIG-GUID: dINt9bOkjK9Eq45Z-IOHHG6wDs3eYOmX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-14_06,2024-02-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 mlxscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 mlxlogscore=610 bulkscore=0 malwarescore=0
 clxscore=1015 spamscore=0 impostorscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2402140105
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
Cc: David Hildenbrand <david@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, Mimi Zohar <zohar@linux.ibm.com>, linuxppc-dev@ozlabs.org, Eric DeVolder <eric.devolder@oracle.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Valentin Schneider <vschneid@redhat.com>, x86@kernel.org, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Laurent Dufour <laurent.dufour@fr.ibm.com>, Dave Young <dyoung@redhat.com>, Vivek Goyal <vgoyal@redhat.com>, Naveen N Rao <naveen@kernel.org>, Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>, Hari Bathini <hbathini@linux.ibm.com>, Oscar Salvador <osalvador@suse.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kexec@lists.infradead.org, Mahesh Salgaonkar <mahesh@linux.ibm.com>, Akhil Raj <lf32.dev@gmail.com>, Andrew Morton <akpm@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 13/02/24 08:51, Baoquan He wrote:
> On 02/12/24 at 07:27pm, Sourabh Jain wrote:
>> Hello Baoquan,
>>
>> On 05/02/24 08:40, Baoquan He wrote:
>>> Hi Sourabh,
>>>
> ......
>>>> diff --git a/include/linux/kexec.h b/include/linux/kexec.h
>>>> index 802052d9c64b..7880d74dc5c4 100644
>>>> --- a/include/linux/kexec.h
>>>> +++ b/include/linux/kexec.h
>>>> @@ -317,8 +317,8 @@ struct kimage {
>>>>    	/* If set, we are using file mode kexec syscall */
>>>>    	unsigned int file_mode:1;
>>>>    #ifdef CONFIG_CRASH_HOTPLUG
>>>> -	/* If set, allow changes to elfcorehdr of kexec_load'd image */
>>>> -	unsigned int update_elfcorehdr:1;
>>>> +	/* If set, allow changes to kexec segments of kexec_load'd image */
>>> The code comment doesn't reflect the usage of the flag.
>> I should have updated the comment to indicate that this flag is for both
>> system calls.
>> More comments below.
>>
>>> You set it too
>>> when it's kexec_file_load. Speaking of this, I do wonder why you need
>>> set it too for kexec_file_load,
>> If we do this one can just access image->hotplug_support to find hotplug
>> support for currently loaded kdump image without bothering about which
>> system call was used to load the kdump image.
>>
>>> and why we have
>>> arch_crash_hotplug_support(), then crash_check_hotplug_support() both of
>>> which have the same effect.
>> arch_crash_hotplug_support(): This function processes the kexec flags and
>> finds the
>> hotplug support for the kdump image. Based on the return value of this
>> function,
>> the image->hotplug_support attribute is set.
>>
>> Now, once the kdump image is loaded, we no longer have access to the kexec
>> flags.
>> Therefore, crash_check_hotplug_support simply returns the value of
>> image->hotplug_support
>> when user space accesses the following sysfs files:
>> /sys/devices/system/[cpu|memory]/crash_hotplug.
>>
>> To keep things simple, I have introduced two functions: One function
>> processes the kexec flags
>> and determines the hotplug support for the image being loaded. And other
>> function simply
>> accesses image->hotplug_support and advertises CPU/Memory hotplug support to
>> userspace.
>  From the function name and their functionality, they seems to be
> duplicated, even though it's different from the internal detail. This
> could bring a little confusion to code understanding. It's fine, we can
> refactor them if needed in the future. So let's keep it as the patch is.
> Thanks.
Ok sure.

- Sourabh
