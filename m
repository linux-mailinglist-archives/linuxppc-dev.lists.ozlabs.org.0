Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 485481A07A1
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 08:47:27 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48xHyh27VlzDqxf
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 16:47:24 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48xHwg65F7zDqTs
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Apr 2020 16:45:39 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0376XwRD108655
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 7 Apr 2020 02:45:37 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3082n9n4x6-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Apr 2020 02:45:37 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bala24@linux.ibm.com>;
 Tue, 7 Apr 2020 07:45:23 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 7 Apr 2020 07:45:20 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0376jV8d51249332
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 7 Apr 2020 06:45:31 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5C628A4064;
 Tue,  7 Apr 2020 06:45:31 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C2B67A405B;
 Tue,  7 Apr 2020 06:45:29 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.199.51.145])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  7 Apr 2020 06:45:29 +0000 (GMT)
Subject: Re: [PATCH v5 02/21] powerpc/xmon: Move out-of-line instructions to
 text section
From: Balamuruhan S <bala24@linux.ibm.com>
To: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org
Date: Tue, 07 Apr 2020 12:15:28 +0530
In-Reply-To: <20200406080936.7180-3-jniethe5@gmail.com>
References: <20200406080936.7180-1-jniethe5@gmail.com>
 <20200406080936.7180-3-jniethe5@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.3 (3.34.3-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 20040706-0012-0000-0000-0000039FCDF7
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20040706-0013-0000-0000-000021DCEE13
Message-Id: <d86f48e6e36a3fde35024f01996744b20fd577a1.camel@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-07_01:2020-04-07,
 2020-04-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 priorityscore=1501 suspectscore=0 mlxscore=0 phishscore=0 spamscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 mlxlogscore=999 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004070051
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

On Mon, 2020-04-06 at 18:09 +1000, Jordan Niethe wrote:
> To execute an instruction out of line after a breakpoint, the NIP is set
> to the address of struct bpt::instr. Here a copy of the instruction that
> was replaced with a breakpoint is kept, along with a trap so normal flow
> can be resumed after XOLing. The struct bpt's are located within the
> data section. This is problematic as the data section may be marked as
> no execute.
> 
> Instead of each struct bpt holding the instructions to be XOL'd, make a
> new array, bpt_table[], with enough space to hold instructions for the
> number of supported breakpoints. Place this array in the text section.
> Make struct bpt::instr a pointer to the instructions in bpt_table[]
> associated with that breakpoint. This association is a simple mapping:
> bpts[n] -> bpt_table[n * words per breakpoint]. Currently we only need
> the copied instruction followed by a trap, so 2 words per breakpoint.

we do 2 things here and we discussed to split it into 2 commits, may be
it is up to your thoughts and leave it to you. But otherwise rest looks
good to me.

-- Bala

> 
> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> ---
> v4: New to series
> v5: - Do not use __section(), use a .space directive in .S file
>     - Simplify in_breakpoint_table() calculation
>     - Define BPT_SIZE
> ---
>  arch/powerpc/xmon/Makefile    |  2 +-
>  arch/powerpc/xmon/xmon.c      | 23 +++++++++++++----------
>  arch/powerpc/xmon/xmon_bpts.S |  8 ++++++++
>  arch/powerpc/xmon/xmon_bpts.h |  8 ++++++++
>  4 files changed, 30 insertions(+), 11 deletions(-)
>  create mode 100644 arch/powerpc/xmon/xmon_bpts.S
>  create mode 100644 arch/powerpc/xmon/xmon_bpts.h
> 
> diff --git a/arch/powerpc/xmon/Makefile b/arch/powerpc/xmon/Makefile
> index c3842dbeb1b7..515a13ea6f28 100644
> --- a/arch/powerpc/xmon/Makefile
> +++ b/arch/powerpc/xmon/Makefile
> @@ -21,7 +21,7 @@ endif
>  
>  ccflags-$(CONFIG_PPC64) := $(NO_MINIMAL_TOC)
>  
> -obj-y			+= xmon.o nonstdio.o spr_access.o
> +obj-y			+= xmon.o nonstdio.o spr_access.o xmon_bpts.o
>  
>  ifdef CONFIG_XMON_DISASSEMBLY
>  obj-y			+= ppc-dis.o ppc-opc.o
> diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
> index 02e3bd62cab4..049375206510 100644
> --- a/arch/powerpc/xmon/xmon.c
> +++ b/arch/powerpc/xmon/xmon.c
> @@ -62,6 +62,7 @@
>  
>  #include "nonstdio.h"
>  #include "dis-asm.h"
> +#include "xmon_bpts.h"
>  
>  #ifdef CONFIG_SMP
>  static cpumask_t cpus_in_xmon = CPU_MASK_NONE;
> @@ -97,7 +98,7 @@ static long *xmon_fault_jmp[NR_CPUS];
>  /* Breakpoint stuff */
>  struct bpt {
>  	unsigned long	address;
> -	unsigned int	instr[2];
> +	unsigned int	*instr;
>  	atomic_t	ref_count;
>  	int		enabled;
>  	unsigned long	pad;
> @@ -108,7 +109,6 @@ struct bpt {
>  #define BP_TRAP		2
>  #define BP_DABR		4
>  
> -#define NBPTS	256
>  static struct bpt bpts[NBPTS];
>  static struct bpt dabr;
>  static struct bpt *iabr;
> @@ -116,6 +116,10 @@ static unsigned bpinstr = 0x7fe00008;	/* trap */
>  
>  #define BP_NUM(bp)	((bp) - bpts + 1)
>  
> +#define BPT_SIZE	(sizeof(unsigned int) * 2)
> +#define BPT_WORDS	(BPT_SIZE / sizeof(unsigned int))
> +extern unsigned int bpt_table[NBPTS * BPT_WORDS];
> +
>  /* Prototypes */
>  static int cmds(struct pt_regs *);
>  static int mread(unsigned long, void *, int);
> @@ -853,15 +857,13 @@ static struct bpt *in_breakpoint_table(unsigned long
> nip, unsigned long *offp)
>  {
>  	unsigned long off;
>  
> -	off = nip - (unsigned long) bpts;
> -	if (off >= sizeof(bpts))
> +	off = nip - (unsigned long) bpt_table;
> +	if (off >= sizeof(bpt_table))
>  		return NULL;
> -	off %= sizeof(struct bpt);
> -	if (off != offsetof(struct bpt, instr[0])
> -	    && off != offsetof(struct bpt, instr[1]))
> +	*offp = off % BPT_SIZE;
> +	if (*offp != 0 && *offp != 4)
>  		return NULL;
> -	*offp = off - offsetof(struct bpt, instr[0]);
> -	return (struct bpt *) (nip - off);
> +	return bpts + (off / BPT_SIZE);
>  }
>  
>  static struct bpt *new_breakpoint(unsigned long a)
> @@ -876,7 +878,8 @@ static struct bpt *new_breakpoint(unsigned long a)
>  	for (bp = bpts; bp < &bpts[NBPTS]; ++bp) {
>  		if (!bp->enabled && atomic_read(&bp->ref_count) == 0) {
>  			bp->address = a;
> -			patch_instruction(&bp->instr[1], bpinstr);
> +			bp->instr = bpt_table + ((bp - bpts) * BPT_WORDS);
> +			patch_instruction(bp->instr + 1, bpinstr);
>  			return bp;
>  		}
>  	}
> diff --git a/arch/powerpc/xmon/xmon_bpts.S b/arch/powerpc/xmon/xmon_bpts.S
> new file mode 100644
> index 000000000000..ebb2dbc70ca8
> --- /dev/null
> +++ b/arch/powerpc/xmon/xmon_bpts.S
> @@ -0,0 +1,8 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#include <asm/ppc_asm.h>
> +#include <asm/asm-compat.h>
> +#include "xmon_bpts.h"
> +
> +.global bpt_table
> +bpt_table:
> +	.space NBPTS * 8
> diff --git a/arch/powerpc/xmon/xmon_bpts.h b/arch/powerpc/xmon/xmon_bpts.h
> new file mode 100644
> index 000000000000..840e70be7945
> --- /dev/null
> +++ b/arch/powerpc/xmon/xmon_bpts.h
> @@ -0,0 +1,8 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef XMON_BPTS_H
> +#define XMON_BPTS_H
> +
> +#define NBPTS	256
> +
> +#endif /* XMON_BPTS_H */
> +

