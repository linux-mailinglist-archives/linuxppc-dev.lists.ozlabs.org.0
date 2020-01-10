Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9964A136B35
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jan 2020 11:40:47 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47vKJX5yRQzDqdq
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jan 2020 21:40:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bala24@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47vKGZ2fS6zDqd0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2020 21:39:01 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00AAbJV7017706
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2020 05:38:58 -0500
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2xe9uyy44n-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2020 05:38:58 -0500
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bala24@linux.ibm.com>;
 Fri, 10 Jan 2020 10:38:56 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 10 Jan 2020 10:38:54 -0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 00AAcrIf60817556
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Jan 2020 10:38:53 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 266EF52051;
 Fri, 10 Jan 2020 10:38:53 +0000 (GMT)
Received: from dhcp-9-109-246-161.in.ibm.com (unknown [9.109.246.161])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id 1481C52054;
 Fri, 10 Jan 2020 10:38:51 +0000 (GMT)
Date: Fri, 10 Jan 2020 16:08:49 +0530
From: Balamuruhan S <bala24@linux.ibm.com>
To: Jordan Niethe <jniethe5@gmail.com>
Subject: Re: [PATCH 06/18] powerpc sstep: Add support for prefixed integer
 load/stores
References: <20191126052141.28009-1-jniethe5@gmail.com>
 <20191126052141.28009-7-jniethe5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191126052141.28009-7-jniethe5@gmail.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-TM-AS-GCONF: 00
