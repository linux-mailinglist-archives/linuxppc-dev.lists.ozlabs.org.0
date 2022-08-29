Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC855A4F72
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Aug 2022 16:40:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MGY5213JYz3byv
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Aug 2022 00:40:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=P+fWNMsv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sv@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=P+fWNMsv;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MGY4K4Tfcz2xGF
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Aug 2022 00:39:45 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27TEPmcC025701;
	Mon, 29 Aug 2022 14:39:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=SQVydA1k3U6kPp3G5IB0fmdL8RYgISwzJjiqljbfeqM=;
 b=P+fWNMsvM/ahzUYeS/Rr402Db3vJBBDLGVrzVL7WgbDCxP+1ZTs4ArPbvUKPd1ET1nb2
 1SkEWrcYWhhPYESweVoBT3QqVdRJbAuOhfcQ+oI15J932TkPlzTJMRooHMdkQQjzxLXr
 f4fHLDBLomsiqDCj9B3Wd8kHhLz9WLdLLJyFmmIrKUHnjFFrlBVecXsMPmVFxOqHB2nt
 DQ5LbOtLLKIWlMarxk4hz0LeUsSmcJLM7lKa1gbhs8zql0nYAo6ZLHMxw6X5GHKy1vj5
 INVIrX93oPCQJyuXRLU5QBZCJ2c4AfMFhr1ywcKTl0VGuUMEqB2pNLKR2A4wik4l9Myp JQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j8y77gg5u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Aug 2022 14:39:19 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27TEa2fW004338;
	Mon, 29 Aug 2022 14:39:18 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com [149.81.74.108])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j8y77gg3t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Aug 2022 14:39:18 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
	by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27TEZqo8028038;
	Mon, 29 Aug 2022 14:39:16 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
	by ppma05fra.de.ibm.com with ESMTP id 3j7aw8sstc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Aug 2022 14:39:15 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
	by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 27TEdZ6Z36176368
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 29 Aug 2022 14:39:35 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A4D2DA4054;
	Mon, 29 Aug 2022 14:39:13 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 77ECCA405C;
	Mon, 29 Aug 2022 14:39:09 +0000 (GMT)
Received: from [9.43.54.31] (unknown [9.43.54.31])
	by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 29 Aug 2022 14:39:09 +0000 (GMT)
Message-ID: <14dbd6be-05be-e98c-3a2d-922fb0b8cb72@linux.vnet.ibm.com>
Date: Mon, 29 Aug 2022 20:09:08 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 02/16] powerpc: override __ALIGN() and __ALIGN_STR()
 macros
Content-Language: en-US
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        Sathvika Vasireddy <sv@linux.ibm.com>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <20220829055223.24767-1-sv@linux.ibm.com>
 <20220829055223.24767-3-sv@linux.ibm.com>
 <7a56b125-86ec-e78a-9327-b523bc0239cf@csgroup.eu>
From: Sathvika Vasireddy <sv@linux.vnet.ibm.com>
In-Reply-To: <7a56b125-86ec-e78a-9327-b523bc0239cf@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 9n6QLa6oyDgWJy-ClNDxeIFMmLFXAUSz
X-Proofpoint-ORIG-GUID: vtbFqzIZr8S30PD_KJAXLkyztU2Fql-c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-29_07,2022-08-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 clxscore=1015 mlxscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999
 spamscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2208290068
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
Cc: "peterz@infradead.org" <peterz@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "rostedt@goodmis.org" <rostedt@goodmis.org>, "aik@ozlabs.ru" <aik@ozlabs.ru>, "mingo@redhat.com" <mingo@redhat.com>, "npiggin@gmail.com" <npiggin@gmail.com>, "jpoimboe@redhat.com" <jpoimboe@redhat.com>, "naveen.n.rao@linux.vnet.ibm.com" <naveen.n.rao@linux.vnet.ibm.com>, "mbenes@suse.cz" <mbenes@suse.cz>, "chenzhongjin@huawei.com" <chenzhongjin@huawei.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christophe,

On 29/08/22 18:56, Christophe Leroy wrote:
>
> Le 29/08/2022 à 07:52, Sathvika Vasireddy a écrit :
>> Powerpc instructions must be word-aligned. Currently,
>> there is an alignment of 16 bytes (by default), and it is
>> much more than what is required for powerpc (4 bytes).
>>
>> The default expansion of __ALIGN() macro is:
>> #define __ALIGN       .align 4,0x90
>>
>> Since Powerpc Linux does not require a 16 byte alignment,
>> override __ALIGN() and __ALIGN_STR() macros to use required
>> 4 byte alignment.
>>
>> Signed-off-by: Sathvika Vasireddy <sv@linux.ibm.com>
>> ---
>>    arch/powerpc/include/asm/linkage.h | 4 ++++
>>    1 file changed, 4 insertions(+)
>>
>> diff --git a/arch/powerpc/include/asm/linkage.h b/arch/powerpc/include/asm/linkage.h
>> index b71b9582e754..8df88fe61438 100644
>> --- a/arch/powerpc/include/asm/linkage.h
>> +++ b/arch/powerpc/include/asm/linkage.h
>> @@ -2,8 +2,12 @@
>>    #ifndef _ASM_POWERPC_LINKAGE_H
>>    #define _ASM_POWERPC_LINKAGE_H
>>    
>> +#include <linux/stringify.h>
>>    #include <asm/types.h>
>>    
>> +#define __ALIGN			.align 2
>> +#define __ALIGN_STR		__stringify(__ALIGN)
>> +
> I still can't see the added value of using __stringify() macro here. In
> order to use that macro you have to include linux/stringify.h . Usually
> we try to minimise the amount of headers required by other headers.
Oh ok, makes sense to me. I'll wait for a day to see if there are any
other comments, and make this change as part of v3.

Thanks for reviewing!

- Sathvika
