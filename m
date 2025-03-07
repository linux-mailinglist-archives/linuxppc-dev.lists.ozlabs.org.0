Return-Path: <linuxppc-dev+bounces-6794-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B3584A56274
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Mar 2025 09:17:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z8K0D0M4Qz300V;
	Fri,  7 Mar 2025 19:17:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741335451;
	cv=none; b=cgyMp63Ak8s/l9J4tGnGXygmenLQsC9zSjC0n3qjDcUoL531NyhcXo0NBX9xQJk9S6/doalCLKmTAgw4IM8Z3UQ3uZJM2BNjl/r/o0I7TKl/xRioU2wEQHRfHo7cuvfgpWFmWR9vh1IsBeX0mokTL2QUwNhm/sF7c0/YQmi9d27ISeaj7qZf9eYx+dRnqUVQFqLZiPA5EThOR7v8m3NtRU+Uy85kA8PkxBMi9rLRPbBfO2sEsQmAPG6OSJ8OnOcpmIDmfkBCu1kkBk7sBjb/zPJHpZbcaWK1Wk4MyvVgQxRD/y5hrs3+6uqQVlqTGW8ip0pWOzEEEcVJXpZCY333ww==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741335451; c=relaxed/relaxed;
	bh=9v6rfmRk1g4OFEfmzyvyinEAf/GQYQ+Xh2t+50nLPuc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=PbwgwkoXDOECu3eDckuscCnlXLrRCwgyT57kDapcgeo63V2YMSipa9UPI5W5ADEtt6zwTRUJS0GRrnzlCXTMMMgn9LKO1JenCglxw7a3Ej/cIx3fF/wkJCcLTfyk8bAjPJsG5GSDnHtjzTfp1x5WkUK/nsT9teQZycZ7p9IN0pu8FOrXiq65CsF+NuOf8/Toae9r7EoAioeOvZHU0PMrk5JdRtWUHS8fh1w0GVR2p89/3OjF36wqTcDyiUeQfoHmfhPEVu+HXXlR0IWbCnBDn0Lw4dHpBVTsPcv1KH475nQUKdX749kYfkWwkcE3ctUjvVXabgEt6CoaI0ntVqlobA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pfe0NOkR; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pfe0NOkR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z8K0B5QThz2yyT
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Mar 2025 19:17:29 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52764aVU011757
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 7 Mar 2025 08:17:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=9v6rfm
	Rk1g4OFEfmzyvyinEAf/GQYQ+Xh2t+50nLPuc=; b=pfe0NOkRzrwfCetO+deqxv
	Ff9x/dTK1yfTOb10KE6m9qIuICjMhFnjWya9Wgte9WwiauB2q17Mbu24/tdFqVT7
	e6BnDqJYbui1ySa+VpN97SlmpW8ScmLRa/7sbWWHltE3oSK8oFRSpbmj5h+1IHit
	PBPVcQHtTVC3PMTBX2yat0eIQDozakKdwO1yCb4MfuZ7SbqTiiYcz8DBQ4+AdD24
	se67P+CJ5CuINaLhZtEbTkPWBHqh9lxK2UMExea9k9JkcOAEhbjJdBYqDIT/9aiO
	WR5Vm+pscuGySPVWYn8DS4TCuKl8Jdi90Y24VwAQhSK3DbaaPWr1KV7bKTck8AuQ
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 457k45ah7w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 07 Mar 2025 08:17:26 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5276DYtk013720
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 7 Mar 2025 08:17:26 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([172.16.1.6])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 454e2m5jhe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 07 Mar 2025 08:17:26 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5278HPWE32047622
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 7 Mar 2025 08:17:25 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F39BA58054
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Mar 2025 08:17:24 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 64B535805F
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Mar 2025 08:17:24 +0000 (GMT)
Received: from [9.61.252.177] (unknown [9.61.252.177])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Mar 2025 08:17:24 +0000 (GMT)
Message-ID: <0f0adad9-1b2a-46d2-a63e-a77453a817bc@linux.ibm.com>
Date: Fri, 7 Mar 2025 13:47:22 +0530
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
Subject: Re: PowerPC: sleftests/powerpc fails to compile linux-next
Content-Language: en-GB
To: linuxppc-dev@lists.ozlabs.org
References: <3267ea6e-5a1a-4752-96ef-8351c912d386@linux.ibm.com>
 <7d61512d-6dd1-4c09-b408-67bc16340237@linux.ibm.com>
From: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
In-Reply-To: <7d61512d-6dd1-4c09-b408-67bc16340237@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: LkBvqVrAuRmojrXtzkICQDHxCvxEQTBZ
X-Proofpoint-GUID: LkBvqVrAuRmojrXtzkICQDHxCvxEQTBZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-07_03,2025-03-06_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 mlxlogscore=999 mlxscore=0 adultscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503070057
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org


