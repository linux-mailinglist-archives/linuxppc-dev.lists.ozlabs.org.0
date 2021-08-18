Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CEFA63F09C6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Aug 2021 19:01:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GqZ0y5fqxz3clP
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Aug 2021 03:01:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=e32dAK7D;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=e32dAK7D; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GqZ0K1rCxz3bWX
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Aug 2021 03:00:32 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17IGfC0p093861; Wed, 18 Aug 2021 13:00:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=bEpgVkTMtOMi+Pc70ODcf0+LSvPe58lG4xH+a35ybE4=;
 b=e32dAK7D0At/tED9h3LEDEFRkehpHQTVgw+Zx5BmReG8/yLmoCuvYhsvx1GLdwvJiiTA
 of718QoohsaZZYy1npyq8hq1XAlPe53pYHTc83YSY7mMCpFOxg5dsSYer/gFLZ2iQDkT
 7sdw34/WTSYevtFqgHppbXqXt/wgHlBeQhSerDTqchJDKwYzaqL56oszhHlDPrpJwbPp
 FmelEo7yGrRLrY0LVNj1SP37DhsT36ID8j6GmUEHQZY78mhM8Mc835KHbsMtUtvQ5q7g
 v3MmEoGDFsGBMzQQSvZKWmeHiE+lv0xuya1KmuJhslLIXrVipT8bSwTD07uY1Gs2o8Hz kw== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3agg0ackhd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Aug 2021 13:00:12 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17IGrDNU016604;
 Wed, 18 Aug 2021 17:00:11 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma04wdc.us.ibm.com with ESMTP id 3ae5fdp1ty-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Aug 2021 17:00:11 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17IH0Aok39911824
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 Aug 2021 17:00:10 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 45BBC28060;
 Wed, 18 Aug 2021 17:00:10 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0168828067;
 Wed, 18 Aug 2021 17:00:07 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.199.41.222])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 18 Aug 2021 17:00:07 +0000 (GMT)
Subject: Re: [PATCH v3 3/3] powerpc/perf: Fix the check for SIAR value
To: Christophe Leroy <christophe.leroy@csgroup.eu>, mpe@ellerman.id.au,
 linuxppc-dev@lists.ozlabs.org
References: <20210818131949.32008-1-kjain@linux.ibm.com>
 <20210818131949.32008-3-kjain@linux.ibm.com>
 <1a32a009-160d-a665-f6a5-2a2be53ae2bd@csgroup.eu>
From: kajoljain <kjain@linux.ibm.com>
Message-ID: <fc859bd8-f2af-4e9d-08c4-50f6593069e3@linux.ibm.com>
Date: Wed, 18 Aug 2021 22:30:06 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <1a32a009-160d-a665-f6a5-2a2be53ae2bd@csgroup.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: RCCHVVDvn10N-10YpApzZeYqq1gRftAu
X-Proofpoint-GUID: RCCHVVDvn10N-10YpApzZeYqq1gRftAu
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-18_06:2021-08-17,
 2021-08-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 adultscore=0 mlxlogscore=999 phishscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 spamscore=0 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108180104
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
Cc: atrajeev@linux.vnet.ibm.com, maddy@linux.ibm.com, rnsastry@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 8/18/21 6:58 PM, Christophe Leroy wrote:
> 
> 
> Le 18/08/2021 à 15:19, Kajol Jain a écrit :
>> Incase of random sampling, there can be scenarios where
>> Sample Instruction Address Register(SIAR) may not latch
>> to the sampled instruction and could result in
>> the value of 0. In these scenarios it is preferred to
>> return regs->nip. These corner cases are seen in the
>> previous generation (p9) also.
>>
>> Patch adds the check for SIAR value along with use_siar and
>> siar_valid checks so that the function will return regs->nip
>> incase SIAR is zero.
>>
>> Patch drops the code under PPMU_P10_DD1 flag check
>> which handles SIAR 0 case only for Power10 DD1.
>>
>> Fixes: 2ca13a4cc56c9 ("powerpc/perf: Use regs->nip when SIAR is zero")
>> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
>> ---
>>
>> Changelog:
>> - Drop adding new ternary condition to check siar value.
>> - Remove siar check specific for PPMU_P10_DD1 and add
>>    it along with common checks as suggested by Christophe Leroy
>>    and Michael Ellermen
>>
>>   arch/powerpc/perf/core-book3s.c | 7 +------
>>   1 file changed, 1 insertion(+), 6 deletions(-)
>>
>> diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
>> index 23ec89a59893..55efbba7572b 100644
>> --- a/arch/powerpc/perf/core-book3s.c
>> +++ b/arch/powerpc/perf/core-book3s.c
>> @@ -2254,12 +2254,7 @@ unsigned long perf_instruction_pointer(struct pt_regs *regs)
>>       bool use_siar = regs_use_siar(regs);
>>       unsigned long siar = mfspr(SPRN_SIAR);
>>   -    if (ppmu && (ppmu->flags & PPMU_P10_DD1)) {
>> -        if (siar)
>> -            return siar;
>> -        else
>> -            return regs->nip;
>> -    } else if (use_siar && siar_valid(regs))
>> +    if (use_siar && siar_valid(regs) && siar)
> 
> You can probably now do
> 
> +    if (regs_use_siar(regs) && siar_valid(regs) && siar)
> 
> and remove use_siar

Hi Christophe,
     I will update it. Thanks for pointing it.

Thanks,
Kajol Jain

> 
>>           return siar + perf_ip_adjust(regs);
>>       else
>>           return regs->nip;
>>
