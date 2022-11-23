Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6EB1636408
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Nov 2022 16:39:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NHQKm5FNMz3dvT
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Nov 2022 02:39:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GPyscqsK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NHQJn12CWz2xkx
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Nov 2022 02:38:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GPyscqsK;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4NHQJf3Sf7z4wgr
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Nov 2022 02:38:42 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4NHQJf2cjJz4xGj; Thu, 24 Nov 2022 02:38:42 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GPyscqsK;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4NHQJd6fRyz4wgr
	for <linuxppc-dev@ozlabs.org>; Thu, 24 Nov 2022 02:38:41 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2ANEbGXZ023226;
	Wed, 23 Nov 2022 15:38:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=cySktFEMS84THhMv3PuuPAmyrTxjANqkYfeixc770nc=;
 b=GPyscqsKREJpC5jIGPiB+29nJZPIDYsyDp0XjFtoqL2vsTdQcT2nzkSoWrkrAUUWWm1S
 lBvQcwsO5jVSQG3LO5lFMIuzOeF4xmLd9Xfp/t26NPW41hvz1HmZRPGvo6m+o0vzuZV3
 vWhsFykOM6T9TQLlUVRm53MSV0vNnQZw1rHmRgeRFj0xeQrNoFFxoHoteq3OnyEa9VXG
 J8ds6TlxcEjJ1EPzLB6xTPtMUGqfTd2yZiiovCkDnM9MylS8puc37atPT10Pa6TZykvE
 /GPEWBHN8B15yPYjtzhuTzqbUwoN0xAGGjfKCrNOuVPnZi01WEnXz5j7F2cy+9UBlOu5 AA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m10w606u0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Nov 2022 15:38:28 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2ANFAfJF029626;
	Wed, 23 Nov 2022 15:38:28 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m10w606tg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Nov 2022 15:38:27 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
	by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2ANFZPZ7015516;
	Wed, 23 Nov 2022 15:38:26 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
	by ppma04fra.de.ibm.com with ESMTP id 3kxps8vg1d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Nov 2022 15:38:25 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com [9.149.105.60])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2ANFcNxw47710558
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 23 Nov 2022 15:38:23 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 87AF34203F;
	Wed, 23 Nov 2022 15:38:23 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0F59942041;
	Wed, 23 Nov 2022 15:38:21 +0000 (GMT)
Received: from [9.43.47.46] (unknown [9.43.47.46])
	by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Wed, 23 Nov 2022 15:38:20 +0000 (GMT)
Message-ID: <32cf60d8-d0dd-ac7a-329b-1db1f99beac8@linux.ibm.com>
Date: Wed, 23 Nov 2022 21:08:19 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v5 3/6] crash: add phdr for possible CPUs in elfcorehdr
Content-Language: en-US
To: Eric DeVolder <eric.devolder@oracle.com>, linuxppc-dev@ozlabs.org,
        mpe@ellerman.id.au
References: <20221120232508.327554-1-sourabhjain@linux.ibm.com>
 <20221120232508.327554-4-sourabhjain@linux.ibm.com>
 <0af5f619-3b39-7118-66c6-ba5b0c85c3dd@oracle.com>
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <0af5f619-3b39-7118-66c6-ba5b0c85c3dd@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: I6KFSVSucNYWbPhWsL5zKYEL7PTCfD9L
X-Proofpoint-ORIG-GUID: kcr2Qryt57NMcIbXXVC0g0XZbVvYr7Wx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-23_08,2022-11-23_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 bulkscore=0 adultscore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 phishscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211230114
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
Cc: mahesh@linux.vnet.ibm.com, kexec@lists.infradead.org, bhe@redhat.com, hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 22/11/22 23:28, Eric DeVolder wrote:
>
>
> On 11/20/22 17:25, Sourabh Jain wrote:
>> On architectures like PowerPC the crash notes are available for all
>> possible CPUs. So let's populate the elfcorehdr for all possible
>> CPUs having crash notes to avoid updating elfcorehdr during in-kernel
>> crash update on CPU hotplug events.
>>
>> The similar technique was used in kexec-tool for kexec_load case.
>>
>> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>> ---
>>   kernel/crash_core.c | 9 ++++++---
>>   1 file changed, 6 insertions(+), 3 deletions(-)
>>
>> diff --git a/kernel/crash_core.c b/kernel/crash_core.c
>> index bca1b198d9e55..f6cccdcadc9f3 100644
>> --- a/kernel/crash_core.c
>> +++ b/kernel/crash_core.c
>> @@ -364,16 +364,19 @@ int crash_prepare_elf64_headers(struct kimage 
>> *image, struct crash_mem *mem,
>>       ehdr->e_ehsize = sizeof(Elf64_Ehdr);
>>       ehdr->e_phentsize = sizeof(Elf64_Phdr);
>>   -    /* Prepare one phdr of type PT_NOTE for each present CPU */
>> -    for_each_present_cpu(cpu) {
>> +    /* Prepare one phdr of type PT_NOTE for possible CPU with crash 
>> note. */
>> +    for_each_possible_cpu(cpu) {
>>           if (IS_ENABLED(CONFIG_HOTPLUG_CPU)) {
>>               /* Skip the soon-to-be offlined cpu */
>>               if (image->hotplug_event && (cpu == image->offlinecpu))
>>                   continue;
>>           }
>>   -        phdr->p_type = PT_NOTE;
>>           notes_addr = per_cpu_ptr_to_phys(per_cpu_ptr(crash_notes, 
>> cpu));
>> +        if (!notes_addr)
>> +            continue;
>> +
>> +        phdr->p_type = PT_NOTE;
>>           phdr->p_offset = phdr->p_paddr = notes_addr;
>>           phdr->p_filesz = phdr->p_memsz = sizeof(note_buf_t);
>>           (ehdr->e_phnum)++;
>>
>
> I did a quick test of this for x86_64 and it works.
>
> Reviewed-by: Eric DeVolder <eric.devolder@oracle.com>


Thanks for testing it out.

- Sourabh Jain

