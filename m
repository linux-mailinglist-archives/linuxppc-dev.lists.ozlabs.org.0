Return-Path: <linuxppc-dev+bounces-4845-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 391F0A05AF3
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2025 13:03:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YSmlk74P4z30CL;
	Wed,  8 Jan 2025 23:03:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736337810;
	cv=none; b=R/9y7hxpmAfCZX+/pz2ubbOeMQLdG8GuGrzJpEsbewgJ4lYvGV0G6mSeGXlvLNSQhUWA4kYkHYkABsxIFPZoRv1jvNnTwYoZP519p48CgNQjF7owVVwTL/1HCkF11qSO/CmaW7Uw8Q0VCgaKeJKgE8FuTfeNp/18MXk2oHwnLRv9MgKD6dFe6RkZkxLwFHlsE0Ofnnndud8yrO/yzWQ4acPTSkYtJuIn5g/6V+EMrcWs3Y+q5C294H3MOwnUR/h/pRLKxpFvETWuYB6Bk8lvh55JhnYzurbhMjeXCfNH7WqYtZ1oZs4zJGPyE55SLJHNZOMk3+qbiQdbCNN1Q3i21Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736337810; c=relaxed/relaxed;
	bh=sz+OaCt6VHFwHy69HSLd7yO0UqMuAsCNfcDDMxudYRY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nEku8y74ioTbcRnrsa6cMbrND7lkN+wxIX91YFh00BWnF7Rd9oX1Tk2nBZ76nVRlh4JmEUuYQ/hg/yXUYonnQipVlwK9SNjq1bRpfUzMvvtZcfNbxPUzutIWKTjSWipGu6UvwFG7vVcKA+qNVabY1lwEkU9OcyybVp506K8DUGbI8HPc/6tTxreo6cx8Znp7ti6lv9qaXwBPatLDvY3RLWDNRwWt66l0t3fEf6SSYgJe45A8SXhNWZHHwIRHU1by5E6t310I+GLn2LVMsvxSo5elUU9jVpJA9yUVkoqxh3X1Pre/LsrT3RR3cWv0PQpK2r5FCT5X0cv2UeFBIScBVA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Nw7ILq/6; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Nw7ILq/6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YSmlj59PXz2xKd
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jan 2025 23:03:29 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5083ruvX007978;
	Wed, 8 Jan 2025 12:03:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=sz+OaC
	t6VHFwHy69HSLd7yO0UqMuAsCNfcDDMxudYRY=; b=Nw7ILq/6+rGQrezDpVrUPO
	3m7HpWF+3tYCmB0KFVZaGmG6FX+gnL5nDHp6RPp61cIlbggPLmclmz8DpHxoVB3S
	Q7UmtZGseoS6CAZT3LBV3QQwwixbflWyAiyF79CNOrAIE1ssVChiGW9rcchHJW61
	c+VkbfxKOdvjP+FAfioai4xP/tpyJVJ9MpeqjTzoB3kifipIbtAzZUYGdF72Z4VZ
	6a4mLQG7LrsDVYEwWxsGwgf70e/pZwBtRB5NI78fk4P2rlyNKfKbNMHl2VtOLG2v
	rxw62LnXzmGzEFjcIeB73WPA8s+TH75/09XNYU40egBBgWN8F0eTPCQhta27Scfg
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 441hupt2p4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 12:03:20 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 508ASVeE027963;
	Wed, 8 Jan 2025 12:03:20 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 43yhhk7c5c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 12:03:19 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 508C3GF244237240
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 8 Jan 2025 12:03:16 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4F6DE2004D;
	Wed,  8 Jan 2025 12:03:15 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8E6A32004B;
	Wed,  8 Jan 2025 12:03:13 +0000 (GMT)
Received: from [9.109.204.94] (unknown [9.109.204.94])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  8 Jan 2025 12:03:13 +0000 (GMT)
Message-ID: <9a420bf8-3c22-4dc2-809a-19ceac9aa373@linux.ibm.com>
Date: Wed, 8 Jan 2025 17:33:12 +0530
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
Subject: Re: [PATCH RESEND v1 5/5] crash: option to let arch decide mem range
 is usable
To: Baoquan he <bhe@redhat.com>
Cc: linuxppc-dev@lists.ozlabs.org, Andrew Morton <akpm@linux-foundation.org>,
        Hari Bathini <hbathini@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>, kexec@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20250108101458.406806-1-sourabhjain@linux.ibm.com>
 <20250108101458.406806-6-sourabhjain@linux.ibm.com>
 <Z35jpYq4GvCAXiII@MiWiFi-R3L-srv>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <Z35jpYq4GvCAXiII@MiWiFi-R3L-srv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ZG1W62BsKV561xoiulsaJlrKgW9sDapX
X-Proofpoint-GUID: ZG1W62BsKV561xoiulsaJlrKgW9sDapX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 clxscore=1015 mlxscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 bulkscore=0 impostorscore=0 mlxlogscore=686
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501080098
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org




On 08/01/25 17:08, Baoquan he wrote:
> On 01/08/25 at 03:44pm, Sourabh Jain wrote:
> ...snip...
>> diff --git a/include/linux/kexec.h b/include/linux/kexec.h
>> index f0e9f8eda7a3..407f8b0346aa 100644
>> --- a/include/linux/kexec.h
>> +++ b/include/linux/kexec.h
>> @@ -205,6 +205,15 @@ static inline int arch_kimage_file_post_load_cleanup(struct kimage *image)
>>   }
>>   #endif
>>   
>> +#ifndef arch_check_excluded_range
>> +static inline int arch_check_excluded_range(struct kimage *image,
>> +					    unsigned long start,
>> +					    unsigned long end)
>> +{
>> +	return 0;
>> +}
>> +#endif
>> +
>>   #ifdef CONFIG_KEXEC_SIG
>>   #ifdef CONFIG_SIGNED_PE_FILE_VERIFICATION
>>   int kexec_kernel_verify_pe_sig(const char *kernel, unsigned long kernel_len);
>> diff --git a/kernel/kexec_file.c b/kernel/kexec_file.c
>> index 3eedb8c226ad..52e1480dbfa1 100644
>> --- a/kernel/kexec_file.c
>> +++ b/kernel/kexec_file.c
>> @@ -464,6 +464,12 @@ static int locate_mem_hole_top_down(unsigned long start, unsigned long end,
>>   			continue;
>>   		}
>>   
>> +		/* Make sure this does not conflict exclude range */
>                                                     ^
>                  Make sure this doesn't conflict with excluded range?
>
>> +		if (arch_check_excluded_range(image, temp_start, temp_end)) {
>> +			temp_start = temp_start - PAGE_SIZE;
>> +			continue;
>> +		}
>> +
>>   		/* We found a suitable memory range */
>>   		break;
>>   	} while (1);
>> @@ -498,6 +504,12 @@ static int locate_mem_hole_bottom_up(unsigned long start, unsigned long end,
>>   			continue;
>>   		}
>>   
>> +		/* Make sure this does not conflict exclude range */
>                                                     ^
>                                                   Ditto.

I will update both comments.

Thanks,
Sourabh Jain


