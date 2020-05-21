Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 789AD1DD47F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 May 2020 19:33:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49ScDM2xgSzDqDd
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 May 2020 03:33:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49SbTb5Br7zDqGG
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 May 2020 03:00:18 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04LGXXKn069939; Thu, 21 May 2020 12:59:48 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 313x65g0y0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 May 2020 12:59:48 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 04LGt9j3004809;
 Thu, 21 May 2020 16:59:46 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04fra.de.ibm.com with ESMTP id 313wne2gmw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 May 2020 16:59:46 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 04LGxhs910289500
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 May 2020 16:59:43 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 37241A4059;
 Thu, 21 May 2020 16:59:43 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 43E2BA404D;
 Thu, 21 May 2020 16:59:40 +0000 (GMT)
Received: from vajain21-in-ibm-com (unknown [9.79.187.27])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu, 21 May 2020 16:59:39 +0000 (GMT)
Received: by vajain21-in-ibm-com (sSMTP sendmail emulation);
 Thu, 21 May 2020 22:29:38 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: Michael Ellerman <michaele@au1.ibm.com>, Ira Weiny <ira.weiny@intel.com>
Subject: Re: [RESEND PATCH v7 3/5] powerpc/papr_scm: Fetch nvdimm health
 information from PHYP
In-Reply-To: <87k115gy0i.fsf@mpe.ellerman.id.au>
References: <20200519190058.257981-1-vaibhav@linux.ibm.com>
 <20200519190058.257981-4-vaibhav@linux.ibm.com>
 <20200520145430.GB3660833@iweiny-DESK2.sc.intel.com>
 <87tv0awmr5.fsf@linux.ibm.com> <87k115gy0i.fsf@mpe.ellerman.id.au>
Date: Thu, 21 May 2020 22:29:38 +0530
Message-ID: <87imgpw7et.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-21_10:2020-05-21,
 2020-05-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 spamscore=0 impostorscore=0 phishscore=0 mlxscore=0 mlxlogscore=999
 suspectscore=0 cotscore=-2147483648 malwarescore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 bulkscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2005210118
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
Cc: "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>, linux-nvdimm@lists.01.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman <michaele@au1.ibm.com> writes:

> Vaibhav Jain <vaibhav@linux.ibm.com> writes:
>> Thanks for reviewing this this patch Ira. My responses below:
>> Ira Weiny <ira.weiny@intel.com> writes:
>>> On Wed, May 20, 2020 at 12:30:56AM +0530, Vaibhav Jain wrote:
>>>> Implement support for fetching nvdimm health information via
>>>> H_SCM_HEALTH hcall as documented in Ref[1]. The hcall returns a pair
>>>> of 64-bit big-endian integers, bitwise-and of which is then stored in
>>>> 'struct papr_scm_priv' and subsequently partially exposed to
>>>> user-space via newly introduced dimm specific attribute
>>>> 'papr/flags'. Since the hcall is costly, the health information is
>>>> cached and only re-queried, 60s after the previous successful hcall.
> ...
>>>> diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
>>>> index f35592423380..142636e1a59f 100644
>>>> --- a/arch/powerpc/platforms/pseries/papr_scm.c
>>>> +++ b/arch/powerpc/platforms/pseries/papr_scm.c
>>>> @@ -39,6 +78,15 @@ struct papr_scm_priv {
>>>>  	struct resource res;
>>>>  	struct nd_region *region;
>>>>  	struct nd_interleave_set nd_set;
>>>> +
>>>> +	/* Protect dimm health data from concurrent read/writes */
>>>> +	struct mutex health_mutex;
>>>> +
>>>> +	/* Last time the health information of the dimm was updated */
>>>> +	unsigned long lasthealth_jiffies;
>>>> +
>>>> +	/* Health information for the dimm */
>>>> +	u64 health_bitmap;
>>>
>>> I wonder if this should be typed big endian as you mention that it is in the
>>> commit message?
>> This was discussed in an earlier review of the patch series at
>> https://lore.kernel.org/linux-nvdimm/878sjetcis.fsf@mpe.ellerman.id.au
>>
>> Even though health bitmap is returned in big endian format (For ex
>> value 0xC00000000000000 indicates bits 0,1 set), its value is never
>> used. Instead only test for specific bits being set in the register is
>> done.
>
> This has already caused a lot of confusion, so let me try and clear it
> up. I will probably fail :)
>
> The value is not big endian.
>
> It's returned in a GPR (a register), from the hypervisor. The ordering
> of bytes in a register is not dependent on what endian we're executing
> in.
>
> It's true that the hypervisor will have been running big endian, and
> when it returns to us we will now be running little endian. But the
> value is unchanged, it was 0xC00000000000000 in the GPR while the HV was
> running and it's still 0xC00000000000000 when we return to Linux. You
> can see this in mambo, see below for an example.
>
>
> _However_, the specification of the bits in the bitmap value uses MSB 0
> ordering, as is traditional for IBM documentation. That means the most
> significant bit, aka. the left most bit, is called "bit 0".
>
> See: https://en.wikipedia.org/wiki/Bit_numbering#MSB_0_bit_numbering
>
> That is the opposite numbering from what most people use, and in
> particular what most code in Linux uses, which is that bit 0 is the
> least significant bit.
>
> Which is where the confusion comes in. It's not that the bytes are
> returned in a different order, it's that the bits are numbered
> differently in the IBM documentation.
>
> The way to fix this kind of thing is to read the docs, and convert all
> the bits into correct numbering (LSB=0), and then throw away the docs ;)
>
> cheers
Thanks a lot for clarifying this Mpe and for this detailed explaination.

