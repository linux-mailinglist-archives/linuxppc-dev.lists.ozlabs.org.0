Return-Path: <linuxppc-dev+bounces-6888-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A2CA5BC74
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Mar 2025 10:41:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZBpfq3DXfz3bnc;
	Tue, 11 Mar 2025 20:41:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741686067;
	cv=none; b=eYGeuq4m4H2E85vgNhgms6byb34vxxcCVdofrU8fjnHjab8y0ay/F16KmVk/6HYcqpBhgw2yywvDW2Y6rLlvQXZVB4k4SY5jjbBmvuAF+JBEFJNDgK7DnWsKHEXme/TQ1neA0YGEbzU/a12fAkHJUlFzEpv/brguqF3GBlQUNIUNxjQgYLvXTczPy5Q6SkW2lrpTQUnMTbw3QI8/5Xwec51Lzy+74jQabDqvMs6BwIoou/uHzDnG7HF5yFaeOEfoFh0I23eetlzernLvWYunLdT7ldny+W200ZnHWuwo5ecc6mPSO36x8MLS4eiZ37oJiIJu1CGWIx6gVT+uP+9iow==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741686067; c=relaxed/relaxed;
	bh=6I1b0TCf0861eUg0j1bG0JIXQ0cQRlMRhcps9J6sxtY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=Y/JWiYrDkvWPCTENKVJAUbFpHZ0n8lTMsCvS8k66Q9SPdgGSpLjD1ZGUs6SWdK7CbOTwaemkgbwtpiW2RLz6IjQATzWqU3I7rk5v18xZkPhwH4q28fTmVhFiGaf60DhKU6GW545AxH1DrXCR2+LCBFTd9cX+WsZzRB+vsYD5UPhE7gc7kxLc4DI8rp9HPnWiIh0FWEvL2cXYecSOQodTitjnIqj72pTnh/v0MpNVhScqrt8o7R3HtLaS42I4Tnjzp7WsSFdWx3c0i04NZJsxy3lP3+z06qeyLLc/d5lSu0vl6Ke72sWKNwkxwCeTABvxdZtVqMHICnPxQXJHTN0irg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SsJLQwkg; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SsJLQwkg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZBpfl282cz3blv
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Mar 2025 20:41:03 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52B3kS8V002310;
	Tue, 11 Mar 2025 09:40:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=6I1b0T
	Cf0861eUg0j1bG0JIXQ0cQRlMRhcps9J6sxtY=; b=SsJLQwkgvh8isfsMPCQHrt
	hDZid+Nr+rEUHXY7rcMrGVcAZce1RrwlC3mQ20PZIWKkLwZW9dYcgfE/DVTYKaa8
	qoPxR/Q2vYDlSRf6RxTC4iCjYzkbjqXBy0s1rJEsECRUy4+VWnol4NpIQ2PWOBTZ
	fxDUXE94IEEnd3ZxJj9kEz8ojwtkwCjgk4sH3c3SqVf3P7tgC4IrzaL0Ccf4f3kW
	BpM6++k4Ny0+IUrzGT2n4SPqHxZbHtyc0Fo6Q2ZFkJAJQiacUdPqwxMyHMUyP15T
	CRy06biemw/FqjBFisEXtQz9Q7aC81Vx7Oqr4YWkU1inZv5QG1Wwe+P9taSQJV2g
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45adjb1nnh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Mar 2025 09:40:51 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52B7Z4e1014483;
	Tue, 11 Mar 2025 09:40:50 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4592ekb5ny-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Mar 2025 09:40:50 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 52B9eoRv65470974
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 11 Mar 2025 09:40:50 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 07C765805E;
	Tue, 11 Mar 2025 09:40:50 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3347458056;
	Tue, 11 Mar 2025 09:40:48 +0000 (GMT)
Received: from [9.204.206.207] (unknown [9.204.206.207])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 11 Mar 2025 09:40:47 +0000 (GMT)
Message-ID: <601912e0-e257-4f3f-9c41-6d957d42b746@linux.ibm.com>
Date: Tue, 11 Mar 2025 15:10:46 +0530
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
Subject: Re: [linux-next-20250307] Build Failure
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
References: <70ba4e80-53c4-4583-82f3-2851e0829aa6@linux.ibm.com>
 <5cd65d1f-37ea-4051-82ea-e6879bfc288a@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <5cd65d1f-37ea-4051-82ea-e6879bfc288a@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: QufTZr0CAMkhLyVmBox5kbEIR-2L574Q
X-Proofpoint-GUID: QufTZr0CAMkhLyVmBox5kbEIR-2L574Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-11_01,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=999
 spamscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 adultscore=0 phishscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503110064
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 3/11/25 2:17 PM, Madhavan Srinivasan wrote:
> 
> 
> On 3/9/25 6:08 PM, Venkat Rao Bagalkote wrote:
>> Greetings!!,
>>
>> I see linux-next-20250307 fails to build on IBM Power9 and Power10 servers.
>>
>>
>> Errors:
>>
>> In file included from ^[[01m^[[K<command-line>^[[m^[[K:
>> ^[[01m^[[K./usr/include/cxl/features.h:11:10:^[[m^[[K ^[[01;31m^[[Kfatal error: ^[[m^[[Kuuid/uuid.h: No such file or directory
>>    11 | #include ^[[01;31m^[[K<uuid/uuid.h>^[[m^[[K
>>       |          ^[[01;31m^[[K^~~~~~~~~~~~~^[[m^[[K
>> compilation terminated.

This is new report, needs to debug 
Fixes i was pointing out is for the objtool errors.

Maddy


>> make[4]: *** [usr/include/Makefile:85: usr/include/cxl/features.hdrtest] Error 1
>> make[3]: *** [scripts/Makefile.build:461: usr/include] Error 2
>> make[2]: *** [scripts/Makefile.build:461: usr] Error 2
>> make[2]: *** Waiting for unfinished jobs....
>> arch/powerpc/kernel/switch.o: warning: objtool: .text+0x4: intra_function_call not a direct call
>> arch/powerpc/crypto/ghashp8-ppc.o: warning: objtool: .text+0x22c: unannotated intra-function call
>> arch/powerpc/kvm/book3s_hv_rmhandlers.o: warning: objtool: .text+0xe84: intra_function_call not a direct call
>> make[1]: *** [/home/linux_src/linux/Makefile:1997: .] Error 2
>> make: *** [Makefile:251: __sub-make] Error 2
>>
>> Please add below tag, if you happen to fix this issue.
>>
> 
> Fixes has been posted to handle these errors 
> 
> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/88876fb4e412203452e57d1037a1341cf15ccc7b.1741128981.git.christophe.leroy@csgroup.eu/
> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/7aa7eb73fe6bc95ac210510e22394ca0ae227b69.1741128786.git.christophe.leroy@csgroup.eu/
> 
> and these are already part of powerpc/next-test, will be moved to powerpc/next soon
> 
> Maddy
> 
>> Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
>>
>>
>> Regards,
>>
>> Venkat.
>>
>>
> 
> 


