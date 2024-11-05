Return-Path: <linuxppc-dev+bounces-2856-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF0D9BC359
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Nov 2024 03:50:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XjCVh5vhRz2yLB;
	Tue,  5 Nov 2024 13:50:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730775004;
	cv=none; b=XhuEjCQBNSViBsnEOiPMSjUyIVdqg5cRBF24TX9A/s6Xa1nukEah7ROrrksrPP77glYgWvRM9vl6/FDc8oQmWljZkVe1mJW8pyM44MoGaBRW0aq8swyilIFidfDRVm4F9UedUGYzq4yCbWXp0WgFsFaPgDdnpqImCVEftIFnIspi/CP4W6Ou3UckyxW6yLzJY3cvaDimrmuYWLFq+lECatL+tACUKTO3c+qJx5L6mjwp9b1BpJBW2J4tsC7eGOU1uFM/1lZ98ZKHotFVE7YvF68xRjRIdbfA5LrQJijnyH2UGXY58GkbnmN5orD3SC+p16p4byB65bfh3VcZa6l+wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730775004; c=relaxed/relaxed;
	bh=axp2GaQehnja73xKX12S2JgnASGJkuw1ISq6I7w/yE4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZHnlVOVOXnQ+wrqUqZinz8n7n8r8NbcXe5AnCAv4zW7LPy8rGgGKxhBvc/3Sk8F5AMIn+fS+olQ9HyPEowTOXOcorXUCXvUpIi6J06eHM+oE+fsuvNnAxnG+FcLxeV01NGshOJ3we/YVYqWbDs4BtaDoZ7U9gLEjWYYSu4lSv5ArIzYCS57CjhKaFRL3QYiHv4gYr2ImVFg0PllPFiZOuN/4Qju+Zr+tmQlUch416rNlve3rJjmhxp1I+6TfxWSF8/oeHTLs3WbXjUZ5Due+Nx9+tjBP6E7Mui7whaInImKDtyslkikJXjhCZdXCZ31lppc/8j4EBU47nxAZZ8mhhQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ro6skYPp; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ro6skYPp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XjCVf5rPPz2xt7
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Nov 2024 13:50:02 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A52ffOv017873;
	Tue, 5 Nov 2024 02:49:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=axp2Ga
	Qehnja73xKX12S2JgnASGJkuw1ISq6I7w/yE4=; b=Ro6skYPp61ZKfeSg6c1Lrp
	UHnR77VqfmPci8lJlpwKXPSft9SOgSuHDWnQZ/aDNz8bqjVbxMIq6nC7/UMuSqhU
	ll62EWfezrmZoY1jFLczOvaTM2MD2iUwEeOL3i+9oxGVleQnuKumnfYuWhu8CyBF
	OAAT4kVaURQ75XRdcV6gHSR2s2FAe9igyp7SVILAGPnk+NmMMMn9GPH93VvyVrHf
	EFqxSFgbz1QQZvv0JlfsjIbpVE+lLSrsLLXaHRGVr6yMFJZoZLGfXxJj75/nuuse
	UlWIUoJxkZD9oN5mK5OEu51hTGAEPvupeHjXXHxKP9ht4PeZNsrADUpEceaUC6BA
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42qasug13c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Nov 2024 02:49:51 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4A4LSFiu019080;
	Tue, 5 Nov 2024 02:49:51 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 42p0mj3853-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Nov 2024 02:49:51 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4A52nlGV46268858
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 5 Nov 2024 02:49:47 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9F96520043;
	Tue,  5 Nov 2024 02:49:47 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A50DA20040;
	Tue,  5 Nov 2024 02:49:46 +0000 (GMT)
Received: from [9.109.204.94] (unknown [9.109.204.94])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  5 Nov 2024 02:49:46 +0000 (GMT)
Message-ID: <f4def3a5-727e-4eff-95cd-ece99d133ca5@linux.ibm.com>
Date: Tue, 5 Nov 2024 08:19:44 +0530
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
Subject: Re: [PATCH 2/2] fadump: reserve param area if below boot_mem_top
To: Hari Bathini <hbathini@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>
References: <20241104083528.99520-1-sourabhjain@linux.ibm.com>
 <20241104083528.99520-2-sourabhjain@linux.ibm.com>
 <b7350dd0-b835-42fe-8970-da5b0ce16ba6@linux.ibm.com>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <b7350dd0-b835-42fe-8970-da5b0ce16ba6@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: QKbfqnPnE7BqNxG-Sw30kWlRgHqkbvOq
X-Proofpoint-ORIG-GUID: QKbfqnPnE7BqNxG-Sw30kWlRgHqkbvOq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 mlxscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 mlxlogscore=999 clxscore=1015
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411050019
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hello Hari,


On 04/11/24 15:50, Hari Bathini wrote:
>
>
> On 04/11/24 2:05 pm, Sourabh Jain wrote:
>> The param area is a memory region where the kernel places additional
>> command-line arguments for fadump kernel. Currently, the param memory
>> area is reserved in fadump kernel if it is above boot_mem_top. However,
>> it should be reserved if it is below boot_mem_top because the fadump
>> kernel already reserves memory from boot_mem_top to the end of DRAM.
>>
>> Currently, there is no impact from not reserving param memory if it is
>> below boot_mem_top, as it is not used after the early boot phase of the
>> fadump kernel. However, if this changes in the future, it could lead t
>> issues in the fadump kernel.
>>
>
> Looks good to me.
>
> Acked-by: Hari Bathini <hbathini@linux.ibm.com>

Thanks for Ack.


- Sourabh Jain

>
>> Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
>> Cc: Hari Bathini <hbathini@linux.ibm.com>
>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>> ---
>>   arch/powerpc/kernel/fadump.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
>> index 4a3f80f42118..35a8a107e16b 100644
>> --- a/arch/powerpc/kernel/fadump.c
>> +++ b/arch/powerpc/kernel/fadump.c
>> @@ -143,7 +143,7 @@ void __init fadump_append_bootargs(void)
>>       if (!fw_dump.dump_active || !fw_dump.param_area_supported || 
>> !fw_dump.param_area)
>>           return;
>>   -    if (fw_dump.param_area >= fw_dump.boot_mem_top) {
>> +    if (fw_dump.param_area < fw_dump.boot_mem_top) {
>>           if (memblock_reserve(fw_dump.param_area, COMMAND_LINE_SIZE)) {
>>               pr_warn("WARNING: Can't use additional parameters 
>> area!\n");
>>               fw_dump.param_area = 0;
>


