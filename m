Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E1989F1AE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Apr 2024 14:07:01 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oDgBagYE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VF1ll55cGz3dXP
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Apr 2024 22:06:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oDgBagYE;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VF1kx2C2vz3bnL
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Apr 2024 22:06:17 +1000 (AEST)
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4VF1kx1hH3z4wyj
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Apr 2024 22:06:17 +1000 (AEST)
Received: by gandalf.ozlabs.org (Postfix)
	id 4VF1kx1cF6z4wyY; Wed, 10 Apr 2024 22:06:17 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oDgBagYE;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=shirisha@linux.ibm.com; receiver=ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4VF1kw3vj0z4wc7;
	Wed, 10 Apr 2024 22:06:15 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43ABpacM017281;
	Wed, 10 Apr 2024 12:06:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=dOr2D9EwNxUUoH8RAzjXaOhK/KJ8Ees+fF5T0RKaZUU=;
 b=oDgBagYECP4A9Eob/4QRlw7xy4bb7zrvBldSkRRzVwhgvEyVsJJ9QK+FUXHAwzdkNSyO
 v5TLjQ+/ds3srzQrZbyS7LduWiU4M6kgqgurOorlQxLcCk0+mQAgsh+YXNt4YTdVJSVh
 sNHNDysEoccUQ5DL5V0Q6vknahqutFdrfqavphaYVVMdh9gmyIllb5wo2PYQB0oulpe1
 uVKTfGbKKYnEWT7aGpCfMUmYlmyZdkdkEKvEzmGg1Aa4uHJGZaeqTHSVeOrSe1hmwOs8
 H6HjHdVnezPCfkx+BebHP1/bPt4n9czLWXsqAZOloUa05kIfb/qCs/PjoCfMCnSCelYm XQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xds63r6ek-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Apr 2024 12:06:10 +0000
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 43AC6947013275;
	Wed, 10 Apr 2024 12:06:09 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xds63r6da-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Apr 2024 12:06:09 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 43A9ENp3016971;
	Wed, 10 Apr 2024 12:05:43 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3xbke2m4qt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Apr 2024 12:05:42 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 43AC5bEg32899784
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 10 Apr 2024 12:05:39 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9EF962004D;
	Wed, 10 Apr 2024 12:05:37 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 030772004B;
	Wed, 10 Apr 2024 12:05:36 +0000 (GMT)
Received: from li-d12addcc-2792-11b2-a85c-bd8df30615ab.ibm.com (unknown [9.43.81.12])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 10 Apr 2024 12:05:35 +0000 (GMT)
Message-ID: <c48fe312ae7fe540a94e55d45e8116c08fcd2e2a.camel@linux.ibm.com>
Subject: Re: [PATCH v5] powerpc: Avoid nmi_enter/nmi_exit in real mode
 interrupt.
From: Shirisha ganta <shirisha@linux.ibm.com>
To: Mahesh Salgaonkar <mahesh@linux.ibm.com>,
        linuxppc-dev
	 <linuxppc-dev@ozlabs.org>
Date: Wed, 10 Apr 2024 17:35:35 +0530
In-Reply-To: <20240410043006.81577-1-mahesh@linux.ibm.com>
References: <20240410043006.81577-1-mahesh@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-22.el8) 
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: tpQchUJvARya-2FkFbvbrYx5KyMpVVSF
X-Proofpoint-ORIG-GUID: 5B7XeHCndaF7cULDIh5-5opGnj4ae-NE
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-10_04,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1011 suspectscore=0 phishscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 adultscore=0 mlxscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2404100088
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

On Wed, 2024-04-10 at 10:00 +0530, Mahesh Salgaonkar wrote:
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
> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Tested-by: Shirisha Ganta <shirisha@linux.ibm.com>
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
> Changes in v5:
> - Invert the percpu chunk checks as suggested by mpe.
> - Fix mirowatt build, microwatt config has CONFIG_PPC64=y and
> CONFIG_SMP=n.
> - v4 at 
> https://lore.kernel.org/linuxppc-dev/20240214095146.1527369-1-mahesh@linux.ibm.com/
> 
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
>  arch/powerpc/kernel/setup_64.c       |  2 ++
>  3 files changed, 22 insertions(+)
> 
> diff --git a/arch/powerpc/include/asm/interrupt.h
> b/arch/powerpc/include/asm/interrupt.h
> index 7b610864b3645..2d6c886b40f44 100644
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
> +	if (percpu_first_chunk_is_paged)
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
> +	} else if (percpu_first_chunk_is_paged) {
> +		// no nmi_exit if percpu first chunk is not embedded
>  	} else {
>  		nmi_exit();
>  	}
> diff --git a/arch/powerpc/include/asm/percpu.h
> b/arch/powerpc/include/asm/percpu.h
> index 8e5b7d0b851c6..634970ce13c6b 100644
> --- a/arch/powerpc/include/asm/percpu.h
> +++ b/arch/powerpc/include/asm/percpu.h
> @@ -15,6 +15,16 @@
>  #endif /* CONFIG_SMP */
>  #endif /* __powerpc64__ */
>  
> +#if defined(CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK) &&
> defined(CONFIG_SMP)
> +#include <linux/jump_label.h>
> +DECLARE_STATIC_KEY_FALSE(__percpu_first_chunk_is_paged);
> +
> +#define percpu_first_chunk_is_paged	\
> +		(static_key_enabled(&__percpu_first_chunk_is_paged.key)
> )
> +#else
> +#define percpu_first_chunk_is_paged	false
> +#endif /* CONFIG_PPC64 && CONFIG_SMP */
> +
>  #include <asm-generic/percpu.h>
>  
>  #include <asm/paca.h>
> diff --git a/arch/powerpc/kernel/setup_64.c
> b/arch/powerpc/kernel/setup_64.c
> index 2f19d5e944852..ae36a129789ff 100644
> --- a/arch/powerpc/kernel/setup_64.c
> +++ b/arch/powerpc/kernel/setup_64.c
> @@ -834,6 +834,7 @@ static __init int pcpu_cpu_to_node(int cpu)
>  
>  unsigned long __per_cpu_offset[NR_CPUS] __read_mostly;
>  EXPORT_SYMBOL(__per_cpu_offset);
> +DEFINE_STATIC_KEY_FALSE(__percpu_first_chunk_is_paged);
>  
>  void __init setup_per_cpu_areas(void)
>  {
> @@ -876,6 +877,7 @@ void __init setup_per_cpu_areas(void)
>  	if (rc < 0)
>  		panic("cannot initialize percpu area (err=%d)", rc);
>  
> +	static_key_enable(&__percpu_first_chunk_is_paged.key);
>  	delta = (unsigned long)pcpu_base_addr - (unsigned
> long)__per_cpu_start;
>  	for_each_possible_cpu(cpu) {
>                  __per_cpu_offset[cpu] = delta +
> pcpu_unit_offsets[cpu];

