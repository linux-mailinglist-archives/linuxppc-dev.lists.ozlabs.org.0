Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5413197E9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Feb 2021 02:13:52 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DcFrF4MmCzDwpr
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Feb 2021 12:13:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bauerman@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=XbDVdfjo; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DcFlp3lHqzDvbC
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Feb 2021 12:09:58 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 11C12oKE194214; Thu, 11 Feb 2021 20:09:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=references : from : to :
 cc : subject : in-reply-to : date : message-id : mime-version :
 content-type; s=pp1; bh=nmTDub/Ux2hr+XxZPtDhKJc7n/Ne0M1pVdt80JFvfdQ=;
 b=XbDVdfjo/SU5a0O3VlsI2elV+tb+sDBEh2f+oVr/sVjssPcdCs2ry1DJt9NhPOACCzwG
 wujbHQX1O9pL9zUeolxtp7Msg2zhC9l3pjUiFL7uRhlLDE9VrXL5Y3NWCB/+VeKPQjWg
 lw2aZGOIAcK0JSi2m7Jd7j0mmmx8XFAS9wrxd3F/GgvGpH9ecX86udfT5zq6vknNQe54
 vMDTUlUb1ViVpKDBlO1rWmxT49z6oPddljPHS2qt72RI1WIS0jYVq18P7tw6EoM5qfM0
 y08ByxfxuQsqYUFeV4j9yqNmBNM9JaW0dO+jQwoqmwqwYd5Bv8LnOjC30/j3QhdTFeSs YQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36nfcpgvw7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Feb 2021 20:09:30 -0500
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 11C13XG3003550;
 Thu, 11 Feb 2021 20:09:29 -0500
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36nfcpgvvg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Feb 2021 20:09:29 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11C17WSq008415;
 Fri, 12 Feb 2021 01:09:28 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma04dal.us.ibm.com with ESMTP id 36hjra451h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Feb 2021 01:09:28 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 11C19RC912845554
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 12 Feb 2021 01:09:27 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 668D5AE062;
 Fri, 12 Feb 2021 01:09:27 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 44AA1AE05C;
 Fri, 12 Feb 2021 01:09:20 +0000 (GMT)
Received: from manicouagan.localdomain (unknown [9.85.204.73])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTPS;
 Fri, 12 Feb 2021 01:09:20 +0000 (GMT)
References: <20210209182200.30606-1-nramas@linux.microsoft.com>
 <20210209182200.30606-3-nramas@linux.microsoft.com>
User-agent: mu4e 1.4.10; emacs 27.1
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Subject: Re: [PATCH v17 02/10] of: Add a common kexec FDT setup function
In-reply-to: <20210209182200.30606-3-nramas@linux.microsoft.com>
Date: Thu, 11 Feb 2021 22:09:18 -0300
Message-ID: <87k0reozwh.fsf@manicouagan.localdomain>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-11_07:2021-02-11,
 2021-02-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0
 bulkscore=0 mlxscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102120002
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
Cc: mark.rutland@arm.com, tao.li@vivo.com, zohar@linux.ibm.com,
 paulus@samba.org, vincenzo.frascino@arm.com, frowand.list@gmail.com,
 sashal@kernel.org, robh@kernel.org, masahiroy@kernel.org, jmorris@namei.org,
 takahiro.akashi@linaro.org, linux-arm-kernel@lists.infradead.org,
 catalin.marinas@arm.com, serge@hallyn.com, devicetree@vger.kernel.org,
 pasha.tatashin@soleen.com, will@kernel.org, prsriva@linux.microsoft.com,
 hsinyi@chromium.org, allison@lohutok.net, christophe.leroy@c-s.fr,
 mbrugger@suse.com, balajib@linux.microsoft.com, dmitry.kasatkin@gmail.com,
 linux-kernel@vger.kernel.org, james.morse@arm.com, gregkh@linuxfoundation.org,
 joe@perches.com, linux-integrity@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


There's actually a complication that I just noticed and needs to be
addressed. More below.

Lakshmi Ramasubramanian <nramas@linux.microsoft.com> writes:

