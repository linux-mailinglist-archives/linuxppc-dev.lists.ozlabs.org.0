Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 860B33ECEC7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Aug 2021 08:47:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gp4Tt30gBz3bTC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Aug 2021 16:47:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cBIjwvSt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=cBIjwvSt; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gp4T83mBGz2yMT
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Aug 2021 16:46:52 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17G6YwkI115151; Mon, 16 Aug 2021 02:46:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=RhmEOqzEHTYNiWd4czGBDGTN6Bk33DM4gokBMK6Z3eM=;
 b=cBIjwvSt6Ic2PZrmGDe7WoBxnxwH6NGTvDyKAbvzo0mvodD2Pp8xQzMcmRGwq2Olab8H
 Gpsxn43HrGVbTNqO9dAoEKazcRgnVNeXhlFDI0U2Y6Fscr0dpeMIHwiAzdw/wz3XIoRW
 bQiviZqYc7SYbJdGz//Iooarsu9i7b1j+KEY2ox3FX7uYAN/rfPZwnSE+dd9HrwYXG6N
 HBn7PiXIr+ff3ZAKoFy1LZfYy1PTf2FgcPTt65jhqlYE2O8P0/axEr7rNUfQ19Z3V0DP
 0QDiZqYy/2rilhFKg44QYmg+jOWnr54yEwEZAEie+qFT2lr3F1fOZ+BHbOOKeWeMid5Y Tg== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3aeuf4vy6r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Aug 2021 02:46:38 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17G6g4kt014024;
 Mon, 16 Aug 2021 06:46:37 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma03dal.us.ibm.com with ESMTP id 3ae5fbdu0c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Aug 2021 06:46:37 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17G6kajC21168502
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 16 Aug 2021 06:46:36 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 47FC1AE064;
 Mon, 16 Aug 2021 06:46:36 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F3C86AE06A;
 Mon, 16 Aug 2021 06:46:33 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.199.38.67])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 16 Aug 2021 06:46:33 +0000 (GMT)
Subject: Re: [PATCH v2 2/2] powerpc/perf: Return regs->nip as instruction
 pointer value when SIAR is 0
To: Christophe Leroy <christophe.leroy@csgroup.eu>, mpe@ellerman.id.au,
 linuxppc-dev@lists.ozlabs.org
References: <20210813082450.429320-1-kjain@linux.ibm.com>
 <20210813082450.429320-2-kjain@linux.ibm.com>
 <c6110aa1-90e2-77aa-1ab5-355975037227@csgroup.eu>
From: kajoljain <kjain@linux.ibm.com>
Message-ID: <69739bed-e495-e728-4e5c-7273925c303d@linux.ibm.com>
Date: Mon, 16 Aug 2021 12:16:32 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
In-Reply-To: <c6110aa1-90e2-77aa-1ab5-355975037227@csgroup.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Zu9VMy2xAD44MLIdXM2VXL5OH818oQn9
X-Proofpoint-ORIG-GUID: Zu9VMy2xAD44MLIdXM2VXL5OH818oQn9
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-16_02:2021-08-13,
 2021-08-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015
 mlxscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 adultscore=0 phishscore=0 suspectscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108160043
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



On 8/13/21 3:04 PM, Christophe Leroy wrote:
> 
> 
> Le 13/08/2021 à 10:24, Kajol Jain a écrit :
>> Incase of random sampling, there can be scenarios where SIAR is not
>> latching sample address and results in 0 value. Since current code
>> directly returning the siar value, we could see multiple instruction
>> pointer values as 0 in perf report.
>> Patch resolves this issue by adding a ternary condition to return
>> regs->nip incase SIAR is 0.
> 
> Your description seems rather similar to https://github.com/linuxppc/linux/commit/2ca13a4cc56c920a6c9fc8ee45d02bccacd7f46c
> 
> Does it mean that the problem occurs on more than the power10 DD1 ?
> 
> In that case, can the solution be common instead of doing something for power10 DD1 and something for others ?

Hi Christophe,
    Yes its better to have common check. I will make these updates.

Thanks,
Kajol Jain

> 
>>
>> Fixes: 75382aa72f06 ("powerpc/perf: Move code to select SIAR or pt_regs
>> into perf_read_regs")
>> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
>> ---
>>   arch/powerpc/perf/core-book3s.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
>> index 1b464aad29c4..aeecaaf6810f 100644
>> --- a/arch/powerpc/perf/core-book3s.c
>> +++ b/arch/powerpc/perf/core-book3s.c
>> @@ -2260,7 +2260,7 @@ unsigned long perf_instruction_pointer(struct pt_regs *regs)
>>           else
>>               return regs->nip;
>>       } else if (use_siar && siar_valid(regs))
>> -        return siar + perf_ip_adjust(regs);
>> +        return siar ? siar + perf_ip_adjust(regs) : regs->nip;
>>       else if (use_siar)
>>           return 0;        // no valid instruction pointer
>>       else
>>
