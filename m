Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3772223A368
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Aug 2020 13:37:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BKwpj5FLXzDqVC
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Aug 2020 21:37:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=sandipan@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BKwmz6Kh8zDqTX
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Aug 2020 21:35:47 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 073BWxJ7047177; Mon, 3 Aug 2020 07:35:42 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32pcc390qe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Aug 2020 07:35:42 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 073BZaCb031129;
 Mon, 3 Aug 2020 11:35:40 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04ams.nl.ibm.com with ESMTP id 32n01824h4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Aug 2020 11:35:40 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 073BZcMq33227090
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 3 Aug 2020 11:35:38 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DDEBDA4053;
 Mon,  3 Aug 2020 11:35:37 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D3364A4051;
 Mon,  3 Aug 2020 11:35:36 +0000 (GMT)
Received: from [9.199.32.186] (unknown [9.199.32.186])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  3 Aug 2020 11:35:36 +0000 (GMT)
Subject: Re: [PATCH v2] selftests/powerpc: Fix pkey syscall redefinitions
To: Michael Ellerman <mpe@ellerman.id.au>
References: <566dde119ce71f00f9642807ba30ceb7f54c9bfa.1596441105.git.sandipan@linux.ibm.com>
 <8736540z3w.fsf@mpe.ellerman.id.au>
From: Sandipan Das <sandipan@linux.ibm.com>
Message-ID: <8b0e0ff9-5dad-7abb-de15-6193afe4f66b@linux.ibm.com>
Date: Mon, 3 Aug 2020 17:05:35 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <8736540z3w.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-03_09:2020-08-03,
 2020-08-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999
 priorityscore=1501 malwarescore=0 mlxscore=0 phishscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008030086
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
Cc: sachinp@linux.vnet.ibm.com, aneesh.kumar@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 03/08/20 4:34 pm, Michael Ellerman wrote:
> Sandipan Das <sandipan@linux.ibm.com> writes:
>> On some distros, there are conflicts w.r.t to redefinition
>> of pkey syscall numbers which cause build failures. This
>> fixes them.
>>
>> Reported-by: Sachin Sant <sachinp@linux.vnet.ibm.com>
>> Signed-off-by: Sandipan Das <sandipan@linux.ibm.com>
>> ---
>> Previous versions can be found at:
>> v1: https://lore.kernel.org/linuxppc-dev/20200803074043.466809-1-sandipan@linux.ibm.com/
>>
>> Changes in v2:
>> - Fix incorrect commit message.
>>
>> ---
>>  tools/testing/selftests/powerpc/include/pkeys.h | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/tools/testing/selftests/powerpc/include/pkeys.h b/tools/testing/selftests/powerpc/include/pkeys.h
>> index 6ba95039a034..26eef5c1f8ea 100644
>> --- a/tools/testing/selftests/powerpc/include/pkeys.h
>> +++ b/tools/testing/selftests/powerpc/include/pkeys.h
>> @@ -31,8 +31,13 @@
>>  
>>  #define SI_PKEY_OFFSET	0x20
>>  
>> +#undef SYS_pkey_mprotect
>>  #define SYS_pkey_mprotect	386
> 
> We shouldn't undef them.
> 
> They should obviously never change, but if the system headers already
> have a definition then we should use that, so I think it should be:
> 
> #ifndef SYS_pkey_mprotect
> #define SYS_pkey_mprotect	386
> #endif
> 

Agreed. This had me confused.

$ grep -nr "#define __NR_pkey_" /usr/include/
/usr/include/asm-generic/unistd.h:767:#define __NR_pkey_mprotect 288
/usr/include/asm-generic/unistd.h:769:#define __NR_pkey_alloc 289
/usr/include/asm-generic/unistd.h:771:#define __NR_pkey_free 290
/usr/include/powerpc64le-linux-gnu/asm/unistd_32.h:374:#define __NR_pkey_alloc  384
/usr/include/powerpc64le-linux-gnu/asm/unistd_32.h:375:#define __NR_pkey_free   385
/usr/include/powerpc64le-linux-gnu/asm/unistd_32.h:376:#define __NR_pkey_mprotect       386
/usr/include/powerpc64le-linux-gnu/asm/unistd_64.h:365:#define __NR_pkey_alloc  384
/usr/include/powerpc64le-linux-gnu/asm/unistd_64.h:366:#define __NR_pkey_free   385
/usr/include/powerpc64le-linux-gnu/asm/unistd_64.h:367:#define __NR_pkey_mprotect       386
...

But it looks like including unistd.h from a C program picks the
right values.


- Sandipan