I have removed the term Big-Endian from v8 patch description to avoid
any further confusion.

>
>
>
> In mambo we can set a breakpoint just before the kernel enters skiboot,
> towards the end of __opal_call. The kernel is running LE and skiboot
> runs BE.
>
>   systemsim-p9 [~/skiboot/skiboot/external/mambo] b 0xc0000000000c1744
>   breakpoint set at [0:0:0]: 0xc0000000000c1744 (0x00000000000C1744) Enc:0x2402004C : hrfid
>
> Then run:
>
>   systemsim-p9 [~/skiboot/skiboot/external/mambo] c
>   [0:0:0]: 0xC0000000000C1744 (0x00000000000C1744) Enc:0x2402004C : hrfid
>   INFO: 121671618: (121671618): ** Execution stopped: user (tcl),  **
>   121671618: ** finished running 121671618 instructions **
>
> And we stop there, on an hrfid that we haven't executed yet.
> We can print r0, to see the OPAL token:
>
>   systemsim-p9 [~/skiboot/skiboot/external/mambo] p r0
>   0x0000000000000019
>
> ie. we're calling OPAL_CONSOLE_WRITE_BUFFER_SPACE (25).
>
> And we can print the MSR:
>
>   systemsim-p9 [~/skiboot/skiboot/external/mambo] p msr
>   0x9000000002001033
>   
>                      64-bit mode (SF): 0x1 [64-bit mode]
>                 Hypervisor State (HV): 0x1
>                Vector Available (VEC): 0x1
>   Machine Check Interrupt Enable (ME): 0x1
>             Instruction Relocate (IR): 0x1
>                    Data Relocate (DR): 0x1
>            Recoverable Interrupt (RI): 0x1
>               Little-Endian Mode (LE): 0x1 [little-endian]
>
> ie. we're little endian.
>
> We then step one instruction:
>
>   systemsim-p9 [~/skiboot/skiboot/external/mambo] s
>   [0:0:0]: 0x0000000030002BF0 (0x0000000030002BF0) Enc:0x7D9FFAA6 : mfspr   r12,PIR
>
> Now we're in skiboot. Print the MSR again:
>
>   systemsim-p9 [~/skiboot/skiboot/external/mambo] p msr
>   0x9000000002001002
>   
>                      64-bit mode (SF): 0x1 [64-bit mode]
>                 Hypervisor State (HV): 0x1
>                Vector Available (VEC): 0x1
>   Machine Check Interrupt Enable (ME): 0x1
>            Recoverable Interrupt (RI): 0x1
>
> We're big endian.
> Print r0:
>
>   systemsim-p9 [~/skiboot/skiboot/external/mambo] p r0
>   0x0000000000000019
>
> r0 is unchanged!
Got it. Thanks again.

-- 
Cheers
~ Vaibhav
