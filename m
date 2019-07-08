Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D7B4627C3
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Jul 2019 19:56:07 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45jCmh5T1wzDqS8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2019 03:56:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45jCj63GKZzDqK6
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jul 2019 03:52:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 45jCj45RQ7z8t7D
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jul 2019 03:52:56 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 45jCj40ZCBz9sMQ; Tue,  9 Jul 2019 03:52:56 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=janani@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 45jCj336qbz9sNm
 for <linuxppc-dev@ozlabs.org>; Tue,  9 Jul 2019 03:52:55 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x68Hqobq020179
 for <linuxppc-dev@ozlabs.org>; Mon, 8 Jul 2019 13:52:53 -0400
Received: from e35.co.us.ibm.com (e35.co.us.ibm.com [32.97.110.153])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tma950t88-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Mon, 08 Jul 2019 13:52:52 -0400
Received: from localhost
 by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <janani@linux.ibm.com>;
 Mon, 8 Jul 2019 18:52:52 +0100
Received: from b03cxnp08028.gho.boulder.ibm.com (9.17.130.20)
 by e35.co.us.ibm.com (192.168.1.135) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 8 Jul 2019 18:52:49 +0100
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x68Hqldl59048332
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 8 Jul 2019 17:52:47 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9E5237805F;
 Mon,  8 Jul 2019 17:52:47 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3CC2478060;
 Mon,  8 Jul 2019 17:52:47 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon,  8 Jul 2019 17:52:47 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 08 Jul 2019 12:55:12 -0500
From: janani <janani@linux.ibm.com>
To: Claudio Carvalho <cclaudio@linux.ibm.com>
Subject: Re: [PATCH v4 3/8] KVM: PPC: Ultravisor: Add generic ultravisor call
 handler
Organization: IBM
Mail-Reply-To: janani@linux.ibm.com
In-Reply-To: <20190628200825.31049-4-cclaudio@linux.ibm.com>
References: <20190628200825.31049-1-cclaudio@linux.ibm.com>
 <20190628200825.31049-4-cclaudio@linux.ibm.com>
X-Sender: janani@linux.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
x-cbid: 19070817-0012-0000-0000-0000174D9160
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011397; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01229307; UDB=6.00647410; IPR=6.01010566; 
 MB=3.00027636; MTD=3.00000008; XFM=3.00000015; UTC=2019-07-08 17:52:50
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19070817-0013-0000-0000-000057FCDEDA
Message-Id: <7711cf4d4b633b55f5c592f5e32a0f7d@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-08_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907080220
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
Reply-To: janani@linux.ibm.com
Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 Michael Anderson <andmike@linux.ibm.com>, Ram Pai <linuxram@us.ibm.com>,
 kvm-ppc@vger.kernel.org, Bharata B Rao <bharata@linux.ibm.com>,
 linuxppc-dev@ozlabs.org, Ryan Grimm <grimm@linux.ibm.com>,
 Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>,
 Thiago Bauermann <bauerman@linux.ibm.com>,
 Anshuman Khandual <khandual@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2019-06-28 15:08, Claudio Carvalho wrote:
> From: Ram Pai <linuxram@us.ibm.com>
> 
> Add the ucall() function, which can be used to make ultravisor calls
> with varied number of in and out arguments. Ultravisor calls can be 
> made
> from the host or guests.
> 
> This copies the implementation of plpar_hcall().
> 
> Signed-off-by: Ram Pai <linuxram@us.ibm.com>
> [ Change ucall.S to not save CR, rename and move headers, build ucall.S
>   if CONFIG_PPC_POWERNV set, use R3 for the ucall number and add some
>   comments in the code ]
> Signed-off-by: Claudio Carvalho <cclaudio@linux.ibm.com>
  Reviewed-by: Janani Janakiraman <janani@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/ultravisor-api.h | 20 +++++++++++++++
