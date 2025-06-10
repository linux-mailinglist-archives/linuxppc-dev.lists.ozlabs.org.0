Return-Path: <linuxppc-dev+bounces-9239-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23777AD2DE2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jun 2025 08:23:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bGdyG53G1z2yft;
	Tue, 10 Jun 2025 16:23:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749536582;
	cv=none; b=icoxPKyd+FL+qNcj2EW7XBe0ebAfsv7t3avvU21InzeYHhlaYANojKbxvcBK+vZRAoNN9Zuj0QuuJ4+h8ZOY0FVyyNRkSGxMWdWw3vNLxy+H2eBnHGZRNFoWEiv6SLKwb4Vbnln0+TT54OTn2jaMcNl2goXEYBEbDymSyZY8O0IG9vedyRDl97h8ehAz+pD42hITAFyEYSDINHeswqISbGLveyA6mBYw/bQrYRXwD8pMpK7clM7bGySBMd/tRhStWWk3ZbLPQ4hyQRcgQpRebKmK4skk0XVSpXwF6B8ntYh4iaEXlHefZcO43v5mCLIQfj3ZNYSNSzbaTLs+2AsN9w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749536582; c=relaxed/relaxed;
	bh=XP208GXL2PeCWloqg8m6xDqEyY7/H1aJmFJcFYLwapA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jcJLQlKxqOK3y0heBQFALQzRjq+C7udqDyHG9HgvW39A6sqH7uMT1IqfmX+AUr6w7mO+L5bKN//HysAAtAXBTNzY1mtxdVGwpJvZdslytA4ONcmTnA8wfPvVEhiW734NYQhhLvl5lowJAWzHpQgJBuGyjBLzgvUJl3mrGkdpdgrMm45pKdSHHjl1klG7Tv3EDUi8Q+sUiIxHmVBcscIPzU4lih/Z8Ba0UWB1pFFbnf/yrOcTpqIr5PJrCiH6qVluF0LSxa0ZDbVng0q7sHjdotURaKheWlCV02+psOyIXNbBnkTOyS15qLBtZ8JcAeMSKANZCvdchiJ20qEWguY/ZA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gdOBdhk/; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gdOBdhk/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bGdyF575Kz2xd3
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jun 2025 16:23:01 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A09xC3000783;
	Tue, 10 Jun 2025 06:22:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=XP208G
	XL2PeCWloqg8m6xDqEyY7/H1aJmFJcFYLwapA=; b=gdOBdhk/RbHxpd+w9Na6Lw
	aHVZNMb6L1pzm90wQFOVCu6PLX1TcBtBc7b8ie51W51/Jv/IIuXHhjhO5k6CH5/t
	4Z3gpH/WVOa8T4OV3J4DcOjUX0MijTTeYymUuPRHgf0foPoPW8RMVZcUnkzPgT4f
	0OO2fqOmKU98ddXmyISFgpQlxHAvi6y/8k5JYo8Ogg8zJQZ/GX9e8H/uOKCg4/Ly
	udXOkNWtlg1FRMaLoGPaV8UedKG/i8ND52oN0q0pslN0VV0y4+p1xPPtH8yWGuHr
	jxKVkGwaQopJe2yfcIF0WggD3/pQ0UFHiZNvEaYAnRusaSOgylUdE9BnXvpizIdw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4769wyh5y4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 06:22:48 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 55A67m3T014056;
	Tue, 10 Jun 2025 06:22:48 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4769wyh5y2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 06:22:48 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 55A3EWrM015191;
	Tue, 10 Jun 2025 06:22:47 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 474yrt9af8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 06:22:47 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 55A6MkUt11534872
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Jun 2025 06:22:46 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7B22758059;
	Tue, 10 Jun 2025 06:22:46 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5434A58043;
	Tue, 10 Jun 2025 06:22:41 +0000 (GMT)
Received: from [9.43.59.164] (unknown [9.43.59.164])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 10 Jun 2025 06:22:40 +0000 (GMT)
Message-ID: <5b103f2a-8d32-4f77-8e81-73680ceaf52e@linux.ibm.com>
Date: Tue, 10 Jun 2025 11:52:38 +0530
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
Subject: Re: [PATCH] powerpc/vdso: Fix build of VDSO32 with pcrel
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
References: <1fa3453f07d42a50a70114da9905bf7b73304fca.1747073669.git.christophe.leroy@csgroup.eu>
 <8dceee14-6008-48d0-a3c8-30ae777660a1@csgroup.eu>
Content-Language: en-US
From: Madhavan Srinivasan <maddy@linux.ibm.com>
In-Reply-To: <8dceee14-6008-48d0-a3c8-30ae777660a1@csgroup.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: pE9kUb4q8g_0ovTPiyUdq032bGXVcVdf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDA0NiBTYWx0ZWRfX1PqYEWEdmzvD mZerRvFrpp//VvKuJ98wH/ssdyalhi6Pue+oZhDaIHZgtwUK43UsS6bD7llcFB93g+Dynil9Yg+ f/XGgk5UnIgcmLeK0s7Qf0MSFiEtQQ/AkeOZ1+wqbhkuR6zXbgKD01Pzze1I0sgQYtxml9kmtYz
 HcuDPNzx3CLNEnILfbqxvnvSUazfQ79MzxmurviYQ1dSp6I06uuNaY/2JYyhKGqpOPKN1ooiwGN htukYwc8+dCQYWy+aR1ooA21jvLaiiQbbt4YF65fvgFu0pWK+kfDx81i6sERpQaIGIYOVB0TsZE HAgnuRPrsoXnszNj0g9PuH4wChQ0tkUaT4jxkDHVSc6csTeqZaT+15bGbfIzcYlcl8s9btQziv+
 90jwfCzU0/cbrZR45jyCFhDMRXtvlg1h0dP6XAMG/cS69Mg3iHXaeQAGf7k783+qGqinF481
