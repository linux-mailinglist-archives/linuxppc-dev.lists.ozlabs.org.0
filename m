Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 964BE1B6BED
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Apr 2020 05:28:18 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 497fl34WrZzDr8s
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Apr 2020 13:28:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ravi.bangoria@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 497ffw3JGGzDr7j
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Apr 2020 13:24:39 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03O31xQG041126; Thu, 23 Apr 2020 23:24:24 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30jrc6g40m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Apr 2020 23:24:24 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 03O33UZR044734;
 Thu, 23 Apr 2020 23:24:24 -0400
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30jrc6g3yv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Apr 2020 23:24:23 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 03O3A8cj023768;
 Fri, 24 Apr 2020 03:24:21 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma01fra.de.ibm.com with ESMTP id 30fs658fte-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Apr 2020 03:24:21 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 03O3OI2s66781476
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 24 Apr 2020 03:24:18 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8C80A52052;
 Fri, 24 Apr 2020 03:24:18 +0000 (GMT)
Received: from [9.199.51.89] (unknown [9.199.51.89])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 3931F5204E;
 Fri, 24 Apr 2020 03:24:15 +0000 (GMT)
Subject: Re: [PATCH v3 12/16] powerpc/watchpoint: Use builtin ALIGN*() macros
To: Christophe Leroy <christophe.leroy@c-s.fr>
References: <20200414031659.58875-1-ravi.bangoria@linux.ibm.com>
 <20200414031659.58875-13-ravi.bangoria@linux.ibm.com>
 <a2d7abe8-44e0-9780-6603-00f16300c2ca@c-s.fr>
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Message-ID: <2892a62b-eec3-802d-df52-960f3f1e246d@linux.ibm.com>
Date: Fri, 24 Apr 2020 08:54:14 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <a2d7abe8-44e0-9780-6603-00f16300c2ca@c-s.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-23_19:2020-04-23,
 2020-04-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 mlxlogscore=999 lowpriorityscore=0 spamscore=0 impostorscore=0
 clxscore=1015 adultscore=0 phishscore=0 mlxscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004240015
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
Cc: apopple@linux.ibm.com, mikey@neuling.org,
 Ravi Bangoria <ravi.bangoria@linux.ibm.com>, peterz@infradead.org,
 oleg@redhat.com, npiggin@gmail.com, linux-kernel@vger.kernel.org,
 paulus@samba.org, jolsa@kernel.org, fweisbec@gmail.com,
 naveen.n.rao@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 mingo@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christophe,

>>           max_len = DAWR_MAX_LEN;
>>           /* DAWR region can't cross 512 bytes boundary */
>> -        if ((start_addr >> 9) != (end_addr >> 9))
>> +        if ((start_addr >> 9) != ((end_addr - 1) >> 9))
> 
> What about:
>      if (ALIGN(start_addr, SZ_512M) != ALIGN(end - 1, SZ_512M))

ok.

> 
>>               return -EINVAL;
>>       } else if (IS_ENABLED(CONFIG_PPC_8xx)) {
>>           /* 8xx can setup a range without limitation */
>> diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
>> index aab82ab80dfa..06679adac447 100644
>> --- a/arch/powerpc/kernel/process.c
>> +++ b/arch/powerpc/kernel/process.c
>> @@ -800,12 +800,12 @@ static inline int set_breakpoint_8xx(struct arch_hw_breakpoint *brk)
>>       unsigned long lctrl1 = LCTRL1_CTE_GT | LCTRL1_CTF_LT | LCTRL1_CRWE_RW |
>>                      LCTRL1_CRWF_RW;
>>       unsigned long lctrl2 = LCTRL2_LW0EN | LCTRL2_LW0LADC | LCTRL2_SLW0EN;
>> -    unsigned long start_addr = brk->address & ~HW_BREAKPOINT_ALIGN;
>> -    unsigned long end_addr = (brk->address + brk->len - 1) | HW_BREAKPOINT_ALIGN;
>> +    unsigned long start_addr = ALIGN_DOWN(brk->address, HW_BREAKPOINT_SIZE);
>> +    unsigned long end_addr = ALIGN(brk->address + brk->len, HW_BREAKPOINT_SIZE);
>>       if (start_addr == 0)
>>           lctrl2 |= LCTRL2_LW0LA_F;
>> -    else if (end_addr == ~0U)
>> +    else if (end_addr - 1 == ~0U)
> 
> What about:
>      else if (end_addr == 0)

That's better.

Thanks,
Ravi
