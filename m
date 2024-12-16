Return-Path: <linuxppc-dev+bounces-4174-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06CB59F301B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Dec 2024 13:09:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YBdzY4PK4z2ysv;
	Mon, 16 Dec 2024 23:09:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734350985;
	cv=none; b=AsooEnT7yTVc3ag/36Jna2mNYzVmTUduv+ueW46gowLa8AqJQs/VvezZytGPMUmzz2vgN95hwzhv/AMjTnxR+fOr5ZSmt2HXSYLeMxVowTFhuBofFB5ZhxzrFvM4YBMCLwd7rcJP9uE7SYZn3lR0e4Yg83FWT+LAwUV6H9iooQD7vAxXhUdae6rYzyxxW0tmZn7mzAinpQrT/UBMgSb/9fLdWm3ifOqZVepWQTR06CfkBgm4FMGTrXHDPP7pe/NsDxkZMLKwfb5KGe+CbiHGgLnEj6Aa1SQxFdrr0y3Se9KaD1/jeQCnLteM8X7UE4WaeKgzdEDubx0RLNrEk8KhtA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734350985; c=relaxed/relaxed;
	bh=WTSHcJ8eRCQYNL+hWiFrScopX+ZbF/jNY8lXSWTn3Ck=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YeOmLowNHBIFxEIeHQx/7dzUvEL2HiDZcHr10YpcmuG7phXmr72czi7yPD39A/5dCGGFH2dQ7AV8gRfu5kBLB3xokJpbhVhGTj7iSmA+2CA0BUhz0lj3+MPf18NsUL8OiqckDfS/Mt7N5kPSQ0uqulRSDxAszQDSpWmQXnEsCs17c9STQ7om2hhCYpbz5XmgXO/e28tyDQJWnLv8m3TOYkI/Eqv3LWtHutS4KnLLQa6IDB4U3hdMtyJabLBoivSfuG7GOrsf9Zxxa+yt94Dlq1CdhCUDuQjdEfW6SUpR4w1k8K4sIJPM+1tl/AxkFPkpyv4Yv1KzzO5HWkVkxgQr3w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ChfgpvZ1; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ChfgpvZ1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YBdzW2RdDz2xJ5
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Dec 2024 23:09:42 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BG85ZiZ027025;
	Mon, 16 Dec 2024 12:09:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=WTSHcJ
	8eRCQYNL+hWiFrScopX+ZbF/jNY8lXSWTn3Ck=; b=ChfgpvZ1WWBUw2MPcuNizl
	tM7m1HK6aVnVvzOUzaRRtS1ozNw+v/vY/zekAW08+rHzh7M8UkVvTPHwk+nNMTLS
	k6OmfCGcYd+j/H9FEVm6alLI70902+8Pdl+tzL2LhZ0UwXDtwDwEKpwBNuz0Y1fL
	jLnzzGqeGTtS2zqKOEWWFDiX8yLFEY79xNKY+E4D8qgHX+EG9iDKjShx6EGScife
	ffZUgnzbqIvghUIHCTCgwA0jTRpEwyLcX9OmMh3ubMYujINL8rcF/E+lYKnjldyD
	Nhjg4WI/exQMRWeCfxHRUkYpyXHnGY8t76Q+zXpUsogVe/44y2GMxLba1JB7GArQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43jgd292kf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 12:09:26 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4BGC3TIN002189;
	Mon, 16 Dec 2024 12:09:26 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43jgd292kb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 12:09:26 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGASkJ8011260;
	Mon, 16 Dec 2024 12:09:25 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 43hpjjwjcu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 12:09:25 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4BGC9OKY27132444
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Dec 2024 12:09:24 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5ADB658065;
	Mon, 16 Dec 2024 12:09:24 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C54EC5805D;
	Mon, 16 Dec 2024 12:09:19 +0000 (GMT)
Received: from [9.43.70.111] (unknown [9.43.70.111])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 16 Dec 2024 12:09:19 +0000 (GMT)
Message-ID: <bbde8e05-fc85-434e-998c-a6fcc8b2df4e@linux.ibm.com>
Date: Mon, 16 Dec 2024 17:39:17 +0530
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
Subject: Re: [PATCH 3/3] selftest/powerpc/ptrace: Cleanup duplicate macro
 definitions
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, mpe@ellerman.id.au,
        npiggin@gmail.com, christophe.leroy@csgroup.eu, naveen@kernel.org,
        shuah@kernel.org
Cc: linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org
References: <20241209151418.348085-1-maddy@linux.ibm.com>
 <20241209151418.348085-3-maddy@linux.ibm.com> <87ldwf520w.fsf@gmail.com>