On 07/03/25 12:32 pm, Madhavan Srinivasan wrote:
>
> On 3/6/25 10:30 PM, Venkat Rao Bagalkote wrote:
>> Greetings!!
>>
>> I see selftests/powerpc fails to compile on next-20250306.
>>
>> This error has been introduced in next-20250218. Make is successful on next-20250217.
>>
>>
>> Attached is the .config used.
>>
>>
>> If you fix this, please add below tag.
>>
>> Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
>>
>>
>> Errors:
>>
>> make -C powerpc/
>> make: Entering directory '/root/venkat/linux-next/tools/testing/selftests/powerpc'
>> Makefile:60: warning: overriding recipe for target 'emit_tests'
>> ../lib.mk:182: warning: ignoring old recipe for target 'emit_tests'
>> BUILD_TARGET=/root/venkat/linux-next/tools/testing/selftests/powerpc/alignment; mkdir -p $BUILD_TARGET; make OUTPUT=$BUILD_TARGET -k -C alignment all
>> make[1]: Nothing to be done for 'all'.
>> BUILD_TARGET=/root/venkat/linux-next/tools/testing/selftests/powerpc/benchmarks; mkdir -p $BUILD_TARGET; make OUTPUT=$BUILD_TARGET -k -C benchmarks all
>> make[1]: Nothing to be done for 'all'.
>> BUILD_TARGET=/root/venkat/linux-next/tools/testing/selftests/powerpc/cache_shape; mkdir -p $BUILD_TARGET; make OUTPUT=$BUILD_TARGET -k -C cache_shape all
>> make[1]: Nothing to be done for 'all'.
>> BUILD_TARGET=/root/venkat/linux-next/tools/testing/selftests/powerpc/copyloops; mkdir -p $BUILD_TARGET; make OUTPUT=$BUILD_TARGET -k -C copyloops all
>> make[1]: Nothing to be done for 'all'.
>> BUILD_TARGET=/root/venkat/linux-next/tools/testing/selftests/powerpc/dexcr; mkdir -p $BUILD_TARGET; make OUTPUT=$BUILD_TARGET -k -C dexcr all
>> make[1]: Nothing to be done for 'all'.
>> BUILD_TARGET=/root/venkat/linux-next/tools/testing/selftests/powerpc/dscr; mkdir -p $BUILD_TARGET; make OUTPUT=$BUILD_TARGET -k -C dscr all
>> make[1]: Nothing to be done for 'all'.
>> BUILD_TARGET=/root/venkat/linux-next/tools/testing/selftests/powerpc/mm; mkdir -p $BUILD_TARGET; make OUTPUT=$BUILD_TARGET -k -C mm all
>>    CC       pkey_exec_prot
>> In file included from pkey_exec_prot.c:18:
>> /root/venkat/linux-next/tools/testing/selftests/powerpc/include/pkeys.h: In function ‘pkeys_unsupported’:
>> /root/venkat/linux-next/tools/testing/selftests/powerpc/include/pkeys.h:96:34: error: ‘PKEY_UNRESTRICTED’ undeclared (first use in this function)
>>     96 |         pkey = sys_pkey_alloc(0, PKEY_UNRESTRICTED);
>>        |                                  ^~~~~~~~~~~~~~~~~
> Commit 6d61527d931ba ('mm/pkey: Add PKEY_UNRESTRICTED macro') added a macro PKEY_UNRESTRICTED to handle implicit literal
> value of 0x0 (which is "unrestricted"). belore patch add the same to powerpc/mm selftest.
>
> Can you try with this patch to check whether it fixes the build break for you
>
>
> diff --git a/tools/testing/selftests/powerpc/include/pkeys.h b/tools/testing/selftests/powerpc/include/pkeys.h
> index c6d4063dd4f6..d6deb6ffa1b9 100644
> --- a/tools/testing/selftests/powerpc/include/pkeys.h
> +++ b/tools/testing/selftests/powerpc/include/pkeys.h
> @@ -24,6 +24,9 @@
>   #undef PKEY_DISABLE_EXECUTE
>   #define PKEY_DISABLE_EXECUTE   0x4
>   
> +#undef PKEY_UNRESTRICTED
> +#define PKEY_UNRESTRICTED      0x0
> +
>   /* Older versions of libc do not define this */
>   #ifndef SEGV_PKUERR
>   #define SEGV_PKUERR    4
>
>
> Maddy

Tested with the above patch and it fixes the issue.

Please add below tag.

Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>


Regards,

Venkat.

>
>> /root/venkat/linux-next/tools/testing/selftests/powerpc/include/pkeys.h:96:34: note: each undeclared identifier is reported only once for each function it appears in
>> pkey_exec_prot.c: In function ‘segv_handler’:
>> pkey_exec_prot.c:75:53: error: ‘PKEY_UNRESTRICTED’ undeclared (first use in this function)
>>     75 |                         pkey_set_rights(fault_pkey, PKEY_UNRESTRICTED);
>>        | ^~~~~~~~~~~~~~~~~
>> make[1]: *** [../../lib.mk:222: /root/venkat/linux-next/tools/testing/selftests/powerpc/mm/pkey_exec_prot] Error 1
>>    CC       pkey_siginfo
>> In file included from pkey_siginfo.c:22:
>> /root/venkat/linux-next/tools/testing/selftests/powerpc/include/pkeys.h: In function ‘pkeys_unsupported’:
>> /root/venkat/linux-next/tools/testing/selftests/powerpc/include/pkeys.h:96:34: error: ‘PKEY_UNRESTRICTED’ undeclared (first use in this function)
>>     96 |         pkey = sys_pkey_alloc(0, PKEY_UNRESTRICTED);
>>        |                                  ^~~~~~~~~~~~~~~~~
>> /root/venkat/linux-next/tools/testing/selftests/powerpc/include/pkeys.h:96:34: note: each undeclared identifier is reported only once for each function it appears in
>> pkey_siginfo.c: In function ‘segv_handler’:
>> pkey_siginfo.c:86:39: error: ‘PKEY_UNRESTRICTED’ undeclared (first use in this function)
>>     86 |                 pkey_set_rights(pkey, PKEY_UNRESTRICTED);
>>        |                                       ^~~~~~~~~~~~~~~~~
>> make[1]: *** [../../lib.mk:222: /root/venkat/linux-next/tools/testing/selftests/powerpc/mm/pkey_siginfo] Error 1
>> make[1]: Target 'all' not remade because of errors.
>> make: *** [Makefile:40: mm] Error 2
>> make: Leaving directory '/root/venkat/linux-next/tools/testing/selftests/powerpc'
>>
>>
>> Regards,
>>
>> Venkat.
>

