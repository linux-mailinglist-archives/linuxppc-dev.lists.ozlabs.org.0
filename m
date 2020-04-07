Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC4E1A07ED
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 09:06:18 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48xJNR575mzDr2F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 17:06:15 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48xJLf0H9hzDqQJ
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Apr 2020 17:04:41 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03772rnh054208
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 7 Apr 2020 03:04:39 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3082nwdrb0-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Apr 2020 03:04:39 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bala24@linux.ibm.com>;
 Tue, 7 Apr 2020 08:04:33 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 7 Apr 2020 08:04:30 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03774W3J52691028
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 7 Apr 2020 07:04:32 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C322EA405C;
 Tue,  7 Apr 2020 07:04:32 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 88DA4A405B;
 Tue,  7 Apr 2020 07:04:31 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.199.51.145])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  7 Apr 2020 07:04:31 +0000 (GMT)
Subject: Re: [PATCH v5 05/21] powerpc: Use a function for getting the
 instruction op code
From: Balamuruhan S <bala24@linux.ibm.com>
To: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org
Date: Tue, 07 Apr 2020 12:34:30 +0530
In-Reply-To: <20200406080936.7180-6-jniethe5@gmail.com>
References: <20200406080936.7180-1-jniethe5@gmail.com>
 <20200406080936.7180-6-jniethe5@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.3 (3.34.3-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 20040707-0028-0000-0000-000003F38DA9
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20040707-0029-0000-0000-000024B923EB
Message-Id: <1f3f9f12af1f40339045737910e8e63265edb28d.camel@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-07_01:2020-04-07,
 2020-04-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 impostorscore=0 mlxscore=0 mlxlogscore=973 malwarescore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2003020000 definitions=main-2004070059
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
Cc: alistair@popple.id.au, npiggin@gmail.com, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2020-04-06 at 18:09 +1000, Jordan Niethe wrote:
> In preparation for using a data type for instructions that can not be
> directly used with the '>>' operator use a function for getting the op
> code of an instruction.

vecemu.c and sstep.c will need ppc_inst_opcode().

-- Bala

> 
> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> ---
> v4: New to series
> ---
>  arch/powerpc/include/asm/inst.h  | 5 +++++
>  arch/powerpc/kernel/align.c      | 2 +-
>  arch/powerpc/lib/code-patching.c | 4 ++--
>  3 files changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/inst.h
> b/arch/powerpc/include/asm/inst.h
> index 5298ba33b6e5..93959016fe4b 100644
> --- a/arch/powerpc/include/asm/inst.h
> +++ b/arch/powerpc/include/asm/inst.h
> @@ -8,4 +8,9 @@
>  
>  #define ppc_inst(x) (x)
>  
> +static inline int ppc_inst_opcode(u32 x)
> +{
> +	return x >> 26;
> +}
> +
>  #endif /* _ASM_INST_H */
> diff --git a/arch/powerpc/kernel/align.c b/arch/powerpc/kernel/align.c
> index 86e9bf62f18c..691013aa9f3c 100644
> --- a/arch/powerpc/kernel/align.c
> +++ b/arch/powerpc/kernel/align.c
> @@ -314,7 +314,7 @@ int fix_alignment(struct pt_regs *regs)
>  	}
>  
>  #ifdef CONFIG_SPE
> -	if ((instr >> 26) == 0x4) {
> +	if (ppc_inst_opcode(instr) == 0x4) {
>  		int reg = (instr >> 21) & 0x1f;
>  		PPC_WARN_ALIGNMENT(spe, regs);
>  		return emulate_spe(regs, reg, instr);
> diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-
> patching.c
> index fdf0d6ea3575..099a515202aa 100644
> --- a/arch/powerpc/lib/code-patching.c
> +++ b/arch/powerpc/lib/code-patching.c
> @@ -231,7 +231,7 @@ bool is_offset_in_branch_range(long offset)
>   */
>  bool is_conditional_branch(unsigned int instr)
>  {
> -	unsigned int opcode = instr >> 26;
> +	unsigned int opcode = ppc_inst_opcode(instr);
>  
>  	if (opcode == 16)       /* bc, bca, bcl, bcla */
>  		return true;
> @@ -289,7 +289,7 @@ int create_cond_branch(unsigned int *instr, const
> unsigned int *addr,
>  
>  static unsigned int branch_opcode(unsigned int instr)
>  {
> -	return (instr >> 26) & 0x3F;
> +	return ppc_inst_opcode(instr) & 0x3F;
>  }
>  
>  static int instr_is_branch_iform(unsigned int instr)

