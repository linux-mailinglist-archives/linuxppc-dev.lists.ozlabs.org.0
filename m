Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9441149F7FC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jan 2022 12:12:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JlZYB3l52z3bbL
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jan 2022 22:12:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Je10TZ7h;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Je10TZ7h; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JlZXR37xSz2ymg
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jan 2022 22:11:35 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20SA8YNo016652; 
 Fri, 28 Jan 2022 11:11:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type : date :
 from : to : cc : subject : in-reply-to : references : message-id :
 content-transfer-encoding : mime-version; s=pp1;
 bh=z8XqP7DuSJS5X4FSIZ8nEssUPwxrgkxBkg+iDEPwW3M=;
 b=Je10TZ7hzi7aSdFMUmhZHW7Squ2ayAF0RzfSgswm6TZx0QN7j7d8Sl23sGo72aJoOmQB
 wePdkG7B0xLR6aRlllKol9xr+NGMEVz5mpw0Wbq6HO8Dj0wyCf1S0q1XPihUNi6tSCr4
 MTLzv71kiODqO00KBaiRI5Ogn6om/VENLlYNLQA+Bm2VmKUnPk/mNbKAStpFO7th9PJD
 LEjMoMobt9peYFoSCp9q5zPt2Lvy1NjTmeUSPZrjwT/2Qj2zaHgC1HL4wCWsTqeCSEtI
 j6B8V9yLRxZmiuH1Cb0EnoD4kfrvExN/Cl7PaDRSErVlf9pIeJEz+RoI12GkWb0MxzSe Gw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dv5rb9je7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Jan 2022 11:11:29 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20SB2BHJ008185;
 Fri, 28 Jan 2022 11:11:28 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dv5rb9jdx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Jan 2022 11:11:28 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20SB8v9f017663;
 Fri, 28 Jan 2022 11:11:27 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma01dal.us.ibm.com with ESMTP id 3dr9jdbr6c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Jan 2022 11:11:27 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20SBBQrm8585644
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 Jan 2022 11:11:26 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 97270136051;
 Fri, 28 Jan 2022 11:11:26 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 46922136055;
 Fri, 28 Jan 2022 11:11:26 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.10.229.42])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 28 Jan 2022 11:11:26 +0000 (GMT)
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Date: Fri, 28 Jan 2022 16:41:25 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Nicholas Piggin
 <npiggin@gmail.com>
Subject: Re: [PATCH 0/2] powerpc: Disable syscall emulation and stepping
In-Reply-To: <d352c741-baaf-3be3-ef31-81ce6250876c@csgroup.eu>
References: <20220124055741.3686496-1-npiggin@gmail.com>
 <d3ab1142-5f62-6cbc-067c-6a34f4f28ef2@csgroup.eu>
 <1643079479.32j7nee5j0.astroid@bobo.none>
 <d352c741-baaf-3be3-ef31-81ce6250876c@csgroup.eu>
Message-ID: <243beedc6b928987d46b35f3ff6e7ec8@imap.linux.ibm.com>
X-Sender: naveen.n.rao@linux.vnet.ibm.com
User-Agent: Roundcube Webmail/1.1.12
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: rzl-AnMyRHAvpjlaEgRgM1Rg46Xh432x
X-Proofpoint-ORIG-GUID: xyiN_YLYufrCn_-dsIGvaMWDwuyrVBou
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-28_02,2022-01-27_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 spamscore=0 lowpriorityscore=0 mlxscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201280069
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

[Sorry if you receive this in duplicate. Resending since this message 
didn't hit the list]


On 2022-01-25 11:23, Christophe Leroy wrote:
> Le 25/01/2022 à 04:04, Nicholas Piggin a écrit :
>> +Naveen (sorry missed cc'ing you at first)
>> 
>> Excerpts from Christophe Leroy's message of January 24, 2022 4:39 pm:
>>> 
>>> 
>>> Le 24/01/2022 à 06:57, Nicholas Piggin a écrit :
>>>> As discussed previously
>>>> 
>>>> https://lists.ozlabs.org/pipermail/linuxppc-dev/2022-January/238946.html
>>>> 
>>>> I'm wondering whether PPC32 should be returning -1 for syscall
>>>> instructions too here? That could be done in another patch anyway.
>>>> 
>>> 
>>> The 'Programming Environments Manual for 32-Bit Implementations of 
>>> the
>>> PowerPC™ Architecture' says:
>>> 
>>> The following are not traced:
>>> • rfi instruction
>>> • sc and trap instructions that trap
>>> • Other instructions that cause interrupts (other than trace 
>>> interrupts)
>>> • The first instruction of any interrupt handler
>>> • Instructions that are emulated by software
>>> 
>>> 
>>> So I think PPC32 should return -1 as well.
>> 
>> I agree.
>> 
>> What about the trap instructions? analyse_instr returns 0 for them
>> which falls through to return 0 for emulate_step, should they
>> return -1 as well or am I missing something?

Yeah, good point about the trap instructions.

>> 
> 
> For the traps I don't know. The manual says "trap instructions that
> trap" are not traced. It means that "trap instructions that _don't_
> trap" are traced. Taking into account that trap instructions don't trap
> at least 99.9% of the time, not sure if returning -1 is needed.
> 
> Allthought that'd probably be the safest.

'trap' is a special case since it is predominantly used by debuggers
and/or tracing infrastructure. Kprobes and Uprobes do not allow probes
on a trap instruction. But, xmon can be asked to step on a trap
instruction and that can interfere with kprobes in weird ways.

So, I think it is best if we also exclude trap instructions from being
single stepped.

> 
> But then what happens with other instruction that will sparsely 
> generate
> an exception like a DSI or so ? If we do it for the traps then we 
> should
> do it for this as well, and then it becomes a non ending story.

For a DSI, we restart the same instruction after handling the page 
fault.
The single step exception is raised on the subsequent successful
completion of the instruction. For most other interrupts (alignment, vsx
unavailable, ...), we end up emulating the single step exception itself
(see emulate_single_step()). So, those are ok if caused by an 
instruction
being stepped.


- Naveen
