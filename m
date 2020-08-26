Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA172529CE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Aug 2020 11:16:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bc0c64THHzDqW7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Aug 2020 19:16:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=psampat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=lJOMEX6U; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bc0Z75cqjzDqGg
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Aug 2020 19:15:11 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07Q929xl137857; Wed, 26 Aug 2020 05:14:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=vA8Tx3iVI4lzD+KxacYxVdJLgZdZWXwDkLHluN4iPX4=;
 b=lJOMEX6Ul4lTwBWfPuro4JteOf7VVAEuNGExwnyWhL1McPc/A50U3+nyNMXWg+RJGuJa
 pvU/13JFYuNdyb27BbhnyQ8A4YoQ6f7h9PV5Ovmei4gC6RBINUW9jqRvf5Lt02xGxjpl
 c7Zd3CpooqbiVX8e2p5iElF0BJQK3q2Y7aamTO5lJlhZMJuCsaL8xrcrTx1RCg1tAtVb
 77l+OD6wv6eWuE7ATzCXiF7njMHFy/TVSXRi3XySjVjFHPBNKyGJGakTFunczw8dPZU5
 f56G7tZXy/q+W6b0eteW7zN8nyHBycVtacisyh0UFtcw3fgXRdocyg1S9p9HXbmXoPAJ zw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 335mkb8kv5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Aug 2020 05:14:52 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07Q93XuC143601;
 Wed, 26 Aug 2020 05:14:52 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 335mkb8kpk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Aug 2020 05:14:51 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07Q9Driw006959;
 Wed, 26 Aug 2020 09:14:37 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04fra.de.ibm.com with ESMTP id 332ujjtp19-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Aug 2020 09:14:37 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 07Q9EZVV62128472
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Aug 2020 09:14:35 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1414BAE053;
 Wed, 26 Aug 2020 09:14:35 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9A56BAE045;
 Wed, 26 Aug 2020 09:14:33 +0000 (GMT)
Received: from [9.85.74.150] (unknown [9.85.74.150])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 26 Aug 2020 09:14:33 +0000 (GMT)
Subject: Re: [PATCH] Revert "powerpc/powernv/idle: Replace CPU feature check
 with PVR check"
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au, npiggin@gmail.com,
 mikey@neuling.org, ego@linux.vnet.ibm.com, svaidy@linux.ibm.com,
 linux-kernel@vger.kernel.org, pratik.r.sampat@gmail.com
References: <20200826082918.89306-1-psampat@linux.ibm.com>
 <1fb7fcef-a39d-d36e-35d5-021a5c9ea82c@csgroup.eu>
From: Pratik Sampat <psampat@linux.ibm.com>
Message-ID: <170e1919-bc45-6b99-dc4d-713418c98be1@linux.ibm.com>
Date: Wed, 26 Aug 2020 14:44:32 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1fb7fcef-a39d-d36e-35d5-021a5c9ea82c@csgroup.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-26_03:2020-08-25,
 2020-08-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 bulkscore=0 clxscore=1011 priorityscore=1501 malwarescore=0 phishscore=0
 adultscore=0 suspectscore=0 spamscore=0 mlxlogscore=999 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008260068
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 26/08/20 2:07 pm, Christophe Leroy wrote:
>
>
> Le 26/08/2020 à 10:29, Pratik Rajesh Sampat a écrit :
>> Cpuidle stop state implementation has minor optimizations for P10
>> where hardware preserves more SPR registers compared to P9.
>> The current P9 driver works for P10, although does few extra
>> save-restores. P9 driver can provide the required power management
>> features like SMT thread folding and core level power savings
>> on a P10 platform.
>>
>> Until the P10 stop driver is available, revert the commit which
>> allows for only P9 systems to utilize cpuidle and blocks all
>> idle stop states for P10.
>> Cpu idle states are enabled and tested on the P10 platform
>> with this fix.
>>
>> This reverts commit 8747bf36f312356f8a295a0c39ff092d65ce75ae.
>>
>> Fixes: 8747bf36f312 ("powerpc/powernv/idle: Replace CPU feature check 
>> with PVR check")
>> Signed-off-by: Pratik Rajesh Sampat <psampat@linux.ibm.com>
>> ---
>>   @mpe: This revert would resolve a staging issue wherein the P10 stop
>>   driver is not yet ready while cpuidle stop states need not be blocked
>>   on 5.9 for Power10 systems which could cause SMT folding related
>>   performance issues.
>>
>>   The P10 stop driver is in the works here:
>> https://lists.ozlabs.org/pipermail/linuxppc-dev/2020-August/216773.html
>>
>>   arch/powerpc/platforms/powernv/idle.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/powerpc/platforms/powernv/idle.c 
>> b/arch/powerpc/platforms/powernv/idle.c
>> index 77513a80cef9..345ab062b21a 100644
>> --- a/arch/powerpc/platforms/powernv/idle.c
>> +++ b/arch/powerpc/platforms/powernv/idle.c
>> @@ -1223,7 +1223,7 @@ static void __init pnv_probe_idle_states(void)
>>           return;
>>       }
>>   -    if (pvr_version_is(PVR_POWER9))
>> +    if (cpu_has_feature(CPU_FTR_ARCH_300))
>
> Why not something like:
>
>     if (pvr_version_is(PVR_POWER9) || pvr_version_is(PVR_POWER10))
>         pnv_power9_idle_init(); 

In order to use PVR_POWER10 I would need to define it under
arch/powerpc/include/asm/reg.h, which is not present in 5.9 yet.

However, if it okay with @mpe I could split out Nick's P10 stop driver
(https://lists.ozlabs.org/pipermail/linuxppc-dev/2020-August/216773.html)
into two parts:
1. This could include minimal code to introduce the P10 PVR and the
stop wrappers for it. Although this patch internally still calls into
the P9 path. This should gracefully fix the issue.
2. Then later in this patch we could introduce the p10 callback
methods as they are in Nick's series.

---
Thanks
Pratik

>
>>           pnv_power9_idle_init();
>>         for (i = 0; i < nr_pnv_idle_states; i++)
>>
>
> Christophe

