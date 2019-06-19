Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9574B26B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jun 2019 08:53:27 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45TFyr4YrFzDqcn
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jun 2019 16:53:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=ravi.bangoria@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45TFx16w2gzDqhm
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 16:51:49 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5J6m6RQ092919
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 02:51:46 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2t7ephknx0-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 02:51:46 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ravi.bangoria@linux.ibm.com>;
 Wed, 19 Jun 2019 07:51:44 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 19 Jun 2019 07:51:41 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5J6peBR59375666
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Jun 2019 06:51:40 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 379F4A4053;
 Wed, 19 Jun 2019 06:51:40 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A95FEA4040;
 Wed, 19 Jun 2019 06:51:38 +0000 (GMT)
Received: from [9.124.31.60] (unknown [9.124.31.60])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 19 Jun 2019 06:51:38 +0000 (GMT)
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Subject: Re: [PATCH 5/5] Powerpc/Watchpoint: Fix length calculation for
 unaligned target
To: Christophe Leroy <christophe.leroy@c-s.fr>
References: <20190618042732.5582-1-ravi.bangoria@linux.ibm.com>
 <20190618042732.5582-6-ravi.bangoria@linux.ibm.com>
 <3390c3c2-8290-da55-a183-872c593c7b1e@c-s.fr>
Date: Wed, 19 Jun 2019 12:21:37 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <3390c3c2-8290-da55-a183-872c593c7b1e@c-s.fr>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19061906-0028-0000-0000-0000037B9370
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19061906-0029-0000-0000-0000243B9F9B
Message-Id: <1f3873b7-d924-61ad-2f0e-f6cc12c012ea@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-19_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906190056
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
Cc: Ravi Bangoria <ravi.bangoria@linux.ibm.com>, mikey@neuling.org,
 linux-kernel@vger.kernel.org, npiggin@gmail.com, paulus@samba.org,
 naveen.n.rao@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 6/18/19 12:16 PM, Christophe Leroy wrote:
>>   +/* Maximum len for DABR is 8 bytes and DAWR is 512 bytes */
>> +static int hw_breakpoint_validate_len(struct arch_hw_breakpoint *hw)
>> +{
>> +    u16 length_max = 8;
>> +    u16 final_len;
> 
> You should be more consistent in naming. If one is called final_len, the other one should be called max_len.

Copy/paste :). Will change it.

> 
>> +    unsigned long start_addr, end_addr;
>> +
>> +    final_len = hw_breakpoint_get_final_len(hw, &start_addr, &end_addr);
>> +
>> +    if (dawr_enabled()) {
>> +        length_max = 512;
>> +        /* DAWR region can't cross 512 bytes boundary */
>> +        if ((start_addr >> 9) != (end_addr >> 9))
>> +            return -EINVAL;
>> +    }
>> +
>> +    if (final_len > length_max)
>> +        return -EINVAL;
>> +
>> +    return 0;
>> +}
>> +
> 
> Is many places, we have those numeric 512 and 9 shift. Could we replace them by some symbol, for instance DAWR_SIZE and DAWR_SHIFT ?

I don't see any other place where we check for boundary limit.

[...]

> 
>> +u16 hw_breakpoint_get_final_len(struct arch_hw_breakpoint *brk,
>> +                unsigned long *start_addr,
>> +                unsigned long *end_addr)
>> +{
>> +    *start_addr = brk->address & ~HW_BREAKPOINT_ALIGN;
>> +    *end_addr = (brk->address + brk->len - 1) | HW_BREAKPOINT_ALIGN;
>> +    return *end_addr - *start_addr + 1;
>> +}
> 
> This function gives horrible code (a couple of unneeded store/re-read and read/re-read).
> 
> 000006bc <hw_breakpoint_get_final_len>:
>      6bc:    81 23 00 00     lwz     r9,0(r3)
>      6c0:    55 29 00 38     rlwinm  r9,r9,0,0,28
>      6c4:    91 24 00 00     stw     r9,0(r4)
>      6c8:    81 43 00 00     lwz     r10,0(r3)
>      6cc:    a1 23 00 06     lhz     r9,6(r3)
>      6d0:    38 6a ff ff     addi    r3,r10,-1
>      6d4:    7c 63 4a 14     add     r3,r3,r9
>      6d8:    60 63 00 07     ori     r3,r3,7
>      6dc:    90 65 00 00     stw     r3,0(r5)
>      6e0:    38 63 00 01     addi    r3,r3,1
>      6e4:    81 24 00 00     lwz     r9,0(r4)
>      6e8:    7c 69 18 50     subf    r3,r9,r3
>      6ec:    54 63 04 3e     clrlwi  r3,r3,16
>      6f0:    4e 80 00 20     blr
> 
> Below code gives something better:
> 
> u16 hw_breakpoint_get_final_len(struct arch_hw_breakpoint *brk,
>                 unsigned long *start_addr,
>                 unsigned long *end_addr)
> {
>     unsigned long address = brk->address;
>     unsigned long len = brk->len;
>     unsigned long start = address & ~HW_BREAKPOINT_ALIGN;
>     unsigned long end = (address + len - 1) | HW_BREAKPOINT_ALIGN;
> 
>     *start_addr = start;
>     *end_addr = end;
>     return end - start + 1;
> }
> 
> 000006bc <hw_breakpoint_get_final_len>:
>      6bc:    81 43 00 00     lwz     r10,0(r3)
>      6c0:    a1 03 00 06     lhz     r8,6(r3)
>      6c4:    39 2a ff ff     addi    r9,r10,-1
>      6c8:    7d 28 4a 14     add     r9,r8,r9
>      6cc:    55 4a 00 38     rlwinm  r10,r10,0,0,28
>      6d0:    61 29 00 07     ori     r9,r9,7
>      6d4:    91 44 00 00     stw     r10,0(r4)
>      6d8:    20 6a 00 01     subfic  r3,r10,1
>      6dc:    91 25 00 00     stw     r9,0(r5)
>      6e0:    7c 63 4a 14     add     r3,r3,r9
>      6e4:    54 63 04 3e     clrlwi  r3,r3,16
>      6e8:    4e 80 00 20     blr
> 
> 
> And regardless, that's a pitty to have this function using pointers which are from local variables in the callers, as we loose the benefit of registers. Couldn't this function go in the .h as a static inline ? I'm sure the result would be worth it.

This is obviously a bit of optimization, but I like Mikey's idea of
storing start_addr and end_addr in the arch_hw_breakpoint. That way
we don't have to recalculate length every time in set_dawr.

