Return-Path: <linuxppc-dev+bounces-8644-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B04ABADB4
	for <lists+linuxppc-dev@lfdr.de>; Sun, 18 May 2025 05:51:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b0RhN6LxVz2yZ8;
	Sun, 18 May 2025 13:51:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747540308;
	cv=none; b=g4KjVkcHQ656nAfAWF2hXeV6OTeoPjZf0cqU0spPSEb1bwpyalUwSsMcHtp4jcCIOwJ4WsIPiOiCUmMcMIwoZgcP6DxMzStmL9kqpC3QyKUJW337GunkWALIKTpgaHNABTw/oqH2b/ws2gkAZZd4lTv/t/dCx6UZlZs/+qrDjM1+GO01dzr4u5TSkdwjGGXi4Qcj8RBvc+IkkcCDKvteTk8PctMO/iMDXpWTJJ8Rl9aK6K8x4wIv0PRmwcDNNgLY1NFNy3rG8e0QOVyBq9pmnXsFwiK3OEeOVCtcXmgTIn6Xwa/1LiGjeOXcs9bUeg0utgIJTPDxurszufNw6wzOIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747540308; c=relaxed/relaxed;
	bh=AxJxR1OARXH8JruZuOA5iw1EUAlJpQuI7PhJ+yBr87s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kP30sKIahCyqXCSQZcZihTZGW81zhg6DT9LYp6NBUUBtXNeQ8NchiJiYXKuP95RD019rFD/2Rx+F86lRxjrB1maaIpCcd5+Ef/CXoZ6W0KYDnBU/VqTpXhsPFrap2bmaxCq9SBXhNuevnm4R1CDYT++v4d3cO4zD0lezNA6TOn9wCRia7KT2sZ47Gx0QKfzyplwtXqSK0sZHLC5obe0yxig4/D8DeXMQMtIp/9Lly6wYqq/9m350w8NP6hwIPCvZSSquspwoZtm2awjSNq9WQUn26FH/NJtgzMtzN1BF9yAputB/hun9jNwrA+WSnjZjSXlVWn8fQN7lIJeJFSBmuQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sADN9tiP; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sADN9tiP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b0RhN0LWsz2xlQ
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 18 May 2025 13:51:47 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54H9GNio023213;
	Sun, 18 May 2025 03:51:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=AxJxR1
	OARXH8JruZuOA5iw1EUAlJpQuI7PhJ+yBr87s=; b=sADN9tiPmJkasraql3//zr
	5O/bM9S6bq6pC+Hdh40X8IrzzQugln+o4wFsPbc9bLT65nKIeAE3qFC+G8xcLNWp
	5nFHfS4R1ZFH5LIF7pkGMRz9M3RHz1nDM4bMm3roSvHiXgye+GPjhyI2c6BD61gz
	JQyWyE3EyFWgXyncNPIOP6PPbvs8786IGZm1fl9JQ0uKT3uxzNxiaM/3xQZiRi8y
	rXFp0EDcnHQyUj/FAs/ZjfhC8Z4L2WaJjB2JgUW0BXE2mH0HbWPDYvGXqNhXxB8S
	V28UV2ji2JK8zTPkRHOmnPMLkXzCPP5t9Nsq7dHR74rSi6vM048Jn7GgCfFJmCOw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46pqnhtpvm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 18 May 2025 03:51:35 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54I3pY1w011686;
	Sun, 18 May 2025 03:51:34 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46pqnhtpvg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 18 May 2025 03:51:34 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54I1JVrO002483;
	Sun, 18 May 2025 03:51:34 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46q5sngdt4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 18 May 2025 03:51:34 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54I3pXFp31457888
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 18 May 2025 03:51:33 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6562558056;
	Sun, 18 May 2025 03:51:33 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 457FE58052;
	Sun, 18 May 2025 03:51:30 +0000 (GMT)
Received: from [9.43.51.82] (unknown [9.43.51.82])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 18 May 2025 03:51:29 +0000 (GMT)
Message-ID: <5b394e9b-df0a-4439-b2db-5513215711c2@linux.ibm.com>
Date: Sun, 18 May 2025 09:21:27 +0530
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
Subject: Re: [PATCH 2/6] powerpc/xmon: fix sparse warning "Using plain integer
 as NULL pointer"