x-cbid: 20011010-0028-0000-0000-000003CFF008
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20011010-0029-0000-0000-000024940837
Message-Id: <20200110103849.GA18460@dhcp-9-109-246-161.in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-10_01:2020-01-10,
 2020-01-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 impostorscore=0 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 mlxlogscore=999 suspectscore=3 lowpriorityscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001100092
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
Cc: alistair@popple.id.au, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Nov 26, 2019 at 04:21:29PM +1100, Jordan Niethe wrote:
> This adds emulation support for the following prefixed integer
> load/stores:
>   * Prefixed Load Byte and Zero (plbz)
>   * Prefixed Load Halfword and Zero (plhz)
>   * Prefixed Load Halfword Algebraic (plha)
>   * Prefixed Load Word and Zero (plwz)
>   * Prefixed Load Word Algebraic (plwa)
>   * Prefixed Load Doubleword (pld)
>   * Prefixed Store Byte (pstb)
>   * Prefixed Store Halfword (psth)
>   * Prefixed Store Word (pstw)
>   * Prefixed Store Doubleword (pstd)
>   * Prefixed Load Quadword (plq)
>   * Prefixed Store Quadword (pstq)
> 
> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> ---
>  arch/powerpc/lib/sstep.c | 110 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 110 insertions(+)
> 
> diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
> index ade3f5eba2e5..4f5ad1f602d8 100644
> --- a/arch/powerpc/lib/sstep.c
> +++ b/arch/powerpc/lib/sstep.c
> @@ -187,6 +187,43 @@ static nokprobe_inline unsigned long xform_ea(unsigned int instr,
>  	return ea;
>  }
>  
> +/*
> + * Calculate effective address for a MLS:D-form / 8LS:D-form prefixed instruction
> + */
> +static nokprobe_inline unsigned long mlsd_8lsd_ea(unsigned int instr,
> +						  unsigned int sufx,
> +						  const struct pt_regs *regs)
> +{
> +	int ra, prefix_r;
> +	unsigned int  dd;
> +	unsigned long ea, d0, d1, d;
> +
> +	prefix_r = instr & (1ul << 20);
> +	ra = (sufx >> 16) & 0x1f;
> +
> +	d0 = instr & 0x3ffff;
> +	d1 = sufx & 0xffff;
> +	d = (d0 << 16) | d1;
> +
> +	/*
> +	 * sign extend a 34 bit number
> +	 */
> +	dd = (unsigned int) (d >> 2);
> +	ea = (signed int) dd;
> +	ea = (ea << 2) | (d & 0x3);
> +
> +	if (!prefix_r && ra)
> +		ea += regs->gpr[ra];
> +	else if (!prefix_r && !ra)
> +		; /* Leave ea as is */
> +	else if (prefix_r && !ra)
> +		ea += regs->nip;
> +	else if (prefix_r && ra)
> +		; /* Invalid form. Should already be checked for by caller! */
> +
> +	return ea;
> +}
> +
>  /*
>   * Return the largest power of 2, not greater than sizeof(unsigned long),
>   * such that x is a multiple of it.
> @@ -1166,6 +1203,7 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
>  		  unsigned int instr, unsigned int sufx)
>  {
>  	unsigned int opcode, ra, rb, rc, rd, spr, u;
> +	unsigned int sufxopcode, prefixtype, prefix_r;
>  	unsigned long int imm;
>  	unsigned long int val, val2;
>  	unsigned int mb, me, sh;
> @@ -2652,6 +2690,78 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
>  
>  	}
>  
> +/*
> + * Prefixed instructions
> + */
> +	switch (opcode) {
> +	case 1:
> +		prefix_r = instr & (1ul << 20);
> +		ra = (sufx >> 16) & 0x1f;
> +		op->update_reg = ra;
> +		rd = (sufx >> 21) & 0x1f;
> +		op->reg = rd;
> +		op->val = regs->gpr[rd];
> +
> +		sufxopcode = sufx >> 26;
> +		prefixtype = (instr >> 24) & 0x3;
> +		switch (prefixtype) {
> +		case 0: /* Type 00  Eight-Byte Load/Store */
> +			if (prefix_r && ra)
> +				break;
> +			op->ea = mlsd_8lsd_ea(instr, sufx, regs);
> +			switch (sufxopcode) {
> +			case 41:	/* plwa */
> +				op->type = MKOP(LOAD, PREFIXED | SIGNEXT, 4);
> +				break;
> +			case 56:        /* plq */
> +				op->type = MKOP(LOAD, PREFIXED, 16);
> +				break;
> +			case 57:	/* pld */
> +				op->type = MKOP(LOAD, PREFIXED | SIGNEXT, 8);
> +				break;
> +			case 60:        /* stq */
> +				op->type = MKOP(STORE, PREFIXED, 16);
> +				break;
> +			case 61:	/* pstd */
> +				op->type = MKOP(STORE, PREFIXED | SIGNEXT, 8);

For 8 byte and and 1 byte (mentioned below for Type 10 instructions), we
do not have their respective definitions in `do_signext()`, I am not
sure whether it is typo/miss.

> +				break;
> +			}
> +			break;
> +		case 1: /* Type 01 Modified Register-to-Register */

Type 01 would be Eight-Byte Register-to-Register.

-- Bala
> +			break;
> +		case 2: /* Type 10 Modified Load/Store */
> +			if (prefix_r && ra)
> +				break;
> +			op->ea = mlsd_8lsd_ea(instr, sufx, regs);
> +			switch (sufxopcode) {
> +			case 32:	/* plwz */
> +				op->type = MKOP(LOAD, PREFIXED, 4);
> +				break;
> +			case 34:	/* plbz */
> +				op->type = MKOP(LOAD, PREFIXED, 1);
> +				break;
> +			case 36:	/* pstw */
> +				op->type = MKOP(STORE, PREFIXED, 4);
> +				break;
> +			case 38:	/* pstb */
> +				op->type = MKOP(STORE, PREFIXED, 1);
> +				break;
> +			case 40:	/* plhz */
> +				op->type = MKOP(LOAD, PREFIXED, 2);
> +				break;
> +			case 42:	/* plha */
> +				op->type = MKOP(LOAD, PREFIXED | SIGNEXT, 2);
> +				break;
> +			case 44:	/* psth */
> +				op->type = MKOP(STORE, PREFIXED, 2);
> +				break;
> +			}
> +			break;
> +		case 3: /* Type 11 Modified Register-to-Register */
> +			break;
> +		}
> +	}
> +
>  #ifdef CONFIG_VSX
>  	if ((GETTYPE(op->type) == LOAD_VSX ||
>  	     GETTYPE(op->type) == STORE_VSX) &&
> -- 
> 2.20.1
> 

