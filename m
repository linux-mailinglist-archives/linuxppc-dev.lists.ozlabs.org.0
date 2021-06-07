Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C7339DB71
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Jun 2021 13:35:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FzBBG1Jppz30BC
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Jun 2021 21:35:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CajDGsbY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=CajDGsbY; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FzB9g6DhYz2xtx
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Jun 2021 21:34:47 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 157BXA5t080975; Mon, 7 Jun 2021 07:34:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : subject :
 to : cc : references : in-reply-to : mime-version : message-id :
 content-type : content-transfer-encoding; s=pp1;
 bh=kYXyPeapcKr/CAlb1TLJGLmpyMcC82ZANcHfhLFwA1s=;
 b=CajDGsbY6xmsCX4ZqBYHNqfrhjItvi9cQVJxsQAPs8dwdcBbqANf1ivB3hLsEusHQ3Ik
 bIEa4D8Zq/NMoVOKgHhB36E2fi1OGhD0oI3ND+4wusdK1YqKyngRUsGS+8sxZynTHLg4
 wZDbwUaHX/q41qBxJ0sOHrTe1W8el7kcirpQjbvs/CXR0K2Y6QaEAI/VXclD3Jnm95Kk
 0MZaUGffPDj+gEMVDY7lz4x/H8Ohz1RpRLP7s/ztxXO7T6k9TM6DGSogj7kJ6eXvSOXQ
 tRtzuGK0zGj5GSVVeVniDvTlbg3aZW5wkp2VKonhxJljbtdXfkRmP3qzjxX59eSKcNCI nQ== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 391jjr06d5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Jun 2021 07:34:33 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 157BXBY3007633;
 Mon, 7 Jun 2021 11:34:31 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03fra.de.ibm.com with ESMTP id 3900w8rfr8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Jun 2021 11:34:31 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 157BYTJD30015856
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 7 Jun 2021 11:34:29 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5B3B55204F;
 Mon,  7 Jun 2021 11:34:29 +0000 (GMT)
Received: from localhost (unknown [9.85.115.25])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id AA71A5204E;
 Mon,  7 Jun 2021 11:34:28 +0000 (GMT)
Date: Mon, 07 Jun 2021 17:04:27 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH] powerpc/kprobes: Pass ppc_inst as a pointer to
 emulate_step() on ppc32
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Michael Ellerman
 <mpe@ellerman.id.au>
References: <20210520072909.2901326-1-naveen.n.rao@linux.vnet.ibm.com>
In-Reply-To: <20210520072909.2901326-1-naveen.n.rao@linux.vnet.ibm.com>
MIME-Version: 1.0
User-Agent: astroid/v0.15-23-gcdc62b30 (https://github.com/astroidmail/astroid)
Message-Id: <1623065577.8oijg4kgxv.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: H9mrY4Fqdj9_DBcTLgbCV75lWVQCdsep
X-Proofpoint-GUID: H9mrY4Fqdj9_DBcTLgbCV75lWVQCdsep
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-07_10:2021-06-04,
 2021-06-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0
 mlxlogscore=781 bulkscore=0 adultscore=0 impostorscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106070088
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

Naveen N. Rao wrote:
> Trying to use a kprobe on ppc32 results in the below splat:
>     BUG: Unable to handle kernel data access on read at 0x7c0802a6
>     Faulting instruction address: 0xc002e9f0
>     Oops: Kernel access of bad area, sig: 11 [#1]
>     BE PAGE_SIZE=3D4K PowerPC 44x Platform
>     Modules linked in:
>     CPU: 0 PID: 89 Comm: sh Not tainted 5.13.0-rc1-01824-g3a81c0495fdb #7
>     NIP:  c002e9f0 LR: c0011858 CTR: 00008a47
>     REGS: c292fd50 TRAP: 0300   Not tainted  (5.13.0-rc1-01824-g3a81c0495=
fdb)
>     MSR:  00009000 <EE,ME>  CR: 24002002  XER: 20000000
>     DEAR: 7c0802a6 ESR: 00000000
>     <snip>
>     NIP [c002e9f0] emulate_step+0x28/0x324
>     LR [c0011858] optinsn_slot+0x128/0x10000
>     Call Trace:
>      opt_pre_handler+0x7c/0xb4 (unreliable)
>      optinsn_slot+0x128/0x10000
>      ret_from_syscall+0x0/0x28
>=20
> The offending instruction is:
>     81 24 00 00     lwz     r9,0(r4)
>=20
> Here, we are trying to load the second argument to emulate_step():
> struct ppc_inst, which is the instruction to be emulated. On ppc64,
> structures are passed in registers when passed by value. However, per
> the ppc32 ABI, structures are always passed to functions as pointers.
> This isn't being adhered to when setting up the call to emulate_step()
> in the optprobe trampoline. Fix the same.
>=20
> Fixes: eacf4c0202654a ("powerpc: Enable OPTPROBES on PPC32")
> Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
> ---
>  arch/powerpc/kernel/optprobes.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)

Christophe,
Can you confirm if this patch works for you? It would be good if this=20
can go in v5.13.


Thanks,
Naveen

