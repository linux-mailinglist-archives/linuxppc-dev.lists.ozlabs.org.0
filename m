Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4DD19A8A5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 11:30:31 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48sgsc6mqpzDqx6
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 20:30:28 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48sg7l4vpQzDr30
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Apr 2020 19:57:39 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0318Y6fx126766
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 1 Apr 2020 04:57:37 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3020wekn6f-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Apr 2020 04:57:36 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ravi.bangoria@linux.ibm.com>;
 Wed, 1 Apr 2020 09:57:21 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 1 Apr 2020 09:57:16 +0100
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0318vSDq13565964
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 1 Apr 2020 08:57:28 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 832A542052;
 Wed,  1 Apr 2020 08:57:28 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 249FA42049;
 Wed,  1 Apr 2020 08:57:25 +0000 (GMT)
Received: from [9.199.48.114] (unknown [9.199.48.114])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  1 Apr 2020 08:57:24 +0000 (GMT)
Subject: Re: [PATCH v2 06/16] powerpc/watchpoint: Provide DAWR number to
 __set_breakpoint
To: Christophe Leroy <christophe.leroy@c-s.fr>
References: <20200401061309.92442-1-ravi.bangoria@linux.ibm.com>
 <20200401061309.92442-7-ravi.bangoria@linux.ibm.com>
 <89f43001-0fa4-1394-4158-878fca4962e3@c-s.fr>
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Date: Wed, 1 Apr 2020 14:27:24 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <89f43001-0fa4-1394-4158-878fca4962e3@c-s.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20040108-4275-0000-0000-000003B77DD0
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20040108-4276-0000-0000-000038CCD00F
Message-Id: <cb9ccaa1-9ea2-c3d7-4724-f75ebff4b66d@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-03-31_07:2020-03-31,
 2020-03-31 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 mlxlogscore=715
 adultscore=0 suspectscore=0 bulkscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004010073
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



On 4/1/20 12:33 PM, Christophe Leroy wrote:
> 
> 
> Le 01/04/2020 à 08:12, Ravi Bangoria a écrit :
>> Introduce new parameter 'nr' to __set_breakpoint() which indicates
>> which DAWR should be programed. Also convert current_brk variable
>> to an array.
>>
>> Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
>> ---
>>   arch/powerpc/include/asm/debug.h         |  2 +-
>>   arch/powerpc/include/asm/hw_breakpoint.h |  2 +-
>>   arch/powerpc/kernel/hw_breakpoint.c      |  8 ++++----
>>   arch/powerpc/kernel/process.c            | 14 +++++++-------
>>   arch/powerpc/kernel/signal.c             |  2 +-
>>   arch/powerpc/xmon/xmon.c                 |  2 +-
>>   6 files changed, 15 insertions(+), 15 deletions(-)
>>
>> diff --git a/arch/powerpc/include/asm/debug.h b/arch/powerpc/include/asm/debug.h
>> index 7756026b95ca..6228935a8b64 100644
>> --- a/arch/powerpc/include/asm/debug.h
>> +++ b/arch/powerpc/include/asm/debug.h
>> @@ -45,7 +45,7 @@ static inline int debugger_break_match(struct pt_regs *regs) { return 0; }
>>   static inline int debugger_fault_handler(struct pt_regs *regs) { return 0; }
>>   #endif
>> -void __set_breakpoint(struct arch_hw_breakpoint *brk);
>> +void __set_breakpoint(struct arch_hw_breakpoint *brk, int nr);
> 
> Same, I think it would make more sense to have nr as first argument.

Sorry, didn't get your point. How will that help?

Ravi

