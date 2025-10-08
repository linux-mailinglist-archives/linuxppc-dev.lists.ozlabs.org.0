Return-Path: <linuxppc-dev+bounces-12704-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 85532BC33E8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 08 Oct 2025 05:44:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4chJlQ1QWLz302b;
	Wed,  8 Oct 2025 14:44:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759895042;
	cv=none; b=OOBxWwGQs6ZTiTBDVsysQ+/pq0maSSU49mOdKc+gEQjLaIBuV+8qAjfW/vC92E+FNk/4vXYkDNrG1Etjqe4CddajXXWEFz8gKGfY77yXsVcLFGGhqFr7waHSsGrRF99/PmZi3QWt7pRB/jWScOND7tIHZCJqNIVaHyJmmMwde2DB/+pAhvquIUs+vZgYgJ5efpCRWF6BAV/Nuk1MtH06nUQN0lM4662fanoanKqI9aWYQcoJg8I0Odp0nq9MSiUUavL2ZHtQun80LxwAUZZ3uw7/5eLhZfP5mzkD9fLS2ESmTbnNjUSjKCx5m9xLcfTV8q5Zf5qTd6GIZPT3GK+mGw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759895042; c=relaxed/relaxed;
	bh=goEUFuV6jsNa353zcPH8vNdtZEInRDBOTOkgHVwuX40=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R8PVKGqiZouaihxI59U0bo2x/A9mReWVh1b2VGt/o1Rmufuqi4iha/rfNGEbTCqIgz1JyWOeVagWVwBVApM2oBxKuO1J6JE8QDHm5n0sGN7uzZhGkDtPDIxMM7YJ2A4VLd/QsiSQ9KduC+ANzDbUhVe9ryCFDuO31vR0Oblsy2dtrteLo0PNDvHzoTsL9ocWOf4jY9rc25tQobRUFZ68WZJ0dnMTg07/Gzp9ec8ePZhQ8I7p8dO7pLissK++81iNFlmjEcfV5Wi+h/2Y1CN2oEZazcMFT0HZyOHcuX4ceDXqm9620g/sMFZjh/rdWoD1REnF1QWtuv58kHUCnWThJQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ts7yh4P7; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ts7yh4P7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4chJlP1Gwdz2yr2
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Oct 2025 14:44:00 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 597Jv2XN001899;
	Wed, 8 Oct 2025 03:43:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=goEUFu
	V6jsNa353zcPH8vNdtZEInRDBOTOkgHVwuX40=; b=ts7yh4P7as20j7sj6jf4+o
	9Ufc9DpOz07ZvNit9BghpZ2bx/PxcV777af5Cp0j1PlneAzRl/j1LEcmWq4Ez31B
	bwp9HyQ1y5OHQzMaEPJa6kj3yulUGPvfmX2+JDN/viKgRCnPMrLItqFis+bfz29K
	YjGdNZWb5ZlKYmo03s9m47ftNKHmCL8Lq3DpEvBX3HsNCJCEDiu/Y497WwW6oBVI
	uRO+p8No8w57asDwn8gRGYw/hDrz3Pe/Rl/q29qdZ1OyuzJtmezitz3wmHE8DvdL
	25psE6H+3QAiWFexR2X0U5j070XZkdPaEaUwZlOUcgznjmAaFU3wQuhPyNw2RLtA
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49ju8at3mf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Oct 2025 03:43:51 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 59800vev000922;
	Wed, 8 Oct 2025 03:43:50 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 49ke9y6su3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Oct 2025 03:43:50 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5983hkJa31850778
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 8 Oct 2025 03:43:46 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 294D420043;
	Wed,  8 Oct 2025 03:43:46 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1D43F20040;
	Wed,  8 Oct 2025 03:43:45 +0000 (GMT)
Received: from [9.124.214.113] (unknown [9.124.214.113])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  8 Oct 2025 03:43:44 +0000 (GMT)
Message-ID: <ab6dec48-f292-44e7-bff6-d6fd32a30de3@linux.ibm.com>
Date: Wed, 8 Oct 2025 09:13:29 +0530
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
Subject: Re: powerpc/fadump: skip parameter area allocation when fadump is
 disabled
To: Hari Bathini <hbathini@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>
References: <20251007074023.176163-1-sourabhjain@linux.ibm.com>
 <89ec78e5-4fe3-4100-9ae1-23f6a9f36e77@linux.ibm.com>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <89ec78e5-4fe3-4100-9ae1-23f6a9f36e77@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: XPjv5Wqtfi_l5CcUaS8m1fLYfuzQPx11
X-Authority-Analysis: v=2.4 cv=BpiQAIX5 c=1 sm=1 tr=0 ts=68e5ddf7 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8
 a=lLc75HBGzXWTpYRN8TgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyMiBTYWx0ZWRfX/opTONYJwlr6
 bFJpx/0YOaH4mfwbjb9FJDo7p08FU4FowxKxM2J8xxK7r80kf0tRXva8+irOC6ndlgar/o6oTXA
 YVY61GLDiX0xBbYB6Q+7cew9qs9IuuYN4Eu3gb2y1bBEU3Sfj9GJ1Unvhkyy5YWJM/dks2FtbCt
 mCJZ3hXBMREbgdHZwYxoRlP0owSYxvlqLhGjbwijujN5L40O8yNAm3Pq2LoJ0QaQLSdlKN8gYq6
 1R7+vWZPE+L2DmfYBMbfKVhs3j4Ummins9HguRxwjXOJScdzSCVFMayheH4wg6tMEcYSmtglRwT
 +t4BexCLK9Y6RW9Wq6M3DmRCWH/If4K2PSXeviaueQMYIhSz7SFtyJA2V1FylktzSDlW2KYxfaV
 Y5Mtj5vj0wMdBrSLlZxcn/xaHxbeaQ==
X-Proofpoint-ORIG-GUID: XPjv5Wqtfi_l5CcUaS8m1fLYfuzQPx11
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2510040022
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 07/10/25 15:58, Hari Bathini wrote:
>
>
> On 07/10/25 1:10 pm, Sourabh Jain wrote:
>> Fadump allocates memory to pass additional kernel command-line argument
>> to the fadump kernel. However, this allocation is not needed when fadump
>> is disabled. So avoid allocating memory for the additional parameter
>> area in such cases.
>>
>
> This needs the fixes tag...
>
> Fixes: f4892c68ecc1 ("powerpc/fadump: allocate memory for additional 
> parameters early")
>
> Otherwise, looks good to me.
>
> Reviewed-by: Hari Bathini <hbathini@linux.ibm.com>

Thanks for the review, Hari. I have sent v2 with the fixes tag.
https://lore.kernel.org/all/20251008032934.262683-1-sourabhjain@linux.ibm.com/

>
>> Cc: Hari Bathini <hbathini@linux.ibm.com>
>> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>> ---
>>   arch/powerpc/kernel/fadump.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
>> index 5782e743fd27..4ebc333dd786 100644
>> --- a/arch/powerpc/kernel/fadump.c
>> +++ b/arch/powerpc/kernel/fadump.c
>> @@ -1747,6 +1747,9 @@ void __init fadump_setup_param_area(void)
>>   {
>>       phys_addr_t range_start, range_end;
>>   +    if (!fw_dump.fadump_enabled)
>> +        return;
>> +
>>       if (!fw_dump.param_area_supported || fw_dump.dump_active)
>>           return;
>
>


