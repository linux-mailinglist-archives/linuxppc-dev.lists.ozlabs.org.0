Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ED12D13902A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jan 2020 12:33:22 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47xBKp1W7FzDqLc
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jan 2020 22:33:18 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47xBGX6mxkzDqKw
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2020 22:30:28 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00DBN9VW139123
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2020 06:30:24 -0500
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xfvpns3x2-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2020 06:30:23 -0500
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bala24@linux.ibm.com>;
 Mon, 13 Jan 2020 11:30:22 -0000
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 13 Jan 2020 11:30:19 -0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 00DBUIio36504044
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Jan 2020 11:30:18 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9F100AE051;
 Mon, 13 Jan 2020 11:30:18 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DD9C3AE04D;
 Mon, 13 Jan 2020 11:30:17 +0000 (GMT)
Received: from dhcp-9-109-246-161.in.ibm.com (unknown [9.124.35.118])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Mon, 13 Jan 2020 11:30:17 +0000 (GMT)
Date: Mon, 13 Jan 2020 17:00:15 +0530
From: Balamuruhan S <bala24@linux.ibm.com>
To: Jordan Niethe <jniethe5@gmail.com>
Subject: Re: [PATCH 15/18] powerpc/uprobes: Add support for prefixed
 instructions
References: <20191126052141.28009-1-jniethe5@gmail.com>
 <20191126052141.28009-16-jniethe5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191126052141.28009-16-jniethe5@gmail.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-TM-AS-GCONF: 00
x-cbid: 20011311-4275-0000-0000-000003971AE4
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20011311-4276-0000-0000-000038AB1091
Message-Id: <20200113113015.GA5532@dhcp-9-109-246-161.in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-13_03:2020-01-13,
 2020-01-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 phishscore=0
 mlxscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 spamscore=0 clxscore=1015 suspectscore=3 adultscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-1910280000
 definitions=main-2001130096
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

On Tue, Nov 26, 2019 at 04:21:38PM +1100, Jordan Niethe wrote:
> Uprobes can execute instructions out of line. Increase the size of the
> buffer used  for this so that this works for prefixed instructions. Take
> into account the length of prefixed instructions when fixing up the nip.
> 
> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> ---
>  arch/powerpc/include/asm/uprobes.h | 18 ++++++++++++++----
>  arch/powerpc/kernel/uprobes.c      |  4 ++--
>  2 files changed, 16 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/uprobes.h b/arch/powerpc/include/asm/uprobes.h
> index 2bbdf27d09b5..5b5e8a3d2f55 100644
> --- a/arch/powerpc/include/asm/uprobes.h
> +++ b/arch/powerpc/include/asm/uprobes.h
> @@ -14,18 +14,28 @@
>  
>  typedef ppc_opcode_t uprobe_opcode_t;
>  
> +/*
> + * We have to ensure we have enought space for prefixed instructions, which

minor typo of `enought` and we can have something like below,

s/We have to ensure we have enought/Ensure we have enough

-- Bala

> + * are double the size of a word instruction, i.e. 8 bytes. However,
> + * sometimes it is simpler to treat a prefixed instruction like 2 word
> + * instructions.
> + */
>  #define MAX_UINSN_BYTES		4
> -#define UPROBE_XOL_SLOT_BYTES	(MAX_UINSN_BYTES)
> +#define UPROBE_XOL_SLOT_BYTES	(2 * MAX_UINSN_BYTES)
>  
>  /* The following alias is needed for reference from arch-agnostic code */
>  #define UPROBE_SWBP_INSN	BREAKPOINT_INSTRUCTION
>  #define UPROBE_SWBP_INSN_SIZE	4 /* swbp insn size in bytes */
>  
>  struct arch_uprobe {
> +	 /*
> +	  * Ensure there is enough space for prefixed instructions. Prefixed
> +	  * instructions must not cross 64-byte boundaries.
> +	  */
>  	union {
> -		u32	insn;
> -		u32	ixol;
> -	};
> +		uprobe_opcode_t	insn[2];
> +		uprobe_opcode_t	ixol[2];
> +	} __aligned(64);
>  };
>  
>  struct arch_uprobe_task {
> diff --git a/arch/powerpc/kernel/uprobes.c b/arch/powerpc/kernel/uprobes.c
> index ab1077dc6148..cfcea6946f8b 100644
> --- a/arch/powerpc/kernel/uprobes.c
> +++ b/arch/powerpc/kernel/uprobes.c
> @@ -111,7 +111,7 @@ int arch_uprobe_post_xol(struct arch_uprobe *auprobe, struct pt_regs *regs)
>  	 * support doesn't exist and have to fix-up the next instruction
>  	 * to be executed.
>  	 */
> -	regs->nip = utask->vaddr + MAX_UINSN_BYTES;
> +	regs->nip = utask->vaddr + ((IS_PREFIX(auprobe->insn[0])) ? 8 : 4);
>  
>  	user_disable_single_step(current);
>  	return 0;
> @@ -173,7 +173,7 @@ bool arch_uprobe_skip_sstep(struct arch_uprobe *auprobe, struct pt_regs *regs)
>  	 * emulate_step() returns 1 if the insn was successfully emulated.
>  	 * For all other cases, we need to single-step in hardware.
>  	 */
> -	ret = emulate_step(regs, auprobe->insn, 0);
> +	ret = emulate_step(regs, auprobe->insn[0], auprobe->insn[1]);
>  	if (ret > 0)
>  		return true;
>  
> -- 
> 2.20.1
> 