X-Authority-Analysis: v=2.4 cv=YKGfyQGx c=1 sm=1 tr=0 ts=6847cf38 cx=c_pps a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=1UX6Do5GAAAA:8 a=U2Z_qZhADA7zUz1wkAIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=Et2XPkok5AAZYJIKzHr1:22
X-Proofpoint-GUID: NbnXFPJ0HV5kMqvvyPaDAtfufLdzBvqk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_02,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 priorityscore=1501 phishscore=0 mlxscore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 mlxlogscore=760
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506100046
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 6/10/25 11:33 AM, Christophe Leroy wrote:
> Hi Maddy,
> 
> ping ?

Yes, its not lost :) . Will add it for the next fixes PR.

Maddy

> 
> Christophe
> 
> Le 12/05/2025 à 20:14, Christophe Leroy a écrit :
>> Building vdso32 on power10 with pcrel leads to following errors:
>>
>>       VDSO32A arch/powerpc/kernel/vdso/gettimeofday-32.o
>>     arch/powerpc/kernel/vdso/gettimeofday.S: Assembler messages:
>>     arch/powerpc/kernel/vdso/gettimeofday.S:40: Error: syntax error; found `@', expected `,'
>>     arch/powerpc/kernel/vdso/gettimeofday.S:71:  Info: macro invoked from here
>>     arch/powerpc/kernel/vdso/gettimeofday.S:40: Error: junk at end of line: `@notoc'
>>     arch/powerpc/kernel/vdso/gettimeofday.S:71:  Info: macro invoked from here
>>      ...
>>     make[2]: *** [arch/powerpc/kernel/vdso/Makefile:85: arch/powerpc/kernel/vdso/gettimeofday-32.o] Error 1
>>     make[1]: *** [arch/powerpc/Makefile:388: vdso_prepare] Error 2
>>
>> Once the above is fixed, the following happens:
>>
>>       VDSO32C arch/powerpc/kernel/vdso/vgettimeofday-32.o
>>     cc1: error: '-mpcrel' requires '-mcmodel=medium'
>>     make[2]: *** [arch/powerpc/kernel/vdso/Makefile:89: arch/powerpc/kernel/vdso/vgettimeofday-32.o] Error 1
>>     make[1]: *** [arch/powerpc/Makefile:388: vdso_prepare] Error 2
>>     make: *** [Makefile:251: __sub-make] Error 2
>>
>> Make sure pcrel version of CFUNC() macro is used only for powerpc64
>> builds and remove -mpcrel for powerpc32 builds.
>>
>> Fixes: 7e3a68be42e1 ("powerpc/64: vmlinux support building with PCREL addresing")
>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>> ---
>>   arch/powerpc/include/asm/ppc_asm.h | 2 +-
>>   arch/powerpc/kernel/vdso/Makefile  | 2 +-
>>   2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/powerpc/include/asm/ppc_asm.h b/arch/powerpc/include/asm/ppc_asm.h
>> index 02897f4b0dbf..b891910fce8a 100644
>> --- a/arch/powerpc/include/asm/ppc_asm.h
>> +++ b/arch/powerpc/include/asm/ppc_asm.h
>> @@ -183,7 +183,7 @@
>>   /*
>>    * Used to name C functions called from asm
>>    */
>> -#ifdef CONFIG_PPC_KERNEL_PCREL
>> +#if defined(__powerpc64__) && defined(CONFIG_PPC_KERNEL_PCREL)
>>   #define CFUNC(name) name@notoc
>>   #else
>>   #define CFUNC(name) name
>> diff --git a/arch/powerpc/kernel/vdso/Makefile b/arch/powerpc/kernel/vdso/Makefile
>> index e8824f933326..8834dfe9d727 100644
>> --- a/arch/powerpc/kernel/vdso/Makefile
>> +++ b/arch/powerpc/kernel/vdso/Makefile
>> @@ -53,7 +53,7 @@ ldflags-$(CONFIG_LD_ORPHAN_WARN) += -Wl,--orphan-handling=$(CONFIG_LD_ORPHAN_WAR
>>   ldflags-y += $(filter-out $(CC_AUTO_VAR_INIT_ZERO_ENABLER) $(CC_FLAGS_FTRACE) -Wa$(comma)%, $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS))
>>     CC32FLAGS := -m32
>> -CC32FLAGSREMOVE := -mcmodel=medium -mabi=elfv1 -mabi=elfv2 -mcall-aixdesc
>> +CC32FLAGSREMOVE := -mcmodel=medium -mabi=elfv1 -mabi=elfv2 -mcall-aixdesc -mpcrel
>>   ifdef CONFIG_CC_IS_CLANG
>>   # This flag is supported by clang for 64-bit but not 32-bit so it will cause
>>   # an unused command line flag warning for this file.
> 


