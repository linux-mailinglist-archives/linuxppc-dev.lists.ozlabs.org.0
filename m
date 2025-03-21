Return-Path: <linuxppc-dev+bounces-7264-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B8DA6BA0C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Mar 2025 12:42:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZK0tH0vSdz30Nl;
	Fri, 21 Mar 2025 22:42:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742557351;
	cv=none; b=K5lCEcEFV/p/Z4aO8j7KVaOMD+aaE16R5BLQ2OqpLC4EFUAfTxa4IbAE/BmklJk7+xG+SWK1FjpU29QmPDyINtv5rppahstFsVOGF5D07k0d3XaE4yVGN9ZUSiDeh3b48ydDkgk1+0ZNRyArEWwM9M+OxOg2m0Ffg2qtOxs6kj4hlvRjvmqq4IXDGYAC3SnJxsKJVNgjNkWBR5GlM1RK8rXwR0d6Mk0dp7Mzt57R5Qu68f2+9uZPXaFY9m/OO+uQwSEdVUopLU5Aem7cG5ySYYA/9y9xogWgBZjeZI8rE92QORKz5Cdq8fa7ZaI1IeDxQ3dY9g7MysMwOedUBpoidQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742557351; c=relaxed/relaxed;
	bh=HxEUrFSkwvtTHGZsRrcYMHupA72KBahfp9Or61L+rwM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gHUlqAnoxQR0z9U0F6yTgtvvhAizea9AhmQohFxSVTohJq5Sw3NkdP11g1seeY8yvTd2jUnW6plXaUUqJhKn5Gd76MNuNLUn22Rwjv3IpR1sb15JjNjyd0UfjKUC7Vt7VjVUxcAGJxx3vPc2pKUev65WqRExZQLHjdgoMKVy5YY+2IASmzypIpgq/Zake3maxfe860SbUivyXqX1pmPvmmyhO4MLp54DIqhetyNv03gOkHp4Gv8EmoGDxoEPFxbHKuggSlVDcrPpHNkSWey+mUyVeXvZKzF9hPAAd18DnOgrWOFcBMjW9JBFKWcCJMqV5grj1e6nglUDBXUS6rp/+g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Y8hrAs+p; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Y8hrAs+p;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZK0tF4kJ5z30D3
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Mar 2025 22:42:29 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52LATcLe014247;
	Fri, 21 Mar 2025 11:42:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=HxEUrF
	SkwvtTHGZsRrcYMHupA72KBahfp9Or61L+rwM=; b=Y8hrAs+pldr03rjzo+WhAy
	U52ZrtB+IqpzlWD9UpaK9zugv90jFOORN2zkELt6EwBYrXFWIcZS7T1RujhRR0LQ
	3Nf9j8Yjpxk3xB9bYRq14TwB/gDfnvtsM98c0oASGAYIbK/QB4X9zQZqm+IkjRDE
	ribkrbF5GRfCwv50NtewtRkh8OhPtU6xy8rSO7LnT8LIX56v3qdxJjHbPqxbZAph
	BD+5t5VtF45BpBRp3FPz6zlw4+LuZ5Jdm7JFgVBVk7SG8v/GkVL/roGm5XjcQs+L
	s7rfJ8QPLxW6fTafqX2ZQ1y2WOGXHcm336io/OvsUF3QmYmLAdMZqov2l5nbldnw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45gt80u9xe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Mar 2025 11:42:15 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52LBY281031415;
	Fri, 21 Mar 2025 11:42:14 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45gt80u9x5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Mar 2025 11:42:14 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52LB0iUw019218;
	Fri, 21 Mar 2025 11:42:14 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([172.16.1.6])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 45dmvpd2m9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Mar 2025 11:42:14 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 52LBgCoH31654592
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 21 Mar 2025 11:42:13 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E184158067;
	Fri, 21 Mar 2025 11:42:12 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B8DF85805D;
	Fri, 21 Mar 2025 11:42:04 +0000 (GMT)
