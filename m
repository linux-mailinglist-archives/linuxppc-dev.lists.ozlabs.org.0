Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CD21BAA19F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Sep 2019 13:37:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46PJZk4TKnzDr6Q
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Sep 2019 21:37:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46PJXV0vXvzDqLZ
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Sep 2019 21:35:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46PJXT6Xcwz8swb
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Sep 2019 21:35:37 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46PJXT5vsjz9sDQ; Thu,  5 Sep 2019 21:35:37 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=naveen.n.rao@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 46PJXT1ySkz9sP6
 for <linuxppc-dev@ozlabs.org>; Thu,  5 Sep 2019 21:35:36 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x85BWUv9073802
 for <linuxppc-dev@ozlabs.org>; Thu, 5 Sep 2019 07:35:33 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2uu0qr2ctv-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Thu, 05 Sep 2019 07:35:32 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <naveen.n.rao@linux.vnet.ibm.com>;
 Thu, 5 Sep 2019 12:35:31 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 5 Sep 2019 12:35:28 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x85BZRBJ29229056
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 5 Sep 2019 11:35:27 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CCA7B4C044;
 Thu,  5 Sep 2019 11:35:27 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6F8C84C040;
 Thu,  5 Sep 2019 11:35:27 +0000 (GMT)
Received: from localhost (unknown [9.199.43.142])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  5 Sep 2019 11:35:27 +0000 (GMT)
Date: Thu, 05 Sep 2019 17:05:25 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH] powerpc/64: Fix stacktrace on BE when function_graph is
 enabled
To: linuxppc-dev@ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
References: <20190823122901.32667-1-mpe@ellerman.id.au>
 <1566636816.4snngx2qd3.naveen@linux.ibm.com>
 <87woennk6v.fsf@mpe.ellerman.id.au>
In-Reply-To: <87woennk6v.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
x-cbid: 19090511-0016-0000-0000-000002A70837
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19090511-0017-0000-0000-000033077B0A
Message-Id: <1567682710.gcl0lz43q4.naveen@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-05_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1909050117
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman wrote:
> "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com> writes:
>> Michael Ellerman wrote:
>>> Currently if we oops or warn while function_graph is active the stack
>>> trace looks like:
>>>   .trace_graph_return+0xac/0x100
>>>   .ftrace_return_to_handler+0x98/0x140
>>>   .return_to_handler+0x20/0x40
>>>   .return_to_handler+0x0/0x40
>>>   .return_to_handler+0x0/0x40
>>>   .return_to_handler+0x0/0x40
>>>   .return_to_handler+0x0/0x40
>>>   .return_to_handler+0x0/0x40
>>>   .return_to_handler+0x0/0x40
>>>   .cpu_startup_entry+0x34/0x40
>>>   .start_secondary+0x680/0x6f0
>>>   start_secondary_prolog+0x10/0x14
>>>=20
>>> Notice the multiple entries that just show .return_to_handler.
>>>=20
>>> There is logic in show_stack() to detect this case and print the
>>> traced function, but we inadvertently broke it in commit
>>> 7d56c65a6ff9 ("powerpc/ftrace: Remove mod_return_to_handler") (2014),
>>> because that commit accidentally removed the dereference of rth which
>>> gets the text address from the function descriptor. Hence this is only
>>> broken on big endian (or technically ELFv1).
>>>=20
>>> Fix it by using the proper accessor, which is ppc_function_entry().
>>> Result is we get a stack trace such as:
>>>=20
>>>   .trace_graph_return+0x134/0x160
>>>   .ftrace_return_to_handler+0x94/0x140
>>>   .return_to_handler+0x20/0x40
>>>   .return_to_handler+0x0/0x40 (.shared_cede_loop+0x48/0x130)
>>>   .return_to_handler+0x0/0x40 (.cpuidle_enter_state+0xa0/0x690)
>>>   .return_to_handler+0x0/0x40 (.cpuidle_enter+0x44/0x70)
>>>   .return_to_handler+0x0/0x40 (.call_cpuidle+0x68/0xc0)
>>>   .return_to_handler+0x0/0x40 (.do_idle+0x37c/0x400)
>>>   .return_to_handler+0x0/0x40 (.cpu_startup_entry+0x30/0x50)
>>>   .rest_init+0x224/0x348
>>>=20
>>> Fixes: 7d56c65a6ff9 ("powerpc/ftrace: Remove mod_return_to_handler")
>>> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
>>> ---
>>>  arch/powerpc/kernel/process.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>=20
>>> diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/proces=
s.c
>>> index 8fc4de0d22b4..1601d7cfe45e 100644
>>> --- a/arch/powerpc/kernel/process.c
>>> +++ b/arch/powerpc/kernel/process.c
>>> @@ -2048,7 +2048,7 @@ void show_stack(struct task_struct *tsk, unsigned=
 long *stack)
>>>  #ifdef CONFIG_FUNCTION_GRAPH_TRACER
>>>  	struct ftrace_ret_stack *ret_stack;
>>>  	extern void return_to_handler(void);
>>> -	unsigned long rth =3D (unsigned long)return_to_handler;
>>> +	unsigned long rth =3D ppc_function_entry(return_to_handler);
>>
>> Thanks! This looks good to me. A small suggestion though -- can we use=20
>> dereference_kernel_function_descriptor() instead? It will be a nop for=20
>> ABIv2, which would be nice, but not really a major deal.
>=20
> ppc_function_entry() isn't a nop on ABIv2, *if* the function has a local
> entry point.
>=20
> As it happens return_to_handler doesn't have a local entry point, so it
> is currently a nop.

What I meant was that we still go read the first two instructions to=20
identify if there is a GEP with ppc_function_entry(). But,=20
dereference_kernel_function_descriptor() would be compiled out.

>=20
> But if return_to_handler did have a local entry then
> ppc_function_entry() would do the right thing here because we use
> ppc_function_entry() in prepare_ftrace_return().
>=20
> At least I think that's true :)

That's a good point :)
However, I think we should never have return_to_handler() with a GEP/LEP=20
since it is not a regular function.

We should switch use of ppc_function_entry() in prepare_ftrace_return()=20
to dereference_kernel_function_descriptor(). I will send a patch for=20
that.


- Naveen

