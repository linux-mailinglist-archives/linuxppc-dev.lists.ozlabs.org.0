Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AD40B25174F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Aug 2020 13:19:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BbRNG5X1XzDqPQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Aug 2020 21:19:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=ravi.bangoria@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=l5h7dRmR; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BbR865Z9KzDqPM
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Aug 2020 21:09:10 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07PB23HA154035; Tue, 25 Aug 2020 07:08:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=JZsuufV+bZwYyntjqQ1i/UCJBUmP0dE/6fBRbVb9uIA=;
 b=l5h7dRmREhyU0OgDqQZz9dt6CO6u1c3mPzlcB0+0k8YUv7tS/wsvQVynfYMjcYtTcNhV
 ByzGQ9v5HcbEntI6l2KCWuKMVdy0hiV9kyo91xUHtOG9jk66FXvyfGXrlxhehMW1rdHt
 NPdiAXHM7TS1pyyqux2EnkNLmdM2bfSWj4fR5cCyuXJ1Isf/+qCLgCn8aGAss02zbnkC
 K3JlLhSFqvh1NDbarZSvA3P+4jZUpcH7xZd3YTRPi451QFSyTm0MH0w7BFvmdmowbnWn
 SeWPhM/dymxaZdhN7izqQXsUuhHnQ43/pn6W0nHpaISN0UEpUpVjE1pUO87P0I7TRgXI mQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 334yt62p35-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Aug 2020 07:08:58 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07PB2IgG154798;
 Tue, 25 Aug 2020 07:08:57 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 334yt62nq0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Aug 2020 07:08:57 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07PB7S86005053;
 Tue, 25 Aug 2020 11:08:24 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04fra.de.ibm.com with ESMTP id 332ujjt2c2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Aug 2020 11:08:24 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 07PB6oul55247178
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 Aug 2020 11:06:50 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D774042041;
 Tue, 25 Aug 2020 11:08:20 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 87B1842045;
 Tue, 25 Aug 2020 11:08:18 +0000 (GMT)
Received: from [9.199.33.167] (unknown [9.199.33.167])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 25 Aug 2020 11:08:18 +0000 (GMT)
Subject: Re: [PATCH v5 4/8] powerpc/watchpoint: Move DAWR detection logic
 outside of hw_breakpoint.c
To: Christophe Leroy <christophe.leroy@csgroup.eu>, christophe.leroy@c-s.fr
References: <20200825043617.1073634-1-ravi.bangoria@linux.ibm.com>
 <20200825043617.1073634-5-ravi.bangoria@linux.ibm.com>
 <0a73280b-c231-a7bb-18d9-abf2a37ba24b@csgroup.eu>
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Message-ID: <59ac33ed-4ed3-2c92-7b0b-1d14abf7186b@linux.ibm.com>
Date: Tue, 25 Aug 2020 16:38:17 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <0a73280b-c231-a7bb-18d9-abf2a37ba24b@csgroup.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-25_02:2020-08-25,
 2020-08-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 mlxlogscore=999 mlxscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0
 adultscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008250079
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
 pedromfc@linux.ibm.com, linux-kernel@vger.kernel.org, paulus@samba.org,
 jniethe5@gmail.com, rogealve@linux.ibm.com, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christophe,

>> +static int cache_op_size(void)
>> +{
>> +#ifdef __powerpc64__
>> +    return ppc64_caches.l1d.block_size;
>> +#else
>> +    return L1_CACHE_BYTES;
>> +#endif
>> +}
> 
> You've got l1_dcache_bytes() in arch/powerpc/include/asm/cache.h to do that.
> 
>> +
>> +void wp_get_instr_detail(struct pt_regs *regs, struct ppc_inst *instr,
>> +             int *type, int *size, unsigned long *ea)
>> +{
>> +    struct instruction_op op;
>> +
>> +    if (__get_user_instr_inatomic(*instr, (void __user *)regs->nip))
>> +        return;
>> +
>> +    analyse_instr(&op, regs, *instr);
>> +    *type = GETTYPE(op.type);
>> +    *ea = op.ea;
>> +#ifdef __powerpc64__
>> +    if (!(regs->msr & MSR_64BIT))
>> +        *ea &= 0xffffffffUL;
>> +#endif
> 
> This #ifdef is unneeded, it should build fine on a 32 bits too.

This patch is just a code movement from one file to another.
I don't really change the logic. Would you mind if I do a
separate patch for these changes (not a part of this series)?

Thanks for review,
Ravi
