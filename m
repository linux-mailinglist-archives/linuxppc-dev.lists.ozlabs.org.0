Return-Path: <linuxppc-dev+bounces-8473-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A54DBAB1442
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 May 2025 15:02:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zv8LK1p6kz3blc;
	Fri,  9 May 2025 23:02:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746795769;
	cv=none; b=hoWmjPTcQaNz2xNt+mxrT8eZKa7vdQR5gqkJNJ5LDBv3Bklep0ZInXoUrV6k9bLHR28o6u2Ef0uTFKqZbXQgOqxk1g4ClsqHrrvmVlNxigB2FbdkU/1cmIyOjgAqyTIu+mjD5browTfXFLtwubUnf1fVK9MbZFmYdLd5J2rKXKOpRmMGt65vqegGSxW7XXpiimKiY3zRViyLUatp8BlBoaay/NrcPLJb8DFTiguiGM3oAHAiNTwMt5gI+/FcR4cw6rSyY53lPPQzfKYmi9S3YrX+h3UrSie6R/sLd7qoI/hLaMor3GHJ2/Gx2CZIE/Mg2ccFBMVHfZHRxTq6SC+0TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746795769; c=relaxed/relaxed;
	bh=TDjkF//Nhp950cpZ/fbjETYdNCwuZBtjg6uNqRtDxKI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=apquDKwWzkwMukegjtpA9EgIBHYDpqWmoIof+4Wms6X5KNZ1BLjfaWfNgD2pEOkpCzUjLY+mGcLXZFWMuiMv8p8WOz2UM3EsVI4eUkZlW4g/6N8ooXR1G1YlOYm8hBQLanTDaf1cLzHN24fwMeO1T2y0hkm4BSxJoOHps6kOiMtUIL2W9Sl1wCxxx/QlA8Zr5+o+zMIw/YcxtbRNAzDTGOEqpk6VFH1H/UJcFrd/D3IZbkR0+Jf39JkQtLYt6bHVUvO8tvsFFm6AMORbTPdJJYZ5PPA7Qi9GctOGDrwA4seRJ/9l8t57iUm9hkDZ7z1H354ff3K5qLbBK0fM3Ys9lg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nQBpMxgh; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nQBpMxgh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zv8LH63fFz3bkL
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 May 2025 23:02:47 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 549Af3U3004468;
	Fri, 9 May 2025 13:02:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=TDjkF/
	/Nhp950cpZ/fbjETYdNCwuZBtjg6uNqRtDxKI=; b=nQBpMxghUqnKdttB18XGkJ
	J7ntEXTkAIfzDYuTvicvStctHxZ4Hp8upCdjGkomigGrc322rsg2GXs3kZuA6q5+
	nQSr7OxAoZ4Li97yxjoVQqWS/nGO1lR4diSPfb7OfzjJ8ZLUr+hvOlfw9W0Mj0gW
	6PenqfPVRcKTxca4bu9oEal7+XMc+xXo2duizI+Ctf4ZqExSLAT41LkcynnUdFcN
	TT94KHUOZ2CmqAm8sQ5D+iy3iSMCm919FwISZ7GywbrEmxWH6jWXdJrsK6NVUC4v
	1N3TB/Q9yYvkYlwahQiRutv1IV56e1oIIZTqy84ZCcRSUAtv3l6Zg+mnu2jWuUsA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46hg5sgj9p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 May 2025 13:02:30 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 549D0Uv1005482;
	Fri, 9 May 2025 13:02:30 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46hg5sgj9h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 May 2025 13:02:30 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5499nMcx014583;
	Fri, 9 May 2025 13:02:29 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 46dypm352f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 May 2025 13:02:29 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 549D2PFV58130830
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 9 May 2025 13:02:25 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7752020040;
	Fri,  9 May 2025 13:02:25 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AF38020043;
	Fri,  9 May 2025 13:02:22 +0000 (GMT)
Received: from [9.124.210.99] (unknown [9.124.210.99])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  9 May 2025 13:02:22 +0000 (GMT)
Message-ID: <d2bc5f3c-b360-41fe-998f-2ef444aba6ed@linux.ibm.com>
Date: Fri, 9 May 2025 18:32:21 +0530
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
Subject: Re: [PATCH v3 3/6] powerpc: fadump: use lock guard for mutex
To: Sourabh Jain <sourabhjain@linux.ibm.com>
Cc: npiggin@gmail.com, christophe.leroy@csgroup.eu, mpe@ellerman.id.au,
        peterz@infradead.org, ajd@linux.ibm.com, mahesh@linux.ibm.com,
        hbathini@linux.ibm.com, linux-kernel@vger.kernel.org,
        Srikar Dronamraju <srikar@linux.ibm.com>,
        linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com
References: <20250505075333.184463-1-sshegde@linux.ibm.com>
 <20250505075333.184463-4-sshegde@linux.ibm.com>
 <9f18e699-4819-4d2f-a932-fc5e399e8abd@linux.ibm.com>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <9f18e699-4819-4d2f-a932-fc5e399e8abd@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: wNFCSBdOTPN5emLT6e1yeS-PxPbvP4DB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDEyMyBTYWx0ZWRfX45+IfNik/6x4 YBiJFHFJkLQ6pkEmGVmidyfBmeNWV3lgu0t+L03vN0UGpD06i72bW8VhCIWc61tq93dFMn0tVkp zxWg+AEGKrB/YYsJB+5hTqgfm3+WRsylGtI0n9+QPmHfCyIxKyqCY+tPCM0qeezSFyLYG2dOVPj
 d3l+6pLwlSNSmfHpN1Ep4eKPGO7ggNZbTpMPNwZRJ1R3BJbHW0PaiKhD8n4TIDF3pPTNEVSh6UW vYs/q/u+xgbIcr7AEY5IrxQyqYVahH4PhP+XWSlpFCQtfyN7+KmL8wNuvv8bS95l9yES6zCqQik huOuv/02hgdqrKey5R9tjGNjLcz6XIECxRLKbsc3QPmxuQUpZSdhSbG6hghzyiF39W146Co4/oR
 OwdXmCVwmtiKftR4LKZAg1j+I2eYrRUeP0IbLsuwDlNCJ7Eet2fO3h/nKNt/lGXefKRMp3ar
