Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7737D18D77B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 19:41:33 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48kXfy5wgXzF0c0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Mar 2020 05:41:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48kXcl1v3wzDvJ4
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Mar 2020 05:39:34 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02KIWhXj143655
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 14:39:31 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yu8aftn24-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 14:39:31 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <naveen.n.rao@linux.vnet.ibm.com>;
 Fri, 20 Mar 2020 18:39:28 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 20 Mar 2020 18:39:26 -0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02KIdP6t62390278
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 Mar 2020 18:39:25 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A5E3211C04A;
 Fri, 20 Mar 2020 18:39:25 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0FB2F11C052;
 Fri, 20 Mar 2020 18:39:25 +0000 (GMT)
Received: from localhost (unknown [9.85.72.197])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 20 Mar 2020 18:39:24 +0000 (GMT)
Date: Sat, 21 Mar 2020 00:09:20 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH] powerpc/64: ftrace don't trace real mode
To: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
References: <20200320152551.1468983-1-npiggin@gmail.com>
In-Reply-To: <20200320152551.1468983-1-npiggin@gmail.com>
MIME-Version: 1.0
User-Agent: astroid/v0.15-13-gb675b421 (https://github.com/astroidmail/astroid)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
x-cbid: 20032018-0016-0000-0000-000002F4A285
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20032018-0017-0000-0000-00003358330B
Message-Id: <1584728788.91gvyrzbi3.naveen@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-20_06:2020-03-20,
 2020-03-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 lowpriorityscore=0 mlxscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 bulkscore=0 mlxlogscore=926
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003200074
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

Hi Nick,

Nicholas Piggin wrote:
> This warns and prevents tracing attempted in a real-mode context.

Is this something you're seeing often? Last time we looked at this, KVM=20
was the biggest offender and we introduced paca->ftrace_enabled as a way=20
to disable ftrace while in KVM code.

While this is cheap when handling ftrace_regs_caller() as done in this=20
patch, for simple function tracing (see below), we will have to grab the=20
MSR which will slow things down slightly.

>=20
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  arch/powerpc/kernel/trace/ftrace.c            |  3 +++
>  .../powerpc/kernel/trace/ftrace_64_mprofile.S | 19 +++++++++++++++----
>  2 files changed, 18 insertions(+), 4 deletions(-)
>=20
> diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/tra=
ce/ftrace.c
> index 7ea0ca044b65..ef965815fcb9 100644
> --- a/arch/powerpc/kernel/trace/ftrace.c
> +++ b/arch/powerpc/kernel/trace/ftrace.c
> @@ -949,6 +949,9 @@ unsigned long prepare_ftrace_return(unsigned long par=
ent, unsigned long ip,
>  {
>  	unsigned long return_hooker;
>=20
> +	if (WARN_ON_ONCE((mfmsr() & (MSR_IR|MSR_DR)) !=3D (MSR_IR|MSR_DR)))
> +		goto out;
> +

This is called on function entry to redirect function return to a=20
trampoline if needed. I am not sure if we have (or will have) too many C=20
functions that disable MSR_IR|MSR_DR. Unless the number of such=20
functions is large, it might be preferable to mark specific functions as=20
notrace.

>  	if (unlikely(ftrace_graph_is_dead()))
>  		goto out;
>=20
> diff --git a/arch/powerpc/kernel/trace/ftrace_64_mprofile.S b/arch/powerp=
c/kernel/trace/ftrace_64_mprofile.S
> index f9fd5f743eba..6205f15cb603 100644
> --- a/arch/powerpc/kernel/trace/ftrace_64_mprofile.S
> +++ b/arch/powerpc/kernel/trace/ftrace_64_mprofile.S
> @@ -51,16 +51,21 @@ _GLOBAL(ftrace_regs_caller)
>  	SAVE_10GPRS(12, r1)
>  	SAVE_10GPRS(22, r1)
>=20
> -	/* Save previous stack pointer (r1) */
> -	addi	r8, r1, SWITCH_FRAME_SIZE
> -	std	r8, GPR1(r1)
> -
>  	/* Load special regs for save below */
>  	mfmsr   r8
>  	mfctr   r9
>  	mfxer   r10
>  	mfcr	r11
>=20
> +	/* Shouldn't be called in real mode */
> +	andi.	r3,r8,(MSR_IR|MSR_DR)
> +	cmpdi	r3,(MSR_IR|MSR_DR)
> +	bne	ftrace_bad_realmode
> +
> +	/* Save previous stack pointer (r1) */
> +	addi	r8, r1, SWITCH_FRAME_SIZE
> +	std	r8, GPR1(r1)
> +

This stomps on the MSR value in r8, which is saved into pt_regs further=20
below.

You'll also have to handle ftrace_caller() which is used for simple=20
function tracing. We don't read the MSR there today, but that will be=20
needed if we want to suppress tracing.


- Naveen