> From: Rob Herring <robh@kernel.org>
>
> Both arm64 and powerpc do essentially the same FDT /chosen setup for
> kexec.  The differences are either omissions that arm64 should have
> or additional properties that will be ignored.  The setup code can be
> combined and shared by both powerpc and arm64.
>
> The differences relative to the arm64 version:
>  - If /chosen doesn't exist, it will be created (should never happen).
>  - Any old dtb and initrd reserved memory will be released.
>  - The new initrd and elfcorehdr are marked reserved.
>  - "linux,booted-from-kexec" is set.
>
> The differences relative to the powerpc version:
>  - "kaslr-seed" and "rng-seed" may be set.
>  - "linux,elfcorehdr" is set.
>  - Any existing "linux,usable-memory-range" is removed.
>
> Combine the code for setting up the /chosen node in the FDT and updating
> the memory reservation for kexec, for powerpc and arm64, in
> of_kexec_alloc_and_setup_fdt() and move it to "drivers/of/kexec.c".
>
> Signed-off-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
> ---
>  drivers/of/Makefile |   6 ++
>  drivers/of/kexec.c  | 258 ++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/of.h  |  13 +++
>  3 files changed, 277 insertions(+)
>  create mode 100644 drivers/of/kexec.c
>
> diff --git a/drivers/of/Makefile b/drivers/of/Makefile
> index 6e1e5212f058..c13b982084a3 100644
> --- a/drivers/of/Makefile
> +++ b/drivers/of/Makefile
> @@ -14,4 +14,10 @@ obj-$(CONFIG_OF_RESOLVE)  += resolver.o
>  obj-$(CONFIG_OF_OVERLAY) += overlay.o
>  obj-$(CONFIG_OF_NUMA) += of_numa.o
>  
> +ifdef CONFIG_KEXEC_FILE
> +ifdef CONFIG_OF_FLATTREE
> +obj-y	+= kexec.o
> +endif
> +endif
> +
>  obj-$(CONFIG_OF_UNITTEST) += unittest-data/
> diff --git a/drivers/of/kexec.c b/drivers/of/kexec.c
> new file mode 100644
> index 000000000000..469e09613cdd
> --- /dev/null
> +++ b/drivers/of/kexec.c
> @@ -0,0 +1,258 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2020 Arm Limited
> + *
> + * Based on arch/arm64/kernel/machine_kexec_file.c:
> + *  Copyright (C) 2018 Linaro Limited
> + *
> + * And arch/powerpc/kexec/file_load.c:
> + *  Copyright (C) 2016  IBM Corporation
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/kexec.h>
> +#include <linux/libfdt.h>
> +#include <linux/of.h>
> +#include <linux/of_fdt.h>
> +#include <linux/random.h>
> +#include <linux/types.h>
> +
> +/* relevant device tree properties */
> +#define FDT_PROP_KEXEC_ELFHDR	"linux,elfcorehdr"
> +#define FDT_PROP_MEM_RANGE	"linux,usable-memory-range"
> +#define FDT_PROP_INITRD_START	"linux,initrd-start"
> +#define FDT_PROP_INITRD_END	"linux,initrd-end"
> +#define FDT_PROP_BOOTARGS	"bootargs"
> +#define FDT_PROP_KASLR_SEED	"kaslr-seed"
> +#define FDT_PROP_RNG_SEED	"rng-seed"
> +#define RNG_SEED_SIZE		128
> +
> +/**
> + * fdt_find_and_del_mem_rsv - delete memory reservation with given address and size
> + *
> + * @fdt:	Flattened device tree for the current kernel.
> + * @start:	Starting address of the reserved memory.
> + * @size:	Size of the reserved memory.
> + *
> + * Return: 0 on success, or negative errno on error.
> + */
> +static int fdt_find_and_del_mem_rsv(void *fdt, unsigned long start, unsigned long size)
> +{
> +	int i, ret, num_rsvs = fdt_num_mem_rsv(fdt);
> +
> +	for (i = 0; i < num_rsvs; i++) {
> +		u64 rsv_start, rsv_size;
> +
> +		ret = fdt_get_mem_rsv(fdt, i, &rsv_start, &rsv_size);
> +		if (ret) {
> +			pr_err("Malformed device tree.\n");
> +			return -EINVAL;
> +		}
> +
> +		if (rsv_start == start && rsv_size == size) {
> +			ret = fdt_del_mem_rsv(fdt, i);
> +			if (ret) {
> +				pr_err("Error deleting device tree reservation.\n");
> +				return -EINVAL;
> +			}
> +
> +			return 0;
> +		}
> +	}
> +
> +	return -ENOENT;
> +}
> +
> +/*
> + * of_kexec_alloc_and_setup_fdt - Alloc and setup a new Flattened Device Tree
> + *
> + * @image:		kexec image being loaded.
> + * @initrd_load_addr:	Address where the next initrd will be loaded.
> + * @initrd_len:		Size of the next initrd, or 0 if there will be none.
> + * @cmdline:		Command line for the next kernel, or NULL if there will
> + *			be none.
> + *
> + * Return: fdt on success, or NULL errno on error.
> + */
> +void *of_kexec_alloc_and_setup_fdt(const struct kimage *image,
> +				   unsigned long initrd_load_addr,
> +				   unsigned long initrd_len,
> +				   const char *cmdline)
> +{
> +	void *fdt;
> +	int ret, chosen_node;
> +	const void *prop;
> +	unsigned long fdt_size;
> +
> +	fdt_size = fdt_totalsize(initial_boot_params) +
> +		   (cmdline ? strlen(cmdline) : 0) +
> +		   FDT_EXTRA_SPACE;

Just adding 4 KB to initial_boot_params won't be enough for crash
kernels on ppc64. The current powerpc code doubles the size of
initial_boot_params (which is normally larger than 4 KB) and even that
isn't enough. A patch was added to powerpc/next today which uses a more
precise (but arch-specific) formula:

https://lore.kernel.org/linuxppc-dev/161243826811.119001.14083048209224609814.stgit@hbathini/

So I believe we need a hook here where architectures can provide their
own specific calculation for the size of the fdt. Perhaps a weakly
defined function providing a default implementation which an
arch-specific file can override (a la arch_kexec_kernel_image_load())?

Then the powerpc specific hook would be the kexec_fdt_totalsize_ppc64()
function from the patch I linked above.

-- 
Thiago Jung Bauermann
IBM Linux Technology Center