X-Proofpoint-ORIG-GUID: ex8w7jr7aokN3IiwYasi3P57Rg77Rqjk
X-Authority-Analysis: v=2.4 cv=NrjRc9dJ c=1 sm=1 tr=0 ts=681dfce6 cx=c_pps a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=JfrnYn6hAAAA:8 a=VnNF1IyMAAAA:8 a=Twlkf-z8AAAA:8
 a=w4zUdiFJCf33N9Ciak0A:9 a=lqcHg5cX4UMA:10 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=ImwWUX5h3JJ3gRE9moBe:22 a=z2U-W3hJrleVIN9YIjzO:22 a=1CNFftbPRP8L7MoqJWF3:22 a=-74SuR6ZdpOK_LpdRCUo:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_05,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 adultscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 mlxscore=0 mlxlogscore=999 malwarescore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505090123
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 5/8/25 11:23, Sourabh Jain wrote:
> 

Hi Sourabh.

> On 05/05/25 13:23, Shrikanth Hegde wrote:
>> use scoped_guard for scope based resource management of mutex.
>> This would make the code simpler and easier to maintain.
>>
>> More details on lock guards can be found at
>> https://lore.kernel.org/all/20230612093537.614161713@infradead.org/T/#u
>>
>> Reviewed-by: Srikar Dronamraju <srikar@linux.ibm.com>
>> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
>> ---
>>   arch/powerpc/kernel/fadump.c | 11 ++++-------
>>   1 file changed, 4 insertions(+), 7 deletions(-)
>>
>> diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
>> index df16c7f547ab..b8c7993c5bb1 100644
>> --- a/arch/powerpc/kernel/fadump.c
>> +++ b/arch/powerpc/kernel/fadump.c
>> @@ -1375,15 +1375,12 @@ static void fadump_free_elfcorehdr_buf(void)
>>   static void fadump_invalidate_release_mem(void)
>>   {
>> -    mutex_lock(&fadump_mutex);
>> -    if (!fw_dump.dump_active) {
>> -        mutex_unlock(&fadump_mutex);
>> -        return;
>> +    scoped_guard(mutex, &fadump_mutex) {
>> +        if (!fw_dump.dump_active)
>> +            return;
>> +        fadump_cleanup();
>>       }
>> -    fadump_cleanup();
>> -    mutex_unlock(&fadump_mutex);
>> -
>>       fadump_free_elfcorehdr_buf();
>>       fadump_release_memory(fw_dump.boot_mem_top, 
>> memblock_end_of_DRAM());
>>       fadump_free_cpu_notes_buf();
> 
> I tried to understand how scoped_guard gets unwrapped and what changes
> it brings to the assembly of the update function. However, with GCC version
> 11.5.0 20240719 (Red Hat 11.5.0-5), identical assembly was generated for 
> the
> fadump_invalidate_release_mem function with or without this patch.
> 
> Which was a surprise to me because there are lot macros and compiler
> magic involved here to call destructor ( for example https:// 
> clang.llvm.org/docs/AttributeReference.html#cleanup)
> when a variable goes out of scope.

that is nice to see.

> 
> c000000000053978 <fadump_invalidate_release_mem.part.0>:
> c000000000053978:       ae 01 4c 3c     addis   r2,r12,430
> c00000000005397c:       88 47 42 38     addi    r2,r2,18312
> c000000000053980:       a6 02 08 7c     mflr    r0
> c000000000053984:       11 57 02 48     bl      c000000000079094 <_mcount>
> c000000000053988:       a6 02 08 7c     mflr    r0
> c00000000005398c:       f8 ff e1 fb     std     r31,-8(r1)
> c000000000053990:       f0 ff c1 fb     std     r30,-16(r1)
> c000000000053994:       1f 01 e2 3f     addis   r31,r2,287
> c000000000053998:       30 ea ff 3b     addi    r31,r31,-5584
> c00000000005399c:       10 00 01 f8     std     r0,16(r1)
> c0000000000539a0:       81 ff 21 f8     stdu    r1,-128(r1)
> c0000000000539a4:       18 00 41 f8     std     r2,24(r1)
> c0000000000539a8:       ad fe ff 4b     bl      c000000000053854 
> <fadump_cleanup+0x8>
> c0000000000539ac:       c2 00 62 3c     addis   r3,r2,194
> c0000000000539b0:       98 c3 63 38     addi    r3,r3,-15464
> c0000000000539b4:       c9 1d 06 49     bl      c0000000010b577c 
> <mutex_unlock+0x8>
> c0000000000539b8:       00 00 00 60     nop
> c0000000000539bc:       1f 01 22 3d     addis   r9,r2,287
> snip...
> 
> 
> Also, fadump_invalidate_release_mem() is only called in the fadump 
> kernel in two scenarios
> to release the reserved memory:
> 
> 1. After dump collection
> 2. When fadump fails to process the dump
> 
> So even if the compiler messes up something here, there is no impact on 
> dump collection as such.

If there is a compiler mess up we will have a much bigger issue, since 
these are quite widely used in core areas such as scheduler, timers etc.

> 
> So changes looks good to me:
> Reviewed-by: Sourabh Jain <sourabhjain@linux.ibm.com>

Thanks for taking a look and reviewing it.


