Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D2730F3B8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 14:14:09 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DWfC16HfxzDwyK
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Feb 2021 00:14:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=o1ZNpzh5; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DWf624nvszDwxt
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Feb 2021 00:09:46 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 114D6EN7038000; Thu, 4 Feb 2021 08:09:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=xHL5MsYIA95TYhvam5Ov540T7hOtZ7hiehAHeBhwbCc=;
 b=o1ZNpzh59mTcXK1VXt74wl89/RK/4satCtj7bSY6pI1udQmPwrhP1mT7KwF/XNapt8cI
 /zBZtXRCKvm3wn+rgQLS9T8XefQnwWchy69UFcCYbq5BskxXMBQ78mpc4/31etErQgMO
 Dh40OG+GCiTpjOsNH51AuPQNXemKQdAxq+KEKm1nfqeILm44Ty1cVaObhvZICOcNA/a0
 54rsD70bDB4sDvL0XUXrnIY3WPSza6VFARm/xvr4sLcTmP7z96gGDhEOkiy9jzNmwuQI
 Qs6CsPX15G6MFsh8oDbEn5sTwzqqIXMq4tTeh8MkfIfsq8azWLODRmQbbw73ZRkawKMV ew== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 36ggc5207w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Feb 2021 08:09:11 -0500
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 114D6SEC039368;
 Thu, 4 Feb 2021 08:08:45 -0500
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 36ggc51ypp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Feb 2021 08:08:44 -0500
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 114D6hbc017368;
 Thu, 4 Feb 2021 13:08:25 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06ams.nl.ibm.com with ESMTP id 36evvf2jbr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Feb 2021 13:08:25 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 114D8Mb242795336
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 4 Feb 2021 13:08:22 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4E37252050;
 Thu,  4 Feb 2021 13:08:22 +0000 (GMT)
Received: from localhost (unknown [9.85.87.37])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id D608C52051;
 Thu,  4 Feb 2021 13:08:21 +0000 (GMT)
Date: Thu, 4 Feb 2021 18:38:21 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Subject: Re: [PATCH v2] powerpc/uprobes: Validation for prefixed instruction
Message-ID: <20210204130821.GK210@DESKTOP-TDPLP67.localdomain>
References: <20210204104703.273429-1-ravi.bangoria@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210204104703.273429-1-ravi.bangoria@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-04_07:2021-02-04,
 2021-02-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 phishscore=0 mlxlogscore=999 clxscore=1015 impostorscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102040080
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
Cc: oleg@redhat.com, rostedt@goodmis.org, linux-kernel@vger.kernel.org,
 paulus@samba.org, sandipan@linux.ibm.com, jniethe5@gmail.com,
 naveen.n.rao@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2021/02/04 04:17PM, Ravi Bangoria wrote:
> Don't allow Uprobe on 2nd word of a prefixed instruction. As per
> ISA 3.1, prefixed instruction should not cross 64-byte boundary.
> So don't allow Uprobe on such prefixed instruction as well.
> 
> There are two ways probed instruction is changed in mapped pages.
> First, when Uprobe is activated, it searches for all the relevant
> pages and replace instruction in them. In this case, if we notice
> that probe is on the 2nd word of prefixed instruction, error out
> directly. Second, when Uprobe is already active and user maps a
> relevant page via mmap(), instruction is replaced via mmap() code
> path. But because Uprobe is invalid, entire mmap() operation can
> not be stopped. In this case just print an error and continue.
> 
> Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
> ---
> v1: http://lore.kernel.org/r/20210119091234.76317-1-ravi.bangoria@linux.ibm.com
> v1->v2:
>   - Instead of introducing new arch hook from verify_opcode(), use
>     existing hook arch_uprobe_analyze_insn().
>   - Add explicit check for prefixed instruction crossing 64-byte
>     boundary. If probe is on such instruction, throw an error.
> 
>  arch/powerpc/kernel/uprobes.c | 66 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 65 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/kernel/uprobes.c b/arch/powerpc/kernel/uprobes.c
> index e8a63713e655..485d19a2a31f 100644
> --- a/arch/powerpc/kernel/uprobes.c
> +++ b/arch/powerpc/kernel/uprobes.c
> @@ -7,6 +7,7 @@
>   * Adapted from the x86 port by Ananth N Mavinakayanahalli <ananth@in.ibm.com>
>   */
>  #include <linux/kernel.h>
> +#include <linux/highmem.h>
>  #include <linux/sched.h>
>  #include <linux/ptrace.h>
>  #include <linux/uprobes.h>
> @@ -28,6 +29,69 @@ bool is_trap_insn(uprobe_opcode_t *insn)
>  	return (is_trap(*insn));
>  }
>  
> +#ifdef CONFIG_PPC64
> +static int get_instr(struct mm_struct *mm, unsigned long addr, u32 *instr)
> +{
> +	struct page *page;
> +	struct vm_area_struct *vma;
> +	void *kaddr;
> +	unsigned int gup_flags = FOLL_FORCE | FOLL_SPLIT_PMD;
> +
> +	if (get_user_pages_remote(mm, addr, 1, gup_flags, &page, &vma, NULL) <= 0)
> +		return -EINVAL;
> +
> +	kaddr = kmap_atomic(page);
> +	*instr = *((u32 *)(kaddr + (addr & ~PAGE_MASK)));
> +	kunmap_atomic(kaddr);
> +	put_page(page);
> +	return 0;
> +}
> +
> +static int validate_prefixed_instr(struct mm_struct *mm, unsigned long addr)
> +{
> +	struct ppc_inst inst;
> +	u32 prefix, suffix;
> +
> +	/*
> +	 * No need to check if addr is pointing to beginning of the
> +	 * page. Even if probe is on a suffix of page-unaligned
> +	 * prefixed instruction, hw will raise exception and kernel
> +	 * will send SIGBUS.
> +	 */
> +	if (!(addr & ~PAGE_MASK))
> +		return 0;
> +
> +	if (get_instr(mm, addr, &prefix) < 0)
> +		return -EINVAL;
> +	if (get_instr(mm, addr + 4, &suffix) < 0)
> +		return -EINVAL;
> +
> +	inst = ppc_inst_prefix(prefix, suffix);
> +	if (ppc_inst_prefixed(inst) && (addr & 0x3F) == 0x3C) {
> +		printk_ratelimited("Cannot register a uprobe on 64 byte "
		^^^^^^^^^^^^^^^^^^ pr_info_ratelimited()

It should be sufficient to check the primary opcode to determine if it 
is a prefixed instruction. You don't have to read the suffix. I see that 
we don't have a helper to do this currently, so you could do:

	if (ppc_inst_primary_opcode(ppc_inst(prefix)) == 1)

In the future, it might be worthwhile to add IS_PREFIX() as a macro 
similar to IS_MTMSRD() if there are more such uses.

Along with this, if you also add the below to the start of this 
function, you can get rid of the #ifdef:

	if (!IS_ENABLED(CONFIG_PPC64))
		return 0;


- Naveen

