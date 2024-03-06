Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3911C8730A9
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Mar 2024 09:26:49 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kLLySfvO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TqQWq04rKz3vdr
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Mar 2024 19:26:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kLLySfvO;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TqQW346dNz307y
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Mar 2024 19:26:07 +1100 (AEDT)
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4TqQVx5VXMz4wc4
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Mar 2024 19:26:01 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4TqQVx56spz4wcK; Wed,  6 Mar 2024 19:26:01 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kLLySfvO;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=shirisha@linux.ibm.com; receiver=ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4TqQVw6tG4z4wc4
	for <linuxppc-dev@ozlabs.org>; Wed,  6 Mar 2024 19:25:59 +1100 (AEDT)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 4268GGYK004155
	for <linuxppc-dev@ozlabs.org>; Wed, 6 Mar 2024 08:25:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=tHJlrbnWmqUCOg/fNVbrASGLydtjMzn6idvbNE0+aRg=;
 b=kLLySfvOyz5gZtCgn+tR/s/sBD4F/RbS6Z7s1A4MahfPMFgAM8/x+G+833ybt5WKERBk
 1Mh44SSxkVCd7/KalpHlb96hOmANcXadDGqMz9WRiFvlBsa3emxqHs+r92hdpYxW+kv1
 f5ASPJhf3OTr4sNitigF/CftWpBp1LhKRq4kowebBE+J6s7K44rnwhhSo8W5ZZljlHmJ
 HdJnFuSymBgCzjpd4OFyCWxpHcM76fkRvmn16cgvLtxtsm3iCpF6inCbRO4HsCAOwlx5
 R7m7bVr73J9IUcH4I0tRuKwBoJ3RI7fpyuGbjQkvAKw4mE+XtV5sOeAKgx8UBjgJyAjG bw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wpmb9h9td-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@ozlabs.org>; Wed, 06 Mar 2024 08:25:57 +0000
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 42686CKP022358
	for <linuxppc-dev@ozlabs.org>; Wed, 6 Mar 2024 08:25:57 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wpmb9h9re-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Mar 2024 08:25:56 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 4267B81L026212;
	Wed, 6 Mar 2024 08:25:55 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3wmfenwc73-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Mar 2024 08:25:55 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4268Po3x26870366
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 6 Mar 2024 08:25:52 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2C0EF2004D;
	Wed,  6 Mar 2024 08:25:50 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 069A120040;
	Wed,  6 Mar 2024 08:25:49 +0000 (GMT)
Received: from li-d12addcc-2792-11b2-a85c-bd8df30615ab.ibm.com (unknown [9.199.152.158])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  6 Mar 2024 08:25:48 +0000 (GMT)
Message-ID: <413145ab75563b8b5cc7d78b17926009f0bdbdd0.camel@linux.ibm.com>
Subject: Re: [PATCH v4] powerpc: Avoid nmi_enter/nmi_exit in real mode
 interrupt.
From: Shirisha ganta <shirisha@linux.ibm.com>
To: Mahesh Salgaonkar <mahesh@linux.ibm.com>,
        linuxppc-dev
	 <linuxppc-dev@ozlabs.org>
Date: Wed, 06 Mar 2024 13:55:48 +0530
In-Reply-To: <20240214095146.1527369-1-mahesh@linux.ibm.com>
References: <20240214095146.1527369-1-mahesh@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-22.el8) 
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: gUyFbd01XawHk6QDKYcpZ1YD1hYAGA04
X-Proofpoint-GUID: 6_ypiY_j2buG5s-RhLGCj1Ukjj17o8HZ
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-06_04,2024-03-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 spamscore=0 phishscore=0 clxscore=1011 impostorscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2403060066
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Ganesh Goudar <ganeshgr@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2024-02-14 at 15:21 +0530, Mahesh Salgaonkar wrote:
> nmi_enter()/nmi_exit() touches per cpu variables which can lead to
> kernel
> crash when invoked during real mode interrupt handling (e.g. early
> HMI/MCE
> interrupt handler) if percpu allocation comes from vmalloc area.
> 
> Early HMI/MCE handlers are called through
> DEFINE_INTERRUPT_HANDLER_NMI()
> wrapper which invokes nmi_enter/nmi_exit calls. We don't see any
> issue when
> percpu allocation is from the embedded first chunk. However with
> CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK enabled there are chances where
> percpu
> allocation can come from the vmalloc area.
> 
> With kernel command line "percpu_alloc=page" we can force percpu
> allocation
> to come from vmalloc area and can see kernel crash in
> machine_check_early:
> 
> [    1.215714] NIP [c000000000e49eb4] rcu_nmi_enter+0x24/0x110
> [    1.215717] LR [c0000000000461a0] machine_check_early+0xf0/0x2c0
> [    1.215719] --- interrupt: 200
> [    1.215720] [c000000fffd73180] [0000000000000000] 0x0 (unreliable)
> [    1.215722] [c000000fffd731b0] [0000000000000000] 0x0
> [    1.215724] [c000000fffd73210] [c000000000008364]
> machine_check_early_common+0x134/0x1f8
> 
> Fix this by avoiding use of nmi_enter()/nmi_exit() in real mode if
> percpu
> first chunk is not embedded.
> 
> Signed-off-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>

