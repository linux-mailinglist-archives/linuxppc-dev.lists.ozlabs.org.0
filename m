Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90329421626
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Oct 2021 20:12:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HNTMS2bmrz2xfy
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 05:12:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=k8v8Ozxi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=k8v8Ozxi; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HNTLh33Qzz2xYD
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Oct 2021 05:11:39 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 194Hh9S4019235; 
 Mon, 4 Oct 2021 14:11:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : subject :
 to : cc : references : in-reply-to : mime-version : message-id :
 content-type : content-transfer-encoding; s=pp1;
 bh=oPtc01SlLcDemnDlpESRWof0aoaVWXFgYBSdls2BrKI=;
 b=k8v8OzxiS1W8AjF3D/XM8QYpfhp3HqA4GHoOHkek4LfWIc6gVog5s6CERYHEPUMr2kI9
 XRTK+iWvnXXATAnujctDp0XyySkNKrfmqA7SoR9+Dr6xF413JDNRBL6Li64n46gt+fra
 vGjFuD341OOneKGUGt+QHhytqMTFYBlinXuBcvVuKwvDyX7GYBlflxCIsVvlaPfeN2In
 ZyKdGoY0xdff7nS3x8II99kPn/gBnzFXdVP4mUeUsSwLP/B950JUsIddlVcCdPbYCHYw
 8KJSbgY7dTl05jan+pmEJa8bKGw3gqFCwek/AapWvyEdpGYHNJlmizDwmHXDJffHtRL6 Hw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3bg4s9axrr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Oct 2021 14:11:20 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 194I1uUU030652;
 Mon, 4 Oct 2021 14:11:20 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3bg4s9axr1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Oct 2021 14:11:20 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 194I3PFZ024199;
 Mon, 4 Oct 2021 18:11:18 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03fra.de.ibm.com with ESMTP id 3bef298tru-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Oct 2021 18:11:18 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 194IBFRd66716012
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 4 Oct 2021 18:11:15 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D2E1142045;
 Mon,  4 Oct 2021 18:11:15 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0C78842047;
 Mon,  4 Oct 2021 18:11:15 +0000 (GMT)
Received: from localhost (unknown [9.43.21.28])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  4 Oct 2021 18:11:14 +0000 (GMT)
Date: Mon, 04 Oct 2021 23:41:13 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH 2/9] powerpc/bpf: Validate branch ranges
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Daniel Borkmann <daniel@iogearbox.net>,
 Johan Almbladh <johan.almbladh@anyfinetworks.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
References: <cover.1633104510.git.naveen.n.rao@linux.vnet.ibm.com>
 <d4a44c52712468b805cbf5c244b3c9ba0f802ab8.1633104510.git.naveen.n.rao@linux.vnet.ibm.com>
 <213cac08-b0d2-447f-8448-ab31cc7b1d47@csgroup.eu>
In-Reply-To: <213cac08-b0d2-447f-8448-ab31cc7b1d47@csgroup.eu>
MIME-Version: 1.0
User-Agent: astroid/v0.15-23-gcdc62b30 (https://github.com/astroidmail/astroid)
Message-Id: <1633370629.guuynxq88g.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 7TTZ6AsSMQER3Sz248Vg4belcfMCaLYM
X-Proofpoint-ORIG-GUID: Q7yEIA_2Wl6u8ENvX1oG77NvK-UXldfs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-04_05,2021-10-04_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 mlxlogscore=999 clxscore=1015
 mlxscore=0 bulkscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110040125
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
Cc: bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy wrote:
>=20
>=20
> Le 01/10/2021 =C3=A0 23:14, Naveen N. Rao a =C3=A9crit=C2=A0:
>> Add checks to ensure that we never emit branch instructions with
>> truncated branch offsets.
>>=20
>> Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
>> Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
>> ---
>>   arch/powerpc/net/bpf_jit.h        | 26 ++++++++++++++++++++------
>>   arch/powerpc/net/bpf_jit_comp.c   |  6 +++++-
>>   arch/powerpc/net/bpf_jit_comp32.c |  8 ++++++--
>>   arch/powerpc/net/bpf_jit_comp64.c |  8 ++++++--
>>   4 files changed, 37 insertions(+), 11 deletions(-)
>>=20
>> diff --git a/arch/powerpc/net/bpf_jit.h b/arch/powerpc/net/bpf_jit.h
>> index 935ea95b66359e..7e9b978b768ed9 100644
>> --- a/arch/powerpc/net/bpf_jit.h
>> +++ b/arch/powerpc/net/bpf_jit.h
>> @@ -24,16 +24,30 @@
>>   #define EMIT(instr)		PLANT_INSTR(image, ctx->idx, instr)
>>  =20
>>   /* Long jump; (unconditional 'branch') */
>> -#define PPC_JMP(dest)		EMIT(PPC_INST_BRANCH |			      \
>> -				     (((dest) - (ctx->idx * 4)) & 0x03fffffc))
>> +#define PPC_JMP(dest)							      \
>> +	do {								      \
>> +		long offset =3D (long)(dest) - (ctx->idx * 4);		      \
>> +		if (!is_offset_in_branch_range(offset)) {		      \
>> +			pr_err_ratelimited("Branch offset 0x%lx (@%u) out of range\n", offse=
t, ctx->idx);			\
>=20
> Does it really deserves a KERN_ERR ?

The intent is to ensure that we handle this when JIT'ing the BPF
instruction. One of the subsequent patches fixes the only scenario where=20
we can hit this today. In practice, we should never hit this and if we=20
do see this, then it is a bug with the JIT.

> Isn't that something that can trigger with a userland request ?

This can't be triggered by unprivileged BPF programs since those are=20
limited to 4096 BPF instructions. You need root privileges to load large=20
enough BPF programs that can trigger out of range branches.


- Naveen

