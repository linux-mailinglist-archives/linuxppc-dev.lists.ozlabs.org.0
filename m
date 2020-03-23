Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E2EB718F002
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 07:56:43 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48m4tJ5fprzDr0v
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 17:56:40 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48m4r46r67zDqR7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 17:54:44 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02N6XeXM123400
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 02:54:42 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ywet1e66s-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 02:54:41 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bala24@linux.ibm.com>;
 Mon, 23 Mar 2020 06:54:40 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 23 Mar 2020 06:54:36 -0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02N6sZU359572348
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 23 Mar 2020 06:54:35 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A4E2CAE04D;
 Mon, 23 Mar 2020 06:54:35 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B0E7BAE051;
 Mon, 23 Mar 2020 06:54:33 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.199.48.63])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 23 Mar 2020 06:54:33 +0000 (GMT)
Subject: Re: [PATCH v4 06/16] powerpc: Use a function for getting the
 instruction op code
From: Balamuruhan S <bala24@linux.ibm.com>
To: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org
Date: Mon, 23 Mar 2020 12:24:31 +0530
In-Reply-To: <20200320051809.24332-7-jniethe5@gmail.com>
References: <20200320051809.24332-1-jniethe5@gmail.com>
 <20200320051809.24332-7-jniethe5@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.3 (3.34.3-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 20032306-0028-0000-0000-000003E9BF06
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20032306-0029-0000-0000-000024AF2372
Message-Id: <250cbed1e5966c5a740e840b9127ed7964e241d6.camel@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-23_01:2020-03-21,
 2020-03-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 mlxlogscore=985 adultscore=0 spamscore=0 clxscore=1015 phishscore=0
 malwarescore=0 lowpriorityscore=0 mlxscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003230039
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

On Fri, 2020-03-20 at 16:17 +1100, Jordan Niethe wrote:
> In preparation for using a data type for instructions that can not be
> directly used with the '>>' operator use a function for getting the op
> code of an instruction.

we need to adopt this in sstep.c and vecemu.c

-- Bala
> 
> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> ---
> v4: New to series
> ---
>  arch/powerpc/kernel/align.c      | 4 ++--
>  arch/powerpc/lib/code-patching.c | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/align.c b/arch/powerpc/kernel/align.c
> index 38542fffa179..77c49dfdc1b4 100644
> --- a/arch/powerpc/kernel/align.c
> +++ b/arch/powerpc/kernel/align.c
> @@ -313,8 +313,8 @@ int fix_alignment(struct pt_regs *regs)
>  	}
>  
>  #ifdef CONFIG_SPE
> -	if ((instr >> 26) == 0x4) {
> -		int reg = (instr >> 21) & 0x1f;
> +	if (ppc_inst_opcode(instr) == 0x4) {
> +		int reg = (ppc_inst_word(instr) >> 21) & 0x1f;
>  		PPC_WARN_ALIGNMENT(spe, regs);
>  		return emulate_spe(regs, reg, instr);
>  	}
> diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-
> patching.c
> index e2ba23fd6f4d..04a303c059e2 100644
> --- a/arch/powerpc/lib/code-patching.c
> +++ b/arch/powerpc/lib/code-patching.c
> @@ -228,7 +228,7 @@ bool is_offset_in_branch_range(long offset)
>   */
>  bool is_conditional_branch(ppc_inst instr)
>  {
> -	unsigned int opcode = instr >> 26;
> +	unsigned int opcode = ppc_inst_opcode(instr);
>  
>  	if (opcode == 16)       /* bc, bca, bcl, bcla */
>  		return true;
> @@ -286,7 +286,7 @@ unsigned int create_cond_branch(const unsigned int *addr,
>  
>  static unsigned int branch_opcode(ppc_inst instr)
>  {
> -	return (instr >> 26) & 0x3F;
> +	return ppc_inst_opcode(instr) & 0x3F;
>  }
>  
>  static int instr_is_branch_iform(ppc_inst instr)

