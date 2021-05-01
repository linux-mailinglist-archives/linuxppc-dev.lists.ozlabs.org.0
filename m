Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5693707BB
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 May 2021 17:32:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FXYBr2H7dz2yyK
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 May 2021 01:32:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FBbCdNxU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sandipan@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=FBbCdNxU; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FXYBC4Jddz2yR8
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  2 May 2021 01:31:47 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 141FFRCI130190; Sat, 1 May 2021 11:31:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=fLdOvdSUPv1sLW/wTo2TgGXxtZVWjGygpLXtAelTbkc=;
 b=FBbCdNxUJWFjx4trYGx5iaxgmnoNkFLJUjWUEc+ybTK8q4XHotSKiBNGa/3YiHJ3j3/t
 1lDask5pY0ctVC+BwZ3E1g/45n8PhyN4ciALbW/HffVkku2GYgiJgWiwrEAqN1tN2z+3
 X2xk0BIHgtfMyMHYhFAJCp64gWF7/w/WWAkw84YWBNP/LXy4hEduda+apWdPXQXxGVMC
 rJ8T6GcZu6X+FMWVXt+ORwmURk2l+jTWFupGU7opgMgTYPxEWHmR9RmH4HyMePY3UfKi
 +stNGVTjHJNE/fbHM1MOHKZ034voSy8jsocmowDfNYYa6EN4aeTVeqqnXiJopusSCmoT Ng== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3899fe06bd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 01 May 2021 11:31:34 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 141FGPRa132028;
 Sat, 1 May 2021 11:31:34 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3899fe06ay-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 01 May 2021 11:31:34 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 141FRSKN005397;
 Sat, 1 May 2021 15:31:32 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04ams.nl.ibm.com with ESMTP id 388xm8r50y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 01 May 2021 15:31:31 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 141FVT4L16515544
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 1 May 2021 15:31:29 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 66353A4054;
 Sat,  1 May 2021 15:31:29 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A511AA405B;
 Sat,  1 May 2021 15:31:27 +0000 (GMT)
Received: from [9.77.192.134] (unknown [9.77.192.134])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Sat,  1 May 2021 15:31:27 +0000 (GMT)
Subject: Re: [PATCH] powerpc/powernv/memtrace: Fix dcache flushing
To: Christophe Leroy <christophe.leroy@csgroup.eu>, mpe@ellerman.id.au
References: <20210430075557.893819-1-sandipan@linux.ibm.com>
 <cb700884-b9f3-f3b9-4fae-272d678d1626@csgroup.eu>
From: Sandipan Das <sandipan@linux.ibm.com>
Message-ID: <6d585ff1-f238-d18b-5cc5-9259ebddbdbd@linux.ibm.com>
Date: Sat, 1 May 2021 21:01:26 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <cb700884-b9f3-f3b9-4fae-272d678d1626@csgroup.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: FtNbahig1GwNnvPjeXzefYP79rtj_ZTs
X-Proofpoint-ORIG-GUID: vjzrwdTHoJ8d_biFWDTUUOIuaxuLxYiJ
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-01_10:2021-04-30,
 2021-05-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 phishscore=0 adultscore=0 impostorscore=0 clxscore=1011 spamscore=0
 mlxlogscore=999 mlxscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2105010110
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
Cc: aneesh.kumar@linux.ibm.com, rashmica.g@gmail.com, jniethe5@gmail.com,
 linuxppc-dev@lists.ozlabs.org, david@redhat.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 30/04/21 2:12 pm, Christophe Leroy wrote:
> 
> 
> Le 30/04/2021 à 09:55, Sandipan Das a écrit :
>> Trace memory is cleared and the corresponding dcache lines
>> are flushed after allocation. However, this should not be
>> done using the PFN. This adds the missing __va() conversion.
>>
>> Fixes: 2ac02e5ecec0 ("powerpc/mm: Remove dcache flush from memory remove.")
>> Signed-off-by: Sandipan Das <sandipan@linux.ibm.com>
>> ---
>>   arch/powerpc/platforms/powernv/memtrace.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/powerpc/platforms/powernv/memtrace.c b/arch/powerpc/platforms/powernv/memtrace.c
>> index 71c1262589fe..a31f13814f2e 100644
>> --- a/arch/powerpc/platforms/powernv/memtrace.c
>> +++ b/arch/powerpc/platforms/powernv/memtrace.c
>> @@ -104,8 +104,8 @@ static void memtrace_clear_range(unsigned long start_pfn,
>>        * Before we go ahead and use this range as cache inhibited range
>>        * flush the cache.
>>        */
>> -    flush_dcache_range_chunked(PFN_PHYS(start_pfn),
>> -                   PFN_PHYS(start_pfn + nr_pages),
>> +    flush_dcache_range_chunked((unsigned long)__va(PFN_PHYS(start_pfn)),
>> +                   (unsigned long)__va(PFN_PHYS(start_pfn + nr_pages)),
> 
> Can you use pfn_to_virt() instead ?
> 
>>                      FLUSH_CHUNK_SIZE);
>>   }
>>  

Sure, that looks cleaner. Thanks for the suggestion.

- Sandipan
