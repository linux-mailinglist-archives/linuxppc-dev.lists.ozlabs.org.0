Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0083D2219A1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 03:51:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B6cfc3M7bzDqtd
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 11:51:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B6ccn56G1zDqCl
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jul 2020 11:49:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4B6ccn35gXz8tSY
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jul 2020 11:49:29 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4B6ccn2bR9z9sT6; Thu, 16 Jul 2020 11:49:29 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bauerman@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4B6ccm6cg9z9sRK
 for <linuxppc-dev@ozlabs.org>; Thu, 16 Jul 2020 11:49:28 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06G1WUhP039843; Wed, 15 Jul 2020 21:49:24 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32a45ayy2v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Jul 2020 21:49:23 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06G1X6We041902;
 Wed, 15 Jul 2020 21:49:23 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32a45ayy2j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Jul 2020 21:49:23 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06G1Zcr0009949;
 Thu, 16 Jul 2020 01:49:22 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma04dal.us.ibm.com with ESMTP id 327529pfc5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Jul 2020 01:49:22 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06G1nLls14484156
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Jul 2020 01:49:21 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A3AFD112064;
 Thu, 16 Jul 2020 01:49:21 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DCC50112061;
 Thu, 16 Jul 2020 01:49:16 +0000 (GMT)
Received: from morokweng.localdomain (unknown [9.163.73.114])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTPS;
 Thu, 16 Jul 2020 01:49:16 +0000 (GMT)
References: <159466074408.24747.10036072269371204890.stgit@hbathini.in.ibm.com>
 <159466085652.24747.2414199807974963385.stgit@hbathini.in.ibm.com>
User-agent: mu4e 1.2.0; emacs 26.3
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: Hari Bathini <hbathini@linux.ibm.com>
Subject: Re: [PATCH v3 02/12] powerpc/kexec_file: mark PPC64 specific code
In-reply-to: <159466085652.24747.2414199807974963385.stgit@hbathini.in.ibm.com>
Date: Wed, 15 Jul 2020 22:49:12 -0300
Message-ID: <87v9io8c13.fsf@morokweng.localdomain>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-15_12:2020-07-15,
 2020-07-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 impostorscore=0
 mlxscore=0 bulkscore=0 adultscore=0 malwarescore=0 mlxlogscore=999
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007160005
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
Cc: Pingfan Liu <piliu@redhat.com>, Nayna Jain <nayna@linux.ibm.com>,
 Kexec-ml <kexec@lists.infradead.org>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Mimi Zohar <zohar@linux.ibm.com>,
 lkml <linux-kernel@vger.kernel.org>, linuxppc-dev <linuxppc-dev@ozlabs.org>,
 Sourabh Jain <sourabhjain@linux.ibm.com>, Petr Tesarik <ptesarik@suse.cz>,
 Andrew Morton <akpm@linux-foundation.org>, Dave Young <dyoung@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>, Eric Biederman <ebiederm@xmission.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


I didn't forget about this patch. I just wanted to see more of the
changes before comenting on it.

Hari Bathini <hbathini@linux.ibm.com> writes:

> Some of the kexec_file_load code isn't PPC64 specific. Move PPC64
> specific code from kexec/file_load.c to kexec/file_load_64.c. Also,
> rename purgatory/trampoline.S to purgatory/trampoline_64.S in the
> same spirit.

There's only a 64 bit implementation of kexec_file_load() so this is a
somewhat theoretical exercise, but there's no harm in getting the code
organized, so:

Reviewed-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>

I have just one question below.

> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
> Tested-by: Pingfan Liu <piliu@redhat.com>
> ---
>
> v2 -> v3:
> * Unchanged. Added Tested-by tag from Pingfan.
>
> v1 -> v2:
> * No changes.
>
>
>  arch/powerpc/include/asm/kexec.h       |   11 +++
>  arch/powerpc/kexec/Makefile            |    2 -
>  arch/powerpc/kexec/elf_64.c            |    7 +-
>  arch/powerpc/kexec/file_load.c         |   37 ++--------
>  arch/powerpc/kexec/file_load_64.c      |  108 ++++++++++++++++++++++++++++++
>  arch/powerpc/purgatory/Makefile        |    4 +
>  arch/powerpc/purgatory/trampoline.S    |  117 --------------------------------
>  arch/powerpc/purgatory/trampoline_64.S |  117 ++++++++++++++++++++++++++++++++
>  8 files changed, 248 insertions(+), 155 deletions(-)
>  create mode 100644 arch/powerpc/kexec/file_load_64.c
>  delete mode 100644 arch/powerpc/purgatory/trampoline.S
>  create mode 100644 arch/powerpc/purgatory/trampoline_64.S

