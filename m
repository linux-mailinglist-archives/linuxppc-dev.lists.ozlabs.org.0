Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9EE30ED91
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 08:41:59 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DWVqm5Pj6zDsTf
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 18:41:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=IJlhB6Dg; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DWVnj36GGzDqnl
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Feb 2021 18:40:08 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 1147a317040445; Thu, 4 Feb 2021 02:40:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=mT0BXPrYTVjMX3pDCVxv6xBayxkTw/oZAwseGAjewgw=;
 b=IJlhB6DgY6aznCuoH3XQoeMut0//nLci7ZXFCwk1ULOwVJPoxEGmt/2TySJns+F1WjvA
 dviAOKXTZn4L3CjIYWpcJn47YNQt9LwqHov0cx/vf8fXom7shUxFOn1dhjjv0euQSLtY
 rsJdBtH2H6G5pHhLOYHyx/6V4CfCWkiEDZ5EkgOWLUSIg2QwI7MbwTy2qNMsAScTrIGA
 N7hrdN2naRRwWlmKlQG+RELOGCb6ZRAa3ISkJWYRvqBBRNnKOBiw2CJGsCLl+o8PjzRz
 cDV79W11FYdy8kzTpAnRAk3w/oqflX1iFYgFCt7k3ptThze/9sqnhhynEeNJ/VJqToys XQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 36gcetgata-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Feb 2021 02:40:02 -0500
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 1147aG12041263;
 Thu, 4 Feb 2021 02:40:01 -0500
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0b-001b2d01.pphosted.com with ESMTP id 36gcetgase-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Feb 2021 02:40:01 -0500
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 1147c4xT006459;
 Thu, 4 Feb 2021 07:39:59 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma05fra.de.ibm.com with ESMTP id 36cy382e2h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Feb 2021 07:39:59 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1147duMD39846252
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 4 Feb 2021 07:39:56 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BE7DB4203F;
 Thu,  4 Feb 2021 07:39:56 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E686842042;
 Thu,  4 Feb 2021 07:39:55 +0000 (GMT)
Received: from localhost (unknown [9.85.87.37])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  4 Feb 2021 07:39:55 +0000 (GMT)
Date: Thu, 4 Feb 2021 13:09:54 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Sandipan Das <sandipan@linux.ibm.com>
Subject: Re: [PATCH v3 1/2] powerpc: sstep: Fix load-store and update emulation
Message-ID: <20210204073954.GH210@DESKTOP-TDPLP67.localdomain>
References: <20210204071432.116439-1-sandipan@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210204071432.116439-1-sandipan@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-04_03:2021-02-04,
 2021-02-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 lowpriorityscore=0 malwarescore=0 mlxlogscore=999 clxscore=1011
 suspectscore=0 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0
 mlxscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102040041
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
Cc: ravi.bangoria@linux.ibm.com, ananth@linux.ibm.com, jniethe5@gmail.com,
 paulus@samba.org, linuxppc-dev@lists.ozlabs.org, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2021/02/04 12:44PM, Sandipan Das wrote:
