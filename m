Return-Path: <linuxppc-dev+bounces-6795-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2765CA56277
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Mar 2025 09:19:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z8K1s4h23z2xxy;
	Fri,  7 Mar 2025 19:18:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741335537;
	cv=none; b=n9xECuEfn5K7OWfTncec/tt+Top1i+2KJGoMQfoCsGhBecjPiD9cCL3afXLkf4BioBtZCyuocAKHI7TRbTlyoxKneqvizz7+2HYYkpqU7gxdqkWfqtWkbXj2vnb8F0G/lCgOKzlk1TxntJIP6W28rBRXSlCQkGCBV2D9EX2rn8brRXa3DpDREk+a89llmeaVV5WLKJlnq9w7vQ6rpEooESlWDWnUVO6hYu9VF9S+AunytjZLt9sUV6/28itzkzYtsmRbXy5reFcF2QzE2Sk/zD0Tl37ASCQktpliKJXwcyFca7KGHH2BC9B+NMqUz4Okj/MiLeO794fqcGQ2iSAaZw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741335537; c=relaxed/relaxed;
	bh=HUlocG2RnMX3+bo8rgZyFOe49j+CvldyoNogv34PoiA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=gt1U5Vcgpt1dDLf0Xw61Av416SAtKIEMVoogLSRX+7c5O6JKY7VqOvPagoPJ3BxTIRlg7rw447DdDrn+q3+7hKunv4Dd96LQdl+s2miIAAk+BWN415i+AGosm2SGH4/z5FmsPbWGxmPU/4r4dAOQXcZZbxxoIDRQJxknnbCafEZTtsXqhvsN/UMubxW5woBuuRuYmsT42LQOHOgm5SDb/fgoQ0if7huK/6rtHcZjyjLnem0ientJOjNTI5NdC3JmpO1htXC/mZlIMwxfIHgU6XtVo6kvFcat1KEUSvezC8UNcZ1IqVeiqneaThFiL1v2+Vi34rNqFf33Y6Tj1ggBuw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lTqn8ejM; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lTqn8ejM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z8K1r38Jkz2xGF
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Mar 2025 19:18:56 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52785Lnn005975;
	Fri, 7 Mar 2025 08:18:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=HUlocG
	2RnMX3+bo8rgZyFOe49j+CvldyoNogv34PoiA=; b=lTqn8ejMsy7P94bTmHyxXj
	e1I8DRmSmNAQUno5Qj6gA7VrKgMCXorx31kXfAYQDG70jbWTeaFJu7na+GhK2Jui
	QUQFnJXOvxQfG+5B+AtY2oUUkxvLmS1ydCGJA9f0qeGV5NqgywHwF7Bb3K1OZMYU
	f+9+gz/RNojIm7bI2rug/CNs+VNFiLrBqKReavO0Dk1kuHP6qx0vHOHOK4oNiLsh
	K0RnoOMh0q42MMCWZKOjo3yVLMKuFiaZHgenuzCBg+BvzC2pXTOxRU7tXJsMkhva
	mZrrimI3zmAiMTEGzRnkVn8ZpWdEZv6ix11/h1THsYpt3BY42JBr9ACTW1x62tcQ
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 457br2wab9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Mar 2025 08:18:45 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5275cKcD013724;
	Fri, 7 Mar 2025 08:18:44 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([172.16.1.6])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 454e2m5jq4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Mar 2025 08:18:44 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5278Ih9a31916604
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 7 Mar 2025 08:18:43 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8F24E58054;
	Fri,  7 Mar 2025 08:18:43 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BEA6F5805F;
	Fri,  7 Mar 2025 08:18:41 +0000 (GMT)
Received: from [9.61.252.177] (unknown [9.61.252.177])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  7 Mar 2025 08:18:41 +0000 (GMT)
Message-ID: <b52834e9-6611-46a0-b036-42f6e9fa202c@linux.ibm.com>
Date: Fri, 7 Mar 2025 13:48:40 +0530
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
To: Madhavan Srinivasan <maddy@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>,
        Michael Ellerman <mpe@ellerman.id.au>
References: <3267ea6e-5a1a-4752-96ef-8351c912d386@linux.ibm.com>
 <7d61512d-6dd1-4c09-b408-67bc16340237@linux.ibm.com>
From: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
In-Reply-To: <7d61512d-6dd1-4c09-b408-67bc16340237@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: h7aksYgr8NicgkMHYgcbHg6AcDX-CQFr
X-Proofpoint-ORIG-GUID: h7aksYgr8NicgkMHYgcbHg6AcDX-CQFr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-07_03,2025-03-06_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 spamscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 mlxlogscore=999
 malwarescore=0 suspectscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

/Responding to all/

/
/

Tested with the above patch and it fixes the issue.

Please add below tag.

Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>


Regards,

Venkat.

>
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