To: Christophe Leroy <christophe.leroy@csgroup.eu>, mpe@ellerman.id.au
Cc: npiggin@gmail.com, naveen@kernel.org, linuxppc-dev@lists.ozlabs.org
References: <20250422131040.374427-1-maddy@linux.ibm.com>
 <20250422131040.374427-3-maddy@linux.ibm.com>
 <ff07d507-faaf-4565-9343-bb4a18a8410a@csgroup.eu>
Content-Language: en-US
From: Madhavan Srinivasan <maddy@linux.ibm.com>
In-Reply-To: <ff07d507-faaf-4565-9343-bb4a18a8410a@csgroup.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDAzMSBTYWx0ZWRfX+3aVyX4gs4iD cl/43ug4qKTMG05lGePV+1Wyvo5RTI9ibwRznc9tVjjkZWEBX1rtP7XEaDZcgS0ufkf0nF6Zryr oSKMWHrz3v7Ie5WV+RHWupnssm1gLtgwXxQmwKAaueeSG/cCg0bUNOh3cKoCaZ/vSBVGwQuAkbF
 op+pK0zUkmlzsDcDD+lpZPubobGWNI+UyZAQ+xEOxCCNbPVM48UVU8CMZJOpFAb7s3wkcLPjcOn SN+Vd2A+goYm8W616WCNEiu4uqF/HBdTaDhswKu/K7yM+ZPcXYAAZVvoPZb9WWl74MxE7X9FQ+m LPJUdIgOBe7t4ZDiwT8uzzfHaZ2MNVPXY3gPHcCYjQd59DV13Yelx85h8mhcTZT4uiSG7A9qP0m
 6/89R/Vski8sUi0MN3vFnQIEkrldyXhARbd9Et3HSm6mYuuBLxLrFao/aRgyIf0qpj8bQ08H
X-Authority-Analysis: v=2.4 cv=V6F90fni c=1 sm=1 tr=0 ts=68295947 cx=c_pps a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VnNF1IyMAAAA:8 a=gjnZfs_exA0jtAqt988A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 1CC9vANDllJoB5rCbqrBvWZPrhXiMlws
X-Proofpoint-ORIG-GUID: twF4BDunWjZLLn9hkQ6LIchZ-9zfGCOG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_02,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=720 malwarescore=0 spamscore=0 clxscore=1015 phishscore=0
 adultscore=0 suspectscore=0 bulkscore=0 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505180031
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 5/2/25 3:38 PM, Christophe Leroy wrote:
> 
> 
> Le 22/04/2025 à 15:10, Madhavan Srinivasan a écrit :
>> Fix passing of argument 0 to NULL to avoid sparse warning
> 
> I thought we wanted to keep this file in sync with opcodes/ppc-opc.c in the binutils repository.
> 
> Are you sure you want to do such manual change ? Shouldn't the change first be done in binutils then backported in linux kernel ?

yep, my bad, dont know what i was thinking :) . But nice catch. Will drop this.

Thanks

