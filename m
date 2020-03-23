Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C8518F14F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 09:57:16 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48m7YN3NzNzDqdg
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 19:57:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bala24@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48m7VT2v2zzDqjJ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 19:54:41 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02N8XsZA044615
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 04:54:39 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ywe7rfja2-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 04:54:38 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bala24@linux.ibm.com>;
 Mon, 23 Mar 2020 08:54:36 -0000
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 23 Mar 2020 08:54:33 -0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 02N8sWdd44958140
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 23 Mar 2020 08:54:32 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C310811C05B;
 Mon, 23 Mar 2020 08:54:32 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D1FF811C052;
 Mon, 23 Mar 2020 08:54:30 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.203.173.30])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 23 Mar 2020 08:54:30 +0000 (GMT)
Subject: Re: [PATCH v4 15/16] powerpc sstep: Add support for prefixed
 load/stores
From: Balamuruhan S <bala24@linux.ibm.com>
To: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org
Date: Mon, 23 Mar 2020 14:24:29 +0530
In-Reply-To: <20200320051809.24332-16-jniethe5@gmail.com>
References: <20200320051809.24332-1-jniethe5@gmail.com>
 <20200320051809.24332-16-jniethe5@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.3 (3.34.3-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 20032308-0012-0000-0000-0000039615E5
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20032308-0013-0000-0000-000021D3053B
Message-Id: <94c8eb85fd364b629053fd495636ddc03b7a595e.camel@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-23_02:2020-03-21,
 2020-03-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 impostorscore=0 bulkscore=0 phishscore=0 spamscore=0 adultscore=0
 mlxscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2003020000 definitions=main-2003230048
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
Cc: alistair@popple.id.au, dja@axtens.net, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2020-03-20 at 16:18 +1100, Jordan Niethe wrote:
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
> the follow prefixed floating-point load/stores:
>   * Prefixed Load Floating-Point Single (plfs)
>   * Prefixed Load Floating-Point Double (plfd)
>   * Prefixed Store Floating-Point Single (pstfs)
>   * Prefixed Store Floating-Point Double (pstfd)
> 
> and for the following prefixed VSX load/stores:
>   * Prefixed Load VSX Scalar Doubleword (plxsd)
>   * Prefixed Load VSX Scalar Single-Precision (plxssp)
>   * Prefixed Load VSX Vector [0|1]  (plxv, plxv0, plxv1)
>   * Prefixed Store VSX Scalar Doubleword (pstxsd)
>   * Prefixed Store VSX Scalar Single-Precision (pstxssp)
>   * Prefixed Store VSX Vector [0|1] (pstxv, pstxv0, pstxv1)
> 
> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>

LGTM,

Reviewed-by: Balamuruhan S <bala24@linux.ibm.com>

> ---
> v2: - Combine all load/store patches
>     - Fix the name of Type 01 instructions
>     - Remove sign extension flag from pstd/pld
>     - Rename sufx -> suffix
> v3: - Move prefixed loads and stores into the switch statement
> ---
>  arch/powerpc/lib/sstep.c | 159 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 159 insertions(+)
> 
> diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
> index ab4c71c43c8c..daef70eb8e22 100644
> --- a/arch/powerpc/lib/sstep.c
> +++ b/arch/powerpc/lib/sstep.c
> @@ -187,6 +187,44 @@ static nokprobe_inline unsigned long xform_ea(unsigned
> int instr,
>  	return ea;
>  }
>  
> +/*
> + * Calculate effective address for a MLS:D-form / 8LS:D-form
> + * prefixed instruction
> + */
> +static nokprobe_inline unsigned long mlsd_8lsd_ea(unsigned int instr,
> +						  unsigned int suffix,
> +						  const struct pt_regs *regs)
> +{
> +	int ra, prefix_r;
> +	unsigned int  dd;
> +	unsigned long ea, d0, d1, d;
> +
> +	prefix_r = instr & (1ul << 20);
> +	ra = (suffix >> 16) & 0x1f;
> +
> +	d0 = instr & 0x3ffff;
> +	d1 = suffix & 0xffff;
> +	d = (d0 << 16) | d1;
> +
> +	/*
> +	 * sign extend a 34 bit number
> +	 */
> +	dd = (unsigned int)(d >> 2);
> +	ea = (signed int)dd;
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
> @@ -1166,6 +1204,7 @@ int analyse_instr(struct instruction_op *op, const
> struct pt_regs *regs,
>  		  ppc_inst instr)
>  {
>  	unsigned int opcode, ra, rb, rc, rd, spr, u;
> +	unsigned int suffixopcode, prefixtype, prefix_r;
>  	unsigned long int imm;
>  	unsigned long int val, val2;
>  	unsigned int mb, me, sh;
> @@ -2652,6 +2691,126 @@ int analyse_instr(struct instruction_op *op, const
> struct pt_regs *regs,
>  			break;
>  		}
>  		break;
> +	case 1: /* Prefixed instructions */
> +		prefix_r = word & (1ul << 20);
> +		ra = (suffix >> 16) & 0x1f;
> +		op->update_reg = ra;
> +		rd = (suffix >> 21) & 0x1f;
> +		op->reg = rd;
> +		op->val = regs->gpr[rd];
> +
> +		suffixopcode = suffix >> 26;
> +		prefixtype = (word >> 24) & 0x3;
> +		switch (prefixtype) {
> +		case 0: /* Type 00  Eight-Byte Load/Store */
> +			if (prefix_r && ra)
> +				break;
> +			op->ea = mlsd_8lsd_ea(word, suffix, regs);
> +			switch (suffixopcode) {
> +			case 41:	/* plwa */
> +				op->type = MKOP(LOAD, PREFIXED | SIGNEXT, 4);
> +				break;
> +			case 42:        /* plxsd */
> +				op->reg = rd + 32;
> +				op->type = MKOP(LOAD_VSX, PREFIXED, 8);
> +				op->element_size = 8;
> +				op->vsx_flags = VSX_CHECK_VEC;
> +				break;
> +			case 43:	/* plxssp */
> +				op->reg = rd + 32;
> +				op->type = MKOP(LOAD_VSX, PREFIXED, 4);
> +				op->element_size = 8;
> +				op->vsx_flags = VSX_FPCONV | VSX_CHECK_VEC;
> +				break;
> +			case 46:	/* pstxsd */
> +				op->reg = rd + 32;
> +				op->type = MKOP(STORE_VSX, PREFIXED, 8);
> +				op->element_size = 8;
> +				op->vsx_flags = VSX_CHECK_VEC;
> +				break;
> +			case 47:	/* pstxssp */
> +				op->reg = rd + 32;
> +				op->type = MKOP(STORE_VSX, PREFIXED, 4);
> +				op->element_size = 8;
> +				op->vsx_flags = VSX_FPCONV | VSX_CHECK_VEC;
> +				break;
> +			case 51:	/* plxv1 */
> +				op->reg += 32;
> +
> +				/* fallthru */
> +			case 50:	/* plxv0 */
> +				op->type = MKOP(LOAD_VSX, PREFIXED, 16);
> +				op->element_size = 16;
> +				op->vsx_flags = VSX_CHECK_VEC;
> +				break;
> +			case 55:	/* pstxv1 */
> +				op->reg = rd + 32;
> +
> +				/* fallthru */
> +			case 54:	/* pstxv0 */
> +				op->type = MKOP(STORE_VSX, PREFIXED, 16);
> +				op->element_size = 16;
> +				op->vsx_flags = VSX_CHECK_VEC;
> +				break;
> +			case 56:        /* plq */
> +				op->type = MKOP(LOAD, PREFIXED, 16);
> +				break;
> +			case 57:	/* pld */
> +				op->type = MKOP(LOAD, PREFIXED, 8);
> +				break;
> +			case 60:        /* stq */
> +				op->type = MKOP(STORE, PREFIXED, 16);
> +				break;
> +			case 61:	/* pstd */
> +				op->type = MKOP(STORE, PREFIXED, 8);
> +				break;
> +			}
> +			break;
> +		case 1: /* Type 01 Eight-Byte Register-to-Register */
> +			break;
> +		case 2: /* Type 10 Modified Load/Store */
> +			if (prefix_r && ra)
> +				break;
> +			op->ea = mlsd_8lsd_ea(word, suffix, regs);
> +			switch (suffixopcode) {
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
> +			case 48:        /* plfs */
> +				op->type = MKOP(LOAD_FP, PREFIXED | FPCONV, 4);
> +				break;
> +			case 50:        /* plfd */
> +				op->type = MKOP(LOAD_FP, PREFIXED, 8);
> +				break;
> +			case 52:        /* pstfs */
> +				op->type = MKOP(STORE_FP, PREFIXED | FPCONV,
> 4);
> +				break;
> +			case 54:        /* pstfd */
> +				op->type = MKOP(STORE_FP, PREFIXED, 8);
> +				break;
> +			}
> +			break;
> +		case 3: /* Type 11 Modified Register-to-Register */
> +			break;
> +		}
>  #endif /* __powerpc64__ */
>  
>  	}