> The Power ISA says that the fixed-point load and update
> instructions must neither use R0 for the base address (RA)
> nor have the destination (RT) and the base address (RA) as
> the same register. Similarly, for fixed-point stores and
> floating-point loads and stores, the instruction is invalid
> when R0 is used as the base address (RA).
> 
> This is applicable to the following instructions.
>   * Load Byte and Zero with Update (lbzu)
>   * Load Byte and Zero with Update Indexed (lbzux)
>   * Load Halfword and Zero with Update (lhzu)
>   * Load Halfword and Zero with Update Indexed (lhzux)
>   * Load Halfword Algebraic with Update (lhau)
>   * Load Halfword Algebraic with Update Indexed (lhaux)
>   * Load Word and Zero with Update (lwzu)
>   * Load Word and Zero with Update Indexed (lwzux)
>   * Load Word Algebraic with Update Indexed (lwaux)
>   * Load Doubleword with Update (ldu)
>   * Load Doubleword with Update Indexed (ldux)
>   * Load Floating Single with Update (lfsu)
>   * Load Floating Single with Update Indexed (lfsux)
>   * Load Floating Double with Update (lfdu)
>   * Load Floating Double with Update Indexed (lfdux)
>   * Store Byte with Update (stbu)
>   * Store Byte with Update Indexed (stbux)
>   * Store Halfword with Update (sthu)
>   * Store Halfword with Update Indexed (sthux)
>   * Store Word with Update (stwu)
>   * Store Word with Update Indexed (stwux)
>   * Store Doubleword with Update (stdu)
>   * Store Doubleword with Update Indexed (stdux)
>   * Store Floating Single with Update (stfsu)
>   * Store Floating Single with Update Indexed (stfsux)
>   * Store Floating Double with Update (stfdu)
>   * Store Floating Double with Update Indexed (stfdux)
> 
> E.g. the following behaviour is observed for an invalid
> load and update instruction having RA = RT.
> 
> While an userspace program having an instruction word like
> 0xe9ce0001, i.e. ldu r14, 0(r14), runs without getting
> receiving a SIGILL on a Power system (observed on P8 and
> P9), the outcome of executing that instruction word varies
> and its behaviour can be considered to be undefined.
> 
> Attaching an uprobe at that instruction's address results
> in emulation which currently performs the load as well as
> writes the effective address back to the base register.
> This might not match the outcome from hardware.
> 
> To remove any inconsistencies, this adds additional checks
> for the aforementioned instructions to make sure that the
> emulation infrastructure treats them as unknown. The kernel
> can then fallback to executing such instructions on hardware.
> 
> Fixes: 0016a4cf5582 ("powerpc: Emulate most Book I instructions in emulate_step()")
> Signed-off-by: Sandipan Das <sandipan@linux.ibm.com>
> ---
> Previous versions can be found at:
> v2: https://lore.kernel.org/linuxppc-dev/20210203063841.431063-1-sandipan@linux.ibm.com/
> v1: https://lore.kernel.org/linuxppc-dev/20201119054139.244083-1-sandipan@linux.ibm.com/
> 
> Changes in v3:
> - Dropped CONFIG_PPC_FPU check as suggested by Michael.
> - Consolidated the checks as suggested by Naveen.
> 
> Changes in v2:
> - Jump to unknown_opcode instead of returning -1 for invalid
>   instruction forms.
> 
> ---
>  arch/powerpc/lib/sstep.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
> index e96cff845ef7..9138967eb82e 100644
> --- a/arch/powerpc/lib/sstep.c
> +++ b/arch/powerpc/lib/sstep.c
> @@ -3017,6 +3017,20 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
> 
>  	}
> 
> +	if (OP_IS_LOAD_STORE(op->type) && (op->type & UPDATE)) {
> +		switch (GETTYPE(op->type)) {
> +			case LOAD:
> +				if (ra == rd)
> +					goto unknown_opcode;
> +				fallthrough;
> +			case STORE:
> +			case LOAD_FP:
> +			case STORE_FP:
> +				if (ra == 0)
> +					goto unknown_opcode;
> +		}
> +	}
> +
>  #ifdef CONFIG_VSX
>  	if ((GETTYPE(op->type) == LOAD_VSX ||
>  	     GETTYPE(op->type) == STORE_VSX) &&

I'm afraid there is one more thing. scripts/checkpatch.pl reports:

WARNING: 'an userspace' may be misspelled - perhaps 'a userspace'?
#52:
While an userspace program having an instruction word like
      ^^^^^^^^^^^^

ERROR: switch and case should be at the same indent
#96: FILE: arch/powerpc/lib/sstep.c:3021:
+               switch (GETTYPE(op->type)) {
+                       case LOAD:
[...]
+                       case STORE:
+                       case LOAD_FP:
+                       case STORE_FP:


- Naveen
