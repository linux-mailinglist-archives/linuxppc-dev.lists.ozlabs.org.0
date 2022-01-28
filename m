Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF0E49F854
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jan 2022 12:31:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JlZzD5kdHz3cCQ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jan 2022 22:31:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kP64T6oy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=kP64T6oy; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JlZyR0F9Sz301M
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jan 2022 22:30:38 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20S9CuDm032740; 
 Fri, 28 Jan 2022 11:30:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=mime-version :
 content-type : content-transfer-encoding : date : from : to : cc : subject
 : in-reply-to : references : message-id; s=pp1;
 bh=O4IVPk5PRXF339S6gpZVKKJ+UVjlIgEBdlZQuGAoImQ=;
 b=kP64T6oyaNVRNvN0iOb0r/uV5GlZdpm4V4YjmOsatNGWDfXsQU5ZS2i6YWpQexIquJyl
 4wRlZZaAgXW88USlMNK+xqnHvF5mk2WjBZxffARobL+f9rZJjrvTDky8lyn/w2ybVP0e
 KnzBVAVXfW6PM6byQ+pnK/WVqfxyCN3CpKtKb3NOPSvHnt2vwLBLb8PLpo//Y2JCDUCM
 JJ/sutvkw3ay+IxW2bE222EZJVb9qxb9SBryzSQXpiuVOnXjQoPqeDv5mt6SYtXyAxbF
 gDdlXVMTVAep67OBwkN/W/qFSoxUzAqKQ+T3H3MCQZy0/1RbhHFB58aMAdw9CJboaLkd +Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dvdnntjnv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Jan 2022 11:30:31 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20SBMPjq025763;
 Fri, 28 Jan 2022 11:30:31 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dvdnntjnm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Jan 2022 11:30:31 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20SBCgrH015659;
 Fri, 28 Jan 2022 11:30:30 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma04wdc.us.ibm.com with ESMTP id 3dr9jcffbc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Jan 2022 11:30:30 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20SBUUqX32375150
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 Jan 2022 11:30:30 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 15E7E78096;
 Fri, 28 Jan 2022 11:30:30 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F3CF278124;
 Fri, 28 Jan 2022 11:30:25 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.10.229.42])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 28 Jan 2022 11:30:25 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Fri, 28 Jan 2022 17:00:25 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 2/2] powerpc/uprobes: Reject uprobe on a system call
 instruction
In-Reply-To: <1643269209.jj1krtc1vx.astroid@bobo.none>
References: <20220124055741.3686496-1-npiggin@gmail.com>
 <20220124055741.3686496-3-npiggin@gmail.com>
 <874k5sm42l.fsf@mpe.ellerman.id.au>
 <1643269209.jj1krtc1vx.astroid@bobo.none>
Message-ID: <1d756bcb9c747cc618bc8c205183eebd@imap.linux.ibm.com>
X-Sender: naveen.n.rao@linux.vnet.ibm.com
User-Agent: Roundcube Webmail/1.1.12
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Ovdz0scUTUOsURsX4F7HkrulLcCFwfwx
X-Proofpoint-ORIG-GUID: IKRnuvv5Tb8badW9C6QkqHyGuruCjzns
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-28_02,2022-01-27_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 mlxlogscore=824 bulkscore=0 adultscore=0
 spamscore=0 impostorscore=0 mlxscore=0 priorityscore=1501 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2201280069
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2022-01-27 13:14, Nicholas Piggin wrote:
> Excerpts from Michael Ellerman's message of January 25, 2022 9:45 pm:
>> Nicholas Piggin <npiggin@gmail.com> writes:
>>> Per the ISA, a Trace interrupt is not generated for a system call
>>> [vectored] instruction. Reject uprobes on such instructions as we are
>>> not emulating a system call [vectored] instruction anymore.
>> 
>> This should really be patch 1, otherwise there's a single commit 
>> window
>> where we allow uprobes on sc but don't honour them.
> 
> Yep true. I also messed up Naveen's attribution! Will re-send (or maybe
> Naveen would take over the series).

Yes, let me come up with a better, more complete patch for this.

> 
>> 
>>> Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
>>> [np: Switch to pr_info_ratelimited]
>>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>>> ---
>>>  arch/powerpc/include/asm/ppc-opcode.h | 1 +
>>>  arch/powerpc/kernel/uprobes.c         | 6 ++++++
>>>  2 files changed, 7 insertions(+)
>>> 
>>> diff --git a/arch/powerpc/include/asm/ppc-opcode.h 
>>> b/arch/powerpc/include/asm/ppc-opcode.h
>>> index 9675303b724e..8bbe16ce5173 100644
>>> --- a/arch/powerpc/include/asm/ppc-opcode.h
>>> +++ b/arch/powerpc/include/asm/ppc-opcode.h
>>> @@ -411,6 +411,7 @@
>>>  #define PPC_RAW_DCBFPS(a, b)		(0x7c0000ac | ___PPC_RA(a) | 
>>> ___PPC_RB(b) | (4 << 21))
>>>  #define PPC_RAW_DCBSTPS(a, b)		(0x7c0000ac | ___PPC_RA(a) | 
>>> ___PPC_RB(b) | (6 << 21))
>>>  #define PPC_RAW_SC()			(0x44000002)
>>> +#define PPC_RAW_SCV()			(0x44000001)
>>>  #define PPC_RAW_SYNC()			(0x7c0004ac)
>>>  #define PPC_RAW_ISYNC()			(0x4c00012c)
>>> 
>>> diff --git a/arch/powerpc/kernel/uprobes.c 
>>> b/arch/powerpc/kernel/uprobes.c
>>> index c6975467d9ff..3779fde804bd 100644
>>> --- a/arch/powerpc/kernel/uprobes.c
>>> +++ b/arch/powerpc/kernel/uprobes.c
>>> @@ -41,6 +41,12 @@ int arch_uprobe_analyze_insn(struct arch_uprobe 
>>> *auprobe,
>>>  	if (addr & 0x03)
>>>  		return -EINVAL;
>>> 
>>> +	if (ppc_inst_val(ppc_inst_read(auprobe->insn)) == PPC_RAW_SC() ||
>>> +	    ppc_inst_val(ppc_inst_read(auprobe->insn)) == PPC_RAW_SCV()) {
>> 
>> We should probably reject hypercall too?
>> 
>> There's also a lot of reserved fields in `sc`, so doing an exact match
>> like this risks missing instructions that are badly formed but the CPU
>> will happily execute as `sc`.
> 
> Yeah, scv as well has lev != 0 unsupported so should be excluded.
>> 
>> We'd obviously never expect to see those in compiler generated code, 
>> but
>> it'd still be safer to mask. We could probably just reject opcode 17
>> entirely.

Indeed, thanks.

>> 
>> And I guess for a subsequent patch, but we should be rejecting some
>> others here as well shouldn't we? Like rfid etc.
> 
> Traps under discussion I guess. For uprobe, rfid will be just another
> privilege fault. Is that dealt with somehow or do all privileged and
> illegal instructions also need to be excluded from stepping? (I assume
> we must handle that in a general way somehow)

Yes, this is all handled in our interrupt code if we emulate any of 
those
privileged instructions. Otherwise, if a signal is generated, that would
be caught by uprobe_deny_signal().


Thanks,
Naveen