>  arch/powerpc/include/asm/ultravisor.h     | 20 +++++++++++++++
>  arch/powerpc/kernel/Makefile              |  2 +-
>  arch/powerpc/kernel/ucall.S               | 30 +++++++++++++++++++++++
>  arch/powerpc/kernel/ultravisor.c          |  4 +++
>  5 files changed, 75 insertions(+), 1 deletion(-)
>  create mode 100644 arch/powerpc/include/asm/ultravisor-api.h
>  create mode 100644 arch/powerpc/kernel/ucall.S
> 
> diff --git a/arch/powerpc/include/asm/ultravisor-api.h
> b/arch/powerpc/include/asm/ultravisor-api.h
> new file mode 100644
> index 000000000000..49e766adabc7
> --- /dev/null
> +++ b/arch/powerpc/include/asm/ultravisor-api.h
> @@ -0,0 +1,20 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Ultravisor API.
> + *
> + * Copyright 2019, IBM Corporation.
> + *
> + */
> +#ifndef _ASM_POWERPC_ULTRAVISOR_API_H
> +#define _ASM_POWERPC_ULTRAVISOR_API_H
> +
> +#include <asm/hvcall.h>
> +
> +/* Return codes */
> +#define U_NOT_AVAILABLE		H_NOT_AVAILABLE
> +#define U_SUCCESS		H_SUCCESS
> +#define U_FUNCTION		H_FUNCTION
> +#define U_PARAMETER		H_PARAMETER
> +
> +#endif /* _ASM_POWERPC_ULTRAVISOR_API_H */
> +
> diff --git a/arch/powerpc/include/asm/ultravisor.h
> b/arch/powerpc/include/asm/ultravisor.h
> index e5009b0d84ea..a78a2dacfd0b 100644
> --- a/arch/powerpc/include/asm/ultravisor.h
> +++ b/arch/powerpc/include/asm/ultravisor.h
> @@ -8,8 +8,28 @@
>  #ifndef _ASM_POWERPC_ULTRAVISOR_H
>  #define _ASM_POWERPC_ULTRAVISOR_H
> 
> +#include <asm/ultravisor-api.h>
> +
> +#if !defined(__ASSEMBLY__)
> +
>  /* Internal functions */
>  extern int early_init_dt_scan_ultravisor(unsigned long node, const 
> char *uname,
>  					 int depth, void *data);
> 
> +/* API functions */
> +#define UCALL_BUFSIZE 4
> +/**
> + * ucall: Make a powerpc ultravisor call.
> + * @opcode: The ultravisor call to make.
> + * @retbuf: Buffer to store up to 4 return arguments in.
> + *
> + * This call supports up to 6 arguments and 4 return arguments. Use
> + * UCALL_BUFSIZE to size the return argument buffer.
> + */
> +#if defined(CONFIG_PPC_POWERNV)
> +long ucall(unsigned long opcode, unsigned long *retbuf, ...);
> +#endif
> +
> +#endif /* !__ASSEMBLY__ */
> +
>  #endif	/* _ASM_POWERPC_ULTRAVISOR_H */
> diff --git a/arch/powerpc/kernel/Makefile 
> b/arch/powerpc/kernel/Makefile
> index f0caa302c8c0..f28baccc0a79 100644
> --- a/arch/powerpc/kernel/Makefile
> +++ b/arch/powerpc/kernel/Makefile
> @@ -154,7 +154,7 @@ endif
> 
>  obj-$(CONFIG_EPAPR_PARAVIRT)	+= epapr_paravirt.o epapr_hcalls.o
>  obj-$(CONFIG_KVM_GUEST)		+= kvm.o kvm_emul.o
> -obj-$(CONFIG_PPC_POWERNV)	+= ultravisor.o
> +obj-$(CONFIG_PPC_POWERNV)	+= ultravisor.o ucall.o
> 
>  # Disable GCOV, KCOV & sanitizers in odd or sensitive code
>  GCOV_PROFILE_prom_init.o := n
> diff --git a/arch/powerpc/kernel/ucall.S b/arch/powerpc/kernel/ucall.S
> new file mode 100644
> index 000000000000..1678f6eb7230
> --- /dev/null
> +++ b/arch/powerpc/kernel/ucall.S
> @@ -0,0 +1,30 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Generic code to perform an ultravisor call.
> + *
> + * Copyright 2019, IBM Corporation.
> + *
> + */
> +#include <asm/ppc_asm.h>
> +
> +/*
> + * This function is based on the plpar_hcall()
> + */
> +_GLOBAL_TOC(ucall)
> +	std	r4,STK_PARAM(R4)(r1)	/* Save ret buffer */
> +	mr	r4,r5
> +	mr	r5,r6
> +	mr	r6,r7
> +	mr	r7,r8
> +	mr	r8,r9
> +	mr	r9,r10
> +
> +	sc 2				/* Invoke the ultravisor */
> +
> +	ld	r12,STK_PARAM(R4)(r1)
> +	std	r4,  0(r12)
> +	std	r5,  8(r12)
> +	std	r6, 16(r12)
> +	std	r7, 24(r12)
> +
> +	blr				/* Return r3 = status */
> diff --git a/arch/powerpc/kernel/ultravisor.c 
> b/arch/powerpc/kernel/ultravisor.c
> index dc6021f63c97..02ddf79a9522 100644
> --- a/arch/powerpc/kernel/ultravisor.c
> +++ b/arch/powerpc/kernel/ultravisor.c
> @@ -8,10 +8,14 @@
>  #include <linux/init.h>
>  #include <linux/printk.h>
>  #include <linux/string.h>
> +#include <linux/export.h>
> 
>  #include <asm/ultravisor.h>
>  #include <asm/firmware.h>
> 
> +/* in ucall.S */
> +EXPORT_SYMBOL_GPL(ucall);
> +
>  int __init early_init_dt_scan_ultravisor(unsigned long node, const 
> char *uname,
>  					 int depth, void *data)
>  {