Received: from [9.43.64.160] (unknown [9.43.64.160])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 21 Mar 2025 11:42:04 +0000 (GMT)
Message-ID: <31a3d76b-617b-4c97-b83d-2cd47fabbf02@linux.ibm.com>
Date: Fri, 21 Mar 2025 17:12:01 +0530
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
Subject: Re: [PATCH V2 2/2] tools/perf/powerpc/util: Add support to handle
 compatible mode PVR for perf json events
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        Athira Rajeev <atrajeev@linux.vnet.ibm.com>, namhyung@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, irogers@google.com,
        akanksha@linux.ibm.com, kjain@linux.ibm.com,
        disgoel@linux.vnet.ibm.com, acme@kernel.org, hbathini@linux.ibm.com,
        adrian.hunter@intel.com, jolsa@kernel.org
References: <20241010145107.51211-1-atrajeev@linux.vnet.ibm.com>
 <20241010145107.51211-2-atrajeev@linux.vnet.ibm.com>
 <7cd87317-4f2a-45af-bd07-6e715406ff55@csgroup.eu>
Content-Language: en-US
From: Madhavan Srinivasan <maddy@linux.ibm.com>
In-Reply-To: <7cd87317-4f2a-45af-bd07-6e715406ff55@csgroup.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: TxLlLE1cX4Hnb4p2JPivH8_9XWPO13lL
X-Proofpoint-GUID: 3Jh4cugb2FdlH5bhaW77yb4YKss_41FL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_04,2025-03-20_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 mlxlogscore=999 phishscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 suspectscore=0 clxscore=1011
 impostorscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502280000 definitions=main-2503210085
X-Spam-Status: No, score=-1.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 3/21/25 4:04 PM, Christophe Leroy wrote:
> Hi,
> 
> Le 10/10/2024 à 16:51, Athira Rajeev a écrit :
>> perf list picks the events supported for specific platform
>> from pmu-events/arch/powerpc/<platform>. Example power10 events
>> are in pmu-events/arch/powerpc/power10, power9 events are part
>> of pmu-events/arch/powerpc/power9. The decision of which
>> platform to pick is determined based on PVR value in powerpc.
>> The PVR value is matched from pmu-events/arch/powerpc/mapfile.csv
>>
>> Example:
>>
>> Format:
>>     PVR,Version,JSON/file/pathname,Type
>>
>> 0x004[bcd][[:xdigit:]]{4},1,power8,core
>> 0x0066[[:xdigit:]]{4},1,power8,core
>> 0x004e[[:xdigit:]]{4},1,power9,core
>> 0x0080[[:xdigit:]]{4},1,power10,core
>> 0x0082[[:xdigit:]]{4},1,power10,core
>>
>> The code gets the PVR from system using get_cpuid_str function
>> in arch/powerpc/util/headers.c ( from SPRN_PVR ) and compares
>> with value from mapfile.csv
>> In case of compat mode, say when partition is booted in a power9
>> mode when the system is a power10, this picks incorrectly. Because
>> PVR will point to power10 where as it should pick events from power9
>> folder. To support generic events, add new folder
>> pmu-events/arch/powerpc/compat to contain the ISA architected events
>> which is supported in compat mode. Also return 0x00ffffff as pvr
>> when booted in compat mode. Based on this pvr value, json will
>> pick events from pmu-events/arch/powerpc/compat
>>
>> Suggested-by: Madhavan Srinivasan <maddy@linux.ibm.com>
>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> 
> I see this patch was merged into mainline allthough it had CI failures and still has.
> 
> Could you please fix it ?

We already have a fix patch posted for this issue 

https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20250321100726.699956-1-likhitha@linux.ibm.com/

Maddy