> 
> Christophe
> 
>>
>> Cleans up sparse warning:
>> arch/powerpc/xmon/ppc-opc.c:797:15: warning: Using plain integer as NULL pointer
>> arch/powerpc/xmon/ppc-opc.c:797:18: warning: Using plain integer as NULL pointer
>> arch/powerpc/xmon/ppc-opc.c:801:15: warning: Using plain integer as NULL pointer
>> arch/powerpc/xmon/ppc-opc.c:801:18: warning: Using plain integer as NULL pointer
>> arch/powerpc/xmon/ppc-opc.c:805:14: warning: Using plain integer as NULL pointer
>> arch/powerpc/xmon/ppc-opc.c:805:17: warning: Using plain integer as NULL pointer
>> arch/powerpc/xmon/ppc-opc.c:809:16: warning: Using plain integer as NULL pointer
>> arch/powerpc/xmon/ppc-opc.c:809:19: warning: Using plain integer as NULL pointer
>> arch/powerpc/xmon/ppc-opc.c:863:15: warning: Using plain integer as NULL pointer
>> arch/powerpc/xmon/ppc-opc.c:863:18: warning: Using plain integer as NULL pointer
>> arch/powerpc/xmon/ppc-opc.c:868:15: warning: Using plain integer as NULL pointer
>> arch/powerpc/xmon/ppc-opc.c:868:18: warning: Using plain integer as NULL pointer
>> arch/powerpc/xmon/ppc-opc.c:872:15: warning: Using plain integer as NULL pointer
>> arch/powerpc/xmon/ppc-opc.c:872:18: warning: Using plain integer as NULL pointer
>> arch/powerpc/xmon/ppc-opc.c:875:15: warning: Using plain integer as NULL pointer
>> arch/powerpc/xmon/ppc-opc.c:875:18: warning: Using plain integer as NULL pointer
>> arch/powerpc/xmon/ppc-opc.c:878:15: warning: Using plain integer as NULL pointer
>> arch/powerpc/xmon/ppc-opc.c:878:18: warning: Using plain integer as NULL pointer
>> arch/powerpc/xmon/ppc-opc.c:881:14: warning: Using plain integer as NULL pointer
>> arch/powerpc/xmon/ppc-opc.c:881:17: warning: Using plain integer as NULL pointer
>>
>> Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
>> ---
>>   arch/powerpc/xmon/ppc-opc.c | 20 ++++++++++----------
>>   1 file changed, 10 insertions(+), 10 deletions(-)
>>
>> diff --git a/arch/powerpc/xmon/ppc-opc.c b/arch/powerpc/xmon/ppc-opc.c
>> index 0774d711453e..b4ca7eb8d765 100644
>> --- a/arch/powerpc/xmon/ppc-opc.c
>> +++ b/arch/powerpc/xmon/ppc-opc.c
>> @@ -794,19 +794,19 @@ const struct powerpc_operand powerpc_operands[] =
>>   #define PSWM WS + 1
>>     /* The BO16 field in a BD8 form instruction.  */
>>   #define BO16 PSWM
>> -  {  0x1, 10, 0, 0, 0 },
>> +  {  0x1, 10, NULL, NULL, 0 },
>>       /* IDX bits for quantization in the pair singles instructions.  */
>>   #define PSQ PSWM + 1
>> -  {  0x7, 12, 0, 0, 0 },
>> +  {  0x7, 12, NULL, NULL, 0 },
>>       /* IDX bits for quantization in the pair singles x-type instructions.  */
>>   #define PSQM PSQ + 1
>> -  {  0x7, 7, 0, 0, 0 },
>> +  {  0x7, 7, NULL, NULL, 0 },
>>       /* Smaller D field for quantization in the pair singles instructions.  */
>>   #define PSD PSQM + 1
>> -  {  0xfff, 0, 0, 0,  PPC_OPERAND_PARENS | PPC_OPERAND_SIGNED },
>> +  {  0xfff, 0, NULL, NULL,  PPC_OPERAND_PARENS | PPC_OPERAND_SIGNED },
>>       /* The L field in an mtmsrd or A form instruction or R or W in an X form.  */
>>   #define A_L PSD + 1
>> @@ -860,25 +860,25 @@ const struct powerpc_operand powerpc_operands[] =
>>     /* Xilinx APU related masks and macros */
>>   #define FCRT XFL_L + 1
>>   #define FCRT_MASK (0x1f << 21)
>> -  { 0x1f, 21, 0, 0, PPC_OPERAND_FCR },
>> +  { 0x1f, 21, NULL, NULL, PPC_OPERAND_FCR },
>>       /* Xilinx FSL related masks and macros */
>>   #define FSL FCRT + 1
>>   #define FSL_MASK (0x1f << 11)
>> -  { 0x1f, 11, 0, 0, PPC_OPERAND_FSL },
>> +  { 0x1f, 11, NULL, NULL, PPC_OPERAND_FSL },
>>       /* Xilinx UDI related masks and macros */
>>   #define URT FSL + 1
>> -  { 0x1f, 21, 0, 0, PPC_OPERAND_UDI },
>> +  { 0x1f, 21, NULL, NULL, PPC_OPERAND_UDI },
>>     #define URA URT + 1
>> -  { 0x1f, 16, 0, 0, PPC_OPERAND_UDI },
>> +  { 0x1f, 16, NULL, NULL, PPC_OPERAND_UDI },
>>     #define URB URA + 1
>> -  { 0x1f, 11, 0, 0, PPC_OPERAND_UDI },
>> +  { 0x1f, 11, NULL, NULL, PPC_OPERAND_UDI },
>>     #define URC URB + 1
>> -  { 0x1f, 6, 0, 0, PPC_OPERAND_UDI },
>> +  { 0x1f, 6, NULL, NULL, PPC_OPERAND_UDI },
>>       /* The VLESIMM field in a D form instruction.  */
>>   #define VLESIMM URC + 1
> 