<snip>

> diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
> new file mode 100644
> index 0000000..e6bff960
> --- /dev/null
> +++ b/arch/powerpc/kexec/file_load_64.c
> @@ -0,0 +1,108 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * ppc64 code to implement the kexec_file_load syscall
> + *
> + * Copyright (C) 2004  Adam Litke (agl@us.ibm.com)
> + * Copyright (C) 2004  IBM Corp.
> + * Copyright (C) 2004,2005  Milton D Miller II, IBM Corporation
> + * Copyright (C) 2005  R Sharada (sharada@in.ibm.com)
> + * Copyright (C) 2006  Mohan Kumar M (mohan@in.ibm.com)
> + * Copyright (C) 2020  IBM Corporation
> + *
> + * Based on kexec-tools' kexec-ppc64.c, kexec-elf-rel-ppc64.c, fs2dt.c.
> + * Heavily modified for the kernel by
> + * Hari Bathini <hbathini@linux.ibm.com>.
> + */
> +
> +#include <linux/kexec.h>
> +#include <linux/of_fdt.h>
> +#include <linux/libfdt.h>
> +
> +const struct kexec_file_ops * const kexec_file_loaders[] = {
> +	&kexec_elf64_ops,
> +	NULL
> +};
> +
> +/**
> + * setup_purgatory_ppc64 - initialize PPC64 specific purgatory's global
> + *                         variables and call setup_purgatory() to initialize
> + *                         common global variable.
> + * @image:                 kexec image.
> + * @slave_code:            Slave code for the purgatory.
> + * @fdt:                   Flattened device tree for the next kernel.
> + * @kernel_load_addr:      Address where the kernel is loaded.
> + * @fdt_load_addr:         Address where the flattened device tree is loaded.
> + *
> + * Returns 0 on success, negative errno on error.
> + */
> +int setup_purgatory_ppc64(struct kimage *image, const void *slave_code,
> +			  const void *fdt, unsigned long kernel_load_addr,
> +			  unsigned long fdt_load_addr)
> +{
> +	int ret;
> +
> +	ret = setup_purgatory(image, slave_code, fdt, kernel_load_addr,
> +			      fdt_load_addr);
> +	if (ret)
> +		pr_err("Failed to setup purgatory symbols");
> +	return ret;
> +}
> +
> +/**
> + * setup_new_fdt_ppc64 - Update the flattend device-tree of the kernel
> + *                       being loaded.
> + * @image:               kexec image being loaded.
> + * @fdt:                 Flattened device tree for the next kernel.
> + * @initrd_load_addr:    Address where the next initrd will be loaded.
> + * @initrd_len:          Size of the next initrd, or 0 if there will be none.
> + * @cmdline:             Command line for the next kernel, or NULL if there will
> + *                       be none.
> + *
> + * Returns 0 on success, negative errno on error.
> + */
> +int setup_new_fdt_ppc64(const struct kimage *image, void *fdt,
> +			unsigned long initrd_load_addr,
> +			unsigned long initrd_len, const char *cmdline)
> +{
> +	int chosen_node, ret;
> +
> +	/* Remove memory reservation for the current device tree. */
> +	ret = delete_fdt_mem_rsv(fdt, __pa(initial_boot_params),
> +				 fdt_totalsize(initial_boot_params));
> +	if (ret == 0)
> +		pr_debug("Removed old device tree reservation.\n");
> +	else if (ret != -ENOENT) {
> +		pr_err("Failed to remove old device-tree reservation.\n");
> +		return ret;
> +	}
> +
> +	ret = setup_new_fdt(image, fdt, initrd_load_addr, initrd_len,
> +			    cmdline, &chosen_node);
> +	if (ret)
> +		return ret;
> +
> +	ret = fdt_setprop(fdt, chosen_node, "linux,booted-from-kexec", NULL, 0);
> +	if (ret)
> +		pr_err("Failed to update device-tree with linux,booted-from-kexec\n");
> +
> +	return ret;
> +}

For setup_purgatory_ppc64() you start with an empty function and build
from there, but for setup_new_fdt_ppc64() you moved some code here. Is
the code above 64 bit specific?

--
Thiago Jung Bauermann
IBM Linux Technology Center
