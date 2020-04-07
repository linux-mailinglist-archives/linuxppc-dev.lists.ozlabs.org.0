Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 643591A0CB1
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 13:16:53 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48xPxY4rbmzDqyJ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 21:16:49 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48xPvd1bcFzDqC0
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Apr 2020 21:15:08 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 037B3GNP020679
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 7 Apr 2020 07:15:05 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3082nwmeq6-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Apr 2020 07:15:05 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bala24@linux.ibm.com>;
 Tue, 7 Apr 2020 12:15:00 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 7 Apr 2020 12:14:58 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 037BDtvX50463000
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 7 Apr 2020 11:13:56 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6147252057;
 Tue,  7 Apr 2020 11:15:00 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.85.85.44])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 1B5CC5204E;
 Tue,  7 Apr 2020 11:14:58 +0000 (GMT)
Subject: Re: [PATCH v5 12/21] powerpc: Introduce a function for reporting
 instruction length
From: Balamuruhan S <bala24@linux.ibm.com>
To: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org
Date: Tue, 07 Apr 2020 16:44:58 +0530
In-Reply-To: <20200406080936.7180-13-jniethe5@gmail.com>
References: <20200406080936.7180-1-jniethe5@gmail.com>
 <20200406080936.7180-13-jniethe5@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.3 (3.34.3-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 20040711-0028-0000-0000-000003F3ACE9
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20040711-0029-0000-0000-000024B943E8
Message-Id: <0408a002ecdb4fa453f2632c8d6125152bfd76ed.camel@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-07_03:2020-04-07,
 2020-04-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 impostorscore=0 mlxscore=0 mlxlogscore=847 malwarescore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2003020000 definitions=main-2004070095
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
> Currently all instructions have the same length, but in preparation for
> prefixed instructions introduce a function for returning instruction
> length.
> 
> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> ---
>  arch/powerpc/include/asm/inst.h | 5 +++++
>  arch/powerpc/kernel/kprobes.c   | 6 ++++--
>  arch/powerpc/kernel/uprobes.c   | 2 +-
>  3 files changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/inst.h
> b/arch/powerpc/include/asm/inst.h
> index 369b35ce964c..70b37a35a91a 100644
> --- a/arch/powerpc/include/asm/inst.h
> +++ b/arch/powerpc/include/asm/inst.h
> @@ -17,6 +17,11 @@ static inline u32 ppc_inst_val(struct ppc_inst x)
>  	return x.val;
>  }
>  
> +static inline bool ppc_inst_len(struct ppc_inst x)


return type shouldn't be a bool, `size_t` instead.

-- Bala

> +{
> +	return sizeof(struct ppc_inst);
> +}
> +
>  static inline int ppc_inst_opcode(struct ppc_inst x)
>  {
>  	return x.val >> 26;
> diff --git a/arch/powerpc/kernel/kprobes.c b/arch/powerpc/kernel/kprobes.c
> index ff53e5ef7e40..8d17cfdcdc54 100644
> --- a/arch/powerpc/kernel/kprobes.c
> +++ b/arch/powerpc/kernel/kprobes.c
> @@ -474,14 +474,16 @@ NOKPROBE_SYMBOL(trampoline_probe_handler);
>   */
>  int kprobe_post_handler(struct pt_regs *regs)
>  {
> +	int len;
>  	struct kprobe *cur = kprobe_running();
>  	struct kprobe_ctlblk *kcb = get_kprobe_ctlblk();
>  
>  	if (!cur || user_mode(regs))
>  		return 0;
>  
> +	len = ppc_inst_len(ppc_inst_read((struct ppc_inst *)cur->ainsn.insn));
>  	/* make sure we got here for instruction we have a kprobe on */
> -	if (((unsigned long)cur->ainsn.insn + 4) != regs->nip)
> +	if (((unsigned long)cur->ainsn.insn + len) != regs->nip)
>  		return 0;
>  
>  	if ((kcb->kprobe_status != KPROBE_REENTER) && cur->post_handler) {
> @@ -490,7 +492,7 @@ int kprobe_post_handler(struct pt_regs *regs)
>  	}
>  
>  	/* Adjust nip to after the single-stepped instruction */
> -	regs->nip = (unsigned long)cur->addr + 4;
> +	regs->nip = (unsigned long)cur->addr + len;
>  	regs->msr |= kcb->kprobe_saved_msr;
>  
>  	/*Restore back the original saved kprobes variables and continue. */
> diff --git a/arch/powerpc/kernel/uprobes.c b/arch/powerpc/kernel/uprobes.c
> index 31c870287f2b..8e63afa012ba 100644
> --- a/arch/powerpc/kernel/uprobes.c
> +++ b/arch/powerpc/kernel/uprobes.c
> @@ -112,7 +112,7 @@ int arch_uprobe_post_xol(struct arch_uprobe *auprobe,
> struct pt_regs *regs)
>  	 * support doesn't exist and have to fix-up the next instruction
>  	 * to be executed.
>  	 */
> -	regs->nip = utask->vaddr + MAX_UINSN_BYTES;
> +	regs->nip = utask->vaddr + ppc_inst_len(auprobe->insn);
>  
>  	user_disable_single_step(current);
>  	return 0;