Thanks for the Patch.
I have tested the patch and the fix works fine.
selftests/powerpc/mce/inject-ra-err testcase is working as
expected after enabling percpu_alloc=page with the patch applied.

Output with Patch:
# ./inject-ra-err 
test: inject-ra-err
tags: git_version:unknown
success: inject-ra-err
#

Tested-by: Shirisha Ganta <shirisha@linux.ibm.com>


> ---
> Changes in v4:
> - Fix coding style issues.
> 
> Changes in v3:
> - Address comments from Christophe Leroy to avoid using #ifdefs in
> the
>   code
> - v2 at 
> https://lore.kernel.org/linuxppc-dev/20240205053647.1763446-1-mahesh@linux.ibm.com/
> 
> Changes in v2:
> - Rebase to upstream master
> - Use jump_labels, if CONFIG_JUMP_LABEL is enabled, to avoid redoing
> the
>   embed first chunk test at each interrupt entry.
> - v1 is at 
> https://lore.kernel.org/linuxppc-dev/164578465828.74956.6065296024817333750.stgit@jupiter/
> ---
>  arch/powerpc/include/asm/interrupt.h | 10 ++++++++++
>  arch/powerpc/include/asm/percpu.h    | 10 ++++++++++
>  arch/powerpc/kernel/setup_64.c       |  3 +++
>  3 files changed, 23 insertions(+)
> 
> diff --git a/arch/powerpc/include/asm/interrupt.h
> b/arch/powerpc/include/asm/interrupt.h
> index a4196ab1d0167..0b96464ff0339 100644
> --- a/arch/powerpc/include/asm/interrupt.h
> +++ b/arch/powerpc/include/asm/interrupt.h
> @@ -336,6 +336,14 @@ static inline void
> interrupt_nmi_enter_prepare(struct pt_regs *regs, struct inte
>  	if (IS_ENABLED(CONFIG_KASAN))
>  		return;
>  
> +	/*
> +	 * Likewise, do not use it in real mode if percpu first chunk
> is not
> +	 * embedded. With CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK enabled
> there
> +	 * are chances where percpu allocation can come from vmalloc
> area.
> +	 */
> +	if (IS_ENABLED(CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK) &&
> !is_embed_first_chunk)
> +		return;
> +
>  	/* Otherwise, it should be safe to call it */
>  	nmi_enter();
>  }
> @@ -351,6 +359,8 @@ static inline void
> interrupt_nmi_exit_prepare(struct pt_regs *regs, struct inter
>  		// no nmi_exit for a pseries hash guest taking a real
> mode exception
>  	} else if (IS_ENABLED(CONFIG_KASAN)) {
>  		// no nmi_exit for KASAN in real mode
> +	} else if (IS_ENABLED(CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK) &&
> !is_embed_first_chunk) {
> +		// no nmi_exit if percpu first chunk is not embedded
>  	} else {
>  		nmi_exit();
>  	}
> diff --git a/arch/powerpc/include/asm/percpu.h
> b/arch/powerpc/include/asm/percpu.h
> index 8e5b7d0b851c6..e24063eb0b33b 100644
> --- a/arch/powerpc/include/asm/percpu.h
> +++ b/arch/powerpc/include/asm/percpu.h
> @@ -15,6 +15,16 @@
>  #endif /* CONFIG_SMP */
>  #endif /* __powerpc64__ */
>  
> +#ifdef CONFIG_PPC64
> +#include <linux/jump_label.h>
> +DECLARE_STATIC_KEY_FALSE(__percpu_embed_first_chunk);
> +
> +#define is_embed_first_chunk	\
> +		(static_key_enabled(&__percpu_embed_first_chunk.key))
> +#else
> +#define is_embed_first_chunk	true
> +#endif /* CONFIG_PPC64 */
> +
>  #include <asm-generic/percpu.h>
>  
>  #include <asm/paca.h>
> diff --git a/arch/powerpc/kernel/setup_64.c
> b/arch/powerpc/kernel/setup_64.c
> index 2f19d5e944852..e04f0ff69d4b6 100644
> --- a/arch/powerpc/kernel/setup_64.c
> +++ b/arch/powerpc/kernel/setup_64.c
> @@ -834,6 +834,7 @@ static __init int pcpu_cpu_to_node(int cpu)
>  
>  unsigned long __per_cpu_offset[NR_CPUS] __read_mostly;
>  EXPORT_SYMBOL(__per_cpu_offset);
> +DEFINE_STATIC_KEY_FALSE(__percpu_embed_first_chunk);
>  
>  void __init setup_per_cpu_areas(void)
>  {
> @@ -869,6 +870,8 @@ void __init setup_per_cpu_areas(void)
>  			pr_warn("PERCPU: %s allocator failed (%d), "
>  				"falling back to page size\n",
>  				pcpu_fc_names[pcpu_chosen_fc], rc);
> +		else
> +			static_key_enable(&__percpu_embed_first_chunk.k
> ey);
>  	}
>  
>  	if (rc < 0)

