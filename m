Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5A7365187
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Apr 2021 06:31:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FPW3M1FrBz30BM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Apr 2021 14:31:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mYTB8af5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=mYTB8af5; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FPW2v2Lnqz2xfs
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Apr 2021 14:31:02 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13K43boO042247; Tue, 20 Apr 2021 00:30:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=sih98mTZAIYnyeSLTC2gyp6bq6iMluxVfiiv3Vdb94w=;
 b=mYTB8af5BMvZ52K3kx6jTcbnYH15luJ89VETeNp7yXfKSZNbHmiRqsiW/fwR8xlfZkyj
 A9A3y5v91u/g2Rp3FMB5duKTpzcSJosAthwLytlQNM+n6jrOHWqJjNOXDeZ9f/QVe/YQ
 agR2sj7b7q6E8L3iUzwcj9V5+vhBuTuQ9AwsSOb74jzfZjKCLJStblWu0yzMwCmmWPxk
 Kz+nY32hGjQ4o77Eou8o9sr5Hc4AC9kea+hwjeqeguspLB+fcXxhu6fDRYmT6ti1Esoj
 9Z1DoFHl5XILtkQizEGKJyFkJGHO1njWuwFwxYkQ6nY4v90Uh3SjBusm3cEBANygyD63 9Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 381nj7axj4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Apr 2021 00:30:54 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13K4UlZB129872;
 Tue, 20 Apr 2021 00:30:54 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 381nj7axhr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Apr 2021 00:30:53 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13K4MoCf018133;
 Tue, 20 Apr 2021 04:30:52 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04ams.nl.ibm.com with ESMTP id 37yqa8hemw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Apr 2021 04:30:52 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13K4Unur23724304
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 20 Apr 2021 04:30:50 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E1417A405B;
 Tue, 20 Apr 2021 04:30:49 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3FF08A4065;
 Tue, 20 Apr 2021 04:30:48 +0000 (GMT)
Received: from [9.199.43.214] (unknown [9.199.43.214])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 20 Apr 2021 04:30:48 +0000 (GMT)
Subject: Re: [PATCH v4 8/9] mm/mremap: Allow arch runtime override
To: Michael Ellerman <mpe@ellerman.id.au>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <20210414085915.301189-1-aneesh.kumar@linux.ibm.com>
 <20210414085915.301189-9-aneesh.kumar@linux.ibm.com>
 <87bla9d34m.fsf@mpe.ellerman.id.au>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <aa3d090c-0785-08b9-3c91-d8c5cf564937@linux.ibm.com>
Date: Tue, 20 Apr 2021 10:00:47 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87bla9d34m.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 8Jr_IZcIoTWcQEmigRXKyFDOWBbYf-un
X-Proofpoint-ORIG-GUID: fUzxqS6LAaGGU7TsJoEBrg72ikUKUKcX
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-20_01:2021-04-19,
 2021-04-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 phishscore=0 malwarescore=0 clxscore=1015 mlxscore=0 adultscore=0
 spamscore=0 priorityscore=1501 mlxlogscore=999 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104200028
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
Cc: joel@joelfernandes.org, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
 kaleshsingh@google.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 4/20/21 9:22 AM, Michael Ellerman wrote:
> "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:
>> Architectures like ppc64 support faster mremap only with radix
>> translation. Hence allow a runtime check w.r.t support for fast mremap.
>>
>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> ---
>>   arch/powerpc/include/asm/tlb.h |  6 ++++++
>>   mm/mremap.c                    | 15 ++++++++++++++-
>>   2 files changed, 20 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/powerpc/include/asm/tlb.h b/arch/powerpc/include/asm/tlb.h
>> index 160422a439aa..058918a7cd3c 100644
>> --- a/arch/powerpc/include/asm/tlb.h
>> +++ b/arch/powerpc/include/asm/tlb.h
>> @@ -83,5 +83,11 @@ static inline int mm_is_thread_local(struct mm_struct *mm)
>>   }
>>   #endif
>>   
>> +#define arch_supports_page_tables_move arch_supports_page_tables_move
>> +static inline bool arch_supports_page_tables_move(void)
>> +{
>> +	return radix_enabled();
>> +}
> 
> Not sure it's worth a respin on its own, but page table*s* move is
> slightly strange phrasing.
> 
> arch_supports_move_page_tables() or arch_supports_page_table_move()
> would be more typical.
> 

I will switch to arch_supports_page_table_move()

-aneesh

