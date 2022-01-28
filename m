Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6237D49F806
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jan 2022 12:16:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JlZfD0khhz30NZ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jan 2022 22:16:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MD7xG1Yz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=MD7xG1Yz; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JlZdX0Yxzz30Nx
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jan 2022 22:15:59 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20SB620A005025; 
 Fri, 28 Jan 2022 11:15:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type : date :
 from : to : cc : subject : in-reply-to : references : message-id :
 content-transfer-encoding : mime-version; s=pp1;
 bh=tYWaDqpfuc+0xh/+TxhUO7E+CHjY90835jLuzSXN/Zs=;
 b=MD7xG1YzOn9aqnBoGnOkxVEUxtJGp+giZlvaQZNX3CEQWVonYJcjFRXgtoj97UQkwVu+
 UJ3S4DAFKy596Mx5F7jRUZh92GarumfaPRyEXnzG+NktS/cI4iwpgPxz6VDg9u9LN3hu
 MXhUAeMTkFlU5ivxG3lNPCgNZS3+WujopC+L+qSY1aRnY95C1zCEXuBhxXpukkJgOE9R
 r7dTsqzz3BuX/+L0vMUfBmd8kRHb/+wgjgzQ2Eva2JMQCAf6fIu2oEIcWbv8S3Wl8JqM
 gxt14Yv3TkPNAd+DHWv17Mc6ed1Rq1PQ3kwtRWokirG05TiAAs/3vLnPMOjIimpN3dlN Jw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dv5a9jcyu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Jan 2022 11:15:54 +0000
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20SB6SpY007026;
 Fri, 28 Jan 2022 11:15:54 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dv5a9jcyh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Jan 2022 11:15:54 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20SBC0Qn009201;
 Fri, 28 Jan 2022 11:15:53 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma03dal.us.ibm.com with ESMTP id 3dr9jdbxma-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Jan 2022 11:15:53 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20SBFpKj25887122
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 Jan 2022 11:15:52 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CEF366A04F;
 Fri, 28 Jan 2022 11:15:51 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 997D86A04D;
 Fri, 28 Jan 2022 11:15:51 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.10.229.42])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 28 Jan 2022 11:15:51 +0000 (GMT)
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Date: Fri, 28 Jan 2022 16:45:51 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 0/2] powerpc: Disable syscall emulation and stepping
In-Reply-To: <1643268944.tltfmyu1ey.astroid@bobo.none>
References: <20220124055741.3686496-1-npiggin@gmail.com>
 <d3ab1142-5f62-6cbc-067c-6a34f4f28ef2@csgroup.eu>
 <1643079479.32j7nee5j0.astroid@bobo.none>
 <d352c741-baaf-3be3-ef31-81ce6250876c@csgroup.eu>
 <52b03748fdeff1bb2eb67f6038311e26@imap.linux.ibm.com>
 <1643268944.tltfmyu1ey.astroid@bobo.none>
Message-ID: <b570dda0f7d142a149b3f6eacd7b0631@imap.linux.ibm.com>
X-Sender: naveen.n.rao@linux.vnet.ibm.com
User-Agent: Roundcube Webmail/1.1.12
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: m84GkFm9iUyuJQEm3qwUCPxqbm3KOgVT
X-Proofpoint-ORIG-GUID: tBjPUHX-OENmmJxyKqlIxC8zO6bSuhwT
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-28_02,2022-01-27_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 mlxlogscore=662 spamscore=0 impostorscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

On 2022-01-27 13:09, Nicholas Piggin wrote:
> Excerpts from naverao1's message of January 25, 2022 8:48 pm:
>> On 2022-01-25 11:23, Christophe Leroy wrote:
>>> Le 25/01/2022 à 04:04, Nicholas Piggin a écrit :
>>>> +Naveen (sorry missed cc'ing you at first)
>>>> 
>>>> Excerpts from Christophe Leroy's message of January 24, 2022 4:39 
>>>> pm:
>>>>> 
>>>>> 
>>>>> Le 24/01/2022 à 06:57, Nicholas Piggin a écrit :
>>>>>> As discussed previously
>>>>>> 
>>>>>> https://lists.ozlabs.org/pipermail/linuxppc-dev/2022-January/238946.html
>>>>>> 
>>>>>> I'm wondering whether PPC32 should be returning -1 for syscall
>>>>>> instructions too here? That could be done in another patch anyway.
>>>>>> 
>>>>> 
>>>>> The 'Programming Environments Manual for 32-Bit Implementations of
>>>>> the
>>>>> PowerPC™ Architecture' says:
>>>>> 
>>>>> The following are not traced:
>>>>> • rfi instruction
>>>>> • sc and trap instructions that trap
>>>>> • Other instructions that cause interrupts (other than trace
>>>>> interrupts)
>>>>> • The first instruction of any interrupt handler
>>>>> • Instructions that are emulated by software
>>>>> 
>>>>> 
>>>>> So I think PPC32 should return -1 as well.
>>>> 
>>>> I agree.
>>>> 
>>>> What about the trap instructions? analyse_instr returns 0 for them
>>>> which falls through to return 0 for emulate_step, should they
>>>> return -1 as well or am I missing something?
>> 
>> Yeah, good point about the trap instructions.
>> 
>>>> 
>>> 
>>> For the traps I don't know. The manual says "trap instructions that
>>> trap" are not traced. It means that "trap instructions that _don't_
>>> trap" are traced. Taking into account that trap instructions don't 
>>> trap
>>> at least 99.9% of the time, not sure if returning -1 is needed.
>>> 
>>> Allthought that'd probably be the safest.
>> 
>> 'trap' is a special case since it is predominantly used by debuggers
>> and/or tracing infrastructure. Kprobes and Uprobes do not allow probes
>> on a trap instruction. But, xmon can be asked to step on a trap
>> instruction and that can interfere with kprobes in weird ways.
>> 
>> So, I think it is best if we also exclude trap instructions from being
>> single stepped.
>> 
>>> 
>>> But then what happens with other instruction that will sparsely
>>> generate
>>> an exception like a DSI or so ? If we do it for the traps then we
>>> should
>>> do it for this as well, and then it becomes a non ending story.
>> 
>> For a DSI, we restart the same instruction after handling the page
>> fault.
>> The single step exception is raised on the subsequent successful
>> completion of the instruction.
> 
> Although it can cause a signal, and the signal handler can decide
> to resume somewhere else.

If a signal is generated while we are single-stepping, we delay signal
delivery (see uprobe_deny_signal()) until after the single stepping.
For fatal signals, single stepping is disabled before we allow the
signal to be delivered.

> Or kernel mode equivalent it can go to a
> fixup handler and resume somewhere else.

For kprobes, we do not allow probing instructions that have an extable
entry.

- Naveen