Content-Language: en-US
From: Madhavan Srinivasan <maddy@linux.ibm.com>
In-Reply-To: <87ldwf520w.fsf@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: l6k8yrErjU-dP8EVAwrEkxuevyu2ZaYK
X-Proofpoint-GUID: SZ4kf7HNimysG9KiQGPyaUuUwoSNRgI2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 mlxlogscore=867 priorityscore=1501 malwarescore=0 impostorscore=0
 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412160101
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 12/16/24 4:27 PM, Ritesh Harjani (IBM) wrote:
> Madhavan Srinivasan <maddy@linux.ibm.com> writes:
> 
>> Both core-pkey.c and ptrace-pkey.c tests have similar macro
>> definitions, move them to "pkeys.h" and remove the macro
>> definitions from the C file.
>>
>> Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
>> ---
>>  tools/testing/selftests/powerpc/include/pkeys.h      | 8 ++++++++
>>  tools/testing/selftests/powerpc/ptrace/core-pkey.c   | 8 --------
>>  tools/testing/selftests/powerpc/ptrace/ptrace-pkey.c | 8 --------
>>  3 files changed, 8 insertions(+), 16 deletions(-)
>>
>> diff --git a/tools/testing/selftests/powerpc/include/pkeys.h b/tools/testing/selftests/powerpc/include/pkeys.h
>> index 51729d9a7111..3a0129467de6 100644
>> --- a/tools/testing/selftests/powerpc/include/pkeys.h
>> +++ b/tools/testing/selftests/powerpc/include/pkeys.h
>> @@ -35,10 +35,18 @@
>>  #define __NR_pkey_alloc		384
>>  #define __NR_pkey_free		385
>>  
>> +#ifndef NT_PPC_PKEY
>> +#define NT_PPC_PKEY		0x110
>> +#endif
>> +
>>  #define PKEY_BITS_PER_PKEY	2
>>  #define NR_PKEYS		32
>>  #define PKEY_BITS_MASK		((1UL << PKEY_BITS_PER_PKEY) - 1)
>>  
>> +#define AMR_BITS_PER_PKEY 2
>> +#define PKEY_REG_BITS (sizeof(u64) * 8)
>> +#define pkeyshift(pkey) (PKEY_REG_BITS - ((pkey + 1) * AMR_BITS_PER_PKEY))
>> +
>>  inline unsigned long pkeyreg_get(void)
>>  {
>>  	return mfspr(SPRN_AMR);
>> diff --git a/tools/testing/selftests/powerpc/ptrace/core-pkey.c b/tools/testing/selftests/powerpc/ptrace/core-pkey.c
>> index 31c9bf6d95db..f8ff05e5bf6e 100644
>> --- a/tools/testing/selftests/powerpc/ptrace/core-pkey.c
>> +++ b/tools/testing/selftests/powerpc/ptrace/core-pkey.c
>> @@ -18,18 +18,10 @@
>>  #include "child.h"
>>  #include "pkeys.h"
>>  
>> -#ifndef NT_PPC_PKEY
>> -#define NT_PPC_PKEY		0x110
>> -#endif
>> -
>>  #ifndef PKEY_DISABLE_EXECUTE
>>  #define PKEY_DISABLE_EXECUTE	0x4
>>  #endif
> 
> We could remove this as well right. Since pkeys.h already has this
> permission defines i.e.
> PKEY_DISABLE_[ACCESS|WRITE|EXECUTE] 
> 

Nice catch. Yes we can drop these too.
Will fix and send a v2
 

>>  
>> -#define AMR_BITS_PER_PKEY 2
>> -#define PKEY_REG_BITS (sizeof(u64) * 8)
>> -#define pkeyshift(pkey) (PKEY_REG_BITS - ((pkey + 1) * AMR_BITS_PER_PKEY))
>> -
>>  #define CORE_FILE_LIMIT	(5 * 1024 * 1024)	/* 5 MB should be enough */
>>  
>>  static const char core_pattern_file[] = "/proc/sys/kernel/core_pattern";
>> diff --git a/tools/testing/selftests/powerpc/ptrace/ptrace-pkey.c b/tools/testing/selftests/powerpc/ptrace/ptrace-pkey.c
>> index 6893ed096457..5d528d0ea9d1 100644
>> --- a/tools/testing/selftests/powerpc/ptrace/ptrace-pkey.c
>> +++ b/tools/testing/selftests/powerpc/ptrace/ptrace-pkey.c
>> @@ -9,18 +9,10 @@
>>  #include "child.h"
>>  #include "pkeys.h"
>>  
>> -#ifndef NT_PPC_PKEY
>> -#define NT_PPC_PKEY		0x110
>> -#endif
>> -
>>  #ifndef PKEY_DISABLE_EXECUTE
>>  #define PKEY_DISABLE_EXECUTE	0x4
>>  #endif
>>  
> 
> Same here. This can be cleaned up, no? Since pkeys already has this defined.
> 
> 
> -ritesh
> 
>> -#define AMR_BITS_PER_PKEY 2
>> -#define PKEY_REG_BITS (sizeof(u64) * 8)
>> -#define pkeyshift(pkey) (PKEY_REG_BITS - ((pkey + 1) * AMR_BITS_PER_PKEY))
>> -
>>  static const char user_read[] = "[User Read (Running)]";
>>  static const char user_write[] = "[User Write (Running)]";
>>  static const char ptrace_read_running[] = "[Ptrace Read (Running)]";
>> -- 
>> 2.47.0


