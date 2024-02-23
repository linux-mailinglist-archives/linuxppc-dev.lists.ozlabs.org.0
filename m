Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 894E986185C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Feb 2024 17:47:02 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Clv0duaQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ThGBX3mmGz3vXN
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Feb 2024 03:47:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Clv0duaQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ThG9l5KhNz3dWh
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Feb 2024 03:46:19 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41NGgw4G004474;
	Fri, 23 Feb 2024 16:46:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=oPlXuoePukAARrmMzA6iirpxpC7DakSJQ7xC++rSb+Q=;
 b=Clv0duaQcd8+28Cc0pZyhGqDcj/gDndGrhsDrO399hJnn6uTZKtfdvMOhCh8jUfa8+QX
 qgQIeKW46G47yCqtvSnV4upsdCP3UW8lDxTWHNBFjYm1r3QxhJ17yDhvTGfxgCTtWxiY
 yApYzU7tICSSGhJGXWzbL5ukBnZhO/dTSEj/8D2XhzktUW5uNP7nTFuWfZUzrkDuHsNP
 ElvFBTYLYxnONbfcE5DwXJjR4L2oIBZB0KAtqtujj1Yfn7QPe9rZZ8WYdrdZ6WrWT1h0
 OKSMfAX5mi0S6qYoxHEMErAeVsC3D9T37naYu2H1irKFE8gg5DDlTKCKoZabp/a4CVmA 3Q== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wey4g83h2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Feb 2024 16:46:11 +0000
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 41NGhe8b006612;
	Fri, 23 Feb 2024 16:46:10 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wey4g83ge-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Feb 2024 16:46:10 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41NEhntC017257;
	Fri, 23 Feb 2024 16:46:10 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3wb8mmxg62-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Feb 2024 16:46:10 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41NGk61850135598
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 23 Feb 2024 16:46:08 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BCAEF58063;
	Fri, 23 Feb 2024 16:46:06 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A7BEE5805A;
	Fri, 23 Feb 2024 16:46:06 +0000 (GMT)
Received: from localhost (unknown [9.61.117.25])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 23 Feb 2024 16:46:06 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin
 <npiggin@gmail.com>,
        "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
        "Naveen
 N. Rao" <naveen.n.rao@linux.ibm.com>
Subject: Re: [PATCH] powerpc/rtas: use correct function name for resetting
 TCE tables
In-Reply-To: <87wmqvaegj.fsf@mail.lhotse>
References: <20240222-rtas-fix-ibm-reset-pe-dma-window-v1-1-7aaf235ac63c@linux.ibm.com>
 <87wmqvaegj.fsf@mail.lhotse>
Date: Fri, 23 Feb 2024 10:46:06 -0600
Message-ID: <87h6hzp1rl.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 4Z56-GXxup9of19xREu9HOq4l2PqqY0j
X-Proofpoint-ORIG-GUID: TTjaVCEk-voz27BJbq6q2G0H1wL5FP1h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-23_02,2024-02-23_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999 adultscore=0
 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402230122
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
Cc: Gaurav Batra <gbatra@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman <mpe@ellerman.id.au> writes:
> Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>
> writes:
>> From: Nathan Lynch <nathanl@linux.ibm.com>
>>
>> The PAPR spec spells the function name as
>>
>>   "ibm,reset-pe-dma-windows"
>>
>> but in practice firmware uses the singular form:
>
> Just to be clear, you're talking about IBM firmware on PowerVM
> machines.

Yes, although I did check Qemu too.

>> diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
>> index 7e793b503e29..8064d9c3de86 100644
>> --- a/arch/powerpc/kernel/rtas.c
>> +++ b/arch/powerpc/kernel/rtas.c
>> @@ -375,8 +375,13 @@ static struct rtas_function rtas_function_table[] __ro_after_init = {
>>  	[RTAS_FNIDX__IBM_REMOVE_PE_DMA_WINDOW] = {
>>  		.name = "ibm,remove-pe-dma-window",
>>  	},
>> -	[RTAS_FNIDX__IBM_RESET_PE_DMA_WINDOWS] = {
>> -		.name = "ibm,reset-pe-dma-windows",
>> +	[RTAS_FNIDX__IBM_RESET_PE_DMA_WINDOW] = {
>> +		/*
>> +		 * Note: PAPR+ v2.13 7.3.31.4.1 spells this as
>> +		 * "ibm,reset-pe-dma-windows" (plural), but RTAS
>> +		 * implementations use the singular form in practice.
>> +		 */
>> +		.name = "ibm,reset-pe-dma-window",
>
> Qemu also spells it that way:
>
> $ grep -C 12 ibm,reset-pe-dma-window hw/ppc/spapr_rtas_ddw.c
> static void spapr_rtas_ddw_init(void)
> {
>     spapr_rtas_register(RTAS_IBM_QUERY_PE_DMA_WINDOW,
>                         "ibm,query-pe-dma-window",
>                         rtas_ibm_query_pe_dma_window);
>     spapr_rtas_register(RTAS_IBM_CREATE_PE_DMA_WINDOW,
>                         "ibm,create-pe-dma-window",
>                         rtas_ibm_create_pe_dma_window);
>     spapr_rtas_register(RTAS_IBM_REMOVE_PE_DMA_WINDOW,
>                         "ibm,remove-pe-dma-window",
>                         rtas_ibm_remove_pe_dma_window);
>     spapr_rtas_register(RTAS_IBM_RESET_PE_DMA_WINDOW,
>                         "ibm,reset-pe-dma-window",
>                         rtas_ibm_reset_pe_dma_window);
> }
>
> There's no version in SLOF, it delegates to Qemu.
>
> The old platforms that use RTAS won't implement this call at all, so
> there's no issue with the naming there.

Thanks for checking. I've added SLOF to my checklist for things like
this.