> 
> arch/powerpc/util/header.c: In function 'is_compat_mode':
> Error: arch/powerpc/util/header.c:20:14: error: cast to pointer from integer of different size [-Werror=int-to-pointer-cast]
>    20 |  if (!strcmp((char *)platform, (char *)base_platform))
>       |              ^
> Error: arch/powerpc/util/header.c:20:32: error: cast to pointer from integer of different size [-Werror=int-to-pointer-cast]
>    20 |  if (!strcmp((char *)platform, (char *)base_platform))
>       |                                ^
> cc1: all warnings being treated as errors
> make[6]: *** [/linux/tools/build/Makefile.build:86: /output/arch/powerpc/util/header.o] Error 1
> 
> 
> The following fix but is maybe not the right one as in reality getauxval() seems to return a long not a u64.
> 
> diff --git a/tools/perf/arch/powerpc/util/header.c b/tools/perf/arch/powerpc/util/header.c
> index c7df534dbf8f..1b045d410f31 100644
> --- a/tools/perf/arch/powerpc/util/header.c
> +++ b/tools/perf/arch/powerpc/util/header.c
> @@ -17,7 +17,7 @@ static bool is_compat_mode(void)
>      u64 base_platform = getauxval(AT_BASE_PLATFORM);
>      u64 platform = getauxval(AT_PLATFORM);
> 
> -    if (!strcmp((char *)platform, (char *)base_platform))
> +    if (!strcmp((char *)(long)platform, (char *)(long)base_platform))
>          return false;
> 
>      return true;
> 
> 
> Thanks
> Christophe
> 
>> ---
>> changelog:
>> V1 -> V2:
>> Corrected commit message and subject line
>>
>>   tools/perf/arch/powerpc/util/header.c | 32 ++++++++++++++++++++++++++-
>>   1 file changed, 31 insertions(+), 1 deletion(-)
>>
>> diff --git a/tools/perf/arch/powerpc/util/header.c b/tools/perf/arch/powerpc/util/header.c
>> index 6b00efd53638..adc82c479443 100644
>> --- a/tools/perf/arch/powerpc/util/header.c
>> +++ b/tools/perf/arch/powerpc/util/header.c
>> @@ -10,6 +10,18 @@
>>   #include "utils_header.h"
>>   #include "metricgroup.h"
>>   #include <api/fs/fs.h>
>> +#include <sys/auxv.h>
>> +
>> +static bool is_compat_mode(void)
>> +{
>> +    u64 base_platform = getauxval(AT_BASE_PLATFORM);
>> +    u64 platform = getauxval(AT_PLATFORM);
>> +
>> +    if (!strcmp((char *)platform, (char *)base_platform))
>> +        return false;
>> +
>> +    return true;
>> +}
>>     int
>>   get_cpuid(char *buffer, size_t sz)
>> @@ -33,8 +45,26 @@ char *
>>   get_cpuid_str(struct perf_pmu *pmu __maybe_unused)
>>   {
>>       char *bufp;
>> +    unsigned long pvr;
>> +
>> +    /*
>> +     * IBM Power System supports compatible mode. That is
>> +     * Nth generation platform can support previous generation
>> +     * OS in a mode called compatibile mode. For ex. LPAR can be
>> +     * booted in a Power9 mode when the system is a Power10.
>> +     *
>> +     * In the compatible mode, care must be taken when generating
>> +     * PVR value. When read, PVR will be of the AT_BASE_PLATFORM
>> +     * To support generic events, return 0x00ffffff as pvr when
>> +     * booted in compat mode. Based on this pvr value, json will
>> +     * pick events from pmu-events/arch/powerpc/compat
>> +     */
>> +    if (!is_compat_mode())
>> +        pvr = mfspr(SPRN_PVR);
>> +    else
>> +        pvr = 0x00ffffff;
>>   -    if (asprintf(&bufp, "0x%.8lx", mfspr(SPRN_PVR)) < 0)
>> +    if (asprintf(&bufp, "0x%.8lx", pvr) < 0)
>>           bufp = NULL;
>>         return bufp;
> 


