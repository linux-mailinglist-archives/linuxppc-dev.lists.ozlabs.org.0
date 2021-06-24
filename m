Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C18C73B2D23
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Jun 2021 13:00:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G9cc94hflz3bvq
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Jun 2021 21:00:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YphTG24n;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=YphTG24n; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G9cbV6k5tz2yR4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Jun 2021 20:59:50 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15OAXOtp028164; Thu, 24 Jun 2021 06:59:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : subject :
 to : cc : references : in-reply-to : message-id : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=seR004U7BS151tIWRK/UQWFcTx1CFnM1fGVnMoFtlFY=;
 b=YphTG24n0KllvWfsANDhmaqChXPU5couFpjUU6wTnmII18l2NTQVuACP8KHnZtI5GAIU
 /wIttwzVZuqT5CwUHfEvQvgxsfj2YXzHJQBFAaZDw4P386qMG1J16Tueqtq67rxk6tRO
 oeqj4KIFYX/HH6k0kEfCWwi9N3tOgsAjlP1iof7QNnu+XCZBwHJsOASVwXtSMw6jCP9f
 GvM0WyEBIyab4tnnPwv78UWNTyU5tRiNYy/Irs/kpNOuci5mMrwR5NJ0LRVbXXOYPyGR
 Q0FgkfWsu33JpUVlm0n1hnaalcg37qQbP7LVhSAjodA1wFILb2qCClLN2DJbMvNFMELc pw== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39cpu1v3ba-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Jun 2021 06:59:36 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15OAx3wb024246;
 Thu, 24 Jun 2021 10:59:34 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03fra.de.ibm.com with ESMTP id 3998789cc3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Jun 2021 10:59:34 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 15OAw7FV33161620
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Jun 2021 10:58:07 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2DD574C04A;
 Thu, 24 Jun 2021 10:59:32 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AA6B04C04E;
 Thu, 24 Jun 2021 10:59:31 +0000 (GMT)
Received: from localhost (unknown [9.85.126.249])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 24 Jun 2021 10:59:31 +0000 (GMT)
Date: Thu, 24 Jun 2021 16:29:30 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Subject: Re: [PATCH v2] powerpc/kprobes: Fix Oops by passing ppc_inst as a
 pointer to emulate_step() on ppc32
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Michael Ellerman <mpe@ellerman.id.au>,
 Paul Mackerras <paulus@samba.org>
References: <5bdc8cbc9a95d0779e27c9ddbf42b40f51f883c0.1624425798.git.christophe.leroy@csgroup.eu>
In-Reply-To: <5bdc8cbc9a95d0779e27c9ddbf42b40f51f883c0.1624425798.git.christophe.leroy@csgroup.eu>
User-Agent: astroid/v0.15-23-gcdc62b30 (https://github.com/astroidmail/astroid)
Message-Id: <1624531892.3vdz8ibfty.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 7Kj5BgczmA_qe273mY4-7D7mNHcbxbmm
X-Proofpoint-ORIG-GUID: 7Kj5BgczmA_qe273mY4-7D7mNHcbxbmm
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-24_06:2021-06-24,
 2021-06-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 adultscore=0 mlxlogscore=801 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 clxscore=1011 impostorscore=0 mlxscore=0 lowpriorityscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106240056
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy wrote:
> From: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
>=20
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
> Cc: stable@vger.kernel.org
> Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
> ---
> v2: Rebased on powerpc/merge 7f030e9d57b8
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Thanks for rebasing this!

I think git am drops everything after three dashes, so applying this=20
patch will drop your SOB. The recommended style (*) for adding a=20
changelog is to include it within [] before the second SOB.


- Naveen

(*) https://www.kernel.org/doc/html/latest/maintainer/modifying-patches.html

