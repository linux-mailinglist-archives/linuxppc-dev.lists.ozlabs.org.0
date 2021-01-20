Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DB66D2FCDC1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jan 2021 11:17:54 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DLM0Z2FxmzDqys
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jan 2021 21:17:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Ev6WH+vS; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DLLyh4WlGzDqqD
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Jan 2021 21:16:06 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10KA1dUl065581; Wed, 20 Jan 2021 05:15:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=WqtRsn4wX5UFovXUMrD6eX6wPMkgMTu0brw8VHhW5uA=;
 b=Ev6WH+vSLU16+XHvpnI7f1U4DBTvwstozi1NxQmtbojM6pHbJ+vGs9MtCqvw57MpcjaL
 bfKNtAsOlIvJ4T14Npv/nkZobwEH3iFl1IdcE6myA64GtUM1en4F5x8eu7cEFlQzsUc/
 +apZ5mV3vQDeBalZ12JvM45552diGaH0xe5dLBC2a/wpa1hODLb9oodQA6Fdjo3/FNaW
 MG2X7749/o5OCfgEWxtSW3393Jh6M/1cEgo8IHOnJn2/hZfxdiIfI864wGSXVc590itt
 8YUwTFRYvOVZjYjKsyZWSSJ9byZH8A+itEZOKDEtsz4/QxX4UIi+dJwQpDbepLQZ2Bxq +g== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 366j470vtk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Jan 2021 05:15:59 -0500
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10KAFJc5001797;
 Wed, 20 Jan 2021 10:15:56 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma05fra.de.ibm.com with ESMTP id 3668p807wb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Jan 2021 10:15:56 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10KAFr7Y46399822
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Jan 2021 10:15:53 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 692C7A404D;
 Wed, 20 Jan 2021 10:15:53 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F222BA4059;
 Wed, 20 Jan 2021 10:15:52 +0000 (GMT)
Received: from localhost (unknown [9.102.18.143])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 20 Jan 2021 10:15:52 +0000 (GMT)
Date: Wed, 20 Jan 2021 15:44:45 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
To: Ananth N Mavinakayanahalli <ananth@linux.ibm.com>
Subject: Re: [PATCH] [PATCH] powerpc/sstep: Check ISA 3.0 instruction
 validity before emulation
Message-ID: <20210120101445.GA80@DESKTOP-TDPLP67.localdomain>
References: <161113596420.206556.5023431229030762544.stgit@thinktux.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <161113596420.206556.5023431229030762544.stgit@thinktux.local>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-20_02:2021-01-18,
 2021-01-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 lowpriorityscore=0 mlxscore=0 bulkscore=0 clxscore=1011 impostorscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101200054
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
Cc: naveen.n.rao@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 ravi.bangoria@linux.ibm.com, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2021/01/20 03:16PM, Ananth N Mavinakayanahalli wrote:
> We currently unconditionally try to newer emulate instructions on older
				      ^^^^^ never?
				      Or: "emulate newer"?

> Power versions that could cause issues. Gate it.
> 
> Signed-off-by: Ananth N Mavinakayanahalli <ananth@linux.ibm.com>
> ---
>  arch/powerpc/lib/sstep.c |   40 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)

Thanks!

> 
> diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
> index bf7a7d62ae8b..ed119858e5e9 100644
> --- a/arch/powerpc/lib/sstep.c
> +++ b/arch/powerpc/lib/sstep.c
> @@ -1528,6 +1528,8 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
>  		goto compute_done;
>  
>  	case 19:
> +		if (!cpu_has_feature(CPU_FTR_ARCH_300))
> +			return -1;
>  		if (((word >> 1) & 0x1f) == 2) {
>  			/* addpcis */
>  			imm = (short) (word & 0xffc1);	/* d0 + d2 fields */

The cpu feature check should be within the if condition above since 
there are other instructions under opcode 19. This is not an issue right 
now as we don't emulate any of the others after this point, but it would 
be good to restrict the change to specific instructions.

Rest of the changes below look good to me. The only other v3.0 
instruction we need to gate is the 'scv' instruction. It would be good 
to handle that too.

- Naveen

