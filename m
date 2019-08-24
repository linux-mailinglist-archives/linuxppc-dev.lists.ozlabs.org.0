Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E999BCA8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Aug 2019 11:01:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Fsh01Kk4zDsMP
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Aug 2019 19:01:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Fsdw6xnpzDrTP
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Aug 2019 18:59:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46Fsdw3ShFz8tD6
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Aug 2019 18:59:32 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46Fsdw2hmPz9sMr; Sat, 24 Aug 2019 18:59:32 +1000 (AEST)
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
 by ozlabs.org (Postfix) with ESMTPS id 46Fsdv2KHjz9s3Z
 for <linuxppc-dev@ozlabs.org>; Sat, 24 Aug 2019 18:59:30 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7O8wTXG077108
 for <linuxppc-dev@ozlabs.org>; Sat, 24 Aug 2019 04:59:25 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2uk142sg39-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Sat, 24 Aug 2019 04:59:25 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <naveen.n.rao@linux.vnet.ibm.com>;
 Sat, 24 Aug 2019 09:59:23 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Sat, 24 Aug 2019 09:59:20 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7O8xJJf35979476
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 24 Aug 2019 08:59:19 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3593C5204E;
 Sat, 24 Aug 2019 08:59:19 +0000 (GMT)
Received: from localhost (unknown [9.102.1.5])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id CB92052052;
 Sat, 24 Aug 2019 08:59:18 +0000 (GMT)
Date: Sat, 24 Aug 2019 14:29:17 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH] powerpc/64: Fix stacktrace on BE when function_graph is
 enabled
To: linuxppc-dev@ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
References: <20190823122901.32667-1-mpe@ellerman.id.au>
In-Reply-To: <20190823122901.32667-1-mpe@ellerman.id.au>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
x-cbid: 19082408-0028-0000-0000-0000039377D8
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19082408-0029-0000-0000-00002455A896
Message-Id: <1566636816.4snngx2qd3.naveen@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-24_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908240100
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
> Currently if we oops or warn while function_graph is active the stack
> trace looks like:
>   .trace_graph_return+0xac/0x100
>   .ftrace_return_to_handler+0x98/0x140
>   .return_to_handler+0x20/0x40
>   .return_to_handler+0x0/0x40
>   .return_to_handler+0x0/0x40
>   .return_to_handler+0x0/0x40
>   .return_to_handler+0x0/0x40
>   .return_to_handler+0x0/0x40
>   .return_to_handler+0x0/0x40
>   .cpu_startup_entry+0x34/0x40
>   .start_secondary+0x680/0x6f0
>   start_secondary_prolog+0x10/0x14
>=20
> Notice the multiple entries that just show .return_to_handler.
>=20
> There is logic in show_stack() to detect this case and print the
> traced function, but we inadvertently broke it in commit
> 7d56c65a6ff9 ("powerpc/ftrace: Remove mod_return_to_handler") (2014),
> because that commit accidentally removed the dereference of rth which
> gets the text address from the function descriptor. Hence this is only
> broken on big endian (or technically ELFv1).
>=20
> Fix it by using the proper accessor, which is ppc_function_entry().
> Result is we get a stack trace such as:
>=20
>   .trace_graph_return+0x134/0x160
>   .ftrace_return_to_handler+0x94/0x140
>   .return_to_handler+0x20/0x40
>   .return_to_handler+0x0/0x40 (.shared_cede_loop+0x48/0x130)
>   .return_to_handler+0x0/0x40 (.cpuidle_enter_state+0xa0/0x690)
>   .return_to_handler+0x0/0x40 (.cpuidle_enter+0x44/0x70)
>   .return_to_handler+0x0/0x40 (.call_cpuidle+0x68/0xc0)
>   .return_to_handler+0x0/0x40 (.do_idle+0x37c/0x400)
>   .return_to_handler+0x0/0x40 (.cpu_startup_entry+0x30/0x50)
>   .rest_init+0x224/0x348
>=20
> Fixes: 7d56c65a6ff9 ("powerpc/ftrace: Remove mod_return_to_handler")
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
>  arch/powerpc/kernel/process.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.=
c
> index 8fc4de0d22b4..1601d7cfe45e 100644
> --- a/arch/powerpc/kernel/process.c
> +++ b/arch/powerpc/kernel/process.c
> @@ -2048,7 +2048,7 @@ void show_stack(struct task_struct *tsk, unsigned l=
ong *stack)
>  #ifdef CONFIG_FUNCTION_GRAPH_TRACER
>  	struct ftrace_ret_stack *ret_stack;
>  	extern void return_to_handler(void);
> -	unsigned long rth =3D (unsigned long)return_to_handler;
> +	unsigned long rth =3D ppc_function_entry(return_to_handler);

Thanks! This looks good to me. A small suggestion though -- can we use=20
dereference_kernel_function_descriptor() instead? It will be a nop for=20
ABIv2, which would be nice, but not really a major deal.

In either case:
Reviewed-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>


- Naveen

